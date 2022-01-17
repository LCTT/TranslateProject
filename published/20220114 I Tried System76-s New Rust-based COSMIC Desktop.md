[#]: subject: "I Tried System76’s New Rust-based COSMIC Desktop!"
[#]: via: "https://news.itsfoss.com/system76-rust-cosmic-desktop/"
[#]: author: "Community https://news.itsfoss.com/author/team/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14186-1.html"

提前了解一下 System76 新的基于 Rust 的 COSMIC 桌面
=====

> 提前了解一下 Pop!_OS 即将推出的基于 Rust 的 COSMIC 桌面环境。仅供参考。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/system76-rust-based-distro-ft.png?w=1200&ssl=1)

如果你还不知道，System76 的开发者一直在 [致力于开发一个新的桌面环境][1]（被称为 COSMIC），它是用 [Rust][2] 编写的，Rust 是一种内存安全的超快编程语言。

从头开始创建一个桌面环境不是一件小事。这涉及到创建从合成器、面板、窗口管理器到桌面环境的 API 和其他后端任务的一切。

这不是一件容易的事，而维护它又是另一回事。

而且，看起来 System76 已经开始了这方面的工作。

在 GitHub 上，你会发现已经有一个名为 [cosmic][3] 的仓库，但它主要是使用 JavaScript（用于创建 GNOME shell 扩展的语言）编写的。这就是 cosmic shell 扩展仓库，也就是 Pop!_OS 现在所搭载的。

在他们的 GitHub 中还有几个较新的仓库，这些恰好是他们即将推出的基于 Rust 的 COSMIC 桌面的元素。

所以，现在是时候构建、测试并提前了解一下了。

> **注：** 澄清一下，目前 Pop!_OS 上基于 GNOME 的桌面环境叫做 COSMIC。而本文讨论的是基于 Rust 的 COSMIC 桌面环境，它是从头开始构建的，旨在取代当前的产品。

### 基于 Rust 的 COSMIC 桌面体验

打算成为 COSMIC 桌面环境整体一部分的三个仓库是：

  * [设置应用][4]
  * [顶部面板][5]（目前用于 X11 系统）
  * [合成器][6]（似乎支持原生的 wayland、xwayland 和 X11 系统）

#### COSMIC 设置应用

![][7]

> **注意：** 这是一个半生不熟的早期预览，以让你有个大致印象。随着开发的继续，用户界面可能会有根本性的变化。所以，仅用于参考。

这是 Pop!_OS 的新 COSMIC 桌面的设置应用。它目前还在开发当中，没有准备好使用，不过如果你想运行它并试试界面，请随意！

那么，它看起来与目前的 COSMIC 体验有什么不同呢？

![基于 Rust 的 COSMIC 设置与基于 GNOME 的 COSMIC][8]

在写这篇文章时，该用户界面似乎没有与任何后端 API 相连接。启用和禁用 “为工作区启用左上角热角 ”的切换并没有什么变化，其他的切换也是如此，除了设置应用的 “关于” 部分所显示的信息。

仔细看截图，放置的位置很凌乱，但作为早期预览（或原型）来说也是正常的。

看起来他们正在用圆角和更干净的外观来处理一切。

切换动画感觉快速、流畅和迅捷（即使是在虚拟机内，我等不及在裸机上尝试）。但考虑到它甚至还没有功能，谈论性能没什么意义。

![][9]

就个人而言，我不喜欢他们所采用的圆角外观。在我看来，GNOME 对圆角的实现是完美的。但是，看看它的结果应该是很有趣的。

#### 顶部面板

作为 COSMIC 桌面环境的一部分，顶部面板也正在使用 Rust 语言实现。

至于这个顶部面板的外观，我不太确定如何测试它才不算对它不公平。从 GNOME 中启动它，会在 GNOME 的顶栏后面打开它。所以我想在一个单独的窗口管理器中打开它（到目前为止只用 [bspwm][10] 和 [i3-wm][11] 试过），但这导致了一些古怪的行为，比如面板像普通 GUI 软件一样占据了全部垂直空间。

#### COSMIC 合成器

COSMIC 桌面环境的合成器编译成功了，但在与 bspwm 或 i3-wm 一起使用时却无法启动。我试着在窗口管理器中启动它，因为 GNOME 不允许改变合成器。

这是由于在使用 VirtualBox 的虚拟机中，视频驱动的混乱以及 COSMIC 合成器还没有准备好。

但是，还有更多！

开发者 Eduardo Flores 也尝试了新的 COSMIC 桌面，在他的 [博客文章][12] 中分享了一些应用启动器和坞站的截图。

![来自 Eduardo Flores][13]

应用程序启动器看起来很相似，但是使用 GTK 构建的。同样，你也可以期待 [Pop!_OS 21.10][14] 引入一个类似的应用程序库，以及经典的坞站。

![来自 Eduardo Flores][15]

### 总结

当然，现在说发展的方向还为时过早。

要期待一个成熟的基于 Rust 的 COSMIC 桌面体验的测试版，应该还需要一段时间。

但是，从我们在这里看到的情况来看，我很兴奋。

你怎么看？欢迎你在下面的评论中分享你的想法！

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/system76-rust-cosmic-desktop/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/pop-os-cosmic-rust/
[2]: https://research.mozilla.org/rust/
[3]: https://github.com/pop-os/cosmic
[4]: https://github.com/pop-os/cosmic-settings
[5]: https://github.com/pop-os/cosmic-panel
[6]: https://github.com/pop-os/cosmic-comp
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/pop-os-cosmic-settings-early.png?w=963&ssl=1
[8]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/pop-os-settings-new-old-early.png?resize=1568%2C705&ssl=1
[9]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/pop-os-new-old-cosmic.png?w=1387&ssl=1
[10]: https://github.com/baskerville/bspwm
[11]: https://github.com/i3/i3
[12]: https://blog.edfloreshz.dev/articles/linux/system76/rust-based-desktop-environment/
[13]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/new_launcher.png?w=770&ssl=1
[14]: https://news.itsfoss.com/pop-os-21-10/
[15]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/new_app_library.png?w=1200&ssl=1
