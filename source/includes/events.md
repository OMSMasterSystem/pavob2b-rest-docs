# Events

The event endpoint allows you to retreive events from OMS, such as when you want to highlight specific items or run a promotion on a collection of inventory.

## Event Properties

| Attribute     | Type      | Description                                            |
| ------------- | --------- | ------------------------------------------------------ |
| `event_id`    | string    | Event ID.                                              |
| `title`       | string    | Event name.                                            |
| `description` | string    | Event description.                                     |
| `image`       | string    | Image filepath, relative to the base filepath setting. |
| `sequence`    | integer   | Sequence of this event, starting with `0`.             |
| `active`      | boolean   | Whether this event is active.                          |
| `start_date`  | date-time | The date this event is to start.                       |
| `end_date`    | date-time | The date this event is to end.                         |
| `update_date` | date-time | The date this event was last updated.                  |
| `updated_by`  | string    | The OMS user who performed the last update.            |
| `line_items`  | array     | An array of line items for each product in the event.  |

## Get all events

This endpoint lets you retreive and view all the events.

### HTTP Request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/events</h6>
    </div>
</div>

```shell
curl https://example.com/api/events
```

> JSON response example:

```json
[
  {
    "event_id": "1128",
    "title": "MARCH APPLE PRODUCT SALE",
    "description": "CHECK OUT OUR LOW PRICES!",
    "image": "/images/events/1128.jpg",
    "sequence": "0",
    "active": false,
    "start_date": "2019-03-10T08:00:00.000Z",
    "end_date": "2020-03-27T07:00:00.000Z",
    "update_date": "2019-10-22T18:14:51.000Z",
    "update_by": "OMS",
    "line_items": [
      {
        "id": "1",
        "item_num": "00-010-078",
        "sku": "00-010-078",
        "description1": "OMS Casual Leather Handbag cell",
        "description2": "Interior zipper pocket and two slip pocketswwww",
        "description3": "Roomy main compartmentssss",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/00-010-078--1.jpg",
          "/images/00-010-078--2.jpg",
          "/images/00-010-078--3.jpg"
        ]
      },
      {
        "id": "3",
        "item_num": "00-013-078",
        "sku": "00-013-078",
        "description1": "OMS Lady Handbag",
        "description2": "",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/00-013-078--1.jpg",
          "/images/00-013-078.jpg"
        ]
      },
      {
        "id": "5",
        "item_num": "0001",
        "sku": "0001",
        "description1": "Adidas Men's 'Superstar 2 CB' Leather Athletic Shoe111111111",
        "description2": "Adidas Men's 'Superstar 2 CB' Leather Athletic Shoe222222223",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/0001--1.jpg",
          "/images/0001--2.jpg",
          "/images/0001.jpg"
        ]
      },
      {
        "id": "6",
        "item_num": "0002",
        "sku": "0002",
        "description1": "Light Blue Women's 3.3-ounce Eau de Toilette Spray",
        "description2": "Dolce & Gabbana Light Blue",
        "description3": "3.3-ounce spray",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/0002--1.jpg",
          "/images/0002.jpg"
        ]
      },
      {
        "id": "7",
        "item_num": "0006",
        "sku": "0006",
        "description1": "OMS Casual Leather Handbag11",
        "description2": "Interior zipper pocket and two slip pockets",
        "description3": "Roomy main compartment",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/0006--1.jpg",
          "/images/0006--2.jpg"
        ]
      },
      {
        "id": "8",
        "item_num": "001",
        "sku": "001",
        "description1": "POCKET KNIFE 2.1\"MAX LENGTHPOCKET KNIFE 2.1\"MAX LENGTHPOCKET",
        "description2": "test test pocket knife",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/001--01.jpg",
          "/images/001--04.jpg",
          "/images/001--1.jpg",
          "/images/001--2.jpg",
          "/images/001--3.png"
        ]
      }
    ]
  },
  {
    "event_id": "123456789",
    "title": "FOR SALE",
    "description": "SPRING COLLECTION",
    "image": "/images/events/123456789.jpg",
    "sequence": "0",
    "active": false,
    "start_date": "2019-04-30T07:00:00.000Z",
    "end_date": "2021-05-30T07:00:00.000Z",
    "update_date": "2019-10-22T18:13:43.000Z",
    "update_by": "OMS",
    "line_items": [
      {
        "id": "5",
        "item_num": "0001",
        "sku": "0001",
        "description1": "Adidas Men's 'Superstar 2 CB' Leather Athletic Shoe111111111",
        "description2": "Adidas Men's 'Superstar 2 CB' Leather Athletic Shoe222222223",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/0001--1.jpg",
          "/images/0001--2.jpg",
          "/images/0001.jpg"
        ]
      },
      {
        "id": "6",
        "item_num": "0002",
        "sku": "0002",
        "description1": "Light Blue Women's 3.3-ounce Eau de Toilette Spray",
        "description2": "Dolce & Gabbana Light Blue",
        "description3": "3.3-ounce spray",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/0002--1.jpg",
          "/images/0002.jpg"
        ]
      },
      {
        "id": "7",
        "item_num": "0003",
        "sku": "0003",
        "description1": "8 Pin USB Data Sync Charger Flat Cable Cord",
        "description2": "for iPhone 6 6+ 5 5S C iPod Touch 5 Nano",
        "description3": "Plastic",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/no_image.jpg"
        ]
      },
      {
        "id": "8",
        "item_num": "0004",
        "sku": "0004",
        "description1": "A lot of Oranges",
        "description2": "many many oranges",
        "description3": "orange.",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/0004--1.JPG",
          "/images/0004--2.jpg",
          "/images/0004.JPG"
        ]
      },
      {
        "id": "9",
        "item_num": "0005",
        "sku": "0005",
        "description1": "less oranges 111 2222 3 3 4 4 546546747",
        "description2": "123456789abcdefg1234567abfg",
        "description3": "orange",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/0005.JPG"
        ]
      },
      {
        "id": "10",
        "item_num": "0006",
        "sku": "0006",
        "description1": "OMS Casual Leather Handbag11",
        "description2": "Interior zipper pocket and two slip pockets",
        "description3": "Roomy main compartment",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/0006--1.jpg",
          "/images/0006--2.jpg"
        ]
      },
      {
        "id": "11",
        "item_num": "001",
        "sku": "001",
        "description1": "POCKET KNIFE 2.1\"MAX LENGTHPOCKET KNIFE 2.1\"MAX LENGTHPOCKET",
        "description2": "test test pocket knife",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/001--01.jpg",
          "/images/001--04.jpg",
          "/images/001--1.jpg",
          "/images/001--2.jpg",
          "/images/001--3.png"
        ]
      },
      {
        "id": "12",
        "item_num": "001_ASST_12_L",
        "sku": "001_ASST_12_L",
        "description1": "OMS Casual Leather Handbag",
        "description2": "Interior zipper pocket and two slip pockets",
        "description3": "Roomy main compartment",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/no_image.jpg"
        ]
      },
      {
        "id": "13",
        "item_num": "00105",
        "sku": "00105",
        "description1": "BAZIC 2\" X  800\" CLEAR PACKING TAPE W/ DISPENSER",
        "description2": "",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/00105.jpg"
        ]
      },
      {
        "id": "14",
        "item_num": "0012",
        "sku": "0012",
        "description1": "GOOD WILL BACKPACK",
        "description2": "",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/0012.jpg"
        ]
      },
      {
        "id": "15",
        "item_num": "001A",
        "sku": "001A",
        "description1": "POCKET KNIFE 2.1\"MAX LENGTHPOCKET KNIFE 2.1\"MAX LENGTHPOCKET",
        "description2": "oms key test",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/001A.jpg"
        ]
      },
      {
        "id": "16",
        "item_num": "002",
        "sku": "002",
        "description1": "POCKET KNIFE 2.1\"MAX LENGTHPOCKET KNIFE 2.1\"MAX LENGTHPOCKET",
        "description2": "",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/002.jpg"
        ]
      },
      {
        "id": "17",
        "item_num": "003",
        "sku": "003",
        "description1": "Power Bank for Smartphones, Capacity: 4200mAh@3.7V",
        "description2": "",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/003--01.jpg",
          "/images/003--1.jpg",
          "/images/003.jpg"
        ]
      },
      {
        "id": "18",
        "item_num": "00334",
        "sku": "00334",
        "description1": "Foldable, full size wireless optical mouse",
        "description2": "",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/00334.jpg"
        ]
      },
      {
        "id": "19",
        "item_num": "004",
        "sku": "004",
        "description1": "Tea Canister with Spoon - Black",
        "description2": "",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/004.jpg"
        ]
      },
      {
        "id": "20",
        "item_num": "005",
        "sku": "005",
        "description1": "55555Power Bank for Smartphones, Capacity: 4200mAh@3.7V",
        "description2": "52",
        "description3": "53",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/no_image.jpg"
        ]
      }
    ]
  },
  {
    "event_id": "8022019",
    "title": "SALE!!!",
    "description": "JOSE INVENTORY ITEMS",
    "image": "/images/events/8022019.jpg",
    "sequence": "0",
    "active": false,
    "start_date": "2019-08-02T07:00:00.000Z",
    "end_date": "2021-08-06T07:00:00.000Z",
    "update_date": "2019-09-18T17:59:10.000Z",
    "update_by": "OMS",
    "line_items": [
      {
        "id": "1",
        "item_num": "JOSE",
        "sku": "JOSE",
        "description1": "Dell 2",
        "description2": "",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/JOSE--01 (2).jpg",
          "/images/JOSE--01.jpg",
          "/images/JOSE.JPG"
        ]
      },
      {
        "id": "2",
        "item_num": "JOSE2",
        "sku": "JOSE2",
        "description1": "thinkpad",
        "description2": "",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/JOSE2.jpg"
        ]
      }
    ]
  },
  {
    "event_id": "CHRISTMAS",
    "title": "CHRISTMAS",
    "description": "CHRISTMAS ITEMS",
    "image": "/images/events/CHRISTMAS.jpg",
    "sequence": "1",
    "active": false,
    "start_date": "2019-03-07T08:00:00.000Z",
    "end_date": "2020-03-13T07:00:00.000Z",
    "update_date": "2019-04-09T22:43:59.000Z",
    "update_by": "OMS",
    "line_items": [
      {
        "id": "1",
        "item_num": "CM-1001",
        "sku": "CM-1001",
        "description1": "Christmas Pillows",
        "description2": "PIllows for the holidays",
        "description3": "Roomy main compartmentssss",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/CM-1001.jpg"
        ]
      },
      {
        "id": "2",
        "item_num": "CM-1002",
        "sku": "CM-1002",
        "description1": "Christmas Sheets",
        "description2": "Sheets for the holidays",
        "description3": "Roomy main compartmentssss",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/CM-1002.jpg"
        ]
      },
      {
        "id": "3",
        "item_num": "CM-1003",
        "sku": "CM-1003",
        "description1": "Christmas Plates",
        "description2": "Plates for the holidays",
        "description3": "Roomy main compartmentssss",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/CM-1003.jpg"
        ]
      },
      {
        "id": "4",
        "item_num": "CM-1004",
        "sku": "CM-1004",
        "description1": "Santa Jar",
        "description2": "Santa Jar for the holidays",
        "description3": "Roomy main compartmentssss",
        "retail_price": null,
        "price": null,
        "images": [
          "/images/CM-1004.jpg"
        ]
      }
    ]
  }
]
```

## View one event

This endpoint lets you retreive and view all the events.

### HTTP Request

<div class="api-endpoint">
    <div class="endpoint-data">
        <i class="label label-post">GET</i>
        <h6>/api/events/&lt;event_id&gt;</h6>
    </div>
</div>

```shell
curl https://example.com/api/events/1128
```

> JSON response example:

```json
{
    "event_id": "1128",
    "title": "MARCH APPLE PRODUCT SALE",
    "description": "CHECK OUT OUR LOW PRICES!",
    "image": "/images/events/1128.jpg",
    "sequence": "0",
    "active": false,
    "start_date": "2019-03-10T08:00:00.000Z",
    "end_date": "2020-03-27T07:00:00.000Z",
    "update_date": "2019-10-22T18:14:51.000Z",
    "update_by": "OMS",
    "line_items": [{
        "id": "1",
        "item_num": "00-010-078",
        "sku": "00-010-078",
        "description1": "OMS Casual Leather Handbag cell",
        "description2": "Interior zipper pocket and two slip pocketswwww",
        "description3": "Roomy main compartmentssss",
        "retail_price": null,
        "price": null,
        "images": [
            "/images/00-010-078--1.jpg",
            "/images/00-010-078--2.jpg",
            "/images/00-010-078--3.jpg"
        ]
    },
    {
        "id": "3",
        "item_num": "00-013-078",
        "sku": "00-013-078",
        "description1": "OMS Lady Handbag",
        "description2": "",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
            "/images/00-013-078--1.jpg",
            "/images/00-013-078.jpg"
        ]
    },
    {
        "id": "5",
        "item_num": "0001",
        "sku": "0001",
        "description1": "Adidas Men's 'Superstar 2 CB' Leather Athletic Shoe111111111",
        "description2": "Adidas Men's 'Superstar 2 CB' Leather Athletic Shoe222222223",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
            "/images/0001--1.jpg",
            "/images/0001--2.jpg",
            "/images/0001.jpg"
        ]
    },
    {
        "id": "6",
        "item_num": "0002",
        "sku": "0002",
        "description1": "Light Blue Women's 3.3-ounce Eau de Toilette Spray",
        "description2": "Dolce & Gabbana Light Blue",
        "description3": "3.3-ounce spray",
        "retail_price": null,
        "price": null,
        "images": [
            "/images/0002--1.jpg",
            "/images/0002.jpg"
        ]
    },
    {
        "id": "7",
        "item_num": "0006",
        "sku": "0006",
        "description1": "OMS Casual Leather Handbag11",
        "description2": "Interior zipper pocket and two slip pockets",
        "description3": "Roomy main compartment",
        "retail_price": null,
        "price": null,
        "images": [
            "/images/0006--1.jpg",
            "/images/0006--2.jpg"
        ]
    },
    {
        "id": "8",
        "item_num": "001",
        "sku": "001",
        "description1": "POCKET KNIFE 2.1\"MAX LENGTHPOCKET KNIFE 2.1\"MAX LENGTHPOCKET",
        "description2": "test test pocket knife",
        "description3": "",
        "retail_price": null,
        "price": null,
        "images": [
            "/images/001--01.jpg",
            "/images/001--04.jpg",
            "/images/001--1.jpg",
            "/images/001--2.jpg",
            "/images/001--3.png"
        ]
    }]
}
```
