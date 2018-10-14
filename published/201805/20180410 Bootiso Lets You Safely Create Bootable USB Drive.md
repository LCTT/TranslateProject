Bootiso ：让你安全地创建 USB 启动设备
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/USB-drive-720x340.png)

你好，新兵！你们有些人经常使用 `dd` 命令做各种各样的事，比如创建 USB 启动盘或者克隆硬盘分区。不过请牢记，`dd` 是一个危险且有毁灭性的命令。如果你是个 Linux 的新手，最好避免使用 `dd` 命令。如果你不知道你在做什么，你可能会在几分钟里把硬盘擦掉。从原理上说，`dd` 只是从 `if` 读取然后写到 `of` 上。它才不管往哪里写呢。它根本不关心那里是否有分区表、引导区、家目录或是其他重要的东西。你叫它做什么它就做什么。可以使用像 [Etcher][1] 这样的用户友好的应用来代替它。这样你就可以在创建 USB 引导设备之前知道你将要格式化的是哪块盘。

今天，我发现了另一个可以安全创建 USB 引导设备的工具 Bootiso 。它实际上是一个 BASH 脚本，但真的很智能！它有很多额外的功能来帮我们安全创建 USB 引导盘。如果你想确保你的目标是 USB 设备（而不是内部驱动器），或者如果你想检测 USB 设备，你可以使用 Bootiso。下面是使用此脚本的显著优点:

  * 如果只有一个 USB 驱动器，Bootiso 会自动选择它。
  * 如果有一个以上的 USB 驱动器存在，它可以让你从列表中选择其中一个。
  * 万一你错误地选择一个内部硬盘驱动器，它将退出而不做任何事情。
  * 它检查选定的 ISO 是否具有正确的 MIME 类型。如果 MIME 类型不正确，它将退出。
  * 它判定所选的项目不是分区，如果判定失败则退出。
  * 它将在擦除和对 USB 驱动器分区之前提示用户确认。
  * 列出可用的 USB 驱动器。
  * 安装 syslinux 引导系统 (可选)。
  * 自由且开源。

### 使用 Bootiso 安全地创建 USB 驱动器

安装 Bootiso 非常简单。用这个命令下载最新版本：

```
$ curl -L https://rawgit.com/jsamr/bootiso/latest/bootiso -O
```

把下载的文件加到 `$PATH` 目录中，比如 `/usr/local/bin/`。

```
$ sudo cp bootiso /usr/local/bin/
```

最后，添加运行权限：

```
$ sudo chmod +x /usr/local/bin/bootiso

```

搞定！现在就可以创建 USB 引导设备了。首先，让我们用命令看看现在有哪些 USB 驱动器：

```
$ bootiso -l
```

输出：

```
Listing USB drives available in your system:
NAME HOTPLUG SIZE STATE TYPE
sdb 1 7.5G running disk
```

如你所见，我只有一个 USB 驱动器。让我们继续通过命令用 ISO 文件创建 USB 启动盘：

```
$ bootiso bionic-desktop-amd64.iso
```

这个命令会提示你输入 `sudo` 密码。输入密码并回车来安装缺失的组件（如果有的话），然后创建 USB 启动盘。

输出：

```
[...]
Listing USB drives available in your system:
NAME HOTPLUG SIZE STATE TYPE
sdb 1 7.5G running disk
Autoselecting `sdb' (only USB device candidate)
The selected device `/dev/sdb' is connected through USB.
Created ISO mount point at `/tmp/iso.c5m'
`bootiso' is about to wipe out the content of device `/dev/sdb'.
Are you sure you want to proceed? (y/n)>y
Erasing contents of /dev/sdb...
Creating FAT32 partition on `/dev/sdb1'...
Created USB device mount point at `/tmp/usb.QgV'
Copying files from ISO to USB device with `rsync'
Synchronizing writes on device `/dev/sdb'
`bootiso' took 303 seconds to write ISO to USB device with `rsync' method.
ISO succesfully unmounted.
USB device succesfully unmounted.
USB device succesfully ejected.
You can safely remove it !
```

如果你的 ISO 文件 MIME 类型不对，你会得到下列错误信息：

```
Provided file `bionic-desktop-amd64.iso' doesn't seem to be an iso file (wrong mime type: `application/octet-stream').
Exiting bootiso...
```

当然，你也能像下面那样使用 `–no-mime-check` 选项来跳过 MIME 类型检查。

```
$ bootiso --no-mime-check bionic-desktop-amd64.iso
```

就像我前面提到的，如果系统里只有 1 个 USB 设备 Bootiso 将自动选中它。所以我们不需要告诉它 USB 设备路径。如果你连接了多个设备，你可以像下面这样使用 `-d` 来指明 USB 设备。

```
$ bootiso -d /dev/sdb bionic-desktop-amd64.iso
```

用你自己的设备路径来换掉 `/dev/sdb`。

在多个设备情况下，如果你没有使用 `-d` 来指明要使用的设备，Bootiso 会提示你选择可用的 USB 设备。

Bootiso 在擦除和改写 USB 盘分区前会要求用户确认。使用 `-y` 或 `–assume-yes` 选项可以跳过这一步。

```
$ bootiso -y bionic-desktop-amd64.iso
```

您也可以把自动选择 USB 设备与 `-y` 选项连用，如下所示。

```
$ bootiso -y -a bionic-desktop-amd64.iso
```

或者，

```
$ bootiso?--assume-yes?--autoselect bionic-desktop-amd64.iso
```

请记住，当你只连接一个 USB 驱动器时，它才会起作用。

Bootiso 会默认创建一个 FAT 32 分区，挂载后用 `rsync` 程序把 ISO 的内容拷贝到 USB 盘里。 如果你愿意也可以使用 `dd` 代替 `rsync` 。

```
$ bootiso --dd -d /dev/sdb bionic-desktop-amd64.iso
```

如果你想增加 USB 引导的成功概率，请使用 `-b` 或 `–bootloader` 选项。

```
$ bootiso -b bionic-desktop-amd64.iso
```

上面这条命令会安装 `syslinux` 引导程序（安全模式）。注意，此时 `–dd` 选项不可用。

在创建引导设备后，Bootiso 会自动弹出 USB 设备。如果不想自动弹出，请使用 `-J` 或 `–no-eject` 选项。

```
$ bootiso -J bionic-desktop-amd64.iso
```

现在，USB 设备依然连接中。你可以使用 `umount` 命令随时卸载它。

需要完整帮助信息，请输入：

```
$ bootiso -h
```

好，今天就到这里。希望这个脚本对你有帮助。好货不断，不要走开哦！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/bootiso-lets-you-safely-create-bootable-usb-drive/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[kennethXia](https://github.com/kennethXia)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/etcher-beauitiful-app-create-bootable-sd-cards-usb-drives/
