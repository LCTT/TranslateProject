[#]: subject: "Crop and resize photos on Linux with Gwenview"
[#]: via: "https://opensource.com/article/22/2/crop-resize-photos-gwenview-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14550-1.html"

用 Gwenview 在 Linux 上裁剪和调整照片大小
======

> Gwenview 是一个优秀的照片编辑器，适合业余摄影师在 Linux KDE 桌面上使用。

![](https://img.linux.net.cn/data/attachment/album/202205/05/221207dtkjbbe1jets7n3u.jpg)

一张好的照片可以蕴含很多信息。表面上它表达了你所看到的，但它也讲述了你所经历的。细微之处也能说明很多问题：你在拍照时选择的角度、取景中隐约可见的的东西有多大，以及，相比之下，那些有意识选择忽略的部分。

照片通常并不意味着记录真实发生的事情，相反，它们会成为你（摄影师）如何看待发生的事情的洞察力。

这就是照片编辑如此普遍的原因之一。当你把照片发布到你的在线图片库或社交网络时，你不应该发布一张不能准确表达照片所包含的感受的照片。但同样的道理，你也不应该成为一个专业的照片合成师，而只是为了剪掉在最后时刻将头伸进你的家庭快照的路人。如果你使用的是 KDE，你可以使用 Gwenview 这种休闲照片编辑器。

### 在 Linux 上安装 Gwenview

如果你正在运行 KDE Plasma 桌面，你可能已经安装了 Gwenview。如果你没有安装，或者你正在使用一个不同的桌面，而你想尝试 Gwenview，那么你可以用你的软件包管理器安装它。

我建议同时安装 Gwenview 和 Kipi 插件集，它可以将 Gwenview 与几个在线照片服务连接起来，这样你就可以轻松上传照片。在 Fedora、Mageia 和类似发行版上：

```
$ sudo dnf install gwenview kipi-plugins
```

在 Debian、Elementary 和类似版本上：

```
$ sudo apt install gwenview kipi-plugins
```

### 使用 Gwenview

Gwenview 通常有两种启动方式。你可以在 Dolphin 中点击图片文件，并选择在 Gwenview 中打开它；或者你可以启动 Gwenview，并在文件夹中寻找照片，Gwenview 或多或少可以充当你的文件管理器。第一种方法是直接的方法，很适合快速方便地预览图片文件。第二种方法是当你浏览大量照片，不确定哪一个版本的照片是“正确的”时，你可能会使用。

无论你如何启动 Gwenview，界面和功能都是一样的：右边有一个工作区，左边有一个面板。

![Gwenview][2]

（Seth Kenlon [CC BY-SA 4.0][3], Photo courtesy [Andrea De Santis][4]）

在左边的面板下面，有三个标签：

  * <ruby>文件夹<rt>Folders</rt></ruby>：显示你电脑上的文件夹的树状视图，以便你可以浏览你的文件，寻找更多的照片。
  * <ruby>信息<rt>Information</rt></ruby>：提供关于你目前正在查看的照片的元数据。
  * <ruby>操作<rt>Operations</rt></ruby>：允许你对当前的照片进行小的修改，如在横向和纵向之间旋转、调整大小和裁剪等。

Gwenview 能理解文件系统，所以你可以按键盘上的**右**或**左**箭头，查看文件夹中的上一张或下一张照片。

要离开单张照片视图并查看一个文件夹中的所有图片，请点击顶部工具栏中的“<ruby>浏览<rt>Browse</rt></ruby>”按钮。

![Browsing photos in a folder][5]

（Seth Kenlon，[CC BY-SA 4.0][3]）

你也可以同时拥有两种视图。点击 Gwenview 底部的“<ruby>缩略图栏<rt>Thumbnail Bar</rt></ruby>”按钮，可以以电影胶片的形式看到当前文件夹中的其他图片，而当前选择的照片则在主面板中。

![Thumbnail view][6]

（Seth Kenlon，[CC BY-SA 4.0][3]）

### 用 Gwenview 编辑照片

数码照片是很常见的，因此在网上发布或与朋友分享之前，需要对照片进行细微的调整也是同样常见。有非常好的应用可以编辑照片，事实上，其中最好的一个是另一个 KDE 应用，叫做 Krita（你可以在我的 [给摄影者的 Krita][7] 文章中阅读我如何使用它来处理照片），但是小的调整不应该需要艺术学位。这正是 Gwenview 所确保的：用一个休闲但功能强大的应用进行简单而快速的照片调整，并与你的 Plasma 桌面的其他部分整合。

我们大多数人对照片进行的最常见的调整是：

  * **旋转**：当你的相机没有提供正确的元数据让你的电脑知道一张照片是要以横向还是纵向观看时，你可以手动修复它。
  * **镜像**：许多笔记本电脑或面部摄像头模仿镜子，这很有用，因为这是我们习惯于看到自己的方式。但是，它会使文字逆转。**镜像**功能可以从右到左翻转图像。
  * **翻转**：在数码相机和笔记本电脑上不太常见，但在手机上，无论你怎么拿手机，使用倒置设备拍照的现象在屏幕翻转的手机中并不少见。**翻转**功能可将图像旋转 180 度。
  * **调整大小**：数字图像现在通常具有超高清尺寸，有时这比你需要的要多得多。如果你通过电子邮件发送照片或将其发布在你想要优化加载时间的网页上，你可以将尺寸（和相应的文件大小）缩小到更小的尺寸。
  * **裁剪**：你有一张很棒的自己的照片，但不小心偶然发现了一个你认为不合适的人。用裁剪工具剪掉你不想要的所有东西。
  * **红眼**：当你的视网膜将相机的闪光灯反射回相机时，会得到红眼效果。Gwenview 可以通过在可调节区域中对红色通道进行去饱和和变暗来减少这种情况。

所有这些工具都在“<ruby>操作<rt>Operations</rt></ruby>”侧面板或“<ruby>编辑<rt>Edit</rt></ruby>”菜单中可用。这些操作具有破坏性，因此在你进行更改后，单击“<ruby>另存为<rt>Save As</rt></ruby>”以保存图像的 _副本_。

![Cropping a photo in Gwenview][8]

（Seth Kenlon，[CC BY-SA 4.0][3]，照片由 [Elise Wilcox][9] 提供)

### 分享照片

当你准备好分享照片时，单击顶部工具栏中的“<ruby>分享<rt>Share</rt></ruby>”按钮，或转到“<ruby>插件<rt>Plugins</rt></ruby>”菜单并选择“<ruby>导出<rt>Export</rt></ruby>”。Gwenview 与 Kipi 插件集成在一起，可以在 [Nextcloud][10]、[Piwigo][11]、普通旧电子邮件以及 Google Drive、Flickr、Dropbox 等服务共享照片。

### Linux 上的照片编辑要点

Gwenview 拥有桌面照片管理器的所有必需功能。如果你需要的不仅仅是基本功能，你可以在 Krita 或 [Digikam][12] 中打开一张照片，并根据需要进行重大修改。对于其他一切，从浏览、排名、标记和小调整，Gwenview 都很方便。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/crop-resize-photos-gwenview-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/design_photo_art_polaroids.png?itok=SqPLgWxJ (Polaroids and palm trees)
[2]: https://opensource.com/sites/default/files/kde-gwenview-ui.jpg (Gwenview)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: http://unsplash.com/@santesson89
[5]: https://opensource.com/sites/default/files/kde-gwenview-browse.jpg (Browsing photos in a folder)
[6]: https://opensource.com/sites/default/files/kde-gwenview-thumbnail.jpg (Thumbnail view)
[7]: https://opensource.com/article/21/12/open-source-photo-editing-krita
[8]: https://opensource.com/sites/default/files/kde-gwenview-crop.jpg (Cropping a photo in Gwenview)
[9]: http://unsplash.com/@elise_outside
[10]: https://opensource.com/article/20/7/nextcloud
[11]: https://opensource.com/alternatives/google-photos
[12]: https://opensource.com/life/16/5/how-use-digikam-photo-management
