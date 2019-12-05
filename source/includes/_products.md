# Products

The products endpoint allows you to retreive products from OMS, allowing you to construct product list pages, product detail pages, or query products from OMS.

## Product Properties

### Product object

| Attribute        | Type                | Description                                                                                                                                                                                                                     |
| ---------------- | ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `item_num`       | string              | OMS Item Number.                                                                                                                                                                                                                |
| `sku`            | string              | OMS Item SKU. In some systems, it will match the OMS Item Number. For systems that have color and size/run, it follows the convention: `<item_num>-<color>-<run>`. For X-runs, the convention is `<item_num>-<color>-X-<size>`. |
| `description1`   | string              | Description line 1.                                                                                                                                                                                                             |
| `description2`   | string              | Description line 2.                                                                                                                                                                                                             |
| `description3`   | string              | Description line 3.                                                                                                                                                                                                             |
| `class_code`     | string              | Class code.                                                                                                                                                                                                                     |
| `division`       | string              | Division.                                                                                                                                                                                                                       |
| `department`     | string              | Department.                                                                                                                                                                                                                     |
| `oem_code`       | string              | OEM code.                                                                                                                                                                                                                       |
| `alternate_code` | string              | Alternate code.                                                                                                                                                                                                                 |
| `color`          | string              | Color code.                                                                                                                                                                                                                     |
| `color_desc`     | string              | Color description, as listed in the OMS System Manager.                                                                                                                                                                         |
| `size`           | string              | Size of item.                                                                                                                                                                                                                   |
| `brand`          | string              | Brand of item.                                                                                                                                                                                                                  |
| `year_produced`  | string              | Year produced.                                                                                                                                                                                                                  |
| `manufacture`    | string              | Manufacturer.                                                                                                                                                                                                                   |
| `model`          | string              | Model.                                                                                                                                                                                                                          |
| `groupcode`      | string              | Group code.                                                                                                                                                                                                                     |
| `subgroupcode`   | string              | Subgroup code.                                                                                                                                                                                                                  |
| `product_unit`   | Product unit object | Product unit and how it is packaged.                                                                                                                                                                                            |
| `case_dimension`               | Volume object              | Case dimensions expressed in volume.  |
| `unit_dimension` | Volume object | Unit item dimension expressed in volume. |

### Product unit object

| Attribute        | Type                | Description                                                                                                                                                                                                                     |
| ---------------- | ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `unit_name` | string | The unit name of the product. This is defined from the Unit Measurement List in the OMS System Manager. |
| `qty_per_case` | string | The quantity per case. |
| `qty_per_inner_box` | string | |
