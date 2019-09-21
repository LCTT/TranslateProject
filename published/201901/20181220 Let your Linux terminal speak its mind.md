[#]: collector: (lujun9972)
[#]: translator: (zhs852)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10416-1.html)
[#]: subject: (Let your Linux terminal speak its mind)
[#]: via: (https://opensource.com/article/18/12/linux-toy-espeak)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

让 Linux 终端说出它的想法
======

> eSpeak 是一个可在 Linux 命令行中使用的开源的 TTS 合成器。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-cava.png?itok=4EWYL8uZ)

欢迎回到《24 天介绍 Linux 命令行小玩具》。如果这是你首次阅读本系列文章，你可能不知道什么是 Linux 命令行小玩具。无需担心，你只需要边看边体会。通常来说，它有可能是游戏或其它能让你在终端中娱乐的小程序。

或许你已经对一些玩具有了解了，不过我们相信，在本系列文章中总有那么几个你没见过的玩意。

年轻读者可能不知道，在 Alexa、Siri 或 Google Assistant 问世之前，计算机就能说话了。

我们也许永远不会忘记来自 [2001 太空漫游][1] 中与机组人员交流的 HAL 9000。但是在 1960 年代到今天的时间里，是存在着许多能说话的计算机的。它们有些很出色，也有些不那么出色。

其中一个我最爱的是一个叫做 [eSpeak][2] 的开源项目。它以多种形式发布，比如可以嵌入你自己项目中的库。与此同时，它也提供了可供你安装的命令行版本。在我所用的发行版中，安装十分简单，只需使用：

```
$ sudo dnf install espeak
```

你既可以与 eSpeak 交互，也可以用它来输出其它程序的信息，甚至通过简单的 `echo` 命令来使用它。[这里][3] 有一些可供 eSpeak 使用的声音文件，你可以在无聊时切换他们。甚者你可以制作一个属于你自己的声音。

在 2015 年，一些希望继续 eSpeak 开发的开发者创建了一个名为 eSpeak NG （即 “Next Generation”，“下一代”的意思）的项目。eSpeak 目前在 GPL v3 许可证下开源，你可以在 [SourceForge][2] 上详细了解这个项目或下载源代码。

别急，我今天还会介绍一个额外的小程序，它叫 [cava][4]。我经常希望用一张独一无二的截图作为我文章的头图，更何况今天的玩具主要是关于声音的，这就图片更少了。因此，我需要一些东西来填补这些空白。Cava 是<ruby>基于 ALSA 的命令行音频可视化工具<rt>console-based audio visualizer for ALSA</rt></ruby>的简写（尽管它现在支持的比 ALSA 更多），它是一个优秀的命令行音频可视化工具，并且它正以 MIT 许可证开源。下面是一个将 eSpeak 输出可视化的命令：

```
$ echo "Rudolph, the red-nosed reindeer, had a very shiny nose." | espeak
```

![](https://opensource.com/sites/default/files/uploads/linux-toy-cava.gif)

你想让作者介绍你喜欢的命令行玩具吗？请前往原文下留言，作者可能会考虑介绍的。同时，你也可以去原文下评论你对文章的看法。

欢迎去看看我们昨天介绍的玩具，[在 Linux 命令行中使用 nudoku 解决谜题][5]。敬请期待我们明天的文章吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-espeak

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[zhs852](https://github.com/zhs852)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/2001:_A_Space_Odyssey_(film)
[2]: http://espeak.sourceforge.net/
[3]: http://espeak.sourceforge.net/voices.html
[4]: https://github.com/karlstav/cava
[5]: https://opensource.com/article/18/12/linux-toy-nudoku
