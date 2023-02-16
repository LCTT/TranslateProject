[#]: subject: "How to Install and Use GNOME Boxes to Create Virtual Machines"
[#]: via: "https://www.debugpoint.com/install-use-gnome-boxes/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "void-mori"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install and Use GNOME Boxes to Create Virtual Machines
======
This quick tutorial explains the steps to install and use GNOME Boxes and create virtual machines, with some tips and troubleshooting.

Virtualization is the process of running a virtual instance (rather than an actual one) with an abstracted layer of hardware. In popular terms, it allows you to install and run multiple operating systems (Linux, Windows) simultaneously.

A [Virtual machine][1] is a simulated operating system that runs on top of another operating system and uses the same hardware, and storage space as the host machine. Although, you can control how much shared-memory or space can be allocated to virtual machines.

There are multiple software available to create virtual machines, e.g. [Virtual Box][2], KVM, Hyper-V, VM Ware player, and GNOME Boxes.

But honestly, most of them are complex to use and sometimes not stable enough. [GNOME Boxes][3] is another free and open-source software that is very easy to use and makes it simple for you to create, and manage virtual machines by abstracting lots of options.

### Install GNOME Boxes

If you are running Fedora with GNOME Spin, you should already have it installed. However, for Ubuntu, Linux Mint, Kubuntu, and other distributions, you can simply run below to install it in your system.

```
sudo apt install gnome-boxes
```

#### Via Flatpak

It is also available via the Flatpak package. I would recommend you to use this version. First, set up your system to use Flatpak using [this guide][4], and then run the following command from the terminal to install.

```
flatpak install flathub org.gnome.Boxes
```

### Create Virtual Machine using GNOME Boxes

* Launch GNOME Boxes from the application menu.

* To create a virtual machine, you need an image (*.ISO) of the operating system you want to virtualize.

* You can download any operating system iso images from the official download page of the distributions. For this guide, I am using Pop! OS, which is an excellent Linux distribution.

* After you launch, click on the “+” icon at the top to start and select “Create a virtual machine”.

![Create Virtual Machine][5]

In the next window, you can choose already available downloads, or you can select your iso file as OS source. Click on the “Operating system image file” and choose your iso file.

Assign the memory and storage space of your virtual machine. Remember, your virtual machine would take the memory and storage from your host system. So try not to assign as max.

For example, in the below image – I have assigned 2GB memory for the virtual machine (guest) from the total 8GB memory of the host system.

Similarly, choose minimum storage space as well if you want to just test any OS. But if you are creating a virtual machine for servers or serious work, be logical in how much space or memory you want to assign.

Another important thing to remember is that the storage disk space which you allow will be blocked permanently unless you delete the virtual machine. So, you won’t get that much of disk space as free even if your virtual machine doesn’t use the entire allocated space.

![Allocate resources for your virtual machine][6]

Continue with the installation.

In the partition window, you should see one hard disk and partition, which is the virtual machine disk space. Usually, they are named as `/dev/vda` or `/dev/sda`.

Don’t worry; you can play around with this partition, which will not impact your physical disk partitions or any data on your actual host system. Follow the same /root partition while installing Linux, and continue.

![Virtual machine partition][7]

After you complete the installation, you should be seeing your new operating system in the virtual machine. In the GNOME Boxes, you should see an entry to the system. You can click once to boot your virtual machine.

You can power off the virtual machine by using your virtual machine operating system’s internal shutdown option.

If you want, you can also delete the virtual machine by choosing the context menu option.

![Context menu in installed virtual machine][8]

You can also check how much memory, and CPU your virtual machine uses from the properties window.

Note that you can adjust the memory and other items of your existing virtual machines using properties.

![System properties][9]

### Troubleshooting

Here are some of the common errors or issues which you may face while using GNOME Boxes.

##### 1. Resolution problems in virtual machines

If your virtual machine is having low resolution, which is incompatible with your host system, then you have to install the below items. Open up the terminal in the guest system (not in the host system) and run the below commands.

**For Ubuntu-based distributions**

```
sudo apt install spice-vdagent spice-webdavd
```

**For Fedora**

```
sudo dnf install spice-vdagent spice-webdavd
```

These two packages help to determine proper resolutions, copy/paste between host and guest, sharing files via public folders, etc.

Once installed, reboot the guest system; Or you can log off and re-login once after reboot, you should be seeing the proper resolution.

##### 2. GNOME Boxes don’t start a virtual machine in Ubuntu 18.04 based distributions

If you are creating a virtual machine in Boxes 3.34 then you should know that there was a bug that caused your virtual machine to fail to start. To fix that you have to follow some additional steps. Remember these are not required for the latest Boxes 3.36.

Open a terminal window and run below command to change the qemu config file

```
sudo gedit /etc/modprobe.d/qemu-system-x86.conf
```

Add the below line in the above file and save.

```
group=kvm
```

Now, run below command to add your username to the KVM group.

```
sudo usermod -a -G kvm <your account name>
```

### Wrapping Up

In this article, you have see how to install and use GNOME Boxes to take advantage of virtualization. I hope it helps you.

🗨️ If you face any errors or have any questions with virtual machines with GNOME Boxes, let me know using the comment box below.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/install-use-gnome-boxes/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.redhat.com/en/topics/virtualization/what-is-a-virtual-machine
[2]: https://www.debugpoint.com/tag/virtualbox/
[3]: https://wiki.gnome.org/Apps/Boxes
[4]: https://www.debugpoint.com/how-to-install-flatpak-apps-ubuntu-linux/
[5]: https://www.debugpoint.com/wp-content/uploads/2020/05/Create-Virtual-Machine.png
[6]: https://www.debugpoint.com/wp-content/uploads/2020/05/Allocate-resources-for-your-virtual-machine.png
[7]: https://www.debugpoint.com/wp-content/uploads/2020/05/Virtual-machine-partition.png
[8]: https://www.debugpoint.com/wp-content/uploads/2020/05/Context-menu-in-installed-virtual-machine.png
[9]: https://www.debugpoint.com/wp-content/uploads/2020/05/System-properties.png
