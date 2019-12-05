# Authentication

All API endpoints are available without any authentication. Some information, such as pricing or orders, will require a user to be logged in in order to retrieve the appropriate data.

<aside class="notice">
Before performing any REST calls, your server must be configured to communicate with OMS. Please contact us beforehand if you are not sure if your server has already been configured.
</aside>

When a user logs in, a cookie will be returned from the server to the front-end client. This cookie is expected to be passed back and forth during request/response calls in order for the server to retrieve specific attributes on inventory, such as pricing. In addition, the cookie is required in order to create and read orders placed on behalf of that particular user.

## User properties

### User object

| Attribute         | Type            | Description                                                                                                   |
| ----------------- | --------------- | ------------------------------------------------------------------------------------------------------------- |
| `username`        | string          | Username or email address of user trying to login.                                                            |
| `login_type`      | string          | The type of user that logged in. Possible values are `enterprise`, `super_user`, `sales_rep`, and `customer`. |
| `enterprise_user` | boolean         | If the user logging in is a customer or an enterprise (i.e. OMS system) user.                                 |
| `customer`        | Customer object | If `login_type` is `customer`, the response object will return a Customer object with more information.       |

### Customer object

| Attribute | Type   | Description                                                |
| --------- | ------ | ---------------------------------------------------------- |
| `id`      | string | The Customer ID of this customer in the OMS Customer File. |
| `name`    | string | The name of the customer in the OMS Customer File.         |

## Logging in

This endpoint will check the username and password and return a log in object if successful. It will log in both a customer and an enterprise user.

<aside class="notice">
If the login fails due to an incorrect username or password, the server will return Error Code 401 Unauthorized and an empty response body.
</aside>

When logging in as an enterprise user, the enterprise user will have differing levels of access. The three levels are: `super_user`, `sales_rep`, and `enterprise`.

1. `enterprise` users have the most restricted access to OMS
2. `sales_rep` users can access everything an `enterprise` user can access, and additional features
3. `super_user` users can access everything a `sales_rep` can access, and additional features

### HTTP Request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">POST</i>
        <h6>/api/login</h6>
    </div>
</div>

### Login request object

| Attribute         | Type    | Description                                                                                       |
| ----------------- | ------- | ------------------------------------------------------------------------------------------------- |
| `username`        | string  | Username or email address of user trying to login.                                                |
| `password`        | string  | Password of user trying to login.                                                                 |
| `enterprise_user` | boolean | If the user logging in is a customer or an enterprise (i.e. OMS system) user. Default is `false`. |

```shell

For a customer login:

curl -X POST https://example.com/api/login \
    -d '{
        "username": "rusty@shackleford.com",
        "password": "rustyshackleford"
    }'

For enterprise login:

curl -X POST https://example.com/api/login \
    -d '{
        "username": "oms",
        "password": "oms"
    }'
```

>JSON response example for customer login:

```json
{
  "username": "rusty@shackleford.com",
  "login_type": "customer",
  "customer": {
    "id": "0000000314",
    "name": "RUSTY CORP."
  }
}
```

>JSON response example for enterprise login:

```json
{
  "username": "oms",
  "login_type": "super_user"
}
```

## Logging out

This endpoint will log the current user out based on the cookie provided. The logout will redirect the user to the homepage (`/`).

<aside class="notice">
A user must be logged in to perform this call.
</aside>

### HTTP Request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/logout</h6>
    </div>
</div>

```shell
curl https://example.com/api/logout
```

## Retrieve current user

This endpoint will return the current user information with the cookie provided. If no user is found, it will return an empty response body.

<aside class="notice">
A user must be logged in to perform this call.
</aside>

### HTTP Request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/current_user</h6>
    </div>
</div>

```shell
curl https://example.com/api/current_user
```

>JSON response example for customer login:

```json
{
  "username": "rusty@shackleford.com",
  "login_type": "customer",
  "customer": {
    "id": "0000000314",
    "name": "RUSTY CORP."
  }
}
```

>JSON response example for enterprise login:

```json
{
  "username": "oms",
  "login_type": "super_user"
}
```

## Retrieve customer detail

This endpoint will return the customer's detail from the OMS Customer File. A customer must be logged in. If an enterprise user is logged in or no user is logged in, it will return an empty response body.

<aside class="notice">
A user must be logged in to perform this call.
</aside>

### HTTP Request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/current_customer_detail</h6>
    </div>
</div>

### Customer response object

| Attribute          | Type           | Description                                                                                         |
| ------------------ | -------------- | --------------------------------------------------------------------------------------------------- |
| `customer_id`      | string         | Customer ID from the OMS Customer File.                                                             |
| `customer_name`    | string         | The name of the customer from the OMS Customer File.                                                |
| `customer_status`  | string         | The status of the customer from the OMS Customer File. Possible values are `Active` and `Inactive`. |
| `phone1`           | string         | The first phone number listed in the OMS Customer File.                                             |
| `phone2`           | string         | The second phone number listed in the OMS Customer File.                                            |
| `phone3`           | string         | The third phone number listed in the OMS Customer File.                                             |
| `fax`              | string         | The fax number listed in the OMS Customer File.                                                     |
| `email`            | string         | The email address associated with this OMS Customer.                                                |
| `customer_since`   | string         | The date this customer was added to the OMS Customer File. It is in the format `MM/DD/YYYY`.        |
| `billing_address`  | Address object | The billing address listed in the OMS Customer File.                                                |
| `shipping_address` | Address object | The shipping address listed in the OMS Customer File.                                               |

### Address object

| Attribute  | Type   | Description                                                                   |
| ---------- | ------ | ----------------------------------------------------------------------------- |
| `address`  | string | Address Line 1. Typically a street name with house number.                    |
| `address2` | string | Address Line 2. Typically an apartment, suite, or any additional information. |
| `city`     | string | City or Municipality.                                                         |
| `state`    | string | State or Province.                                                            |
| `zip`      | string | Postal Code.                                                                  |
| `country`  | string | Country, as described in OMS.                                                 |

```shell
curl https://example.com/api/current_customer_detail
```

>JSON response example:

```json

{
  "customer_id": "0000000314",
  "customer_name": "RUSTY CORP.",
  "customer_status": "Active",
  "phone1": "6268210882",
  "phone2": "6268210883",
  "phone3": "6268210884",
  "fax": "6268219417",
  "email": "rusty@shackleford.com",
  "customer_since": "12/4/2019",
  "billing_address": {
    "address": "117 E DUARTE RD",
    "address2": "",
    "city": "ARCADIA",
    "state": "CA",
    "zip": "91006",
    "country": "UNITED STATES"
  },
  "shipping_address": {
    "address": "735 W DUARTE RD",
    "address2": "SUITE 407",
    "city": "ARCADIA",
    "state": "CA",
    "zip": "91006",
    "country": "UNITED STATES"
  }
}
```
