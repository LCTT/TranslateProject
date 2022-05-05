[#]: subject: "BitTorrent Client ‘Fragments 2.0’ for Linux is Here, Rebuilt Using Rust with a New UI"
[#]: via: "https://news.itsfoss.com/fragments-2-0-release/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14252-1.html"

Linux BitTorrent 客户端 Fragments 2.0 全新发布
======

> Fragments 2.0 的发布使其成为 Linux 发行版中最方便用户使用的 BitTorrent 客户端之一。让我们来看看有什么新变化。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fragments-2-0-ft.png?w=1200&ssl=1)

Fragments 是 [Linux 上最好的 BitTorrent 客户端之一][1]。

最新的 Fragments 2.0 是一个重大升级，它使用 Rust、GTK 4 和 Libadwaita 从头开始完全重写。

除了技术上的改进之外，你还会发现一些新的功能和改进的用户界面。

让我重点介绍一下它的变化。

### Fragments 2.0 的新变化

![][2]

最近，Gnome 应用程序的生态系统经历了一些大规模的变化。在这个变化的最前沿是向 Gtk4 和 [Libadwaita][3] 的过渡。不幸的是，这种变化并不小，许多应用程序需要从头开始重建，以支持这些新标准。

与许多其他应用程序开发者一起，Fragment 的开发者 [Felix Häcker][4] 决定从头开始重建 Fragments，现在作为 Fragments 2.0 发布。因此，我们现在得到了一个改进的 Linux 的 BitTorrent 客户端。

其中的一些改进包括。

  * 一个基于 Libadwaita 的漂亮的新用户界面
  * 新的模块化架构
  * 能够被用作远程 Fragments / Transmission 会话的远程控制
  * 新的偏好对话框有更多的选项
  * 能够查看有关网络的统计数据

#### 一个新的用户界面

![][5]

Fragments 2.0 现在有一个基于 Libadwaita 的新 UI。补充一句，Libadwaita 是 GTK4 对 Gnome 应用程序的一个扩展。它有几个优点，最明显的是在所有 Gnome 应用程序中具有一致的外观。

它比旧的主题更加扁平和圆润，我觉得，看起来非常时尚。

你可以得到一个外观简洁的 BitTorrent 应用程序，易于浏览，你也可以快速访问一些基本的选项。

#### 新的模块化架构

虽然不能直接看到，但 Fragments 2.0 具有一个全新的模块化架构。在内部，该应用程序的所有不同部分都是模块化的。虽然这起初看起来没有那么大的影响，但我可以看到它对用户和开发者都有深远的影响。

首先，它应该意味着更容易维护，希望能让开发人员花更多时间在新功能和错误修复上。其次，它也应该意味着应用程序的更大稳定性。如果 Fragments 的一个部分崩溃了，应用程序的其他部分应该保持工作，希望不会对用户产生任何重大影响。

这只是我想到的这个新架构的两个好处，我相信还可以有更多。

#### 新的首选项对话框

![][6]

最后，Fragments 2.0 引入了几个经常要求的设置选项。在这些选项中，我认为最重要的是能够改变尚未完全下载的种子的默认文件夹。

![][11]

虽然仍然不像它的一些替代品那样可以定制，但这些新增功能可以帮助你调整设置以适应你的要求。

其中一些选项包括：

  * 添加种子后自动启动它们
  * 启用/禁用下载队列
  * 可定制的对等体限制
  * 网络端口设置
  * 自动端口转发的切换

#### 控制远程 Fragments / Transmission 会话

远程控制你的下载的能力可以产生相当大的影响。随着 Fragments 2.0，该应用程序终于获得了类似的功能，允许用户远程控制其他安装的 Fragments 和 Transmission 客户端。

这对使用单独的下载服务器的人来说非常有用，因为他们往往不能直接访问它。

虽然这在其他应用程序中一直提供的，但这一功能被直接整合到 Fragments 中，使得它成为一个对高级用户有用的 BitTorrent 客户端！

#### 其他改进措施

![][7]

除了所有这些大的变化之外，还有一些错误的修复和一些新的能力。

一些关键的亮点包括：

  * 添加的种子的磁力链可以被复制到剪贴板上
  * 可以查看关于当前会话的统计数据（速度、总下载数据等）

你可以在其 [GitLab 页面][8] 上探索更多关于 Fragments 2.0 的信息。

### 下载 Fragments 2.0

Fragments 是以 Flatpak 应用程序的形式提供的。如果你的 Linux 发行版没有内置的支持，你可以通过我们的 [Flatpak 指南][9] 来设置 Flatpak。

- [Fragments（Flathub）][10]

你可以尝试在你的软件中心搜索它（启用 Flatpak 集成）或在终端键入以下命令：

```
flatpak install flathub de.haeckerfelix.Fragments
```

Fragments 2.0.1（有一些小的修正）也可以在其 GitLab 页面上找到，但还没有反映在 Flathub 上。

如果你在使用 Fragments 2.0 时有问题，你可能想等更新版本进入 Flathub。

你最喜欢的 BitTorrent Linux 客户端是什么？Fragments 2.0 是否令人印象深刻？请在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fragments-2-0-release/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-torrent-ubuntu/
[2]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fragments-2-0-home.png?resize=1568%2C1109&ssl=1
[3]: https://adrienplazas.com/blog/2021/03/31/introducing-libadwaita.html
[4]: https://twitter.com/haeckerfelix
[5]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fragments-2-0-screenshot.png?resize=1568%2C1424&ssl=1
[6]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fragments-2-0-preferences.png?resize=1568%2C1454&ssl=1
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fragments-2-other.png?w=1376&ssl=1
[8]: https://gitlab.gnome.org/World/Fragments
[9]: https://itsfoss.com/flatpak-guide/
[10]: https://flathub.org/apps/details/de.haeckerfelix.Fragments
[11]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/fragments-2-downloads.png?resize=1568%2C1454&ssl=1