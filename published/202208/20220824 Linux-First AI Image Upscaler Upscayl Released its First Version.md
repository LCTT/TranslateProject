[#]: subject: "Linux-First AI Image Upscaler Upscayl Released its First Version"
[#]: via: "https://news.itsfoss.com/upscayl-version-1-release/"
[#]: author: "Abhishek https://news.itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14976-1.html"

Linux 优先的 AI 图像提升器 Upscayl 发布了第一个版本
======

> 你不是每天都能遇到一个采用 “Linux 优先” 方式的应用程序。

![Linux-First AI Image Upscaler Upscayl Released its First Version][1]

你是不是有一张世纪初的像素化、低分辨率的图片？由于人工智能的进步，你可以轻松地将像素化的图像提升为分辨率更好的图像。

使用普通的图像编辑器需要人工的努力来提升图像。

有大量的在线人工智能图像提升器，但是你不能信任它们对你的数据的处理。

一个新的项目试图解决这个问题，为你提供一个简单的桌面应用程序，让你在一次点击中增强低分辨率照片。

它的第一个版本已经发布。

### Upscayl 的功能

[Upscayl][2] 是一个跨平台的应用程序，以 Linux 优先的理念构建。

这仅仅意味着 Linux 的构建得到优先考虑，但其他平台也会得到支持。

Upscayl 使用 Python 和 JavaScript 开发，给出了一个简单的界面，你可以选择输入图片和输出文件夹，然后点击 “Upscayl” 按钮来增强图片。

### 使用 Upscayl

我的电脑上没有太多模糊的照片。并不是说我是一个优秀的摄影师，只是懒得在成千上万的照片中寻找它们。

不过，我还是设法弄到了一张 2011 年的模糊的老照片（那是 11 年前的照片，现在可以说是老照片了）。

![厨房的模糊老照片][4]

不要因为我随手拍了一张厨房柜台的照片而对我做出评价。一定有一个很好的理由（或者我觉得）。

无论如何。我试着用 Upscayl 对图片进行放大。

![使用 Upscayl][5]

这需要相当大的处理能力，但我的 8 核、第 11 代 i7 处理器和 16GB 内存可以轻松应对。

![Upscayl 工作时 CPU 的使用情况][6]

单张图片的处理花了大约 4 分钟，435KB 的图片最终变成了 24MB 的图片。说实话，我几乎没有注意到明显的差异。

![由 Upscayl 放大的图像][7]

我想把最后的结果嵌入这里的文章中。但是上传一张 24MB 的图片对我的服务器和你的浏览器来说都有点过分。

### 安装 Upscayl

不过，我这个不怎么成功的实验不应该阻止你自己去尝试它。

目前，该应用程序可用于 Linux。对 Windows 和 macOS 的支持正在计划中。

你可以得到 Upscayl 的 AppImage 和 Flatpak 软件包。我使用的是 AppImage 版本，你可以使用你喜欢的任何一种。

这些文件可以在发布页面上找到。

> **[下载 Upscayl][8]**

如果你喜欢这个项目，别忘了在 GitHub 上给它加星。

> **[GitHub - TGS963/upscayl][9]**

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/upscayl-version-1-release/

作者：[Abhishek][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/08/upscayl-image-upscaler.png
[2]: https://github.com/TGS963/upscayl
[3]: https://news.itsfoss.com/content/media/2022/08/upscayl-in-action.mp4
[4]: https://news.itsfoss.com/content/images/2022/08/old-blurry-photo.jpg
[5]: https://news.itsfoss.com/content/images/2022/08/Using-Upscayl-for-image-processing.png
[6]: https://news.itsfoss.com/content/images/2022/08/Upscayl-CPU-usage.png
[7]: https://news.itsfoss.com/content/images/2022/08/Upscayl-final-result.png
[8]: https://github.com/TGS963/upscayl/releases
[9]: https://github.com/TGS963/upscayl
