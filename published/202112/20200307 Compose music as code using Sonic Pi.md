[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14077-1.html)
[#]: subject: (Compose music as code using Sonic Pi)
[#]: via: (https://opensource.com/article/20/3/sonic-pi)
[#]: author: (Matt Bargenquast https://opensource.com/users/mbargenquast)

使用 Sonic Pi 像写代码一样编曲
======

> 有了这个易于使用的开源程序，不需要掌握乐器，就可以把你变成一个音乐大师。

![](https://img.linux.net.cn/data/attachment/album/202112/13/095540zigm4pzopgrdevvz.jpg)

也许你和我一样，在上学的时候学过一种乐器。对我来说，那是钢琴，后来是中提琴。然而，我一直认为，随着我童年的兴趣转向计算机和编码，我后来忽略了音乐练习。我确实想知道，如果我年轻时有 Sonic Pi 这样的东西，我会怎么样。Sonic Pi 是一个开源程序，可以让你通过代码来创作和演奏音乐。它是这两个世界的完美结合。

我们对 Sonic Pi 并不陌生，早在 2015 年就对其创造者 Sam Aaron 博士 [进行了采访][2]。从那时起，Sonic Pi 在很多方面都有了很大的发展。它达到了一个重要的新版本里程碑，期待已久的 v3.2 版本已于 2020 年 2 月 28 日公开发布。一个不断壮大的开发者社区正积极为其 [GitHub 项目][3] 做出贡献，而在 [官方论坛][4] 中有一个同样繁荣的作曲家社区可以分享想法和提供支持。该项目现在还通过 [赞助活动][5] 获得了资金支持，而 Sam 本人也在世界各地的学校、会议和研讨会中传播 Sonic Pi 的信息。

Sonic Pi 真正的闪光点在于它的平易近人。它的版本适用于许多主要的操作系统，包括 Windows、macOS、Linux，当然也包括树莓派本身。事实上，在树莓派上学习使用 Sonic Pi 再简单不过了。它预装在 [Raspbian][6] 中，所以如果你有一个基于 Raspbian 的现有环境，你会发现它位于编程菜单中。

第一次加载 Sonic Pi 时，你会看到一个简单的界面，有两个主要的区域：一个编辑器，可以写你的代码，还有一个区域专用于 Sonic Pi 丰富的教程。对于新手来说，教程是学习基础知识的重要资源，它有配套的音乐程序来巩固所学的每个概念。

如果你跟着学习，让我们为自己编写一段简单的音乐，探索现场编码音乐的潜力。将以下代码输入或粘贴到 Sonic Pi 编辑器中：

```
live_loop :beat do
  sample :drum_heavy_kick
  sleep 1
end
```

即使你是一个 Sonic Pi 的新手，许多程序员可能马上就会明白这里发生了什么。我们正在播放一个<ruby>踏板鼓<rt>drum kick</rt></ruby>采样，停止一秒钟，然后重复。点击运行按钮或按 `ALT+R`（macOS 上为 `meta+R`），你应该听到它开始播放。

这不是一首非常激动人心的歌曲，所以让我们用一个在不合拍的<ruby>小鼓<rt>snare</rt></ruby>来使它生动起来。用下面的代码块替换现有的代码，然后再次运行。你可以在做这个的时候让现有的节拍继续播放；你会注意到你的改动会自然地应用，与节拍同步：

```
live_loop :beat do
  sample :drum_heavy_kick
  sleep 0.5
  sample :drum_snare_soft
  sleep 0.5
end
```

我们在做这个的时候，让我们在每四拍之前添加一个<ruby>踩镲<rt>hi-hat</rt></ruby>，让声音变得有趣一些。在现有的程序块下面添加新的程序块，然后再次运行：

```
live_loop :hihat do
  sleep 3.9
  sample :drum_cymbal_closed
  sleep 0.1
end
```

我们现在已经有了我们的节拍，所以让我们来添加一个<ruby>低音声线<rt>bassline</rt></ruby>！Sonic Pi 内置了各种合成器，还有混响和失真等效果滤波器。我们将使用 “dsaw” 和 “tech_saw” 合成器的组合，使其具有电子复古合成器的感觉。将下面的块添加到你现有的程序中，运行，并听一听：

```
live_loop :bass do
  use_synth :dsaw
  play :a2, attack: 1, release: 2, amp: 0.3
  sleep 2.5
  use_synth :tech_saws
  play :a1, attack: 1, release: 1.5, amp: 0.8
  sleep 1.5
end
```

你会注意到上面的内容，当播放音符时，我们可以完全控制 [ADSR][7] <ruby>包络<rt>envelope</rt></ruby>，所以我们可以决定每个声音何时达到峰值和衰减。

最后，让我们添加一个<ruby>主音合成器<rt>lead synth</rt></ruby>，试试那些被称为“<ruby>切片器<rt>slicer</rt></ruby>”的效果特征。为了使事情更有趣，我们还将引入一个伪随机的元素，让 Sonic Pi 从一系列潜在的<ruby>和弦<rt>chord</rt></ruby>中挑选。这就是一些有趣的即兴创作和“快乐的意外”可以开始发生的地方。在你现有的程序中加入下面的程序块并运行：

```
live_loop :lead do
  with_fx :slicer do
    chords = [(chord :A4, :minor7), (chord :A4, :minor), (chord :D4, :minor7), (chord :F4, :major7)]
    use_synth :blade
    play chords.choose, attack: 1, release: 2, amp: 1
    sleep 2
  end
end
```

很好！现在，我们当然不会很快与 Daft Punk 竞争，但希望通过这个过程，你已经看到我们如何通过添加一些简单的代码，实时地从一个单一节拍变成更大的东西。YouTube 上 Sam Aaron 的 [现场编码表演][8] 非常值得一看，它展示了 Sonic Pi 可以让你有多大的创造力和适应力。

![Sonic Pi composition example][9]

*我们完成的作品，完整版*

如果你曾经想学习一种乐器，但又觉得被“我没有节奏感”或“我的手不够灵活”这样的想法所束缚，Sonic Pi 是一种多功能的乐器，这些都不重要。你所需要的只是想法和灵感，以及一台便宜的电脑，如简陋的树莓派。其余的都在你的指尖上（实际意义上的）。

这里有几个方便的链接可以让你开始：

  * 官方 Sonic Pi [网站][10] 和 [教程][11]
  * [Sonic Pi 入门][12]
  * Sonic Pi 的 [GitHub 项目][3] 

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/sonic-pi

作者：[Matt Bargenquast][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbargenquast
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/music-birds-recording-520.png?itok=UoM7brl0 (Bird singing and music notes)
[2]: https://opensource.com/life/15/10/interview-sam-aaron-sonic-pi
[3]: https://github.com/samaaron/sonic-pi/
[4]: https://in-thread.sonic-pi.net/
[5]: https://www.patreon.com/samaaron
[6]: https://www.raspberrypi.org/downloads/raspbian/
[7]: https://en.wikipedia.org/wiki/Envelope_(music)
[8]: https://www.youtube.com/watch?v=JEHpS1aTKp0
[9]: https://opensource.com/sites/default/files/uploads/sonicpi.png (Sonic Pi composition example)
[10]: https://sonic-pi.net/
[11]: https://sonic-pi.net/tutorial.html
[12]: https://projects.raspberrypi.org/en/projects/getting-started-with-sonic-pi
[13]: http://projects.raspberrypi.org
