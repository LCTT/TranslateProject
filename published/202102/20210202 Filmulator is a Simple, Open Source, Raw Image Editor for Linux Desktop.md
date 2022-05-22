[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13119-1.html)
[#]: subject: (Filmulator is a Simple, Open Source, Raw Image Editor for Linux Desktop)
[#]: via: (https://itsfoss.com/filmulator/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Filmulator：一个简单的、开源的 Raw 图像编辑器
======

![](https://img.linux.net.cn/data/attachment/album/202102/15/100616o54wb5h4aqgmq4qe.jpg)

> Filmulator 是一个开源的具有库管理功能的 raw 照片编辑应用，侧重于简单、易用和简化的工作流程。

### Filmulator：适用于 Linux（和 Windows）的 raw 图像编辑器

[Linux 中有一堆 raw 照片编辑器][1]，[Filmulator][2] 就是其中之一。Filmulator 的目标是仅提供基本要素，从而使 raw 图像编辑变得简单。它还增加了库处理的功能，如果你正在为你的相机图像寻找一个不错的应用，这是一个加分项。

对于那些不知道 raw 的人来说，[raw 图像文件][3]是一个最低限度处理、未压缩的文件。换句话说，它是未经压缩的数字文件，并且只经过了最低限度的处理。专业摄影师更喜欢用 raw 文件拍摄照片，并自行处理。普通人从智能手机拍摄照片，它通常被压缩为 JPEG 格式或被过滤。

让我们来看看在 Filmulator 编辑器中会有什么功能。

### Filmulator 的功能

![Filmulator interface][4]

Filmulator 宣称，它不是典型的“胶片效果滤镜” —— 这只是复制了胶片的外在特征。相反，Filmulator 从根本上解决了胶片的魅力所在：显影过程。

它模拟了胶片的显影过程：从胶片的“曝光”，到每个像素内“银晶”的生长，再到“显影剂”在相邻像素之间与储槽中大量显影剂的扩散。

Fimulator 开发者表示，这种模拟带来了以下好处：

  * 大的明亮区域变得更暗，压缩了输出动态范围。
  * 小的明亮区域使周围环境变暗，增强局部对比度。
  * 在明亮区域，饱和度得到增强，有助于保留蓝天、明亮肤色和日落的色彩。
  * 在极度饱和的区域，亮度会被减弱，有助于保留细节，例如花朵。

以下是经 Filmulator 处理后的 raw 图像的对比，以自然的方式增强色彩，而不会引起色彩剪切。

![原图][5]

![处理后][10]

### 在 Ubuntu/Linux 上安装 Filmulator

Filmulator 有一个 AppImage 可用，这样你就可以在 Linux 上轻松使用它。使用 [AppImage 文件][6]真的很简单。下载后，使它可执行，然后双击运行。

- [下载 Filmulator for Linux][7]

对 Windows 用户也有一个 Windows 版本。除此之外，你还可以随时前往[它的 GitHub 仓库][8]查看它的源代码。

有一份[小文档][9]来帮助你开始使用 Fimulator。

### 总结

Fimulator 的设计理念是为任何工作提供最好的工具，而且只有这一个工具。这意味着牺牲了灵活性，但获得了一个大大简化和精简的用户界面。

我连业余摄影师都不是，更别说是专业摄影师了。我没有单反或其他高端摄影设备。因此，我无法测试和分享我对 Filmulator 的实用性的经验。

如果你有更多处理 raw 图像的经验，请尝试下 Filmulator，并分享你的意见。有一个 AppImage 可以让你快速测试它，看看它是否适合你的需求。

--------------------------------------------------------------------------------

via: https://itsfoss.com/filmulator/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/raw-image-tools-linux/
[2]: https://filmulator.org/
[3]: https://www.findingtheuniverse.com/what-is-raw-in-photography/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/Filmulate.jpg?resize=799%2C463&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/image-without-filmulator.jpeg?ssl=1
[6]: https://itsfoss.com/use-appimage-linux/
[7]: https://filmulator.org/download/
[8]: https://github.com/CarVac/filmulator-gui
[9]: https://github.com/CarVac/filmulator-gui/wiki
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/image-with-filmulator.jpeg?ssl=1