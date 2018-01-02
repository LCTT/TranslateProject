一步步教你如何安装 Arch Linux
======

![How to install Arch Linux][5]

> 简要说明：这一教程会教你如何用简单步骤安装 Arch Linux。

[Arch Linux][1] 是一个 x86-64 通用发行版，它流行于那些喜欢 [DIY][2] Linux 系统的用户和 Linux 铁杆粉丝当中。其默认的安装文件只含有一个最基本的系统，它希望使用者自己配置并使用 Arch 系统。其基于 KISS 原则（<ruby>使它保持简单、傻瓜<rt>Keep It Simple, Stupid!</rt></ruby>），Arch Linux 是一个专注于优雅、代码正确，精简而简洁的系统。

Arch 支持滚动发布模式，并且有自己的软件包管理器 —— [pacman][3]。为了提供一个先锐的操作系统，Arch 绝不会错失任何一个最新的源。实际上，它只提供了一个最小化的基本操作系统，使得你可以在低端硬件上安装 Arch，并且只安装你所必须的软件包。

同时，它也是最流行的从头开始学习 Linux 的操作系统之一。如果你想以 DIY 精神自己体验一番，你应该尝试一下 Arch Linux。 这被许多 Linux 用户视作核心的 Linux 体验。

在这篇文章里，我们会了解到如何安装、配置 Arch 并在其上安装桌面环境。

### 如何安装 Arch Linux

我们在这里讨论的安装方法是从你的电脑上**完全删除已有的操作系统** ，而后在其上安装 Arch Linux。如果你想遵循这一教程安装 Arch，请确保你已经备份了所有文件，否则你就会失去它们。切切。

在你从 USB 上安装 Arch 之前，请确保你已经满足了以下条件：

#### 安装 Arch Linux 的条件：

* 一个兼容 x86_64（例如 64 位）的机器
* 最小 512M 内存（建议 2GB）
* 最少 1GB 的磁盘空余空间（日常使用推荐 20GB）
* 可以访问互联网
* 至少有 2GB 存储空间的 USB 存储器
* 熟悉 Linux 命令行

一旦你确认满足所有条件，就可以开始安装 Arch Linux 了。

#### 第一步：下载 ISO 文件

你可以从[官网][6]上下载 ISO。安装 Arch Linux 需要一个至少有 512M 内存和 800M 磁盘空间，并兼容 x86_64 （如 64 位）的机器。不过，建议至少有 2G 内存和 20G 磁盘空间，这样安装桌面环境时就不会遇到麻烦。

#### 第二步：创建一个 Arch Linux 的现场版 USB 存储器

我们需要用你刚刚下载的 ISO 文件创建一个 Arch Linux 的<ruby>现场版<rt>live</rt></ruby> USB 存储器。

如果你使用 Linux，你可以用 `dd` 命令来创建现场版 USB 存储器。 记得将下面的例子中的 `/path/to/archlinux.iso` 改成你的 ISO 文件的实际存储位置，`/dev/sdx` 改成你的磁盘设备号（例如 `/dev/sdb`）。你可以通过 [lsblk][7] 命令来了解你的设备信息。

```
dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress && sync
```
在 Windows 下，有多种方法来创建现场版 USB 存储器。 推荐工具是 Rufus。我们之前已经有[如何使用这一工具创建Antergos 现场版 USB 存储器][8]的教程。因为 Antergos 发行版是基于 Arc h的，所以你可以使用同一教程。

#### 步骤三：从现场版 USB 存储器上启动

一旦你已经创建了 Arch Linux 的现场版 USB 存储器，关闭你的电脑。插上你的 USB 存储器然后启动系统。在开机启动时，持续按 F2、F10 或 F1 之类的按键（根据你的电脑型号而定）进入启动设置。在这里，选择“从 USB 存储器或可移除设备启动”这一项。

一旦你选择了它，你会看到这样一个选项：

![Arch Linux][9]  

选择“Boot Arch Linux (x86\_64)”。经过各种系统检查后，Arch Linux 会启动到 root 用户的命令行界面。

接下来的步骤包括磁盘分区、创建文件系统并挂载它。

#### 第四步：磁盘分区

第一步就是给你的硬盘分区。单根分区是最简单的，就在它上面创建根分区（`/`）分区、交换分区和 `home` 分区。

我有一个 19G 的硬盘，我想在这儿安装 Arch Linux。为了创建分区，输入：

```
fdisk /dev/sda
```

按 `n` 创建新分区。按 `p` 创建主分区，然后选择分区号。

第一个扇区会被自动选择，你只要按回车键。在确定分区的最后一个扇区时，请输入这一分区的大小。

用相同的方法为 `home` 和交换分区创建两个分区，按 `w` 来保存修改并退出。

![root partition][10]


#### 第四步：创建文件系统

因为我们已经有了三个分区，接下来就是创建文件系统来格式化分区。

我们用 `mkfs` 命令在根分区和 `home` 分区上创建文件系统，用 `mkswap` 创建交换分区。我们用 ext4 文件系统格式化磁盘。

```
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda3

mkswap /dev/sda2
swapon /dev/sda2
```

将这些分区挂载在根分区和 `home` 分区下：

```
mount /dev/sda1 /mnt
mkdir /mnt/home
mount /dev/sda3 /mnt/home
```

#### 第五步：安装

我们已经创建分区并挂载了分区，开始安装最基本的软件包。基本的软件包包括了系统运行所必需的所有软件包。比如有 GNU BASH shell、文件压缩工具、文件系统管理工具、C 语言库、压缩工具、Linux 内核及其模块，类库、系统工具、USB 设备工具、Vi 文本编辑器等等。

```
pacstrap /mnt base base-devel
```

#### 第六步：配置系统

生成一个 `fstab` 文件来规定磁盘分区、块设备，或者远程文件系统是如何挂载进文件系统中的。

```
genfstab -U /mnt >> /mnt/etc/fstab
```

进入 chroot 环境，这样可以为当前进程以及子进程切换当前根目录。

```
arch-chroot /mnt
```

一些需要与数据总线保持连接的 systemd 工具不能在 chroot 环境下使用，所以需要从当前环境退出。想要退出 chroot，就用下面的命令:

```
exit
```

#### 第七步：设定时区

用下面这条命令设定时区：

```
ln -sf /usr/share/<时区信息>/<地区>/<城市> /etc/localtime
```

获取时区列表，输入：

```
ls /usr/share/zoneinfo
```

用 `hwclock` 命令设定硬件时钟：

```
hwclock --systohc --utc
```

#### 第八步：设置地区

文件 `/etc/locale.gen` 在注释里包含了所有地区和系统语言设置。用 Vi 打开它，然后去掉你希望选择语言前面的注释。 我选择了 `en_GB.UTF-8`。

现在用下面的命令在 `/etc` 文件夹里生成 关于地区的配置文件：

```
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
export LANG=en_GB.UTF-8
```

#### 第九步 ：安装 bootloader，设置主机名和 root 密码

创建 `/etc/hostname` 文件 然后添加一个对应的主机名：

```
127.0.1.1 myhostname.localdomain myhostname
```

我添加了 `ItsFossArch` 作为我的主机名：

```
echo ItsFossArch > /etc/hostname
```

然后也将它添加到 `/etc/hosts` 中

为了安装 bootloader 使用下面的命令：

```
pacman -S grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

创建 root 密码，输入：

```
passwd
```

输入你想要的密码。

完成之后，更新你的系统。但很有可能你的系统已经是最新的，因为你下载的是最新的 ISO。

```
pacman -Syu
```

恭喜! 你已经安装了 Arch Linux 的命令行版本。

接下来，我们会了解到如何为 Arch 设置并安装一个桌面环境。我很喜欢 GNOME 桌面环境，所以在这儿也就选择了这个。

#### 第十步：安装桌面（这一例子中是 GNOME）

在你安装桌面之前，你需要先设置网络。

你可以用下面的命令看见你的端口：

```
ip link
```

![][11]

在我的电脑上，端口名是 `enp0s3`。

将下面这一段加进文件中：

```
vi /etc/systemd/network/enp0s3.network

[Match]
name=en*
[Network]
DHCP=yes
```

保存并退出。重启网络来应用你刚才的改动。

```
systemctl restart systemd-networkd
systemctl enable systemd-networkd
```

将下面这两句话加进 `/etc/resolv.conf` 中

```
nameserver 8.8.8.8
nameserver 8.8.4.4
```

下一步是安装 X 环境。

输入下面的命令安装 Xorg，并将它作为显示服务器。

```
pacman -S xorg xorg-server
```

gnome 包含了基本的 GNOME桌面，gnome-extra 则包含 GNOME 应用、归档管理器、磁盘管理器、文本编辑器和其它的应用。

```
pacman -S gnome gnome-extra
```

最后一步是在 Arch 上开启 GDM 显示管理器。

```
systemctl start gdm.service
systemctl enable gdm.service
```

重启你的系统，你就会看见 GNOME 的登录界面。

### Arch Linux 安装总结

我们在下面的视频中展示了一个由 Foss 读者 Gonzalo Tormo 提供的相似的安装方法（全屏观看，能更好的看清命令）：

![视频](https://youtu.be/iENmRwVhsTQ)

你也许意识到安装 Arch 不像[安装 Ubuntu][12] 一样简单。不过，只要有耐心，你一定可以安装好它，并且向全世界宣布你在用 Arch Linux。

Arch Linux 安装过程本身就是一个学习的机会。一旦安装完毕，我建议你参考它的 Wiki 去尝试其它的桌面环境，从而更深入了解这一操作系统。你可以探索它，发现它的强大之处。

如果你在安装 Arch 的过程中遇到任何问题，请在评论中给我们留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-arch-linux/

作者：[Ambarish Kumar][a]
译者：[wenwensnow](https://github.com/wenwensnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ambarish/
[1]:https://www.archlinux.org/
[2]:https://en.wikipedia.org/wiki/Do_it_yourself
[3]:https://wiki.archlinux.org/index.php/pacman
[4]:data:image/gif;base64,R0lGODdhAQABAPAAAP///wAAACwAAAAAAQABAEACAkQBADs=
[5]:https://itsfoss.com/wp-content/uploads/2017/12/install-arch-linux-featured-800x450.png
[6]:https://www.archlinux.org/download/
[7]:https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/s1-sysinfo-filesystems
[8]:https://itsfoss.com/live-usb-antergos/
[9]:https://itsfoss.com/wp-content/uploads/2017/11/1-2.jpg
[10]:https://itsfoss.com/wp-content/uploads/2017/11/4-root-partition.png
[11]:https://itsfoss.com/wp-content/uploads/2017/12/11.png
[12]:https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[13]:https://wiki.archlinux.org/
