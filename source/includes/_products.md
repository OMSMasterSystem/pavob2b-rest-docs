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
| `price`           | Array of Price objects | An array of Price objects as dictated by the `price_by` property. If `price_by` is set to `business_type`, then this array will only contain one element. This property will return `null` if there is no user associated with the request made to the endpoint. |
| `quantity`        | integer                | The total quantity available for this item.                                                                                                                                                                                                                      |
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

| Filter       | Type   | Description                                                                                                                                                           |
| --------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
