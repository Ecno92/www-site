JSON API to CSV: Example using the SendCloud API
################################################

:date: 2017-05-01 16:00
:modified: 2017-05-01 16:00
:tags: csv, json, rest-api, sendcloud, tutorial
:category: tech
:slug: json-api-to-csv-file-sendcloud
:authors: Therry van Neerven
:description: JSON API to CSV: Example using the SendCloud API

Even in 2017 CSV still plays an important role in the daily processes of many online businesses.
People use it for various goals. To sync data between (online) applications or analyze and visualize their activity.
CSV is perfect for those goals. It is simple and easy to handle. Which makes it very powerful.

Modern REST API's mostly do not use CSV as a data format as it may be too limited to communicate the necessary data.
Instead most API's are communicating through JSON. A format which is also simple and powerful, but has some more options like nested objects.

Sometimes JSON API's can be even consumed through the browser and JSON lists can be converted to CSV files.
Below I will give an example using the `SendCloud <https://www.sendcloud.com/>`_ API and I will show how you can convert a JSON list from the API into a CSV file.

1. Getting access to the SendCloud API
======================================

The API of SendCloud is not enabled by default. For this you need to activate the API integration.
The steps for this are quire simple. For an up to date example on how to do this I recommend to check the Help Center of SendCloud.

2. Check the API documentation
==============================

REST API's are mostly using HTTP as a transport layer for the data and data of a system is often received to something which they call a GET request.
GET requests are very simple. By requesting a specific URL you can control which data is returned from the server.

In our example we want to get a list of parcels. This is how SendCloud names the shipments which are registered in the platform.

.. image:: /images/sendcloud-api-parcel-list.png
   :alt: SendCloud API Parcel List example
   :class: image-process-article-image

As you can see in the `documentation <https://docs.sendcloud.sc/api/v2/index.html#parcel-list>`_ The URL required is quite simple:

``https://<apikey>:<apisecret>@panel.sendcloud.sc/api/v2/parcels``

Once you have created the API keys you can fill them into the URL instead of the placeholder values.
Also you can change some parameters of the request to get a different result.

**Limit:** ``<resource>/?limit=100``

**Offset:** ``<resource>/?offset=100``

So in case our API key is: *abc* and our API secret is *123* we can get the last 100 parcels by using this URL in the browser:

``https://abc:123@panel.sendcloud.sc/api/v2/parcels``

Also we can control which part of the data which we query. If we want to skip the first 100 parcels and get the next 20 parcels we can use a URL like this.

``https://abc:123@panel.sendcloud.sc/api/v2/parcels?offset=100&limit=20``

Now you know how to modify the URL it is time to get some data and to convert it to CSV.

3. JSON to CSV
==============

The first step is to open your browser. Followed by copy-pasting your modified URL including the API keys and optionally the *offset* and *limit* arguments.

``https://abc:123@panel.sendcloud.sc/api/v2/parcels?offset=50&limit=2``

In my case I use an offset of 100 and I limit the result to 2 items.
The two items will give about the same result because

The browser should return a JSON object with a nested parcels list like the following example:

.. code-block:: javascript

    {
      "parcels": [
        {
          "tracking_url": "https://www.dhlparcel.nl/nl/particulier/ontvangen/track-trace?tt=JVGL0123456700000142",
          "carrier": {
            "code": "dhl"
          },
          "parcel_items": [],
          "customs_shipment_type": null,
          "customs_invoice_nr": "",
          "to_state": null,
          "total_insured_value": 0,
          "insured_value": 0,
          "order_number": "",
          "label": {
            "normal_printer": [
              "https://panel.sendcloud.sc/api/v2/labels/normal_printer/155?start_from=0",
              "https://panel.sendcloud.sc/api/v2/labels/normal_printer/155?start_from=1",
              "https://panel.sendcloud.sc/api/v2/labels/normal_printer/155?start_from=2",
              "https://panel.sendcloud.sc/api/v2/labels/normal_printer/155?start_from=3"
            ],
            "label_printer": "https://panel.sendcloud.sc/api/v2/labels/label_printer/155"
          },
          "weight": "1.000",
          "tracking_number": "JVGL0123456700000142",
          "telephone": "",
          "status": {
            "message": "Ready to send",
            "id": 1000
          },
          "shipment": {
            "name": "DHL Europlus",
            "id": 199
          },
          "reference": "0",
          "postal_code": "5642 CV",
          "name": "Therry van Neerven",
          "email": "",
          "date_created": "01-05-2017 14:32:03",
          "data": null,
          "country": {
            "name": "Netherlands",
            "iso_3": "NLD",
            "iso_2": "NL"
          },
          "company_name": "SendCloud",
          "city": "Eindhoven",
          "address_divided": {
            "street": "Insulindelaan",
            "house_number": "115"
          },
          "address": "Insulindelaan 115",
          "id": 155
        },
        {
          "tracking_url": "https://www.dhlparcel.nl/nl/particulier/ontvangen/track-trace?tt=JVGL0123456700000141",
          "carrier": {
            "code": "dhl"
          },
          "parcel_items": [],
          "customs_shipment_type": null,
          "customs_invoice_nr": "",
          "to_state": null,
          "total_insured_value": 0,
          "insured_value": 0,
          "order_number": "",
          "label": {
            "normal_printer": [
              "https://panel.sendcloud.sc/api/v2/labels/normal_printer/154?start_from=0",
              "https://panel.sendcloud.sc/api/v2/labels/normal_printer/154?start_from=1",
              "https://panel.sendcloud.sc/api/v2/labels/normal_printer/154?start_from=2",
              "https://panel.sendcloud.sc/api/v2/labels/normal_printer/154?start_from=3"
            ],
            "label_printer": "https://panel.sendcloud.sc/api/v2/labels/label_printer/154"
          },
          "weight": "1.000",
          "tracking_number": "JVGL0123456700000141",
          "telephone": "",
          "status": {
            "message": "Ready to send",
            "id": 1000
          },
          "shipment": {
            "name": "DHL Europlus",
            "id": 199
          },
          "reference": "0",
          "postal_code": "5642 CV",
          "name": "Therry van Neerven",
          "email": "",
          "date_created": "01-05-2017 14:32:03",
          "data": null,
          "country": {
            "name": "Netherlands",
            "iso_3": "NLD",
            "iso_2": "NL"
          },
          "company_name": "SendCloud",
          "city": "Eindhoven",
          "address_divided": {
            "street": "Insulindelaan",
            "house_number": "115"
          },
          "address": "Insulindelaan 115",
          "id": 154
        }
      ]
    }

Now you have the data it is time to turn it into a CSV.
For this  we use a in-browser JSON to CSV convertor:
https://konklone.io/json/

.. image:: /images/sendcloud-api-to-csv-tool.gif
   :alt: SendCloud API Parcel List example

Copy the data from the SendCloud API and paste it in the text field of the tool.
After pasting the JSON data it should present you a table with the data and an option to download the entire CSV file.

You can use this trick for many API's, but the way how you get the data may be different per software application.
Also JSON objects can be very complex and you may be required to isolate specific objects or lists before you can covert them to CSV.
