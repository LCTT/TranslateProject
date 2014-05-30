Translating by  CHINAANSHE 

How To Install Linux On A MacBook Pro Retina
================================================================================
![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/linux-macbook-pro-retina-840x420.jpg?ec7b17)

MacBook Pros come with some very nice hardware, but some people want more. Some people want Linux.

Whether you’d like a more open and customizable operating system or simply need to dual-boot in order to access certain software, you might want Linux on your MacBook. The thing is, MacBook Pros are also pretty closed-down pieces of hardware that make installing other operating systems difficult – Linux more so than Windows. Boot Camp won’t help you with Linux, even though it doesn’t mean it’s impossible. Here’s how to do it.

### Why Install Linux On A MacBook Pro Retina? ###

The reasoning for installing Linux on a MacBook Pro might seem a bit strange at first – isn’t OS X one of the main reasons to get a Mac? That might be true, but another great reason to get a Mac is the hardware. They offer excellent performance, superb battery life, and long durability. For the ones with a Retina display, you’re also wanting a HiDPI experience for ultra-crisp photos and text.

But if you don’t like Mac OS X, or simply need to use Linux, you may want to put another operating system on that Mac hardware. Linux is lean, open, and highly customizable. Who says that you can’t bring the two together in a happy marriage? Well, Apple might have a word to say about that, but you probably don’t care anyways.

Note: For the purposes of this tutorial, we’ll be using Ubuntu, the [most popular Linux distribution][1], as our preferred choice. You’re free to choose a different distribution, but you can then only follow these steps are generic guidelines and not exact instructions. We claim no responsibility for any damage that is done to your system. Additionally, this tutorial assumes that you want to dual-boot between Linux and Mac OS X. It’s recommended to keep Mac OS X on the hard drive so that you can update the firmware if needed — something you cannot do in Linux.

Before we even start with the first step, make sure that your computer is backed up in case anything goes wrong. How you do this is up to you, so feel free to use Time Machine, CrashPlan, or whatever else you might prefer.

### Download Ubuntu ###

First, you’ll want to get a [copy of the Ubuntu desktop ISO image][2]. Be sure to choose the 64-bit desktop flavor, and not the image made for Macs. The regular image can boot up in BIOS and EFI modes, while the Mac image can only boot up in BIOS mode. This was done on purpose for some Macs, but we want to be able to boot it up in EFI mode.

### Write to USB Drive ###

Next, grab a USB flash drive that is at least 2GB large – we’ll use this to boot up the Ubuntu installer on. To make this drive you can follow [the official Ubuntu steps][3], or [use the dedicated GUI tool for the job][4].

### Resize Partitions ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/mac_linux_disk_utility.jpg?ec7b17)

nce you’ve done that, you can get your MacBook Pro ready for the installation. Open up the Disk Utility, click on your hard drive on the left side, and then choose the Partitions tab. Resize the Mac partition to whatever size you’d like it to be — we’ll use the newly created free space to install Ubuntu.

### Boot Up Ubuntu Image ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/mac_linux_boot.jpg?ec7b17)

After that’s completed, plug in the USB flash drive you prepared and restart your MacBook Pro. Be sure to hold down the Options button from when the screen blanks out for a second to when you see a screen with various boot options. Choose the EFI option (the left one in case you see two of them) to boot up your Ubuntu USB flash drive.

When prompted to choose between “Try Ubuntu” and “Install Ubuntu”, choose “Try Ubuntu” because we’ll need to perform a step after the installer completes but before you restart the system.

### Installer ###

Once the Ubuntu desktop loads, start the installer and go through it normally until you reach the partitioning step. If you cannot access WiFi, it’s because Ubuntu currently doesn’t recognize your WiFi chipset. Don’t worry – we don’t need to have Internet access right now, and it’ll detect the right driver to use whenever you boot up into your new installation later on.

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/mac_linux_installer_partitions.jpg?ec7b17)

Once you come to the partitioning step, choose to “Do something else”. Then, make sure that the small partition that’s ~128MB large is recognized as an EFI boot partition (you can check by clicking on it and choosing Options; additionally, that should be /dev/sda1). Next, you can create an ext4 partition in the new space and have the path “/” be mounted to it. You can also create multiple partitions here if you prefer that and know what you’re doing.

Before you continue to the next step, make sure that the bootloader installation location says /dev/sda1, as you want GRUB to be installed into that partition. Then, finish off the installation like normal.

### EFI Boot Fix ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/mac_linux_efibootmgr.jpg?ec7b17)

When the installer completes, don’t restart just yet! We still need to do one more thing so that we’ll be able to use GRUB. Run the following command: 

    sudo apt-get install efibootmgr

This will temporarily install a configuration tool for EFI boot setups. Next, run

    sudo efibootmgr

This will print out the current boot configuration to your screen. In this, you should be able to see “ubuntu” and “Boot0000*”. Currently, the EFI system will point to Boot0080*, which skips GRUB and goes directly to Mac OS X. To fix this, run the command

    sudo efibootmgr -o 0,80`

Now you can restart!

Congratulations! Your Ubuntu installation should now be working! However, there are a few tweaks that you can perform to have a better experience.

### Various Tweaks ###

First, you’ll need to make a quick change to a GRUB setting so that the SSD won’t occasionally freeze. Type

    sudo nano /etc/default/grub

in a terminal, and then find the line with **GRUB_CMDLINE_LINUX** and change it to **GRUB_CMDLINE_LINUX="libata.force=noncq"**. Hit CTRL+X to save, and Y then Enter to confirm. Then, you’ll want to type

    sudo nano /etc/grub.d/40_custom

into the terminal, which will open up a new file. In it, type this exactly:

    menuentry "Mac OS X" {
    exit
    }

This will allow you to boot into your Mac OS X installation (the 32-bit and 64-bit entries in GRUB do not work). Do the same thing to save and exit, then type in

    sudo update-grub

for the changes to go into effect. Finally, restart your system for good measure.

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/mac_linux_small_retina.jpg?ec7b17)

As you can see, everything is ridiculously small on the Retina display. To fix this, System Settings –> Display and change the scaling factor to something larger. On the Retina screen, everything will look extremely tiny and it will make your life much more difficult if you don’t change it to something you like.

You may also find that it’s difficult to grab the edges of a window for resizing. This can also be changed. Type

    sudo nano /usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml

into a terminal, and then change these values appropriately:

    <distance name="left_width" value="4"/>
    <distance name="right_width" value="4"/>
    <distance name="bottom_height" value="4"/>

If that’s not big enough, you can also change those values to “6″ instead.

Finally, if you experience any washed out colors, you can grab the display color profile from Mac OS X and use it in Ubuntu. Mount your Mac OS X drive and navigate to

    /Library/ColorSync/Profiles/Displays/Color LCD-xxxxxx.icc

where xxxxxx is some random string (there should only be one file anyways, but this string gets randomized). Copy it into your Ubuntu home folder, and then go to System Settings –> Color and choose Add New Profile and choose the profile you saved in your home folder.

### Conclusion ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/mac_linux_final.jpg?ec7b17)

Congratulations! You now have a great working Linux installation on your MacBook Pro Retina! Feel free to make additional tweaks to [make Ubuntu feel more like home][5]. I’m sure that these instructions can be applied to other Mac systems, but each new release has its own pitfalls and advantages. If you use a different machine, it’s a good idea to look up some documentation first, such as [this][6] for Ubuntu.

Additionally, feel free to check out [other great Linux distros][7] that you can install to your Mac!

Have you installed Linux on a Mac? What problems did you encounter and how did you solve it? Let us know in the comments!

Image Credits: [K?rlis Dambr?ns][8] Via Flickr

--------------------------------------------------------------------------------

via: http://www.makeuseof.com/tag/install-linux-macbook-pro/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.makeuseof.com/tag/windows-xp-users-switch-ubuntu-14-04-lts-trusty-tahr/
[2]:http://www.ubuntu.com/download/desktop/
[3]:http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-mac-osx
[4]:http://www.makeuseof.com/tag/how-to-boot-a-linux-live-usb-stick-on-your-mac/
[5]:http://www.makeuseof.com/tag/11-tweaks-perform-ubuntu-installation/
[6]:https://help.ubuntu.com/community/MacBookPro
[7]:http://www.makeuseof.com/pages/best-linux-distributions
[8]:https://www.flickr.com/photos/janitors/10037346335
