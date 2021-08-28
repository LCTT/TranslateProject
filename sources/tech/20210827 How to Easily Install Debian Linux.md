[#]: subject: "How to Easily Install Debian Linux"
[#]: via: "https://itsfoss.com/install-debian-easily/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "guevaraya "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Easily Install Debian Linux
======

Installing Debian could be easy or complicated depending upon the ISO you choose.

If you go with the default ISO provided by the Debian website, you’ll have a hard time installing Debian. You’ll be stuck at a screen that asks for network drivers to be installed from external removable media.

![Installing Debian from default ISO is problematic for new users][1]

You may, of course, troubleshoot that, but it makes things unnecessarily complicated.

Don’t worry. Let me show the steps for installing Debian comfortably and easily.

### The easy way of installing Debian as a desktop

Before you see the steps, please have a look at things you need.

  * A USB key (pen drive) with at least 4 GB in size.
  * A system with internet connection (could be the same system where it will be installed).
  * A system where you’ll be installing Debian. It will wipe out everything on this system so please copy your important data on some other external disk.



What kind of system specification you should have for Debian? It depends on the [desktop environment][2] you are going to use. For example, GNOME desktop environment could work on 4 GB RAM but it will work a lot better on an 8 GB RAM. If you have 4 GB or less, try using KDE, Cinnamon or Xfce desktops.

Debian also has both [32-bit and 64-bit architecture][3] support. You’ll have to get the Debian ISO according to your processor architecture.

Your system should have at least 25 GB of disk space to function. The more, the merrier.

Warning!

This method removes all the other operating systems along with the data present on the disk.

You may save your personal files, documents, pictures etc on an external USB disk or cloud storage if you want to use it later.

In this tutorial, I am going to show the steps for installing Debian 11 Bullseye with GNOME desktop environment. The steps should be the same even if you choose some other desktop environment.

_**This tutorial is tested on a UEFI system with GPT partitioning. If you have [MBR instead of GPT][4] or [legacy BIOS instead of UEFI][5], the live USB creation step will be different.**_

#### Step 1: Getting the correct Debian ISO

Half of the battle in installing Debian is choosing the correct ISO. Surprisingly, it is really difficult to navigate through its website and find that ISO which is the easiest for a new Debian user.

If you click the Download button on the [homepage of Debian website][6], it downloads a minimal net install file which will be super complicate for a regular user. Please DO NOT use this.

Instead, you should go for the live ISO. But here is a catch, there are separate live versions with non-free software (includes drivers for your networking hardware).

You should download this non-free live ISO. Another problem here is that you won’t get it mentioned prominently on the website and there are various URLs for torrents or direct downloads for various architecture.

Let me link them here.

[Main repo for 32 and 64 bit][7]

[Debian 11 Direct][8]

[Debian 11 Torrent][9]

You’ll see several files with the of desktop environment mentioned in the filename. Choose the one with desktop environment of your choice. For direct downloads, click on the links that end with .iso.

![Downloading the Debian Live Non-free ISO][10]

Once you have the appropriate ISO downloaded, the rest is standard procedure that you may have experienced with other Linux distributions.

#### Step 2: Creating live USB of Debian

Plug in the USB into your system. It will be wise to format it just for the sake of it. It will be formatted anyway.

You can use any live USB creation tool of your choice. If you are using Windows, go with Rufus. I am going to use Etcher here because it is available for both Windows and Linux.

Download Etcher from its website.

[Download Etcher][11]

I have a dedicated [tutorial on using Etcher in Linux][12] and thus I am not going to go in detail here. Just run the downloaded executable file, browse to the Debian ISO, make sure that correct USB is selected and then hit the Flash button.

![Creating Live Debian USB with Etcher][13]

It may take a couple of minutes to create the live USB. Once that is ready, it is time to boot from it.

#### Step 3: Boot from the live USB

Restart the system where you want to install Debian. When it is showing the manufacturer’s logo, press F2/F10 or F12 key to access the boot settings. You may also [access the UEFI firmware settings from Windows.][14]

Some systems do not allow booting from live USB if secure boot is enabled. If that is the case, please [disable secure boot from the BIOS settings][15].

The screen may look different for different manufacturers.

![][16]

Once you make the change, press F10 to save and exit. Your system will boot once again.

Again, press F2/F10 or F12 to access the boot settings when it shows the manufacturer’s logo. You should see the option to boot from the USB. Select it.

![][17]

It takes a little bit of time and then you should see a screen like this. Go with the first option here.

![Debian live boot screen][18]

#### Step 4: Start Debian installation

When you enter the live Debian session, it may show some welcome screen with option to choose your keyboard and language if you are using GNOME desktop. Just hit next when you see those screens.

![Debian live welcome screen][19]

Once you are past the welcome screen, press the Windows/Super key to bring the activity area. You should see the Debian install button here.

![Start Debian Installation][20]

It opens the friendly [Calamares graphical installer][21]. Things are pretty straightforward from here.

![Debian 11 Calamares graphical installer][22]

It asks you to select your geographical location and time zone.

![Select your location and time zone][23]

On the next screen, you’ll be asked to select the keyboard. Please **pay attention** here. Your keyboard is automatically selected based on your location. For example, I had used India as my location and it automatically set the default Indian keyboard with Hindi language. I had to change it to English India.

![Choosing keyboard layout][24]

The next screen is about the disk partition and where you would like to install Debian. In this case, you are going to install Debian as the only operating system on your computer.

The easiest option would to go with ‘Erase disk’ option. Debian will put everything under root except the mandatory ESP partition and Swap space. In fact, it shows what your disk would like after your chosen installation method.

![Disk partitioning][25]

If you want to take matter in your hands, you may also opt for manual partitioning and choose how much you want to allot to root, home, boot or swap. Only do that when you know what you are doing.

On the next screen, you have to provide the username and password. It does not set root password and keeps it empty.

![Set Username and password][26]

This also means that you can use sudo with the newly created user. In the ‘complicated Debian install’, you could also set root password but then you’ll have to add the normal user to sudoer list manually. See, this installation method is easier for beginners, right?

Before it goes on with the actual installation, it presents you with a summary of the choices you have made. If things look good, hit the install button.

![Summary of your installation choices][27]

Now it is just a matter of waiting for the installation to finish.

![Installing Debian][28]

It takes a few minutes to complete the installation. When the installation finishes, it asks for a restart.

![Finished Debian installation][29]

Restart your system and if everything goes well, you should see the grub screen with Debian.

![Debian boot screen][30]

### Troubleshooting tip (if your system does not boot into Debian)

In my case, my Dell system did not recognize any operating system to boot. This was weird because I had see Debian creating an ESP partition.

If it is the same case with you, go to BIOS settings. Check the boot sequence. If you do not see anything, click on the Add boot option.

![Add new boot option][31]

It should give you an option to add an EFI file.

![Browse to EFi file][32]

Since Debian created ESP partition during installation, there is an EFI directory created with necessary files.

![Select EFI directory][33]

It should show a Debian folder along with some other folders. Select Debian folder.

![Select Debian][34]

In this Debian folder, you’ll find files like grubx64.efi, shimx64.efi. Select shimx64.efi.

![Select shim.efi][35]

You may give this file an appropriate name. The final screen may look like this.

![Adding the new boot option with efi file][36]

Now, you should have this boot option. Since I named it Debian, it shows two Debian boot options (one of them coming from the efi file I guess). Press F10 to save and exit the BIOS settings.

![New boot option added][37]

When your system boots now, you should see the grub screen with Debian boot option. You can start enjoying Debian now.

![][30]

### Were you able to install Debian?

I hope I made things simpler here. It is not that you cannot install Debian from the default net installer ISO. It just takes (a lot) more effort.

Was this tutorial helpful for you in installing Debian? Are you still facing issues? Please let me know in the comment section and I’ll try to help you out.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-debian-easily/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Debian-firmware.png?resize=800%2C600&ssl=1
[2]: https://itsfoss.com/what-is-desktop-environment/
[3]: https://itsfoss.com/32-bit-64-bit-ubuntu/
[4]: https://itsfoss.com/check-mbr-or-gpt/
[5]: https://itsfoss.com/check-uefi-or-bios/
[6]: https://www.debian.org/
[7]: https://cdimage.debian.org/images/unofficial/non-free/images-including-firmware/11.0.0-live+nonfree/
[8]: https://cdimage.debian.org/images/unofficial/non-free/images-including-firmware/11.0.0-live+nonfree/amd64/iso-hybrid/
[9]: https://cdimage.debian.org/images/unofficial/non-free/images-including-firmware/11.0.0-live+nonfree/amd64/bt-hybrid/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/downloading-Debian-live-non-free-iso.png?resize=800%2C490&ssl=1
[11]: https://www.balena.io/etcher/
[12]: https://itsfoss.com/install-etcher-linux/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/creating-live-debian-usb-with-etcher-800x518.png?resize=800%2C518&ssl=1
[14]: https://itsfoss.com/access-uefi-settings-windows-10/
[15]: https://itsfoss.com/disable-secure-boot-windows/
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8.jpg?resize=700%2C525&ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/boot-from-windows-disk-ventoy.jpg?resize=800%2C611&ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/debian-live-boot-screen.png?resize=617%2C432&ssl=1
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/debian-live-welcome-screen.png?resize=800%2C450&ssl=1
[20]: https://itsfoss.com/wp-content/uploads/2021/08/start-Debian-installation-800x473.webp
[21]: https://calamares.io/
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-1.png?resize=800%2C441&ssl=1
[23]: https://itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-2-800x441.webp
[24]: https://itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-4-800x441.webp
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-5.png?resize=800%2C441&ssl=1
[26]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-6.png?resize=800%2C441&ssl=1
[27]: https://itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-7-800x500.webp
[28]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-8.png?resize=800%2C500&ssl=1
[29]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-9.png?resize=800%2C500&ssl=1
[30]: https://itsfoss.com/wp-content/uploads/2021/08/debian-boot-screen.webp
[31]: https://itsfoss.com/wp-content/uploads/2021/08/add-new-boot-option.webp
[32]: https://itsfoss.com/wp-content/uploads/2021/08/add-efi-file-for-boot-option.webp
[33]: https://itsfoss.com/wp-content/uploads/2021/08/select-efi-file-boot-option.webp
[34]: https://itsfoss.com/wp-content/uploads/2021/08/select-debian-folder-for-uefi.webp
[35]: https://itsfoss.com/wp-content/uploads/2021/08/select-shim-boot.webp
[36]: https://itsfoss.com/wp-content/uploads/2021/08/new-boot-option.webp
[37]: https://itsfoss.com/wp-content/uploads/2021/08/new-boot-option-added.webp
