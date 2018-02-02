怎样完整地更新并升级基于Debian的离线操作系统
======

![](https://www.ostechnix.com/wp-content/uploads/2017/11/Upgrade-Offline-Debian-based-Systems-2-720x340.png)

不久之前我已经向你展示了如何在任意[ **离线的Ubuntu**][1] 操作系统和任意 [**离线的Arch Linux**][2] 操作系统上安装软件。 今天，我们将会看看如何完整地更新并升级基于Debian(Debian-based)的离线操作系统。 和之前所述方法的不同之处在于，(这次)我们将会升级整个操作系统(落后的软件包)，而不是单个的软件包。这个方法在你没有没有网络链接或拥有的网络速度很慢的时候十分有用。

### 完整更新并升级基于Debian的离线操作系统

首先假设，你家里拥有正在运行并配置有高速互联网链接的系统(Windows或者Linux)和一个没有网络链接或网络很慢(例如拨号网络)的Debian或Debian的衍生版本系统。现在如果你想要更新你的离线家用操作系统怎么办？购买一个更加高速的网络链接？不，根本不需要！你仍然可以通过互联网更新升级你的离线操作系统。这正是 **Apt-Offline**工具可以帮助你做到的。

正如其名，apt-offline 是一个为Debian和Debian衍生发行版诸如Ubuntu，Linux Mint这样基于APT的操作系统提供的离线APT包管理器。使用apt-offline，我们可以完整地更新/升级我们的Debian系统而不需要网络链接。这个程序是由Python编程语言写成的兼具CLI和图形接口的跨平台工具。

#### 准备工作

#### Requirements

  * 一个已经联网的操作系统(Windows或者Linux)。在这份手册中，为了便于理解，我们将之称为在线操作系统(online system)。
  * 一个离线操作系统(Debian或者Debian衍生版本)。我们称之为离线操作系统(offline system)。
  * 有足够空间容纳所有更新包的USB驱动器或者外接硬盘。



#### Installation

#### 安装

Apt-Offline可以在Debian和其衍生版本的默认仓库中获得。如果你的在线操作系统是运行的Debian，Ubuntu，Linux Mint，和其他基于DEB的操作系统，你可以通过下面的命令安装Apt-Offline:

```shell
sudo apt-get install apt-offline
```

如果你的在线操作系统运行的是非Debian类的发行版，使用git clone获取Apt-Offline仓库:

```shell
git clone https://github.com/rickysarraf/apt-offline.git
```

切换到克隆的目录下并在此处运行。
```shell
cd apt-offline/
```
```shell
sudo ./apt-offline
```

#### 离线操作系统上的步骤(没有联网的操作系统)

到你的离线操作系统上创建一个你想存储签名文件的目录
```shell
mkdir ~/tmp
```
```shell
cd ~/tmp/
```

你可以自己选择使用任何目录。接下来，运行下面的命令生成签名文件:
```shell
sudo apt-offline set apt-offline.sig
```

示例输出如下:
```shell
Generating database of files that are needed for an update.

Generating database of file that are needed for operation upgrade
```

默认条件下，apt-offline将会生成需要更新和升级的(相关)文件的数据库。你可以使用 **--` update`** 或者 **--upgrade ** 选项选择创建(升级或者更新相关文件的数据库)的其中之一。

拷贝完整的**tmp**目录到你的USB驱动器或者或者外接硬盘上，然后换到你的在线操作系统(有网络链接的操作系统)。

Copy the entire **tmp** folder in an USB drive or external drive and go to your online system (Internet-enabled system).

#### 在线操作系统上的步骤

插入你的USB驱动器然后进入临时文件夹：
```shell
cd tmp/
```

然后，运行如下命令：
```shell
sudo apt-offline get apt-offline.sig --threads 5 --bundle apt-offline-bundle.zip
```

在这里的"-threads 5"代表着APT仓库的数目.。如果你想要从更多的仓库下载软件包，你可以增加这里的数值。然后 "-bundle apt-offline-bundle.zip" 选项表示所有的软件包将会打包到一个叫做**apt-offline-bundle.zip**的单独存档中。这个存档文件将会被保存在当前的工作目录中。

上面的命令将会按照之前在离线操作系统上生成的签名文件下载数据。

[![][3]][4]

根据你的网络状况，这个操作将会花费几分钟左右的时间。请记住，apt-offline是跨平台的，所以你可以在任何操作系统上使用它下载包。

一旦下载完成，拷贝**tmp**文件夹到你的USB 或者外接硬盘上并且返回你的离线操作系统。千万保证你的USB驱动器上有足够的空闲空间存储所有的下载文件，因为所有的包都放在**tmp**文件夹里了。

#### 离线操作系统上的步骤

把你的设备插入你的离线操作系统，然后切换到你之前下载了所有包的**tmp**目录下。
```shell
cd tmp
```

然后，运行下面的命令来安装所有下载好的包。
```shell
sudo apt-offline install apt-offline-bundle.zip
```

这个命令将会更新APT数据库，所以APT将会找到在APT缓冲里所有需要的包。

**注意事项：** 如果在线和离线操作系统都在同一个局域网中，你可以通过"scp"或者其他传输应用程序将**tmp**文件传到离线操作系统中。如果两个操作系统在不同的位置(译者注：意指在不同的局域网)，那就使用USB设备来拷贝(就可以了)。

好了大伙儿，现在就这么多了。 希望这篇指南对你有用。还有更多好东西正在路上。敬请关注！

祝你愉快！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/fully-update-upgrade-offline-debian-based-systems/

作者：[SK][a]
译者：[Leemeans](https://github.com/leemeans)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/install-softwares-offline-ubuntu-16-04/
[2]:https://www.ostechnix.com/install-packages-offline-arch-linux/
[3]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]:http://www.ostechnix.com/wp-content/uploads/2017/11/apt-offline.png
