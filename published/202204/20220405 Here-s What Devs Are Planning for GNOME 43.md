[#]: subject: "Here’s What Devs Are Planning for GNOME 43"
[#]: via: "https://news.itsfoss.com/gnome-43-dev-plans/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14440-1.html"

开发者对于 GNOME 43 的计划
======
> GNOME 43 及以后的开发计划令人振奋，以下是你可以期待的：……

![](https://news.itsfoss.com/wp-content/uploads/2022/04/gnome43-ft.jpg)

GNOME 42 刚刚发布不久。

尽管它是 GNOME 41 之后的一次令人兴奋的升级，但你可能无法在每个主流 Linux 发行版上找到它（除了 OpenSUSE、Arch 和 Clear Linux）。

Fedora 36 和 Ubuntu 22.04 应该是采用 GNOME 42 的最受欢迎的选择，它们将在接下来的几周发布。

接下来是什么？没错，就是 **GNOME 43**。

### GNOME 43：计划中的新功能

在一篇 [博文][1] 中，GNOME 开发者 Chris Davis 分享了一些 GNOME 43 及之后版本计划中的变更。

我在这里介绍其中的一些主要亮点。

> 请注意，这里提到的计划变更或改进可能会在 GNOME 43 中首次亮相，也可能不会。

#### 全局强调色

![Ubuntu 22.04 Beta 中的强调色][2]

随着 Libadwaita 的引入，现在有可能增加一个全局强调色的功能。

你不必依赖发行版来提供使用强调色的能力（比如 [Ubuntu 22.04 中添加了这个功能][3]）。

有了强调色，GNOME 桌面体验可以更加个性化。此外，它将不仅仅局限于预设，同时也支持自定义强调色，应用开发者可以考虑支持它。

#### 重新着色 API

![][4]

这对终端用户来说可能不是特别有趣，但它将帮助应用开发者提供预设的颜色方案，让他们的应用更好地协调各种强调色。

正如这篇博文所说：

> 开发者可以使用重新着色 API，以编程方式改变他们应用程序中的颜色，并让依赖的颜色自动更新。他们将能够轻松地创建预设，从而实现许多功能。例如，根据文本视图的颜色方案来改变窗口的显示颜色。

有了 libadwaita 1.0 中的 CSS，这在技术上已经可以实现。然而，API 可以帮助开发者更容易地使用这个功能。

#### 自适应的 Nautilus 文件管理器

![][5]

Nautius 文件管理器将得到一些升级，比如针对移动尺寸的自适应设计，其中包含一个新的文件选择器模式。

它将帮助 GNOME 平台跟上新功能，而不需要依赖 GTK 的文件选择器，因为它不支持 GNOME 的所有功能，比如收藏文件。

#### 新的图片浏览器（Loupe）和屏幕截图注释

一个新的图片浏览器正在开发中，名字叫 Loupe。它由 Rust 编写，使用了 GTK4 和 libadwaita。

![][6]

这个图片浏览器的目标是自适应、对触摸板和触摸屏友好，并且易于使用。你可以期待它与 Nautilus 集成，以遵循文件管理器中任何文件夹的排序设置。

除了系统集成之外，新的图片浏览器还将会有一些功能升级，主要是在基本的图片编辑方面，比如剪裁、旋转和注释。

![][7]

有了注释的能力，它可以与截图流程很好地配合，允许你在没有任何第三方程序的情况下进行屏幕截图并进行注释。

#### 磁盘使用情况分析器的新设计（用 Rust 重写）

磁盘使用情况分析器目前是用 Vala 编写的。

虽然它能完成预期的工作，但是按照现在的实现方式，它不具备很大的潜力。

![磁盘使用情况分析器的设计演示图，图源：Allan Day][8]

因此，开发计划中包括了使用 Rust 来重写它，这应该会在可预见的未来改善它，提供最好的性能。

![磁盘使用情况分析器的设计模型，图源：Allan Day][9]

不仅仅局限于其核心，它还将得到一个设计上的大调整（类似于上面的演示图），以争取让用户体验更加现代化。

### 其他改进措施

随着开发的进行，我们应该会知道更多关于 GNOME 外观和其他方面计划中的变更。

当我们了解到更多关于 GNOME 43 的功能时，我将会更新这篇文章。

如果你对技术细节感到好奇，你可以阅读 [Chris 的博文][1]。你也可以赞助他为 GNOME 做的工作，以及其他任何相关的东西。

你期待中的 GNOME 43 是什么样的？请在下面的评论中分享你的想法吧！

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-43-dev-plans/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://blogs.gnome.org/christopherdavis/2022/04/03/plans-for-gnome-43-and-beyond/
[2]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/03/ubuntu-22-04-dark-mode.png?w=1155&ssl=1
[3]: https://news.itsfoss.com/ubuntu-22-04-accent-color/
[4]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/04/recoloring-api-gnome-43.png?w=768&ssl=1
[5]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/04/nautilus-gnome-43-plan.png?w=768&ssl=1
[6]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/04/image-viewer-gnome-43.png?w=722&ssl=1
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/03/ubuntu-22-04-screenshot-ui.jpg?w=800&ssl=1
[8]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/04/disk-usage-analyser-gnome-43.png?w=763&ssl=1
[9]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/04/disk-usage-analyser-gnome-43-1.png?w=759&ssl=1
