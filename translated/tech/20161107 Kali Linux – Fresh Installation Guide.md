#Kali Linux系统安装手册

Kali Linux系统可以说是在安全测试方面最好的开箱即用的Linux发行版。Kali下的很多工具软件都可以安装在大多数的Linux发行版中， the Offensive Offensive Security开发团队在Kali系统的开发过程中投入大量的时间精力来完善并发布了这个用于渗透测试和安全审计的Linux发行版。

Kali Linux是基于Debian的发行版本。该系统由于预安装了上百个知名的安全工具软件而出名。

Kali在信息安全领域有一个含金量较高的认证叫做“Kali渗透测试“认证。该认证的申请者必须在艰巨的24小时内成功入侵多台计算机，然后另外24小时内完成渗透测试报告并发送给Offensive Security的安全人员进行评审。成功通过考试的人将会获得OSCP认证证书。

该安装指南及以后的文章主要是为了帮助个人熟悉Kali Linux系统和其中一些工具软件的使用。

请谨慎使用kali下的工具，因为其中一些工具如果使用不当将会导致计算机系统损坏。请在合法的途径下使用所有Kali系列文章中所包含的信息。

#### 系统要求

Kali系统对硬件有一些最基本的要求及建议。根据用户使用目的而定，期望有更高的配置。这篇文章中假设读者想要在电脑上安装唯一的操作操作。

1.	至少10GB的磁盘空间；强烈建议分配更多的存储空间。
2.	至少512MB的内存；希望有更高的内存，尤其是在图形界面下。
3.	支持USB或CD/DVD启动方式
4.  4.	Kali Linux 系统ISO镜像下载地址 [https://www.kali.org/downloads/][1]

#### 使用dd命令创建USB启动工具

该文章假设可使用USB设备来引导安装系统。注意近可能的使用4GB或者8GB的USB设备，并且所有的数据将会被删除。

作者在使用大存储的USB设备在安装的过程中遇到问题，但是有些应该还是正常的。稍有不慎，下面的安装步骤将会导致USB设备内的数据丢失。

在开始之前请务必备份所有数据。用于安装Kali Linux系统的USB启动设备将在另外一台机器上创建完成。

第一步是获取Kali Linux系统ISO镜像文件。该手册将使用最新版的包含Enlightenment 桌面环境的Kali

Linux系统进行安装。

在终端下输入如下命令来获取这个版本的ISO镜像文件。

```
$ cd ~/Downloads
$ wget -c http://cdimage.kali.org/kali-2016.2/kali-linux-e17-2016.2-amd64.iso

```

上面两个命令将会把Kali Linux ISO镜像文件下载到当前用户的Downloads目录。
下一步是把ISO镜像写入到USB设备用作于安装启动工具。我们可以使用Linux系统中的dd命令来完成该操作。首先，该USB设备要在lsblk命令下可查询到。


```
$ lsblk

```
[
 ![Find Out USB Device Name in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Find-USB-Device-Name-in-Linux.png) 
][16]

在Linux系统中确认USB设备名

确定USB设备的名字为/dev/sdc，可以使用dd工具将Kali系统镜像写入到USB设备中。

```
$ sudo dd if=~/Downloads/kali-linux-e17-2016.2-amd64.iso of=/dev/sdc

```

注意：以上命令需要root权限，因此使用sudo命令或使用root账号登录来执行该命令。这个命令会删除USB设备中的所有数据。确保已备份所需的数据。
一旦ISO镜像文件完全复制到USB设备，接下来可进行Kali Linux系统的安装。

### 安装Kali Linux系统

1. 首先，把USB设备插入到要安装Kali操作系统的电脑上，然后从USB设备引导系统启动。只要成功地从USB设备启动系统，你将会看到下面的图形界面，选择’Install’或者’Graphical Install’选项。

该向导将使用’Graphical Install‘方式进行安装。

[
 ![Kali Linux Boot Menu](http://www.tecmint.com/wp-content/uploads/2016/10/Kali-Linux-Boot-Menu.png) 
][15]

Kali Linux 启动菜单

2. 下面几个界面将会询问用户选择区域设置信息，比如语言，国家，以及键盘布局。

选择完成之后，系统将会提示用户输入主机名和域名信息。输入合适的环境信息后，点击继续安装。

[
 ![Set Hostname for Kali Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Set-Hostname-for-Kali-Linux.png) 
][14]

设置Kali Linux系统的主机名

[
 ![Set Domain for Kali Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Set-Domain-for-Kali-Linux.png) 
][13]

设置Kali Linux系统的域名

3. 主机名和域名设置完成后，需要设置root用户的密码。请勿忘记该密码。

[
 ![Set Root User Password for Kali Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Set-Root-User-Password-for-Kali-Linux.png) 
][12]

设置Kali Linux系统用户密码

4. 密码设置完成之后，安装步骤会提示用户选择时间区域然后停留在硬盘分区界面。

如果Kali Linux是这个电脑上的唯一操作系统，最简单的选项就是使用“向导——整个磁盘”，然后选择你需要安装Kali的存储设备。

[
 ![Select Kali Linux Installation Type](http://www.tecmint.com/wp-content/uploads/2016/10/Select-Kali-Linux-Installation-Type.png) 
][11]

Select Kali Linux Installation Type

[
 ![Select Kali Linux Installation Disk](http://www.tecmint.com/wp-content/uploads/2016/10/Select-Kali-Linux-Installation-Disk.png) 
][10]

选择Kali Linux系统安装类型

5. 下一步将提示用户在存储设备上进行分区。大多数情况下，我们可以把整个系统安装在一个分区内。

[
 ![Install Kali Linux Files in Partition](http://www.tecmint.com/wp-content/uploads/2016/10/Install-Kali-Linux-Files-in-Partition.png) 
][9]

在分区上安装Kali Linux系统

6. 6.	最后一步是提示用户确认将所有的更改写入到主机硬盘。注意，点确认后将会清空整个磁盘上的所有数据。

[
 ![Confirm Disk Partition Write Changes](http://www.tecmint.com/wp-content/uploads/2016/10/Confirm-Disk-Partition-Write-Changes.png) 
][8]

确认磁盘分区更改

7. 一旦确认分区更改，安装包将会进行复制文件的安装过程。安装完成后，你需要设置一个网络镜像源来获取软件包和系统更新。如果你希望使用Kali 的软件库，确保开启此功能。

[
 ![Configure Kali Linux Package Manager](http://www.tecmint.com/wp-content/uploads/2016/10/Configure-Kali-Linux-Package-Manager.png) 
][7]

配置Kali Linux包管理器

8. 选择网络镜像源后，系统将会询问你安装grub引导器。再次说明，本文假设你的电脑上仅安装唯一的Kali Linux操作系统。

Selecting ‘Yes’ on this screen will allow the user to pick the device to write the necessary boot loader information to the hard drive to boot Kali.

[
 ![Install GRUB Boot Loader](http://www.tecmint.com/wp-content/uploads/2016/10/Install-GRUB-Boot-Loader.png) 
][6]

安装GRUB引导程序

[
 ![Select Partition to Install GRUB Boot Loader](http://www.tecmint.com/wp-content/uploads/2016/10/Select-Partition-to-Install-GRUB-Boot-Loader.png) 
][5]

选择安装Grub引导程序的分区

9. 当GRUB安装完成后，系统将会提醒用户重启机器以进入新安装的Kali Linux系统。

[
 ![Kali Linux Installation Completed](http://www.tecmint.com/wp-content/uploads/2016/10/Kali-Linux-Installation-Completed.png) 
][4]

Kali Linux系统安装完成

10. 该手册使用Enlightenment管理器作为Kali Linux系统的桌面环境，因此默认情况下是启动进入到shell环境。

使用root账号及之前安装过程中设置的密码登录系统，以便运行Enlightenment桌面环境。

登录成功后输入命令’startx’进入Enlightenment桌面环境。

```
# startx

```
[
 ![Start Enlightenment Desktop in Kali Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Start-Enlightenment-Desktop-in-Kali-Linux.png) 
][3]

Kali Linux下进入Enlightenment桌面环境

初次进入Enlightenment桌面环境时，它将会询问用户进行一些首选项配置，然后再运行桌面环境。

[
 ![Kali Linux Enlightenment Desktop](http://www.tecmint.com/wp-content/uploads/2016/10/Kali-Linux-Enlightenment-Desktop.png) 
][2]

Kali Linux Enlightenment桌面

此时，你已经成功地安装了Kali Linux 系统，并可以使用了。后续的文章我们将探讨Kali系统中一些有用的工具以及如何使用这些工具来探测主机及网络方面的安全状况。随意发表任何评论或提出相关的问题。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/kali-linux-installation-guide/

作者：[Rob Turner][a]

译者：[rusking](https://github.com/rusking)

校对：[校对者ID](https://github.com/校对者ID)

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