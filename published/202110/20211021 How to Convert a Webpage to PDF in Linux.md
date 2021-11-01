[#]: subject: "How to Convert a Webpage to PDF in Linux"
[#]: via: "https://itsfoss.com/convert-webpage-pdf-linux/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13928-1.html"

如何在 Linux 下将网页转换为 PDF 文件
======

![](https://img.linux.net.cn/data/attachment/album/202110/28/111738tncncbml6jwcz6s8.jpg)

当你将某些资源存档或用于教育目的时，将网页保存为 PDF 是很方便的。

但是，你如何在 Linux 中把一个网页转换成 PDF？

你可以选择使用每个 Linux 发行版上的网页浏览器（GUI），或者使用终端将网页变成 PDF 文件。

在这里，我将提到这两种方法来帮助你完成工作。

### 方法 1：使用网页浏览器将网页转换为 PDF 文件

尽管我在本教程中使用的是 Mozilla Firefox，但你也可以用任何 [可用于 Linux 的最佳浏览器][1] 做同样的事情。

![][2]

1、加载你想转换的网页。

2、在浏览器菜单中找到“**打印**”选项，或使用键盘快捷键 `Ctrl + P`。

3、默认情况下，它应该让你把它保存为 PDF。你需要点击“保存”，然后选择目的地并保存网页。

![Save webpage as PDF in Mozilla Firefox][3]

这种简单方法的一个主要问题是，它包括页面上的所有元素。这可能包括评论、页脚等。你可以用一个 PDF 编辑器来删除部分内容，但这是一个额外的任务。

更好的选择是利用一个浏览器扩展，如 [Print Friendly][4]。它允许你在下载 PDF 之前编辑和删除网页的部分内容。

### 方法 2：使用终端将网页转换为 PDF 或图片

你可能已经知道，你可以 [在 Linux 终端浏览互联网][5]，甚至 [使用命令行下载文件][6]。这并不奇怪，因为你可以在终端中做更多的事情，包括将网页下载为 PDF。

一个灵巧的开源命令行工具 `wkhtmltopdf` 和 `wkhtmltoimage` 可以帮到你，让你把任何 HTML 网页转换成 PDF 或图像文件。

它使用 Qt WebKit 渲染引擎来完成这个任务。你可以浏览它的 [GitHub页面][7] 了解更多信息。

你应该能够从你的 Linux 发行版的默认仓库中安装它。对于基于 Ubuntu 的发行版，你可以输入以下命令：

```
sudo apt install wkhtmltopdf
```

无论你想把它转换为 PDF 还是图像文件，它的使用都是非常直接的：

![][8]

要将一个网页转换成 PDF，请输入：

```
wkhtmltopdf URL/domain filename.pdf
```

比如，类似于这样：

```
wkhtmltopdf linuxmint.com mint.pdf
```

你可以选择使用 `https://linuxmint.com` 这样完整的 URL 或使用域名，如上面的例子所示。

默认情况下，生成的文件将保存在主目录下。

在转换网页时，你还可以得到一些好玩的选项。

例如，你可以**对 PDF 文件应用灰度过滤器**，在同一文件中**制作多个页面副本**，以及在转换过程中**排除**图像。

灰度过滤器不一定对每个网页都有效，但你可以用命令试试：

```
wkhtmltopdf -g google.com googlepage.pdf
```

要在同一个 PDF 文件中复制多个页面，命令是：

```
wkhtmltopdf --copies 2 linuxmint.com mint.pdf
```

而且，如果你想排除网页中的图像，只需输入：

```
wkhtmltopdf --no-images linuxmint.com mint.pdf
```

此外，如果你想把一个网页转换为图像，命令是这样的：

```
wkhtmltoimage linuxmint.com mint.png
```

注意，与使用浏览器的 GUI 方法不同，通过终端使用这些工具有其局限性。它似乎不能成功转换利用任何 `<iframe>` 代码片段的网页。

像我们的网站，甚至 DuckDuckGo 都没有转换为 PDF 或图像。然而，简单的 HTML 网站，如 Linuxmint.com、Ubuntu.com、Google.com 则非常有效。

### 总结

使用浏览器将网页保存为 PDF 似乎是个好办法。但是，如果你想有更多的选择并通过终端，`wkhtmltopdf` 工具应该会派上用场。

你喜欢如何在 Linux 中把网页转换为 PDF？欢迎在评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/convert-webpage-pdf-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-browsers-ubuntu-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/mozilla-save-webpage-pdf.png?resize=800%2C536&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/mozilla-firefox-print-pdf-1.png?resize=602%2C584&ssl=1
[4]: https://www.printfriendly.com/
[5]: https://itsfoss.com/terminal-web-browsers/
[6]: https://itsfoss.com/download-files-from-linux-terminal/
[7]: https://github.com/wkhtmltopdf/wkhtmltopdf
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/htmltopdf-mint.png?resize=736%2C344&ssl=1
