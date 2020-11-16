Title: How to make the XYL-8805-G Barcode Scanner work correctly on Mac OS
Date: 2017-12-18 17:00
Modified: 2017-12-18 17:00
Tags: XYL-8805-G, barcode, scanner, howto
Category: tech
Slug: how-to-make-the-XYL-8805-G-Barcode-Scanner-work-correctly-on-mac-os
Authors: Therry van Neerven
Description: This article explains you how to resolve issues with the XYL-7705-G Barcode scanner on Mac OS.

In case you own a barcode scanner with type number "XYL-7705-G" and it
mixes barcode input like this:

    PS0000000045689012

instead of giving the right result like this when using MacOS:

    PS0000000006845921

Then you may have a wrongly configured barcode scanner and you will need
to disable the USB quick upload functionality.

## How to disable the USB quick upload functionality

### 1. Reset the scanner to factory defaults (optional)

![XYL-8805-G Manual - Reset factory defaults](/images/how-to-make-the-XYL-8805-G-Barcode-Scanner-work-correctly-on-mac-os/reset-factory-defaults.png){.image-process-article-image}

You may want to reset the scanner to factory defaults first. This can be
easily done by scanning the barcode on page 4 of the
[manual](%7Bfilename%7D/files/how-to-make-the-XYL-8805-G-Barcode-Scanner-work-correctly-on-mac-os/xyl-8805-g-barcode-scanner-manual.pdf).

### 2. Disable USB quick upload

![XYL-8805-G Manual - USB quick upload/off](/images/how-to-make-the-XYL-8805-G-Barcode-Scanner-work-correctly-on-mac-os/usb-quick-upload-off.png){.image-process-article-image}

Disable the USB quick upload functionality by scanning the barcode on
page 14 of the
[manual](%7Bfilename%7D/files/how-to-make-the-XYL-8805-G-Barcode-Scanner-work-correctly-on-mac-os/xyl-8805-g-barcode-scanner-manual.pdf).

That's it. You should be good to go!
