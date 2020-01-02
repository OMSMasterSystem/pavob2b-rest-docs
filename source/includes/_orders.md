# Orders

The orders endpoint lets you place orders and fetch order history.

## Order properties

| Attribute              | Type                   | Description                                                                                                                                                          |
| ---------------------- | ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `order_num`            | string                 | OMS Order Number. <i class="label label-info">read-only</i>                                                                                                          |
| `order_date`           | date-time              | Date/time the order was placed. <i class="label label-info">read-only</i>                                                                                            |
| `ship_date`            | date-time              | Date/time the order was shipped. <i class="label label-info">read-only</i>                                                                                           |
| `delivery_date`        | date-time              | Date/time the order was delivered. <i class="label label-info">read-only</i>                                                                                         |
| `email`                | string                 | Email address assigned to the order. Order statuses should be sent to this email address.                                                                            |
| `email_sent`           | boolean                | Whether an email was successfully sent to the email address listed in the `email` property. This property is only present in the response object of creating orders. |
| `subtotal`             | number                 | The subtotal for this order before any discounts, taxes, or shipping/handling charges. <i class="label label-info">read-only</i>                                     |
| `total`                | number                 | The total price for this order. <i class="label label-info">read-only</i>                                                                                            |
| `after_discount_total` | number                 | The total price for this order after discounts are applied, but before taxes and shipping/handling charges are applied. <i class="label label-info">read-only</i>    |
| `discount_rate`        | number                 | The discount rate of the order, supplied as a number between `0` and `100`. <i class="label label-info">read-only</i>                                                |
| `discount_amount`      | number                 | The total amount of discounts applied to the order, supplied as a positive number. <i class="label label-info">read-only</i>                                         |
| `taxable_amount`       | number                 | The total price of taxable items before any discounts and shipping/handling charges are applied. <i class="label label-info">read-only</i>                           |
| `non_taxable_amount`   | number                 | The total price of nontaxable items before any discounts and shipping/handling charges are applied. <i class="label label-info">read-only</i>                        |
| `tax_rate`             | number                 | The tax rate of the order, supplied as a number between `0` and `100`. <i class="label label-info">read-only</i>                                                     |
| `shipping_total`       | number                 | The total shipping price of the order. <i class="label label-info">read-only</i>                                                                                     |
| `handling_total`       | number                 | The total handling price of the order. <i class="label label-info">read-only</i>                                                                                     |
| `billing_address`      | Address object         | The billing address of the order.                                                                                                                                    |
| `shipping_address`     | Address object         | The shipping address of the order.                                                                                                                                   |
| `shipping_method`      | Shipping Method object | The shipping method of the order, including tracking and details of the fulfillment. See `Shipping Method properties`.                                               |
| `source`               | string                 | The source where the order was placed to be filled in the Source field in the OMS Sales Order. If not set, will use `Pavo B2B` by default.                           |
| `line_items`           | Order Line Item array  | An array of line items associated with the shopping cart. See `Order Line Item properties`. <i class="label label-info">read-only</i>                                |
| `status`               | string                 | The status of the order, could be `OPEN`, `SHIPPED`, `CANCELLED`, `BO` (Back Order). <i class="label label-info">read-only</i>                                       |

### Order Line Item properties

| Attribute              | Type      | Description                                                                                                                                                                                                                                                               |
| ---------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `line_item_id`         | integer   | Line item ID. <i class="label label-info">read-only</i>                                                                                                                                                                                                                   |
| `item_num`             | string    | OMS Item Number. <i class="label label-info">read-only</i>                                                                                                                                                                                                                |
| `upc`                  | string    | Item UPC. <i class="label label-info">read-only</i>                                                                                                                                                                                                                       |
| `sku`                  | string    | OMS Item SKU. In some systems, it will match the OMS Item Number. For systems that have color and size/run, it follows the convention: `<item_num>-<color>-<run>`. For X-runs, the convention is `<item_num>-<color>-X-<size>`. <i class="label label-info">read-only</i> |
| `description`          | string    | OMS Description Line 1 of the item. <i class="label label-info">read-only</i>                                                                                                                                                                                             |
| `color`                | string    | Item color (if applicable). <i class="label label-info">read-only</i>                                                                                                                                                                                                     |
| `size`                 | string    | Item size (if applicable). <i class="label label-info">read-only</i>                                                                                                                                                                                                      |
| `component_item`       | boolean   | Item is a component item, meaning it is part of a bundle. <i class="label label-info">read-only</i>                                                                                                                                                                       |
| `taxable`              | boolean   | Item is taxable. <i class="label label-info">read-only</i>                                                                                                                                                                                                                |
| `order_quantity`       | integer   | Order quantity of this line item. <i class="label label-info">read-only</i>                                                                                                                                                                                               |
| `shipped_quantity`     | integer   | Shipped quantity of this line item. <i class="label label-info">read-only</i>                                                                                                                                                                                             |
| `cancelled_quantity`   | integer   | Cancelled quantity of this line item. <i class="label label-info">read-only</i>                                                                                                                                                                                           |
| `ship_date`            | date-time | The date/time this item shipped. <i class="label label-info">read-only</i>                                                                                                                                                                                                |
| `item_note`            | string    | Any additional notes attached to this item. <i class="label label-info">read-only</i>                                                                                                                                                                                     |
| `price`                | number    | The price of this item, minus any discounts or taxes applied. <i class="label label-info">read-only</i>                                                                                                                                                                   |
| `after_discount_price` | number    | The price of this item after discounts are applied. <i class="label label-info">read-only</i>                                                                                                                                                                             |
| `discount_rate`        | number    | The discount rate of the order, supplied as a number between `0` and `100`. <i class="label label-info">read-only</i>                                                                                                                                                     |
| `taxable_amount`       | number    | The taxable amount for this line item. <i class="label label-info">read-only</i>                                                                                                                                                                                          |
| `non_taxable_amount`   | number    | The nontaxable amount for this line itme. <i class="label label-info">read-only</i>                                                                                                                                                                                       |
| `warehouse`            | string    | The OMS Warehouse Number associated with this line item. <i class="label label-info">read-only</i>                                                                                                                                                                        |
| `image`                | string    | A filepath to an image for this particular item. The filepath is relative to the base filepath string. <i class="label label-info">read-only</i>                                                                                                                          |

### Shipping Method properties

| Attribute                     | Type   | Description                                                                                                                  |
| ----------------------------- | ------ | ---------------------------------------------------------------------------------------------------------------------------- |
| `shipping_method`             | string | The name of the shipping method. This can optionally match with a Ship-Via method in the OMS System Manager.                 |
| `shipping_method_description` | string | Additional information on the shipping method, coming from the OMS System Manager. <i class="label label-info">read-only</i> |
| `carrier_code`                | string | Carrier code the fulfillment was made on. <i class="label label-info">read-only</i>                                          |

### Address object properties

| Attribute        | Type   | Description                                                                   |
| ---------------- | ------ | ----------------------------------------------------------------------------- |
| `full_name`      | string | The name of the customer, whether it is a person or company name.             |
| `address_line_1` | string | Address Line 1. Typically a street name with house number.                    |
| `address_line_2` | string | Address Line 2. Typically an apartment, suite, or any additional information. |
| `city`           | string | City or Municipality.                                                         |
| `state`          | string | State or Province.                                                            |
| `zip`            | string | Postal Code.                                                                  |
| `country`        | string | Country or Region.                                                            |

## Create an order

This endpoint lets you create an order based off of the Shopping Cart.

<aside class="warning">
A user must be logged in to perform this call.
</aside>

<aside class="notice">
Items must be added to the Shopping Cart first before placing an order. No items may be modified with the Orders endpoint when placing an order.
</aside>

### HTTP request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">POST</i>
        <h6>/api/orders</h6>
    </div>
</div>

```shell
curl -X POST https://example.com/api/orders
    -d '{
    "email": "asdf@asdf.com",
    "send_email": true,
    "source": "Pavo B2B",
    "billing_address": {
        "full_name": "Rusty",
        "address_line_1": "117 E. Duarte Rd",
        "city": "Arcadia",
        "state": "CA",
        "zip": "91006",
        "country": "United States"
    },
    "shipping_address": {
        "full_name": "Rusty",
        "address_line_1": "117 E. Duarte Rd",
        "city": "Arcadia",
        "state": "CA",
        "zip": "91006",
        "country": "United States"
    }'
```

```javascript
PavoB2B.post("orders", {
  "email": "asdf@asdf.com",
  "send_email": true,
  "source": "Pavo B2B",
  "billing_address": {
      "full_name": "Rusty",
      "address_line_1": "117 E. Duarte Rd",
      "city": "Arcadia",
      "state": "CA",
      "zip": "91006",
      "country": "United States"
  },
  "shipping_address": {
      "full_name": "Rusty",
      "address_line_1": "117 E. Duarte Rd",
      "city": "Arcadia",
      "state": "CA",
      "zip": "91006",
      "country": "United States"
  })
  .then((response) => {
    console.log(response.data);
  })
  .catch((error) => {
    console.error(error);
  });
```

### Request object properties

| Attribute          | Type                   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ------------------ | ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `email`            | string                 | Email address of the customer placing the order. If not set, OMS will use the default email set in the Customer File. A validation check will be performed on the `email` property.                                                                                                                                                                                                                                                                                                                                                                                                 |
| `send_email`       | boolean                | If `true`, will send an order confirmation email to the address listed in the `email` property, or to the default email address set in the OMS Customer File if the `email` property is not set. An email will only send under the following conditions: 1) The order is saved successfully in OMS and an OMS Order Number is generated; 2) If the `email` property is set, is a valid email address (i.e. contains "@"); and 3) If the `email` property is not set, the default email set for the customer in the OMS Customer File is a valid email address. Defaults to `false`. |
| `billing_address`  | Address object         | The billing address of the customer. If not set, OMS will use the default billing address set in the Customer File.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `shipping_address` | Address object         | The shipping address of the customer. If not set, OMS will use the default shipping address set in the Customer File.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `shipping_method`  | Shipping Method object | The shipping method of the order. This can optionally match with a Ship-Via method on the OMS System Manager.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `source`           | string                 | The source where the order was placed to be filled in the Source field in the OMS Sales Order. If not set, will use `Pavo B2B` by default.                                                                                                                                                                                                                                                                                                                                                                                                                                          |

>JSON response example:

```json
{
  "order_num": "35895",
  "order_date": "2019-12-09T20:18:23.000Z",
  "ship_date": "2019-12-09T08:00:00.000Z",
  "delivery_date": "0001-01-01T08:00:00.000Z",
  "email": "asdf@asdf.com",
  "email_sent": true,
  "subtotal": 196.46,
  "total": 196.46,
  "after_discount_total": 196.46,
  "discount_rate": 0,
  "discount_amount": 0,
  "taxable_amount": 0,
  "non_taxable_amount": 196.46,
  "tax_rate": 0,
  "shipping_total": 0,
  "handling_total": 0,
  "billing_address": {
    "full_name": "ABC CORP.",
    "address_line_1": "1234 NEW YORK RD",
    "address_line_2": "1234 NEW YORK RD",
    "city": "NEW YORK",
    "state": "NY",
    "zip": "10006",
    "country": "United States",
    "phone": "",
    "email": ""
  },
  "shipping_address": {
    "full_name": "Rusty",
    "address_line_1": "117 E. Duarte Rd",
    "address_line_2": "117 E. Duarte Rd",
    "city": "Arcadia",
    "state": "CA",
    "zip": "91006",
    "country": "United States",
    "phone": "",
    "email": ""
  },
  "shipping_method": {
      "shipping_method": ""
  },
  "line_items": [{
    "line_item_id": 0,
    "item_num": "00-010-078",
    "upc": "87456118625",
    "sku": "00-010-078",
    "description": "OMS Casual Leather Handbag cell",
    "color": "",
    "size": "",
    "component_item": false,
    "taxable": false,
    "order_quantity": 2,
    "shipped_quantity": null,
    "cancelled_quantity": 0,
    "ship_date": "2019-12-09T08:00:00.000Z",
    "item_note": "",
    "price": 98.23,
    "after_discount_price": 196.46,
    "discount_rate": 0,
    "taxable_amount": 0,
    "non_taxable_amount": 196.46,
    "warehouse": "01",
    "image": "/images/00-010-078--1.jpg"
  }]
}
```

## Order summary

This endpoint lets you fetch all orders associated with the user logged in. 

<aside class="warning">
A user must be logged in to perform this call.
</aside>

<aside class="notice">
For performance considerations, this endpoint will only list a subset of properties for an order. To retrieve more details about a particular order, call the `Retrieve an order` endpoint.
</aside>

### HTTP request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/orders_summary</h6>
    </div>
</div>

```shell
curl https://example.com/api/orders_summary
```

```javascript
PavoB2B.get("orders_summary")
  .then((response) => {
    console.log(response.data);
  })
  .catch((error) => {
    console.error(error);
  });
```

### Available Filters

| Filter   | Type    | Description                                                           |
| -------- | ------- | --------------------------------------------------------------------- |
| `limit`  | integer | Maximum number of items to return. Default is `500`.                  |
| `offset` | integer | The index on where in the list of products to return. Default is `0`. |

### Response object

| Filter   | Type                   | Description                                                                                                                                                                                                                                                                     |
| -------- | ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `orders` | Array of Order objects | An array of order objects, with a subset of properties returned.                                                                                                                                                                                                                |
| `limit`  | integer                | The most amount of Order objects returned per call to this endpoint.                                                                                                                                                                                                            |
| `offset` | integer                | The index with which the orders are at this point in the endpoint call. For example, an offset at `0` indicates this response begins at the first element of the Orders array, while an offset at `99` indicates this response begins at the 100th element of the Orders array. |
| `total`  | integer                | The total number of Order objects available overall.                                                                                                                                                                                                                            |

>JSON response example:

```json
{
  "orders": [{
    "order_num": "35983",
    "order_date": "2019-12-20T22:50:20.000Z",
    "ship_date": "2019-12-20T08:00:00.000Z",
    "status": "OPEN",
    "total": 97.03
  }, {
    "order_num": "35981",
    "order_date": "2019-12-20T19:35:04.000Z",
    "ship_date": "2019-12-20T08:00:00.000Z",
    "status": "OPEN",
    "total": 97.03
  }, {
    "order_num": "35979",
    "order_date": "2019-12-20T00:03:14.000Z",
    "ship_date": "2019-12-19T08:00:00.000Z",
    "status": "OPEN",
    "total": 97.03
  }, {
    "order_num": "35978",
    "order_date": "2019-12-20T00:02:03.000Z",
    "ship_date": "2019-12-19T08:00:00.000Z",
    "status": "OPEN",
    "total": 97.03
  },
  {
    // Truncated for clarity
    // ...
  }],
  "limit": 100,
  "offset": 0,
  "total": 158
}
```

## Retrieve an order

This endpoint lets you retrieve a specific order if the user has rights to access the order.

<aside class="warning">
A user must be logged in to perform this call.
</aside>

### HTTP request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/orders/&lt;order_num&gt;</h6>
    </div>
</div>

```shell
curl https://example.com/api/orders/1234
```

```javascript
PavoB2B.get("orders/1234")
  .then((response) => {
    console.log(response.data);
  })
  .catch((error) => {
    console.error(error);
  });

>JSON response example:

```json
{
  "order_num": "35888",
  "order_date": "2019-12-09T19:07:01.000Z",
  "ship_date": "2019-12-09T08:00:00.000Z",
  "delivery_date": "0001-01-01T08:00:00.000Z",
  "email": "asdf@asdf.com",
  "subtotal": 98.23,
  "total": 98.23,
  "after_discount_total": 98.23,
  "discount_rate": 0,
  "discount_amount": 0,
  "taxable_amount": 0,
  "non_taxable_amount": 98.23,
  "tax_rate": 0,
  "tax_total": 0,
  "shipping_total": 0,
  "handling_total": 0,
  "billing_address": {
    "full_name": "ABC CORP.",
    "address_line_1": "1234 NEW YORK RD",
    "address_line_2": "1234 NEW YORK RD",
    "city": "NEW YORK",
    "state": "NY",
    "zip": "10006",
    "country": "United States",
    "phone": "",
    "email": ""
  },
  "shipping_address": {
    "full_name": "Rusty",
    "address_line_1": "117 E. Duarte Rd",
    "address_line_2": "117 E. Duarte Rd",
    "city": "Arcadia",
    "state": "CA",
    "zip": "91006",
    "country": "United States",
    "phone": "",
    "email": ""
  },
  "shipping_method": {
    "shipping_method": "",
    "carrier_code": "",
    "carrier_name": "",
    "service_code": ""
  },
  "line_items": [
    {
      "line_item_id": 1,
      "item_num": "00-010-078",
      "upc": "87456118625",
      "sku": "00-010-078",
      "description": "OMS Casual Leather Handbag cell",
      "color": "",
      "size": "",
      "component_item": false,
      "taxable": false,
      "order_quantity": 1,
      "shipped_quantity": null,
      "cancelled_quantity": 0,
      "ship_date": "2019-12-09T08:00:00.000Z",
      "item_note": "",
      "price": 98.23,
      "after_discount_price": 98.23,
      "discount_rate": 0,
      "taxable_amount": 0,
      "non_taxable_amount": 98.23,
      "warehouse": "01",
      "image": "/images/00-010-078--1.jpg"
    }
  ]
}
```
