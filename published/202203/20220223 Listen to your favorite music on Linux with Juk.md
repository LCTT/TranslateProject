[#]: subject: "Listen to your favorite music on Linux with Juk"
[#]: via: "https://opensource.com/article/22/2/listen-music-linux-juk-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14329-1.html"

用 Juk 在 Linux 上听你喜欢的音乐
======

> Juk 是 Linux 上的 KDE Plasma 桌面的默认开源音乐播放器。

![](https://img.linux.net.cn/data/attachment/album/202203/05/180154hu1nse2p2crv5q1r.jpg)

KDE 项目不只是提供了一个著名的桌面，它还产生了很多软件，从 [视频编辑][2]、[摄影][3] 和 [插图][4] 工具，到图形计算器、电子邮件和办公工作。这些都是生产力工具，但 KDE 也适合于放松。它有游戏和媒体播放器，而我使用的音乐播放器是 [Juk][5]。

### 在 Linux 上安装 Juk

只要你的 Linux 发行版提供 KDE 软件包，你就可以用你的包管理器安装 Juk。

在 Fedora、Mageia 和类似发行版上：

```
$ sudo dnf install juk
```

在 Elementary、Linux Mint 和其他基于 Debian 的发行版上：

```
$ sudo apt install juk
```

### 使用 Juk

当你第一次启动 Juk 时，你会被问到你想用什么目录作为你的音乐集的来源。选择你希望 Juk 寻找音乐的文件夹，并可选择排除你希望 Juk 忽略的任何子目录。

![Adding music to Juk][6]

取决于你有多少音乐，Juk 可能需要一些时间来解析文件系统和元数据。当它完成后，通常的 Juk 窗口就会出现，你所有的音乐都在一个叫做“<ruby>收藏列表<rt>Collection List</rt></ruby>”的中央收藏列表中。

![Juk music player][8]

在顶部的搜索栏中，你可以在任何领域搜索任何字符串。双击歌曲，开始播放。

Juk 默认为连续播放，这意味着在它播放完你的选择后，它会继续播放收藏列表中的下一首歌曲，即使你已经将你的列表过滤到只有一首歌曲。这使音乐总是会不断播放，就像一个真正的点唱机。

就我个人而言，我更喜欢听完整的专辑，中间有足够的休息时间去厨房喝咖啡，所以我使用播放列表。

### Juk 中的播放列表

Juk 中的播放列表可以包含你收藏列表中的任何内容。Juk 会在播放列表中播放一次，然后停止。

要创建一个播放列表，在左边的播放列表栏中点击右键，在出现的上下文菜单中选择 “<ruby>新建<rt>New</rt></ruby>”。你可以创建一个空的播放列表，或者从你硬盘上的特定文件夹中创建一个播放列表。

![Creating a new playlist][9]

### 自动播放列表

你还可以创建一个与特定搜索绑定的特殊播放列表，这对那些你经常购买并添加到你的收藏中的艺术家很有用。有了搜索播放列表，他们的新音乐就会被添加到他们的播放列表中，而无需你的手动干预。

### 打标签

让我们面对现实吧，音乐播放器是一堆一堆的出现，而且它们大多都做同样的事情。然而，Juk 增加了一个重要的功能。它让你有能力修改元数据标签。

![Metadata editor][10]

很多音乐的标签是不一致的、不完整的，或者根本就没有，所以当你发现它们出现在播放队列中时，能够纠正它们是一种奢侈。

它还有一个标签猜测器的功能，它试图解析文件名，并对歌曲进行相应的标记。

### 明显的选择

当你在 KDE 上寻找一个音乐播放器时，Juk 是一个简单而明显的选择。当然，还有很多其他非常好的选择，正如我们的常驻发烧友 [Chris Hermansen][11] 在他的 [3 个开源音乐播放器][12] 文章中详细介绍的那样，但有时你只是想使用你最容易想到的东西。Juk 既能直观地使用，又能出色地完成它的任务。它是多么幸运啊，成为 KDE Plasma 桌面上的默认播放器。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/listen-music-linux-juk-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/c-d-x-pdx_a_82obo-unsplash.jpg?itok=2txWDP31 (Headphones on a yellow backdrop)
[2]: https://opensource.com/article/21/12/kdenlive-linux-creative-app
[3]: https://opensource.com/life/16/5/how-use-digikam-photo-management
[4]: https://opensource.com/article/21/12/krita-digital-paint
[5]: https://juk.kde.org/
[6]: https://opensource.com/sites/default/files/juk-import.jpg (Adding music to Juk)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/juk-player.jpg (Juk music player)
[9]: https://opensource.com/sites/default/files/juk-playlist-new.jpg (Creating a new playlist)
[10]: https://opensource.com/sites/default/files/juk-tagger.png (Metadata editor)
[11]: https://opensource.com/users/clhermansen
[12]: https://opensource.com/article/17/1/open-source-music-players
