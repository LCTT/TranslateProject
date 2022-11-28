[#]: subject: (Listen to music on FreeDOS)
[#]: via: (https://opensource.com/article/21/6/listen-music-freedos)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14603-1.html)

在 FreeDOS 中聆听音乐
======

> Mplayer 是 Linux、Windows、Mac 和 DOS 等操作系统上常见的一款开源媒体播放器。

![](https://img.linux.net.cn/data/attachment/album/202205/17/092828vffyeliiz33hqf31.jpg)

听音乐是放松心情的好方法。在 Linux 上，我使用 Rhythmbox 听音乐。但是你可能不知道在 FreeDOS 上也可以听音乐。让我们看一下两款流行的音乐播放器吧：

### 用 Mplayer 听音乐

[Mplayer][2] 是一款开源的媒体播放器，通常安装于 Linux、Windows 和 Mac 上，但也有 DOS 版本可用。这里我们讨论的就是在 FreeDOS 版本。虽然其 DOS 移植版基于旧版（2007 年的 1.0rc2-3-3-2 版），但它完全适用于在 DOS 上播放媒体。

我使用 MPlayer 在 FreeDOS 上听音乐文件。在这个例子中，我复制了我最喜欢的有声读物之一，[Big Finish Productions][3] 的<ruby>神秘博士：闪点行动<rt>Doctor Who: Flashpoint</rt></ruby>，并在我的 FreeDOS 计算机上将其保存为 `C:\MUSIC\FLASHPNT.MP3`。为了在 FreeDOS 上收听闪点行动，我从 FreeDOS 命令行启动 MPlayer 并指定要播放的 MP3 文件名。MPlayer 的基本用法是 `mplayer [options] filename`，如果默认设置可用，你应该可以直接使用该文件名启动 MPlayer。在本例中，我运行以下命令将工作目录切换为 `\MUSIC`，然后使用 MPlayer 播放我的 MP3 有声读物文件：

```
CD \MUSIC
MPLAYER FLASHPNT.MP3
```

FreeDOS _不区分大小写_，因此它将忽略 DOS 命令和任何文件或目录的大小写字母的区别。你键入 `cd \music` 或 `Cd \Music` 都可以切换到 Music 目录，效果相同。

![FreeDOS 上的 Mplayer][4]

*你可以用 Mplayer 播放 MP3 文件*

使用 MPlayer 在 FreeDOS 播放音乐文件时没有花哨的界面。但同时，它也不会分散注意力。所以我可以一边让 FreeDOS 在我的 DOS 计算机上播放 MP3 文件，一边使用另一台计算机做其他事情。然而，FreeDOS 一次只运行一个任务（换句话说，DOS 是一个<ruby>单任务<rt>single-tasking</rt></ruby>操作系统），所以我不能将 MPlayer 置于 FreeDOS 的“后台”运行，而在 _同一台 FreeDOS 机_ 上处理其他事情。

请注意，MPlayer 是一个需要大量内存才能运行的大程序。虽然 DOS 本身并不需要太多的内存来运行，但我建议至少有 16M 的内存来运行 MPlayer。

### 使用 Open Cubic Player 听音频文件

FreeDOS 不止提供了 MPlayer 来播放媒体。还有 [Open Cubic Player][6]，它支持多种文件格式，包括 Midi 和 WAV 文件。

1999 年，我录制了一段简短的音频文件，内容是我说：“你好，我是 Jim Hall，我把 ‘FreeDOS’ 发音为 _FreeDOS_。"这是一个玩笑，借鉴了 Linus Torvalds 录制的演示他如何发音 Linux 的 [类似的音频文件][7]（`English.au`，包含在 1994 年的 Linux 源代码树中）中的创意。我们不会在 FreeDOS 中分发这段 FreeDOS 音频剪辑，但欢迎你从我们的 [Silly Sounds][8] 目录中下载它，该目录位于 [Ibiblio][9] 的 FreeDOS 文件存档中。

你可以使用 Open Cubic Player 收听 _FreeDOS_ 音频剪辑。通常从 `\APPS\OPENCP` 目录键入 `CP` 命令运行 Open Cubic Player。但 Open Cubic Player 是 32 位应用程序，运行它需要 32 位 DOS 扩展器。常见的 DOS 扩展器是 DOS/4GW。虽然可以免费使用，但 DOS/4GW 不是开源程序，因此我们不会将其作为 FreeDOS 包分发。

相反，FreeDOS 提供了另一个名为 DOS/32A 的开源32位扩展器。如果你在安装 FreeDOS 时没有安装所有内容，则可能需要使用 [FDIMPLES][10] 进行安装。我使用这两行命令切换到 `\APPS\OPENCP` 路径，并使用 DOS/32A 扩展器运行 Open Cubic Player：

```
CD \APPS\OPENCP
DOS32A CP
```

Open Cubic Player 没有花哨的用户界面，但你可以使用方向键将 <ruby>文件选择器<rt>File Selector</rt></ruby> 导航到包含要播放的媒体文件的目录。

![Open Cubic Player][11]

*Open Cubic Player 打开文件选择器*

文本比在其他 DOS 应用程序中显示的要小，因为 Open Cubic Player 会自动将显示更改为使用 50 行文本，而不是通常的 25 行。当你退出程序时，Open Cubic Player 会将显示重置为 25 行。

选择媒体文件后，Open Cubic Player 将循环播放该文件（按键盘上的 `Esc` 键退出）。当文件通过扬声器播放时，Open Cubic Player 会显示一个频谱仪，以便你可以观察左右声道的音频。FreeDOS 音频剪辑是以单声道录制的，因此左右声道是相同的。

![Open Cubic Player][12]

*Open Cubic Player 中播放 FreeDOS 音频文件*

DOS 可能来自较早的年代，但这并不意味着你不能使用 FreeDOS 来执行现代任务或播放当前的媒体。如果你喜欢听数字音乐，试一试在 FreeDOS上 使用 Open Cubic Player 或 MPlayer 吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/listen-music-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://en.wikipedia.org/wiki/MPlayer
[3]: https://bigfinish.com/
[4]: https://opensource.com/sites/default/files/uploads/mplayer.png (You can use Mplayer to listen to MP3 files)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://www.cubic.org/player/
[7]: https://commons.wikimedia.org/wiki/File:Linus-linux.ogg
[8]: https://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/util/sillysounds/
[9]: https://www.ibiblio.org/
[10]: https://opensource.com/article/21/6/freedos-package-manager
[11]: https://opensource.com/sites/default/files/uploads/opencp1.png (Open Cubic Player opens with a file selector)
[12]: https://opensource.com/sites/default/files/uploads/opencp2.png (Open Cubic Player playing the "FreeDOS" audio clip)
