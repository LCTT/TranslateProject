Etcher.io 入门
======
> 用这个易用的媒体创建工具来创建一个可引导的 USB 盘或 SD 卡。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/community-penguins-osdc-lead.png?itok=BmqsAF4A)

可启动 USB 盘是尝试新的 Linux 发行版的很好的方式，以便在安装之前查看你是否喜欢它。虽然一些 Linux 发行版（如 [Fedora][1]）可以轻松创建可启动媒体，但大多数其他发行版提供 ISO 或镜像文件，并将创建媒体决定留给用户。用户总是可以选择使用 `dd` 在命令行上创建媒体——但让我们面对现实，即使对于最有经验的用户来说，这仍然很痛苦。也有一些其它程序，如 Mac 上的 UnetBootIn、Disk Utility 和 Windows 上的 Win32DiskImager，它们都可以创建可启动的 USB。

### 安装 Etcher

大约 18 个月前，我遇到了 [Etcher.io][2]，这是一个很棒的开源项目，可以在 Linux、Windows 或 MacOS 上轻松、简单地创建媒体。Etcher.io 已成为我为 Linux 创建可启动媒体的“首选”程序。我可以轻松下载 ISO 或 IMG 文件并将其刻录到闪存和 SD 卡。这是一个 [Apache 2.0][3] 许可证下的开源项目，[源代码][4] 可在 GitHub 上获得。

进入 [Etcher.io][5] 网站，然后单击适用于你的操作系统：32 位或 64 位 Linux、32 位或 64 位 Windows 或 MacOS 的下载链接。

![](https://opensource.com/sites/default/files/uploads/etcher_1.png)

Etcher 在 GitHub 仓库中提供了很好的指导，可以将 Etcher 添加到你的 Linux 实用程序集合中。

如果你使用的是 Debian 或 Ubuntu，请添加 Etcher Debian 仓库：

```
$echo "deb https://dl.bintray.com/resin-io/debian stable etcher" | sudo tee /etc/apt/sources.list.d/etcher.list
```

信任 Bintray.com GPG 密钥

```
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
```

然后更新你的系统并安装：

```
$ sudo apt-get update
$ sudo apt-get install etcher-electron
```

如果你使用的是 Fedora 或 Red Hat Enterprise Linux，请添加 Etcher RPM 仓库：

```
$ sudo wget https://bintray.com/resin-io/redhat/rpm -O /etc/yum.repos.d/bintray-resin-io-redhat.repo
```

使用以下任一方式更新和安装：

```
$ sudo yum install -y etcher-electron
```

或者：

```
$ sudo dnf install -y etcher-electron
```

### 创建可启动盘

除了为 Ubuntu、EndlessOS 和其他版本的 Linux 创建可启动镜像之外，我还使用 Etcher [创建 SD 卡镜像][6]用于树莓派。以下是如何创建可启动媒体。

首先，将要使用的 ISO 或镜像下载到计算机。然后，启动 Etcher 并将 USB 或 SD 卡插入计算机。

![](https://opensource.com/sites/default/files/uploads/etcher_2.png)

单击 “Select Image”。在本例中，我想创建一个可启动的 USB 盘，以便在新计算机上安装 Ubermix。在我选择了我的 Ubermix 镜像文件并将我的 USB 盘插入计算机，Etcher.io “看到”了驱动器，我就可以开始在 USB 上安装 Ubermix 了。

![](https://opensource.com/sites/default/files/uploads/etcher_3.png)

在我点击 “Flash” 后，安装就开始了。所需时间取决于镜像的大小。在驱动器上安装镜像后，软件会验证安装。最后，一条提示宣布我的媒体创建已经完成。

如果您需要 [Etcher 的帮助][7]，请通过其 [Discourse][8] 论坛联系社区。Etcher 非常易于使用，它已经取代了我所有其他的媒体创建工具，因为它们都不像 Etcher 那样轻松地完成工作。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/getting-started-etcherio

作者：[Don Watkins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://getfedora.org/en_GB/workstation/download/
[2]:http://etcher.io
[3]:https://github.com/resin-io/etcher/blob/master/LICENSE
[4]:https://github.com/resin-io/etcher
[5]:https://etcher.io/
[6]:https://www.raspberrypi.org/magpi/pi-sd-etcher/
[7]:https://github.com/resin-io/etcher/blob/master/SUPPORT.md
[8]:https://forums.resin.io/c/etcher
