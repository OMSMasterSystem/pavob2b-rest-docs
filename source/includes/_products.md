# Products

The products endpoint allows you to retreive products from OMS, allowing you to construct product list pages, product detail pages, or query products from OMS.

## Product Properties

### Product object

| Attribute         | Type                   | Description                                                                                                                                                                                                                                                      |
| ----------------- | ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `item_num`        | string                 | OMS Item Number.                                                                                                                                                                                                                                                 |
| `sku`             | string                 | OMS Item SKU. In some systems, it will match the OMS Item Number. For systems that have color and size/run, it follows the convention: `<item_num>-<color>-<run>`. For X-runs, the convention is `<item_num>-<color>-X-<size>`.                                  |
| `description1`    | string                 | Description line 1.                                                                                                                                                                                                                                              |
| `description2`    | string                 | Description line 2.                                                                                                                                                                                                                                              |
| `description3`    | string                 | Description line 3.                                                                                                                                                                                                                                              |
| `class_code`      | string                 | Class code.                                                                                                                                                                                                                                                      |
| `division`        | string                 | Division.                                                                                                                                                                                                                                                        |
| `department`      | string                 | Department.                                                                                                                                                                                                                                                      |
| `oem_code`        | string                 | OEM code.                                                                                                                                                                                                                                                        |
| `alternate_code`  | string                 | Alternate code.                                                                                                                                                                                                                                                  |
| `color`           | string                 | Color code.                                                                                                                                                                                                                                                      |
| `color_desc`      | string                 | Color description, as listed in the OMS System Manager.                                                                                                                                                                                                          |
| `prepack_run`     | string                 | Prepack run of item (if applicable).                                                                                                                                                                                                                             |
| `size`            | string                 | Size of item (if applicable).                                                                                                                                                                                                                                    |
| `brand`           | string                 | Brand of item.                                                                                                                                                                                                                                                   |
| `year_produced`   | string                 | Year produced.                                                                                                                                                                                                                                                   |
| `manufacture`     | string                 | Manufacturer.                                                                                                                                                                                                                                                    |
| `model`           | string                 | Model.                                                                                                                                                                                                                                                           |
| `groupcode`       | string                 | Group code.                                                                                                                                                                                                                                                      |
| `subgroupcode`    | string                 | Subgroup code.                                                                                                                                                                                                                                                   |
| `price_by`        | string                 | The selected type of pricing method. Available options are `business_type` and `quantity_type`. This will affect what the `price` property will display. This will return `null` if there is no user associated with the request made to the endpoint.           |
| `prices`          | Array of Price objects | An array of Price objects as dictated by the `price_by` property. If `price_by` is set to `business_type`, then this array will only contain one element. This property will return `null` if there is no user associated with the request made to the endpoint. |
| `quantity`        | integer                | The total quantity available for this item. This will return `null` if there is no user associated with the request made to the endpoint.                                                                                                                        |
| `case_dimensions` | Dimensions object      | Case dimensions (e.g. weight, volume) and quantities per case and box.                                                                                                                                                                                           |
| `unit_dimensions` | Dimensions object      | Unit dimensions (e.g. weight, volume).                                                                                                                                                                                                                           |
| `images`          | array                  | An array of filepaths to images of this particular item. The filepath is relative to the base filepath string.                                                                                                                                                   |

### Price object

| Attribute      | Type   | Description                                                                                                                                                                                  |
| -------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `retail_price` | number | The retail, or list price of this item.                                                                                                                                                      |
| `price`        | number | The selling price of the item based on this customer.                                                                                                                                        |
| `minimum`      | number | The minimum quantity of the item. This is only filled in if the `price_by` property is set to `quantity_type` in the Product object.                                                         |
| `maximum`      | number | The maximum quantity of the item. If there is no limit, this property will be not be set. This is only filled in if the `price_by` property is set to `quantity_type` in the Product object. |

### Dimensions

All objects in the Dimension objects have a `unit` and a `value` property. `unit` is a string and `value` is a number. Refer to each property to see in detail.

| Attribute       | Type   | Description                                                                                                                                                           |
| --------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `volume`        | object | Volume of the case or unit. Available `unit` values are `INCH` to indicate cubic inches.                                                                              |
| `weight`        | object | Weight of the case or unit. Available `unit` values are `POUND`.                                                                                                      |
| `box_quantity`  | object | The number of unit items per box. Only available for `case_dimensions`. Available `unit` values are defined from the Unit Measurement List in the OMS System Manager. |
| `case_quantity` | object | The number of boxes per case. Available `unit` values are `CS`.                                                                                                       |

## List all products

This endpoint lets you retreive and view all products.

### HTTP Request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/products</h6>
    </div>
</div>

```shell
curl https://example.com/api/products
```

#### Available Filters

| Filter   | Type    | Description                                                           |
| -------- | ------- | --------------------------------------------------------------------- |
| `limit`  | integer | Maximum number of items to return. Default is `500`.                  |
| `offset` | integer | The index on where in the list of products to return. Default is `0`. |

>JSON response example:

```json
{
  "products": [
    {
      "item_num": "00-010-078",
      "sku": "00-010-078",
      "description1": "OMS Casual Leather Handbag cell",
      "description2": "Interior zipper pocket and two slip pocketswwww",
      "description3": "Roomy main compartmentssss",
      "brand": "DISNEY Park",
      "class_code": "ZZZA",
      "color": "RED",
      "color_description": "",
      "division": "DD112",
      "department": "11",
      "oem_code": "YAOME1234567890_1820",
      "alternate_code": "APPLE",
      "year_produced": "2015",
      "manufacturer": "TOYOTA",
      "model": "CAMRY",
      "group_code": "GP1",
      "size": "A17",
      "price_by": "business_type",
      "prices": [
        {
          "retail_price": 100,
          "price": 98.23
        }
      ],
      "quantity": 13451,
      "case_dimensions": {
        "volume": {
          "unit": "INCH",
          "value": 1.9444
        },
        "weight": {
          "unit": "POUND",
          "value": 3
        },
        "box_quantity": {
          "unit": "CS",
          "value": 5
        },
        "case_quantity": {
          "unit": "2",
          "value": 150
        }
      },
      "unit_dimensions": {
        "volume": {
          "unit": "INCH",
          "value": 0.9931
        },
        "weight": {
          "unit": "POUND",
          "value": 2
        }
      },
      "images": []
    },
    {
      "item_num": "00-010-079",
      "sku": "00-010-079",
      "description1": "OMS Halloween Decor Pumpkin Cookies",
      "description2": "YUFENG Green Latex Pumpkin Head Masks of Cosplay",
      "description3": "Halloween Masquerade Party Creepy Scary Terrorist Mask",
      "brand": "",
      "class_code": "SALE",
      "color": "PINK",
      "color_description": "",
      "division": "",
      "department": "KID",
      "oem_code": "",
      "alternate_code": "",
      "year_produced": "2015",
      "manufacturer": "",
      "model": "",
      "group_code": "",
      "size": "M",
      "price_by": "business_type",
      "prices": [
        {
          "retail_price": 89.57,
          "price": 66
        }
      ],
      "quantity": 9364,
      "case_dimensions": {
        "volume": {
          "unit": "INCH",
          "value": 10
        },
        "weight": {
          "unit": "POUND",
          "value": 12
        },
        "box_quantity": {
          "unit": "PC",
          "value": 100
        },
        "case_quantity": {
          "unit": "PC",
          "value": 200
        }
      },
      "unit_dimensions": {
        "volume": {
          "unit": "INCH",
          "value": 1
        },
        "weight": {
          "unit": "POUND",
          "value": 0.5
        }
      },
      "images": []
    }
    // Truncated for clarity
    ...
  ],
  "offset": 0,
  "limit": 500,
  "total": 11681
}
```

## Get a product's images

This endpoint lets you fetch images for a particular OMS item.

### HTTP Request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/products/images/&lt;oms_item_num&gt;</h6>
    </div>
</div>

```shell
curl https://example.com/api/product/images/00-010-078
```

#### Available Filters

| Filter        | Type   | Description                                    |
| ------------- | ------ | ---------------------------------------------- |
| `color`       | string | The color of the product.                      |
| `prepack_run` | string | The prepack run of the product, if applicable. |
| `size`        | string | The size of the product, if applicable.        |

>JSON response example:

```json
[
  "/images/00-010-078--1.jpg",
  "/images/00-010-078--2.jpg",
  "/images/00-010-078--3.jpg"
]
```

## Get available filters

This endpoint lets you determine what filters are available when filtering through a list of products.

### HTTP Request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/products/filters</h6>
    </div>
</div>

```shell
curl https://example.com/api/products/filters
```

#### Available Filters

| Filter     | Type    | Description                                                                                               |
| ---------- | ------- | --------------------------------------------------------------------------------------------------------- |
| `load_all` | boolean | If `load_all` is `false`, then only return the first 10 results of a filter category. Default is `false`. |

>JSON response example:

```json
[ 
  {
    "filter_name": "KIDS",
    "enabled": true,
    "value_list": [
      {
        "name": "#000000",
        "count": "2"
      },
      {
        "name": "#002",
        "count": "2"
      },
      {
        "name": "#008000",
        "count": "4"
      },
      {
        "name": "#15317E",
        "count": "2"
      },
      {
        "name": "0",
        "count": "1"
      },
      {
        "name": "10.56",
        "count": "1"
      },
      {
        "name": "12-Aug",
        "count": "4"
      },
      {
        "name": "120",
        "count": "5"
      },
      {
        "name": "123",
        "count": "7"
      },
      {
        "name": "1234567890",
        "count": "28"
      }
    ]
  },
  {
    "filter_name": "Price",
    "enabled": true,
    "value_list": [
      {
        "name": "Under $10.00",
        "count": "1874",
        "price_from": "0",
        "price_to": "10"
      },
      {
        "name": "$10.00 to $25.00",
        "count": "1345",
        "price_from": "10",
        "price_to": "25"
      },
      {
        "name": "$25.00 to $50.00",
        "count": "214",
        "price_from": "25",
        "price_to": "50"
      },
      {
        "name": "$50.00 to $100.00",
        "count": "222",
        "price_from": "50",
        "price_to": "100"
      },
      {
        "name": "$100.00 & Above",
        "count": "134",
        "price_from": "100",
        "price_to": "-1"
      }
    ]
  }
]
