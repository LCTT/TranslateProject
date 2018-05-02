如何在 Linux 上安装/更新 Intel 微码固件
======

如果你是一个 Linux 系统管理方面的新手，如何在 Linux 上使用命令行方式去安装或者更新 Intel/AMD CPU 的微码固件呢？

<ruby>微码<rt>microcode</rt></ruby>就是由 Intel/AMD 提供的 CPU 固件。Linux 的内核可以在引导时更新 CPU 固件，而无需 BIOS 更新。处理器的微码保存在内存中，在每次启动系统时，内核可以更新这个微码。这些来自 Intel/AMD 的微码的更新可以去修复 bug 或者使用补丁来防范 bug。这篇文章演示了如何使用包管理器或由 lntel 提供的 Linux 处理器微码更新来安装 AMD 或 Intel 的微码更新。

### 如何查看当前的微码状态

以 root 用户运行下列命令：

```
# dmesg | grep microcode
```

输出如下：

[![Verify microcode update on a CentOS RHEL Fedora Ubuntu Debian Linux][1]][1]

请注意，你的 CPU 在这里完全有可能出现没有可用的微码更新的情况。如果是这种情况，它的输出可能是如下这样的：

```
[ 0.952699] microcode: sig=0x306a9, pf=0x10, revision=0x1c
[ 0.952773] microcode: Microcode Update Driver: v2.2.

```

### 如何在 Linux 上使用包管理器去安装微码固件更新

对于运行在 x86/amd64 架构的 CPU 上的 Linux 系统，Linux 自带了工具去更改或者部署微码固件。在 Linux 上安装 AMD 或者 Intel 的微码固件的过程如下：

1. 打开终端应用程序
2. Debian/Ubuntu Linux 用户推输入：`sudo apt install intel-microcode`
3. CentOS/RHEL Linux 用户输入：`sudo yum install microcode_ctl`

对于流行的 Linux 发行版，这个包的名字一般如下 ：

* `microcode_ctl` 和 `linux-firmware` —— CentOS/RHEL 微码更新包
* `intel-microcode` —— Debian/Ubuntu 和衍生发行版的适用于 Intel CPU 的微码更新包
* `amd64-microcode` —— Debian/Ubuntu 和衍生发行版的适用于 AMD CPU 的微码固件
* `linux-firmware` —— 适用于 AMD CPU 的 Arch Linux 发行版的微码固件（你不用做任何操作，它是默认安装的）
* `intel-ucode` —— 适用于 Intel CPU 的 Arch Linux 发行版微码固件
* `microcode_ctl` 、`linux-firmware` 和 `ucode-intel` —— Suse/OpenSUSE Linux 微码更新包

**警告 ：在某些情况下，微码更新可能会导致引导问题，比如，服务器在引导时被挂起或者自动重置。以下的步骤是在我的机器上运行过的，并且我是一个经验丰富的系统管理员。对于由此引发的任何硬件故障，我不承担任何责任。在做固件更新之前，请充分评估操作风险！**

#### 示例

在使用 Intel CPU 的 Debian/Ubuntu Linux 系统上，输入如下的 [apt 命令][2]/[apt-get 命令][3]：

```
$ sudo apt-get install intel-microcode
```

示例输出如下：

[![How to install Intel microcode firmware Linux][4]][4]

你 [必须重启服务器以激活微码][5] 更新：

```
$ sudo reboot
```

重启后检查微码状态：

```
# dmesg | grep 'microcode'
```

示例输出如下：

```
[ 0.000000] microcode: microcode updated early to revision 0x1c, date = 2015-02-26
[ 1.604672] microcode: sig=0x306a9, pf=0x10, revision=0x1c
[ 1.604976] microcode: Microcode Update Driver: v2.01 <tigran@aivazian.fsnet.co.uk>, Peter Oruba
```

如果你使用的是 RHEL/CentOS 系统，使用 [yum 命令][6] 尝试去安装或者更新以下两个包：

```
$ sudo yum install linux-firmware microcode_ctl
$ sudo reboot
$ sudo dmesg | grep 'microcode'
```

### 如何更新/安装从 Intel 网站上下载的微码

只有在你的 CPU 制造商建议这么做的时候，才可以使用下列的方法去更新/安装微码，除此之外，都应该使用上面的方法去更新。大多数 Linux 发行版都可以通过包管理器来维护、更新微码。使用包管理器的方法是经过测试的，对大多数用户来说是最安全的方式。

#### 如何为 Linux 安装 Intel 处理器微码块（20180108 发布）

首先通过 AMD 或 [Intel 网站][7] 去获取最新的微码固件。在本示例中，我有一个名称为 `~/Downloads/microcode-20180108.tgz` 的文件（不要忘了去验证它的检验和），它的用途是去防范 `meltdown/Spectre` bug。先使用 `tar` 命令去提取它：

```
$ mkdir firmware
$ cd firmware
$ tar xvf ~/Downloads/microcode-20180108.tgz
$ ls -l
```

示例输出如下：

```
drwxr-xr-x 2 vivek vivek 4096 Jan 8 12:41 intel-ucode
-rw-r--r-- 1 vivek vivek 4847056 Jan 8 12:39 microcode.dat
-rw-r--r-- 1 vivek vivek 1907 Jan 9 07:03 releasenote
```

> 我只在 CentOS 7.x/RHEL、 7.x/Debian 9.x 和 Ubuntu 17.10 上测试了如下操作。如果你没有找到 `/sys/devices/system/cpu/microcode/reload` 文件的话，更老的发行版所带的更老的内核也许不能使用此方法。参见下面的讨论。请注意，在应用了固件更新之后，有一些客户遇到了系统重启现象。特别是对于[那些运行 Intel Broadwell 和 Haswell CPU][12] 的用于客户机和数据中心服务器上的系统。不要在 Intel Broadwell 和 Haswell  CPU 上应用 20180108 版本。尽可能使用软件包管理器方式。

检查一下，确保存在 `/sys/devices/system/cpu/microcode/reload`：

```
$ ls -l /sys/devices/system/cpu/microcode/reload
```

你必须使用 [cp 命令][8] 拷贝 `intel-ucode` 目录下的所有文件到 `/lib/firmware/intel-ucode/` 下面：

```
$ sudo cp -v intel-ucode/* /lib/firmware/intel-ucode/
```

你只需要将 `intel-ucode` 这个目录整个拷贝到 `/lib/firmware/` 目录下即可。然后在重新加载接口中写入 `1` 去重新加载微码文件：

```
# echo 1 > /sys/devices/system/cpu/microcode/reload
```

更新现有的 initramfs，以便于下次启动时它能通过内核来加载：

```
$ sudo update-initramfs -u
$ sudo reboot
```

重启后通过以下的命令验证微码是否已经更新：

```
# dmesg | grep microcode
```

到此为止，就是更新处理器微码的全部步骤。如果一切顺利的话，你的 Intel CPU 的固件将已经是最新的版本了。

### 关于作者

作者是 nixCraft 的创始人、一位经验丰富的系统管理员、Linux/Unix 操作系统 shell 脚本培训师。他与全球的包括 IT、教育、国防和空间研究、以及非盈利组织等各行业的客户一起工作。可以在 [Twitter][9]、[Facebook][10]、[Google+][11] 上关注他。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/install-update-intel-microcode-firmware-linux/

作者：[Vivek Gite][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2018/01/Verify-microcode-update-on-a-CentOS-RHEL-Fedora-Ubuntu-Debian-Linux.jpg
[2]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ "See Linux/Unix apt command examples for more info"
[3]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html "See Linux/Unix apt-get command examples for more info"
[4]:https://www.cyberciti.biz/media/new/faq/2018/01/How-to-install-Intel-microcode-firmware-Linux.jpg
[5]:https://www.cyberciti.biz/faq/howto-reboot-linux/
[6]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ "See Linux/Unix yum command examples for more info"
[7]:https://downloadcenter.intel.com/download/27431/Linux-Processor-Microcode-Data-File
[8]:https://www.cyberciti.biz/faq/cp-copy-command-in-unix-examples/ "See Linux/Unix cp command examples for more info"
[9]:https://twitter.com/nixcraft
[10]:https://facebook.com/nixcraft
[11]:https://plus.google.com/+CybercitiBiz
[12]:https://newsroom.intel.com/news/intel-security-issue-update-addressing-reboot-issues/