[#]: subject: "Warehouse: A Powerhouse Tool to Manage Flatpak Apps"
[#]: via: "https://news.itsfoss.com/warehouse/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16321-1.html"

Warehouse：管理 Flatpak 应用的强大工具
======

![][0]

> 你是否使用 Flatpak 应用？Warehouse 可以让你更轻松。

有一个应用，可以为你提供有关 Flatpak 应用的所有重要信息，以及管理它的工具，这不是很好吗？

这一次你很幸运！

在这次的首次尝试中，我们有一个有趣的应用程序，名为 “**Warehouse**”，**它可以帮助你管理 Flatpak 应用**。

我们以前介绍过一个类似的应用，名为 “[Flatseal][1]”，但它更侧重于管理 Flatpak 的权限。

让我们看看 Warehouse 提供了哪些功能。

### Warehouse：概述 ⭐

![][2]

开发人员将其称为“**多功能工具箱**”，Warehouse 可用于**管理 Flatpak 用户数据**、**查看 Flatpak 的信息**，甚至**批量管理系统上安装的 Flatpaks**。

它主要使用 **Python 语言**编写，具有以下主要特点：

  * 轻松管理用户数据
  * 批量操作功能
  * 清除残余数据

### 初步印象 👨‍💻

我一开始是在我的 Ubuntu 系统上测试 Warehouse。从 **Flathub** 上安装它很简单。

打开后，显示了所有**已安装的 Flatpak 应用**的列表。它们**都以有序的方式排列**。

在我看来，如果它们添加了切换到网格布局的选项，会看起来更好。

![][4]

> 📋 你是否对列在 Firefox 之上的应用感到好奇？我们最近介绍过它，它是一个名为 “[Mission Center][5]” 的系统监控应用。

接下来，我**查看了 Flatpak 应用的属性**，我点击应用旁边的“信息”标志，打开了应用属性窗口。

它提供了有关应用程序的各种信息，从**名称**、**描述**、**应用 ID**，一直到**活动提交**和**安装大小**。

![][6]

类似地，我可以点击“垃圾桶”图标，要么**完全卸载 Flatpak 应用**，要么为将来重新安装**保留用户数据**，并恢复设置/内容。

![][7]

Warehouse 还具有**搜索功能**，允许你搜索特定的应用。当你安装了很多 Flatpak 应用时，这可能会很有用。

只需点击应用程序左上角的**放大镜**图标即可开始搜索。

![][8]

你还可以**设置过滤器**，以**应用甚至运行时（系统完成各种任务所需的）进行排序**。

点击应用程序左上角的“漏斗”图标以开始筛选。

![][9]

然后，我查看了**批量操作功能**。我首先点击了应用右上方的“勾号”标志。

然后，我就可以选择多个应用，执行**复制信息**、**删除应用数据**和**卸载它们**等操作。

应用程序右下角的三个小按钮可以方便地执行上述操作。

![][10]

之后，我进入菜单，其中有一些重要选项。

![][11]

第一个选项“<ruby>从文件安装<rt>Install from file</rt></ruby>”允许我使用 `.flatpakref`  文件安装 Flatpak 应用。

![][12]

在安装过程中，它问我是要为特定用户安装，还是要为使用系统的所有人安装。我选择了后者。

![][13]

随后，我查看了“<ruby>管理残余数据<rt>Manage Leftover Data</rt></ruby>”选项。它向我显示了一个旧的 Flatpak 应用留下了多少数据。

我可以选择通过“<ruby>安装<rt>Install</rt></ruby>”选项重新安装应用并恢复数据，也可以使用“<ruby>垃圾桶<rt>Trash</rt></ruby>”选项彻底清除系统中的任何痕迹。有时，残留数据会占用大量空间。

![][14]

如果你经常安装/删除应用，那么你的系统中可能会有很多剩余数据。

如果你想管理 Flatpak 仓库，可以前往“<ruby>管理远程仓库<rt>Manage Remotes</rt></ruby>”选项，该选项允许你添加或删除它们。

![][15]

虽然你可以在 Fedora 和其他一些发行版的软件中心完成这项工作，但在一个应用中就能获得所有基本功能，这将是一种无缝体验。

最后，你还可以使用大量的“**键盘快捷键**”，通过键盘快速浏览应用的所有功能。

![][16]

### 📥 下载 Warehouse

你可以前往 [Flathub 商店][17]下载最新版本。

> **[Warehouse（Flathub）][17]**

你还可以访问其 [GitHub 仓库][18] 查看源代码。

你对 Warehouse 应用有何看法？请在下面的评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/warehouse/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/flatseal/
[2]: https://news.itsfoss.com/content/images/2023/10/Warehouse_1.png
[3]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[4]: https://news.itsfoss.com/content/images/2023/10/Warehouse_2a.png
[5]: https://news.itsfoss.com/mission-center/
[6]: https://news.itsfoss.com/content/images/2023/10/Warehouse_2b.png
[7]: https://news.itsfoss.com/content/images/2023/10/Warehouse_2c.png
[8]: https://news.itsfoss.com/content/images/2023/10/Warehouse_3.png
[9]: https://news.itsfoss.com/content/images/2023/10/Warehouse_4.png
[10]: https://news.itsfoss.com/content/images/2023/10/Warehouse_5.png
[11]: https://news.itsfoss.com/content/images/2023/10/Warehouse_6.png
[12]: https://news.itsfoss.com/content/images/2023/10/Warehouse_7a.png
[13]: https://news.itsfoss.com/content/images/2023/10/Warehouse_7b.png
[14]: https://news.itsfoss.com/content/images/2023/10/Warehouse_8.png
[15]: https://news.itsfoss.com/content/images/2023/10/Warehouse_9.png
[16]: https://news.itsfoss.com/content/images/2023/10/Warehouse_10.png
[17]: https://flathub.org/apps/io.github.flattool.Warehouse
[18]: https://github.com/flattool/warehouse
[0]: https://img.linux.net.cn/data/attachment/album/202310/26/224157oonzwjd1vp0d2p85.jpg