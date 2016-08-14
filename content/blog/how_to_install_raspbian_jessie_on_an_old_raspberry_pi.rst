How to install Raspbian Jessie with a GUI on an old Raspberry Pi.
#################################################################

:date: 2016-03-20 16:00
:modified: 2016-03-20 16:00
:tags: raspberry-pi, tutorial
:category: tech
:slug: how-to-install-raspbian-jessie-on-an-old-raspberry-pi
:authors: Therry van Neerven
:description: How to install Raspbian Jessie with a GUI on an old and low storage Raspberry Pi.

This weekend I did some experiments with my Raspberry Pi.
I'm still using the first generation model B which only has 256MB of RAM.
When I purchased the board I bought it with a 4GB card. Which was at that time sufficient for both a headless and desktop installation.

For the experiments that I wanted to do I needed a GUI environment.
For this I wanted to use the full blown Raspberry Jessie environment which you can download `here <https://www.raspberrypi.org/downloads/raspbian/>`_.
So I downloaded the image and when I tried to put it on the SD card I received the message that it was too large for the 4GB SD card. (about 30MB too large)
My second attempt was using the NOOBS image. Unfortunately this approach did also not work since the GUI did not boot after going through the setup process.

Steps to install Raspbian Jessie including a GUI on an old Raspberry Pi (first generation) with only 4GB of storage
===================================================================================================================

1. Use the Raspbian Jessie Lite image
-------------------------------------

Since we have only limited storage space available we use the Raspbian Jessie Lite image.
This image includes a limited set of applications and also does not include a desktop
environment installed by default.
Don't worry. I'll explain you how to install one.

First you need to download the Raspbian Jessie Lite image from `here <https://www.raspberrypi.org/downloads/raspbian/>`_.
Be sure to pick the Lite version and use the torrent link if you want to save the Raspberry Pi Foundation some network bandwith.

Next decompress the zip file and flash the image on the SD card.
For the specific instructions you can refer to the `Raspberry Pi Documentation <https://www.raspberrypi.org/documentation/installation/installing-images/README.md>`_.

2. Initial setup.
-----------------

Once you have flashed the SD card with the image it's time to boot the Raspberry Pi.
First plug in the Ethernet, HDMI, Keyboard and Mouse cables into the Pi.
Insert the SD Card and finally attach the power supply.

The Raspberry Pi will boot immediately. This will take a little bit more than a minute.
Once the Pi is booted it will ask you for the username and the password.
By default the following log-in credentials can be used:

**Username:** pi

**Password:** raspberry

Now it is time to configure the Raspberry Pi.
You can enter the Raspberry Pi configuration menu by typing `sudo raspi-config` in the terminal.
You will be prompted for your password since you are going to edit system files.
Enter the password and a menu will open.

In this menu I advice you to do the following things:

* Expand the file system: By default there are only a few MB's left for new files.
  By using this option you assign the remaining unused space to be available to the OS.
* Change the default password. Everyone knows your password is *"raspberry"*. Change it!
* Apply a overclock! `It's safe to overclock the Pi <https://www.raspberrypi.org/blog/introducing-turbo-mode-up-to-50-more-performance-for-free/>`_.
  For me the "modest" setting worked the best. Anything beyond was unstable.
* Enable SSH. The Raspberry Pi is not fast. So SSH is a fast way to install updates etc. from a remote PC.

After changing the settings it may ask for a reboot. If you changed all the necessary things you can tell it to reboot.
Another way is to finish the menu and to enter `sudo reboot` in the terminal.
Be sure that you reboot. The file system will only expand on the next reboot!

3. Installing the GUI / Desktop environment
-------------------------------------------

For some use cases you may need a GUI. Or you prefer to have a decent desktop environment over a terminal session.
for those cases we are going to install a fully working LXDE_ environment.

First we update our system:

::

   sudo apt-get update && sudo apt-get upgrade

Then we install the Xorg display server:

::

   sudo apt-get install xinit

Now we are going to install LXDE, a terminal for in LXDE and a package to make everything look nice:

::

   sudo apt-get install lxde-core lxterminal lxappearance

Now we have a nice desktop environment it's time to install a login manager:

::

   sudo apt-get install lightdm

Now everything is installed. Let's reboot!

::

   sudo reboot


4. Enter the desktop!
---------------------

After the reboot you will see a login screen (lightdm).
Enter your username and password and you will enter the desktop.


.. image:: /images/raspberry-pi-lxde-desktop.png
   :alt: LXDE on Raspberry Pi
   :class: image-process-article-image

If you check the menu (lower left icon) you can find the *lxterminal*.
With use of this terminal you can install new software and change the configuration of the system.

At last I recommend you to start not with the GUI environment by default.
I personally like to first enter the command line interface and if I need to I can switch to the GUI.
In order to get this behavior you need to do the following:

* Open the *lxterminal*.
* Enter `raspi-config`.
* Go to boot behavior
* Pick the first option. Boot into console. Requiring the user to enter the login credentials.

If you now reboot you will enter the command line interface (headless) by default.
in order to start the GUI you can enter the following:

::

   startx


Conclusion
==========

Setting up a Raspberry Pi configuration seems to be simple at first sight.
However the years passed and the average Raspberry Pi became more powerful.
Unfortunately the fact that there are still old Raspberry's with low storage capacities
being installed is not taken into account by the default Raspbian and NOOBS images.
By installing a headless image and by installing some software by hand it's possible
to set up a lean installation which is ready to support your new ideas.

.. _LXDE: http://lxde.org/   

