Title: SFF Workstation Build Notes
Slug: sff-workstation-build-notes
Date: 2020-04-22 09:07:00
Description: "Notes of building my small form factor workstation"

Recently I've completed my small form factor PC build.
I started the build of this PC because I was annoyed by the single threaded performance of my notebook.
Now I have a very fast PC which I can take easily with me due to its size of only 4 liters.

![My new workstation in a 4L case](/images/workstation-forel.jpg)

It has been about 10 years ago that I've built my last PC.
This year I've built two PC's. One of them took 2 hours and this one took almost a month to complete.
I hope the notes below will be helpful or interesting to some of you.

## Specifications

* K39 v2 case
* AMD Ryzen 5 3600 Processor
* Ballistix Sport LT DDR4 RAM -  32GB
* Samsung 970 EVO M.2 Solid State Drive
* Gigabyte GeForce GTX 1650 MINI ITX OC 4G
* Noctua NH-L9i CPU Cooler
* SilverStone SST-FX350-G Power Supply
* ASRock B450 Gaming-ITX/AC Motherboard
* Ubuntu 19.10

## Notes about specific components or configuration

### Silent Gigabyte GeForce GTX 1650 MINI ITX and stable Firefox hardware acceleration

#### Silent fan

Due to the small size of the case I had limited options. That's why I've decided to buy this Gigabyte graphics card.
By default the fan is running at 56% speed and GPU temperatures are just above room temperature. Even under load.
The default high pitched sound is pretty annoying in an open case, but it may be OK if you have a closed case.

It is not possible to lower the fan speed. So that's why I've replaced the BIOS by a version of the card with a larger heatsink
and dual fans.

In my case I was running VBIOS `90.17.2A.00.A5`. (Use the Nvidia Settings tool to check your current version.)
Initially I downloaded a bios which was not correct as it caused rendering issues all over the place.
At last I settled with VBIOS `90.17.2A.00.A6` [downloaded from TechPowerUp](https://www.techpowerup.com/vgabios/216565/216565)

I used a USB stick with Windows 10 created with help of [WinToUSB](https://www.easyuefi.com/wintousb/).
This works well, but because my USB device was not really fast I can not recommend this. As it already takes 15 minutes to boot.
Once booted I could use [nvflash](https://www.techpowerup.com/download/nvidia-nvflash/) to flash the bios.

When booted the graphics card turns the fans off by default. However it is not able to passively cool the GPU.
Every 10 minutes the fan revs up and quickly cools down the GPU.

In order to have a nicer experience I've set up a Startup application with the following command:

```
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=37"
```

Now the fan always runs at 1060 RPM. You really need to pay attention to hear it.
Even under full load the GPU stays at around 50-60 degrees Celsius.

#### Firefox hardware acceleration

I'm a Firefox user, unless I'm developing frontend applications in React(Native). However I noticed after a while that Firefox was not running smoothly.
I've tried all kinds of options to enable hardware acceleration. Initially with success, but followed by strange transparent Windows and other rendering problems.

I fixed this by enabling WebRenderer. The Arch Linux wiki [has a nice article](https://wiki.archlinux.org/index.php/Firefox/Tweaks#Enable_WebRender) which explains on how you can test this and apply it permanently.

### Modding the Power Supply to become silent

At first I want to mention that the [SilverStone SST-FX350-G](https://www.silverstonetek.com/product.php?pid=784) is a good power supply.
It is one of the few Flex ATX power supplies that can be bought from the major retailers.
The quality of the supply is good, but due to the small 40mm fan it is far from silent.

The standard fan is the Jamicon KF0415B1HR-R. This is a 40mmx20mm fan.
Initially I replaced the fan by a ebmpapst 412F fan. This is a 40mmx10mm fan which is already more silent than the stock one.

However I was not completely satisfied by the noise level yet.
So I [followed some other people](https://www.reddit.com/r/sffpc/comments/dzraw2/inwin_chopin_psu_fan_mod_noctua_nfa4x10_flx/) by replacing it with the Noctua NF-A4x10 FLX fan.
This is a 3 pin fan, but even with the 2-pin adapter it did not run after some time when the PSU increased the fan voltage of the fan
from 5v to 8v.
So I hooked it up to the mainboard instead and I set it just above the minimal speed. When the CPU temperature increases also the power supply fan will increase its speed to match the increased load.
It is now very silent and the temperature of the PSU seems to be reasonable after a long period of usage.

*other notes:*

* I've also tested the Sunon MF40101V1-1000U-A99. Great fan, no ball bearing noise, but the sound is high pitched at full speed.
* Small fans are often mounted with self-tapping screws. Some fans like from ebmpapst are made of hard plastic. I recommend to mount fans using something else than screws in that case as I destroyed one fan. The Noctua fan has softer plastic and is easy to mount with the included screws.
* I've removed (cut!) all the cables that I did not need from the power supply to get an easier fit in the case.
* Modifying power supplies is dangerous. Make sure that you aware of those before hooking up your own fan.

### USB issues on the Gigabyte motherboard

At first I installed a [ASRock X570 Phantom Gaming-ITX/TB3 motherboard](https://www.asrock.com/mb/AMD/X570%20Phantom%20Gaming-ITXTB3/). However I replaced it due to the noisy fan and some issues with DisplayPort input forwarding via thunderbolt after putting the system into sleep mode.
Still it is an impressive motherboard, but I did not find it a good fit for this build.

I replaced the motherboard with a the [ASRock B450 Gaming-ITX/AC motherboard](https://www.asrock.com/mb/AMD/Fatal1ty%20B450%20Gaming-ITXac/index.asp). This is a far more basic and passively cooled motherboard.

Unfortunately I received all kinds of weird log messages related to USB like:

```
usb x-x: reset high-speed USB device number 2 using xhci_hcd
```

Eventually I settled with the following line in my grub config:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash amd_iommu=on iommu=pt usbcore.autosuspend=-1"
```

I believe the `usbcore.autosuspend` has the most effect, but the iommu changes also improved the stability a lot.

**Compliment to Noctua**

The first motherboard had a AM4 socket with a Intel cooler mount. That's why I have the wrong (even smaller) Noctua cooler.
Luckily Noctua provides [alternative mounting kit free of charge](https://noctua.at/en/products/accessories/mounting-kits/nm-am4-l9al9i-mounting-kit) to mount the L9i on a AM4 socket.
