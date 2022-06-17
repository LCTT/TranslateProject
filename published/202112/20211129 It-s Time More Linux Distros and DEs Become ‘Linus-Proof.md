[#]: subject: "It’s Time More Linux Distros and DEs Become ‘Linus-Proof’"
[#]: via: "https://news.itsfoss.com/more-linux-distros-become-linus-proof/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972"
[#]: translator: "imgradeone"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14053-1.html"

是时候让更多 Linux 发行版和桌面环境接受“老莱暴捶”了
======

![](https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/linus-pop-os-lessons.png?w=1200&ssl=1)

> “老莱” 体验 Pop!_OS 的视频狠狠地给桌面 Linux 社区上了一课。

过去的几周，整个 Linux 桌面社区沸腾了。

知名 YouTube 创作者 Linus（LCTT 译注：不是 Linux 之父 Torvalds，是 Linus Tech Tips 的 Sebastian，“老莱”是国内网友对 Linus Sebastian 的称呼。）决定在一个月内挑战日常使用 Linux 桌面。“老莱” 想了解 Linux 是否已经达到了对用户友好的程度，乃至于“技术呆”级别的用户都能轻松上手。他的专注点同样也放在了 [Linux 游戏][1] 上，毕竟电脑游戏确实也是 “老莱” 关注的一个领域。

这是一个有趣的概念，Linux 社区的许多人也十分兴奋，毕竟它向更广泛的技术受众群体免费宣传了桌面 Linux 平台。

唯一美中不足的是，这个日用 Linux 挑战 [从一开始就出了大乱子][2]。（LCTT 译注：[B 站][11] 中也有相应的中文字幕视频。）

### “老莱”的 Pop!_OS 名（或者说是“冥”）场面

（LCTT 译注：原文标题使用的是 (in)famous，同时指代“著名”和“臭名昭著”，此处的“冥场面”偏向事件悲剧性。）

“老莱” 决定 [安装 Pop!_OS][3]，因为 Pop!\_OS 经常在社区中作为适合游戏的主流发行版出现。接下来，他尝试在软件中心（即 Pop!\_Shop）安装 Steam，但软件中心未能成功安装 Steam。

![Sebastian 安装 Steam 时遇到了问题][4]

既然没能通过图形化方式安装，他接下来做了其他所有 Linux 用户都会做的事情。他打开了终端，运行了神奇的 `sudo apt-get install` 命令。

![Sebastian 换用命令行方式安装 Steam][5]

无论是图形化方式还是终端方式，Pop!_OS 都显示了一条警告，提示用户正濒临卸载关键软件包的危险。

命令行方式清晰明了地警告：“_**您的操作有潜在的危害性。若要继续，请输入下面的短句“是，按我说的做！（Yes, do as I say!）”**_。” 

![忽略移除关键软件包的警告][6]

对于大部分 Linux 用户来说，到这一步就真的得停下来，深思熟虑了。输出的内容明确显示，接下来即将删除 `gdm3`、`pop-desktop` 和其他许多桌面环境要素。

但人们一般不会在意警告。于是 “老莱” 直接继续安装，最终就剩下了一个不能登录图形界面的损坏系统。

![意识到他的 Pop!_OS 彻底出乱子后的 Linus Sebastian（不是 Torvalds）][7]

### 给桌面 Linux 开发者的深刻教训

对于开发者来说，这里有两点教训值得注意：

  * 安装 Steam 或任何其他常规软件时，不能导致关键的图形界面软件包被删除。
  * 在一款常规的、主流的发行版中，用户不应该能删除关键软件包。

Pop!_OS 迅速修复了 Steam 的问题，并增加了防御机制以阻止删除关键的桌面要素。

> 出于某些原因，i386 版的软件包不能在 Launchpad 上发布。Steam 是一个 i386 软件包，在尝试安装 Steam 时不得不将该软件包降级到 Ubuntu 版本以解决依赖问题，然后就删除了 Pop!_OS 的软件包。
>
> — Jeremy Soller (@jeremy_soller) [2021 年 10 月 26 日][8]

为避免此类事故，Pop!\_OS 为 APT 包管理器制作了补丁。现在，用户无法在 Pop!\_OS 通过输入“**是，按我说的做！（Yes, do as I say!）**”来删除关键软件包了。相反，用户将需要添加一个特殊文件来启用该功能（如果某个人真的想把这些关键软件包删掉的话）。（LCTT 译注：APT 2.3.12 上游已经彻底禁用卸载关键软件包的功能。）

对于 Pop!\_OS 来说，这确实是一个好举措。但，这并不仅仅是 Pop!\_OS 单方面的教训。大多数 Linux 发行版都可能会遇到这种情况，并最终删除掉桌面环境和显示服务器。

KDE 已经注意到了这一点，并在即将发布的 Plasma 5.24 中 [添加了禁止卸载 Plasma 桌面的功能][9]。

![KDE Plasma 不允许用户卸载 Plasma 桌面][10]

许多人责怪 “老莱” 不顾清晰明确的警告，直接继续并走向灾难。但问题在于，许多用户真的不会在意 “警告” 这种东西，不管他们技术水平如何。人们只是觉得按 “Y” 或者其他东西就是程序正常的部分，也不会去多想。一些 Linux 用户之前已经踩过这种坑了，但未来可能还会有更多人重蹈覆辙。

这就是为什么添加故障保护措施才是明智之举。这是所有主流发行版都应该做的事。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/more-linux-distros-become-linus-proof/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[imgradeone](https://github.com/imgradeone)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-gaming-guide/
[2]: https://www.youtube.com/watch?v=0506yDSgU7M&t=788s
[3]: https://itsfoss.com/install-pop-os/
[4]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/pop-os-failed-steam-install.webp?w=1233&ssl=1
[5]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/pop-os-failed-steam-install-1.webp?w=1118&ssl=1
[6]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/pop-os-failed-steam-install-2.webp?w=1087&ssl=1
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/linus-sebastian-nukes-pop-os-while-installing-steam-os.webp?w=1232&ssl=1
[8]: https://twitter.com/jeremy_soller/status/1453008808314351628?ref_src=twsrc%5Etfw
[9]: https://linux.cn/article-14015-1.html
[10]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/cant-remove-plasma-1.png?w=1022&ssl=1
[11]: https://www.bilibili.com/video/BV1Fh411b7q3?t=769
