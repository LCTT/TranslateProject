[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12787-1.html)
[#]: subject: (How to Clear Apt Cache and Reclaim Precious Disk Space)
[#]: via: (https://itsfoss.com/clear-apt-cache/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何清除 APT 缓存来回收宝贵的磁盘空间
======

![][13]

如何清除 APT 缓存？你只需使用这个 [apt-get 命令][1]选项：

```
sudo apt-get clean
```

但是，清理 APT 缓存不仅仅是运行上面的命令。

在本教程中，我将解释什么是 APT 缓存、为什么会使用它、为什么你要清理它，以及关于清理 APT 缓存你应该知道的其他事情。

我将在这里使用 Ubuntu 作为参考，但由于这是关于 APT 的，因此它也适用于 [Debian][2] 和其他基于 Debian 和 Ubuntu 的发行版，比如 Linux Mint、Deepin 等等。

### 什么是 APT 缓存？为什么要使用它？

当你使用 `apt-get` 或 [apt 命令][3]安装一个软件包时（或在软件中心安装 DEB 包），APT [包管理器][4]会以 .deb 格式下载软件包及其依赖关系，并将其保存在 `/var/cache/apt/archives` 文件夹中。

![][5]

下载时，`apt` 将 deb 包保存在 `/var/cache/apt/archives/partial` 目录下。当 deb 包完全下载完毕后，它会被移到 `/var/cache/apt/archives` 目录下。

下载完包的 deb 文件及其依赖关系后，你的系统就会[从这些 deb 文件中安装包][6]。

现在你明白缓存的用途了吧？系统在安装软件包之前，需要一个地方把软件包文件存放在某个地方。如果你了解 [Linux 目录结构][7]，你就会明白，`/var/cache` 是合适的地方。

#### 为什么安装包后要保留缓存？

下载的 deb 文件在安装完成后并不会立即从目录中删除。如果你删除了一个软件包，然后重新安装，你的系统会在缓存中查找这个软件包，并从这里获取它，而不是重新下载（只要缓存中的软件包版本与远程仓库中的版本相同）。

这样就快多了。你可以自己尝试一下，看看一个程序第一次安装，删除后再安装需要多长时间。你可以[使用 time 命令来了解完成一个命令需要多长时间][8]：`time sudo apt install package_name`。

我找不到任何关于缓存保留策略的内容，所以我无法说明 Ubuntu 会在缓存中保留下载的包多长时间。

#### 你应该清理 APT 缓存吗？

这取决于你。如果你的根目录下的磁盘空间用完了，你可以清理 APT 缓存来回收磁盘空间。这是 [Ubuntu 上释放磁盘空间的几种方法][9]之一。

使用 [du 命令][10]检查缓存占用了多少空间：

![][11]

有的时候，这可能会占用几百兆，如果你正在运行一个服务器，这些空间可能是至关重要的。

#### 如何清理 APT 缓存？

如果你想清除 APT 缓存，有一个专门的命令来做。所以不要去手动删除缓存目录。只要使用这个命令就可以了：

```
sudo apt-get clean
```

这将删除 `/var/cache/apt/archives` 目录的内容（除了锁文件）。以下是 `apt-get clean` 命令模拟删除内容：

![][12]

还有一个命令是关于清理 APT 缓存的：

```
sudo apt-get autoclean
```

与 `clean` 不同的是，`autoclean` 只删除那些无法从仓库中下载的包。

假设你安装了包 xyz。它的 deb 文件仍然保留在缓存中。如果现在仓库中有新的 xyz 包，那么缓存中现有的这个 xyz 包就已经过时了，没有用了。`autoclean` 选项会删除这种不能再下载的无用包。

#### 删除 apt 缓存安全吗？

是的，清除 APT 创建的缓存是完全安全的。它不会对系统的性能产生负面影响。也许如果你重新安装软件包，下载时间会更长一些，但也仅此而已。

再说一次，使用 `apt-get clean` 命令。它比手动删除缓存目录更快、更简单。

你也可以使用像 [Stacer][14] 或 [Bleachbit][15] 这样的图形工具来实现这个目的。

#### 总结

在写这篇文章的时候，新的 `apt` 命令没有这样的内置选项。不过，为了保持向后的兼容性，仍然可以运行 `apt clean` （内部应该是运行了 `apt-get clean`）。请参考这篇文章来[了解 apt 和 apt-get 的区别][16]。

我希望你觉得这个关于 APT 缓存的解释很有趣。虽然这不是什么必要的东西，但了解这些小东西会让你对你的 Linux 系统更加了解。

欢迎你在评论区提出反馈和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/clear-apt-cache/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/apt-get-linux-guide/
[2]: https://www.debian.org/
[3]: https://itsfoss.com/apt-command-guide/
[4]: https://itsfoss.com/package-manager/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-get-clean-cache.png?resize=800%2C470&ssl=1
[6]: https://itsfoss.com/install-deb-files-ubuntu/
[7]: https://linuxhandbook.com/linux-directory-structure/
[8]: https://linuxhandbook.com/time-command/
[9]: https://itsfoss.com/free-up-space-ubuntu-linux/
[10]: https://linuxhandbook.com/find-directory-size-du-command/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-archive-size.png?resize=800%2C233&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-get-clean-ubuntu.png?resize=800%2C339&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/Clear-Apt-Cache.png?resize=800%2C450&ssl=1
[14]: https://itsfoss.com/optimize-ubuntu-stacer/
[15]: https://itsfoss.com/use-bleachbit-ubuntu/
[16]: https://itsfoss.com/apt-vs-apt-get-difference/
