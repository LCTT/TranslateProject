[#]: subject: "How to Install Rocky Linux 9 Step by Step with Screenshots"
[#]: via: "https://www.linuxtechi.com/how-to-install-rocky-linux-9-step-by-step/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

图解 Rocky Linux 9 安装步骤 
======
这篇教程中，我们将图解 Rocky Linux 9 安装步骤。

Rocky 企业软件基金会已经发布了它的最新的操作系统 ‘Rocky Linux 9’ 。Rocky Linux 是针对工作站和服务器的自由和开放源文件的操作系统。它被认为是 CentOS Linux 的继承者。

‘Blue Onyx’ 是 Rocky Linux 9 的代码名称，它的 RHEL 9 的复制品。Rocky Linux 和 RHEL 之间的主要不同是，它有它自己的开放源文件构建系统，名称为 ‘Peridot’ 。

##### Rocky Linux 9 的新的更新和特色功能

* Gnome 40 是默认的桌面环境
* 在 XFS 文件系统上支持直接访问 (DAX) 操作
* 更新运行时和编译器，像 GCC 11.2.1 、LLVM (13.0.1) 、Rust (1.58.1) 和 Go (1.17.1)
* 更新开发工具链，像 Python 3.9 、Node.js 16 、Ruby 3.0.3 、Perl 5.32 和 PHP 8.0
* 默认情况下，通过 ssh 禁用 root 用户身份验证
* 更新 OpenSSL 3.0 和改善 cockpit web console
* 社区支持到 2032 年 05 月 31 日

##### 必要条件

* 2 GB RAM 或更多
* 2 个 CPU 核心 (1.1 GHz 处理器或更高)
* 20 GB 硬盘空间
* 可启动媒介盘 (USD 或 DVD)
* 因特网连接 (可选)

不再耽误时间，让我们跳入 Rocky Linux 9 的安装步骤

### 1) 下载 Rocky Linux 9 的 ISO 文件

使用下面的官方网址来下载 ISO 文件

* [Rocky Linux 9 ISO][1]

在你下载 iso 文件后，使用已下载的 ISO 文件制作一个可启动媒介盘 (USB/DVD)

在 Windows 中，你可以利用 ‘Rufus’ 软件来使用 ISO 文件来制作可启动 USB 驱动器。在 Linux 中，参考下面的内容

* [在 Ubuntu / Linux Mint 上，如何创建可启动 USB 驱动器][2]

### 2) 使用可启动媒介盘启动系统

前往你计划安装 Rocky Linux 9 的硬件系统，并在 BIOS 设置中将可启动介质从硬盘驱动器更改为 USB 驱动器, 重新启动它。

在硬件系统使用可启动介质启动后，我们将获得下面的屏幕，

![Select-Install-Rocky-Linux-9-option][3]

选择第一个选项， <ruby>安装 Rocky Linux 9.0<rt>Install Rocky Linux 9.0</rt></ruby> ，并按下 <ruby>回车<rt>enter</rt></ruby> 按键

### 3) 选择首选语言

选择安装过程的首选语言，然后单击 <ruby>继续<rt>Continue</rt></ruby> 按钮

![Preferred-Language-for-RockyLinux9-Installation][4]

### 4) 安装过程摘要

在这个步骤中，我们将获得下面的初始安装摘要。为开始安装，首先，我们必须完成标记项目T，像 <ruby>安装目标<rt>Installation Destination</rt></ruby> 和 <ruby>用户设置<rt>User settings</rt></ruby>

除了已标记的项目外，我们也可以更改现有的项目，只需要按照你的要求单击它们就可以进行更改。

![Initial-Installation-Summary-Rocky-Linux9][5]

##### 配置安装目标

在这个项目中，我们将为 Rocky Linux 具体指定分区方案。单击 <ruby>安装目标<rt>Installation Destination</rt></ruby>

在这里，我们可以为 <ruby>存储配置<rt>storage configuration</rt></ruby> 或 <ruby>分区方案<rt>partition scheme</rt></ruby> 选择 <ruby>自动<rt>automatic</rt></ruby> 选项或 <ruby>自定义<rt>custom </rt></ruby> 选项。

在自动选项中，安装程序将在磁盘上自动地创建分区，然而，自定义选项将允许我们在磁盘上手动创建分区。

![Choose-custom-Storage-Configuration-Rocky-Linux9][6]

在这篇指南中，我将使用 <ruby>自定义<rt>Custom</rt></ruby> 选项，单击 <ruby>执行<rt>Done</rt></ruby> 按钮。

![Standard-Partition-Scheme-RockyLinux9][7]

在该 40 GB 的磁盘上，我们将创建以下分区，

* /boot          :  2GB   (xfs file system)
* /                 : 10 GB  (xfs file system)
* /home         : 25 GB (xfs file system)
* Swap           : 2 GB

为开始创建分区，选择 <ruby>标准分区<rt>Standard Partition</rt> 方案，然后单击 + 符号。

创建第一个分区，大小为 2 GB 的 /boot 分区，

![Boot-Partition-RockyLinux9-Installation][8]

单击 <ruby>添加挂载点<rt>Add mount point</rt></ruby> 按钮。

类似地，接下来分别创建大小为 10 GB 的 / 分区和 25 GB 的 /home 分区

![Slash-Partition-Rocky-Linux9-installation][9]

![Home-Partition-Rocky-Linux9-Installation][10]

现在，创建最后一个分区，大小为 2 GB 的 swap 分区，

![Swap-Partition-RockyLinux9-Installation][11]

在你完成手动分区后，单击 <ruby>执行<rt>Done</rt></ruby> 按钮来完成这个项目。

![Finish-Manual-Partitioning-RockyLinux9-Installation][12]

选择 <ruby>接受更改<rt>Accept Changes</rt></ruby> 按钮来将这些更改写入磁盘。它也将返回到安装摘要屏幕。

![Accept-Changes-to-Write-on-Disk-RockyLinux9][13]

##### 配置用户设置

在<ruby>用户设置<rt>User Settings</rt></ruby>下，单击 <ruby>root 密码<rt>Root Password</rt></ruby> 按钮。

![Set-Root-Password-RockyLinux9-Instalation][14]

设置 root 用户的密码，并单击<ruby>执行<rt>Done</rt></ruby> 按钮，

再次回到 <ruby>用户设置<rt>User Settings</rt></ruby> 下，单击 <ruby>用户创建<rt>User Creation</rt></ruby> 按钮，具体指定本地用户是详细信息，例如用户名称和密码。

![Local-User-Create-During-RockyLinux9-Installation][15]

单击 <ruby>执行<rt>Done</rt></ruby> 按钮，它也将返回到安装摘要。

现在，我们准备开始安装，单击<ruby>开始安装<rt>Begin Installation</rt></ruby> 按钮，

![Begin-Installation-Option-RockyLinux9][16]

### 5) 安装过程开始

在这一步骤中，安装程序已经开始了，并在正在进行中，

![RockyLinux9-Installation-Progress][17]

在安装过程完成后，安装程序将提示你来重新启动系统。

![Reboot-System-after-RockyLinux9-Installation][18]

单击 <ruby>重新启动系统<rt>Reboot System</rt></ruby> 按钮，

注意：不要忘记在 BIOS 设置中将可启动介质从 USB 启动更改为硬盘驱动器启动

### 6) 安装后的登录屏幕和桌面环境

在成功安装后，当系统启动时，我们将获得下面的登录屏幕，

![RockyLinux9-Loginscreen-Post-Installation][19]

使用我们在安装期间创建的用户名称和密码，按下 <ruby>回车<rt>enter</rt></ruby> 按键来登录。

![Desktop-Env-RockyLinux9][20]

打开终端，依次运行下面的命令，

```
$ sudo dnf install epel-release -y
$ sudo dnf install neofetch -y
```

现在，来验证系统的详细信息，运行 neofetch 命令，

```
$ neofetch
```

![neofetch-rockylinux9-post-installation][21]

这就这篇指南的全部内容，我希望你发现它是有用的。请在下面的评论区贴出你的疑问和反馈。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/how-to-install-rocky-linux-9-step-by-step/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://rockylinux.org/download
[2]: https://www.linuxtechi.com/create-bootable-usb-disk-dvd-ubuntu-linux-mint/
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Select-Install-Rocky-Linux-9-option.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Preferred-Language-for-RockyLinux9-Installation.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Initial-Installation-Summary-Rocky-Linux9.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Choose-custom-Storage-Configuration-Rocky-Linux9.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Standard-Partition-Scheme-RockyLinux9.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Boot-Partition-RockyLinux9-Installation.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Slash-Partition-Rocky-Linux9-installation.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Home-Partition-Rocky-Linux9-Installation.png
[11]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Swap-Partition-RockyLinux9-Installation.png
[12]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Finish-Manual-Partitioning-RockyLinux9-Installation.png
[13]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Accept-Changes-to-Write-on-Disk-RockyLinux9.png
[14]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Set-Root-Password-RockyLinux9-Instalation.png
[15]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Local-User-Create-During-RockyLinux9-Installation.png
[16]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Begin-Installation-Option-RockyLinux9.png
[17]: https://www.linuxtechi.com/wp-content/uploads/2022/07/RockyLinux9-Installation-Progress.png
[18]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Reboot-System-after-RockyLinux9-Installation.png
[19]: https://www.linuxtechi.com/wp-content/uploads/2022/07/RockyLinux9-Loginscreen-Post-Installation.png
[20]: https://www.linuxtechi.com/wp-content/uploads/2022/07/Desktop-Env-RockyLinux9.png
[21]: https://www.linuxtechi.com/wp-content/uploads/2022/07/neofetch-rockylinux9-post-installation.png
