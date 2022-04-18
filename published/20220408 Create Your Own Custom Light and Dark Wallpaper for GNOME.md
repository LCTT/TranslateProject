[#]: subject: "Create Your Own Custom Light and Dark Wallpaper for GNOME"
[#]: via: "https://www.debugpoint.com/2022/04/custom-light-dark-wallpaper-gnome/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14471-1.html"

如何创建你的自定义 GNOME 深浅壁纸
======

![](https://img.linux.net.cn/data/attachment/album/202204/13/233814h9wwzwaqtwu9qthg.jpg)

> 一份简单的指南：如何针对 GNOME 桌面环境来创建你的自定义的深色和浅色壁纸。

[GNOME 42][1] 将备受期待的深浅主题带到 GNOME 桌面环境。它也带来壁纸的深色和浅色版本，当你切换深色或浅色主题时，它会自动地转换。

因此，默认情况下，GNOME 给予你一套预配置的深色和浅色壁纸。但是如果你想要在主题更改时自动地转换成另一种不同的壁纸要怎么做呢？

下面是如何在 GNOME 中配置和创建你自己的深浅壁纸的方法。

### 如何针对 GNOME 桌面环境来创建自定义的深浅壁纸

第一，确保你手边有两个版本的壁纸。一般来说，它们应该是标准的 PNG 或 JPG 图像文件。例如，我们针对这个示例使用下面的两张壁纸。

![Sample light and dark wallpaper for demo][2]

但是，如果你没有合适的深浅壁纸，或者正在查找更多的壁纸，在这篇指南的结尾，我将让你知道如何获取它们，或者如何自己准备它们。请跟着我阅读。

第二，我们需要为我们自己创建一个模式文件。壁纸的自动更换是由一个名为 `adwaita.xml` 的 XML 文件处理的，它定义了特定的深色和浅色的背景标记。因此，我们将为壁纸创建我们自己的 XML 文件。

为做到这一点，[从 GitLab 复制][3] `adwaita.xml` 的内容，并创建一个新的 XML 文件。你能够会在这个文件中看到两个标记 – `filename` 和 `filename-dark`。这两个 XML 标记包含这两个壁纸的完整的限定的路径。现在，在这两个标记下添加你的图像文件的路径，如我下图所示。。

![Change the XML file][4]

第三，把这个文件保存到 `/home/<your_name>/.local/share/gnome-background-properties`，（请将 `<your_name>` 替换为你的用户名）文件名任意。如果这里没有 `gnome-background-properties` 目录，就创建它。针对这个示例，我使用 `my_cool_backgrounds.xml` 文件名。

![Save the file][5]

这样，你就准备好了所有的东西。最后，打开 “<ruby>设置<rt>Settings</rt></ruby>” 并转到 “<ruby>外观<rt>Appearance</rt></ruby>” 标签页，你应该会看到一个新的壁纸选项。

选择你自己的自定义的深浅壁纸，尽情享受。

![Appearance tab has now your own custom light and dark wallpaper][7]

### 如何下载或制作你自己的动态壁纸

当然，你必然会想，谁有时间去查找和创建壁纸的日夜版本？这里有一些网站来向你提供预制好的动态壁纸，你可以轻松地下载和安装。

我推荐的一个网站是 [dynamicwallpaper.club][8] ，它有一些高达 6K 的极好的高质量的壁纸，可用于 macOS。你可以轻松地下载它们。

此外，如果你打算从上述网站下载，请记住该网站的图像文件是 [heic][9] 格式的，因为这个网站是针对 macOS 的。<ruby>高效视频编码<rt>High-Efficiency Video Coding</rt></ruby>（HEIC）是苹果的专有的 HEIF（<ruby>高效图像文件<rt>High-Efficiency Image File</rt></ruby>）专有版本。

那么，如何在 Linux 系统中转换它们? 好吧，在 Ubuntu 或 Fedora Linux 中，你需要一个驱动程序来查看和转换动态的 heic 图像文件。打开一个终端，运行下面的命令开安装驱动程序。

Ubuntu 用户 –

```
sudo apt install heif-gdk-pixbuf
```

Fedora 用户 –

```
sudo dnf install libheif
```

只针对使用 KDE Plasma 的 Fedora/Ubuntu 用户（没有这个插件的帮助，Plasma 应用程序就不能打开 heic 格式的图像文件）：

```
sudo apt install qt-heif-image-plugin
sudo dnf install qt-heif-image-plugin
```

最后，使用你喜欢的图像查看器打开 heic 图像文件，并将其保存为 JPG/PNG 图像文件。

最好，不要忘记在下面的评论区告诉我，你是否能够针对 GNOME 桌面环境来创建你自己的自定义的深浅壁纸了。

![Custom Light and Dark wallpaper in GNOME – transition][10]

感谢阅读。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/custom-light-dark-wallpaper-gnome/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2022/03/gnome-42-release/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Sample-light-and-dark-wallpaper-for-demo.jpg
[3]: https://gitlab.gnome.org/GNOME/gnome-backgrounds/-/tree/main/backgrounds
[4]: https://www.debugpoint.com/wp-content/uploads/2022/04/Change-the-XML-file-1024x568.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/04/Save-the-file-1024x548.jpg
[6]: https://www.debugpoint.com/2021/12/gnome-text-editor/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/04/Apperance-tab-has-now-your-own-custom-light-and-dark-wallpaper-1024x657.jpg
[8]: https://dynamicwallpaper.club
[9]: https://en.wikipedia.org/wiki/High_Efficiency_Image_File_Format
[10]: https://www.debugpoint.com/wp-content/uploads/2022/04/Custom-Light-and-Dark-wallpaper-in-GNOME-transition-1024x556.gif
[11]: https://t.me/debugpoint
[12]: https://twitter.com/DebugPoint
[13]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[14]: https://facebook.com/DebugPoint
