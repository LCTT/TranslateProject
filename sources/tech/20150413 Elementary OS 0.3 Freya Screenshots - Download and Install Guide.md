Elementary OS 0.3 Freya Screenshots - Download and Install Guide
================================================================================
Elementary OS is a light weight Ubuntu based operating system which is getting wide spread popularity. It has three versions released to date whereas fourth version is decided to be developed based on upcoming Ubuntu 16.04.

- **Jupiter (0.1)**: It was the first stable version of Elementary OS based on Ubuntu 10.10 and released on March 2011.
- **Luna (0.2)**: Second stable version of Elementary OS based on Ubuntu 12.04 and released on November 2012.
- **Freya (0.3)**: Third stable version of Elementary OS based on Ubuntu 14.04 and released on 8th February 2015.
- **Loki (0.4)**: Fourth upcoming version of Elementary OS is planned to be based on Ubuntu 16.04 it will get updates till 2021.

Freya is the latest version (0.3) of Elementary OS available now, initially it was given the name ISIS but it was later changed to avoid any sort of association with a terrorist group named alike. Freya has some very nice preloaded applications.

### Salient Features ###

Here are some but not all of the features of Elementary OS 0.3.

- Better interactive notifications along with notification setting pane including a system-wide “Do Not Disturb” mode
- Latest version of Elementary OS provides a better emoji support & drop-in replacements for Microsoft Core fonts for the web applications
- Privacy Mode is a new firewall tool which is easy to use and helps protect the computer from harmful scripts and applications
- Unified login and lock screens
- Applications menu with and improved look and functionality including quicklist actions, drag-and-drop from search, and support for quick math calculations
- Multitasking view is redesigned to provide more app-focused utility
- Updated software stack (Linux 3.16, Gtk 3.14, and Vala 0.26) for better support and enhanced functionality of latest developed applications
- Unified extensible firmware interface (UEFI) support
- WiFi connectivity made easier through new captive portal assistant

### Download 64 bit & 32 bit Version ###

- [Elementary OS Freya 64 bit][1]
- [Elementary OS Freya 32 bit][2]

### Installing Elementary OS 0.3 (Freya) ###

Download the ISO file of Elementary OS 0.3 and flash it on a bootable USB drive or to a DVD/CD. Source is available for both 32-bit and 64-bit architectures. Once the computer is booted with the Elementary OS ISO file, there are two options available, either to try without installing or install Elementary OS on the computer, choose the second option. Elementary OS can also be installed along with an already installed operating system, turning it into a dual boot machine.

![Install Freya](http://blog.linoxide.com/wp-content/uploads/2015/04/Install-Freya.png)

System requirements and available resources are checked before proceeding further. Click continue if your system has enough resources.

![Installation Requirements](http://blog.linoxide.com/wp-content/uploads/2015/04/Installation-Requirements.png)

Installation wizard then provides various installation types. Opt for the option best suits you, normally, first option is chosen by most i.e. “Erase disk and install Elementary”.  With this option make sure that your data is backed up properly because the disk (partition) will be erased and all data will be lost.

![Installation Types](http://blog.linoxide.com/wp-content/uploads/2015/04/Installation-Types.png)

A dialog box shows the list of disk partitions being formatted and used by the Elementary OS, after ensuring data integrity click continue.

![Format Warning](http://blog.linoxide.com/wp-content/uploads/2015/04/Format-Warning.png)

Choose your location for time zone selection and click continue.

![Location](http://blog.linoxide.com/wp-content/uploads/2015/04/Location.png)

Choose your language and click continue.

![Language](http://blog.linoxide.com/wp-content/uploads/2015/04/Language.png)

Fill in your information and choose a strong root/administrator password and click continue.

![whoareyou](http://blog.linoxide.com/wp-content/uploads/2015/04/whoareyou.png)

Core installation process starts once the personal information is provided, details of components being installed will be flashing on a little dialogue box along with the progress bar.

![Installation progress](http://blog.linoxide.com/wp-content/uploads/2015/04/Installation-progress.png)

Congratulation! Installation is complete for your latest Elementary OS 0.3 (Freya). A restart  is required to update and finalize registries and configurations.

![Installation Complet](http://blog.linoxide.com/wp-content/uploads/2015/04/Installation-Complet.png)

At start up the Elementary OS logo shows its elegance and then password protected administrator login and guest session options will appear. Guest section has pretty limited features and has no installation privileges.

![Login](http://blog.linoxide.com/wp-content/uploads/2015/04/Login.png)

Here is the first look of the newly installed Elementary OS 0.3.

![first look](http://blog.linoxide.com/wp-content/uploads/2015/04/first-look.png)

### Customizing Desktop ###

While Elementary OS 0.3 is best known for their light weight and better looks, everybody has a unique esthetic sense and computer usage habits. Desktop reflects a personalized view of any computer user. Like other operating systems Elementary OS 0.3 also provides various options to customize our desktop through wallpapers, font sizes, themes etc.

For basic customization, click on Applications > System Settings > Desktop

We can change wallpapers, dock and make use of hot corners of the desktop.

Very few wallpapers are provided by default, more can be downloaded from the internet or transferred to your own camera.

![Desktop Wallpaper](http://blog.linoxide.com/wp-content/uploads/2015/04/Desktop-Wallpaper4.png)

The real beauty of Elementary OS lies in its elegant Dock panel. With no icons allowed at desktop, a set of application icons at the dock panel enhance the look and provide a quick way to lunch frequently used applications.

![Desktop Dock](http://blog.linoxide.com/wp-content/uploads/2015/04/Desktop-Dock1.png)

Users can use the corners of the desktop for customary purposes.

![Hot Corners](http://blog.linoxide.com/wp-content/uploads/2015/04/Hot-Corners.png)

Advanced customization can be achieved through the installation of elementary tweaks.

Add stable Personal Package Archive (PPA) to Advanced Package Tool (APT) repository using the following command.

    sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily

![ppa](http://blog.linoxide.com/wp-content/uploads/2015/04/elementary-tweaks-ppa.png)

Once the package has been added to the repository we need to update the repository using following command

    sudo apt-get update

![update repository](http://blog.linoxide.com/wp-content/uploads/2015/04/update-repository.png)

After updating the repository we are ready to install inkscape which is accomplished using the following command

    sudo apt-get install elementary-tweaks

![install elementary tweaks](http://blog.linoxide.com/wp-content/uploads/2015/04/install-elementary-tweaks.png)

We can see an addition of Tweaks option under Applications > System Settings under the Personal section. It now provides us more options to customize our desktop view.

![tweaks](http://blog.linoxide.com/wp-content/uploads/2015/04/tweaks.png)

For further customizations we also install gnome tweak tool for example unlocking the desktop.

    sudo apt-get install gnome-tweak-tool

![gnome](http://blog.linoxide.com/wp-content/uploads/2015/04/gnome.png)

### Summary ###

Elementary OS is closely related to Ubuntu distro of Linux and its pros and cons are pretty much similar too. Elementary OS is lightweight, elegant in look and feel, rapidly maturing. It is potentially an alternative for both Windows and OS X operating systems.  The latest available Elementary OS 0.3 (Freya) is getting very popular with a better feature base. For further reading, latest updates and downloads please visit the official [website][1].

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/elementary-os-0-3-freya-install-guide/

作者：[Aun Raza][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:http://sourceforge.net/projects/elementaryos/files/stable/elementaryos-freya-amd64.20150411.iso/download
[2]:http://sourceforge.net/projects/elementaryos/files/stable/elementaryos-freya-i386.20150411.iso/download
[3]:http://elementary.io/