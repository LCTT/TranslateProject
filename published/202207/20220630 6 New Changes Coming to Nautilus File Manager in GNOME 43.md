[#]: subject: "6 New Changes Coming to Nautilus File Manager in GNOME 43"
[#]: via: "https://news.itsfoss.com/gnome-files-43/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14791-1.html"

GNOME 43 中 Nautilus 文件管理器的 6 个新变化
======

> GNOME 文件即将到来的变化改善了用户体验，让我们来看看其中的一些变化。

![gnome files][1]

我们离 GNOME 43 的发布还有几个月的时间，但是 GNOME 应用程序的开发活动正在如火如荼地进行。

例如，[GNOME Web 43 alpha 版本支持了扩展][2]。

同样，GNOME 文件管理器（Nautilus）也有一些令人兴奋的变化，特别是对于列表视图。

列表视图使用 [GtkColumnView][3] 部件重新实现，丢弃了 GtkTreeView，以便能够添加新功能。

一些完善了代码的变化包括：

### 1、拖动并选择文件

就像你在网格视图中通常所做的那样，你终于可以通过简单地拖动你的鼠标在列表视图中选择多个项目，来选择你想要的项目。

![gnome files][4]

如果你没有注意到，每行之间也有一点间隔。虽然选择的动画还不是最流畅的，但它是一个正在进行的工作。

我试着用 peek 录制 GIF（在带有 Wayland 的 Fedora 上），但由于某些原因，它没有反应，可能与 alpha 版本有一些冲突。

### 2、鼠标悬停时高亮行

当你把鼠标悬停在上面的时候，没有行高亮是很不直观的。

现在，它做到了。只要把你的光标放在列表视图中的任何一个项目上，它就会被突出显示，如上图所示。

### 3、搜索一个文件时，列不会消失

![之前][5]

![之后][6]

当你用当前的 Nautilus 文件管理器搜索一个文件时，列的处理方式不是很好。你会失去某些细节信息，如文件大小。

在新的变化中，你仍然可以看到文件的大小、修改日期，以及给文件加星的能力。

通过这一改变，用户体验肯定会更好。

### 4、更好的紧凑视图

当你缩小文件管理器窗口的大小时，也处理的不是很好。你看不到文件扩展名的细节，而且列对变化没有反应。

![][7]

在 GNOME 文件管理器 43 alpha 版本中，即使你缩小了窗口的大小以获得一个紧凑的视图，你仍然可以看到列，以及如上所示的文件扩展名。

### 5、新的文件上下文菜单

![][8]

作为对 2022 年 GSoC（谷歌编程之夏）的贡献的一部分，一位开发者正专注于改善新文档功能的可发现性。

当你将某些文件添加到<ruby>模板<rt>Templates</rt></ruby>目录中时，你可以在执行右键单击时在上下文菜单中找到这个 “<ruby>新文档<rt>New Document</rt></ruby>” 选项。

在即将到来的更新中，这个选项将是开箱即用。即，更加易于使用。

另外，开发人员正在想办法改进添加模板的过程。你可以这篇在 [博文][9] 中更多了解他们的工作。

### 6、当你给一个文件加星时的动画

![][10]

当你点击列表项右侧的星形图标时，你可以发现它在移动，让你知道你与该选项进行了互动。

### 总结

当然，我所提到的一切都处于开发阶段（alpha 版本）。在我们等待 beta 版本的时候，我们应该能清楚地了解到文件管理器的更多功能，以及事情是如何改进的。

你对 GNOME 43 有什么期待？请在下面的评论中告诉我们。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-files-43/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/changes-in-nautilus-in-gnome-43.jpg
[2]: https://news.itsfoss.com/gnome-web-extensions-dev/
[3]: https://gitlab.gnome.org/GNOME/nautilus/-/commit/6708861ed174e2b2423df0500df9987cdaf2adc0
[4]: https://news.itsfoss.com/wp-content/uploads/2022/06/nautilus-drag-select-alpha.jpg
[5]: https://news.itsfoss.com/wp-content/uploads/2022/06/file-search-before.jpg
[6]: https://news.itsfoss.com/wp-content/uploads/2022/06/file-search-after.jpg
[7]: https://news.itsfoss.com/wp-content/uploads/2022/06/compact-view-files-1024x482.jpg
[8]: https://news.itsfoss.com/wp-content/uploads/2022/06/new-document-file-manager.jpg
[9]: https://ignapk.blogspot.com/2022/06/gsoc-2022-first-update-planning.html
[10]: https://news.itsfoss.com/wp-content/uploads/2022/06/animation0file.webm
