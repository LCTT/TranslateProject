基于 FUSE 的 Bittorrent 文件系统
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/Bittorrent-720x340.png)

Bittorrent 已经存在了很长时间，它可以从互联网上共享和下载数据。市场上有大量的 GUI 和 CLI 的 Bittorrent 客户端。有时，你不能坐下来等待你的下载完成。你可能想要立即观看内容。这就是 **BTFS** 这个不起眼的文件系统派上用场的地方。使用 BTFS，你可以将种子文件或磁力链接挂载为目录，然后在文件树中作为只读目录。这些文件的内容将在程序读取时按需下载。由于 BTFS 在 FUSE 之上运行，因此不需要干预 Linux 内核。

### 安装 BTFS

BTFS 存在于大多数 Linux 发行版的默认仓库中。

在 Arch Linux 及其变体上，运行以下命令来安装 BTFS。

```
$ sudo pacman -S btfs
```

在Debian、Ubuntu、Linux Mint 上：

```
$ sudo apt-get install btfs
```

在 Gentoo 上：

```
# emerge -av btfs
```

BTFS 也可以使用 [Linuxbrew][1] 包管理器进行安装。

```
$ brew install btfs
```

### 用法

BTFS 的使用非常简单。你所要做的就是找到 .torrent 文件或磁力链接，并将其挂载到一个目录中。种子文件或磁力链接的内容将被挂载到你选择的目录内。当一个程序试图访问该文件进行读取时，实际的数据将按需下载。此外，像 `ls` 、`cat` 和 `cp` 这样的工具能按照预期的方式来操作种子。像 `vlc` 和 `mplayer` 这样的程序也可以不加修改地工作。玩家甚至不知道实际内容并非物理存在于本地磁盘中，而是根据需要从 peer 中收集。

创建一个目录来挂载 torrent/magnet 链接：

```
$ mkdir mnt
```

挂载 torrent/magnet 链接：

```
$ btfs video.torrent mnt
```

![][3]

cd 到目录：

```
$ cd mnt
```

然后，开始观看！

```
$ vlc <path-to-video.mp4>
```

给 BTFS 一些时间来找到并获取网站 tracker。一旦加载了真实数据，BTFS 将不再需要 tracker。

![][4]

要卸载 BTFS 文件系统，只需运行以下命令：

```
$ fusermount -u mnt
```

现在，挂载目录中的内容将消失。要再次访问内容，你需要按照上面的描述挂载 torrent。

BTFS 会将你的 VLC 或 Mplayer 变成爆米花时间。挂载你最喜爱的电视节目或电影的种子文件或磁力链接，然后开始观看，无需下载整个种子内容或等待下载完成。种子或磁力链接的内容将在程序访问时按需下载。

就是这些了。希望这些有用。还会有更好的东西。敬请关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/btfs-a-bittorrent-filesystem-based-on-fuse/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2018/05/btfs.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/05/btfs-1.png
