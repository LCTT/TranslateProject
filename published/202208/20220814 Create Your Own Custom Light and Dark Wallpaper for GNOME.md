[#]: subject: "Create Your Own Custom Light and Dark Wallpaper for GNOME"
[#]: via: "https://www.debugpoint.com/custom-light-dark-wallpaper-gnome/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14960-1.html"

在 GNOME 中创建你自定义的浅色和深色壁纸
======

![](https://img.linux.net.cn/data/attachment/album/202208/24/104023a3do33wdizyb3zw4.jpg)

> 在 GNOME 桌面中创建自定义浅色和深色壁纸的简单指南。

[GNOME 42][1] 将期待已久的浅色和深色主题引入了 GNOME 桌面。它还带来了浅色和深色版壁纸，当你在浅色和深色主题之间切换时，它会自动改变。

因此，默认情况下，GNOME 会为你提供几组预配置的浅色和深色壁纸。

但是，如果你想要在主题更改时可以自动更改的别的壁纸怎么办？

以下是在 GNOME 中为浅色和深色主题配置和创建自定义壁纸的方法。

### 如何为 GNOME 创建自定义浅色和深色壁纸

首先，确保有两个版本的壁纸。通常，它们应该是标准的 PNG 或 JPG 图像。例如，我们在演示中使用了以下两个壁纸。

![Sample light and dark wallpaper for demo][2]

但是，如果你没有合适的浅色和深色壁纸，或正在寻找更多壁纸，在本指南的末尾，我会告诉你如何获取它们或准备你自己的。

跟着我来。

其次，我们需要为自己创建一个模式文件。壁纸的自动更换由名为 `adwaita.xml` 的 XML 文件处理，该文件定义了特定的浅色和深色背景标签。因此，我们将为壁纸创建 XML 文件。

为此，从 GitLab 复制 `adwaita.xml` 的内容并创建一个新的 XML 文件（链接在下面）。你应该在这个文件中看到两个标签：`filename` 和 `filename-dark`。这两个 XML 标记包含两个壁纸的完全限定路径。在这两个标签下添加图片的路径，如下所示。

> **[从这里下载 XML 文件 (adwaita.xml.in)][3]**

![Change the XML file][4]

第三步，使用你想要的任何名称将此文件保存到 `/home/YOUR_NAME/.local/share/gnome-background-properties`（请将 `YOUR_NAME` 替换为你的用户名）。如果 `gnome-background-properties` 不存在，请创建它们。对此示例，我使用了 `my_cool_backgrounds.xml`。

![Save the file][5]

都准备好了。最后，打开设置并转到外观选项卡，你应该会看到选项中出现新的壁纸。

选择你的自定义浅色和深色壁纸并享受。

![The appearance tab now has your custom light and dark wallpaper][6]

### 如何下载或制作你的动态壁纸

你一定会想，“谁有时间去寻找和创建深浅版本的壁纸”？一些网站为你提供现成的动态壁纸，你可以轻松下载和安装。

我推荐的一个网站是 [dynamicwallpaper.club][7]，它为 macOS 提供了一些高达 6K 的优秀高质量壁纸。你可以轻松下载它们。

此外，如果你打算从上述网站下载，请记住该网站的图像是 [heic 格式][8]，因为该网站适用于 macOS。高效视频编码（HEIC）是 Apple 的 HEIF（高效图像文件格式）的专有版本。

你需要一个驱动来查看和转换 Ubuntu 或 Fedora Linux 中的动态 heic 图像。那么，如何将它们转换为适用于 Linux 系统呢？打开终端并运行以下命令来安装驱动。

Ubuntu 用户：

```
sudo apt install heif-gdk-pixbuf
```

Fedora 用户：

```
sudo dnf install libheif
```

仅适用于带有 KDE Plasma 的 Fedora/Ubuntu（没有此插件，Plasma 应用无法打开 heic 图像）：

```
sudo apt install qt-heif-image-plugin
sudo dnf install qt-heif-image-plugin
```

最后，使用你喜欢的图像查看器打开 heic 图像并将其保存为 JPG/PNG。

![Custom Light and Dark wallpaper in GNOME – transition][9]

最后，别忘了在下面的评论部分告诉我你是否可以为 GNOME 创建自定义深色和浅色壁纸。

干杯。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/custom-light-dark-wallpaper-gnome/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/2022/03/gnome-42-release/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Sample-light-and-dark-wallpaper-for-demo.jpg
[3]: https://gitlab.gnome.org/GNOME/gnome-backgrounds/-/tree/main/backgrounds
[4]: https://www.debugpoint.com/?attachment_id=9376
[5]: https://www.debugpoint.com/?attachment_id=9375
[6]: https://www.debugpoint.com/?attachment_id=9374
[7]: https://dynamicwallpaper.club
[8]: https://en.wikipedia.org/wiki/High_Efficiency_Image_File_Format
[9]: https://www.debugpoint.com/wp-content/uploads/2022/04/Custom-Light-and-Dark-wallpaper-in-GNOME-transition.gif
