[#]: subject: "Nautilus File Manager Looks Amazing with GTK4 and Libadwaita – A Deep Dive"
[#]: via: "https://www.debugpoint.com/2022/03/gnome-files-43/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14442-1.html"

GTK4 和 Libadwaita 让 GNOME 43 的文件管理器看起来很出色
======

![](https://img.linux.net.cn/data/attachment/album/202204/07/163919x7t2hbblzmthmjfk.jpg)

> 我们测试了 GNOME “<ruby>文件<rt>Files</rt></ruby>” v43 的开发版本，在这里将向你深入披露其外观、功能和性能的细节。

GNOME <ruby>文件<rt>Files</rt></ruby>（以前的 Nautilus）也许是当今 GNOME 生态空间中使用最多的桌面应用。而且，自其首次发布以来，它从未接受过什么大修，而其他的 GNOME 应用乃至桌面本身都转移到了一个较新的技术栈。

现在一切都变了。GNOME 开发者正在为整个桌面和 “文件” 采用 GTK4 和 libadwaita。

GNOME “文件” v43 将在 2022 年晚些时候与 GNOME 43 一起发布，必将令人印象深刻。这个急需的 [重制][1] 带来了原生的深色模式、很棒的 UI 以及出色的 libadwaita 触控和 GTK4 性能提升。

### GNOME “文件” v43

我们安装了 GNOME “文件” v43 的 Flatpak 开发版本，下面是我们的发现。

第一印象，你应该注意到漂亮的 UI 触控，这要感谢 Libadwaita。关闭按钮是漂亮的圆形，而地址栏、选择高亮和整个文件窗口都有适当的间距和圆角。

所有的组件都没有出现边框高亮线。

下面是 v43（左）和 v42（右）的深浅模式的快速比较。

![GNOME Files 43 and 42 – Light Mode Comparison][2]

![GNOME Files 43 and 42 – Dark Mode Comparison][3]

地址栏的文件夹分隔符保持不变。然而，字体却有了些许润色。地址栏的上下文菜单改变了，“<ruby>在终端打开<rt>Open in Terminal</rt></ruby>”选项没有了。取而代之的是 “<ruby>在其它应用中打开<rt>Open in Other application</rt></ruby>” 菜单。引入了一个新的选项 “<ruby>创建链接<rt>Create Link</rt></ruby>”。我想许多用户会怀念 “在终端打开” 的选项。

> 3/3 更新（感谢 Rashid）：“在终端打开” 选项是 Nautilus 扩展包的一部分。因此，Flatpak 构建版不能“看到”它。因此，它本身并没有被删除。

![New option in address bar menu][4]

另一个重要的变化是你应该注意到两个主工具条菜单：a）视图按钮和 b）汉堡主菜单。这些上下文菜单项显示了菜单项及键盘快捷键。这也使它们看起来更显眼一些。

![The Hamburger menu now have keyboard shortcuts][5]

文件夹的上下文菜单现在有一个向上的小箭头，指向从它弹出的文件夹。文件夹的右键上下文菜单以组为单位组织得很好。例如，打开动作是分组的，而剪切、复制、粘贴在上下文菜单中以横杠的形式明显分开。

![Context Menu for folder changes][6]

我还注意到一个新的选项 “<ruby>粘贴到该文件夹<rt>Paste into the folder</rt></ruby>”，这个很好。

Nautilus 搜索几乎与 “文件” v42 相同，只是在 “文件” v43 中你可以通过创建日期/时间搜索。

~~然而，我注意到一个令人兴奋的变化。上下文菜单中的文件关联的应用名称被删除了。例如，如果你今天试图在 “文件” v42 中打开一个文本文件，它在上下文菜单中显示与之相关的应用名称。在 “文件” v43 中，它只显示 “打开”。我觉得这种改变是不必要的。之前的情况更好。~~

> 3/3 更新（感谢 Rashid）：当我在试用 v43 的沙盒 Flatpak 版本时，它并没有看到系统关联。所以，这不是一个变化。但是，我又想知道，如果有人试图真正使用 Flatpak 版本怎么办。

![A subtle change in context menu for file association][7]

所以，这就是我在这个应用的新 GTK4 版本中发现的整体变化。但它看起来不错？不是吗。此外，如果你是直接从 Ubuntu 20.04 LTS 来的，其中包含 “文件” 3.38，那么也许你的体验会是“哇”！如果你将 “文件” v43 与 “文件” v3.38 进行比较，大部分区域都发生了变化。对于这些用户来说，这将是一个相当不错的体验。

你应该记住，v43 仍在开发中，因此在未来最终发布时，可能会发生变化。

### 愿望清单

如果比较各种 Linux 文件管理器，其他的文件管理器的选项远多于今天的 GNOME “文件”。

是这样的。

例如，Nemo 或 Dolphin - 这两个最好的文件管理器在各方面都胜过 “文件”。比较一下功能，GNOME “文件” 没有一些流行的功能：

  * 双面板或分割视图
  * 从上下文菜单中打开一个根文件夹是困难的
  * 一个用于文件夹浏览的向上箭头
  * 没有从上下文菜单中创建一个新文件（文本、电子表格等）的选项
  * 更多的排序和搜索功能

我们希望这些功能能尽快出现在 GNOME “文件” 中。

### 何时能用

如上所述，这个版本的 GNOME “文件” 将与 GNOME 43 一起提供。因此，从 Linux 发行计划的角度来看，你应该在 2022 年 10 月的 Ubuntu 22.10 和今年晚些时候的 Fedora 37 上拥有它。

不幸的是，[Ubuntu 22.04 LTS][9]（Jammy Jellyfish）和带有 [GNOME 42][10] 的 [Fedora 36][11] 将不会有 GNOME “文件” 43。主要原因是时间表不匹配，而且它是要移植到 GTK4 和彻底测试的复杂应用之一。然而，大部分上述的内部功能仍然会在 “文件” 42 中。但它可能缺少漂亮的 UI 变化和主题。

尽管如此，我相信这个流行的文件管理器看起来不错，当它发布时，用户应该会很兴奋地使用它。让我知道你对 GNOME “文件” 43 的新变化的看法，请在下面的评论框中留言。

加油！

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/03/gnome-files-43/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://gitlab.gnome.org/GNOME/nautilus
[2]: https://www.debugpoint.com/wp-content/uploads/2022/03/GNOME-Files-43-and-42-Light-Mode-Comparison-1024x502.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/03/GNOME-Files-43-and-42-Dark-Mode-Comparison-1024x493.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/03/New-option-in-address-bar-menu-1024x267.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/03/The-Hamburger-menu-now-have-keyboard-shortcuts-1024x331.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/03/Context-Menu-for-folder-changes-1024x560.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/03/A-subtle-change-in-context-menu-for-file-association-1024x524.jpg
[9]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[10]: https://www.debugpoint.com/2021/12/gnome-42/
[11]: https://www.debugpoint.com/2022/02/fedora-36/
[12]: https://t.me/debugpoint
[13]: https://twitter.com/DebugPoint
[14]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[15]: https://facebook.com/DebugPoint
