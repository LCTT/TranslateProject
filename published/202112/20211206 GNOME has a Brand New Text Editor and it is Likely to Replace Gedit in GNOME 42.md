[#]: subject: "GNOME has a Brand New Text Editor and it is Likely to Replace Gedit in GNOME 42"
[#]: via: "https://news.itsfoss.com/gnome-text-editor-to-replace-gedit/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14060-1.html"

GNOME 有了一个全新的“文本编辑器”，它会成为默认编辑器吗？
======

> GNOME 新的“文本编辑器”正在增加新的功能，有可能在下一个 GNOME 桌面版本中取代 Gedit。

![](https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/gnome-text-editor-gnome-42.jpg?w=1200&ssl=1)

Gedit 是 GNOME 桌面环境的默认文本编辑器。它是一个受欢迎的编辑器，也是一个便捷的文本编辑器，以简单的用户界面提供了所有的基本功能。

但是，随着 GNOME 的发展，有了一个新的“文本编辑器”（LCTT 译注：没错，就叫“<ruby>文本编辑器<rt>Text Editor</rt></ruby>”），虽然它还没有取代 Gedit。但让我们来看看它的下一个版本，在即将到来的 GNOME 42 版本中，它进行了大量改进，有可能取代 Gedit。

[Christian Hergert][1] 在他的 [博文][2] 和 Twitter 上分享了它的很多细节。

在这篇文章中，让我介绍一下 GNOME 文本编辑器的那些新改进。

### 偏好设置对话框卷土重来

作为其上一个版本中的实验的一部分，偏好设置对话框被移到了侧边栏，

![][3]

但是，事实证明，它并不那么方便和好看。

因此，偏好设置对话框又回来了（如下图所示），其目的是与其他 GNOME 应用程序的设计语言相融合，而不显得笨拙。

![鸣谢：Christian Hergert][4]

在我看来，这很不错，与侧边栏的实施相比，应该用户体验更好。

### 改进的 “弹出式” 打开功能

![鸣谢：Christian Hergert][5]

当你试图打开一个最近的文件或搜索某个东西时，会出现一个弹出式窗口来快速查找任何最近的文件，而不需要启动一个新的对话框。

这节省了时间，是一个不错的功能。在即将发布的“文本编辑器”中还进行了一些细微的改进，显得更苗条、更便捷。

换句话说，你会发现它改进了键盘导航，只需按下 `Ctrl + K`，就可以寻找你想要的文件。

### 引入重新着色支持

即将发布的 GNOME 文本编辑器可以让你轻松地应用不同的风格模式（或主题），而改变整个应用程序。

博文中提到了更多关于它的内容：

> 本周最直观的工作是引入了重新着色支持。它建立在 [libadwaita][6] 之上，并使用一个 CSS 提供者来覆盖主题中的颜色。我希望在不远的将来，libadwaita 会有一个重新着色的 API，为我们提供这个功能。

下面是一个应用样式表时的例子：

![鸣谢：Christian Hergert][7]

它有一些自带的主题，而且你还可以找到更多的主题。你可以在 Christian 的博客文章中找到更多截图：

![鸣谢：Christian Hergert][12]

你可以看看 [博客文章中的更多内容][2]，还可以发现一些其他的技术变化，和一个由 Christian 设计的 vim 仿真的复活节彩蛋。

### GNOME “文本编辑器”会取代 Gedit 吗？

到现在为止，官方还没有确认这一点。然而，看一下 [Gedit 的开发活动][8]（目前有 41 个 alpha 版本），在过去的几个版本中没有明显增加变化，这可能意味着新的 GNOME “文本编辑器”将在GNOME 42 中取代 Gedit。

事实上，正如其 [GitLab 页面][9] 中所提到的，GNOME 的新文本编辑器计划正式取代 Gedit，但它会在 GNOME 42 中发生吗？它的开发者 Christian Hergert 在他的博客中提到：

> 随着我们为 GNOME 42 的准备工作而进行的竞赛，[文本编辑器][9] 在过去的几周里已经成型。

这可以被认为是一个暗示，GNOME 42 可能会包含这个新的文本编辑器。

不仅仅是 GNOME，[KDE 也对 Kate 进行了改造][10]，增加了针对开发者的功能。你将会有很多 [开源的文本编辑器][11] 可以选择。

当它发布时，我们将继续关注它。你怎么看？

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-text-editor-to-replace-gedit/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://twitter.com/hergertme
[2]: https://blogs.gnome.org/chergert/2021/12/03/text-editor-happenings/
[3]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/gnome-text-editor-old-preferences.png?w=870&ssl=1
[4]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/gnome-text-editor-preferences.png?resize=1355%2C2048&ssl=1
[5]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/gnome-text-editor-popover.jpg?w=1200&ssl=1
[6]: https://gnome.pages.gitlab.gnome.org/libadwaita/doc/main/
[7]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/gnome-text-editor-style-scheme.png?w=1200&ssl=1
[8]: https://gitlab.gnome.org/GNOME/gedit
[9]: https://gitlab.gnome.org/GNOME/gnome-text-editor
[10]: https://news.itsfoss.com/kate/
[11]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[12]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/gnome-text-editor-style-scheme-1.png?w=1200&ssl=1