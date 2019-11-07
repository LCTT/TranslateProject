[#]: collector: (lujun9972)
[#]: translator: (wenwensnow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to dual boot Windows 10 and Debian 10)
[#]: via: (https://www.linuxtechi.com/dual-boot-windows-10-debian-10/)
[#]: author: (James Kiarie https://www.linuxtechi.com/author/james/)

How to dual boot Windows 10 and Debian 10   如何拥有一个Windows 10 和 Debian 10 的双系统
======

So, you finally made the bold decision to try out **Linux** after much convincing. However, you do not want to let go of your Windows 10 operating system yet as you will still be needing it before you learn the ropes on Linux. Thankfully, you can easily have a dual boot setup that allows you to switch to either of the operating systems upon booting your system. In this guide, you will learn how to **dual boot Windows 10 alongside Debian 10**.
所以，在无数次劝说自己后，你终于做出了一个大胆的决定，试试**Linux** 。 不过，在你完全熟悉Linux之前，依旧需要使用Windows 10 系统。幸运的是，通过一个双系统引导设置，能让你在启动时，选择自己想要进入的系统。在这个帮助手册中，你会看到如何 **如何双重引导Windows 10 和 Debian 10**.

[![如何拥有一个Windows 10 和 Debian 10 的双系统][1]][2]

###  前提条件

在开始之前，确保你满足下列条件:   

  * 一个Debian10 的可引导的USB 或DVD
  * 一个快速且稳定的网络 (为了安装更新 &amp; 以及第三方软件)

Additionally, it worth paying attention to how your system boots (UEFI or Legacy) and ensure both the operating systems boot using the same boot mode.
另外，记得注意你系统的引导策略（UEFI 或Legacy）, 需要确保两个系统使用同一种引导模式。

### 第一步：在硬盘上创建一个空余分区

To achieve this, you will invoke the disk management utility as shown:
第一步，你需要在你的硬盘上创建一个空余分区。 之后，这将是我们安装Debian系统的位置。为了实现这一目的，需要使用下图所示的磁盘管理器：

同时按下 **Windows + R键**，启动运行程序。接下来，输入  **diskmgmt.msc** ，按  **回车键**

[![Launch-Run-dialogue][1]][3]

这会启动 **磁盘管理器**窗口，并显示你Windows 上所有已有磁盘。

[![Disk-management][1]][4]

Next, you need to create a free space for Debian installation. To do this, you need to shrink a partition from one of the volumes and create a new unallocated partition. In this case, I will create a **30 GB** partition from Volume D.

接下来，你需要为Debian安装创建空余空间。为此，你需要压缩其中一个磁盘的空间，从而创建一个未分配的新分区。在这个例子里，我会从 D 盘中创建一个 **30 GB** 的新分区。 

为了压缩一个卷，右键点击它，然后选中选项 ‘**压缩**’ 

[![压缩卷][1]][5]

在弹出窗口中，定义你想压缩的空间大小。记住，这是将来要安装Debian 10的磁盘空间。我选择了  **30000MB  ( 大约 30 GB)** 。 压缩完成后，点击‘**压缩**’.

[![Shrink-space][1]][6]

在压缩操作结束后，你会看到一个如下图所示的未分配分区：

[![未分配分区][1]][7]

完美！ 现在可以准备开始安装了。

### Step 2: Begin the installation of Debian 10

With the free partition already created, plug in your bootable USB drive or insert the DVD installation medium in your PC and reboot your system. Be sure to make changes to the **boot order** in the **BIOS** set up by pressing the function keys (usually, **F9, F10 or F12** depending on the vendor). This is crucial so that the PC boots into your installation medium. Saves the BIOS settings and reboot.

A new grub menu will be displayed as shown below: Click on ‘**Graphical install**’

[![Graphical-Install-Debian10][1]][8]

In the next step, select your **preferred language** and click ‘**Continue**’

[![Select-Language-Debian10][1]][9]

Next, select your **location** and click ‘**Continue**’. Based on this location the time will automatically be selected for you. If you cannot find you located, scroll down and click on ‘**other**’ then select your location.

[![Select-location-Debain10][1]][10]

Next, select your **keyboard** layout.

[![Configure-Keyboard-layout-Debain10][1]][11]

In the next step, specify your system’s **hostname** and click ‘**Continue**’

[![Set-hostname-Debian10][1]][12]

Next, specify the **domain name**. If you are not in a domain environment, simply click on the ‘**continue**’ button.

[![Set-domain-name-Debian10][1]][13]

In the next step, specify the **root password** as shown and click ‘**continue**’.

[![Set-root-Password-Debian10][1]][14]

In the next step, specify the full name of the user for the account and click ‘**continue**’

[![Specify-fullname-user-debain10][1]][15]

Then set the account name by specifying the **username** associated with the account

[![Specify-username-Debian10][1]][16]

Next, specify the username’s password as shown and click ‘**continue**’

[![Specify-user-password-Debian10][1]][17]

Next, specify your **timezone**

[![Configure-timezone-Debian10][1]][18]

At this point, you need to create partitions for your Debian 10 installation. If you are an inexperienced user, Click on the ‘**Use the largest continuous free space**’ and click ‘**continue**’.

[![Use-largest-continuous-free-space-debian10][1]][19]

However, if you are more knowledgeable about creating partitions, select the ‘**Manual**’ option and click ‘**continue**’

[![Select-Manual-Debain10][1]][20]

Thereafter, select the partition labeled ‘**FREE SPACE**’  and click ‘**continue**’ . Next click on ‘**Create a new partition**’.

[![Create-new-partition-Debain10][1]][21]

In the next window, first, define the size of swap space, In my case, I specified **2GB**. Click **Continue**.

[![Define-swap-space-debian10][1]][22]

Next, click on ‘’**Primary**’ on the next screen and click ‘**continue**’

[![Partition-Disks-Primary-Debain10][1]][23]

Select the partition to **start at the beginning** and click continue.

[![Start-at-the-beginning-Debain10][1]][24]

Next, click on **Ext 4 journaling file system** and click ‘**continue**’

[![Select-Ext4-Journaling-system-debain10][1]][25]

On the next window, select **swap  **and click continue

[![Select-swap-debain10][1]][26]

Next, click on **done setting the partition** and click continue.

[![Done-setting-partition-debian10][1]][27]

Back to the **Partition disks** page, click on **FREE SPACE** and click continue

[![Click-Free-space-Debain10][1]][28]

To make your life easy select **Automatically partition the free space** and click **continue**.

[![Automatically-partition-free-space-Debain10][1]][29]

Next click on **All files in one partition (recommended for new users)**

[![All-files-in-one-partition-debian10][1]][30]

Finally, click on **Finish partitioning and write changes to disk** and click **continue**.

[![Finish-partitioning-write-changes-to-disk][1]][31]

Confirm that you want to write changes to disk and click ‘**Yes**’

[![Write-changes-to-disk-Yes-Debian10][1]][32]

Thereafter, the installer will begin installing all the requisite software packages.

When asked if you want to scan another CD, select **No** and click continue

[![Scan-another-CD-No-Debain10][1]][33]

Next, select the mirror of the Debian archive closest to you and click ‘Continue’

[![Debian-archive-mirror-country][1]][34]

Next, select the **Debian mirror** that is most preferable to you and click ‘**Continue**’

[![Select-Debian-archive-mirror][1]][35]

If you plan on using a proxy server, enter its details as shown below, otherwise leave it blank and click ‘continue’

[![Enter-proxy-details-debian10][1]][36]

As the installation proceeds, you will be asked if you would like to participate in a **package usage survey**. You can select either option and click ‘continue’ . In my case, I selected ‘**No**’

[![Participate-in-survey-debain10][1]][37]

Next, select the packages you need in the **software selection** window and click **continue**.

[![Software-selection-debian10][1]][38]

The installation will continue installing the selected packages. At this point, you can take a coffee break as the installation goes on.

You will be prompted whether to install the grub **bootloader** on **Master Boot Record (MBR)**. Click **Yes** and click **Continue**.

[![Install-grub-bootloader-debian10][1]][39]

Next, select the hard drive on which you want to install **grub** and click **Continue**.

[![Select-hard-drive-install-grub-Debian10][1]][40]

Finally, the installation will complete, Go ahead and click on the ‘**Continue**’ button

[![Installation-complete-reboot-debian10][1]][41]

You should now have a grub menu with both **Windows** and **Debian** listed. To boot to Debian, scroll and click on Debian. Thereafter, you will be prompted with a login screen. Enter your details and hit ENTER.

[![Debian10-log-in][1]][42]

And voila! There goes your fresh copy of Debian 10 in a dual boot setup with Windows 10.

[![Debian10-Buster-Details][1]][43]

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/dual-boot-windows-10-debian-10/

作者：[James Kiarie][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/10/How-to-dual-boot-Windows-and-Debian10.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Launch-Run-dialogue.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Disk-management.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Shrink-volume.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Shrink-space.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Unallocated-partition.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Graphical-Install-Debian10.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-Language-Debian10.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-location-Debain10.jpg
[11]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Configure-Keyboard-layout-Debain10.jpg
[12]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Set-hostname-Debian10.jpg
[13]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Set-domain-name-Debian10.jpg
[14]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Set-root-Password-Debian10.jpg
[15]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Specify-fullname-user-debain10.jpg
[16]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Specify-username-Debian10.jpg
[17]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Specify-user-password-Debian10.jpg
[18]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Configure-timezone-Debian10.jpg
[19]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Use-largest-continuous-free-space-debian10.jpg
[20]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-Manual-Debain10.jpg
[21]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Create-new-partition-Debain10.jpg
[22]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Define-swap-space-debian10.jpg
[23]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Partition-Disks-Primary-Debain10.jpg
[24]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Start-at-the-beginning-Debain10.jpg
[25]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-Ext4-Journaling-system-debain10.jpg
[26]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-swap-debain10.jpg
[27]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Done-setting-partition-debian10.jpg
[28]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Click-Free-space-Debain10.jpg
[29]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Automatically-partition-free-space-Debain10.jpg
[30]: https://www.linuxtechi.com/wp-content/uploads/2019/10/All-files-in-one-partition-debian10.jpg
[31]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Finish-partitioning-write-changes-to-disk.jpg
[32]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Write-changes-to-disk-Yes-Debian10.jpg
[33]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Scan-another-CD-No-Debain10.jpg
[34]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Debian-archive-mirror-country.jpg
[35]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-Debian-archive-mirror.jpg
[36]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Enter-proxy-details-debian10.jpg
[37]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Participate-in-survey-debain10.jpg
[38]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Software-selection-debian10.jpg
[39]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Install-grub-bootloader-debian10.jpg
[40]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-hard-drive-install-grub-Debian10.jpg
[41]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Installation-complete-reboot-debian10.jpg
[42]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Debian10-log-in.jpg
[43]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Debian10-Buster-Details.jpg
