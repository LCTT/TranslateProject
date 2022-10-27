[#]: subject: (Copy files between Linux and FreeDOS)
[#]: via: (https://opensource.com/article/21/6/copy-files-linux-freedos)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13548-1.html)

在 Linux 和 FreeDOS 之间复制文件
======

> 下面是我如何在我的 FreeDOS 虚拟机和 Linux 桌面系统之间传输文件。

![](https://img.linux.net.cn/data/attachment/album/202107/04/181327bfvv3mmzby9z2dpr.jpg)

我运行 Linux 作为我的主要操作系统，我在一个虚拟机中启动 FreeDOS。大多数时候，我使用 QEMU 作为我的 PC 模拟器，但有时我会用 GNOME Boxes（它使用 QEMU 作为后端虚拟机）或用 VirtualBox 运行其他实验。

我喜欢玩经典的 DOS 游戏，有时我也会调出一个最喜欢的 DOS 应用。我在管理信息系统（MIS）课上讲计算机的历史，有时我会用 FreeDOS 和一个传统的 DOS 应用录制一个演示，比如 As-Easy-As（我最喜欢的 DOS 电子表格，曾经作为“共享软件”发布，但现在可以 [从 TRIUS 公司免费获得][2]）。

但是以这种方式使用 FreeDOS 意味着我需要在我的 FreeDOS 虚拟机和我的 Linux桌 面系统之间传输文件。让我来展示是如何做到这一点的。

### 用 guestmount 访问镜像

我曾经通过计算第一个 DOS 分区的偏移量来访问我的虚拟磁盘镜像，然后用正确的选项组合来调用 Linux 的 `mount` 命令来匹配这个偏移量。这总是很容易出错，而且不是很灵活。幸运的是，有一个更简单的方法可以做到这一点。来自 [libguestfs-tools][3] 包的 `guestmount` 程序可以让你从 Linux 中访问或 _挂载_ 虚拟磁盘镜像。你可以在 Fedora 上用这个命令安装 `libguestfs-tools`：

```
$ yum install libguestfs-tools libguestfs
```

使用 `guestmount` 并不像从 GNOME 文件管理器中双击文件那么简单，但命令行的使用并不难。`guestmount` 的基本用法是：

```
$ guestmount -a image -m device mountpoint
```

在这个用法中，`image` 是要使用的虚拟磁盘镜像。在我的系统中，我用 `qemu-img` 命令创建了 QEMU 虚拟磁盘镜像。`guestmount` 程序可以读取这种磁盘镜像格式，以及 GNOME Boxes 使用的 QCOW2 镜像格式，或者 VirtualBox 使用的 VDI 镜像格式。

`device` 选项表示虚拟磁盘上的分区。想象一下，把这个虚拟磁盘当作一个真正的硬盘使用。你可以用 `/dev/sda1` 访问第一个分区，用 `/dev/sda2` 访问第二个分区，以此类推。这就是 `guestmount` 的语法。默认情况下，FreeDOS 1.3 RC4 在一个空的驱动器上创建了一个分区，所以访问这个分区的时候要用 `/dev/sda1`。

而 `mountpoint` 是在你的本地 Linux 系统上“挂载” DOS 文件系统的位置。我通常会创建一个临时目录来工作。你只在访问虚拟磁盘时需要挂载点。

综上所述，我使用这组命令从 Linux 访问我的 FreeDOS 虚拟磁盘镜像：

```
$ mkdir /tmp/freedos
$ guestmount -a freedos.img -m /dev/sda1 /tmp/freedos
```

之后，我可以通过 `/tmp/freedos` 目录访问我的 FreeDOS 文件，使用 Linux 上的普通工具。我可以在命令行中使用 `ls /tmp/freedos`，或者使用桌面文件管理器打开 `/tmp/freedos` 挂载点。

```
$ ls -l /tmp/freedos
total 216
drwxr-xr-x. 5 root root 8192 May 10 15:53 APPS
-rwxr-xr-x. 1 root root 85048 Apr 30 07:54 COMMAND.COM
-rwxr-xr-x. 1 root root  103 May 13 15:48 CONFIG.SYS
drwxr-xr-x. 5 root root 8192 May 15 16:52 DEVEL
drwxr-xr-x. 2 root root 8192 May 15 13:36 EDLIN
-rwxr-xr-x. 1 root root 1821 May 10 15:57 FDAUTO.BAT
-rwxr-xr-x. 1 root root  740 May 13 15:47 FDCONFIG.SYS
drwxr-xr-x. 10 root root 8192 May 10 15:49 FDOS
-rwxr-xr-x. 1 root root 46685 Apr 30 07:54 KERNEL.SYS
drwxr-xr-x. 2 root root 8192 May 10 15:57 SRC
-rwxr-xr-x. 1 root root 3190 May 16 08:34 SRC.ZIP
drwxr-xr-x. 3 root root 8192 May 11 18:33 TEMP
```

![GNOME file manager][4]

*使用 GNOME 文件管理器来访问虚拟磁盘*

例如，要从我的 Linux `projects` 目录中复制几个 C 源文件到虚拟磁盘镜像上的 `C:\SRC`，以便我以后能在 FreeDOS 下使用这些文件，我可以使用 Linux `cp` 命令：

```
$ cp /home/jhall/projects/*.c /tmp/freedos/SRC
```

虚拟驱动器上的文件和目录在技术上是不分大小写的，所以你可以用大写或小写字母来引用它们。然而，我发现使用所有大写字母来输入 DOS 文件和目录更为自然。

```
$ ls /tmp/freedos
APPS     CONFIG.SYS EDLIN    FDCONFIG.SYS KERNEL.SYS SRC.ZIP
COMMAND.COM DEVEL    FDAUTO.BAT FDOS     SRC     TEMP

$ ls /tmp/freedos/EDLIN
EDLIN.EXE MAKEFILE.OW

$ ls /tmp/freedos/edlin
EDLIN.EXE MAKEFILE.OW
```

### 用 guestmount 卸载

在你再次在虚拟机中使用虚拟磁盘镜像之前，你应该总是先 _卸载_。如果你在运行 QEMU 或 VirtualBox 时让镜像挂载，你有可能弄乱你的文件。

与 `guestmount` 配套的命令是 `guestunmount`，用来卸载磁盘镜像。只要给出你想卸载的挂载点就可以了：

```
$ guestunmount /tmp/freedos
```

请注意命令拼写与 Linux 的 `umount` 稍有不同。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/copy-files-linux-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: http://www.triusinc.com/forums/viewtopic.php?t=10
[3]: https://libguestfs.org/
[4]: https://opensource.com/sites/default/files/uploads/gnome-file-manager.png (Using GNOME file manager to access the virtual disk)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
