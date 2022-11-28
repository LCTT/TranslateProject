[#]: subject: "Astrophotography with Fedora Astronomy Lab: setting up"
[#]: via: "https://fedoramagazine.org/astrophotography-with-fedora-astronomy-lab-setting-up/"
[#]: author: "Geoffrey Marr https://fedoramagazine.org/author/coremodule/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Astrophotography with Fedora Astronomy Lab: setting up
======

![][1]

Photo by Geoffrey Marr

You love astrophotography. You love Fedora Linux. What if you could do the former using the latter? Capturing stunning and awe-inspiring astrophotographs, processing them, and editing them for printing or sharing online using Fedora is absolutely possible! This tutorial guides you through the process of setting up a computer-guided telescope mount, guide cameras, imaging cameras, and other pieces of equipment. A future article will cover capturing and processing data into pleasing images. Please note that while this article is written with certain aspects of the astrophotography process included or omitted based off my own equipment, you can custom-tailor it to fit your own equipment and experience. Let’s capture some photons!

![][2]

### Installing Fedora Astronomy Lab

This tutorial focuses on [Fedora Astronomy Lab][3], so it only makes sense that the first thing we should do is get it installed. But first, a quick introduction: based on the KDE Plasma desktop, Fedora Astronomy Lab includes many pieces of open source software to aid astronomers in planning observations, capturing data, processing images, and controlling astronomical equipment.

Download Fedora Astronomy Lab from the [Fedora Labs website][4]. You will need a USB flash-drive with at least eight GB of storage. Once you have downloaded the ISO image, use [Fedora Media Writer][5] to [write the image to your USB flash-drive.][6] After this is done, [boot from the USB drive][7] you just flashed and [install Fedora Astronomy Lab to your hard drive.][8] While you can use Fedora Astronomy Lab in a live-environment right from the flash drive, you should install to the hard drive to prevent bottlenecks when processing large amounts of astronomical data.

### Configuring your installation

Before you can go capturing the heavens, you need to do some minor setup in Fedora Astronomy Lab.

First of all, you need to add your user to the *dialout* group so that you can access certain pieces of astronomical equipment from within the guiding software. Do that by opening the terminal (Konsole) and running this command (replacing *user* with your username):

My personal setup includes a guide camera (QHY5 series, also known as Orion Starshoot) that does not have a driver in the mainline Fedora repositories. To enable it, ypu need to install the [qhyccd SDK][9]. (*Note that this package is not officially supported by Fedora. Use it at your own risk.)* At the time of writing, I chose to use the latest stable release, 20.08.26. Once you download the Linux 64-bit version of the SDK, to extract it:

```
tar zxvf sdk_linux64_20.08.26.tgz
```

Now change into the directory you just extracted, change the permissions of the *install.sh* file to give you execute privileges, and run the *install.sh*:

```
cd sdk_linux64_20.08.26
chmod +x install.sh
sudo ./install.sh
```

Now it’s time to install the qhyccd INDI driver. INDI is an open source software library used to control astronomical equipment. Unfortunately, the driver is unavailable in the mainline Fedora repositories, but it is in a Copr repository. (*Note: Copr is not officially supported by Fedora infrastructure. Use packages at your own risk.)* If you  prefer to have the newest (and perhaps unstable!) pieces of astronomy software, you can also enable the “bleeding” repositories at this time by following [this guide][10]. For this tutorial, you are only going to enable one repo:

```
sudo dnf copr enable xsnrg/indi-3rdparty-bleeding
```

Install the driver by running the following command:

```
sudo dnf install indi-qhy
```

Finally, update all of your system packages:

To recap what you accomplished in this sectio: you added your user to the *dialout* group, downloaded and installed the qhyccd driver, enabled the *indi-3rdparty-bleeding* copr, installed the qhyccd-INDI driver with dnf, and updated your system.

### Connecting your equipment

This is the time to connect all your equipment to your computer. Most astronomical equipment will connect via USB, and it’s really as easy as plugging each device into your computer’s USB ports. If you have a lot of equipment (mount, imaging camera, guide camera, focuser, filter wheel, etc), you should use an external powered-USB hub to make sure that all connected devices have adequate power. Once you have everything plugged in, run the following command to ensure that the system recognizes your equipment:

```
lsusb
```

You should see output similar to (but not the same as) the output here:

![][11]

You see in the output that the system recognizes the telescope mount (a SkyWatcher EQM-35 Pro) as *Prolific Technology, Inc. PL2303 Serial Port*, the imaging camera (a Sony a6000) as *Sony Corp. ILCE-6000*, and the guide camera (an Orion Starshoot, aka QHY5) as *Van Ouijen Technische Informatica*. Now that you have made sure your system recognizes your equipment, it’s time to open your desktop planetarium and telescope controller, KStars!

### Setting up KStars

It’s time to open [KStars][12], which is a desktop planetarium and also includes the Ekos telescope control software. The first time you open KStars, you will see the KStars Startup Wizard.

![][13]

Follow the prompts to choose your home location (where you will be imaging from) and *Download Extra Data…*

![][14]

![][15]

![][16]

This will allow you to install additional star, nebula, and galaxy catalogs. You don’t need them, but they don’t take up too much space and add to the experience of using KStars. Once you’ve completed this, hit *Done* in the bottom right corner to continue.

### Getting familiar with KStars

Now is a good time to play around with the KStars interface. You are greeted with a spherical image with a coordinate plane and stars in the sky.

![][17]

This is the desktop planetarium which allows you to view the placement of objects in the night sky. Double-clicking an object selects it, and right clicking on an object gives you options like *Center & Track* which will follow the object in the planetarium, compensating for [sidereal time][18]. *Show DSS Image* shows a real [digitized sky survey][19] image of the selected object.

![][20]

Another essential feature is the *Set Time* option in the toolbar. Clicking this will allow you to input a future (or past) time and then simulate the night sky as if that were the current date.

![][21]

### Configuring capture equipment with Ekos

You’re familiar with the KStars layout and some basic functions, so it’s time to move on configuring your equipment using the [Ekos][22] observatory controller and automation tool. To open Ekos, click the observatory button in the toolbar or go to *Tools* > *Ekos*.

![][23]

You will see another setup wizard: the *Ekos Profile Wizard*. Click *Next* to start the wizard.

![][24]

In this tutorial, you have all of our equipment connected directly to your computer. A future article we will cover using an INDI server installed on a remote computer to control our equipment, allowing you to connect over a network and not have to be in the same physical space as your gear. For now though, select *Equipment is attached to this device*.

![][25]

You are now asked to name your equipment profile. I usually name mine something like “Local Gear” to differentiate between profiles that are for remote gear, but name your profile what you wish. We will leave the button marked *Internal Guide* checked and won’t select any additional services. Now click the *Create Profile & Select Devices* button.

![][26]

This next screen is where we can select your particular driver to use for each individual piece of equipment. This part will be specific to your setup depending on what gear you use. For this tutorial, I will select the drivers for my setup.

My mount, a [SkyWatcher EQM-35 Pro][27], uses the *EQMod Mount* under *SkyWatcher* in the menu (this driver is also compatible with all SkyWatcher equatorial mounts, including the [EQ6-R Pro][28] and the [EQ8-R Pro][29]). For my Sony a6000 imaging camera, I choose the *Sony DSLR* under *DSLRs* under the CCD category. Under *Guider*, I choose the *QHY CCD* under *QHY* for my Orion Starshoot (and any QHY5 series camera). That last driver we want to select will be under the Aux 1 category. We want to select *Astrometry* from the drop-down window. This will enable the Astrometry plate-solver from within Ekos that will allow our telescope to automatically figure out where in the night sky it is pointed, saving us the time and hassle of doing a one, two, or three star calibration after setting up our mount.

You selected your drivers. Now it’s time to configure your telescope. Add new telescope profiles by clicking on the + button in the lower right. This is essential for computing field-of-view measurements so you can tell what your images will look like when you open the shutter. Once you click the + button, you will be presented with a form where you can enter the specifications of your telescope and guide scope. For my imaging telescope, I will enter Celestron into the *Vendor* field, SS-80 into the *Model* field, I will leave the *Driver* field as None, *Type* field as Refractor, *Aperture* as 80mm, and *Focal Length* as 400mm.

![][30]

After you enter the data, hit the *Save* button. You will see the data you just entered appear in the left window with an index number of 1 next to it. Now you can go about entering the specs for your guide scope following the steps above. Once you hit save here, the guide scope will also appear in the left window with an index number of 2. Once all of your scopes are entered, close this window. Now select your *Primary* and *Guide* telescopes from the drop-down window.

![][31]

After all that work, everything should be correctly configured! Click the *Close* button and complete the final bit of setup.

### Starting your capture equipment

This last step before you can start taking images should be easy enough. Click the *Play* button under Start & Stop Ekos to connect to your equipment.

![][32]

You will be greeted with a screen that looks similar to this:

![][33]

When you click on the tabs at the top of the screen, they should all show a green dot next to *Connection*, indicating that they are connected to your system. On my setup, the baud rate for my mount (the EQMod Mount tab) is set incorrectly, and so the mount is not connected.

![][34]

This is an easy fix; click on the *EQMod Mount* tab, then the *Connection* sub-tab, and then change the baud rate from 9600 to 115200. Now is a good time to ensure the serial port under *Ports* is the correct serial port for your mount. You can check which port the system has mounted your device on by running the command:

```
ls /dev

| grep USB
```

You should see *ttyUSB0*. If there is more than one USB-serial device plugged in at a time, you will see more than one ttyUSB port, with an incrementing following number. To figure out which port is correct. unplug your mount and run the command again.

Now click on the *Main Control* sub-tab, click *Connect* again, and wait for the mount to connect. It might take a few seconds, be patient and it should connect.

The last thing to do is set the sensor and pixel size parameters for my camera. Under the *Sony DSLR Alpha-A6000 (Control)* tab, select the *Image Info* sub-tab. This is where you can enter your sensor specifications; if you don’t know them, a quick search on the internet will bring you your sensor’s maximum resolution as well as pixel pitch. Enter this data into the right-side boxes, then press the *Set* button to load them into the left boxes and save them into memory. Hit the *Close* button when you are done.

![][35]

### Conclusion

Your equipment is ready to use. In the next article, you will learn how to capture and process the images.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/astrophotography-with-fedora-astronomy-lab-setting-up/

作者：[Geoffrey Marr][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/coremodule/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2021/02/astrophotography-setup-2-816x345.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2020/11/IMG_4151-768x1024.jpg
[3]: https://labs.fedoraproject.org/en/astronomy/
[4]: https://labs.fedoraproject.org/astronomy/download/index.html
[5]: https://github.com/FedoraQt/MediaWriter
[6]: https://docs.fedoraproject.org/en-US/fedora/f33/install-guide/install/Preparing_for_Installation/#_fedora_media_writer
[7]: https://docs.fedoraproject.org/en-US/fedora/f33/install-guide/install/Booting_the_Installation/
[8]: https://docs.fedoraproject.org/en-US/fedora/f33/install-guide/install/Installing_Using_Anaconda/#sect-installation-graphical-mode
[9]: https://www.qhyccd.com/html/prepub/log_en.html#!log_en.md
[10]: https://www.indilib.org/download/fedora/category/8-fedora.html
[11]: https://fedoramagazine.org/wp-content/uploads/2020/11/lsusb_output_rpi.png
[12]: https://edu.kde.org/kstars/
[13]: https://fedoramagazine.org/wp-content/uploads/2020/11/kstars_setuo_wizard-2.png
[14]: https://fedoramagazine.org/wp-content/uploads/2020/11/kstars_location_select-2.png
[15]: https://fedoramagazine.org/wp-content/uploads/2020/11/kstars-download-extra-data-1.png
[16]: https://fedoramagazine.org/wp-content/uploads/2020/11/kstars_install_extra_Data-1.png
[17]: https://fedoramagazine.org/wp-content/uploads/2020/11/kstars_planetarium-1024x549.png
[18]: https://en.wikipedia.org/wiki/Sidereal_time
[19]: https://en.wikipedia.org/wiki/Digitized_Sky_Survey
[20]: https://fedoramagazine.org/wp-content/uploads/2020/11/kstars_right_click_object-1024x576.png
[21]: https://fedoramagazine.org/wp-content/uploads/2020/11/kstars_planetarium_clock_icon.png
[22]: https://www.indilib.org/about/ekos.html
[23]: https://fedoramagazine.org/wp-content/uploads/2020/11/open_ekos_icon.png
[24]: https://fedoramagazine.org/wp-content/uploads/2020/11/ekos-profile-wizard.png
[25]: https://fedoramagazine.org/wp-content/uploads/2020/11/ekos_equipment_attached_to_this_device.png
[26]: https://fedoramagazine.org/wp-content/uploads/2020/11/ekos_wizard_local_gear.png
[27]: https://www.skywatcherusa.com/products/eqm-35-mount
[28]: https://www.skywatcherusa.com/products/eq6-r-pro
[29]: https://www.skywatcherusa.com/collections/eq8-r-series-mounts/products/eq8-r-mount-with-pier-tripod
[30]: https://fedoramagazine.org/wp-content/uploads/2020/11/setup_telescope_profiles.png
[31]: https://fedoramagazine.org/wp-content/uploads/2020/11/ekos_setup_aux_1_astrometry-1024x616.png
[32]: https://fedoramagazine.org/wp-content/uploads/2020/11/ekos_start_equip_connect.png
[33]: https://fedoramagazine.org/wp-content/uploads/2020/11/ekos_startup_equipment.png
[34]: https://fedoramagazine.org/wp-content/uploads/2020/11/set_baud_rate_to_115200.png
[35]: https://fedoramagazine.org/wp-content/uploads/2020/11/set_camera_sensor_settings.png
