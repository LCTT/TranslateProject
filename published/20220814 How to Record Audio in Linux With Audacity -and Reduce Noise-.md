[#]: subject: "How to Record Audio in Linux With Audacity (and Reduce Noise)"
[#]: via: "https://itsfoss.com/audacity-recording/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: "FYJNEVERFOLLOWS"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15284-1.html"

如何在 Linux 中使用 Audacity 录制音频（并降噪）
======

![][0]

[Audacity][1] 是一个自由开源的跨平台 [音频编辑器][2]。专业人士使用它是因为它提供的功能仅需安装很小的软件包。

你不必成为一名专业人士并使用它的所有功能。你可以使用它从麦克风录制音频，并执行一些基本操作，如背景噪声消除。

我将在本教程中向你展示如何做到这一点。

### 在 Linux 上安装 Audacity

在 Linux 上安装 Audacity 是一个非常简单的过程。由于其受欢迎，可以在大多数 Linux 发行版的官方存储库中找到它。

你可以在发行版的软件中心或软件包管理器中搜索它。

作为一个终端爱好者，让我分享一下常见发行版的命令。

对于基于 Debian 或 Ubuntu 的发行版：

```
sudo apt install audacity
```

对于基于 RHEL 或 Fedora 的发行版：

```
sudo dnf install audacity
```

如果你在用基于 Arch 的发行版：

```
sudo pacman -Syu audacity
```

**注意**，通过官方存储库安装可能无法获得 [最新版本][3]。要获得最新版本，你可以使用 AppImage 或 Flatpak/Snap 软件包。

### 使用 Audacity 录制音频

安装 Audacity 后，从应用程序菜单打开它或从终端启动它。你会看到这样的界面：

![Audacity Interface][4]

单击“录制”按钮（红点）即可轻松开始录制。完成后，单击“
停止”按钮（方形图标）来结束录制。你还可以预览录制的波形，如下所示：

![record audio with audacity][5]

然后，你可以通过单击“播放”按钮（绿色图标）检查录制的内容。

如果你没有看到任何波形，则表示未录制到任何内容。很可能，你没有正确设置音频输入。确保你选择了正确的麦克风，并确保在“<ruby>系统设置<rt>system settings</rt></ruby>”中其未被静音。你也可以通过 Audacity 接口设置。

录音不会自动保存为 MP3 或其他格式。**要保存录音**，你可以转到 “<ruby>文件<rt>File</rt></ruby> → <ruby>导出<rt>Export</rt></ruby>” 并选择 “<ruby>导出为 MP3<rt>Export as MP3</rt></ruby>”（或任何其他想要的格式）。

### 使用 Audacity 降低背景噪声

Audacity 还有另一个很棒的功能，你可以使用它来减少录制音频中的白噪声。

最好的做法是在开始使用 Audacity 录制时的前五秒不要说任何话。这将为你提供所需的背景噪声。

在录制音频的波形上，选择你认为是背景噪声的部分。

![Background noise][6]

选择噪声部分后，从顶部文件菜单中转到 “<ruby>效果<rt>Effects</rt></ruby> → <ruby>降低噪音<rt>Noise Reduction</rt></ruby>”。

它会像这样打开一个弹出窗口。单击此处的 “<ruby>获取噪音配置文件<rt>Get Noise Profile</rt></ruby>”。

![Noise Reduction Effect Popup Window][7]

现在，你已经设置了噪声配置文件。现在，你必须使用它来减少录音中的噪声。

按 `Ctrl + A` 快捷键选择整段录音。你也可以选择其中的一部分，仅对所选部分减少噪声。

选择音轨后，再次转到 “<ruby>效果<rt>Effects</rt></ruby> → <ruby>降低噪音<rt>Noise Reduction</rt></ruby>”。

**这次不要单击** “<ruby>获取噪音配置文件<rt>Get Noise Profile</rt></ruby>”。这一次，你应该能够按下 “OK” 按钮。

只需按下 “OK” 按钮，即可将降噪效果应用到录音中，并反映在波形上，如下所示：

![Audio Waveform after Noise Reduction][8]

现在，相较而言，录制的音频将具有更少的噪声。你可以在选择 “<ruby>降低噪音<rt>Noise Reduction</rt></ruby>” 效果时微调噪声过滤。

总结如下：

* 选择噪声部分，转到 “<ruby>效果<rt>Effects</rt></ruby> → <ruby>降低噪音<rt>Noise Reduction</rt></ruby>”，然后单击 “<ruby>获取噪音配置文件<rt>Get Noise Profile</rt></ruby>”
* 按 `Ctrl + A` 选择整段音频录制，转到 “<ruby>效果<rt>Effects</rt></ruby> → <ruby>降低噪音<rt>Noise Reduction</rt></ruby>”，这次按 `OK` 按钮

请注意，你无法移除所有类型的噪声，但这应该会有所帮助。

### Audacity 能做更多事情

使用 Audacity 录制音频可能不像使用 GNOME 录音机那样简单，但它并不太复杂。如果你正在录制画外音，降噪功能将非常有用。

Audacity 有更多其他功能，不可能在一个教程中涵盖所有这些功能。这就是为什么我会保持简短的原因。

如果你不能接受 2021 年的 [Audacity 的隐私政策调整][9]，试试其他可用的工具。

我希望这个小教程能帮助你使用 Audacity 进行音频录制。如果你有问题或建议，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/audacity-recording/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[FYJNEVERFOLLOWS](https://github.com/FYJNEVERFOLLOWS)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://github.com/audacity/audacity
[2]: https://itsfoss.com/best-audio-editors-linux/
[3]: https://github.com/audacity/audacity/releases
[4]: https://itsfoss.com/wp-content/uploads/2022/08/audacity-interface.png
[5]: https://itsfoss.com/wp-content/uploads/2022/08/record-audio-with-audacity.png
[6]: https://itsfoss.com/wp-content/uploads/2022/08/audacity-noise-reduction.png
[7]: https://itsfoss.com/wp-content/uploads/2022/08/audacity-noise-steps.png
[8]: https://itsfoss.com/wp-content/uploads/2022/08/audacity-noise-reduced.png
[9]: https://news.itsfoss.com/audacity-fiasco-fork/
[0]: https://img.linux.net.cn/data/attachment/album/202211/24/114858g6vpfg3gfglvxnp4.jpg