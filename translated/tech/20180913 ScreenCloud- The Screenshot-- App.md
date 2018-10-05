ScreenCloud：一个增强的截屏程序
======

[ScreenCloud][1]是一个很棒的小程序，你甚至不知道你需要它。桌面 Linux 的默认屏幕截图流程很好（`PrtScr` 按钮），我们甚至有一些[强大的截图工具][2]，如 [Shutter][3]。但是，ScreenCloud 有一个非常简单但非常方便的功能，让我爱上了它。在我们深入它之前，让我们先看一个背景故事。

我截取了很多截图，远超常人。收据、注册详细信息、开发工作、文章中程序的截图等等。我接下来要做的就是打开浏览器，浏览我最喜欢的云存储并将重要的内容转储到那里，以便我可以在手机上以及 PC 上的多个操作系统上访问它们。这也让我可以轻松与我的团队分享我正在使用的程序的截图。

我对这个标准的截图流程没有抱怨，打开浏览器并登录我的云，然后手动上传屏幕截图，直到我遇到 ScreenCloud。

### ScreenCloud

ScreenCloud 是跨平台的程序，它提供轻松的屏幕截图功能和灵活的[云备份选项][4]管理。这包括使用你自己的 [FTP 服务器][5]。

![][6]

ScreenCloud 很顺滑，在细节上投入了大量的精力。它为你提供了非常容易记住的热键来捕获全屏、活动窗口或鼠标选择区域。

![][7]

*ScreenCloud 的默认键盘快捷键*

截取屏幕截图后，你可以设置 ScreenCloud 如何处理图像或直接将其上传到你选择的云服务。它甚至支持 SFTP。截图上传后（通常在几秒钟内），图像链接就会被自动复制到剪贴板，这让你可以轻松共享。

![][8]

你还可以使用 ScreenCloud 进行一些基本编辑。为此，你需要将 “Save to” 设置为 “Ask me”。此设置在应用图标菜单中有并且通常是默认设置。当使用它时，当你截取屏幕截图时，你会看到编辑文件的选项。在这里，你可以在屏幕截图中添加箭头、文本和数字。

![Editing screenshots with ScreenCloud][9]

*用 ScreenCloud 编辑截屏*

### 在 Linux 上安装 ScreenCloud

ScreenCloud 可在 [Snap 商店][10]中找到。因此，你可以通过访问 [Snap 商店][12]或运行以下命令，轻松地将其安装在 Ubuntu 和其他[启用 Snap][11] 的发行版上。

```
sudo snap install screencloud
```

对于无法通过 Snap 安装程序的 Linux 发行版，你可以[在这里][1]下载 AppImage。进入下载文件夹，右键单击并在那里打开终端。然后运行以下命令。

```
sudo chmod +x ScreenCloud-v1.4.0-x86_64.AppImage
```

然后，你可以通过双击下载的文件来启动程序。

![][13]

### 总结

ScreenCloud 适合所有人吗？可能不会。它比默认屏幕截图更好吗？可能是。如果你正在截某些屏幕，有可能它是重要的或是你想分享的。ScreenCloud 可以更轻松，更快速地备份或共享屏幕截图。所以，如果你想要这些功能，你应该试试 ScreenCloud。

欢迎在用下面的评论栏提出你的想法和意见。还有不要忘记与朋友分享这篇文章。干杯。

--------------------------------------------------------------------------------

via: https://itsfoss.com/screencloud-app/

作者：[Aquil Roshan][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/aquil/
[1]: https://screencloud.net
[2]: https://itsfoss.com/take-screenshot-linux/
[3]: http://shutter-project.org
[4]: https://itsfoss.com/cloud-services-linux/
[5]: https://itsfoss.com/set-ftp-server-linux/
[6]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/screencloud3.jpg
[7]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/screencloud2.jpg
[8]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/ScrenCloud6.jpg
[9]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/editing-with-screencloud.png
[10]: https://snapcraft.io/
[11]: https://itsfoss.com/install-snap-linux/
[12]: https://snapcraft.io/screencloud
[13]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/ScrenCloud4.jpg
