如何安装 Debian 的非 systemd 复刻版本 Devuan Linux
============================================================

Devuan Linux 是 Debian 最新的复刻版本，是基于 Debian 的一个被设计为完全去除了 systemd 的版本。

Devuan 宣布于 2014 年底，并经过了一段活跃的开发。最新的发行版本是 beta2，发行代号为： Jessie （没错，和当前 Debian 的稳定版同名）。

当前稳定版的最后发行据说会在 2017 年初。如果想了解关于该项目的更多信息，请访问社区官网：[https://devuan.org/][1] 。

本文将阐述 Devuan 当前发行版的安装。在 Debian 上可用的大多数软件包在 Devuan 上也是可用的，这有利于用户从 Debian 到 Devuan 的无缝过渡，他们应该更喜欢自由选择自己的初始化系统。

### 系统要求

Devuan 和 Debian 类似，对系统的要求非常低。最大的决定性因素是，用户希望使用什么样的桌面环境。这篇指南假设用户将使用一个“俗气的”桌面环境，建议至少满足下面所示的最低系统要求：

1.  至少 15GB 的硬盘空间；强烈鼓励有更大空间
2.  至少 2GB 的内存空间；鼓励更多
3.  支持 USB 或 CD/DVD 启动
4.  网络连接；安装过程中将会从网上下载文件

### Devuan Linux 安装

正如所有的指南一样，这篇指南假设你有一个 USB 驱动器，可作为安装媒介。注意，USB 驱动器应该有大约 4GB 或 8 GB 大，**并且需要删除所有数据**。

作者在使用太大的 USB 驱动器遇到过问题，不过你的也许可以工作。无论如何，在接下来的一些步骤中，**将导致 USB 驱动上的数据全部丢失**。

在开始准备安装之前，请先备份 USB 驱动器上的所有数据。这个可启动的 Linux USB 启动器要在另一个 Linux 系统上创建。

1、首先，从 [https://devuan.org/][2] 获取最新发行版的 Devuan 安装镜像，或者，你也可以在 Linux 终端上输入下面的命令来获取安装镜像：

```
$ cd ~/Downloads
$ wget -c https://files.devuan.org/devuan_jessie_beta/devuan_jessie_1.0.0-beta2_amd64_CD.iso
```

2、上面的命令将会把安装镜像文件下载到用户的 `Downloads` 目录。下一步是把安装镜像写入 USB 驱动器中，从而启动安装程序。

为了写入镜像，需要使用一个在 Linux 中叫做 `dd` 的工具。首先，需要使用 [lsblk 命令][3]来定位硬盘名字：

```
$ lsblk
```

[
 ![Find Device Name in Linux](http://www.tecmint.com/wp-content/uploads/2017/03/Find-Device-Name-in-Linux.png)
][4]

*找到 Linux 中的设备名字*

USB 驱动器的名字为 `／dev/sdc`，现在，可以使用 `dd` 工具把 Devuan 镜像写入驱动器中：

```
$ sudo dd if=~/Downloads/devuan_jessie_1.0.0-beta2_amd64_CD.iso of=/dev/sdc
```

重点：上面的命令需要有 root 权限，你可以使用 `sudo` 或者以 root 用户登录来运行命令。同时，这个命令将会删除 USB 驱动器上的所有数据，所以请确保备份了需要的数据。

3、当镜像写入 USB 驱动器以后，把 USB 驱动器插入要安装 Devuan 的电脑上，然后从 USB 驱动器启动电脑。

从 USB 驱动器成功启动以后，将会出现下面所示的屏幕，你需要在 “Install” 和 “Graphical Install” 这两个选项间选择一个继续安装进程。

在这篇指南中，我将使用 “Graphical Install” 方式。

[
 ![Devuan Graphic Installation](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Graphic-Installation.png)
][5]

*Devuan Graphic 安装*

4、当安装程序启动到“本地化”菜单以后，将会提示用户选择键盘布局和语言。只需选择你想要的选项，然后继续安装。

[
 ![Devuan Language Selection](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Language-Selection.png)
][6]

*Devuan 语言选择*

[
 ![Devuan Location Selection](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Location-Selection.png)
][7]

*Devuan 地区选择*

[
 ![Devuan Keyboard Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Keyboard-Configuration.png)
][8]

*Devuan 键盘配置*

5、下一步是向安装程序提供主机名和该机器所属的域名。

需要填写一个唯一的主机名，但如果电脑不属于任何域，那么域名可以不填。

[
 ![Set Devuan Linux Hostname](http://www.tecmint.com/wp-content/uploads/2017/03/Set-Devuan-Linux-Hostname.png)
][9]

*设置 Devuan Linux 的主机名*

[
 ![Set Devuan Linux Domain Name](http://www.tecmint.com/wp-content/uploads/2017/03/Set-Devuan-Linux-Domain-Name.png)
][10]

*设置 Devuan Linux 的域名*

6、填好主机名和域名信息以后，需要提供一个 root 用户密码。

请务必记住这个密码，因为当你在这台 Devuan 机器上执行管理任务时需要提供这个密码。默认情况下， Devuan 不会安装 sudo 包，所以当安装完成以后，管理用户就是 root 用户。

[
 ![Setup Devuan Linux Root User](http://www.tecmint.com/wp-content/uploads/2017/03/Setup-Devuan-Linux-Root-User.png)
][11]

*设置 Devuan Linux Root 用户*

7、下一步需要做的事情是创建一个非 root 用户。在任何可能的情况下，避免以 root 用户使用系统总是更好的。此时，安装程序将会提示你创建一个非 root 用户。

[
 ![Setup Devuan Linux User Account](http://www.tecmint.com/wp-content/uploads/2017/03/Setup-Devuan-Linux-User-Account.png)
][12]

*创建 Devuan Linux 用户账户*

8、一旦输入 root 用户密码，提示非 root 用户已经创建好以后，安装程序将会请求[通过 NTP 设置时钟][13]。

这时需要再次连接网络，大多数系统都需要这样。

[
 ![Devuan Linux Timezone Setup](http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Clock-on-Devuan-Linux.png)
][14]

*设置 Devuan Linux 的时区*

9、下一步需要做的是系统分区。对于绝大多数用户来说，选择“Guided – use entire disk”就够了。然而，如果需要进行高级分区，就需要进行分区。

[
 ![Devuan Linux Partitioning](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Partitioning.png)
][15]

*Devuan Linux 分区*

在上面点击 “continue” 以后，请确认分区更改，从而把分区信息写入硬盘。

10、分区完成以后，安装程序为 Devuan 安装一些基础文件。这个过程将会花费几分钟时间，直到系统开始配置网络镜像（软件库）才会停下来。当提示使用网络镜像时，通常点击 “yes”。

[
 ![Devuan Linux Configure Package Manager](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Configure-Package-Manager.png)
][16]

*Devuan Linux 配置包管理器*

点击 “yes” 以后将会给用户呈现一系列以国家分类的网络镜像。通常最好选择地理位置上离你的机器最近的镜像。

[
 ![Devuan Linux Mirror Selection](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Mirror-Selection.png)
][17]

*Devuan Linux 镜像选择*

[
 ![Devuan Linux Mirrors](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Mirrors.png)
][18]

*Devuan Linux 镜像*

11、下一步是设置 Debian 传统的 “popularity contest”，它能够追踪已下载包的使用统计。

在安装过程中，可以在管理员首选项中启用或禁用该功能。

[
 ![Configure Devuan Linux Popularity Contest](http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Devuan-Linux-Popularity-Contest.png)
][19]

*配置 Devuan Linux 的 Popularity Contest*

12、在简单浏览仓库和一些包的更新以后，安装程序会给用户展示一系列软件包，安装这些包可以提供一个桌面环境、SSH 访问和其它系统工具。

Devuan 会列举出一些主流桌面环境，但应该指出的是，并不是所有的桌面在 Devuan 上均可用。作者在 Devuan 上成功使用过 Xfce 、LXDE 和 Mate（未来的文章将会探究如何从源代码安装这些桌面环境）。

如果想要安装别的桌面环境，不要点击 “Devuan Desktop Environment” 复选框。

[
 ![Devuan Linux Software Selection](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Software-Selection.png)
][20]

*Devuan Linux 软件选择*

根据在上面的安装屏幕中选择的项目数，可能需要几分钟的时间来下载和安装软件。

当所有的软件都安装好以后，安装程序将会提示用户选择 grub 的安装位置。典型情况是选择安装在 `/dev/sda` 目录下。

[
 ![Devuan Linux Grub Install](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Grub-Install.png)
][21]

*Devuan Linux 安装 grub 引导程序*

[
 ![Devuan Linux Grub Install Disk](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Grub-Install-Disk.png)
][22]

*Devuan Linux Grub 程序的安装硬盘*

13、当 GRUB 程序成功安装到引导驱动器以后，安装程序将会提示用户安装已经完成，请重启系统。

[
 ![Devuan Linux Installation Completes](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Installation-Completes.png)
][23]

*Devuan Linux 安装完成*

14、如果安装顺利完成了，那么系统要么启动到选择桌面环境，或者如果没有选择桌面环境的话，会启动到一个基于文本的控制台。

[
 ![Devuan Linux Console](http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Console.png)
][24]

Devuan Linux 控制台。

这篇文章总结了最新版本的 Devuan Linux 的安装。在这个系列的下一篇文章将会阐述[如何从源代码为 Devuan Linux 安装  Enlightenment 桌面环境][25]。如果你有任何问题或疑问，请记得让我们知道。

--------------------------------------------------------------------------------

作者简介：

作者是 Ball 州立大学的计算机系讲师，目前教授计算机系的所有 Linux 课程，同时也教授 Cisco 网络课程。他是 Debian 以及其他 Debian 的衍生版比如 Mint、Ubuntu 和 Kali 的狂热用户。他拥有信息学和通信科学的硕士学位，同时获得了 Cisco、EC 理事会和 Linux 基金会的行业认证。

-----------------------------

via: http://www.tecmint.com/installation-of-devuan-linux/

作者：[Rob Turner][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/robturner/
[1]:https://devuan.org/
[2]:https://devuan.org/
[3]:http://www.tecmint.com/find-usb-device-name-in-linux/
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Find-Device-Name-in-Linux.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Graphic-Installation.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Language-Selection.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Location-Selection.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Keyboard-Configuration.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Set-Devuan-Linux-Hostname.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/Set-Devuan-Linux-Domain-Name.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/Setup-Devuan-Linux-Root-User.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/03/Setup-Devuan-Linux-User-Account.png
[13]:http://www.tecmint.com/install-and-configure-ntp-server-client-in-debian/
[14]:http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Clock-on-Devuan-Linux.png
[15]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Partitioning.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Configure-Package-Manager.png
[17]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Mirror-Selection.png
[18]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Mirrors.png
[19]:http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Devuan-Linux-Popularity-Contest.png
[20]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Software-Selection.png
[21]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Grub-Install.png
[22]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Grub-Install-Disk.png
[23]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Installation-Completes.png
[24]:http://www.tecmint.com/wp-content/uploads/2017/03/Devuan-Linux-Console.png
[25]:http://www.tecmint.com/install-enlightenment-on-devuan-linux/
[26]:http://www.tecmint.com/author/robturner/
[27]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[28]:http://www.tecmint.com/free-linux-shell-scripting-books/
