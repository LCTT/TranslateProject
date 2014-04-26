How to Dual Boot Android 4.4.2 and Ubuntu for Phones
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Hot-to-Dual-Boot-Android-4-4-2-and-Ubuntu-for-Phones-438840-2.jpg)

**Testing Ubuntu for phones is now even simpler with an application that is capable of installing the new operating system from Canonical without having to delete Android. Getting a dual boot system in place will perhaps turn the attention of even more users towards the new open source platform for mobiles and tablets.**

Canonical has a simple procedure explained on its website on how to install Ubuntu for phones, but that implies deleting Android and getting the new operating system in place. The Ubuntu developers have done a great job so far and the new OS is looking great, but if you decide to return to Android, you will need to delete Ubuntu and install Google’s OS. That means that you will have to set up the phone all over again, which can be bothersome.

Fortunately, there is a solution for this problem and it's called [MultiROM Manager][1], an application developed by Vojtech Bocek. It's available on Google Play and will only work on Nexus 7 (2012 & 2013), Nexus 4, and Nexus 5.

On the other hand, Ubuntu Touch only works on Nexus 4 Phone (mako), Nexus 7 (2013) Tablet (flo), and Nexus 10 Tablet (manta), so unless you have one of these devices, you won't be able to safely do this procedure (it might work, but there are no guarantees and you might brick the device and/or lose all your data.)

First of all, you will need an unlocked phone, which shouldn't be a problem since you already have a Nexus device. You will also have to be root in Android so that you can install the operating system from inside the application itself.

A number of tools will be necessary for this work. First off all, you will need to install ADB (Android Debug Bridge), which is provided by Canonical along with some of its tools. You will have to run a few commands in a terminal:

    sudo add-apt-repository ppa:phablet-team/tools
    sudo apt-get update
    sudo apt-get install ubuntu-device-flash

Now, you will need to download two packages, [TWRP 2.7.0.0][2] and [SuperSU][3] binary, which will actually make you root. Copy the SuperSU binary zip to the phone's memory. Run this command to go to the bootloader:

    sudo reboot bootloader

Unzip the TWRP files on your computer and install the images with the following command (replace recovery.img with the name of the file you have downloaded):

    fastboot flash recovery recovery.img

Navigate from the bootloader menu to recovery and you will now have TWRP 2.7.0.0 in place. Run TWRP and install the SuperSU binary, followed by a reboot.

You now have root access in Android. Install MultiROM Manager, apply the patches, and download Ubuntu for phones. The application will ask for root access and the installation will go on smoothly. When you reboot you will be prompted with a small screen that allows you to choose what system you want to run. Choose Ubuntu and you are good to go.

Enjoy!

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Hot-to-Dual-Boot-Android-4-4-2-and-Ubuntu-for-Phones-438840.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://play.google.com/store/apps/details?id=com.tassadar.multirommgr
[2]:http://teamw.in/project/twrp2
[3]:http://androidsu.com/superuser/