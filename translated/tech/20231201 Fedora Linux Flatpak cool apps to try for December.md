[#]: subject: "Fedora Linux Flatpak cool apps to try for December"
[#]: via: "https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-december/"
[#]: author: "Eduard Lucena https://fedoramagazine.org/author/x3mboy/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Linux Flatpak 12 月份值得尝试的酷炫应用
======

![][1]

Daimar Steiner 摄

本文介绍了 Flathub 中可用的项目以及安装说明。

[Flathub][2] 是获取和分发适用于所有 Linux 应用的地方。它由 Flatpak 提供支持，允许 Flathub 应用在几乎任何 Linux 发行版上运行。

请阅读 “[Flatpak 入门][3]”。为了启用 flathub 作为你的 flatpak 提供商，请使用 [flatpak 站点][4]上的说明。

### Live Captions

Live Captions 是一款为 Linux 桌面提供实时自动字幕的应用。目前仅提供英语。其他语言可能会产生乱码或错误的语音翻译。

特点：

   * 简单的界面
   * 在本地为桌面/麦克风音频添加字幕，由深度学习提供支持
   * 没有 API 密钥、没有专有服务/库、没有遥测、没有间谍活动、没有数据收集、不使用网络权限
   * 调整字体、字号、大小写切换
   * 不太确定的文本会褪色（变暗）。此功能是可配置的。



老实说，直到最近有人推荐我才知道这个应用，我感到非常惊讶。这对于有听力问题的人来说确实很有帮助。正如此类软件的常见情况，模型需要培训，而项目通常需要反馈。

实时字幕需要良好的硬件才能正常运行，但不需要专用的 GPU。

该项目被标记为安全，因为它不需要特殊许可：

![][5]

你可以通过单击网站上的安装按钮或手动使用以下命令来安装 “Live Caption”：

````

     flatpak install flathub net.sapples.LiveCaptions

````

### Pencil2D

[Pencil2D][6] 是一个 2D 动画程序，可让你使用位图和矢量图形轻松创建手绘图形。其突出特点是：

   * 简约设计
   * 光栅和矢量
   * 跨平台
   * 开源且免费



请注意，该项目被标记为“潜在不安全”，因为它可以访问你的文件系统：

![][7]

你可以通过单击网站上的安装按钮或手动使用以下命令来安装 “Pencil2D”：

````

     flatpak install flathub org.pencil2d.Pencil2D

````

_**Pencil2D 也可以在 fedora 的仓库中以 rpm 形式提供**_

### Frog

[Frog][8] 是一款可让你通过拍摄源图片从图像、网站、视频和二维码中提取文本的应用。

它的一些特点是：

   * 提取 QR 码和条形码：在一秒钟内捕获、提取和转换任何 QR 码或条形码。
   * 拖放：你无需对图像进行截图。将其直接拖放到 Frog 窗口中以提取文本。
   * 支持大量语言：Frog 支持多种语言，甚至包括那些它以前不支持的语言。
   * 隐私：Frog 使用门户网站尊重你的隐私



请注意，该项目被标记为“潜在不安全”，因为它可以访问你的主文件夹：

![][9]

你可以通过单击网站上的安装按钮或手动使用以下命令来安装 “Frog”：

````

     flatpak install flathub com.github.tenderowl.frog

````

### PDF Arranger

[PDF Arranger][10] 是一个小型应用，它可以帮助用户使用交互式直观的图形界面合并或拆分 pdf 文档并旋转、裁剪和重新排列其页面。

没什么可说的，它是一个很棒的应用，非常直观且易于使用。

请注意，该项目被标记为“潜在不安全”，因为它可以访问你的文件系统：

![][11]

你可以通过单击网站上的安装按钮或使用以下命令手动安装 “PDF Arranger”：

````

     flatpak install flathub com.github.jeromerobert.pdfarranger

````

_**PDF Arranger 也可以在 fedora 的仓库中以 rpm 形式提供。**_

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-december/

作者：[Eduard Lucena][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/x3mboy/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/11/Flatpak_feature_im_Dec-23-816x345.jpg
[2]: https://flathub.org
[3]: https://fedoramagazine.org/getting-started-flatpak/
[4]: https://flatpak.org/setup/Fedora
[5]: https://fedoramagazine.org/wp-content/uploads/2023/10/image-2.png
[6]: https://flathub.org/apps/org.pencil2d.Pencil2D
[7]: https://fedoramagazine.org/wp-content/uploads/2023/11/image.png
[8]: https://flathub.org/apps/com.github.tenderowl.frog
[9]: https://fedoramagazine.org/wp-content/uploads/2023/11/image-1.png
[10]: https://flathub.org/apps/com.github.jeromerobert.pdfarranger
[11]: https://fedoramagazine.org/wp-content/uploads/2023/11/image-2.png
