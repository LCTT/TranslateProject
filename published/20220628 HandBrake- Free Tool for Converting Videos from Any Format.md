[#]: subject: "HandBrake: Free Tool for Converting Videos from Any Format"
[#]: via: "https://www.debugpoint.com/handbrake/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14801-1.html"

HandBrake：用于转换任何格式视频的免费工具
======

![](https://img.linux.net.cn/data/attachment/album/202207/07/141355dt7b8znyhfmltmsh.jpg)

> 了解一下 HandBrake，这是一个优秀的工具，可以将任何格式的视频转换为目标类型。

本文介绍了它的功能、下载说明和使用指南。

### HandBrake

在这个社交媒体的时代，我们身处各种视频之中，当然还有随之而来的各种格式。因此，如果你是在 Linux 平台，甚至是在 Windows 平台，你可以使用各种软件来为多个平台转换各种视频。但是，如果你需要一个简单但功能丰富的视频转换器来处理来自多个来源的所有视频格式，请尝试 HandBrake。

#### 功能

HandBrake 有大量的选项，使其成为一个独特的工具。首先，其工作流程是超级简单。事实上，它只是三个步骤：

* 选择一个视频
* 选择一个目标格式
* 转换

正如你所看到的，如果你是一个新手用户，使用这个工具是非常容易的，因为目标格式的属性（如比特率、尺寸）是基于默认的预设。

其次，如果你想进行高级编辑，如在转换时从字幕文件中添加字幕，也可以使用这个工具。

此外，你还可以改变尺寸、翻转视频、改变分辨率、修改长宽比，以及裁剪。此外，通过一套基本的过滤器配置，可以完成诸如去噪和锐化等操作。

另外，为你的视频文件添加章节、标签和音轨也很容易。

也许 HandBrake 的重要功能是提供预设，以满足现代社会媒体和流媒体的需求。例如，其预设与这些流媒体平台和流媒体设备相一致，如：

* Discord
* GMail
* Vimeo
* 亚马逊 Fire Stick 电视棒
* 苹果设备
* Chromecast
* Playstation
* Roku
* Xbox

一个相当令人印象深刻的列表，不是吗？不仅如此，如果你是一个专业工作者，它可以帮助你定义和创建转换队列。队列功能允许你在工作流程中批量转换多个视频文件。

最后，你可以转换为 MPEG-4（mp4）、Matroska（mkv）和 WebM 格式。

![HandBrake with various features][1]

### 下载和安装

下载和安装 HandBrake 对于任何平台（Linux、Mac 和 Windows）都很容易。开发者直接提供了可执行文件，可以免费下载。

由于本站的主要目标受众是 Linux 用户，我们将讨论 HandBrake 在 Linux 中的安装。

对于 Ubuntu、Linux Mint 和所有其他发行版，最好的方法是 Flatpak。你可以 [设置 Flatpak][2]，然后点击下面的按钮来安装 HandBrake：

> **[通过 Flathub 安装 HandBrake][3]**

对于 Windows、macOS 的安装程序，请访问 [这个页面][4a]。

一个有趣的特点是，你可以通过命令行使用这个应用程序！这意味着你可以使用命令行工具进一步定制你的工作流程，你可以在 [这里][4] 下载。

### 如何使用 HandBrake 来转换视频？（示例）

既然你安装了它，让我们看看你如何只用三个步骤就能转换一个示例视频。

1. 打开 HandBrake，点击顶部工具栏上的 “<ruby>打开源文件<rt>Open Source</rt></ruby>” 按钮，选择你的视频文件。
2. 现在，从“<ruby>格式<rt>Format</rt></ruby>”下拉菜单中选择目标文件类型。确保选中目标文件夹（默认为 `Videos`）。
3. 最后，点击顶部工具栏的“<ruby>开始<rt>Start</rt></ruby>”按钮，用 HandBrake 转换视频。

![HandBrake Video Conversion in three simple steps][5]

你可以在窗口的底部找到一个漂亮的转换进度显示。

![Encoding status][6]

上面的步骤是最基本的步骤。如果你想进一步控制视频，你可以改变选项，也可以从我前面解释的大量预设列表中选择。

### 常见问题

**HandBrake 是免费使用么？**

是的，它是一个自由开源的应用程序，你可以免费下载它。

**它可在 Mac 和 Windows 上用么？**

是的，你可以在 macOS、Windows 10 和 Windows 11 中轻松安装 HandBrake。

**如何下载 HandBrake？**

你只能从官方网站 https://handbrake.fr/ ，不能从其他地方下载 HandBrake。

### 结束语

Handbrake 是如今可用的专业级免费和开源视频编码器之一。它是一个经过时间考验的应用，每天有数百万用户使用。我希望本指南能帮助你了解这个神奇的工具，让你开始你的视频项目。

**演示视频来自 [Pexels - cottonbro][7]**。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/handbrake/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/06/HandBrake-with-various-features.jpg
[2]: https://www.debugpoint.com/how-to-install-flatpak-apps-ubuntu-linux/
[3]: https://dl.flathub.org/repo/appstream/fr.handbrake.ghb.flatpakref
[4]: https://handbrake.fr/downloads2.php
[4a]: https://handbrake.fr/downloads.php
[5]: https://www.debugpoint.com/wp-content/uploads/2022/06/HandBrake-Video-Conversion-in-three-simple-steps.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/06/Encoding-status.jpg
[7]: https://www.pexels.com/video/hands-hand-table-colorful-3997786/
