一个简单而美观的跨平台播客应用程序
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/cpod-720x340.png)

播客在过去几年中变得非常流行。 播客就是所谓的“<ruby>信息娱乐<rt> infotainment</rt></ruby>”，它们通常是轻松的，但也会为你提供有价值的信息。 播客在过去几年中已经非常火爆了，如果你喜欢某些东西，就很可能有个相关的播客。 Linux 桌面版上有很多播客播放器，但是如果你想要一些视觉上美观、有顺滑的动画并且可以在每个平台上运行的东西，那就并没有很多替代品可以替代 CPod 了。 CPod（以前称为 Cumulonimbus）是一个开源而成熟的播客应用程序，适用于 Linux、MacOS 和 Windows。

CPod 运行在一个名为 Electron 的东西上 —— 这个工具允许开发人员构建跨平台（例如 Windows、MacOS 和 Linux）的桌面图形化应用程序。 在本简要指南中，我们将讨论如何在 Linux 中安装和使用 CPod 播客应用程序。

### 安装 CPod

转到 CPod 的[发布页面][1]。 下载并安装所选平台的二进制文件。 如果你使用 Ubuntu / Debian，你只需从发布页面下载并安装 .deb 文件，如下所示。

```
$ wget https://github.com/z-------------/CPod/releases/download/v1.25.7/CPod_1.25.7_amd64.deb
$ sudo apt update
$ sudo apt install gdebi
$ sudo gdebi CPod_1.25.7_amd64.deb
```

如果你使用其他发行版，你可能需要使用发布页面中的 AppImage。

从发布页面下载 AppImage 文件。

打开终端，然后转到存储 AppImage 文件的目录。 更改权限以允许执行：

```
$ chmod +x CPod-1.25.7-x86_64.AppImage
```

执行 AppImage 文件：

```
$ ./CPod-1.25.7-x86_64.AppImage
```

你将看到一个对话框询问是否将应用程序与系统集成。 如果要执行此操作，请单击“yes”。

### 特征

#### 探索标签页

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPod-features-tab.png)

CPod 使用 Apple iTunes 数据库查找播客。 这很好，因为 iTunes 数据库是最大的这类数据库。 如果某个播客存在，那么很可能就在 iTunes 上。 要查找播客，只需使用探索部分中的顶部搜索栏即可。 探索部分还展示了一些受欢迎的播客。

#### 主标签页

![](http://www.ostechnix.com/wp-content/uploads/2018/09/CPod-home-tab.png)

主标签页在打开应用程序时是默认打开的。 主标签页显示你已订阅的所有播客的所有剧集的时间顺序列表。

在主页选项卡中，你可以：

1. 标记剧集阅读。
2. 下载它们进行离线播放
3. 将它们添加到播放队列中。

![](https://www.ostechnix.com/wp-content/uploads/2018/09/The-podcasts-queue.png)

#### 订阅标签页

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPod-subscriptions-tab.png)

你当然可以订阅你喜欢的播客。 你可以在订阅标签页中执行的其他一些操作是：

1. 刷新播客艺术作品
2. 导出订阅到 .OPML 文件中，从 .OPML 文件中导入订阅。

#### 播放器

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPod-Podcast-Player.png)

播放器可能是 CPod 最美观的部分。 该应用程序根据播客的横幅更改整体外观。 底部有一个声音可视化器。 在右侧，你可以查看和搜索此播客的其他剧集。

#### 缺点/缺失功能

虽然我喜欢这个应用程序，但 CPod 确实有一些特性和缺点：

1. 糟糕的 MPRIS 集成 —— 你可以从桌面环境的媒体播放器对话框中播放或者暂停播客，但这是不够的。 播客的名称未显示，你可以转到下一个或者上一个剧集。
2. 不支持章节。
3. 没有自动下载 —— 你必须手动下载剧集。
4. 使用过程中的 CPU 使用率非常高（即使对于 Electron 应用程序而言）。

### 总结

虽然它确实有它的缺点，但 CPod 显然是最美观的播客播放器应用程序，并且它具有最基本的功能。 如果你喜欢使用视觉上美观的应用程序，并且不需要高级功能，那么这就是你的完美应用。我知道我肯定会使用它。

你喜欢 CPod 吗？ 请将你的意见发表在下面的评论中。

**资源**

- [CPod GitHub 仓库](https://github.com/z-------------/CPod)

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/cpod-a-simple-beautiful-and-cross-platform-podcast-app/

作者：[EDITOR][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[1]: https://github.com/z-------------/CPod/releases
