模拟 Altair 8800 计算机
======

[Altair 8800][1] 是 1975 年发布的自建家用电脑套件。Altair 基本上是第一台个人电脑（PC），虽然 PC 这个名词好几年前就出现了。对 Dell、HP 或者 Macbook 而言它是亚当（或者夏娃）。

有些人认为为 Z80（与 Altair 的 Intel 8080 密切相关的处理器）编写仿真器真是太棒了，并认为它需要一个模拟 Altair 的控制面板。所以如果你想知道 1975 年使用电脑是什么感觉，你可以在你的 Macbook 上运行 Altair：

![Altair 8800][2]

### 安装它

你可以从[这里][3]的 FTP 服务器下载 Z80 包。你要查找最新的 Z80 包版本，例如 `z80pack-1.26.tgz`。

首先解压文件：

```
$ tar -xvf z80pack-1.26.tgz
```

进入解压目录：

```
$ cd z80pack-1.26
```

控制面板模拟基于名为 `frontpanel` 的库。你必须先编译该库。如果你进入 `frontpanel` 目录，你会发现 `README` 文件列出了这个库自己的依赖项。你在这里的体会几乎肯定会与我的不同，但也许我的痛苦可以作为例子。我安装了依赖项，但是是通过 [Homebrew][4] 安装的。为了让库能够编译，我必须确保在 `Makefile.osx` 中将 `/usr/local/include `添加到 Clang 的 include 路径中。

如果你觉得依赖没有问题，那么你应该就能编译这个库（我们现在位于 `z80pack-1.26/frontpanel`）：

```
$ make -f Makefile.osx ...
$ make -f Makefile.osx clean
```

你应该会得到 `libfrontpanel.so`。我把它拷贝到 `libfrontpanel.so`。

Altair 模拟器位于 `z80pack-1.26/altairsim` 下。你现在需要编译模拟器本身。进入 `z80pack-1.26/altairsim/srcsim` 并再次运行 `make`：

```
$ make -f Makefile.osx ...
$ make -f Makefile.osx clean
```

该过程将在 `z80pack-1.26/altairsim` 中创建一个名为 `altairsim` 的可执行文件。运行该可执行文件，你应该会看到标志性的 Altair 控制面板！

如果你想要探究，请阅读原始的 [Altair 手册][5]

如果你喜欢这篇文章，我们每两周更新一次！在 Twitter 上关注 [@TwoBitHistory]​​[6] 或订阅 [RSS 源][7]了解什么时候有新文章。

--------------------------------------------------------------------------------

via: https://twobithistory.org/2017/12/02/simulating-the-altair.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Altair_8800
[2]: https://www.autometer.de/unix4fun/z80pack/altair.png
[3]: http://www.autometer.de/unix4fun/z80pack/ftp/
[4]: http://brew.sh/
[5]: http://www.classiccmp.org/dunfield/altair/d/88opman.pdf
[6]: https://twitter.com/TwoBitHistory
[7]: https://twobithistory.org/feed.xml
