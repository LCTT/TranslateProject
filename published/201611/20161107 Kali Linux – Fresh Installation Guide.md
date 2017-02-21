全新 Kali Linux 系统安装指南
===============

Kali Linux 系统可以说是在[安全测试方面最好][18]的开箱即用的 Linux 发行版。Kali 下的很多工具软件都可以安装在大多数的 Linux 发行版中，Offensive Security 团队在 Kali 系统的开发过程中投入大量的时间精力来完善这个用于渗透测试和安全审计的 Linux 发行版。

Kali Linux 是基于 Debian 的面向安全的发行版本。该系统由于预安装了上百个知名的安全工具软件而出名。

Kali 甚至在信息安全领域还有一个含金量较高的认证叫做“Kali 渗透测试（Pentesting with Kali）”认证。该认证的申请者必须在艰难的 24 小时内成功入侵多台计算机，然后另外 24 小时内完成渗透测试报告并发送给 Offensive Security 的安全人员进行评审。成功通过考试的人将会获得 OSCP 认证证书。

本安装指南及以后的文章主要是为了帮助个人熟悉 Kali Linux 系统和其中一些工具软件的使用。

**请谨慎使用 Kali 下的工具，因为其中一些工具如果使用不当将会导致计算机系统损坏。请在合法的途径下使用所有 Kali 系列文章中所包含的信息。**

### 系统要求

Kali 系统对硬件有一些最基本的要求及建议。根据用户使用目的，你可以使有更高的配置。这篇文章中假设读者想要把 kali 安装为电脑上唯一的操作系统。

1.	至少 10GB 的磁盘空间；强烈建议分配更多的存储空间。
2.	至少 512MB 的内存；希望有更多的内存，尤其是在图形界面下。
3.	支持 USB 或 CD/DVD 启动方式。
4.  Kali Linux 系统 ISO 镜像下载地址 [https://www.kali.org/downloads/][1]。

### 使用 dd 命令创建 USB 启动工具

该文章假设可使用 USB 设备来引导安装系统。注意尽可能的使用 4GB 或者 8GB 的 USB 设备，并且其上的所有数据将会被删除。

本文作者在使用更大容量的 USB 设备在安装的过程中遇到了问题，但是别的人应该还是可以的。不管怎么说，下面的安装步骤将会清除 USB 设备内的数据。

在开始之前请务必备份所有数据。用于安装 Kali Linux 系统的 USB 启动设备将在另外一台机器上创建完成。

第一步是获取 Kali Linux 系统 ISO 镜像文件。本指南将使用最新版的包含 Enlightenment 桌面环境的 Kali Linux 系统进行安装。

在终端下输入如下命令来获取这个版本的 ISO 镜像文件。

```
$ cd ~/Downloads
$ wget -c http://cdimage.kali.org/kali-2016.2/kali-linux-e17-2016.2-amd64.iso
```

上面两个命令将会把 Kali Linux 的 ISO 镜像文件下载到当前用户的 Downloads 目录。

下一步是把 ISO 镜像写入到 USB 设备中来启动安装程序。我们可以使用 Linux 系统中的 `dd` 命令来完成该操作。首先，该 USB 设备要在 `lsblk` 命令下可找到。

```
$ lsblk
```

![Find Out USB Device Name in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Find-USB-Device-Name-in-Linux.png) 

*在 Linux 系统中确认 USB 设备名*

确定 USB 设备的名字为 `/dev/sdc`，可以使用 dd 工具将 Kali 系统镜像写入到 USB 设备中。

```
$ sudo dd if=~/Downloads/kali-linux-e17-2016.2-amd64.iso of=/dev/sdc
```

**注意：**以上命令需要 root 权限，因此使用 `sudo` 命令或使用 root 账号登录来执行该命令。这个命令会删除 USB 设备中的所有数据。确保已备份所需的数据。

一旦 ISO 镜像文件完全复制到 USB 设备，接下来可进行 Kali Linux 系统的安装。

### 安装 Kali Linux 系统

1、 首先，把 USB 设备插入到要安装 Kali 操作系统的电脑上，然后从 USB 设备引导系统启动。只要成功地从 USB 设备启动系统，你将会看到下面的图形界面，选择“Install”或者“Graphical Install”选项。

本指南将使用“Graphical Install”方式进行安装。

![Kali Linux Boot Menu](http://www.tecmint.com/wp-content/uploads/2016/10/Kali-Linux-Boot-Menu.png) 

*Kali Linux 启动菜单*

2、 下面几个界面将会询问用户选择区域设置信息，比如语言、国家，以及键盘布局。

选择完成之后，系统将会提示用户输入主机名和域名信息。输入合适的环境信息后，点击继续安装。

![Set Hostname for Kali Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Set-Hostname-for-Kali-Linux.png) 

*设置 Kali Linux 系统的主机名*

![Set Domain for Kali Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Set-Domain-for-Kali-Linux.png) 

*设置 Kali Linux 系统的域名*

3、 主机名和域名设置完成后，需要设置 root 用户的密码。请勿忘记该密码。

![Set Root User Password for Kali Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Set-Root-User-Password-for-Kali-Linux.png) 

*设置 Kali Linux 系统用户密码*

4、 密码设置完成之后，安装步骤会提示用户选择时区然后停留在硬盘分区界面。

如果 Kali Linux 是这个电脑上的唯一操作系统，最简单的选项就是使用“Guided – Use Entire Disk”，然后选择你需要安装 Kali 的存储设备。

![Select Kali Linux Installation Type](http://www.tecmint.com/wp-content/uploads/2016/10/Select-Kali-Linux-Installation-Type.png) 

*选择 Kali Linux 系统安装类型*

![](http://www.tecmint.com/wp-content/uploads/2016/10/Select-Kali-Linux-Installation-Disk.png)

*选择 Kali Linux 安装磁盘*

5、 下一步将提示用户在存储设备上进行分区。大多数情况下，我们可以把整个系统安装在一个分区内。

![Install Kali Linux Files in Partition](http://www.tecmint.com/wp-content/uploads/2016/10/Install-Kali-Linux-Files-in-Partition.png) 

*在分区上安装 Kali Linux 系统*

6、	最后一步是提示用户确认将所有的更改写入到主机硬盘。注意，点确认后将会**清空整个磁盘上的所有数据**。

 ![Confirm Disk Partition Write Changes](http://www.tecmint.com/wp-content/uploads/2016/10/Confirm-Disk-Partition-Write-Changes.png) 

*确认磁盘分区更改*

7、 一旦确认分区更改，安装包将会进行复制文件的安装过程。安装完成后，你需要设置一个网络镜像源来获取软件包和系统更新。如果你希望使用 Kali 的软件库，确保开启此功能。

![Configure Kali Linux Package Manager](http://www.tecmint.com/wp-content/uploads/2016/10/Configure-Kali-Linux-Package-Manager.png) 

*配置 Kali Linux 包管理器*

8、 选择网络镜像源后，系统将会询问你安装 Grub 引导程序。再次说明，本文假设你的电脑上仅安装唯一的 Kali Linux 操作系统。

在该屏幕上选择“Yes”，用户需要选择要写入引导程序信息的硬盘引导设备。

![Install GRUB Boot Loader](http://www.tecmint.com/wp-content/uploads/2016/10/Install-GRUB-Boot-Loader.png) 

*安装 Grub 引导程序*

![Select Partition to Install GRUB Boot Loader](http://www.tecmint.com/wp-content/uploads/2016/10/Select-Partition-to-Install-GRUB-Boot-Loader.png) 

*选择安装 Grub 引导程序的分区*

9、 当 Grub 安装完成后，系统将会提醒用户重启机器以进入新安装的 Kali Linux 系统。

![Kali Linux Installation Completed](http://www.tecmint.com/wp-content/uploads/2016/10/Kali-Linux-Installation-Completed.png) 

*Kali Linux 系统安装完成*

10、 因为本指南使用 Enlightenment 作为 Kali Linux 系统的桌面环境，因此默认情况下是启动进入到 shell 环境。

使用 root 账号及之前安装过程中设置的密码登录系统，以便运行 Enlightenment 桌面环境。

登录成功后输入命令`startx`进入 Enlightenment 桌面环境。

```
# startx
```

![Start Enlightenment Desktop in Kali Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Start-Enlightenment-Desktop-in-Kali-Linux.png) 

*Kali Linux 下进入 Enlightenment 桌面环境*

初次进入 Enlightenment 桌面环境时，它将会询问用户进行一些首选项配置，然后再运行桌面环境。

[
 ![Kali Linux Enlightenment Desktop](http://www.tecmint.com/wp-content/uploads/2016/10/Kali-Linux-Enlightenment-Desktop.png) 
][2]

*Kali Linux Enlightenment 桌面*

此时，你已经成功地安装了 Kali Linux 系统，并可以使用了。后续的文章我们将探讨 Kali 系统中一些有用的工具以及如何使用这些工具来探测主机及网络方面的安全状况。

请随意发表任何评论或提出相关的问题。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/kali-linux-installation-guide/

作者：[Rob Turner][a]
译者：[rusking](https://github.com/rusking)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/robturner/
[1]:https://www.kali.org/downloads/
[2]:http://www.tecmint.com/wp-content/uploads/2016/10/Kali-Linux-Enlightenment-Desktop.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/Start-Enlightenment-Desktop-in-Kali-Linux.png
[4]:http://www.tecmint.com/wp-content/uploads/2016/10/Kali-Linux-Installation-Completed.png
[5]:http://www.tecmint.com/wp-content/uploads/2016/10/Select-Partition-to-Install-GRUB-Boot-Loader.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/10/Install-GRUB-Boot-Loader.png
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/Configure-Kali-Linux-Package-Manager.png
[8]:http://www.tecmint.com/wp-content/uploads/2016/10/Confirm-Disk-Partition-Write-Changes.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/10/Install-Kali-Linux-Files-in-Partition.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/10/Select-Kali-Linux-Installation-Disk.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/10/Select-Kali-Linux-Installation-Type.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/10/Set-Root-User-Password-for-Kali-Linux.png
[13]:http://www.tecmint.com/wp-content/uploads/2016/10/Set-Domain-for-Kali-Linux.png
[14]:http://www.tecmint.com/wp-content/uploads/2016/10/Set-Hostname-for-Kali-Linux.png
[15]:http://www.tecmint.com/wp-content/uploads/2016/10/Kali-Linux-Boot-Menu.png
[16]:http://www.tecmint.com/wp-content/uploads/2016/10/Find-USB-Device-Name-in-Linux.png
[17]:http://www.tecmint.com/best-linux-desktop-environments/
[18]:http://www.tecmint.com/best-security-centric-linux-distributions-of-2016/