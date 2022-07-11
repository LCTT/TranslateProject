[#]: subject: "Beginner’s Guide to Installing Arch Linux on VirtualBox"
[#]: via: "https://itsfoss.com/install-arch-linux-virtualbox/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "hanszhao80"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Beginner’s Guide to Installing Arch Linux on VirtualBox
======

[Arch Linux is hugely popular][1] in the desktop Linux world. One of the reasons for the popularity is that [installing Arch Linux][2] itself is a complicated task.

I am not exaggerating. Installing [Ubuntu or Debian][3] is a lot easier task than Arch Linux because it doesn’t have an official GUI based installer. And this is where virtual machines come in.

You can try installing Arch Linux in VirtualBox first and see if it’s something you would like to run on actual hardware. This way, you get to experience Arch Linux without disturbing your current operating system.

In this article, I will be guiding you through the steps to install a functional Arch Linux virtual machine.

### Installing Arch Linux on VirtualBox

Undoubtedly, you need to first [install VirtualBox on Linux][4] or Windows. On Windows, simply go to the Oracle’s website and download VirtualBox.

[Download VirtualBox][5]

If you are using Windows 10 or newer version, please ensure that you have virtualization enabled on your system.

Once done, you need to head to [Arch Linux’s official website][6] to download the ISO file. You should find options to [download using torrent][7] or download the file directly.

![][8]

Hold on to the ISO file when needed, you can delete it to [free space on your system][9] after successful installation.

Now, let us begin installing Arch Linux on VirtualBox.

#### Part 1. Creating the Virtual Machine

**Step 1:** First, you need to set up a few things in VirtualBox. Launch VirtualBox and click on “**New**” to create a virtual machine.

![][10]

Note that you can continue creating the virtual machine using the guided mode, but you get more options at a single glance with the expert mode.

![][11]

Hence, I recommend using the expert mode to create the virtual machine.

Fret not, the expert mode is as easy, with just a bit of extra available options and nothing else to worry about.

**Step 2**: Enter the name of your virtual machine, it should auto-detect the “Type” and “Version” respectively when you type in “**Arch Linux**” in the name field.

![][12]

You should increase the memory size to use the virtual machine comfortably. If it is just for minor testing, you can go ahead with the default setting.

In my case, I allocate ~**4 GB of RAM**.

Also, make sure to **create a virtual hard disk** under the “Hard disk” option. It should be the selected option by default.

Now, proceed to set the virtual hard disk size.

**Step 3:** You can choose a preferred location path for the virtual hard disk and tweak the size as per your requirements. The installation should not be a problem with the minimum allocated size (8 GB), but to be on the safe side, you may want to allocate at least 10-15 GB.

![][13]

Next, you need to select the hard disk file type as “**VDI (VirtualBox Disk Image)**” and the storage as “**Dynamically allocated**,” as shown in the image above.

VDI is the most common hard disk type for the virtual hard disk.

And, when you select the “**Dynamically allocated**” option for the hard disk storage, it means that the storage space will be utilized as per usage. In other words, 15 GB of space won’t be locked from your disk as soon as the virtual machine is created.

Now, all you have to do is hit “**Create**” to add the virtual machine.

#### Part 2. Adding the ISO File to Start Installing Arch Linux

![][14]

Once the VM has been listed, you can look at its configuration and select the ISO as the disk drive under the **Storage** option.

You can also separately head to the virtual machine settings to explore more and choose the ISO file.

![][15]

To do that, navigate your way to the “**Storage**” setting of the VM.

![][16]

Here, you will have to click on the “**Empty**” device under Controller and then proceed to select the Arch Linux ISO file as the disk file (as shown in the image above).

![][17]

Once you select it, hit “**OK**” to save the changes to your setting.

Here’s how the virtual machine setting should look like with the ISO set as the disk to boot:

![][18]

Now, hit “**Start**” to start the VM and get started with the installation.

#### Part 3. Installing Arch Linux using the Guided Installer

Arch Linux has made the installation easier by [introducing a guided installer][19], i.e., it gives you all the options you need to set up a full-fledged Arch Linux system.

So, with the help of a guided installer, you do not have to install a desktop environment and other essential packages yourself separately. All you have to do is follow the onscreen instructions and choose the options suitable for your installation.

In this article, we focus on the guided installer. If you want to do things yourself, you should follow our [Arch installation guide][2].

Moving on to the installation, when you start the VM, you will be looking at this screen:

![][20]

The first option is the ideal way of proceeding. If you have a specific requirement, you can choose other options to boot up Arch Linux.

Now, you should be looking at a terminal window. Here’s how to get started:

**Step 1**: Type in “**archinstall**” to initiate installation using the guided installer.

![][21]

**Step 2:** Choose a keyboard layout as per your requirements, selecting a US layout should be the most common choice. Just type in a number to make the selection, as shown in the image below (for instance, 26).

![][22]

**Step 3:** Next, you need to select a region to download packages.

![][23]

Choosing a preferred region instead of “Worldwide” is crucial because it downloads many unnecessary packages if you select “**Worldwide**” as your region.

**Step 4:** Once you select the region, it will ask you to choose the drive for installation. In this case, we already created a virtual drive of ~15 GB displayed as **/dev/sda**.

Similarly, check for the drive you created as per the size and choose that disk to proceed. Here, I type in **1** as the input; yours can differ.

![][24]

**Step 5:** For the next set of steps, you will be asked the following:

  * **Select a filesystem type**
  * **Encryption password** (optional)
  * **Hostname**
  * **Create root password** (optional)
  * **Creating a super-user**
  * **Choose a pre-programmed profile**



![][25]

In my test, I chose BTRFS as the filesystem without setting any disk encryption password.

The hostname can be anything of your choice, but I’d suggest keeping it short.

You may choose to create a root password, but it shouldn’t be an issue if you do not. However, you need to create a superuser with Sudo privileges.

I used “**admin**” and “**pass**” as the user and the password, respectively. But, you should not use easy-to-guess credentials if you do not want anyone else to access the VM on your computer.

And, then, you will be shown a choice to select a profile. In this case, we want a full-fledged Arch Linux desktop. So, we choose “**desktop**” by typing in **0**.

**Step 6:** Next, you will be asked to choose a desktop environment. I decided to proceed with KDE. You can select anything else you like.

![][26]

**Step 7**: To finalize, you will be asked to choose the graphics card driver. Here, we install Arch Linux on VirtualBox, so you can select option 4 as “**VMware/VirtualBox**,” as shown in the image below.

![][27]

You may also be asked to choose pipewire instead of PulseAudio for audio with a “Yes (y) or No (no)” response. Any of those should serve the purpose.

****Step 8:**** Next comes an important step. Here, you can choose to go with **linux-lts** if you need the LTS version of the kernel, or else proceed with the default.

![][28]

The installer will prompt you to explicitly install any packages required. In this case, we do not have any specific requirements, so we will leave it blank and press enter to skip.

**Step 9:** To enable internet access, you will be asked to select the required network adapter. You will have to choose the option:

**Use network manager to control and manage your internet connection**

![][29]

**Step 10:** The timezone needs to be defined in the next step. Choose what applies to you, or continue with the default option.

**Step 11:** Once done, it will display most of the options you selected as confirmation. Press **Enter** to continue.

![][30]

**Step 12:** It will take a few minutes for the installation to complete, depending on your internet connection speed.

After the installation is complete, it will ask you to **chroot into a newly created installation for post-installation configuration**, but we don’t need that. So, type in “**N**” to complete the installation.

**Step 13:** Finally, you should see the terminal window again. Type in:

```
shutdown now
```

This will safely exit the installation and close the virtual machine.

It’s all set! Before starting the virtual machine with Arch installed, you need to do one more thing – **remove the ISO disk selected as the optical drive**. Similar to how you added the ISO to boot from, you can head to the virtual machine settings and remove it as shown below:

![][31]

That’s it! You are done installing Arch Linux on VirtualBox.

All you have to do is start the virtual machine, and here’s how it looks in my case:

![virtualbox arch][32]

Even though it takes a bit of time to go through the options, the new guided installer on Arch Linux saves a lot of time to get the essentials right.

![][33]

The same set of steps apply for installing Arch Linux on your computer. You need to [make a separate bootable USB drive using Etcher][34] with the Arch Linux ISO file.

### Wrapping Up

[Arch Linux is a popular choice][1] for a variety of reasons. However, if it is your first time installing, or if you want to test it out, a virtual machine is the best way to experience it without disrupting your host computer.

I hope this helps you install Arch Linux on VirtualBox. Let me know your thoughts in the comments down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-arch-linux-virtualbox/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-arch-linux/
[2]: https://itsfoss.com/install-arch-linux/
[3]: https://itsfoss.com/debian-vs-ubuntu/
[4]: https://itsfoss.com/install-virtualbox-ubuntu/
[5]: https://www.virtualbox.org/wiki/Downloads
[6]: https://archlinux.org/download/
[7]: https://itsfoss.com/best-torrent-ubuntu/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/archlinux-downloads.png?resize=800%2C419&ssl=1
[9]: https://itsfoss.com/free-up-space-ubuntu-linux/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-new.png?resize=800%2C562&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-expert-mode.png?resize=707%2C438&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-create.png?resize=800%2C536&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-disk.png?resize=800%2C528&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/choose-disk-virtualbox-arch.png?resize=800%2C440&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-settings-option.png?resize=800%2C551&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-choose-iso.png?resize=800%2C314&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-arch-iso-select.png?resize=800%2C348&ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-set-start.png?resize=800%2C548&ssl=1
[19]: https://news.itsfoss.com/arch-linux-easy-install/
[20]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-archlinux-boot.png?resize=800%2C593&ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/vb-archinstall-guided.png?resize=800%2C400&ssl=1
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/vb-archinstall-kb-layout.png?resize=800%2C694&ssl=1
[23]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/archinstall-region.png?resize=800%2C664&ssl=1
[24]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/archinstall-selectdisk.png?resize=800%2C199&ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/archinstall-desktop-configure.png?resize=800%2C497&ssl=1
[26]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/archinstall-virtualbox-desktop-environment.png?resize=800%2C415&ssl=1
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-environment.png?resize=419%2C173&ssl=1
[28]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/archinstall-linux-kernel.png?resize=800%2C692&ssl=1
[29]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-arch-network-manager.png?resize=800%2C151&ssl=1
[30]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/archinstall-confirmation.png?resize=800%2C697&ssl=1
[31]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/iso-remove-archinstall.png?resize=800%2C286&ssl=1
[32]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-arch.png?resize=800%2C635&ssl=1
[33]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/kde-arch-virtualbox.png?resize=800%2C453&ssl=1
[34]: https://itsfoss.com/install-etcher-linux/
