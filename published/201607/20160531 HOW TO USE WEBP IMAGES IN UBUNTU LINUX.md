在 Ubuntu Linux 中使用 WebP 图片
=========================================

![](http://itsfoss.com/wp-content/uploads/2016/05/support-webp-ubuntu-linux.jpg)

> 简介：这篇指南会向你展示如何在 Linux 下查看 WebP 图片以及将 WebP 图片转换为 JPEG 或 PNG 格式。

### 什么是 WebP？

自从 Google 推出 [WebP 图片格式][0]，已经过去五年了。Google 说，WebP 提供有损和无损压缩，相比 JPEG 压缩，WebP 压缩文件大小，能更小约 25%。

Google 的目标是让 WebP 成为 web 图片的新标准，但是并没有成为现实。已经五年过去了，除了谷歌的生态系统以外它仍未被接受成为一个标准。但正如我们所知的，Google 对它的技术很有进取心。几个月前 Google 将 Google Plus 的所有图片改为了 WebP 格式。

如果你用 Google Chrome 从 Google Plus 上下载那些图片，你会得到 WebP 图片，不论你之前上传的是 PNG 还是 JPEG。这都不是重点。真正的问题在于当你尝试着在 Ubuntu 中使用默认的 GNOME 图片查看器打开它时你会看到如下错误：

> **Could not find XYZ.webp（无法找到 XYZ.webp）**

> **Unrecognized image file format（未识别文件格式）**

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-1.png)

*GNOME 图片查看器不支持 WebP 图片*

在这个教程里，我们会看到

- 如何在 Linux 中添加 WebP 支持
- 支持 WebP 图片的程序列表
- 如何将 WebP 图片转换到 PNG 或 JPEG
- 如何将 WebP 图片直接下载为 PNG 格式

### 如何在 Ubuntu 以及其它 Linux 发行版中查看 WebP 图片

[GNOME 图片查看器][3]是许多 Linux 发行版的默认图片查看器，包括 Ubuntu，它不支持 WebP 图片。目前也没有可用的插件给 GNOME 图片查看器添加 WebP 支持。

这无非是意味着我们不能在 Linux 上用 GNOME 图片查看器打开 WebP 文件而已。一个更好的替代品，[gThumb][4]，默认就支持 WebP 图片。

要在 Ubuntu 以及其它基于 Ubuntu 的发行版上安装 gThumb 的话，使用以下命令：

```
sudo apt-get install gthumb
```

一旦安装完成，你就可以简单地右键点击 WebP 图片，选择 gThumb 来打开它。你现在应该可以看到如下画面：

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-2.jpeg)

*gThumb 中显示的 WebP 图片*

### 让 gThumb 成为 Ubuntu 中 WebP 图片的默认应用

对 Ubuntu 新手而言，如果你想要让 gThumb 成为打开 WebP 文件的默认应用，跟着以下步骤操作：

#### 步骤 1：右键点击 WebP 文件选择属性。

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-3.png)

*从右键菜单中选择属性*

#### 步骤 2：转到打开方式标签，选择 gThumb 并点击设置为默认。

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-4.png)

*让 gThumb 成为 Ubuntu 中 WebP 图片的默认应用*

### 让 gThumb 成为所有图片的默认应用

gThumb 的功能比图片查看器更多。举个例子，你可以做一些简单的图片编辑，给图片添加滤镜等。添加滤镜的效率没有 XnRetro（在[ Linux 下添加类似 Instagram 滤镜效果][5]的专用工具）那么高，但它还是有一些基础的滤镜可以用。

我非常喜欢 gThumb 并且决定让它成为默认的图片查看器。如果你也想在 Ubuntu 中让 gThumb 成为所有图片的默认应用，遵照以下步骤操作：

步骤1：打开系统设置

![](http://itsfoss.com/wp-content/uploads/2014/04/System_Settings_ubuntu_1404.jpeg)

步骤2：转到详情（Details）

![](http://itsfoss.com/wp-content/uploads/2013/11/System_settings_Ubuntu_1.jpeg)

步骤3：在这里将 gThumb 设置为图片的默认应用

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-5.png)

### Linux 上打开 WebP 文件的替代程序

可能你不喜欢 gThumb。如果这样的话，你可以选择下列应用来在 Linux 中查看 WebP 图片：

- [XnView][6]（非开源）
- GIMP 加上非官方 WebP 插件，可以从这个 [PPA][7] 安装，支持到 Ubuntu 15.10。我会在另一篇文章里提到。
- [Gwenview][8]

### 在 Linux 中将 WebP 图片转换为 PNG 和 JPEG

在 Linux 上转换 WebP 图片有两种途径：

- 命令行
- 图形界面

#### 1.在 Linux 使用命令行转换 WebP 图片

你需要先安装 WebP 工具。打开终端并使用下列命令：

```
sudo apt-get install webp
```

##### 将 JPEG/PNG 转换为 WebP

我们将使用 cwebp 命令（它代表转换为 WebP 的意思吗？）来将 JPEG 或 PNG 文件转换为 WebP。命令格式是这样的：

```
cwebp -q [图片质量] [JPEG/PNG_文件名] -o [WebP_文件名]
```

举个例子，你可以使用下列命令：

```
cwebp -q 90 example.jpeg -o example.webp
```

##### 将 WebP 转换为 JPEG/PNG

要将 WebP 图片转换为 JPEG 或 PNG，我们将使用 dwebp 命令。命令格式是：

```
dwebp [WebP_文件名] -o [PNG_文件名]
```

该命令的一个例子：

```
dwebp example.webp -o example.png
```

#### 2.使用图形工具将 WebP 转换为 JPEG/PNG

要实现这个目标，我们要使用 XnConvert，它是免费的应用但不是开源的。你可以从他们的网站上下载安装文件：

[下载 XnConvert][1]

XnConvert 是个强大的工具，你可以用它来批量修改图片尺寸。但在这个教程里，我们只介绍如何将单个 WebP 图片转换为 PNG/JPEG。

打开 XnConvert 并选择输入文件：

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-6.jpeg)

在输出标签，选择你想要的输出格式。选择完后点击转换。

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-7.jpeg)

要将 WebP 图片转换为 PNG，JPEG 或其它你选择的图片格式，这就是你所需要做的一切了。

### 在 Chrome 浏览器中直接将 WebP 图片下载为 PNG

也许你一点都不喜欢 WebP 图片格式，也不想在 Linux 仅仅为了查看 WebP 图片而安装一个新软件。如果你不得不将 WebP 文件转换以备将来使用，这会是件更痛苦的事情。

解决这个问题的一个更简单、不那么痛苦的途径是安装一个 Chrome 扩展 Save Image as PNG。有了这个插件，你可以右键点击 WebP 图片并直接存储为 PNG 格式。

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-8.png)

*在 Google Chrome 中将 WebP 图片保存为 PNG 格式*

- [获取 Save Image as PNG 扩展][2]

### 你的选择是？

我希望这个详细的教程能够帮你在 Linux 上支持 WebP 并帮你转换 WebP 图片。你在 Linux 怎么处理 WebP 图片？你使用哪个工具？以上描述的方法中，你最喜欢哪一个？

----------------------
via: http://itsfoss.com/webp-ubuntu-linux/

作者：[Abhishek Prakash][a]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://itsfoss.com/author/abhishek/
[0]: https://developers.google.com/speed/webp/
[1]: http://www.xnview.com/en/xnconvert/#downloads
[2]: https://chrome.google.com/webstore/detail/save-image-as-png/nkokmeaibnajheohncaamjggkanfbphi?utm_source=chrome-ntp-icon
[3]: https://wiki.gnome.org/Apps/EyeOfGnome
[4]: https://wiki.gnome.org/Apps/gthumb
[5]: http://itsfoss.com/add-instagram-effects-xnretro-ubuntu-linux/
[6]: http://www.xnview.com/en/xnviewmp/#downloads
[7]: https://launchpad.net/~george-edison55/+archive/ubuntu/webp
[8]: https://userbase.kde.org/Gwenview
