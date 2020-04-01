[#]: collector: "lujun9972"
[#]: translator: "messon007"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12035-1.html"
[#]: subject: "10 articles to learn Linux your way"
[#]: via: "https://opensource.com/article/19/12/learn-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"

10 篇关于 Linux 的好文章
=======

> 2019 年对于 Linux 来说是个好年份，让我们一起来回顾一下这十篇关于 Linux 的好文章。

![](https://img.linux.net.cn/data/attachment/album/202003/25/115447rrjfuufccumf0oz6.jpg)

2019 年对于 Linux 来说是个好年份，显然这里的 “Linux” 一词有更多含义: 内核? 桌面? 或是生态? 在此次回顾年度 Linux 好文中，我在选择十大好文时有意采取了更开放的视角。下面就是十大好文（无先后次序之分）。

### 《Linux 权限入门指南》

Bryant Son 的《[Linux 权限入门指南][2]》向新用户介绍了文件权限的概念，通过图形和图表的方式来说明每个要点。通常很难以视觉的方式来解释纯粹基于文本的概念，而本文则对可视方式学习的人非常友好。 Bryant 在讲述时也很专注主题。关于文件权限的任何阐述都可能引出几个相关主题（例如所有权和访问控制列表等），但是本文致力于解释一件事并很好地解释它。

### 《为什么我从 Mac 换到了 Linux》

Matthew Broberg 在《[为什么我从 Mac 换到了 Linux][3]》中清楚而客观的介绍了他从 MacOS 切换到 Linux 的经历。通常切换平台是很困难的，因此记录决定切换的背后考虑非常重要。我认为 Matt 的文章带有几个目的，但对我来说最重要的两个目的是：通过解答他的问题并提供潜在的解决方案，他请 Linux 社区的人们来支持他；这对于其他正在考虑采用 Linux 的人来说是一个很好的参考。

### 《在 Linux 上定位 WiFi 速度慢的问题》

《[在 Linux 上定位 WiFi 速度慢的问题][4]》这篇文章中，David Clinton 对每个人都可能遇到的问题进行了分析，并提供了怎么样一步步解决的思路。这是“偶然的 Linux”技巧的一个很好的例子，但它不仅可以帮助经常遇到问题的人，而且可以向非 Linux 用户展示如何在其他平台上进行问题定位。

### 《一个非技术人员对 GNOME 项目使用 GitLab 的感受》

Molly de Blanc 所写的《[一个非技术人员对 GNOME 项目使用 GitLab 的感受][5]》深层次地揭示了开源界的一个典范（GNOME 桌面）如何使用开源界的另一个典范（Git）进行开发。听到一个开放源代码项目对于任何需要做的事情默认为开放源代码解决方案，这总是让我感到振奋。无论如何，这种情况并不常见，然而对于 GNOME 来说，这是项目本身的重要且受欢迎的部分。

### 《详解 Linux 中的虚拟文件系统》

Alison Chaiken 在《[详解 Linux 中的虚拟文件系统][6]》中巧妙地解释了对许多用户来说都很难理解的东西。理解文件系统是什么、虚拟文件系统和真实的文件系统是一回事，但从定义上讲，*虚拟的*其实并不是真正的文件系统。Linux 以一种普通用户也能从中受益的方式提供了它们，Alison 的文章以一种易于理解的方式对其进行了阐述。另外，Alison 在文章的后半部分更深入地介绍了如何使用 `bcc` 脚本查看她刚刚讲的虚拟文件系统的相关内容。

### 《理解文件路径并学会使用它们》

我认为《[理解文件路径并学会使用它们][7]》很重要，因为这是大多数用户（在任何平台上）似乎都没有学过的概念。这是一个奇怪的现象，因为现在比以往任何时候，人们都越来越多地看到*文件路徑*：几乎所有的互联网网址都包含一个文件路径，该路径告诉你你在域中的确切位置。我常常在想为什么计算机教育不是从互联网开始的，互联网是目前最熟悉的应用程序，并且可以说是使用最频繁的超级计算机，完全可以用它来解释我们每天使用的设备。（我想如果这些设备运行 Linux 会有所帮助，但是我们正在努力。）

### 《Linux 下的进程间通信：共享存储》

Marty Kalin 的《[Linux 下的进程间通信：共享存储][8]》从 Linux 的开发者视角解释了 IPC 以及如何在代码中使用它。虽然我只是列入了这篇文章，不过它实际上是一个三篇文章的系列，而它是同类文章中阐述的最好的。很少有文档能够解释 Linux 怎样处理 IPC，更不用说 IPC 是什么，为什么它很重要，或者在编程时该如何使用它。通常这是你在大学读书时关注的话题。现在，你可以在这里阅读所有内容。

### 《在 Linux 上用 strace 来理解系统调用》

Gaurav Kamathe 的《[在 Linux 上用 strace 来理解系统调用][9]》具有很强的技术性，我希望我所见过的有关 `strace` 的每次会议演讲都是如此。这是对一个复杂但非常有用的命令的清晰演示。令我惊讶的是，我读了本文才发现自己一直使用的命令不是这个命令，而是 `ltrace`（可以用来查看命令调用了哪些函数）。本文包含了丰富的信息，是开发人员和测试人员的快捷参考手册。

### 《Linux 桌面发展旅程》

Jim Hall 的《[Linux 桌面发展旅程][10]》是对 Linux 桌面历史的一次视觉之旅。从 [TWM][11] 开始，经历了 [FVWM][12]、[GNOME][13]、[KDE][14] 等薪火相传。如果你是 Linux 的新手，那么这将是一个出自那个年代的人的有趣的历史课（有截图可以证明这一点）。如果你已经使用 Linux 多年，那么这肯定会唤醒你的记忆。最后，可以肯定的是：仍然可以找到 20 年前屏幕快照的人都是神一样的数据档案管理员。

### 《用 Linux 创建你自己的视频流服务器》

Aaron J. Prisk 的 《[用 Linux 创建你自己的视频流服务器][15]》消除了大多数人对我们视为理所当然的服务的误解。由于 YouTube 和 Twitch 之类服务的存在，许多人认为这是向世界广播视频的唯一方式。当然，人们过去常常以为 Windows 和 Mac 是计算机的唯一入口，值得庆幸的是，最终证明这是严重的误解。在本文中，Aaron 建立了一个视频流服务器，甚至还顺便讨论了一下 [OBS][16]，以便你可以创建视频。这是一个有趣的周末项目还是新职业的开始？你自己决定。

### 《塑造 Linux 历史的 10 个时刻》

Alan Formy-Duval 撰写的《[塑造 Linux 历史的 10 个时刻][17]》试图完成一项艰巨的任务，即从 Linux 的历史中选出 10 件有代表性的事情。当然，这是很难的，因为有如此多重要的时刻，所以我想看看 Alan 是如何通过自己的经历来选择它。例如，什么时候开始意识到 Linux 必然可以发展下去？—— 当 Alan 意识到他维护的所有系统都在运行 Linux 时。用这种方式来解释历史是很美的，因为每个人的重要时刻都会有所不同。 关于 Linux 没有权威性列表，关于 Linux 的文章也没有，关于开源也没有。你可以创建你自己的列表，也可以使你自己成为列表的一部分。

（LCTT 译注：这里推荐了 11 篇，我数了好几遍，没眼花……）

### 你想从何学起?

你还想知道 Linux 的什么内容？请在评论区告诉我们或来文讲述你的 Linux 经验。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/learn-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[messon007](https://github.com/messon007)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_Penguin_Image_520x292_12324207_0714_mm_v1a.png?itok=p7cWyQv9 "Penguins gathered together in the Artic"
[2]: https://linux.cn/article-11056-1.html
[3]: https://linux.cn/article-11586-1.html
[4]: http://opensource.com/article/19/4/troubleshooting-wifi-linux
[5]: https://linux.cn/article-11806-1.html
[6]: https://linux.cn/article-10884-1.html
[7]: https://opensource.com/article/19/8/understanding-file-paths-linux
[8]: https://linux.cn/article-10826-1.html
[9]: https://linux.cn/article-11545-1.html
[10]: https://opensource.com/article/19/8/how-linux-desktop-grown
[11]: https://github.com/freedesktop/twm
[12]: http://www.fvwm.org/
[13]: http://gnome.org
[14]: http://kde.org
[15]: https://opensource.com/article/19/1/basic-live-video-streaming-server
[16]: https://opensource.com/life/15/12/real-time-linux-video-editing-with-obs-studio
[17]: https://opensource.com/article/19/4/top-moments-linux-history
[18]: https://opensource.com/how-submit-article
