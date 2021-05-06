[#]: subject: (The Guided Installer in Arch is a Step in the Right Direction)
[#]: via: (https://news.itsfoss.com/arch-new-guided-installer/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: (Kevin3599)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13328-1.html)

Arch Linux 中的引导式安装程序是迈向正确的一步
======

> 在 Arch ISO 中加入一个可选的引导式安装程序，对新手和高级用户都有好处。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/04/arch-linux-opinion.png?w=1200&ssl=1)

20 年来，Arch Linux 为用户提供了一个完全定制、独特的系统。这些年来，它以牺牲用户友好性为代价，赢得了在定制方面独有的声誉。

作为滚动发行版本，Arch Linux 不提供任何固定发行版本，而是每月更新一次。但是，如果你在最近几周下载了 Arch Linux，那么你很可能已经注意到了一个新的附加功能：archinstall。它使 Arch Linux 更加易于安装。

![][3]

今天，我将探讨 archinstall 的发布对未来的 Arch Linux 项目和发行版意味着什么。

### Arch Linux 新的发展方向？

![][4]

尽管很多人对此感到惊讶，但默认情况下包含官方安装程序实际上是非常明智的举动。这意味着 Arch Linux 的发展方向发生变化，即在保留使其知名的定制性同时更加侧重用户的易用性。

在该安装程序的 GitHub 页面上有这样的描述：

> “引导性安装程序会给用户提供一个友好的逐步安装方式，但是关键在于这个安装程序是个选项，它是可选的，绝不会强迫用户使用其进行安装。”

这意味着新的安装程序不会影响高级用户，同时也使得其可以向更广泛的受众开放，在这一改动所带来的许多优点之中，一个显著的优点即是：更广泛的用户。

更多的用户意味着对项目的更多支持，不管其是通过网络捐赠或参与 Arch Linux 的开发，随着这些项目贡献的增加，不管是新用户还是有经验的用户的使用体验都会得到提升。

### 这必然要发生

回顾过去，我们可以看到安装介质增加了许多对新用户有所帮助的功能。这些示例包括 pacstrap（一个安装基本系统的工具）和 reflector（查找最佳 pacman 镜像的工具）。

另外，多年来，用户一直在追求使用脚本安装的方法，新安装程序允许了用户使用安装脚本。它能够使用 Python 编写脚本，这使得管理员的部署更加容易，成为一个非常有吸引力的选择。

### 更多可定制性（以某种方式？）

尽管这看上去可能有些反直觉，但是这个安装程序实际上能够增进 Arch Linux 的可定制性。当前，Arch Linux 定制性的最大瓶颈是用户的技术水平，而这一问题能够通过 archinstall 解决。

有了新的安装程序，用户不需要掌握创建完美开发环境的技巧，安装程序可以帮助用户完成这些工作，这提供了广泛的自定义选项，是普通用户难以实现的。

### 总结

有了这一新功能，Arch Linux 似乎正在向着“用户友好”这一软件设计哲学靠近，新安装程序为新手和高级用户提供了广泛的好处。其中包括更广泛的定制性和更大的用户社区。

总而言之，这个新变动对整个 Arch Linux 社区都会产生积极的影响。

你对这个 Arch Linux 安装程序怎么看？是否已经尝试过它了呢？

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/arch-new-guided-installer/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[Kevin3599](https://github.com/Kevin3599)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/rolling-release/
[2]: https://news.itsfoss.com/arch-linux-easy-install/
[3]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/04/arch-install-tool.png?resize=780%2C411&ssl=1
[4]: https://i0.wp.com/github.com/archlinux/archinstall/raw/master/docs/logo.png?resize=371%2C371&ssl=1
[5]: https://man.archlinux.org/man/pacstrap.8
[6]: https://wiki.archlinux.org/index.php/Reflector

