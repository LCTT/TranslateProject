为树莓派 3 构建 64 位内核
============================================================


> 编辑：在写完这个这篇文章之后，我在树莓派 3 上基于 Debian 开始打造 64 位的系统。你可以[在这里找到][3]。

**树莓派 3** 配有 Broadcom BCM2837 64 位 ARMv8 四核 Cortex A53 处理器，它是一个 **64 位 CPU**。如果你有一块，运行以下命令可能会让你感到惊讶：

```
uname -a
Linux raspberrypi 4.4.34-v7+ #930 SMP Wed Nov 23 15:20:41 GMT 2016 armv7l GNU/Linux
```

是的，这是一个 **32 位内核**。这是因为树莓派基金会还没有为官方的树莓派系统 Raspbian 提供 64 位版本。然而你可以构建一个，多亏了 [Electron752][9] 提供的许多补丁。

### 构建内核

树莓派基金会维护着[它们自己的 Linux 内核分支][10]，它为它们的设备特别裁剪过，同时定期地从上游合并。

我们将会遵照[这个页面][11]的指导来**构建一个 64 位内核**。

我们不能使用“本地构建”的方法，因为它需要一块 64 位的树莓派，这个我们明显还没有。因此我们需要**交叉编译**它，**Ubuntu** 是推荐的系统。我个人没有 Ubuntu，因此我在一个有 2 个 CPU 的 Ubuntu 16.04 Digital Ocean 实例上构建，这应该花费我 $0.03。如果你也想这么做，你可以通过[这个链接][12]得到 $10 的免费额度。或者你可以通过使用 Virtualbox 中的 Ubuntu VM 作为实例。

首先，我们需要一些**构建工具**以及** aarch64 交叉编译器**：

```
apt-get update
apt-get install -y bc build-essential gcc-aarch64-linux-gnu git unzip
```

接着我们可以下载 **Linux 内核源码**：

```
git clone –depth=1 -b rpi-4.8.y https://github.com/raspberrypi/linux.git
```

进入到创建的 git 目录。另外你可以为你的内核添加额外的版本标签，可以通过编辑 `Makefile` 的开始几行完成：

```
VERSION = 4
PATCHLEVEL = 8
SUBLEVEL = 13
EXTRAVERSION = +bilal
```

为了**构建它**，运行下面的命令：

```
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bcmrpi3_defconfig
make -j 3 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
```

第一个应该很快。第二个则会完全不同，我没有精确计时，但是对我来说大概要半个小时。根据你的 CPU 数（nproc * 1.5）调整 `-j` 标志。

### 选择一个 Linux 发行版

在内核编译的时候，我们可以开始准备它的 Linux 发行版了。在本教程中为了简单我使用 **Raspbian**，即使这是一个只有 32 位的发行版。

> 如果你想要一直用 64 位系统，你应该选一个有 aarch64 支持的发行版，Debian 有一个健壮的 [ARM64 移植版][4]。得到它基本有三种方式：
>  - 下载一个预构建的根文件系统，这很可能会如页面中提到的那样给你一个过期的版本。
>  - 如果你熟悉 debootstrap，用它构建你自己的（这回比较棘手，因为它需要一些手工调整，它最初的目的是在已经运行的主机上进行 chroot，而不是为其他机器构建根文件系统）
>  - 我建议使用 multistrap，这里有一个很好的教程：http://free-electrons.com/blog/embdebian-with-multistrap/

回到 Raspbian，我们现在可以下载官方系统，并开始准备了。

打开一个新的 shell 会话并运行下面的命令：

```
wget -O raspbian.zip https://downloads.raspberrypi.org/raspbian_lite_latest
unzip raspbian.zip
```

我们用下面的命令审查：

```
fdisk -l 2016-11-25-raspbian-jessie-lite.img
Disk 2016-11-25-raspbian-jessie-lite.img: 1.3 GiB, 1390411776 bytes, 2715648 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x244b8248

Device Boot Start End Sectors Size Id Type
2016-11-25-raspbian-jessie-lite.img1 8192 137215 129024 63M c W95 FAT32 (LBA)
2016-11-25-raspbian-jessie-lite.img2 137216 2715647 2578432 1.2G 83 Linux
```

我们可以看到它有**两个分区**。第一个是**启动分区**，它主要包含了 bootloader、Linux 内核以及少量配置文件。第二个是**根分区**。

我们可以在我们的文件系统上**挂载这些分区**，从**根分区**开始：

```
mount -o loop,offset=70254592 2016-11-25-raspbian-jessie-lite.img /mnt
```

`offset` 取决于扇区大小（512）：70254592 = 512 * 137216

接着是**启动分区**：

```
mount -o loop,offset=4194304,sizelimit=66060288 2016-11-25-raspbian-jessie-lite.img /mnt/boot
```

`offset` ：4194304 = 512 * 8192，`sizelimit`：66060288 = 512 * 129024 。

树莓派系统现在应该可以在 `/mnt` 中看到了。我们基本要完成了。

### 打包内核

内核编译完成后，最后一步包括**复制 Linux 内核**以及**设备树**到启动分区中：

```
cp arch/arm64/boot/Image /mnt/boot/kernel8.img
cp arch/arm64/boot/dts/broadcom/bcm2710-rpi-3-b.dtb /mnt/boot/
```

调整 `config.txt` :

```
echo “kernel=kernel8.img” >> /mnt/boot/config.txt
```

安装**内核模块** :

```
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu INSTALL_MOD_PATH=/mnt modules_install
umount /mnt/boot
umount /mnt
```

就是这样了，用于树莓派 3 的** ARM64 Linux 内核**诞生了！

现在你可以压缩镜像，通过 scp 下载下来，并按照标准的步骤放到你的 SD 卡中。

最后你会得到：

```
uname -a
Linux raspberrypi 4.8.13+bilal-v8+ #1 SMP Wed Dec 14 14:09:38 UTC 2016 aarch64 GNU/Linux
```

--------------------------------------------------------------------------------

via: https://devsidestory.com/build-a-64-bit-kernel-for-your-raspberry-pi-3/

作者：[Bilal Amarni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://devsidestory.com/about-me
[1]:https://devsidestory.com/author/bamarni/
[2]:https://devsidestory.com/build-a-64-bit-kernel-for-your-raspberry-pi-3/
[3]:https://github.com/bamarni/pi64
[4]:https://wiki.debian.org/Arm64Port
[5]:https://devsidestory.com/#twitter
[6]:https://devsidestory.com/#linkedin
[7]:https://devsidestory.com/#google_plus
[8]:https://www.addtoany.com/share#url=https%3A%2F%2Fdevsidestory.com%2Fbuild-a-64-bit-kernel-for-your-raspberry-pi-3%2F&title=Build%20a%2064-bit%20Kernel%20for%20your%20Raspberry%20Pi%203
[9]:https://github.com/Electron752
[10]:https://github.com/raspberrypi/linux
[11]:https://www.raspberrypi.org/documentation/linux/kernel/building.md
[12]:https://m.do.co/c/8ef9c5832a9c
