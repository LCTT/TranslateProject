How to Build Your Own Media Center with OpenELEC
============================================================

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-media-center.jpg "How to Build Your Own Media Center with OpenELECs") 


Have you ever wanted to make your own home theater system? If so, this is the guide for you! In this article we’ll go over how to set up a home entertainment system powered by OpenELEC and Kodi. We’ll go over how to make the installation medium, what devices can run the software, how to install it and everything else there is to know!


### Choosing a device

Before setting up the software in the media center, you’ll need to choose a device. OpenELEC supports a multitude of devices. From regular desktops and laptops to the Raspberry Pi 2/3, etc. With a device chosen, think about how you’ll access the media on the OpenELEC system and get it ready to use.

**Note:** as OpenELEC is based on Kodi, there are many ways to load playable media (Samba network shares, external devices, etc.).

### Making the installation disk

The OpenELEC installation disk requires a USB flash drive of at least 1 GB. This is the only way to install the software, as the developers do not currently distribute an ISO file. A raw IMG file needs to be created instead. Choose the link that corresponds with your device and [download][10] the raw disk image. With the image downloaded, open a terminal and use the command to extract the data from the archive.

**On Linux/macOS**

```
cd ~/Downloads
gunzip -d OpenELEC*.img.gz
```

**On Windows**

Download [7zip][11], install it, and then extract the archive.

With the raw .IMG file extracted, download the [Etcher USB creation tool][12] and follow the instructions on the page to install it and create the USB disk.

**Note:** for Raspberry Pi users, Etcher supports burning to SD cards as well.

### Installing OpenELEC

The OpenELEC installation process is probably one of the easiest operating systems to install. To start, plug in the USB device and configure your device to boot from the USB drive. For some, this can be accomplished by pressing the DEL key or F2\. However, as all BIOS are different, it is best to look into the manual and find out.

 ![openelec-installer-selection](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-installer-selection.png "openelec-installer-selection") 

Once in the BIOS, configure it to load the USB stick directly. This will allow the computer to boot the drive, which will bring you to the Syslinux boot screen. Enter “installer” in the prompt, then press the Enter key.

 ![openelec-installation-selection-menu](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-installation-selection-menu.png "openelec-installation-selection-menu") 

By default, the quick installation option is selected. Press Enter to start the install. This will move the installer onto the drive selection page. Select the hard drive where OpenELEC should be installed, then press the Enter key to start the installation process.

 ![openelec-installation-in-progress](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-installation-in-progress.png "openelec-installation-in-progress") 

Once done, reboot the system and load OpenELEC.

### Configuring OpenELEC

 ![openelec-wireless-network-setup](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-wireless-network-setup.jpg "openelec-wireless-network-setup") 

On first boot, the user must configure a few things. If your media center device has a wireless network card, OpenELEC will prompt the user to connect it to a wireless access point. Select a network from the list and enter the access code.

 ![openelec-sharing-setup](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-sharing-setup.jpg "openelec-sharing-setup") 

On the next “Welcome to OpenELEC” screen, the user must configure various sharing settings (SSH and Samba). It is advised that you turn these settings on, as this will make it easier to remotely transfer media files as well as gain command-line access.

### Adding Media

To add media to OpenElec (Kodi), first select the section that you want to add media to. Adding media for Photos, Music, etc., is the same process. In this guide we’ll focus on adding videos.

 ![openelec-add-files-to-kodi](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-add-files-to-kodi.jpg "openelec-add-files-to-kodi") 

Click the “Video” option on the home screen to go to the videos area. Select the “Files” option. On the next page click “Add videos…” This will take the user to the Kodi add-media screen. From here it is possible to add new media sources (both internal and external).

 ![openelec-add-media-source-kodi](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-add-media-source-kodi.jpg "openelec-add-media-source-kodi") 

OpenELEC automatically mounts external devices (like USB, DVD data discs, etc.), and it can be added by browsing for the folder’s mount point. Usually these devices are placed in “/run.” Alternatively, go back to the page where you clicked on “Add videos…” and click on the device there. Any external device, including DVDs/CDs, will show up there and can be accessed directly. This is a good option for those who don’t understand how to find mount points.

 ![openelec-name-video-source-folder](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-name-video-source-folder.jpg "openelec-name-video-source-folder") 

Now that the device is selected within Kodi, the interface will ask the user to browse for the individual directory on the device with the media files using the media center’s file browser tool. Once the directory that holds the files is found, add it, give the directory a name and press the OK button to save it.

 ![openelec-show-added-media-kodi](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-show-added-media-kodi.jpg "openelec-show-added-media-kodi") 

When a user browses “Videos,” they’ll see a clickable folder which brings up the media added from an external device. These folders can easily be played on the system.

### Using OpenElec

When the user logs in they’ll see a “home screen.” This home screen has several sections the user is able to click on and go to: Pictures, Videos, Music, Programs, etc. When hovering over any of these sections, subsections appear. For example, when hovering over “Pictures,” the subsections “files” and “Add-ons” appear.

 ![openelec-navigation-bar](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-navigation-bar.jpg "openelec-navigation-bar") 

If a user clicks on one of the subsections under a section, like “add-ons,”  the Kodi add-on chooser appears. This installer will allow users to either browse for new add-ons to install in relation to this subsection (like Picture-related add-ons, etc.) or to launch existing picture-related ones that are already on the system.

Additionally, clicking the files subsection of any section (e.g. Videos) takes the user directly to any available files in that section.

### System Settings

 ![openelec-system-settings](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-system-settings.jpg "openelec-system-settings") 

Kodi has an extensive settings area. To get to the Settings, hover the mouse to the right, and the menu selector will scroll right and reveal “System.” Click on it to open the global system settings area.

Any setting can be modified and changed by the user, from installing add-ons from the Kodi-repository, to activating various services, to changing the theme, and even the weather. To exit the settings area and return to the home screen, press the “home” icon in the bottom-right corner.

### Conclusion

With the OpenELEC installed and configured, you are now free to go and use your very own Linux-powered home-theater system. Out of all of the home-theater-based Linux distributions, this one is the most user-friendly. Do keep in mind that although this operating system is known as “OpenELEC,” it runs Kodi and is compatible with all of the different Kodi add-ons, tools, and programs.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/build-media-center-with-openelec/

作者：[Derrik Diener][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/author/derrikdiener/
[2]:https://www.maketecheasier.com/build-media-center-with-openelec/#comments
[3]:https://www.maketecheasier.com/category/linux-tips/
[4]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fbuild-media-center-with-openelec%2F
[5]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fbuild-media-center-with-openelec%2F&text=How+to+Build+Your+Own+Media+Center+with+OpenELEC
[6]:mailto:?subject=How%20to%20Build%20Your%20Own%20Media%20Center%20with%20OpenELEC&body=https%3A%2F%2Fwww.maketecheasier.com%2Fbuild-media-center-with-openelec%2F
[7]:https://www.maketecheasier.com/permanently-disable-windows-defender-windows-10/
[8]:https://www.maketecheasier.com/repair-mac-hard-disk-with-fsck/
[9]:https://support.google.com/adsense/troubleshooter/1631343
[10]:http://openelec.tv/get-openelec/category/1-openelec-stable-releases
[11]:http://www.7-zip.org/
[12]:https://etcher.io/
