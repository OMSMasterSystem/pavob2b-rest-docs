# Orders

The orders endpoint lets you place orders and fetch order history.

## Create an order

This endpoint lets you create an order based off of the Shopping Cart.

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
```

### Request object properties

| Attribute         | Type           | Description                                                                                                                                |
| ----------------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `email`           | string         | Email address of the customer placing the order. If not set, OMS will use the default email set in the Customer File.                      |
| `bill_to_address` | Address object | The billing address of the customer. If not set, OMS will use the default billing address set in the Customer File.                        |
| `ship_to_address` | Address object | The shipping address of the customer. If not set, OMS will use the default shipping address set in the Customer File.                      |
| `shipping_method` | string         | The shipping method of the order. This can optionally match with a Ship-Via method on the OMS System Manager.                              |
| `source`          | string         | The source where the order was placed to be filled in the Source field in the OMS Sales Order. If not set, will use `Pavo B2B` by default. |

### Address object properties

| Attribute   | Type   | Description                                                                   |
| ----------- | ------ | ----------------------------------------------------------------------------- |
| `full_name` | string | The name of the customer, whether it is a person or company name.             |
| `address`   | string | Address Line 1. Typically a street name with house number.                    |
| `address2`  | string | Address Line 2. Typically an apartment, suite, or any additional information. |
| `city`      | string | City or Municipality.                                                         |
| `state`     | string | State or Province.                                                            |
| `zip`       | string | Postal Code.                                                                  |
| `country`   | string | Country or Region.                                                            |

>JSON response example:

```json

```

## List all orders

This endpoint lets you fetch all orders associated with the user logged in.

<aside class="notice">
A user must be logged in to perform this call.
</aside>

### HTTP request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/orders</h6>
    </div>
</div>

### Available Filters

| Filter   | Type    | Description                                                           |
| -------- | ------- | --------------------------------------------------------------------- |
| `limit`  | integer | Maximum number of items to return. Default is `500`.                  |
| `offset` | integer | The index on where in the list of products to return. Default is `0`. |

```shell
curl https://example.com/api/orders
```

>JSON response example:

```json

```
