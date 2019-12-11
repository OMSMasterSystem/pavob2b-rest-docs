# Website Configuration & Settings

The website configuration endpoint allows you to retreive products from OMS, allowing you to construct product list pages, product detail pages, or query products from OMS.

## Settings properties

### Settings object

| Attribute         | Type           | Description                                                                                                          |
| ----------------- | -------------- | -------------------------------------------------------------------------------------------------------------------- |
| `demo_mode`       | string         | Whether this website is used for demo purposes.                                                                      |
| `product_detail`  | integer        | An enum detailing how the product detail page should be configured.                                                  |
| `product_list`    | integer        | An enum detailing how the product list page should be configured.                                                    |
| `company_name`    | string         | The company's name.                                                                                                  |
| `main_address`    | Address object | The address of the company. See `Address object` for details.                                                        |
| `image_file_path` | string         | The base filepath where the images for each product will be.                                                         |
| `created_at`      | date-time      | The date and time this company was created on the server. <i class="label label-info">read-only</i>                  |
| `updated_at`      | date-time      | The date and time this company's settings were last updated on the server. <i class="label label-info">read-only</i> |

### Address object properties

| Attribute        | Type   | Description                                                                   |
| ---------------- | ------ | ----------------------------------------------------------------------------- |
| `address_line_1` | string | Address Line 1. Typically a street name with house number.                    |
| `address_line_2` | string | Address Line 2. Typically an apartment, suite, or any additional information. |
| `city`           | string | City or Municipality.                                                         |
| `state`          | string | State or Province.                                                            |
| `zip`            | string | Postal Code.                                                                  |
| `country`        | string | Country or Region.                                                            |
| `phone`          | string | The phone number of the company.                                              |

## Fetch settings

This endpoint lets you fetch the settings from the server.

<aside class="warning">
A user must be logged in to perform this call.
</aside>

### HTTP request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/website_configuration</h6>
    </div>
</div>

```shell
curl https://example.com/api/website_configuration
```

```javascript
PavoB2B.get("website_configuration")
    .then((response) => {
        console.log(response.data);
    })
    .catch((error) => {
        console.error(error);
    });
```

>JSON response example:

```json
