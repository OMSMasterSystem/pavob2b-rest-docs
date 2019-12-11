# Shopping Cart

The shopping cart endpoint lets you update and retrieve a shopping cart.

## Shopping Cart properties

| Filter             | Type                          | Description                                                                                                                                      |
| ------------------ | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `username`         | string                        | The username or email address associated with this shopping cart. <i class="label label-info">read-only</i>                                                                                 |
| `customer_id`      | string                        | The OMS Customer ID associated with this shopping cart. <i class="label label-info">read-only</i>                                                                                           |
| `email`            | string                        | Email address associated with the shopping cart. <i class="label label-info">read-only</i>                                                                                                  |
| `phone`            | string                        | Phone number associated with the shopping cart. <i class="label label-info">read-only</i>                                                                                                   |
| `payment_type`     | string                        | The default payment type for this order based on the OMS Customer ID. <i class="label label-info">read-only</i>                                                                             |
| `taxable`          | boolean                       | Whether the customer should be taxed when the shopping cart becomes an order. <i class="label label-info">read-only</i>                                                                     |
| `shipping_method`  | string                        | The default shipping method associated with the OMS Customer. <i class="label label-info">read-only</i>                                                                                     |
| `line_items`       | Shopping Cart Line Item array | An array of line items associated with the shopping cart. See `Shopping Cart Line Item properties`.                                              |
| `updated_at`       | date-time                     | The date/time the shopping cart was last updated, written in Coordinated Universal Time (UTC). <i class="label label-info">read-only</i>                                                    |
| `cached`           | boolean                       | Whether the line items of the shopping cart is a cached version, meaning the available quantity and prices were not updated from the OMS server. |

### Shopping Cart Line Item properties

| Filter               | Type      | Description                                                                                                                                                                                                                     |
| -------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `line_item_id`       | integer   | Line item ID. <i class="label label-info">read-only</i>                                                                                                                                                                                                                    |
| `description1`       | string    | Name of the product. <i class="label label-info">read-only</i>                                                                                                                                                                                                             |
| `oms_item_num`       | string    | OMS Item Number.                                                                                                                                                                                                                |
| `image`              | string    | A filepath to an image for this particular item. The filepath is relative to the base filepath string. <i class="label label-info">read-only</i>                                                                                |
| `sku`                | string    | OMS Item SKU. In some systems, it will match the OMS Item Number. For systems that have color and size/run, it follows the convention: `<item_num>-<color>-<run>`. For X-runs, the convention is `<item_num>-<color>-X-<size>`. |
| `order_quantity`           | integer   | The total quantity of this item added to the shopping cart.                                                                                                                                                                     |
| `unit_price`         | number    | The price per unit of the item in the shopping cart. This will be the selling price if the user completes the purchase.                                                                                                         |
| `retail_price`       | number    | The original price per unit of the item in the shopping cart.                                                                                                                                                                   |
| `taxable`            | boolean   | Whether the item is subject to taxes.                                                                                                                                                                                           |
| `item_price_changed` | boolean   | Whether the item price was changed manually. If set to `false` or `null`, the unit price should match OMS price.                                                                                                                |
| `oms_warehouse_num`  | string    | The OMS Warehouse Number the item is associated with when placing an order.                                                                                                                                                     |
| `stock_quantity`          | integer   | The available quantity of an item based on OMS. `order_quantity` should be less than or equal to `stock_quantity`.                                                                                                                         |
| `updated_at`         | date-time | The last time this line item was updated, written in Universal Coordinated Time (UTC).                                                                                                                                          |

## Get shopping cart

This endpoint lets you retrieve a shopping cart based on the user that is logged in. This includes the line items and the customer associated with the shopping cart.

<aside class="warning">
A user must be logged in to perform this call.
</aside>

### HTTP request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/shopping_cart</h6>
    </div>
</div>

```shell
curl https://example.com/api/shopping_cart
```

```javascript
PavoB2B.get("shopping_cart")
    .then((response) => {
        console.log(response.data);
    })
    .catch((error) => {
        console.error(error);
    });
```

### Available Filters

| Filter   | Type    | Description                                                                                                                                        |
| -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| `cached` | boolean | If `false`, the server will fetch from OMS the latest information such as pricing, quantity stock, and other item information. Default to `false`. |

>JSON response example:

```json
{
  "username": "abc@abc.com",
  "customer_id": "0000000020",
  "payment_type": null,
  "taxable": false,
  "shipping_method": null,
  "email": null,
  "phone": null,
  "line_items": [
    {
      "line_item_id": 0,
      "product_name": "OMS Casual Leather Handbag cell",
      "oms_item_num": "00-010-078",
      "image": "/images/00-010-078--1.jpg",
      "sku": "00-010-078",
      "quantity": 3,
      "unit_price": 98.23,
      "retail_price": 100,
      "taxable": false,
      "item_price_changed": false,
      "oms_warehouse_num": null,
      "stock_qty": 13449,
      "updated_at": "2019-12-06T21:59:13.446Z"
    }
  ],
  "updated_at": "2019-12-06T21:59:13.106Z",
  "cached": false
}
```

## Update shopping cart

This endpoint updates the shopping cart with new or updated items.

<aside class="warning">
A user must be logged in to perform this call.
</aside>

<aside class="notice">
Calls to this endpoint will override any items that already exist in the cart. It is recommended to keep a line item array in memory to modify before calling this endpoint.
</aside>

### HTTP request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">POST</i>
        <h6>/api/shopping_cart</h6>
    </div>
</div>

```shell
curl -X POST https://example.com/api/shopping_cart
    -d '{
        "username": "abc@abc.com",
        "customer_id": "0000000020",
        "payment_type": null,
        "taxable": false,
        "shipping_method": null,
        "email": null,
        "phone": null,
        "line_items": [{
            "oms_item_num": "MMDS",
            "sku": "MMDS-BLK-12A",
            "product_name": "Mickey Mouse Slippers",
            "quantity": 2,
            "unit_price": 15.00,
            "retail_price": 30.00,
            "stock_qty": 3000
        }]
    }'
```

```javascript
PavoB2B.post("shopping_cart", {
        "username": "abc@abc.com",
        "customer_id": "0000000020",
        "payment_type": null,
        "taxable": false,
        "shipping_method": null,
        "email": null,
        "phone": null,
        "line_items": [{
            "oms_item_num": "MMDS",
            "sku": "MMDS-BLK-12A",
            "product_name": "Mickey Mouse Slippers",
            "quantity": 2,
            "unit_price": 15.00,
            "retail_price": 30.00,
            "stock_qty": 3000
        }]
    })
    .then((response) => {
        console.log(response);
    })
    .catch((error) => {
        console.error(error);
    });
```

>JSON response example:

```json
{
    "username": "abc@abc.com",
    "customer_id": "0000000020",
    "payment_type": null,
    "taxable": false,
    "shipping_method": null,
    "email": null,
    "phone": null,
    "line_items": [{
        "oms_item_num": "MMDS",
        "sku": "MMDS-BLK-12A",
        "product_name": "Mickey Mouse Slippers",
        "quantity": 2,
        "unit_price": 15.00,
        "retail_price": 30.00,
        "stock_qty": 3000
    }]
}
```
