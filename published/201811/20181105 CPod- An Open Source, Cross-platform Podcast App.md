CPod：一个开源、跨平台播客应用
======

播客是一个很好的娱乐和获取信息的方式。事实上，我会听十几个不同的播客，包括技术、神秘事件、历史和喜剧。当然，[Linux 播客][1]也在此列表中。

今天，我们将看一个简单的跨平台应用来收听你的播客。

![][2]

*推荐的播客和播客搜索*

### 应用程序

[CPod][3] 是 [Zack Guard（z-------------）][4] 的作品。**它是一个 [Election][5] 程序**，这使它能够在大多数操作系统（Linux、Windows、Mac OS）上运行。

> 一个小事：CPod 最初被命名为 Cumulonimbus。

应用的大部分被两个面板占用，来显示内容和选项。屏幕左侧的小条让你可以使用应用的不同功能。CPod 的不同栏目包括主页、队列、订阅、浏览和设置。

![cpod settings][6]

*设置*

### CPod 的功能

以下是 CPod 提供的功能列表：

  * 简洁，干净的设计
  * 可在主流计算机平台上使用
  * 有 Snap 包
  * 搜索 iTunes 的播客目录
  * 可下载也可无需下载就播放节目
  * 查看播客信息和节目
  * 搜索播客的个别节目
  * 深色模式
  * 改变播放速度
  * 键盘快捷键
  * 将你的播客订阅与 gpodder.net 同步
  * 导入和导出订阅
  * 根据长度、日期、下载状态和播放进度对订阅进行排序
  * 在应用启动时自动获取新节目
  * 多语言支持


![search option in cpod application][7]

*搜索 ZFS 节目*

### 在 Linux 上体验 CPod

我最后在两个系统上安装了 CPod：ArchLabs 和 Windows。[Arch 用户仓库​][8] 中有两个版本的 CPod。但是，它们都已过时，一个是版本 1.14.0，另一个是 1.22.6。最新版本的 CPod 是 1.27.0。由于 ArchLabs 和 Windows 之间的版本差异，我的体验有所不同。在本文中，我将重点关注 1.27.0，因为它是最新且功能最多的。

我马上能够找到我最喜欢的播客。我可以粘贴 RSS 源的 URL 来添加 iTunes 列表中没有的那些播客。

找到播客的特定节目也很容易。例如，我最近在寻找 [Late Night Linux][9] 中的一集，这集中他们在谈论 [ZFS][10]。我点击播客，在搜索框中输入 “ZFS” 然后找到了它。

我很快发现播放一堆播客节目的最简单方法是将它们添加到队列中。一旦它们进入队列，你可以流式传输或下载它们。你也可以通过拖放重新排序它们。每集在播放时，它会显示可视化的声波以及节目摘要。

### 安装 CPod

在 [GitHub][11] 上，你可以下载适用于 Linux 的 AppImage 或 Deb 文件，适用于 Windows 的 .exe 文件或适用于 Mac OS 的 .dmg 文件。

你可以使用 [Snap][12] 安装 CPod。你需要做的就是使用以下命令：

```
sudo snap install cpod
```

就像我之前说的那样，CPod 的 [Arch 用户仓库][8]的版本已经过时了。我已经给其中一个打包者发了消息。如果你使用 Arch（或基于 Arch 的发行版），我建议你这样做。

![cpod for Linux pidcasts][13]

*播放其中一个我最喜欢的播客*

### 最后的想法

总的来说，我喜欢 CPod。它外观漂亮，使用简单。事实上，我更喜欢原来的名字（Cumulonimbus），但是它有点拗口。

我刚刚在程序中遇到两个问题。首先，我希望每个播客都有评分。其次，在打开黑暗模式后，根据长度、日期、下载状态和播放进度对剧集进行排序的菜单不起作用。

你有没有用过 CPod？如果没有，你最喜欢的播客应用是什么？你最喜欢的播客有哪些？请在下面的评论中告诉我们。

如果你发现这篇文章很有意思，请花一点时间在社交媒体、Hacker News 或 [Reddit][14] 上分享它。

--------------------------------------------------------------------------------

via: https://itsfoss.com/cpod-podcast-app/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-podcasts/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/10/cpod1.1.jpg?w=800&ssl=1
[3]: https://github.com/z-------------/CPod
[4]: https://github.com/z-------------
[5]: https://electronjs.org/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/10/cpod2.1.png?w=800&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/10/cpod4.1.jpg?w=800&ssl=1
[8]: https://aur.archlinux.org/packages/?O=0&K=cpod
[9]: https://latenightlinux.com/
[10]: https://itsfoss.com/what-is-zfs/
[11]: https://github.com/z-------------/CPod/releases
[12]: https://snapcraft.io/cumulonimbus
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/10/cpod3.1.jpg?w=800&ssl=1
[14]: http://reddit.com/r/linuxusersgroup
