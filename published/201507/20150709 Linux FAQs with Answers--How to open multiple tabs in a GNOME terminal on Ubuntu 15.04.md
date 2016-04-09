Linux有问必答：如何在 Ubuntu 15.04 的 GNOME 终端中开启多个标签
================================================================================
> **问**: 我以前可以在我的 Ubuntu 台式机中的 gnome-terminal 中开启多个标签。但升到 Ubuntu 15.04 后，我就无法再在 gnome-terminal 窗口中打开新标签了。要怎样做才能在 Ubuntu 15.04 的 gnome-terminal 中打开标签呢？

在 Ubuntu 14.10 或之前的版本中，gnome-terminal 允许你在终端窗口中开启一个新标签或一个终端窗口。但从 Ubuntu 15.04开始，gnome-terminal 移除了“新标签”选项。这实际上并不是一个 bug，而是一个合并新标签和新窗口的举措。GNOME 3.12 引入了[单独的“开启终端”选项][1]。开启新终端标签的功能从终端菜单移动到了首选项中。

![](https://farm1.staticflickr.com/562/19286510971_f0abe3e7fb_b.jpg)

### 偏好设置中的开启新标签 ###

要在 Ubuntu 15.04 的 gnome-terminal中开启新标签，选择“编辑” -> “首选项"，并把“开启新终端：窗口”改为“开启新终端：标签”。

![](https://farm1.staticflickr.com/329/19256530766_ff692b83bc_b.jpg)

如果现在你通过菜单开启新终端，就会显示在当前终端中的一个新标签页中。

![](https://farm4.staticflickr.com/3820/18662051223_3296fde8e4_b.jpg)

### 通过键盘快捷键开启标签 ###

如果你不想更改首选项，你可以按住 <Ctrl> 临时改变设置。比如，在默认情况下，在点击“新终端”的同时按住 <Ctrl>，终端就会在新标签中打开而不是开启新的终端。

另外，你还可以使用键盘快捷键  <Shift+Ctrl+T> 在终端中开启新标签。

在我看来，gnome-terminal 此番在 UI 上的改变并非一个进步。比如，你无法自定义终端中各个标签的标题了。当你在一个终端中打开了多个标签时，这个功能会很有用。而如果终端名称保持默认标题（并不断变长）时，你就不能在有限的标题空间里看见终端的标题了。希望能被尽早加入这个功能。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/open-multiple-tabs-gnome-terminal-ubuntu.html

作者：[Dan Nanni][a]
译者：[KevinSJ](https://github.com/KevinSJ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://worldofgnome.org/opening-a-new-terminal-tabwindow-in-gnome-3-12/
