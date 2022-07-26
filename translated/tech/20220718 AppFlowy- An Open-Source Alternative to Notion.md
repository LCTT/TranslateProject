[#]: subject: "AppFlowy: An Open-Source Alternative to Notion"
[#]: via: "https://itsfoss.com/appflowy/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

AppFlowy：Notion 的开源替代品
======
简介：AppFlowy 旨在成为 Notion 的开源替代品，为你提供更好的隐私。让我们更多地探索它。

虽然 Notion（项目管理/笔记工具）的功能非常出色，但它并不是一个开源解决方案。此外，它没有 Linux 桌面客户端。

那么，对于 Linux 来说，更透明、更私密和可用的替代方案是什么？

这就是 AppFlowy 大放异彩的地方！

AppFlowy 使用 Rust 和 Flutter 构建，遵循一种最小的方式来简化事情，但有足够的空间进行调整。

### AppFlowy 是隐私和用户体验的完美结合

![appflowy][1]

AppFlowy 是相当新的。我们在去年首次推出后[报告][2]了它的发展状况。

这是一个开源项目，旨在克服 [Notion][3] 在安全和隐私方面的一些限制。它可以帮助你管理任务、添加待办事项列表、添加截止日期、跟踪事件、添加页面以及为你的笔记/任务设置文本格式。

但不仅仅是安全性。用户体验也很重要。而且，AppFlowy 在这方面做得很好，甚至比 Notion 更好。

请注意，该项目仍处于**测试阶段**。

目前，该项目的目标不是更好的设计和功能，而是数据隐私、原生体验和社区驱动的机会。

#### Notion 与 AppFlowy：你的优先事项是什么？

虽然它旨在取代 Notion 作为开源解决方案，但它可能并不适合所有人。

因此，如果你要选择 AppFlowy 而不是 Notion，你将获得以下好处：

##### 透明度

AppFlowy 是一个开源项目，因此随时欢迎你查看和修改代码。

##### 隐私

Notion 可以作为闭源软件直接访问你在云中的私有数据。与此相比，你可以根据自己的喜好托管 AppFlowy。

你的所有个人数据都将保留在你身边，你可以完全控制它。开发人员还提到他们正在使用离线模式来为本地安装带来更好的支持。

##### 性能和原生体验

AppFlowy 使用 Rust 和 Flutter 构建，在提供现代用户体验的同时牢记性能。

不仅限于此，你还可以在 Linux 上获得良好的原生体验，这是 Notion 所没有的。

### AppFlowy 的特点

![appflowy screenshot 1][4]

AppFlowy 在功能方面可能并不优越，但它确实提供了几个基本功能。

随着开发的继续，您可以期待更多的功能添加。一些现有的亮点包括：

* 原生跨平台支持。
* 能够自行托管或将其安装在你的计算机上。
* 可定制性。
* 数据隐私（重中之重）。
* 单一代码库，便于更好地维护。
* 社区驱动的可扩展性。
* 简约的用户界面。
* 添加待办事项，管理任务。
* 高亮文本和基本格式。
* 用于编辑单元格/网格的键盘快捷键。
* 深色模式支持。

#### 在 Linux 上安装 AppFlowy

由于这仍处于测试阶段，它在默认仓库中不可用，并且没有任何维护的 PPA，也没有任何 Flatpak/Snap 包。

但是，你可以通过给定的命令轻松安装 AppFlowy（仅在 Ubuntu 20.04 LTS 和 Arch X86_64 上测试）：

```
wget https://github.com/AppFlowy-IO/AppFlowy/releases/download/0.0.4/AppFlowy-linux-x86.tar.gz
tar -xzvf AppFlowy-linux-x86.tar.gz
cd AppFlowy
```

要运行 AppFlowy，请使用给定的命令：

```
./app_flowy
```

要在你的系统菜单中注册 AppFlowy，你必须执行以下附加步骤：

首先，你必须更改 AppFlowy logo 的默认名称：

```
mv flowy_logo.svg app_flowy.svg
```

现在，你必须将临时 Linux 桌面文件复制到可用的 Linux 桌面文件中。

```
cp appflowy.desktop.temp app_flowy.desktop
```

是时候对配置文件进行一些更改了。

```
sudo nano appflowy.desktop
```

在这里，你必须将 [CHANGE_THIS] 替换为图标和可执行文件的路径。

![add location of icon and exec file][5]

使用 CTRL + O 保存更改并使用 CTRL + X 退出。

最后，移动 desktop 文件，以便你的系统可以读取它。

```
mv app_flowy.desktop ~/.local/share/applications/.
```

它应该是这样的：

![appflowy in system menu][6]

无论哪种情况，你都可以查看 AppFlowy 的 [官方文档][7] 以从源代码构建它。在其官方网站上探索更多关于它的信息。

[AppFlowy][8]

### 总结

如果你需要具有原生 Linux 体验的简单的类 Notion 应用，AppFlowy 是一个有趣的选择。

考虑到它正在积极开发中并且远非 Notion 的完全替代品，你应该预期会出现错误/问题。

作为 Notion 的开源替代品？它可以工作！你可以使用它来管理任务、添加笔记和制作待办事项列表。

--------------------------------------------------------------------------------

via: https://itsfoss.com/appflowy/

作者：[Sagar Sharma][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/07/AppFlowy.png
[2]: https://news.itsfoss.com/appflowy-development/
[3]: https://www.notion.so/
[4]: https://itsfoss.com/wp-content/uploads/2022/07/appflowy-screenshot-1.png
[5]: https://itsfoss.com/wp-content/uploads/2022/07/Add-location-of-icon-and-exec-file-800x524.png
[6]: https://itsfoss.com/wp-content/uploads/2022/07/AppFlowy-in-System-menu-1.png
[7]: https://appflowy.gitbook.io/docs/essential-documentation/contribute-to-appflowy/software-contributions/environment-setup/building-on-linux
[8]: https://www.appflowy.io/
