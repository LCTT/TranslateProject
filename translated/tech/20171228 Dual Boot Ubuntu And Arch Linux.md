Ubuntu 和 Arch Linux 双启动
======
![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/dual-boot-ubuntu-and-arch-linux_orig.jpg)

**Ubuntu And Arch Linux 双启动** 不像听起来那么容易, 然而,我将使这个过程尽可能地简单明了。首先，我们需要安装 Ubuntu，然后安装 Arch Linux，因为配置 Ubuntu grub更容易实现**Ubuntu 和 Arch Linux 双启动**
### Ubuntu And Arch Linux 双启动

你需要准备好以下内容:

1、你需要准备你所选择的 Ubuntu 的特色版本，在这个例子中，我将使用 Ubuntu 17.10 ISO

2、两个优盘

3、Windows 或者 Linux 操作系统的 PC 机

4、Arch Linux ISO

5、基于 Windows 的 Rufus 或是基于 Linux 发行版的 etcher 的两款软件中的一种，要根据自己的系统类型来选择哦。
### ​安装 Ubuntu

​首先, 利用 `Rufus` 为 Ubuntu 和 Arch Linux[创建可引导的闪存驱动器][1]。另外，也可以使用 `etcher` 创建 Ubuntu 和 Arch Linux 的可引导闪存驱动器。

 [![Ubuntu 可启动 USB 镜像写入工具](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/bootable-ubuntu-usb-etcher-image-writer_orig.jpg)][2] 

为 Ubuntu 选择 ISO 映像文件，然后选择闪存驱动器，然后单击 `Flash` 创建可引导的闪存驱动器。等到它完成，瞧!你的启动闪存已经准备好使用了。
 [![make ubuntu usb bootable in linux在 linux 下创建 Ubuntu USB 引导程序](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/make-ubuntu-usb-bootable-in-linux_orig.jpg)][3] 


打开你的机器并使用载有 Ubuntu 安装媒体的启动闪存驱动器进行启动。确保引导到 UEFI 或 BIOS 兼容模式，这取决于您所使用的 PC 的类型。我更喜欢使用 UEFI 来构建新的 PC 。
 [![Ubuntu 自生系统登陆](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/live-ubuntu-boot_orig.jpg)][4] 

​在成功启动后，您将看到如上图显示，要求您尝试 Ubuntu 或安装 Ubuntu，选择安装 Ubuntu。
 [![从自生可启动 USB 安装](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-usb-from-live-usb_orig.jpg)][5] 

然后检查安装第三方软件的图形和 Wifi 硬件，MP3 和其他媒体。如果你有一个互联网连接，你可以选择在安装 Ubuntu 的时候下载更新，因为它会节省安装时间，并且确保安装的是最新更新。
 [![自定义磁盘分区安装 Ubuntu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/custom-partition-hd-install-ubuntu_orig.jpg)][6] 

​然后选择点击`Something else`，这样我们就可以对硬盘进行分区，并预留出 Ubuntu 和 Archlinux 的分区以及他们的交换分区的空间。
 [![create swap partition ubuntu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/create-swap-partition-ubuntu_orig.jpg)][7] 

​创建一个交换分区。最好是内存的一半大小。在我的例子中，我有 1 GB 的内存，因此创建一个 512 MB 的交换空间。
 [![安装 Ubuntu 到根（/）分区](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-ubuntu-root-partition_orig.jpg)][8] 

然后创建一个带有挂载点`/`的根分区并且点击`Install Now`按钮。
 [![选择时区](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/select-ubuntu-timezone_orig.jpg)][9] 

接下来选择语言和键盘设置。
 [![选择键盘布局](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-ubuntu-select-location-keyboard-layout_orig.jpg)][10] 

​然后创建新用户的用户凭据。
 [![创建用户名, 系统名及安装](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/create-username-system-name-ubuntu-install_orig.jpg)][11] 

​点击`Next`开始安装。
 [![ubuntu installation finishing](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/ubuntu-installation-finishing_orig.jpg)][12] 

​当安装完成后点击`Restart Now`重启 PC。
 [![完成 Ubtuntu 安装并重启系统](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/ubuntu-installation-finished_orig.jpg)][13] 

​移除安装媒介，按下回车继续。
 [![移除安装媒介](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/remove-installation-media-after-ubuntu_orig.jpg)][14] 

在确认成功安装后，重新启动并利用 Arch Linux 安装媒介引导。
### ​安装 Arch Linux

​在引导到 **Arch Linux 安装媒体**时，您应该看到如下所示的初始屏幕。选择 `Boot Arch Linux(x86_64)`。注意 Arch Linux 更多情况下类似于 [DYF][15] (自我定制)的一种操作系统。
 [![Arch Linux 安装引导菜单](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-linux-installation-boot-menu_orig.jpg)][16] 

选择之后，它将打开一个`tty1`终端，您将使用它来安装操作系统。
 [![tty终端](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-linux-tty1-linux_orig.png)][17] 注意:为了成功安装 Arch Linux，您需要一个互联网连接来下载一些必须的系统安装包。所以我们需要检查一下互联网是否运行正常。输入以下命令到终端以检查网络连接。
```ping linuxandubuntu.com -c 4```

 [![检查互联网连接](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-linux-ping-check-internet-connection_orig.png)][18] 

​如果因特网运行正常，你应该得到一个回显，显示发送和接收的数据包的数量。在这种情况下，我们发送了4个回波，并得到了4个反馈，这意味着连接是正常的。

如果想在 Arch Linux 中设置 Wifi，请阅读[本文][19]，在 Arch Linux 中配置 Wifi。
​接下来，我们需要选择之前在安装 Ubuntu 时预留出的空闲分区。
```fdisk -l``

​上面的命令应该显示可用的磁盘分区在哪里。您应该能看到 Ubuntu 分区以及预留的空闲空间。我们将使用`cfdisk`命令进行分区。
```cfdisk```

 [![利用cfdisk命令安装 Ach 分区](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-arch-partition-disk-with-cfdisk_orig.png)][20] 

执行命令后将看到分区情况。选择其他已分配分区下面的空闲空间。
您需要选择 `New`，然后输入分区大小。
 [![为 Archlinux 分区](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/partition-free-space-swap-arch-linux_orig.png)][21] 例如，9.3G - G 表示千兆字节。[![安装 Arch Linux 分区](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-arch-linux-partition_orig.png)][22] 

如下图所示，选择`primary`进行分区
 [![将 Arch Linux 的根（root）分区设置成主分区](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/make-arch-linux-root-as-primary-partition_orig.png)][23] 然后选择写分区条目。 [![选择分区安装 Arch](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/select-partition-to-install-arch_orig.png)][24] 

​键入`yes`，以确认写入分区表。
 [![确认创建分区并安装 Arch Linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-arch-linux-confirm-create-partition_orig.png)][25] 

然后选择 `Quit`（退出）选项。
 [![退出 Arch Linux 的‘cfdisk’](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/quit-cfdisk-arch-linux_orig.png)][26] 然后键入：

```fdisk -l```

​确认修改
 [![确认分区修改](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/confirm-partition-changes_orig.png)][27] 

​然后使用磁盘分区命令:
```mkfs.ext4 /dev/sda3```

​确保您选择的分区是我们创建的最后一个分区，这样我们就不会破坏 Ubuntu 分区。
 [![完成 Arch Linux 分区安装](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/complete-arch-linux-installation-partition_orig.png)][28] 

​然后使用以下命令安装这个分区 -
```mount /dev/sda3 /mnt```

 [![安装基础分区](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/mount-base-partition-in-arch-linux.png?1514472693)][29] 

用下面命令创建`home`目录
```mkdir .mnt/home```

 [![安装家目录](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/mount-home-partition-arch-linux.png?1514472866)][30] 

​用一下命令安装`home`目录到这个分区上
mount /dev/sda3 /mnt/home

 [![安装家目录](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/make-mount-home-directory.png?1514472960)][31] 

现在使用以下命令安装 Archlinux 的基本系统:
```pacstrap /mnt base```

请确保网络连接正常。
​

接下来开始下载和配置安装所用时间取决于你的网速。
 [![安装Arch Linux 基础系统](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/install-arch-linux-base.png?1514473056)][32] 

这一步骤完成后，将完成 Archlinux 基本安装。
Arch Linux 基础系统安装完成后，使用以下命令创建一个`fstab`文件:
genfstab -U /mnt >> /mnt/etc/fstab

 [![创建 fstab文件](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/create-fstab-file-in-arch-linux.png?1514473226)][33] 

在此之后，您需要验证`fstab`文件，使用下面命令:
```cat /mnt/etc/fstab```

 [![查看fstab文件的终端显示](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/cat-fstab-file-data-terminal.png?1514473304)][34] 

### ​Configuring Arch Linux: the basic configuration配置 Arch Linux:基础配置

您将需要在安装时配置以下内容:
1.  系统语言和系统语言环境

2.  系统时区

3.  Root用户密码

4.  设置主机名

Firstly, you will need to switch to the newly installed base by changing root into the system using the command:
首先，您需要使用以下命令将`root`切换为新安装的基础系统用户:
```arch-chroot /mnt```

#### 系统语言和系统语言环境

然后必须配置系统语言。必须取消对 en_Utf-8 UTF-8的注释，并加载到文件`/etc/local.gen`中
键入：

```nano /etc/local.gen```

然后将 en_UTF-8 UTF-8 取消注释
键入命令：

```locale-gen```

生成本地化设置如下:
 [![生成本地化配置](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/generate-localization-arch-linux.png?1514473406)][35] 相应的需要在`locale.conf`文件中配置 LANG 变量。例如:

```nano /etc/locale.conf```

​修改为：
```LANG=en_US.UTF-8```

配置键盘布局，则在文件`vconsole.conf`中进行更改，如下操作：
```nano /etc/vconsole.conf```

​修改为：
```KEYMAP=us-eng```

#### 2\. 系统时区

​配置时区需要利用一下命令实现
```ln -sf /usr/share/zoneinfo/Region/City /etc/localtime```

要查看可用时区，可以在终端使用以下命令:

注意可选时区在屏幕截图中显示为蓝色:
```ls /usr/share/zoneinfo```

 [![配置时区文件](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/setup-zonefile-in-arch-linux.png?1514473483)][36]  [![配置地区](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/setup-country-zonefile_orig.png)][37] 运行`hwclock`命令来生成``/etc/adjtime``(假设硬件时钟被设置为UTC):

```# hwclock --systohc```

#### 3\. 配置 Root 用户密码

​要为 Arch Linux 系统用户`root`设置密码，请使用:
```Passwd```

​为`root`用户提供一个新的密码并确认密码使其生效。
 [![配置系统用户root密码](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/setup-arch-linux-root-password.png?1514473649)][38] 

#### 4\. 配置主机名和网络

​需要创建主机名文件：
```nano /etc/hostname```

 [![配置主机名](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/set-arch-linux-hostname.png?1514473741)][39] 

将名字更改为您的用户名:
 [![set arch linux username](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/set-arch-linux-username.png?1514473822)][40] 然后向主机添加一个匹配的条目：

```nano /etc/hosts

127.0.0.1 localhost.localdomain localhost

::1 localhost.localdomain localhost

127.0.1.1 LinuxandUbuntu.localdomain LinuxandUbuntu```

​

您需要使网络保持连接，然后使用:
```systemctl enable dhcpd```

#### 配置 Grub

然后重启机器，进入 Ubuntu 配置 grub。
你可以键入：
```reboot```

 [![安装完成后重启](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/reboot-system-after-arch-linux-installation.png?1514474180)][41] 

Arch Linux 安装仍然没有出现，因此我们需要在 Ubuntu 中使用 `update-grub`来安装它。
 [![Ubuntu grub 菜单](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/ubuntu-grub-menu.png?1514474302)][42] 在Ubuntu中打开终端，输入:

```sudo update-grub```

它应该更新grub，添加 Arch Linux 记录。
### 小结

祝贺您成功地将Ubuntu和Arch Linux设置为双引导。Ubuntu安装很简单，但是Arch Linux安装对新的Linux用户来说是一个挑战。我试着让这个教程变得简单。但是如果你对这篇文章有任何疑问，请在评论部分告诉我。还可以与您的朋友分享这篇文章，并帮助他们学习Linux。
--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/dual-boot-ubuntu-and-arch-linux

作者：[LinuxAndUbuntu][a]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/home/etcher-burn-images-to-sd-card-make-bootable-usb
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/bootable-ubuntu-usb-etcher-image-writer_orig.jpg
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/make-ubuntu-usb-bootable-in-linux_orig.jpg
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/live-ubuntu-boot_orig.jpg
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-usb-from-live-usb_orig.jpg
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/custom-partition-hd-install-ubuntu_orig.jpg
[7]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/create-swap-partition-ubuntu_orig.jpg
[8]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-ubuntu-root-partition_orig.jpg
[9]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/select-ubuntu-timezone_orig.jpg
[10]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-ubuntu-select-location-keyboard-layout_orig.jpg
[11]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/create-username-system-name-ubuntu-install_orig.jpg
[12]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/ubuntu-installation-finishing_orig.jpg
[13]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/ubuntu-installation-finished_orig.jpg
[14]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/remove-installation-media-after-ubuntu_orig.jpg
[15]:http://www.linuxandubuntu.com/home/arch-linux-take-your-linux-knowledge-to-next-level-review
[16]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-linux-installation-boot-menu_orig.jpg
[17]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-linux-tty1-linux_orig.png
[18]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-linux-ping-check-internet-connection_orig.png
[19]:http://www.linuxandubuntu.com/home/how-to-setup-a-wifi-in-arch-linux-using-terminal
[20]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-arch-partition-disk-with-cfdisk_orig.png
[21]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/partition-free-space-swap-arch-linux_orig.png
[22]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-arch-linux-partition_orig.png
[23]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/make-arch-linux-root-as-primary-partition_orig.png
[24]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/select-partition-to-install-arch_orig.png
[25]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-arch-linux-confirm-create-partition_orig.png
[26]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/quit-cfdisk-arch-linux_orig.png
[27]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/confirm-partition-changes_orig.png
[28]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/complete-arch-linux-installation-partition_orig.png
[29]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/mount-base-partition-in-arch-linux.png
[30]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/mount-home-partition-arch-linux.png
[31]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/make-mount-home-directory.png
[32]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/install-arch-linux-base.png
[33]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/create-fstab-file-in-arch-linux.png
[34]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/cat-fstab-file-data-terminal.png
[35]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/generate-localization-arch-linux.png
[36]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/setup-zonefile-in-arch-linux.png
[37]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/setup-country-zonefile_orig.png
[38]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/setup-arch-linux-root-password.png
[39]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/set-arch-linux-hostname.png
[40]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/set-arch-linux-username.png
[41]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/reboot-system-after-arch-linux-installation.png
[42]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/ubuntu-grub-menu.png
