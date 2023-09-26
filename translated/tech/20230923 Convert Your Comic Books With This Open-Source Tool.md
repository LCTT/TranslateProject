[#]: subject: "Convert Your Comic Books With This Open-Source Tool!"
[#]: via: "https://news.itsfoss.com/cbconvert/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用此开源工具转换你的漫画书！
======
这里有一些有趣的东西供你尝试！这是一款有趣的开源工具，具有非常特定的用途。

**CBconvert 是漫画书转换器**，可以将漫画转换为不同的格式以适合各种设备。

对我个人来说，这将是第一次，因为我以前从未尝试过这样的转换器。在此，我将探讨并重点介绍这款工具的功能。

🚧

该应用相当新，正在积极开发中。期待事情发生改变。

### CBconvert：概述 ⭐

![][1]

CBconvert 主要使用 [Go][2] 语言编写，旨在成为满足你所有漫画书转换需求的一站式应用。

它可以读取最常见的文件格式，例如 **CBR** (RAR)、XPS、**CB7** (7Z)、**CBT** (TAR)、**PDF** 等。

你可以将这些文件转换为两种不同的格式：**CBZ** (ZIP) 和 **CBT** (TAR)。

不要认为 CBconvert 的唯一目的是转换漫画书，你还可以使用它进行一些视觉调整。我稍后会讨论这个问题。

**主要特征：**

   * **有用的编辑工具**
   * **漫画书转换**
   * **从漫画中提取封面图片**



事不宜迟，让我们深入了解 CBconvert。

### 初步印象👨‍💻

虽然转换器可以在 **Linux、Windows 和 macOS** 上运行，但我在 Linux 系统上进行了尝试。

我首先使用侧边栏菜单中的“添加文件”选项向应用添加一些漫画（公共领域获取）。我能够添加多部漫画，没有遇到很多问题。

同样，我继续查看各种功能选项卡。

**第一个选项卡名为“输入”**包含一些选项，例如**设置最小大小限制**、**仅选择灰度图像**等等。我不需要使用这些，但如果你想向要转换的文件添加先决条件，这些选项肯定很有用。

![][3]

**第二个选项卡是你可以进行漫画转换的地方**，它被称为“输出”。我设置了输出目录，并选择了 “ZIP” 存档格式来获取 **.cbz 文件输出**。

它还可以选择向输出文件添加后缀，并从存档中删除任何非图像文件，如下所示。

![][4]

设置完所有输出设置后，我单击“**转换**”。然后它开始一张一张地处理所有的漫画。操作速度很快，达到了预期的最终结果。

![][5]

你可能想知道：_为什么这个封面看起来和以前的不一样？_

好吧，在转换这些漫画之前，我冒昧地尝试调整漫画书的视觉效果。

感谢“**变换**”选项卡，它允许我尝试各种设置，例如**亮度**、**对比度**、**输入/输出级别**等。

![][6]

我想说，**此功能需要进一步完善**，由于预览时未实时反映更改，因此需要一些时间才能显示更改。

📋

请记住，我不必选择其他漫画，所有漫画都与“夜魔侠”一起接受了相同的调整。

然后，**有第三个选项卡，名为“图像”**，它允许我以各种图像格式导出封面照片，例如 JPEG、PNG、TIFF、WebP 等。

![][7]

CBconvert 还具有一些选项来**从封面图片创建缩略图**、**调整图像质量**、**将其变成灰度**，甚至**对其应用一些调整大小的滤镜**。

### 📥 获取 CBconvert

对于其他平台，你可以从 [GitHub][8] 存储库获取最新版本的 CBconvert，对于 Linux，你可以选择 [Flathub][9] 中的 Flathub 包。

[CBconvert（Flathub）][9]

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/cbconvert/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2023/09/CBconvert_1.jpg
[2]: https://go.dev/
[3]: https://news.itsfoss.com/content/images/2023/09/CBconvert_2.jpg
[4]: https://news.itsfoss.com/content/images/2023/09/CBconvert_3.jpg
[5]: https://news.itsfoss.com/content/images/2023/09/CBconvert_6.jpg
[6]: https://news.itsfoss.com/content/images/2023/09/CBconvert_5.jpg
[7]: https://news.itsfoss.com/content/images/2023/09/CBconvert_4.jpg
[8]: https://github.com/gen2brain/cbconvert
[9]: https://flathub.org/apps/io.github.gen2brain.cbconvert
