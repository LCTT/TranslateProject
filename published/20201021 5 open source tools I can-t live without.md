[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12804-1.html)
[#]: subject: (5 open source tools I can't live without)
[#]: via: (https://opensource.com/article/20/10/open-source-tools)
[#]: author: (Victoria Martinez de la Cruz https://opensource.com/users/vkmc)

5 个我不可或缺的开源工具
======

> 通过将这些工具放在自己的技能包中，提高你在终端内、外的工作效率。

![](https://img.linux.net.cn/data/attachment/album/202011/08/185810ffjljj7o830fboz3.jpg)

前段时间，我参与了一个在科技人士中广为流传的 Twitter 话题。“挑战？只挑选五个你不能没有的工具。”我开始结合我的日常生活来思考这个问题，只挑出五个工具并不容易。我使用了许多我认为必不可少的工具，比如用来与同事和朋友联系的 [IRC][2] 客户端（是的，我仍然使用 IRC），一个用来做各种事情的出色的文本编辑器，一个用来保持有条不紊的日历应用，以及当需要更直接的互动时的一个视频会议平台。

所以，让我给这个挑战来个变化：选出五个能提高你工作效率的开源工具。这是我的清单。请在评论中分享你的清单。

### tmate

![tmate screenshot][3]

哦，我喜欢这个工具。`tmate` 是著名的 [tmux][5] 终端多路复用器的一个复刻，它允许你启动一个 `tmux` 会话并通过 SSH 共享。你可以用它来进行[结对编程][6]（这是我的主要使用场景），也可以用来进行远程控制。

如果你经常与你的团队成员合作，并且你想要一个简单的、与发行版无关的、开源的方式与他们一起编程（而且共享终端访问对你来说已经足够了），这绝对是你必须加到列表中的东西。

在 [tmate 的网站][7]上获取更多信息，或者在 [GitHub][8] 上查看代码。

### ix

`ix` 是一个命令行粘贴板。你不需要安装任何东西。你可以通过 `curl` 到 [ix.io][9] 站点来创建新的粘贴。例如，`echo Hello world. | curl -F 'f:1=<-' ix.io` 会给你一个到 ix.io 的链接，那里粘贴了消息 “Hello world” 的信息。当你想分享日志用于调试或在没有桌面环境的服务器上保存配置文件时，这非常方便。

有一个缺点是源码还没有公布，尽管它的目的是自由开源。如果你是作者，并且正在阅读这篇文章，请发布代码，这样我们就可以为打磨它的过程做出贡献。

### asciinema

是的，这是另一个终端工具，`asciinema` 可以让你记录你的终端。使用它的方法有很多，但我一般用它来制作演示。它非常容易使用，而且有很多 Linux 发行版和其他平台的软件包。

要想知道它是如何工作的，可以看看这个[酷炫的演示][10]。是不是很棒？

在 [asciinema 的网站][11]上获取更多信息，在 [GitHub][12] 上访问其源代码。

### GNOME Pomodoro

![pomodoro timer gnome][13]

好了，关于终端工具的介绍就到此为止。现在我想和大家分享一下这个简单的宝物，它让你的工作变得有条不紊。你听说过 [番茄工作法][14] 吗？Pomodoro 基本上是一个时间管理工具。它使用一个番茄形状的计时器，帮助你将时间分成工作时间和休息时间（默认情况下，25 分钟的工作后有 5 分钟的休息时间）。而且，每隔 4 个“番茄”之后，你就会有更长的休息时间（默认为 15 分钟）。这样做的目的是让你在工作时间内保持专注，而在休息时间内进行伸展和放松。

这听起来非常非常简单，你可能会对让一个番茄形状的时钟来控制你的生活感到犹豫，但它确实帮助我变得跟有条理，并且在试图同时专注于许多事情时避免感到疲惫。

无论你是什么角色，我都强烈推荐这种做法。而在众多实现它的不同工具中，我推荐 GNOME Pomodoro 应用。它适用于主要的 GNU/Linux 发行版，所以它需要你使用 GNOME 桌面环境（这可能是它的缺点）。

在 [GNOME Pomodoro 的网站][15]上查看更多信息，并访问其 [GitHub][16] 仓库来获取源码并了解如何做出贡献。

### Jitsi

最后但同样重要的是 Jitsi。当你在一个远程、遍布全球的团队中工作时，你需要一种与人们联系的方式。即时通讯是好的，但有时最好还是开个快速会议，面对面地讨论事情（嗯，看到对方的脸）。有很多[视频会议工具][17]可用，但我很喜欢 Jitsi。不仅因为它是免费和开源的，还因为它提供了一个简洁、实用的界面。你可以设置自己的 Jitsi 服务器（用于商业目的），但你也可以通过访问 [Jitsi Meet][18] 网站来试用一个公共的 Jitsi 实例。

设置这种会议的一个好做法是：只有在你心中有明确的议程时才使用它。而且要时刻问自己，这个会议能不能用电子邮件代替？遵循这些准则，谨慎使用 Jitsi，你的工作日将会非常高效!

在 [Jitsi 网站][19]上了解更多信息，并通过访问其 [GitHub][20] 仓库开始贡献。

* * *

我希望我的清单能帮助你在生产力上达到一个新的水平。你的 5 个不能离开的开源生产力工具是什么？在评论中告诉我。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/open-source-tools

作者：[Victoria Martinez de la Cruz][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/vkmc
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://en.wikipedia.org/wiki/Internet_Relay_Chat
[3]: https://opensource.com/sites/default/files/pictures/tmate-opensource.jpg (tmate screenshot)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/article/20/7/tmux-cheat-sheet
[6]: https://en.wikipedia.org/wiki/Pair_programming
[7]: https://tmate.io/
[8]: https://github.com/tmate-io/tmate
[9]: http://ix.io/
[10]: https://asciinema.org/a/239367
[11]: https://asciinema.org/
[12]: https://github.com/asciinema/asciinema
[13]: https://opensource.com/sites/default/files/pictures/pomodoro_timer_gnome.jpg (pomodoro timer gnome)
[14]: https://en.wikipedia.org/wiki/Pomodoro_Technique
[15]: https://gnomepomodoro.org/
[16]: https://github.com/codito/gnome-pomodoro
[17]: https://opensource.com/article/20/5/open-source-video-conferencing
[18]: https://meet.jit.si/
[19]: https://jitsi.org/
[20]: https://github.com/jitsi
