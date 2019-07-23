[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11141-1.html)
[#]: subject: (Use ImageGlass to quickly view JPG images as a slideshow)
[#]: via: (https://opensource.com/article/19/6/use-imageglass-view-jpg-images-slideshow-windows-10)
[#]: author: (Jeff Macharyas https://opensource.com/users/jeffmacharyas)

使用 ImageGlass 以幻灯片形式快速查看 JPG 图像
======

> 想要在 Windows 10 中以幻灯片形式逐个查看文件夹中的图像么？开源软件可以做到。

![Looking back with binoculars][1]

欢迎阅读今天的系列文章 “我该如何让它实现？”就我而言，我试图在 Windows 10 上以幻灯片形式查看 JPG 图像的文件夹。像往常一样，我转向开源来解决这个问题。

在 Mac 上，以幻灯片形式查看 JPG 图像文件夹只需选择文件夹中的所有图像（`Command-A`），然后按 `Option-Command-Y` 即可。之后，你可以使用箭头键向前翻动。当然，在 Windows 中，你可以通过选择第一个图像，然后单击窗口中黄色的**管理**栏，然后选择**幻灯片**来执行类似的操作。在那里，你可以控制速度，但只能做到：慢、中、快。

我希望像在 Windows 中能像 Mac 一样翻下一张图片。自然地，我 Google 搜索了一下并找到了一个方案。我发现了 [ImageGlass][2] 这个开源应用，其许可证是 [GPL 3.0][3]，并且它完美地做到了。这是它的样子：

![Viewing an image in ImageGlass.][4]

### 关于 ImageGlass

ImageGlass 是由 Dương Diệu Pháp 开发的，根据他的网站，他是一名越南开发人员，在 Chainstack 负责前端。他与在美国的 [Kevin Routley][5] 协作，后者“为 ImageGlass 开发新功能”。源代码可以在 [GitHub][6] 上找到。

ImageGlass 支持最常见的图像格式，包括 JPG、GIF、PNG、WEBP、SVG 和 RAW。用户可以轻松自定义扩展名列表。

我遇到的具体问题是需要找到一张用于目录封面的图像。不幸的是，它在一个包含数十张照片的文件夹中。在 ImageGlass 中以幻灯片浏览照片，在我想要的照片前停止，并将其下载到我的项目文件夹中变得很容易。开源再次帮助了我，该应用只花了很短的时间下载和使用。

在 2016 年 3 月 10 日，Jason Baker 在他的文章 [9 款 Picasa 的开源替代品][7] 中将 ImageGlass 列为其中之一。如果你有需求，里面还有一些其他有趣的图像相关工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/use-imageglass-view-jpg-images-slideshow-windows-10

作者：[Jeff Macharyas][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffmacharyas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/look-binoculars-sight-see-review.png?itok=NOw2cm39 (Looking back with binoculars)
[2]: https://imageglass.org/
[3]: https://github.com/d2phap/ImageGlass/blob/master/LICENSE
[4]: https://opensource.com/sites/default/files/uploads/imageglass-screenshot.png (Viewing an image in ImageGlass.)
[5]: https://github.com/fire-eggs
[6]: https://github.com/d2phap/ImageGlass
[7]: https://opensource.com/alternatives/picasa
