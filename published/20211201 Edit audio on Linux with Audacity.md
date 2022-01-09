[#]: subject: "Edit audio on Linux with Audacity"
[#]: via: "https://opensource.com/article/21/12/audacity-linux-creative-app"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14163-1.html"

在 Linux 上用 Audacity 编辑音频
======

> Audacity 是开源软件世界中的一个经典的强大工具，可以用于录音、编辑等对声音进行操作。

![](https://img.linux.net.cn/data/attachment/album/202201/09/130245b7jozrrrc7gorgae.jpg)

Audacity 声音编辑器是填补了一个似乎没有人意识到的空白的开源应用程序。它最初是在卡内基梅隆大学开发的，当时很多人还认为电脑只是用来办公和学习的，要进行严肃的多媒体工作需要特殊的 DSP 外围设备。Audacity 认识到，普通计算机用户偶尔也需要编辑音频。在此后的 20 年里，Audacity 团队一直为录音和清理声音打造这个开源的应用程序。

我经常使用 Audacity，作为一个受过培训的编辑，我已经习惯了在我的应用程序中使用重要的、通常是单键的键盘快捷键。通过围绕单个字母建立快捷键，你可以一只手放在鼠标上，一只手放在键盘上，所以选择一个工具或一个重要功能和点击鼠标之间的延迟仅仅是几毫秒而已。在本文中，我将专门给出我在 Audacity 中使用的键盘快捷方式，如果你想优化自己的设置可以参考。

### 在 Linux 上安装 Audacity

在大多数 Linux 发行版上，Audacity 都可以从你的软件包管理器中获得。在 Fedora、Mageia 和类似的发行版上：

```
$ sudo dnf install audacity
```

在 Elementary、Mint 和其他基于 Debian 的发行版上：

```
$ sudo apt install audacity
```

然而，我是以 [Flatpak][2] 方式来使用 Audacity 的。

在 Windows 或 macOS 上，可以从 [Audacity 网站][3] 下载一个 Audacity 安装程序。

它最近有一个叫做 [Tenacity][4] 的复刻版本，是另外的开发者团队准备延续 Audacity 的传统而开发的。在写这篇文章的时候，两者基本上是相同的应用程序，所以这篇文章同样适用于两者。以后是否在功能上有分歧，还有待观察。

安装后，从你的应用程序或活动菜单中启动该应用程序。

### 在 Audacity 中设置输入

首先，你必须设置你的音频 *输入*，以便 Audacity 接收你使用的麦克风或音频接口的信号。你选择什么输入取决于你的设置和你拥有的音频外围设备。USB 麦克风通常被标为 <ruby>麦克风<rt> Microphone</rt></ruby>，但带有 1/8" 输入插孔的麦克风可能被标为 <ruby>线路输入<rt>Line in</rt></ruby>。你可以选择不同输入：

#### Pulse Audio 音频服务器

Linux 使用<ruby>高级 Linux 声音架构<rt>Advanced Linux Sound Architecture</rt></ruby>（ALSA）作为其声音的后端，而 macOS 和 Windows 则使用自己的封闭框架。在 Linux 上，你可以将 Pulse Audio 音频服务器设置为你的输入源，将 Audacity 导向 _一个_ 虚拟接口（Pulse），因此你可以从系统设置中选择声音输入。这是我的首选方法，因为它将所有控制集中在一个方便的控制面板上。在一个应用程序中选择一个麦克风，却发现麦克风在其他地方被静音的日子已经一去不复返了。

![声音输入][5]

#### 设备访问

如果你的发行版或操作系统没有使用 Pulse Audio 音频服务器，或者由于某种原因你喜欢直接访问声音设备，你可以从下拉菜单中选择一个设备。这需要了解你的系统是如何列出声音设备的，这有时候并不很好找。台式机可能有几个输入源，有些在机箱的后面，有些在前面的面板上。笔记本电脑通常输入方式较少，但你可能在网络摄像头附近有一个麦克风，如果你使用的是外部麦克风，可能还有一个。

### 用 Audacity 录制音频

选中你的输入后，按“<ruby>录音<rt>Record</rt></ruby>”按钮（有红点的按钮）。

![录制音频][7]

如果你是对着麦克风录音，你所要做的就是开始说话。如果你从，比如说，[黑胶唱片机][8] 录制输入，那么你必须启动它。不管是什么，只要 Audacity 处于录音模式，任何发送到你选择的输入的信号都会被写入 Audacity 并在你的屏幕上呈现为波形。

**我的快捷方式：** 我使用 `R` 键来开始录音。默认情况下，按下空格键停止录音（也可以回放录音）。

### 编辑音频

录音很少完全按计划进行。也许你过早地开始录音，不得不忍受几秒钟的黑胶静音（它就像静音，但更嘈杂），或者你发现你的语气停顿都是 “呃”、“嗯”或其他声调，或者你一开始就录制错误了。Audacity 首先是一个波形编辑器，这意味着你可以在最终的录音中剪掉你不想要的声音，就像你在文字处理器中输入的文字一样容易编辑。

### 编辑过零点的声音

Audacity 的主要编辑工具是“<ruby>选择工具<rt>Selection Tool</rt></ruby>”。它是你在文字处理程序中看到的熟悉的“工字形”光标，它的功能在这里也是一样。你可以点击并拖动这个光标，穿过声音的一个区域，然后你可以复制、粘贴、剪切、删除或直接播放这个区域。

**我的快捷键：** 我用 `I` 键来激活“<ruby>选择工具<rt>Selection Tool</rt></ruby>”，因为光标看起来像字母 “I”。

在文字处理器中，你可以非常清楚地看到每个字母的结尾和开头。你不可能不小心选择和删除一个字母的一半。然而，在现代应用程序中，声音的 “分辨率”（称为 _采样率_）非常好，所以人眼很难在音频波中找到一个清晰的断点。Audacity 可以调整你的选择，使你选择的区域落在所谓的 <ruby>[过零点][9]<rt>zero crossing</rt></ruby>，这可以避免在你做切割的地方出现微妙但明显的突兀现象。

![过零点][10]

在你做出选择后，进入“<ruby>选择<rt> Select</rt></ruby>”菜单，选择 “<ruby>在过零点<rt>At Zero Crossings</rt></ruby>”。

**我的快捷键：** 我使用 `Z` 键来调整选区到过零点，使用 `X` 键来删除一个区域（它使我不必将手一直移到 `Del` 或 `Backspace` ）。

### 腾出空间

编辑的好处是，你的最终产品不一定要与你录制的内容一致。我曾经录制过一些讲座，甚至录制过一些读物的剧本，但最终因为某种原因而偏离了方向，或者遗漏了一部分重要的信息，后来在发布前又重新编排或添加了全新的音频。

移动所选的音频与删除类似，但不是删除音频，而是复制和粘贴所选内容，就像你在文字处理器中做的那样 —— 使用标准的键盘快捷键复制或剪切，重新定位你的光标，然后粘贴。不过，为插入的内容腾出空间，需要在音频时间线上留出空位，这样你就可以录制额外的音频来填补你所创造的空白。为此，你可以使用“<ruby>选择工具<rt>Selection Tool</rt></ruby>”和“<ruby>时间偏移工具<rt>Time Shift Tool</rt></ruby>”。

要在音频中创建一个空隙，将你的“<ruby>选择工具<rt>Selection Tool</rt></ruby>”的光标放在你想添加空隙的地方。导航到“<ruby>编辑<rt>Edit</rt></ruby>”菜单，选择“<ruby>剪辑边界<rt>Clip Boundaries</rt></ruby>”子菜单，然后选择“<ruby>分割<rt>Split</rt></ruby>”。这将在你的选择点上分割你的音频。

激活顶部工具栏中的“<ruby>时间偏移工具<rt>Time Shift Tool</rt></ruby>”（图标是两个连接的箭头，分别指向左边和右边），点击并拖动分割后的音频的右半部分，创建一个间隙。

![空隙][11]

**我的快捷方式：** 我用 `K` 来分割，用 `T` 来激活“<ruby>时间偏移工具<rt>Time Shift Tool</rt></ruby>”。

### 导出音频

当你对你的音频感到满意时，你可以导出它，这样你就可以与他人分享。Audacity 可以选择它能够导出的格式，并且它能够将其输出到像 [ffmpeg][12] 这样的工具，以获得比你可能永远需要的更多格式。

我更喜欢用 FLAC 格式输出音频，这种音频格式有点像 WAV，只是它是无损压缩的。它只占用一小部分空间，而没有任何质量上的损失。要尝试它，去“<ruby>文件<rt>File</rt></ruby>”菜单，选择“<ruby>导出<rt>Export</rt></ruby>”子菜单，然后选择“<ruby>导出音频<rt>Export Audio</rt></ruby>”。有了 FLAC 文件作为你的 [黄金镜像][13]，你可以用 SoundConverter 把你的文件转换成任何数量的传输目标的最佳格式 —— 用于浏览器的 Ogg Vorbis 或 Opus 或 Webm，用于苹果设备的 M4A 文件，也许还有用于传统系统的 MP3。

如果你只是想从 Audacity 快速简单地导出，简单的选择是 Ogg Vorbis。这是一种开源的文件格式，可以在大多数网页浏览器（Firefox、Chromium、Chrome、Android 和 Edge）和 [如 VLC、mpv 等媒体播放器][14] 播放。

### 探索 Audacity

Audacity 是开源软件世界中的一个经典动力工具。基本的录音和编辑仅仅是个开始。你可以添加效果、[过滤掉（一些）噪音][15]、调整速度、改变音高等等。无论你是在学校录制讲座、混合鼓循环、为视频游戏拼接声音，还是只是在探索音频世界，都可以去启动 Audacity，发挥创意！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/audacity-linux-creative-app

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/colorful_sound_wave.png?itok=jlUJG0bM (Colorful sound wave graph)
[2]: https://opensource.com/article/21/11/how-install-flatpak-linux
[3]: https://www.audacityteam.org/
[4]: https://github.com/tenacityteam/tenacity
[5]: https://opensource.com/sites/default/files/uploads/gnome-sound-setting.png (Sound input)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/audacity-input.png (Recording audio)
[8]: https://opensource.com/article/18/1/audacity-digitize-records
[9]: https://en.wikipedia.org/wiki/Zero_crossing
[10]: https://opensource.com/sites/default/files/uploads/audacity-zero-crossing.jpg (Zero crossing)
[11]: https://opensource.com/sites/default/files/uploads/audacity-split.jpg (Spacer)
[12]: https://opensource.com/article/21/11/linux-line-commands-reclaim-space-converting-files#audio
[13]: https://opensource.com/article/19/7/what-golden-image
[14]: https://opensource.com/article/21/2/linux-media-players
[15]: https://opensource.com/life/14/10/how-clean-digital-recordings-using-audacity
