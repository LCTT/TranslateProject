[#]: subject: (Try Linux on any operating system with VirtualBox)
[#]: via: (https://opensource.com/article/21/6/try-linux-virtualbox)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (chai001125)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Try Linux on any operating system with VirtualBox
======
VirtualBox helps anyone—even a command line novice—set up a virtual
machine.
![Person programming on a laptop on a building][1]

VirtualBox makes it easy for anyone to try Linux. You don't even need experience with the command line to set up a simple virtual machine to tinker with Linux. I'm kind of a power user when it comes to virtual machines, but this article will show even novices how to virtualize a Linux system. In addition, it provides an overview of how to run and install a Linux system for testing purposes with the open source hypervisor [VirtualBox][2].

### Terms

Before starting, you should understand the difference between the two operating systems (OSes) in this setup:

  * **Host system:** This is your actual OS on which you install VirtualBox.
  * **Guest system:** This is the system you want to run virtualized on top of your host system.



Both systems, host and guest, must interact with each other when it comes to input/output, networking, file access, clipboard, audio, and video.

In this tutorial, I'll use Windows 10 as the _host system_ and [Fedora 33][3] as the _guest system_.

### Prerequisites

When we talk about virtualization, we actually mean [hardware-assisted virtualization][4]. Hardware-assisted virtualization requires a compatible CPU. Almost every ordinary x86 CPU from the last decade comes which this feature. AMD calls it **AMD-V,** and Intel calls it **VT-x**. The virtualization feature adds some additional CPU instructions, and it can be enabled or disabled in the BIOS.

To start with virtualization:

  * Make sure that AMD-V or VT-x is enabled in the BIOS.
  * Download and install [VirtualBox][5].



### Prepare the virtual machine

Download the image of the Linux distribution you want to try out. It does not matter if it's a 32-bit or 64-bit OS image. You can even start a 64-bit OS image on a 32-bit host system (with limitations in memory usage, of course) and vice versa.

> **Considerations:** If possible, choose a Linux distribution that comes with the [Logical Volume Manager][6] (LVM). LVM decouples the filesystem from the physical hard drives. This allows you to increase the size of your guest system's hard drive if you are running out of space.

Now, open VirtualBox and click on the yellow **New** button:

![VirtualBox New VM][7]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Next, configure how much memory the guest OS is allowed to use:

![Set VM memory size][9]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

My recommendation: **Don't skimp on memory!** When memory is low, the guest system will start paging memory from RAM to the hard drive, worsening the system's performance and responsiveness extremely. If the underlying host system starts paging, you might not notice. For a Linux workstation system with a graphical desktop environment, I recommend at least 4GB of memory.

Next, create the hard disk:

![Create virtual hard disk][10]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Choose the default option, **VDI**:

![Selecting hard disk file type][11]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

In this window, I recommend choosing **dynamically allocated**, as this allows you to increase the size later. If you choose **fixed size**, the disk will be probably faster, but you won't be able to modify it:

![Dynamically allocating hard disk][12]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

With a Linux distribution that uses LVM, you can start with a small hard disk. If you are running out of space, you can increase it on demand.

> **Note**: Fedora's website says [it requires][13] a minimum of 20GB free disk space. I highly recommend you stick to that specification. I chose 8GB here so that I can demonstrate how to increase it later. If you are new to Linux or inexperienced with the command line, choose 20GB.

![Setting hard disk size][14]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

After creating the hard drive, select the newly created virtual machine from the list in VirtualBox's main window and click on **Settings**. In the Settings menu, go to **System** and select the **Processor** tab. By default, VirtualBox assigns only one CPU core to the guest system. On a modern multicore CPU, it should not be any problem to assign at least two cores, which will speed up the guest system significantly:

![Assigning cores to guest system][15]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

#### Network adapter setup

The next thing to take care of is the network setup. By default, VirtualBox creates one NAT connection, which should be OK for most use cases:

![Network settings][16]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

You can create more than one network adapter. Here are the most common types:

  * **NAT:** The NAT adapter performs a [network address translation][17]. From the outside, it looks like the host and the guest system use the same IP address. You are not able to access the guest system from within the host system over the network. (Although you could define [port forwarding][18] to access certain services.) When your host system has access to the internet, the guest system will have access, too. NAT requires no further configuration.
    * _Choose **NAT** if you only need internet access for the guest system._
  * **Bridged adapter:** Here, the guest and the host system share the same physical Ethernet device. Both systems will have independent IP addresses. From the outside, it looks like there are two separate systems in the network, both sharing the same physical Ethernet adapter. This setup is more flexible but requires more configuration.
    * _Choose **Bridged adapter** if you want to share the guest system's network services._
  * **Host-only adapter:** In this configuration, the guest system can only talk to the host or other guest systems running on the same host. The host system can also connect to the guest system. There is no internet nor physical network access for the guest.
    * _Choose **Host-only adapter** for advanced security._



#### Assign the OS image

Navigate to **Storage** and select the virtual optical drive. Click on the **CD icon** on the right, and select **Choose a disk file…**. Then assign the downloaded Linux distribution image you want to install:

![Assigning OS image][19]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

### Install Linux

The virtual machine is now configured. Leave the **Settings** menu and go back to the main window. Click on the **Green arrow** (i.e., the start button). The virtual machine will start up and boot from the virtual optical drive, and you will find yourself in your Linux distribution's installer:

![VirtualBox Fedora installer][20]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

#### Partitioning

The installer will ask you for partitioning information during the installation process. Choose **Custom**:

![Selecting Custom partition configuration][21]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

> **Note:** I'm assuming you're creating this virtual machine just for testing purposes. Also you don't need to care about hibernation for your guest system, as this function is implicitly provided by VirtualBox. Therefore, you can omit the swap partition to save disk space on your host system. Keep in mind that you can add a swap partition later if needed. In [_An introduction to swap space on Linux systems_][22], David Both explains how to add a swap partition and choose the correct size.

Fedora 33 and later offer a [zram][23] partition, a compressed part of the memory used for paging and swap. The zram partition is resized on demand, and it is much faster than a hard disk swap partition.

To keep it simple, just add these two mount points:

![Adding mount points][24]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Apply the changes and proceed with the installation.

### Install VirtualBox Guest Additions

After you finish the installation, boot from the hard drive and log in. Now you can install VirtualBox Guest Additions, which include special device drivers and system applications that provide:

  * Shared clipboard
  * Shared folders
  * Better performance
  * Freely scalable window size



To install them, click on the top menu in **Devices** and select **Insert Guest Additions CD image…**:

![Selecting Guest Additions CD image][25]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

On most Linux distributions, the CD image with the Guest Additions is mounted automatically, and they are available in the file browser. Fedora will ask you if you want to run the installation script. Click **Run** and enter your credentials to grant the process root rights:

![Enabling Guest Additions autorun][26]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

When the installation is finished, reboot the system.

### LVM: Enlarge disk space

Creating an 8GB hard disk was a dumb decision, as Fedora quickly starts signaling that it is running out of space:

![Fedora hard disk running out of space][27]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

As I mentioned, a disk space of 20GB is recommended, and 8GB is the _absolute_ minimum for a Fedora 33 installation to boot up. A fresh installation with no additional software (except the VirtualBox Guest Additions) takes nearly the whole 8GB of available space. Don't open the GNOME Software center or anything else that might download files from the internet in this condition.

Luckily, I chose to use LVM, so I can easily fix this mishap.

To increase the filesystem's space within the virtual machine, you must first increase the virtual hard drive on your host system.

Shut down the virtual machine. If your host system is running Windows, open a command prompt and navigate to `C:\Program Files\Oracle\VirtualBox`. Resize the disk to 12,000MB with the following command:


```
`VBoxManage.exe modifyhd "C:\Users\StephanA\VirtualBox VMs\Fedora_33\Fedora_33.vdi" --resize 12000`
```

Boot the virtual machine and open the **Disks** utility. You should see the newly created unassigned free space. Select **Free Space** and click the **+** button:

![Free space before adding][28]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Now, create a new partition. Select the amount of free space you want to use:

![Creating a new partition and setting size][29]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

You don't want to create a filesystem or anything else on your new partition, so select **Other**:

![Selecting "other" for partition volume type][30]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Select **No Filesystem**:

![Setting "No filesystem" on new partition][31]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

The overview should now look like this:

![VirtualBox after adding new partition][32]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

There is a new partition device, **/dev/sda3**. Check your LVM volume group by typing `vgscan`:

![Checking LVM volume group by typing vgscan:][33]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Now you have everything you need. Extend the volume group in the new partition:


```
`vgextend fedora_localhost-live /dev/sda3`
```

![vgextend command output][34]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Because the volume group is larger, you can increase the size of the logical volume. The command `vgdisplay` shows that it has 951 free extends available:

![vgdisplay command output][35]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Increase the logical volume by 951 extends:


```
`lvextend -l+951 /dev/mapper/fedora_localhost--live-root`
```

![lvextend command output][36]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

After you increase the logical volume, the last thing to do is to resize the filesystem:


```
`resize2fs /dev/mapper/fedora_localhost--live-root`
```

![resize2fs command output][37]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Done! Check the **Disk Usage Analyzer**, and you should see that the extended space is available for the filesystem.

### Summary

With a virtual machine, you can check how a piece of software behaves with a specific operating system or a specific version of an operating system. Besides that, you can also try out any Linux distribution you want to test without worrying about breaking your system. For advanced users, VirtualBox offers a wide range of possibilities when it comes to testing, networking, and simulation.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/try-linux-virtualbox

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Person programming on a laptop on a building)
[2]: https://www.virtualbox.org/
[3]: https://getfedora.org/
[4]: https://en.wikipedia.org/wiki/Hardware-assisted_virtualization
[5]: https://www.virtualbox.org/wiki/Downloads
[6]: https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
[7]: https://opensource.com/sites/default/files/uploads/virtualbox_new_vm.png (VirtualBox New VM)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/sites/default/files/uploads/virtualbox_memory_size_1.png (Set VM memory size)
[10]: https://opensource.com/sites/default/files/uploads/virtualbox_create_hd_1.png (Create virtual hard disk)
[11]: https://opensource.com/sites/default/files/uploads/virtualbox_create_hd_2.png (Selecting hard disk file type)
[12]: https://opensource.com/sites/default/files/uploads/virtualbox_create_hd_3.png (Dynamically allocating hard disk)
[13]: https://getfedora.org/en/workstation/download/
[14]: https://opensource.com/sites/default/files/uploads/virtualbox_create_hd_4.png (Setting hard disk size)
[15]: https://opensource.com/sites/default/files/uploads/virtualbox_cpu_settings.png (Assigning cores to guest system)
[16]: https://opensource.com/sites/default/files/uploads/virtualbox_network_settings2.png (Network settings)
[17]: https://en.wikipedia.org/wiki/Network_address_translation
[18]: https://www.virtualbox.org/manual/ch06.html#natforward
[19]: https://opensource.com/sites/default/files/uploads/virtualbox_choose_image3.png (Assigning OS image)
[20]: https://opensource.com/sites/default/files/uploads/virtualbox_running.png (VirtualBox Fedora installer)
[21]: https://opensource.com/sites/default/files/uploads/virtualbox_partitioning_1.png (Selecting Custom partition configuration)
[22]: https://opensource.com/article/18/9/swap-space-linux-systems
[23]: https://fedoraproject.org/wiki/Changes/SwapOnZRAM
[24]: https://opensource.com/sites/default/files/uploads/virtualbox_partitioning_2.png (Adding mount points)
[25]: https://opensource.com/sites/default/files/uploads/virtualbox_guest_additions_2.png (Selecting Guest Additions CD image)
[26]: https://opensource.com/sites/default/files/uploads/virtualbox_guest_additions_autorun.png (Enabling Guest Additions autorun)
[27]: https://opensource.com/sites/default/files/uploads/virtualbox_disk_usage_1.png (Fedora hard disk running out of space)
[28]: https://opensource.com/sites/default/files/uploads/virtualbox_disks_before.png (Free space before adding)
[29]: https://opensource.com/sites/default/files/uploads/virtualbox_new_partition_1.png (Creating a new partition and setting size)
[30]: https://opensource.com/sites/default/files/uploads/virtualbox_new_partition_2.png (Selecting "other" for partition volume type)
[31]: https://opensource.com/sites/default/files/uploads/virtualbox_no_partition_3.png (Setting "No filesystem" on new partition)
[32]: https://opensource.com/sites/default/files/uploads/virtualbox_disk_after.png (VirtualBox after adding new partition)
[33]: https://opensource.com/sites/default/files/uploads/virtualbox_vgscan.png (Checking LVM volume group by typing vgscan:)
[34]: https://opensource.com/sites/default/files/uploads/virtualbox_vgextend_2.png (vgextend command output)
[35]: https://opensource.com/sites/default/files/uploads/virtualbox_vgdisplay.png (vgdisplay command output)
[36]: https://opensource.com/sites/default/files/uploads/virtualbox_lvextend.png (lvextend command output)
[37]: https://opensource.com/sites/default/files/uploads/virtualbox_resizefs.png (resize2fs command output)
