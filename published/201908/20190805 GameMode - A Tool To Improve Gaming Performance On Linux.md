[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11211-1.html)
[#]: subject: (GameMode – A Tool To Improve Gaming Performance On Linux)
[#]: via: (https://www.ostechnix.com/gamemode-a-tool-to-improve-gaming-performance-on-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

GameMode：提高 Linux 游戏性能的工具
======

![Gamemmode improve gaming performance on Linux][1]

去问一些 Linux 用户为什么他们仍然坚持 Windows 双启动，他们的答案可能是 - “游戏！”。这是真的！幸运的是，开源游戏平台如 [Lutris][2] 和专有游戏平台 Steam 已经为 Linux 平台带来了许多游戏，并且近几年来显著改善了 Linux 的游戏体验。今天，我偶然发现了另一款名为 GameMode 的 Linux 游戏相关开源工具，它能让用户提高 Linux 上的游戏性能。

GameMode 基本上是一组守护进程/库，它可以按需优化 Linux 系统的游戏性能。我以为 GameMode 是一个杀死在后台运行的对资源消耗大进程的工具。但它并不是。它实际上只是让 CPU **在用户玩游戏时自动运行在高性能模式下**并帮助 Linux 用户从游戏中获得最佳性能。

在玩游戏时，GameMode 通过对宿主机请求临时应用一组优化来显著提升游戏性能。目前，它支持下面这些优化：

* CPU 调控器，
* I/O 优先级，
* 进程 nice 值
* 内核调度器（SCHED_ISO），
* 禁止屏幕保护，
* GPU 高性能模式（NVIDIA 和 AMD），GPU 超频（NVIDIA），
* 自定义脚本。

GameMode 是由世界领先的游戏发行商 [Feral Interactive][3] 开发的自由开源的系统工具。

### 安装 GameMode

GameMode 适用于许多 Linux 发行版。

在 Arch Linux 及其变体上，你可以使用任何 AUR 助手程序，如 [Yay][5] 从 [AUR][4] 安装它。

```
$ yay -S gamemode
```

在 Debian、Ubuntu、Linux Mint 和其他基于 Deb 的系统上：

```
$ sudo apt install gamemode
```

如果 GameMode 不适用于你的系统，你可以按照它的 Github 页面中开发章节下的描述从源码手动编译和安装它。

### 激活 GameMode 支持以改善 Linux 上的游戏性能

以下是集成支持了 GameMode 的游戏列表，因此我们无需进行任何其他配置即可激活 GameMode 支持。

  * 古墓丽影：崛起
  * 全面战争传奇：不列颠尼亚王座
  * 全面战争：战锤 2
  * 尘埃 4
  * 全面战争：三国

只需运行这些游戏，就会自动启用 GameMode 支持。

这里还有将 GameMode 与 GNOME shell 集成的的[扩展][6]。它会在顶部指示 GameMode 何时处于活跃。

对于其他游戏，你可能需要手动请求 GameMode 支持，如下所示。

```
gamemoderun ./game
```

我不喜欢游戏，并且我已经很多年没玩游戏了。所以，我无法分享一些实际的基准测试。

但是，我在 Youtube 上找到了一个简短的[视频教程](https://youtu.be/4gyRyYfyGJw)，以便为 Lutris 游戏启用 GameMode 支持。对于那些想要第一次尝试 GameMode 的人来说，这是个不错的开始。

通过浏览视频中的评论，我可以说 GameMode 确实提高了 Linux 上的游戏性能。

对于更多细节，请参阅 [GameMode 的 GitHub 仓库][7]。

相关阅读：

* [GameHub – 将所有游戏集合在一起的仓库][8]
* [如何在 Linux 中运行 MS-DOS 游戏和程序][9]

你用过 GameMode 吗？它真的有改善 Linux 上的游戏性能吗？请在下面的评论栏分享你的想法。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/gamemode-a-tool-to-improve-gaming-performance-on-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/Gamemode-720x340.png
[2]: https://www.ostechnix.com/manage-games-using-lutris-linux/
[3]: http://www.feralinteractive.com/en/
[4]: https://aur.archlinux.org/packages/gamemode/
[5]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[6]: https://github.com/gicmo/gamemode-extension
[7]: https://github.com/FeralInteractive/gamemode
[8]: https://www.ostechnix.com/gamehub-an-unified-library-to-put-all-games-under-one-roof/
[9]: https://www.ostechnix.com/how-to-run-ms-dos-games-and-programs-in-linux/
