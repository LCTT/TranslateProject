[#]: subject: "How to Rotate a Video With VLC Media Player"
[#]: via: "https://itsfoss.com/rotate-video-vlc/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16129-1.html"

如何使用 VLC 媒体播放器旋转视频
======

![][0]

> 这个多功能的 VLC 媒体播放器还可以旋转视频方向。在桌面上观看智能手机录制的视频相当方便。

有时，你会遇到以显示方向错误的视频。使用智能手机摄像头拍摄的视频很可能会以这种方式出现。

如果你可以将其旋转到方便的方向，那么效果会更好。

功能丰富的 VLC 媒体播放器提供了一种旋转视频的方法。你可以：

  * 暂时旋转视频（下次播放时需要再次旋转）
  * 永久旋转视频（视频将始终以新方向播放）

让我们看看如何实现这两者之一。

### 在 VLC 中暂时旋转视频

让我们看看如何在 VLC 中临时旋转视频。也就是说，完成该过程后，它不会反映在实际文件上。这对于查看文件或测试文件很有用。

#### 使用预设值旋转视频

在此方法中，你可以将视频旋转 90 度、180 度和 270 度。这是你大多数时候所需要的。

打开 VLC 并选择要旋转的视频。

![Open File in VLC][1]

单击主菜单上的 “<ruby>工具<rt>Tools</rt></ruby>”，然后转到 “<ruby>效果和滤镜<rt>Effects and Filters</rt></ruby>”。你也可以按快捷键 `CTRL + E`。

![Tools > Effects and Filters][2]

在 “效果和滤镜” 页面上，选择 “<ruby>视频效果<rt>Video Effects</rt></ruby>” 选项卡，然后进入 “<ruby>几何<rt>Geometry</rt></ruby>”。现在，选中 “<ruby>变换<rt>Transform</rt></rt></ruby>” 复选框。

![Set the Rotation][3]

这将激活一个下拉菜单。从那里，选择你需要的适当旋转，如 90 度、180 度、水平翻转等。你可以在 VLC 窗口中查看变化。

对更改感到满意后，按 “<ruby>保存<rt>Save</rt></ruby>” 按钮以所选方向保存配置。

#### 使用自定义值旋转视频

需要将视频旋转到可用预设以外的方向？ VLC 也有一个选项。

首先，像上一步一样，打开媒体，然后转到 “工具 > 效果和滤镜 > 视频效果 > 几何”。

现在，单击 “<ruby>旋转<rt>Rotate</rt></ruby>” 复选框，你可以看到交互式圆形滑块现已激活。

> 🚧 对于不规则的旋转值（例如 230 度等），某些部分都会从视频中删除。

![Irregular rotation][4]

移动滑块以获得正确的旋转。你可以在 VLC 窗口中看到视频出现的变化。确定更改后，请按 “保存” 按钮保存该配置。

> 🚧 请记住，此配置在此阶段不会永久应用于视频。但是，如果你按 “保存”，方向也会暂时应用于 VLC 中播放的其他视频。

### 永久旋转视频

你知道了如何临时旋转文件。永久保存视频文件更改也需要该步骤。

#### 第 1 步：转换视频

这是前一部分。打开视频文件，然后进行所需的旋转。确认特定视频所需的旋转后，按照上一步中的说明保存该配置。

#### 第 2 步：保存视频

现在，打开 VLC 并单击 “<ruby>媒体<rt>Media</rt></ruby> > <ruby>转换/保存<rt>Convert/Save</rt></ruby>”。这可以在没有打开任何视频文件的情况下进行，因为无论如何我们都不会处理当前打开的视频。

![Click on Convert/Save][5]

在下一个对话框中，使用 “<rt>添加<rt>Add</rt></ruby>” 按钮选择要旋转的文件（在上一步中测试以确认所需旋转的文件）。然后按 “<ruby>转换并保存<rt>Convert and Save</rt></ruby>”。

![Add Files to convert][6]

接下来，选择所需的视频输出，然后单击相邻的设置按钮，如下所示。

![Click on Configuration button][7]

出现了配置文件设置窗口。在其上，进入 “<ruby>视频编解码器<rt>Video Codec</rt></ruby>”，然后转到 “<ruby>过滤器<rt>Filters</rt></ruby>” 选项卡。在这里，你必须根据需要应用过滤器。一个是 “<ruby>旋转视频过滤器<rt>Rotate Video Filter</rt></ruby>”，另一个是 “<ruby>视频转换过滤器<rt>Video transformation Filter</rt></ruby>”。

如果你已使用 “变换” 按钮对视频应用固定变换，请选择 “<ruby>视频变换过滤器<rt>Video transformation Filter</rt></ruby>”。另一方面，如果你对视频进行了一些不规则的旋转，请选择 “旋转视频过滤器”。

![Apply the Filters][8]

检查后，按 “保存”按钮。

现在，选择输出文件位置，我们要在其中保存转换后的文件。

![Select Output file location][9]

应给出一个新的文件名，这可以通过进入你选择的目录并只需在顶部栏上输入你选择的名称来完成。

> 💡 建议提供一个新的唯一名称，以避免文件覆盖和数据丢失。

![Give file name][10]

按 “<ruby>开始<rt>Start</rt></ruby>” 开始转换。

转换将需要一些时间，具体取决于你的视频。完成后，你将获得旋转的视频，可以在任何视频播放器上查看。

> 🚧 转换视频后（无论是永久的还是临时的），最好在 “工具 > 效果和滤镜 > 视频效果 > 几何” 中关闭应用的旋转。否则，以后使用 VLC 播放的视频将出现旋转。

我希望你喜欢这个 VLC 技巧。欢迎你提出建议和反馈。

同时，你还可以学习这个很酷的 VLC 自动下载字幕的技巧。

> **[在 VLC 中自动下载字幕][11]**

*（题图：MJ/b604f181-660a-4f05-bdd2-49b5b6da0bae）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/rotate-video-vlc/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/08/open-a-file-in-vlc.png
[2]: https://itsfoss.com/content/images/2023/08/effects-and-filters-in-main-menu.png
[3]: https://itsfoss.com/content/images/2023/08/rotate-video-in-transform.png
[4]: https://itsfoss.com/content/images/2023/08/rotate.png
[5]: https://itsfoss.com/content/images/2023/08/click-on-convert-and-save.png
[6]: https://itsfoss.com/content/images/2023/08/Add-files-to-convert.png
[7]: https://itsfoss.com/content/images/2023/08/click-on-config-button.png
[8]: https://itsfoss.com/content/images/2023/08/apply-filters.png
[9]: https://itsfoss.com/content/images/2023/08/give-an-output-file-name.png
[10]: https://itsfoss.com/content/images/2023/08/select-filename.png
[11]: https://itsfoss.com/download-subtitles-automatically-vlc-media-player-ubuntu/
[0]: https://img.linux.net.cn/data/attachment/album/202308/26/110201gf37d3djvis66seu.jpg