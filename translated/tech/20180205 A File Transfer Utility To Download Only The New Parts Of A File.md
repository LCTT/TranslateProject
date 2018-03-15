一个仅下载文件新的部分的传输工具
======

![](https://www.ostechnix.com/wp-content/uploads/2018/02/Linux-1-720x340.png)

仅仅因为网费每天变得越来越便宜，你也不应该重复下载相同的东西来浪费你的流量。一个很好的例子就是下载 Ubuntu 或任何 Linux 镜像的开发版本。如你所知，Ubuntu 开发人员每隔几个月就会发布一次日常构建、alpha、beta 版 ISO 镜像以供测试。在过去，一旦发布我就会下载这些镜像，并审查每个版本。现在不用了！感谢 **Zsync** 文件传输程序。现在可以仅下载 ISO 镜像新的部分。这将为你节省大量时间和 Internet 带宽。不仅时间和带宽，它将为你节省服务端和客户端的资源。

Zsync 使用与 **Rsync**  相同​​的算法，但它只下载文件的新部分，你会得到一份已有文件旧版本的副本。 Rsync 主要用于在计算机之间同步数据，而 Zsync 则用于分发数据。简单地说，可以使用 Zsync 将中心的一个文件分发给数千个下载者。它在 Artistic License V2 许可证下发布，完全免费且开源。

### 安装 Zsync

Zsync 在大多数 Linux 发行版的默认仓库中有。

在 **Arch Linux** 及其衍生版上，使用命令安装它：
```
$ sudo pacman -S zsync

```

在 **Fedora** 上：

启用 Zsync 仓库：
```
$ sudo dnf copr enable ngompa/zsync

```

并使用命令安装它：
```
$ sudo dnf install zsync

```

在 **Debian、Ubuntu、Linux Mint** 上：
```
$ sudo apt-get install zsync

```

对于其他发行版，你可以从 [**Zsync 下载页面**][1]下载二进制文件，并手动编译安装它，如下所示。
```
$ wget http://zsync.moria.org.uk/download/zsync-0.6.2.tar.bz2
$ tar xjf zsync-0.6.2.tar.bz2
$ cd zsync-0.6.2/
$ configure
$ make
$ sudo make install

```

### 用法

请注意，**只有当人们提供 zsync 下载时，zsync 才有用**。目前，Debian、Ubuntu（所有版本）的 ISO 镜像都可以用 .zsync 下载。例如，请访问以下链接。

你可能注意到，Ubuntu 18.04 LTS 每日构建版有直接的 ISO 和 .zsync 文件。如果你下载 .ISO 文件，则必须在 ISO 更新时下载完整的 ISO 文件。但是，如果你下载的是 .zsync 文件，那么 Zsync 将在未来仅下载新的更改。你不需要每次都下载整个 ISO 映像。

.zsync 文件包含 zsync 程序所需的元数据。该文件包含 rsync 算法的预先计算的校验和。它在服务器上生成一次，然后由任意数量的下载器使用。要使用 Zsync 客户端程序下载 .zsync 文件，你只需执行以下操作：
```
$ zsync <.zsync-file-URL>

```

例如：
```
$ zsync http://cdimage.ubuntu.com/ubuntu/daily-live/current/bionic-desktop-amd64.iso.zsync

```

如果你的系统中已有以前的镜像文件，那么 Zsync 将计算远程服务器中旧文件和新文件之间的差异，并仅下载新的部分。你将在终端看见计算过程一系列的点或星星。

如果你下载的文件的旧版本存在于当前工作目录，那么 Zsync 将只下载新的部分。下载完成后，你将看到两个镜像，一个你刚下载的镜像和以 **.iso.zs-old** 为扩展名的旧镜像。

如果没有找到相关的本地数据，Zsync 会下载整个文件。

![](http://www.ostechnix.com/wp-content/uploads/2018/02/Zsync-1.png)

你可以随时按 **CTRL-C** 取消下载过程。

试想一下，如果你直接下载 .ISO 文件或使用 torrent，每当你下载新镜像时，你将损失约 1.4GB 流量。因此，Zsync 不会下载整个 Alpha、beta 和日常构建映像，而只是在你的系统上下载了 ISO 文件的新部分，并在系统中有一个旧版本的拷贝。

今天就到这里。希望对你有帮助。我将很快另外写一篇有用的指南。在此之前，请继续关注 OSTechNix！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/zsync-file-transfer-utility-download-new-parts-file/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://zsync.moria.org.uk/downloads
