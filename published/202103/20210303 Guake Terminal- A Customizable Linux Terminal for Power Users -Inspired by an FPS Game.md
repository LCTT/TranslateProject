[#]: subject: (Guake Terminal: A Customizable Linux Terminal for Power Users [Inspired by an FPS Game])
[#]: via: (https://itsfoss.com/guake-terminal/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13187-1.html)

Guake 终端：一个灵感来自于 FPS 游戏的 Linux 终端
======

> 使用 Guake 终端这个可自定义且强大的适合各种用户的工具快速访问你的终端。

### Guake 终端：GNOME 桌面中自上而下终端

![](https://img.linux.net.cn/data/attachment/album/202103/09/062119ba36tottztz4torn.jpg)

[Guake][2] 是一款为 GNOME 桌面量身定做的终端模拟器，采用下拉式设计。

它最初的灵感来自于一款 FPS 游戏（[Quake][3]）中的终端。尽管它最初是作为一个快速和易于使用的终端而设计的，但它的功能远不止于此。

Guake 终端提供了大量的功能，以及可定制的选项。在这里，我将重点介绍终端的主要功能，以及如何将它安装到你的任何 Linux 发行版上。

### Guake 终端的特点

![][4]

  * 按下键盘快捷键（`F12`）以覆盖方式在任何地方启动终端
  * Guake 终端在后台运行，以便持久访问
  * 能够横向和纵向分割标签页
  * 从可用的 shell 中（如果有的话）更改默认的 shell
  * 重新对齐
  * 从多种调色板中选择改变终端的外观
  * 能够使用 GUI 方式将终端内容保存到文件中
  * 需要时切换全屏
  * 你可以轻松地保存标签，或在需要时打开新的标签
  * 恢复标签的能力
  * 可选择配置和学习新的键盘快捷键，以快速访问终端和执行任务
  * 改变特定选项卡的颜色
  * 轻松重命名标签，快速访问你需要的内容
  * 快速打开功能，只需点击一下，就可直接在终端中用你最喜欢的编辑器打开文件
  * 能够在启动或显示 Guake 终端时添加自己的命令或脚本。
  * 支持多显示器

![][5]

只是出于乐趣，你可以做很多事情。但是，我也相信，高级用户可以利用这些功能使他们的终端体验更轻松，更高效。

就我用它来测试一些东西和写这篇文章的时候，说实话，我觉得我是在召唤终端。所以，我绝对觉得它很酷！

### 在 Linux 上安装 Guake 

![][6]

在 Ubuntu、Fedora 和 Arch 的默认仓库中都有 Guake 终端。

你可以按照它的官方说明来了解你可以使用的命令，如果你使用的是基于 Ubuntu 的发行版，只需输入：

```
sudo apt install guake
```

请注意，使用这种方法可能无法获得最新版本。所以，如果你想获得最新的版本，你可以选择使用 [Linux Uprising][7] 的 PPA 来获得最新版本：

```
sudo add-apt-repository ppa:linuxuprising/guake
sudo apt update
sudo apt install guake
```

无论是哪种情况，你也可以使用 [Pypi][8] 或者参考[官方文档][9]或从 [GitHub 页面][10]获取源码。

- [Guake Terminal][10]

你觉得 Guake 终端怎么样？你认为它是一个有用的终端仿真器吗？你知道有什么类似的软件吗？

欢迎在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/guake-terminal/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/guake-terminal-1.png?resize=800%2C363&ssl=1
[2]: http://guake-project.org/
[3]: https://quake.bethesda.net/en
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/guake-terminal.jpg?resize=800%2C245&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/guake-preferences.jpg?resize=800%2C559&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/guake-terminal-2.png?resize=800%2C432&ssl=1
[7]: https://www.linuxuprising.com/
[8]: https://pypi.org/
[9]: https://guake.readthedocs.io/en/latest/user/installing.html
[10]: https://github.com/Guake/guake
