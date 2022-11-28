[#]: subject: "GNOME Shell for Mobile: A Promising Start with Huge Expectations [Opinion]"
[#]: via: "https://www.debugpoint.com/2022/06/gnome-shell-mobile-announcement/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14672-1.html"

移动版 GNOME Shell：希望之始，期望满满
======

![GNOME Shell 在一台 Pinephone 原型机上运行][3]

> GNOME 开发人员在最近的一篇博文中提出了将 GNOME Shell 完全移植到手机上的想法。下面是我对这个项目的一些看法。

### 移动版 GNOME Shell

作为一个桌面环境，GNOME 在过去的十年中发展成为了 [GNOME 40][1]。GNOME 40 是一个重要的版本，它以一种现代的方式改变了完整的用户界面设计。

看着 GNOME 40 的设计方式，你可能会觉得 Shell 和它的底层技术已经为小屏幕做好了准备。手势驱动的工作区、图标网格和停靠区 —— 在某种程度上感觉更接近于像安卓这样的移动操作系统，而不是桌面环境。

此外，系统托盘、日历、通知和原生的应用程序，可以有效地在较小尺寸的设备上工作。得益于 GTK4 和 libadwaita，其设计是响应式的，应用程序和控件的外观与移动平台很匹配。

在 GNOME 40 之后，GNOME 开发者为较小尺寸的设备（如平板电脑和手机）设计了几个 GNOME Shell 的概念验证。

#### 为什么是现在？

任何项目的开发和研究工作都要花费时间和金钱。虽然有来自主要科技公司对 GNOME 的捐赠，但这次有一个 “<ruby>原型基金<rt>Prototype Fund</rt></ruby>” 帮助该团队继续进行这项努力。[原型基金][2] 是德国教育部（BMBF）支持公共利益软件的资助项目。

#### 包括什么？

设计一个完整的移动用户界面，并将其与移动操作系统整合是一个非常复杂的项目。它需要一个精心设计的愿景来支持成千上万的移动硬件和用户支持。更不用说，用户在移动设备上的隐私和安全问题了。

因此，有了这个基金，团队可以集中精力进行概念验证，以满足 GNOME Shell 中一些基本的用户互动。

* 启动器
* 应用程序网格
* 轻扫、手势和导航
* 用手机键盘搜索
* 检测屏幕大小和支持屏幕旋转
* 工作空间和多任务
* 设置
* 屏幕键盘

![GNOME Shell 移动版模拟图][4]

始终要记住的是，移动体验远不止用户界面这么简单。另外，GNOME 本身并不是一个操作系统。它由底层的稳定的操作系统组成，它提供了非常需要的隐私和安全。另外，“应用商店”的概念也是如此。手机制造商需要与 GNOME 开发者合作，让他们的产品采用这个概念。

#### 进展如何？

在写这篇文章时，团队给我们快速演示了取得的进展。在下面的视频中可以看到：

![][5]

复杂的任务是识别触摸屏手机中的各种手势。例如，你可能会使用长触摸、短触摸、双指轻扫和拖动，以及许多只有在小尺寸设备中才可行的可能性。这需要在各自的 GNOME Shell 组件中推倒重构。

而完全在现有的 GNOME Shell 基础上开发它们是很有挑战性的工作。

此外，该团队使用著名的 Pinephone Pro 进行开发和测试。Pinephone 已经是一个商业产品，装有 “友商” KDE Plasma 手机和其他 Linux 操作系统。

![][6]

### 结语

如果一切按计划进行，我们可能在一个完整的开源手机中获得原生的 GNOME 体验。而你可以重新拥有你的隐私!

另外，我不确定 Phosh（它也是基于 GNOME 的）会发生什么。虽然 Phosh 是由 Purism 开发和管理的，但看看 GNOME Shell 在移动设备上的努力和 PHosh 在未来一段日子的发展方向将是很有趣的。

那么，你对这个项目的前景怎么看？请在下面的评论栏里告诉我。

*图片和视频来源：GNOME 开发者 [博客][7]*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/06/gnome-shell-mobile-announcement/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/tag/gnome-40
[2]: http://www.prototypefund.de
[3]: https://www.debugpoint.com/wp-content/uploads/2022/06/GNOME-Shell-Running-on-a-prototype-Pinephone.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/06/GNOME-Shell-Mobile-mock-up.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/06/phone.webm
[6]: https://www.debugpoint.com/wp-content/uploads/2022/06/tablet.webm
[7]: https://blogs.gnome.org/shell-dev/2022/05/30/towards-gnome-shell-on-mobile/
