[#]: subject: "Install the Latest Calibre on Ubuntu"
[#]: via: "https://itsfoss.com/install-calibre-ubuntu/"
[#]: author: "Ishaan Bhimwal https://itsfoss.com/author/community/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16394-1.html"

在 Ubuntu 上安装最新版的 Calibre
======

![][0]

> Calibre 是一款自由开源的电子书软件。下面介绍如何在 Ubuntu Linux 上安装它。

作为电子书管理的瑞士军刀，Calibre 一直备受书籍爱好者和数字书虫们的喜爱。

虽然存在更好（更轻量级）的 [电子书阅读器][1]，但 Calibre 在创建电子书、转换格式以及管理你的电子书库方面做得更出色。简言之，它是满足你所有电子书需求的全套解决方案。

在本教程中，我将会涉及：

 * 从 Ubuntu 的仓库安装 Calibre（简单易行，但可能不是最新版本）
 * 使用官方二进制文件安装 Calibre（稍微复杂些，但能获取最新版本）

### 方法1：从 Ubuntu 的仓库安装 Calibre

该方法简单易用，但可能无法获得最新的 Calibre 版本。但大多数情况下，这并不会造成问题。

Ubuntu 的 universe 仓库中提供了 Calibre 的稳定版本。此仓库在大多数系统中默认已启用，因此你只需在软件中心搜索即可，或者使用以下命令进行安装：

```
sudo apt install calibre
```

![][2]

安装完成后，在系统菜单中找到它，然后启动。

#### 卸载 Calibre

如果你不再需要它，可以使用下面的命令卸载 Calibre：

```
sudo apt remove calibre
```

### 方法2：获取最新版本的 Calibre

[Calibre 官方][3] 推荐安装提供的官方二进制文件。目的是防止用户使用存在错误或已过时的软件包。该二进制文件包含了所有私有版本的依赖项，支持 32 位和 64 位的机器。

首先，我们需要检查系统上是否已经安装了必要的依赖项：

```
apt -qq list xdg-utils wget xz-utils python3
```

![][4]

如果上述包出现缺失的情况，就将它们安装上。

然后，复制并粘贴下列命令到终端里，按回车键以进行安装或升级：

```
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
```

![][5]

**可能的问题处理** ：如果你看到一个关于证书不受信任的错误，这表示你的电脑没有安装任何根证书，所以不能安全地下载安装程序。如果你仍然想要继续，向 `wget` 输入命令 `--no-check-certificate`，就像下面的命令一样：

```
sudo -v && wget --no-check-certificate -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
```

#### 卸载 Calibre

如果你按照上述二进制安装法安装了 Calibre，你可以通过运行 `sudo calibre-uninstall` 来卸载 Calibre。或者，直接删除安装文件夹，这样就可以删除 99% 的安装文件。

![][6]

### 结语

在一个数字阅读日渐普及的世界，这款开源软件证明了由社区驱动创新的强大影响。无论你是一名资深的电子书爱好者，还是正在初探数字阅读的世界，Calibre 都有你需要的东西。

尽管有 [详细的文档资源][7]，我们还提供了一个简单教程 [指导你在 Calibre 中创建电子书][8]。

> [完整指南：在 Linux 上使用 Calibre 创建电子书][8]

_在 Ubuntu 中体验 Calibre 吧。_

*（题图：MJ/b63e15a1-1a1c-4ae3-b6c7-40b4537cb567）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-calibre-ubuntu/

作者：[Ishaan Bhimwal][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/community/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-ebook-readers-linux/
[2]: https://itsfoss.com/content/images/2023/09/QPemD12.png
[3]: https://calibre-ebook.com/download_linux
[4]: https://itsfoss.com/content/images/2023/09/XnFwJIX.png
[5]: https://itsfoss.com/content/images/2023/09/UrBF54u.png
[6]: https://itsfoss.com/content/images/2023/09/i9KwV8E.png
[7]: https://calibre-ebook.com/help
[8]: https://linux.cn/article-7977-1.html
[9]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[0]: https://img.linux.net.cn/data/attachment/album/202311/18/120237ptz6266meg1st2i1.png