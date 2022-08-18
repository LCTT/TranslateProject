[#]: subject: "3 ways to take screenshots on Linux"
[#]: via: "https://opensource.com/article/22/8/screenshots-linux"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14943-1.html"

在 Linux 上截屏的 3 种方法
======

> 使用我最喜欢的工具在 Linux 上截屏，可以节省时间。

![](https://img.linux.net.cn/data/attachment/album/202208/18/172307e5du1dxqd66d66cm.jpg)

在写开源软件时，我更喜欢展示一些截图来帮助演示我在说什么。古语有云，一图胜千言。如果你能展示一件事，那通常比试图用言语描述它要好。

有几种方法可以在 Linux 中截图。以下是我在 Linux 上用于捕获截图的三种方法：

### 1、GNOME

GNOME 有一个很棒的内置截图工具。只需按下键盘上的 `PrtScr` 键，GNOME 就会显示一个截图对话框：

![Image of GNOME screenshot tool][2]

默认操作是抓取区域的截图。这是一种在你制作截图时裁剪截图的非常有用的方法。只需将高亮显示框移动到你需要的位置，然后使用“抓取”角来更改大小。或选择其他图标之一以截取整个屏幕或系统上的单个窗口。点击“圆圈”图标进行截图，类似于手机上的“拍照”按钮。 GNOME 截图工具将截图保存在图片文件夹内的截图文件夹中。

### 2、GIMP

如果你需要更多截图选项，你可以使用流行的图像编辑器 GIMP 截图。要进行截图，请选择“<ruby>文件<rt>File</rt></ruby>”并选择“<ruby>创建<rt>Create</rt></ruby>”子菜单，然后选择“<ruby>截图<rt>Screenshot</rt></ruby>”。

![Image of the GIMP screenshot menu][3]

该对话框允许你截取单个窗口、整个屏幕或仅一个区域的屏幕截图。我喜欢这个工具可以让你设置一个延迟：选择窗口后多长时间，按下截图后多长时间。当我想截取菜单操作的截图时，我经常使用此功能，因此我有足够的时间去窗口打开菜单。

GIMP 将截图作为新图像打开，你可以对其进行编辑并保存到你喜欢的位置。

### 3、Firefox

如果你需要截取网站的截图，请尝试使用 Firefox 的内置截图程序。右键单击网页正文中的任意位置，然后从菜单中选择“<ruby>截图<rt>Take Screenshot</rt></ruby>”：

![Image of screenshot utility][4]

Firefox 切换到模态显示，并提示你单击或拖动页面以选择区域，或使用其中一个图标保存整个页面的副本，或仅在浏览器中可见的内容：

![Image of Firefox modal display][5]

当你在屏幕上移动鼠标时，你可能会注意到 Firefox 会高亮显示某些区域。这些是页面上的块元素，例如 `<div>` 或其他块元素。单击该元素以对其进行截图。 Firefox 将截图保存到你的下载文件夹，或你设置为“下载”位置的任何位置。

如果你尝试记录流程，那么截图可以为你节省大量时间。

尝试使用其中一种方法在 Linux 上截图。

（图片来源：Jim Hall，CC BY-SA 40）

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/screenshots-linux

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/browser_web_internet_website.png
[2]: https://opensource.com/sites/default/files/2022-07/screenshot-gnome.png
[3]: https://opensource.com/sites/default/files/2022-07/gimp-screenshot.png
[4]: https://opensource.com/sites/default/files/2022-07/firefox-screenshot_cropped_0.png
[5]: https://opensource.com/sites/default/files/2022-07/firefox-screenshot_1.png
