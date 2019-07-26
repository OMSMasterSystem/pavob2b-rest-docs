---
title: API Reference

language_tabs: 

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

> The Get Products return structure

```json
{
	"products": [{
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
	}],
	"limit": 500,
	"offset": 0,
	"total": 2,
	"build_date": "2019-07-23 17:04:08.652412",
	"githash": "fc8613c12e43a837406714328bba6d9456626306"
}
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


## Get Inventory
> The Get Inventory Return structure

```json
{
  "products": [
    {
      "item_num": "000001MON",
      "upc": "",
      "sku": "000001MON-01-X-L",
      "description1": "",
      "active": "N",
      "color_desc": "Gray",
      "prepack_run": "X",
      "product_unit": {
        "unit_name": "",
        "pairs_per_case": "12"
      },
      "min_stock": "0",
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
      "po_list": [],
      "available_qty": "0",
      "price": "0.00",
      "store_sku": "000001MON-01-X-L",
      "store_id": "OMS",
      "store_qty": "100",
      "store_price": "0.00",
      "customize": "",
      "location_qty": [
        {
          "whs_num": "01",
          "store_qty": "0",
          "available_qty": "0",
          "min_stock": "0",
          "in_stock": "0"
        }
      ]
    },
    {
      "item_num": "000001MON",
      "upc": "",
      "sku": "000001MON-01-X-M",
      "description1": "",
      "active": "N",
      "color_desc": "Gray",
      "prepack_run": "X",
      "product_unit": {
        "unit_name": "",
        "pairs_per_case": "12"
      },
      "min_stock": "0",
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
      "po_list": [],
      "available_qty": "0",
      "price": "0.00",
      "store_sku": "000001MON-01-X-M",
      "store_id": "OMS",
      "store_qty": "100",
      "store_price": "22.00",
      "customize": "",
      "location_qty": []
    }],
    "limit": 500,
    "offset": 0,
    "total": 2,
    "build_date": "2019-07-25 11:22:25.075399",
    "githash": "2c128aea5fcb643464107fea253f42b8b3823117"
}
```
Getting inventory will return you the quantity and pricing of a particular SKU.

### HTTP Request

`GET InventoryApi/Inventory/<store_id>`

### URL Parameters

Parameter | Default | Description
--------- | ---| -----------
offset | 0 | The offset of items, used for paging.

## Post Inventory Update

> The above command returns JSON structured like this:

```json
{
  "products": [
    {
      "item_num": "000001MON",
      "upc": "",
      "sku": "000001MON-01-X-L",
      "description1": "",
      "active": "N",
      "color_desc": "Gray",
      "prepack_run": "X",
      "product_unit": {
        "unit_name": "",
        "pairs_per_case": "12"
      },
      "min_stock": "0",
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
      "po_list": [],
      "available_qty": "0",
      "price": "0.00",
      "store_sku": "000001MON-01-X-L",
      "store_id": "OMS",
      "store_qty": "100",
      "store_price": "0.00",
      "customize": "",
      "location_qty": [
        {
          "whs_num": "01",
          "store_qty": "0",
          "available_qty": "0",
          "min_stock": "0",
          "in_stock": "0"
        }
      ]
    },
    {
      "item_num": "000001MON",
      "upc": "",
      "sku": "000001MON-01-X-M",
      "description1": "",
      "active": "N",
      "color_desc": "Gray",
      "prepack_run": "X",
      "product_unit": {
        "unit_name": "",
        "pairs_per_case": "12"
      },
      "min_stock": "0",
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
      "po_list": [],
      "available_qty": "0",
      "price": "0.00",
      "store_sku": "000001MON-01-X-M",
      "store_id": "OMS",
      "store_qty": "100",
      "store_price": "22.00",
      "customize": "",
      "location_qty": []
    }],
    "limit": 500,
    "offset": 0,
    "total": 2,
    "build_date": "2019-07-25 11:22:25.075399",
    "githash": "2c128aea5fcb643464107fea253f42b8b3823117"
}
```

This endpoint posts inventory updates to OMS. If a SKU is not recognized by OMS, it will be added to the store ID. SKUs that match a certain OMS item number will then be mapped automatically.

### HTTP Request

`POST InventoryApi/Inventory/`

### URL Body

<aside class="notice">
You must add a warehouse number in order to retreive that particular OMS warehouse's quantity.
</aside>

