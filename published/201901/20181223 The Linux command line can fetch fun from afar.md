[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10437-1.html)
[#]: subject: (The Linux command line can fetch fun from afar)
[#]: via: (https://opensource.com/article/18/12/linux-toy-remote)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

能从远程获得乐趣的 Linux 命令
======

> 使用这些工具从远程了解天气、阅读资料等。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-remote.png?itok=mHm9POPi)

我们即将结束为期 24 天的 Linux 命令行玩具日历。希望你有一直在看，如果没有，请回到[开始][1]，从头看过来。你会发现 Linux 终端有很多游戏、消遣和奇怪之处。

虽然你之前可能已经看过我们日历中的一些玩具，但我们希望每个人都遇见一个新事物。

今天的玩具（实际是玩具集合）有点不同。到目前为止，我主要是想把重点放在那些独立的玩具上，并且完全可在开源许可下使用。但是我从读者那里得到了一些很好的建议，利用开源工具远程访问一些开源或者不开源的东西。今天，我将介绍其中的一些。

第一个是经典之作：使用 Telnet 观看星球大战的 ASCII 演绎版本。你的系统可能已经安装了 Telnet，因此你只需运行：

```
$ telnet towel.blinkenlights.nl
```

我第一次看到它是十年之前，因此我对于它还存在有点惊奇。如果你还没看过，请留出一点时间看一下。你不会后悔的。

![](https://opensource.com/sites/default/files/uploads/linux-toy-star-wars.png)

接下来，Opensource.com 的撰稿人 [Manuel Dewald][2] 提出了一种从终端获取当地天气的方法。它很简单，你只需安装 `curl`（或者，`wget`）。

```
$ curl wttr.in
```

![](https://opensource.com/sites/default/files/uploads/linux-toy-weather.png)

最后，在假期中虽然你可以从[命令行 Web 浏览器][3]浏览你喜欢的网站（包括 Opensource.com），但有一些我最喜欢的网站可以通过专用客户端更轻松地浏览。其中两个是 Reddit 和 Hacker News，有人推荐给我一些它们的客户端，你可能也想尝试，它们都使用开源许可。我尝试过 [haxor-news][4] （Hacker News） 和 [rtv][5] （Reddit），它们都还不错。

你有特别喜欢的命令行小玩具需要我介绍的吗？提交今年的建议有点晚了，但我们仍然希望在新的一年里有一些很酷的命令行玩具。请在下面的评论中告诉我，我会查看的。让我知道你对今天的玩具有何看法。

一定要看看昨天的玩具，[在 Linux 终端收看 Youtube 视频][2]，明天还要再来！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-remote

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/12/linux-toy-boxes
[2]: https://opensource.com/users/ntlx
[3]: https://opensource.com/article/16/12/web-browsers-linux-command-line
[4]: https://github.com/donnemartin/haxor-news
[5]: https://github.com/michael-lazar/rtv
[6]: https://opensource.com/article/18/12/linux-toy-youtube-dl
