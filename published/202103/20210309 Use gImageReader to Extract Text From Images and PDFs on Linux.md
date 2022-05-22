[#]: subject: (Use gImageReader to Extract Text From Images and PDFs on Linux)
[#]: via: (https://itsfoss.com/gimagereader-ocr/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13205-1.html)

在 Linux 上使用 gImageReader 从图像和 PDF 中提取文本
======

> gImageReader 是一个 GUI 工具，用于在 Linux 中利用 Tesseract OCR 引擎从图像和 PDF 文件中提取文本。

[gImageReader][1] 是 [Tesseract 开源 OCR 引擎][2]的一个前端。Tesseract 最初是由 HP 公司开发的，然后在 2006 年开源。

基本上，OCR（光学字符识别）引擎可以让你从图片或文件（PDF）中扫描文本。默认情况下，它可以检测几种语言，还支持通过 Unicode 字符扫描。

然而，Tesseract 本身是一个没有任何 GUI 的命令行工具。因此，gImageReader 就来解决这点，它可以让任何用户使用它从图像和文件中提取文本。

让我重点介绍一些有关它的内容，同时说下我在测试期间的使用经验。

### gImageReader：一个跨平台的 Tesseract OCR 前端

![][3]

为了简化事情，gImageReader 在从 PDF 文件或包含任何类型文本的图像中提取文本时非常方便。

无论你是需要它来进行拼写检查还是翻译，它都应该对特定的用户群体有用。

以列表总结下功能，这里是你可以用它做的事情：

  * 从磁盘、扫描设备、剪贴板和截图中添加 PDF 文档和图像
  * 能够旋转图像
  * 常用的图像控制，用于调整亮度、对比度和分辨率。
  * 直接通过应用扫描图像
  * 能够一次性处理多个图像或文件
  * 手动或自动识别区域定义
  * 识别纯文本或 [hOCR][4] 文档
  * 编辑器显示识别的文本
  * 可对对提取的文本进行拼写检查
  * 从 hOCR 文件转换/导出为 PDF 文件
  * 将提取的文本导出为 .txt 文件
  * 跨平台（Windows）

### 在 Linux 上安装 gImageReader

**注意**：你需要安装 Tesseract 语言包，才能从软件管理器中的图像/文件中进行检测。

![][5]

你可以在一些 Linux 发行版如 Fedora 和 Debian 的默认仓库中找到 gImageReader。

对于 Ubuntu，你需要添加一个 PPA，然后安装它。要做到这点，下面是你需要在终端中输入的内容：

```
sudo add-apt-repository ppa:sandromani/gimagereader
sudo apt update
sudo apt install gimagereader
```

你也可以从 openSUSE 的构建服务中找到它，Arch Linux 用户可在 [AUR][6] 中找到。

所有的仓库和包的链接都可以在他们的 [GitHub 页面][1]中找到。

### gImageReader 使用经验

当你需要从图像中提取文本时，gImageReader 是一个相当有用的工具。当你尝试从 PDF 文件中提取文本时，它的效果非常好。

对于从智能手机拍摄的图片中提取，检测很接近，但有点不准确。也许当你进行扫描时，从文件中识别字符可能会更好。

所以，你需要亲自尝试一下，看看它是否对你而言工作良好。我在 Linux Mint 20.1（基于 Ubuntu 20.04）上试过。

我只遇到了一个从设置中管理语言的问题，我没有得到一个快速的解决方案。如果你遇到此问题，那么可能需要对其进行故障排除，并进一步了解如何解决该问题。

![][7]

除此之外，它工作良好。

试试吧，让我知道它是如何为你服务的！如果你知道类似的东西（和更好的），请在下面的评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gimagereader-ocr/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://github.com/manisandro/gImageReader
[2]: https://tesseract-ocr.github.io/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/gImageReader.png?resize=800%2C456&ssl=1
[4]: https://en.wikipedia.org/wiki/HOCR
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/tesseract-language-pack.jpg?resize=800%2C620&ssl=1
[6]: https://itsfoss.com/aur-arch-linux/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/gImageReader-1.jpg?resize=800%2C460&ssl=1
