[#]: subject: (Show CPU Details Beautifully in Linux Terminal With CPUFetch)
[#]: via: (https://itsfoss.com/cpufetch/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13289-1.html)

使用 CPUFetch 在 Linux 终端中漂亮地显示 CPU 细节
======

![](https://img.linux.net.cn/data/attachment/album/202104/12/093818iie270mi8am6ttk7.jpg)

Linux 上有 [检查 CPU 信息的方法][1]。最常见的可能是 `lscpu` 命令，它可以提供大量的系统上所有 CPU 核心的信息。

![lscpu command output][2]

你可以在那里找到 CPU 信息，而无需安装任何额外的包。当然这是可行的。然而，我最近偶然发现了一个新的工具，它以一种漂亮的方式显示 Linux 中的 CPU 细节。

处理器制造商的 ASCII 艺术使它看起来很酷。

![][3]

这看起来很美，不是吗？这类似于 [Neoftech 或者 Screenfetch，在 Linux 中用漂亮的 ASCII 艺术来展示系统信息][4]。与这些工具类似，如果你要展示你的桌面截图，可以使用 CPUFetch。

该工具可以输出处理器制造商的 ASCII 艺术，它的名称、微架构、频率、核心、线程、峰值性能、缓存大小、[高级向量扩展][5] 等等。

除了它提供的一些主题外，你还可以使用自定义颜色。当你在整理桌面，并希望对 Linux 环境中的所有元素进行颜色匹配时，这给了你更多的自由度。

### 在 Linux 上安装 CPUFetch

不幸的是，CPUFetch 是一个相当新的软件，而且它并不包含在你的发行版的软件库中，甚至没有提供现成的 DEB/RPM 二进制文件、PPA、Snap 或 Flatpak 包。

Arch Linux 用户可以在 [AUR][7] 中 [找到][6] 它，但对于其他人来说，唯一的出路是 [从源代码构建][8]。

不要担心。安装以及删除并不是那么复杂。让我来告诉你步骤。

我使用的是 Ubuntu，你会 [需要先在 Ubuntu 上安装 Git][9]。一些发行版会预装 Git，如果没有，请使用你的发行版的包管理器来安装。

现在，把 Git 仓库克隆到你想要的地方。家目录也可以。

```
git clone https://github.com/Dr-Noob/cpufetch
```

切换到你刚才克隆的目录：

```
cd cpufetch
```

你会在这里看到一个 Makefile 文件。用它来编译代码。

```
make
```

![CPUFetch Installation][10]

现在你会看到一个新的可执行文件，名为 `cpufetch`。你运行这个可执行文件来显示终端的 CPU 信息。

```
./cpufetch
```

这是我系统的显示。AMD 的徽标用 ASCII 码看起来更酷，你不觉得吗？

![][11]

如何删除 CPUFetch？这很简单。当你编译代码时，它只产生了一个文件，而且也和其他代码在同一个目录下。

所以，要想从系统中删除 CPUFetch，只需删除它的整个文件夹即可。你知道 [在 Linux 终端中删除一个目录][12] 的方法吧？从 `cpufetch` 目录中出来，然后使用 `rm` 命令。

```
rm -rf cpufetch
```

这很简单，值得庆幸的是，因为从源代码中删除安装的软件有时真的很棘手。

说回 CPUFetch。我想这是一个实用工具，适合那些喜欢在各种 Linux 群里炫耀自己桌面截图的人。既然发行版有了 Neofetch，CPU 有了 CPUFetch，不知道能不能也来个 Nvidia ASCII 艺术的 GPUfetch？

--------------------------------------------------------------------------------

via: https://itsfoss.com/cpufetch/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/check-cpu-info-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/lscpu-command-output.png?resize=800%2C415&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/cpufetch-1.png?resize=800%2C307&ssl=1
[4]: https://itsfoss.com/display-linux-logo-in-ascii/
[5]: https://software.intel.com/content/www/us/en/develop/articles/introduction-to-intel-advanced-vector-extensions.html
[6]: https://aur.archlinux.org/packages/cpufetch-git
[7]: https://itsfoss.com/aur-arch-linux/
[8]: https://itsfoss.com/install-software-from-source-code/
[9]: https://itsfoss.com/install-git-ubuntu/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/cpufetch-installation.png?resize=800%2C410&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/cpufetch-for-itsfoss.png?resize=800%2C335&ssl=1
[12]: https://linuxhandbook.com/remove-files-directories/
