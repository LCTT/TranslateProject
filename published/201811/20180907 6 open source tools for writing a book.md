6 个用于写书的开源工具
======
> 这些多能、免费的工具可以满足你撰写、编辑和生成你自己的书籍的全部需求。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-lead-austen-writing-code.png?itok=XPxRMtQ4)

我在 1993 年首次使用并贡献了免费和开源软件，从那时起我一直是一名开源软件的开发人员和布道者。尽管我被记住的一个项目是 [FreeDOS 项目][1]，这是一个 DOS 操作系统的开源实现，但我已经编写或者贡献了数十个开源软件项目。

我最近写了一本关于 FreeDOS 的书。《[使用 FreeDOS][2]》是我庆祝 FreeDOS 出现 24 周年而撰写的。它是关于安装和使用 FreeDOS、关于我最喜欢的 DOS 程序，以及 DOS 命令行和 DOS 批处理编程的快速参考指南的集合。在一位出色的专业编辑的帮助下，我在过去的几个月里一直在编写这本书。

《使用 FreeDOS》 可在知识共享署名（cc-by）国际公共许可证下获得。你可以从 [FreeDOS 电子书][2]网站免费下载 EPUB 和 PDF 版本。（我也计划为那些喜欢纸质的人提供印刷版本。）

这本书几乎完全是用开源软件制作的。我想分享一下对用来创建、编辑和生成《使用 FreeDOS》的工具的看法。

### Google 文档

[Google 文档][3]是我使用的唯一不是开源软件的工具。我将我的第一份草稿上传到 Google 文档，这样我就能与编辑器进行协作。我确信有开源协作工具，但 Google 文档能够让两个人同时编辑同一个文档、发表评论、编辑建议和更改跟踪 —— 更不用说它使用段落样式和能够下载完成的文档 —— 这使其成为编辑过程中有价值的一部分。

### LibreOffice

我开始使用的是 [LibreOffice][4] 6.0，但我最终使用 LibreOffice 6.1 完成了这本书。我喜欢 LibreOffice 对样式的丰富支持。段落样式可以轻松地为标题、页眉、正文、示例代码和其他文本应用样式。字符样式允许我修改段落中文本的外观，例如内联示例代码或用不同的样式代表文件名。图形样式让我可以将某些样式应用于截图和其他图像。页面样式允许我轻松修改页面的布局和外观。

### GIMP

我的书包括很多 DOS 程序截图、网站截图和 FreeDOS 的 logo。我用 [GIMP][5] 修改这本书的图像。通常，只是裁剪或调整图像大小，但在我准备本书的印刷版时，我使用 GIMP 创建了一些更适于打印布局的图像。

### Inkscape

大多数 FreeDOS 的 logo 和小鱼吉祥物都是 SVG 格式，我使用 [Inkscape][6] 来调整它们。在准备电子书的 PDF 版本时，我想在页面顶部放置一个简单的蓝色横幅，角落里有 FreeDOS 的 logo。实验后，我发现在 Inkscape 中创建一个我想要的横幅 SVG 图案更容易，然后我将其粘贴到页眉中。

### ImageMagick

虽然使用 GIMP 来完成这项工作也很好，但有时在一组图像上运行 [ImageMagick][7] 命令会更快，例如转换为 PNG 格式或调整图像大小。

### Sigil

LibreOffice 可以直接导出到 EPUB 格式，但它不是个好的转换器。我没有尝试使用 LibreOffice 6.1 创建 EPUB，但在 LibreOffice 6.0 中没有包含我的图像。它还以奇怪的方式添加了样式。我使用 [Sigil][8] 来调整 EPUB 并使一切看起来正常。Sigil 甚至还有预览功能，因此你可以看到 EPUB 的样子。

### QEMU

因为本书是关于安装和运行 FreeDOS 的，所以我需要实际运行 FreeDOS。你可以在任何 PC 模拟器中启动 FreeDOS，包括 VirtualBox、QEMU、GNOME Boxes、PCem 和 Bochs。但我喜欢 [QEMU][9] 的简单性。QEMU 控制台允许你以 PPM 格式转储屏幕，这非常适合抓取截图来包含在书中。

当然，我不得不提到在 [Linux][11] 上运行 [GNOME][10]。我使用 Linux 的 [Fedora][12] 发行版。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/writing-book-open-source-tools

作者：[Jim Hall][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[1]: http://www.freedos.org/
[2]: http://www.freedos.org/ebook/
[3]: https://www.google.com/docs/about/
[4]: https://www.libreoffice.org/
[5]: https://www.gimp.org/
[6]: https://inkscape.org/
[7]: https://www.imagemagick.org/
[8]: https://sigil-ebook.com/
[9]: https://www.qemu.org/
[10]: https://www.gnome.org/
[11]: https://www.kernel.org/
[12]: https://getfedora.org/
