Debian Live项目的剧变
==================================================================================

尽管围绕 Debian Live 项目发生了很多戏剧性事件，关于 [Debian Live 项目][1]结束的[公告][2]的影响力甚至小于该项目首次出现时的公告。主要开发者的离开是最显而易见的损失，而社区对他本人及其项目的态度是很令人困惑的，但是这个项目也许还是会以其他的形式继续下去。所以 Debian 仍然会有更多的工具去创造启动光盘和其他介质。尽管是用这样一种有遗憾的方式，项目创始人 Dabiel Baumann 和 Debian CD 团队以及安装检测团队之间出现的长期争论已经被「解决」了。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
在 11 月 9 日， Baumann 发表了题为「 Debian Live 项目的突然结束」的一篇公告。在那篇短文中，他一一列举出了自从这个和他有关的[项目被发起][3]以来近 10 年间发生的不同的事件，这些事件可以表明他在 Debian Live 项目上的努力一直没有被重视或没有被足够重视。最具决定性的因素是因为在「包的含义」上存在冲突， R.Learmonth [申请][4]了新的包名，而这侵犯了在 Debian Live 上使用的命名空间。

考虑到最主要的 Debian Live 包之一被命名为 live-build ，而 R.Learmonth 申请的新包名却是 live-build-ng ，这简直是对 live-build 的挑战。 live-build-ng 意为一种围绕 [vmdebootstrap][5]【译者注：创造真实的和虚拟机Debian的磁盘映像】工具的外部包装，这种包装是为了创造 live 介质（光盘和USB的插入），也是 Debian Live 最需要的的部分。但是当 Baumann Learmonth [要求][6]为他的包换一个不同的名字的时候，他得到了一个「有趣」的[回复][7]：

```
应该注意到， live-build 不是一个 Debian 项目，它是一个声称自己是官方 Debian 项目的外部项目，这是一个需要我们解决的问题。
这不是命名空间的问题，我们要将以目前维护的 live-config 和 live-boot 包为基础，把它们加入到 Debian 的本地项目。如果迫不得已的话，这将会有很多分支，但是我希望它不要发生，这样的话我们就可以把这些包整合到 Debian 中并继续以一种协作的方式去开发。
live-build 已经被 debian-cd 放弃，live-build-ng 将会取代它。至少在一个精简的 Debian 环境中，live-build 会被放弃。我们（开发团队）正在与 debian-cd 和 Debian Installer 团队合作开发 live-build-ng 。
```

Debian Live 是一个「官方的」 Debian 项目（也可以是狭义的「官方」），尽管它因为思路上的不同产生过争论。除此之外， vmdebootstrap 的维护者 Neil Willians 为脱离 Debian Live 项目[提供了如下的解释][8]:

```
为了更好的支持 live-build 的代替者, vmdebootstrap 肯定会被推广。为了能够用 live-build 解决目前存在的问题，这项工作会由 debian-cd 团队来负责。这些问题包括可靠性问题，以及不能很好的支持多种机器和 UEFI 等。 vmdebootstrap 也存在着这些问题，我们用来自于对 live-boot 和 live-config 的支持情况来确定 vmdebootstrap 的功能。
```

这些抱怨听起来合情合理，但是它们可能已经在目前的项目中得到了解决。然而一些秘密的项目有很明显的取代 live-build 的意图。正如 Baumann [指出][9]的，这些计划没有被发布到 debian-live 的邮件列表中。人们首次从 Debian Live 项目中获知这些计划正是因为这一次的ITP事件，所以它看起来像是一个「秘密计划」——有些事情在像 Debian 这样的项目中得不到很好的安排。

人们可能已经猜到了，有很多帖子都支持 Baumann [重命名][10] live-build-ng 的请求，但是紧接着，人们就因为他要停止继续在 Debian Live 上工作的决定而变得沮丧。然而 Learmonth 和 Williams 却坚持认为取代 live-build 很有必要。Learmonth 给 live-build-ng 换了一个争议性也许小一些的名字： live-wrapper 。他说他的目标是为 Debian Live 项目加入新的工具（并且「把 Debian Live 项目引入 Debian 里面」），但是完成这件事还需要很大的努力。

```
我向已经被 ITP 问题所困扰的每个人道歉。我们已经告知大家 live-wrapper 还不足以完全替代 live-build 且开发工作仍在进行以收集反馈。尽管有了这部分的工作，我们收到的反馈缺并不是我们所需要的。
```

这种对于取代 live-build 的强烈反对或许已经被预知到了。自由软件社区的沟通和交流很关键，所以，计划去替换一个项目的核心很容易引起争议——更何况是一个一直不为人所知的计划。从 Banumann 的角度来说，他当然不是完美的，他因为上传个不合适的 [syslinux 包][11]导致了 wheezy 的延迟发布，并且从那以后他被从 Debian 开发者暂时[降级][12]为 Debian 维护者。但是这不意味着他应该受到这种对待。当然，这个项目还有其他人参与，所以不仅仅是 Baumann 受到了影响。

Ben Armstrong 是其他参与者中的一位，在这个事件中，他很圆滑地处理了一些事，并且想从这个事件中全身而退。他从一封邮件[13]开始，这个邮件是为了庆祝这个项目，以及他和他的团队在过去几年取得的成果。正如他所说， Debian Live 的[下游项目列表][14]是很令人振奋的。在另一封邮件中，他也[指出][15]了这个项目不是没有生命力的：

```
如果 Debian CD 开发团队通过他们的努力开发出可行的、可靠的、经过完善测试替代品，以及一个合适的取代 live-build 的候选者，这对于 Debian 项目有利无害。如果他们继续做这件事，他们不会「用一个官方改良，但不可靠且几乎没有经过测试的待选者取代 live-build 」。到目前为止，我还没有看到他们那样做的迹象。其间， live-build 仍保留在存档中——它仍然处于良好状态，且没有一种经过改良的继任者来取代它，因此开发团队没有必要尽快删除它。
```

11 月 24 号， Armstrong 也在[他的博客][16]上[发布][17]了一个有关 Debian Live 的新消息。它展示了从 Baumann 退出起两周内的令人高兴的进展。甚至有迹象表明 Debian Live 项目与 live-wrapper 开发者开展了合作。博客上也有了一个[计划表][18]，同时不可避免地寻求更多的帮助。这让人们有理由相信围绕项目发生的戏剧性事件仅仅是一个小摩擦——也许不可避免，但绝不是像现在看起来这么糟糕。

---------------------------------

via: https://lwn.net/Articles/665839/

作者：Jake Edge
译者：[vim-kakali](https://github.com/vim-kakali)
校对：[PurlingNayuki](https://github.com/PurlingNayuki)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出


[1]: https://lwn.net/Articles/666127/
[2]: http://live.debian.net/
[3]: https://www.debian.org/News/weekly/2006/08/
[4]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=804315
[5]: http://liw.fi/vmdebootstrap/
[6]: https://lwn.net/Articles/666173/
[7]: https://lwn.net/Articles/666176/
[8]: https://lwn.net/Articles/666181/
[9]: https://lwn.net/Articles/666208/
[10]: https://lwn.net/Articles/666321/
[11]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=699808
[12]: https://nm.debian.org/public/process/14450
[13]: https://lwn.net/Articles/666336/
[14]: http://live.debian.net/project/downstream/
[15]: https://lwn.net/Articles/666338/
[16]: https://lwn.net/Articles/666340/
[17]: http://syn.theti.ca/2015/11/24/debian-live-after-debian-live/
[18]: https://wiki.debian.org/DebianLive/TODO
