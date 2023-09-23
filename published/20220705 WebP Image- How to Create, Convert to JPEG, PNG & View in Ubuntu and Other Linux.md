[#]: subject: "WebP Image: How to Create, Convert to JPEG, PNG & View in Ubuntu and Other Linux"
[#]: via: "https://www.debugpoint.com/view-webp-ubuntu-linux/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16221-1.html"

如何在 Linux 下使用 WebP 图像
======

本文将详细介绍如何在 Ubuntu 和其他 Linux 发行版中转换和查看 WebP 图像，主题内容涵盖了你所需知道的全部信息。

![WebP Logo][1]

### WebP 图像格式的定义

2010 年 9 月，谷歌提出了 WebP 图像格式，其愿景是完全替代 JPEG、PNG 和 GIF 文件格式。就如你所见，WebP 是一个全能型的格式，继承了先前压缩算法的所有特性，支持有损和无损的动画以及透明度。

除此以外，WebP 基于块预测技术，它是互联网上推荐使用的图像格式。由于其文件大小明显更小、图象质量更好，WebP 已经成为了为网站提供图像的现代化标准。

### 现状简述

现在，几乎所有的主流 Web 浏览器都开始支持 WebP，也就是说你可以在包括 Chromium、Chrome、Firefox、Brave、Vivaldi、Safari 和 Edge 在内的热门浏览器中查看这种格式的图像。

然而，要从现有的 JPG 和 PNG 文件创建 WebP 图像，你需要安装谷歌开发的 [WebP][2] 库。另外，Linux 发行版的文件管理器暂时还不能直接显示该格式的图像。

为了与 WebP 实现无缝集成和提供良好的用户体验，各个组件必须协同工作。操作系统需要的是 WebP 的核心库。此外，文件管理器和图像查看器则需要能识别 `*.webp` 文件类型并进行加载。

这些为用户提供了一致的体验。由于 WebP 是新的标准，正在广泛施行和应用，你可能需要在 Linux 下执行一些额外的步骤以便运用这种技术。

另一方面，Windows 10 和 11 现在已经默认支持 WebP，包括其新的图像查看器功能。

因此，本篇文章将探讨如何在 Linux 系统下浏览、创建以及转换 WebP 图像的问题。

### 如何查看 WebP 图像

#### 针对 Ubuntu、Linux Mint 及相关发行版

要查看图像，首先需要一个加载器。文件管理器或图像查看器会使用这个加载器库来实现 WebP 图像的显示。然而，在 Ubuntu Linux 中，默认情况下并未提供 WebP 图像加载器。因此，你需要通过下列指令安装 `webp-pixbuf-loader` 库，此库能帮助 Ubuntu 中的 GTK 应用程序显示 WebP 图像。

```
sudo add-apt-repository ppa:helkaluin/webp-pixbuf-loadersudo apt updatesudo apt install webp-pixbuf-loader
```

如果你有兴趣了解 GDK 库如何在显示服务器（例如 X.Org）和 GTK 组件间进行协作，可以参考 [这个页面][3]。

#### openSUSE

Leap 和 Tumbleweed 的软件包在 [这里][4] 提供。访问页面并点击 “<ruby>专家下载<rt>Expert Download</rt></ruby>” 进行安装即可。

#### Arch Linux

在 Arch Linux 中，这个软件包在 [社区仓库][5] 里有提供。因此，你可以通过以下的命令方便地进行安装：

```
sudo pacman -S webp-pixbuf-loader
```

#### Fedora Linux 以及 RHEL

对于 Fedora 以及其他相关的发行版，可以使用如下的指令进行安装：

```
sudo dnf install webp-pixbuf-loader
```

安装完成以后，你可以选择**重新启动你的计算机**。

现在，我们来到了最有趣的部分。只要导航到任何包含 WebP 图像的目录，通过缩略图或者默认的图像查看器，你应该就能看到这些图像了。

以下是一个示例，展示了在 Ubuntu 22.04 LTS 中带有 WebP 图像的 Nautilus 文件管理器在之前和之后的界面。

![GNOME Files (Nautilus) with WebP file - before][6]

![GNOME Files (Nautilus) with WebP file - after][7]

### 在文件管理器/图像查看器中查看 WebP 图像

#### GNOME & Nautilus

对于 GNOME 桌面环境，Nautilus 文件管理器可以配合我在之前章节针对 Ubuntu/Fedora 等系统所解释的步骤正常工作。

#### Thunar 桌面（基于 Xfce 的发行版）下的 WebP 图像查看

尽管 Thunar 在 Xfce 桌面环境下默认就可展示缩略图，但默认的图像查看器 Ristretto 不能打开 WebP 格式的文件。因此，你首先需要安装我在先前章节中提及的一些软件包（例如针对 Ubuntu/Fedora 或 Arch 的包）并重启。然后，你可以通过改变默认的 .webp 文件类型关联，使用 Ristretto 查看器打开这些图像。

![Thunar and Ristretto Image Viewer shows webp image][8]

#### KDE Plasma - Dolphin 文件管理器及 Gwenview 图像查看器

KDE 默认的图像查看器 Gwenview 原生支持 WebP 格式，因此，你无需额外的安装步骤就可以查看 WebP 图像。另外，Dolphin 文件管理器也可以很好地展示 WebP 格式的缩略图。

![Dolphin and Gwenview displaying a sample WebP image on KDE Plasma][9]

#### PCManFMQt（基于 LXQt 的发行版）下的 WebP 图像查看

如果你使用的是 Lubuntu，那你应该可以使用 LXImage 查看器打开 WebP 图像，因为这款查看器默认就支持 WebP。同样，PCManFMQt 文件管理器也能默认展示 WebP 图像的缩略图。

![PCManFM-Qt and LXImage][10]

#### Nemo 文件管理器

从 [Linux Mint][11] 的 [Mint 21 “Vanessa”][12] 版本开始，Nemo 文件管理器也将支持 WebP。你也可以通过上述的 PPA 方案在 Linux Mint 中查看 WebP 图像，直到新的 Mint 正式版本发布。

### 使用其它应用程序查看 WebP 图像（推荐方式）

首先，著名的光栅图形编辑器 **GIMP** 在 2.10 版本及以后的版本中，已经支持打开和保存 WebP 格式的图像（目前在所有的 Linux 发行版中都已经可用）。

其次，除了你的桌面环境自带的图像查看器外，还有一些其他支持 WebP 图像格式的查看器，如：

* [Qview][13] — 一款极简的图像查看器
* [gThumb][14] — 一款基于 GTK 的图像查看器，同时也提供 [Flatpak 版本][14]

最后，[LibreOffice 7.4][15] 为其所有的组件（比如 Writer、Calc、Draw 和 Impress）带来 [对 WebP 格式的原生支持][16]，支持这类图像的导入和导出。

### 如何将 WebP 图像转换为 JPG 或 PNG 格式

现在，你已经知道了如何查看 .webp 格式的文件，再来学习如何转换这类文件应该会很有用。

首先，使用以下命令为 Ubuntu 或 Fedora Linux 系统，包括其他相关的发行版安装 webp 包。如果你需要一个不需要安装就能在所有发行版和操作系统上执行的预编译版本，可以访问 [这个页面][17] 并下载最新的 zip 文件。

对于 Ubuntu 和相关的发行版：

```
sudo apt install webp
```

对于 Fedora 和相关的发行版：

```
sudo dnf install libwebp
```

**安装完成后**，使用以下命令可以将 WebP 格式的图像转换为 JPG 或 PNG 格式。记得根据你的实际情况，修改文件名和路径。

```
dwebp image1.webp -o image1.png
```

### 把 JPEG 或 PNG 图像转换为 WebP 格式

如果需要把一张 JPEG 或 PNG 格式的图像转化为 WebP 格式，你可以使用 `cwebp``（WebP 编码器）命令如下：

```
cwebp -q <压缩因数> <输入图像> -o <输出图像>
```

例如，你可以使用下面的示例命令，它将 `image1.png` 转换为使用 80 的压缩因子的 `image1.webp`：

```
cwebp -q 80 image1.png -o image1.webp
```

### 把 GIF 图像转换为 WebP 图像

一个在 WebP 格式中常被忽视的特点是它支持动画。因此，可以轻松将 WebP 格式用来保存具有动画效果的 GIF 文件。使用下面的命令就能把一个已有的 GIF 文件转换为 WebP 文件。

```
gif2webp input_file.gif -o output_file.webp
``` 

你可以访问 [这个页面][18] 以获取更多关于上述工具和其他选项的信息。

### 结语

虽然 WebP 格式自首次发布以来已经有十年的时间了，Linux 桌面环境适应并支持 WebP 图像格式却并没有那么快。我相信以后 WebP 格式的支持应该会变成基本的，你甚至可能不需要进行额外的调整就能查看或保存 WebP 文件了。

我希望这篇文章可以帮你了解并掌握如何在工作流程中更好地使用 WebP 格式。

那么，你现在是怎么处理 WebP 格式图像的呢？欢迎在下方评论区分享你的经验。

*（题图：MJ/2541dab1-f071-4836-a34e-81c085c4d1ff）*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/view-webp-ubuntu-linux/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/07/WebP-Logo.jpg
[2]: https://developers.google.com/speed/webp
[3]: https://docs.gtk.org/gdk-pixbuf/
[4]: https://software.opensuse.org/package/webp-pixbuf-loader
[5]: https://archlinux.org/packages/community/x86_64/webp-pixbuf-loader/
[6]: https://i0.wp.com/www.debugpoint.com/wp-content/uploads/2022/07/GNOME-Files-Nautilus-with-WebP-file-before.png?ssl=1
[7]: https://i0.wp.com/www.debugpoint.com/wp-content/uploads/2022/07/GNOME-Files-Nautilus-with-WebP-file-after.png?ssl=1
[8]: https://www.debugpoint.com/wp-content/uploads/2022/07/Thunar-and-Ristretto-Image-Viewer-shows-webp-image.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/07/Dolphin-and-Gwenview-displays-a-sample-WebP-image-in-KDE-Plasma.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/07/PCManFM-Qt-and-LXImage.jpg
[11]: https://www.debugpoint.com/linux-mint/
[12]: https://debugpointnews.com/linux-mint-21-systemd-oom/
[13]: https://interversehq.com/qview/download/
[14]: https://flathub.org/apps/details/org.gnome.gThumb
[15]: https://www.debugpoint.com/libreoffice-7-4/
[16]: https://cgit.freedesktop.org/libreoffice/core/commit/?id=60eaa424c5e213f31227008e1ed66a646491a360
[17]: https://storage.googleapis.com/downloads.webmproject.org/releases/webp/index.html
[18]: https://developers.google.com/speed/webp/download
