用于Linux桌面的4个扫描工具
======
使用其中一个开源软件驱动扫描仪来实现无纸化办公。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-photo-camera-blue.png?itok=AsIMZ9ga)

尽管无纸化世界还没有到来，但越来越多的人通过扫描文件和照片来摆脱纸张的束缚。不过，仅仅拥有一台扫描仪还不足够。你还需要软件来驱动扫描仪。

然而问题是许多扫描仪制造商没有将Linux版本的软件与他们的设备适配在一起。不过在大多数情况下，即使没有也没多大关系。因为在linux桌面上已经有很好的扫描软件了。它们能够与许多扫描仪配合很好的完成工作。

现在就让我们看看四个简单又灵活的开源Linux扫描工具。我已经使用过了下面这些工具（甚至[早在2014年][1]写过关于其中三个工具的文章）并且觉得它们非常有用。希望你也会这样认为。

### Simple Scan

这是我最喜欢的一个软件之一，[Simple Scan][2]小巧，迅速，高效，且易于使用。如果你以前见过它，那是因为Simple Scan是GNOME桌面上的默认扫描程序应用程序，也是许多Linux发行版的默认扫描程序。

你只需单击一下就能扫描文档或照片。扫描过某些内容后，你可以旋转或裁剪它并将其另存为图像（仅限JPEG或PNG格式）或PDF格式。也就是说Simple Scan可能会很慢，即使你用较低分辨率来扫描文档。最重要的是，Simple Scan在扫描时会使用一组全局的默认值，例如150dpi用于文本，300dpi用于照片。你需要进入Simple Scan的首选项才能更改这些设置。

如果你扫描的内容超过了几页，还可以在保存之前重新排序页面。如果有必要的话 - 假如你正在提交已签名的表格 - 你可以使用Simple Scan来发送电子邮件。

### Skanlite

从很多方面来看，[Skanlite][3]是Simple Scan在KDE世界中的表兄弟。虽然Skanlite功能很少，但它可以出色的完成工作。

你可以自己配置这个软件的选项，包括自动保存扫描文件，设置扫描质量以及确定扫描保存位置。 Skanlite可以保存为以下图像格式：JPEG，PNG，BMP，PPM，XBM和XPM。

其中一个很棒的功能是Skanlite能够将你扫描的部分内容保存到单独的文件中。当你想要从照片中删除某人或某物时，这就派上用场了。

### Gscan2pdf

这是我另一个最爱的老软件，[gscan2pdf][4]可能会显得很老旧了，但它仍然包含一些比这里提到的其他软件更好的功能。即便如此，gscan2pdf仍然显得很轻便。

除了以各种图像格式（JPEG，PNG和TIFF）保存扫描外，gscan2pdf还将它们保存为PDF或[DjVu][5]文件。你可以在单击“扫描”按钮之前设置扫描的分辨率，无论是黑白，彩色还是纸张大小，每当你想要更改任何这些设置时，这都会进入gscan2pdf的首选项。你还可以旋转，裁剪和删除页面。

虽然这些都不是真正的杀手级功能，但它们会给你带来更多的灵活性。

### GIMP

你大概会知道[GIMP][6]是一个图像编辑工具。但是你恐怕不知道可以用它来驱动你的扫描仪吧。

你需要安装[XSane][7]扫描软件和GIMP XSane插件。这两个应该都可以从你的Linux发行版的包管理器中获得。在软件里，选择文件>创建>扫描仪/相机。单击扫描仪，然后单击扫描按钮即可进行扫描。

如果这不是你想要的，或者它不起作用，你可以将GIMP和一个叫作[QuiteInsane][8]的插件结合起来。使用任一插件，都能使GIMP成为一个功能强大的扫描软件，它可以让你设置许多选项，如是否扫描彩色或黑白，扫描的分辨率，以及是否压缩结果等。你还可以使用GIMP的工具来修改或应用扫描后的效果。这使得它非常适合扫描照片和艺术品。

### 它们真的能够工作吗？

所有的这些软件在大多数时候都能够在各种硬件上运行良好。我将它们与我过去几年来拥有的多台多功能打印机一起使用 - 无论是使用USB线连接还是通过无线连接。

你可能已经注意到我在前一段中写过“大多数时候运行良好”。这是因为我确实遇到过一个例外：一个便宜的canon多功能打印机。我使用的软件都没有检测到它。最后我不得不下载并安装canon的Linux扫描仪软件才使它工作。

你最喜欢的Linux开源扫描工具是什么？发表评论，分享你的选择。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/linux-scanner-tools

作者：[Scott Nesbitt][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[way-ww](https://github.com/way-ww)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[1]: https://opensource.com/life/14/8/3-tools-scanners-linux-desktop
[2]: https://gitlab.gnome.org/GNOME/simple-scan
[3]: https://www.kde.org/applications/graphics/skanlite/
[4]: http://gscan2pdf.sourceforge.net/
[5]: http://en.wikipedia.org/wiki/DjVu
[6]: http://www.gimp.org/
[7]: https://en.wikipedia.org/wiki/Scanner_Access_Now_Easy#XSane
[8]: http://sourceforge.net/projects/quiteinsane/
