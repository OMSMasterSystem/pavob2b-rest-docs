---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

This is the alpha version of the OMS API documentation.

# Authentication

To authorize, use the access key from the AdminGMW/SHW/APW website. More details to follow.

When performing API requests, the OMS API expects the Header to contain a Base64 encoded key as follows.

`Authorization: Basic meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with The OMS API Key.
</aside>

# Inventory API

## Get Products

> The above command returns JSON structured like this:

```json
[{
  "item_num": "000001MON",
  "upc": "",
  "sku": "000001MON-02-10A",
  "description1": "",
  "description3": "",
  "class_code": "001",
  "division": "",
  "department": "",
  "active": "N",
  "color": "02",
  "color_desc": "Black",
  "prepack_run": "10A",
  "run_qty": "10",
  "size": "",
  "brand": "",
  "year_produced": "",
  "manufacture": "",
  "model": "",
  "style": "Nerd Style",
  "season": "Summer",
  "product_unit": {
    "unit_name": "",
    "pairs_per_case": "12"
  },
  "case_dimension": {
    "unit": "INCH",
    "volume": "0.0000"
  },
  "unit_dimension": {
    "unit": "INCH",
    "volume": "0.0000"
  },
  "case_weight": {
    "unit": "POUND",
    "value": "0.0000"
  },
  "unit_weight": {
    "unit": "POUND",
    "value": "0.0000"
  },
  "min_stock": "0",
  "availability_qty": {
    "in_stock": "15",
    "allocated_qty": "0",
    "post_stock_qty": "15",
    "open_so_qty": "1",
    "available_qty": "14",
    "eta_rcv_dt_string": ""
  },
  "price_list": {
    "business_type": [
      {
        "price": "240.00"
      },
      {
        "price": "120.00"
      },
      {
        "price": "240.00"
      },
      {
        "price": "60.00"
      },
      {
        "price": "30.00"
      }
    ],
    "qty_type": [],
    "color_type": [],
    "size_type": [],
    "selected_type": "business_type"
  },
  "available_qty": "14",
  "price": "240.00",
  "attributes": [
    {
      "name": "color",
      "value": "02"
    },
    {
      "name": "run",
      "value": "10A"
    },
    {
      "name": "size",
      "value": ""
    }
  ]
}]
```

This endpoint retrieves all products associated with a store ID. If there is no store ID specified, then we will return all products from OMS.

### HTTP Request

`GET InventoryApi/Products/<store_id>`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
offset | 0 | The offset of items, used for paging
update\_date\_after | epoch | If a DateTime object is provided, then this will return the products that were updated _after_ the date provided in the query.
update\_date\_before | now | If a DateTime object is provided, then this will return the products that were updated _before_ the date provided in the query.


This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

