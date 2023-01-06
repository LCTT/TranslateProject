[#]: subject: "Compress Images in Linux Easily With Curtail GUI App"
[#]: via: "https://itsfoss.com/curtail-image-compress/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14748-1.html"

用 Curtail GUI 应用轻松压缩 Linux 中的图像
======

![](https://img.linux.net.cn/data/attachment/album/202206/23/182901s4d060uu98g8qquv.jpg)

有一大堆文件尺寸巨大的图片占用了太多的磁盘空间？或者你必须将图片上传到有文件大小限制的门户网站？

你可能有很多原因想要压缩图片。有大量的工具可以帮助你，我在这里说的不是命令行的工具。

你可以使用一个成熟的图像编辑器，如 GIMP。你也可以使用像 [Squoosh][1] 这样的网络工具，这是谷歌的一个开源项目。它甚至可以让你比较每个压缩级别的文件。

然而，所有这些工具都是针对单个图像工作的。如果你想批量压缩照片怎么办？Curtail 是一个能帮助你的应用。

### Curtail: Linux 中用于图像压缩的灵巧工具

使用 Python 和 GTK3 构建的 Curtail 是一个简单的 GUI 应用，使用 OptiPNG、[jpegoptim][2] 等开源库来提供图像压缩功能。

它有一个 [Flatpak 应用][3]。请确保你的系统已启用 [Flatpak 支持][4]。

首先添加 Flathub 仓库：

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

然后使用下面的命令来安装 Curtail：

```
flatpak install flathub com.github.huluti.Curtail
```

安装后，在你的 Linux 系统的菜单中寻找它，并从那里启动它。

![curtail app][5]

界面朴素而简单。你可以选择你想要无损压缩还是有损压缩。

有损压缩会有质量差的图像，但尺寸较小。无损压缩会有更好的质量，但尺寸可能不会比原来的小很多。

![curtail app interface][6]

你可以浏览图片，或者把它们拖到应用中。

是的，你可以用 Curtail 一键压缩多张图片。

事实上，你甚至不需要点击。只要你选择图片或拖放它们，它们就会被压缩，你会看到压缩过程的摘要。

![curtail image compression summary][7]

正如你在上面的图片中看到的，我的一张图片的尺寸减少了 35%，另外两张图片的尺寸减少了 3% 和 8%。这是在无损压缩的情况下。

这些图片以 `-min` 为后缀（默认），保存在与原始图片相同的目录中。

虽然它看起来很简约，但有几个选项可以配置 Curtail。点击菜单，你会看到一些设置选项。

![curtail configuration options][8]

你可以选择是将压缩文件保存为新文件还是替换现有文件。如果你选择新文件（默认行为），你也可以为压缩后的图像提供一个不同的后缀。保留文件属性的选项也在这里。

在下一个选项卡中，你可以配置有损压缩的设置。默认情况下，压缩级别为 90%。

![curtail compression options][9]

高级选项卡让你可以选择配置 PNG 和 WebP 文件的无损压缩级别。

![curtain advanced options][10]

### 总结

正如我前面所说，这不是一个突破性的工具。你可以用其他工具如 GIMP 做同样的事情。它只是使图像压缩的任务更简单，特别是对于批量图像压缩。

我很想看到在压缩时有[转换图像文件格式][11]的选项，就像我们在 Converseen 等工具中所拥有的那样。

总的来说，对于图像压缩的具体目的来说，这是一个不错的小工具。

--------------------------------------------------------------------------------

via: https://itsfoss.com/curtail-image-compress/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://squoosh.app/
[2]: https://github.com/tjko/jpegoptim
[3]: https://itsfoss.com/what-is-flatpak/
[4]: https://itsfoss.com/flatpak-guide/
[5]: https://itsfoss.com/wp-content/uploads/2022/06/curtail-app.png
[6]: https://itsfoss.com/wp-content/uploads/2022/06/curtail-app-interface.png
[7]: https://itsfoss.com/wp-content/uploads/2022/06/curtail-image-compression-summary.png
[8]: https://itsfoss.com/wp-content/uploads/2022/06/curtail-configuration-options.png
[9]: https://itsfoss.com/wp-content/uploads/2022/06/curtail-compression-options.png
[10]: https://itsfoss.com/wp-content/uploads/2022/06/curtain-advanced-options.png
[11]: https://itsfoss.com/converseen/
