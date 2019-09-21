[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Installing Kali Linux on VirtualBox: Quickest & Safest Way)
[#]: via: (https://itsfoss.com/install-kali-linux-virtualbox/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Installing Kali Linux on VirtualBox: Quickest & Safest Way
======

_**This tutorial shows you how to install Kali Linux on Virtual Box in Windows and Linux in the quickest way possible.**_

[Kali Linux][1] is one of the [best Linux distributions for hacking][2] and security enthusiasts.

Since it deals with a sensitive topic like hacking, it’s like a double-edged sword. We have discussed it in the detailed Kali Linux review in the past so I am not going to bore you with the same stuff again.

While you can install Kali Linux by replacing the existing operating system, using it via a virtual machine would be a better and safer option.

With Virtual Box, you can use Kali Linux as a regular application in your Windows/Linux system. It’s almost the same as running VLC or a game in your system.

Using Kali Linux in a virtual machine is also safe. Whatever you do inside Kali Linux will NOT impact your ‘host system’ (i.e. your original Windows or Linux operating system). Your actual operating system will be untouched and your data in the host system will be safe.

![][3]

### How to install Kali Linux on VirtualBox

I’ll be using [VirtualBox][4] here. It is a wonderful open source virtualization solution for just about anyone (professional or personal use). It’s available free of cost.

In this tutorial, we will talk about Kali Linux in particular but you can install almost any other OS whose ISO file exists or a pre-built virtual machine save file is available.

**Note:** _The same steps apply for Windows/Linux running VirtualBox._

As I already mentioned, you can have either Windows or Linux installed as your host. But, in this case, I have Windows 10 installed (don’t hate me!) where I try to install Kali Linux in VirtualBox step by step.

And, the best part is – even if you happen to use a Linux distro as your primary OS, the same steps will be applicable!

Wondering, how? Let’s see…

[Subscribe to Our YouTube Channel for More Linux Videos][5]

### Step by Step Guide to install Kali Linux on VirtualBox

_We are going to use a custom Kali Linux image made for VirtualBox specifically. You can also download the ISO file for Kali Linux and create a new virtual machine – but why do that when you have an easy alternative?_

#### 1\. Download and install VirtualBox

The first thing you need to do is to download and install VirtualBox from Oracle’s official website.

[Download VirtualBox][6]

Once you download the installer, just double click on it to install VirtualBox. It’s the same for [installing VirtualBox on Ubuntu][7]/Fedora Linux as well.

#### 2\. Download ready-to-use virtual image of Kali Linux

After installing it successfully, head to [Offensive Security’s download page][8] to download the VM image for VirtualBox. If you change your mind to utilize [VMware][9], that is available too.

![][10]

As you can see the file size is well over 3 GB, you should either use the torrent option or download it using a [download manager][11].

[Kali Linux Virtual Image][8]

#### 3\. Install Kali Linux on Virtual Box

Once you have installed VirtualBox and downloaded the Kali Linux image, you just need to import it to VirtualBox in order to make it work.

Here’s how to import the VirtualBox image for Kali Linux:

**Step 1** : Launch VirtualBox. You will notice an **Import** button – click on it

![Click on Import button][12]

**Step 2:** Next, browse the file you just downloaded and choose it to be imported (as you can see in the image below). The file name should start with ‘kali linux‘ and end with . **ova** extension.

![Importing Kali Linux image][13]

**S** Once selected, proceed by clicking on **Next**.

**Step 3** : Now, you will be shown the settings for the virtual machine you are about to import. So, you can customize them or not – that is your choice. It is okay if you go with the default settings.

You need to select a path where you have sufficient storage available. I would never recommend the **C:** drive on Windows.

![Import hard drives as VDI][14]

Here, the hard drives as VDI refer to virtually mount the hard drives by allocating the storage space set.

After you are done with the settings, hit **Import** and wait for a while.

**Step 4:** You will now see it listed. So, just hit **Start** to launch it.

You might get an error at first for USB port 2.0 controller support, you can disable it to resolve it or just follow the on-screen instruction of installing an additional package to fix it. And, you are done!

![Kali Linux running in VirtualBox][15]

The default username in Kali Linux is root and the default password is toor. You should be able to login to the system with it.

Do note that you should [update Kali Linux][16] before trying to install a new applications or trying to hack your neighbor’s WiFi.

I hope this guide helps you easily install Kali Linux on Virtual Box. Of course, Kali Linux has a lot of useful tools in it for penetration testing – good luck with that!

**Tip** : Both Kali Linux and Ubuntu are Debian-based. If you face any issues or error with Kali Linux, you may follow the tutorials intended for Ubuntu or Debian on the internet.

### Bonus: Free Kali Linux Guide Book

If you are just starting with Kali Linux, it will be a good idea to know how to use Kali Linux.

Offensive Security, the company behind Kali Linux, has created a guide book that explains the basics of Linux, basics of Kali Linux, configuration, setups. It also has a few chapters on penetration testing and security tools.

Basically, it has everything you need to get started with Kali Linux. And the best thing is that the book is available to download for free.

[Download Kali Linux Revealed for FREE][17]

Let us know in the comments below if you face an issue or simply share your experience with Kali Linux on VirtualBox.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-kali-linux-virtualbox/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.kali.org/
[2]: https://itsfoss.com/linux-hacking-penetration-testing/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/kali-linux-virtual-box.png?resize=800%2C450&ssl=1
[4]: https://www.virtualbox.org/
[5]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[6]: https://www.virtualbox.org/wiki/Downloads
[7]: https://itsfoss.com/install-virtualbox-ubuntu/
[8]: https://www.offensive-security.com/kali-linux-vm-vmware-virtualbox-image-download/
[9]: https://itsfoss.com/install-vmware-player-ubuntu-1310/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/kali-linux-virtual-box-image.jpg?resize=800%2C347&ssl=1
[11]: https://itsfoss.com/4-best-download-managers-for-linux/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmbox-import-kali-linux.jpg?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmbox-linux-next.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmbox-kali-linux-settings.jpg?ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/kali-linux-on-windows-virtualbox.jpg?resize=800%2C429&ssl=1
[16]: https://linuxhandbook.com/update-kali-linux/
[17]: https://kali.training/downloads/Kali-Linux-Revealed-1st-edition.pdf
