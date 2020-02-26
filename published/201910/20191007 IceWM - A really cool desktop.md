[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11443-1.html)
[#]: subject: (IceWM – A really cool desktop)
[#]: via: (https://fedoramagazine.org/icewm-a-really-cool-desktop/)
[#]: author: (tdawson https://fedoramagazine.org/author/tdawson/)

IceWM：一个非常酷的桌面
======

![][1]

IceWM 是一款非常轻量的桌面。它已经出现 20 多年了，它今天的目标仍然与当时相同：速度、简单性以及不妨碍用户。

我曾经将 IceWM 添加到 Scientific Linux 中作为轻量级桌面。当时它只是 0.5 兆的 rpm 包。运行时，它仅使用 5 兆的内存。这些年来，IceWM 有所增长。rpm 包现在为 1 兆。运行时，IceWM 现在使用 10 兆的内存。尽管在过去十年中它的大小增加了一倍，但它仍然非常小。

这么小的包，你能得到什么？确切地说，就是一个窗口管理器。没有其他东西。你有一个带有菜单或图标的工具栏来启动程序。速度很快。最后，还有主题和选项。除了工具栏中的一些小东西，就只有这些了。

![][2]

### 安装

因为 IceWM 很小，你只需安装主软件包。

```
$ sudo dnf install icewm
```

如果要节省磁盘空间，许多依赖项都是可选的。没有它们，IceWM 也可以正常工作。

```
$ sudo dnf install icewm --setopt install_weak_deps=false
```

### 选项

IceWM 默认已经设置完毕，以使普通的 Windows 用户也能感到舒适。这是一件好事，因为选项是通过配置文件手动完成的。

我希望你不会因此而止步，因为它并没有听起来那么糟糕。它只有 8 个配置文件，大多数人只使用其中几个。主要的三个配置文件是 `keys`（键绑定），`preferences`（总体首选项）和 `toolbar`（工具栏上显示的内容）。默认配置文件位于 `/usr/share/icewm/`。

要进行更改，请将默认配置复制到 IceWM 家目录（`~/.icewm`），编辑文件，然后重新启动 IceWM。第一次做可能会有点害怕，因为在 “Logout” 菜单项下可以找到 “Restart Icewm”。但是，当你重启 IceWM 时，你只会看到闪烁一下，更改就生效了。任何打开的程序均不受影响，并保持原样。

### 主题

![IceWM in the NanoBlue theme][3]

如果安装 icewm-themes 包，那么会得到很多主题。与常规选项不同，你无需重启 IceWM 即可更改为新主题。通常我不会谈论主题，但是由于其他功能很少，因此我想提下。

### 工具栏

工具栏是为 IceWM 添加了更多的功能的地方。你可以看到它可以切换不同的工作区。工作区有时称为虚拟桌面。单击工作区图标以移动到它。右键单击一个窗口的任务栏项目，可以在工作区之间移动它。如果你喜欢工作区，它拥有你想要的所有功能。如果你不喜欢工作区，那么可以选择关闭它。

工具栏还有网络/内存/CPU 监控图。将鼠标悬停在图标上可获得详细信息。单击图标可以打开一个拥有完整监控功能的窗口。这些小图形曾经出现在每个窗口管理器上。但是，随着桌面环境的成熟，它们都将这些图形去除了。我很高兴 IceWM 留下了这个不错的功能。

### 总结

如果你想要轻量但功能强大的桌面，IceWM 适合你。它已经设置好了，因此新的 Linux 用户也可以立即使用它。它是灵活的，因此 Unix 用户可以根据自己的喜好进行调整。最重要的是，IceWM 可以让你的程序不受阻碍地运行。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/icewm-a-really-cool-desktop/

作者：[tdawson][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/tdawson/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/09/icewm-1-816x346.png
[2]: https://fedoramagazine.org/wp-content/uploads/2019/09/icewm.2-1024x768.png
[3]: https://fedoramagazine.org/wp-content/uploads/2019/09/icewm.3-1024x771.png
