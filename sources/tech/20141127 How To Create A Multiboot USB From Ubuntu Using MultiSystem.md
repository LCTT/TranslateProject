How To Create A Multiboot USB From Ubuntu Using MultiSystem 
================================================================================
### Introduction ###

For those who don’t know, **MultiSystem** is a small, Open Source freeware to create a multiboot usb drives from Linux systems. Using this utility, we can create any number of bootable Linux distributions in a USB drive. All you need is an Internet connection(at the time of MultiSystem installation only), and a sufficient size of a USB drive depending upon the number of distributions you want to include in that USB drive.

### Install MultiSystem On Ubuntu 14.10/14.04 ###

#### Manual Installation: ####

[Download MultiSystem][1] script, and extract it anywhere of your choice. Go to the extracted location, and run the script as shown below.

    sudo ./install-depot-multisystem.sh

#### Installation Using PPA: ####

Alternatively, you can install MultiSystem more easily using PPA as shown below.

    sudo apt-add-repository 'deb http://liveusb.info/multisystem/depot all main'
    wget -q -O - http://liveusb.info/multisystem/depot/multisystem.asc | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install multisystem

After installation, It will automatically open. Just click Close button to exit.

### Post Installation ###

Once installed, plug-in your USB key, and launch MultiSystem either from Unity Dash or Menu.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/Menu_0012.png)

At first time, the MultiSystem interface will look like below.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_002.png)

Select the USB drive, and click **Confirm** button. You may get the following error dialog box. Don’t worry, It says our USB drive has no label. Click Ok to set label by MultiSystem itself.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/Error_003.png)

Then, unplug/replug the USB key, and launch MultiSystem again. Select the USB key, and click Confirm again. Now, you’ll be asked to confirm Grub2 installation in your USB key. Click Ok to continue.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/gtkdialog_004.png)

Finally, you’ll be pleased with MultiSystem interface. Now’ it’s time to create multiboot usb key.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_005.png)

### Usage ###

MultiSystem is very simple to use. Drag the ISO of your choice into the MultiSystem window. If it doesn’t work, click on the **cd icon** on the bottom and select the ISO’s.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_006.png)

Now, MultiSystem will copy the files from the ISO, and make the USB key as bootable.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_007.png)

Likewise, you can add as many distributions as you want in your USB key. In my case, I have added two Linux distributions: CentOS 6.5 and Android.

After adding all ISO’s, you will now see the list of bootable distributions in the MultiSystem main window.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_008.png)

That’s it. Our multiboot USB key is ready to use. Reboot your system, and set the first boot device as USB in your Bios. Select the distribution you want to install, and start installing the OS from the multiboot USB key.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/QEMU_009.png)

Additionally, MultiSystem includes some extra options such as:

- Grub Settings;
- Grub & Burg bootloaders Update;
- Download Live Cds;
- VirtualBox installation;
- Format USB key;
- and many.

To view the list of additional options, navigate to the **Menus** tab of the MultiSystem.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_010.png)

Also, you can test the multiboot USB key within your Ubuntu desktop itself using QEMU or Oracle VirtualBox.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/MultiSystem_011.png)

MultiSystem tool is one of the best and useful tool ever I have tested. This tool will definitely useful for those who wants to install multiple different operating systems on their systems. You don’t have to carry your CD/DVD pouch wherever you go. Just buy a 16GB 0r 32GB USB, and dumb all Operating systems you want to install in it. and install OS like a boss.

And, the good news for Windows OS users is it supports some Windows os too. I tested Windows 7, and it’s working!

Enjoy!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/create-multiboot-usb-ubuntu-using-multisystem/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://liveusb.info/multisystem/install-depot-multisystem.sh.tar.bz2
[2]:http://liveusb.info/dotclear/