在 Linux 中轻松搜索和安装 Google Web 字体
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/Font-Finder-720x340.png)

Font Finder 是旧的 [Typecatcher][1] 的 Rust 实现，用于从 [Google 的字体存档][2]中轻松搜索和安装 Google Web 字体。它可以帮助你在 Linux 桌面上安装数百种免费和开源字体。如果你正在为你的 Web 项目和应用以及其他任何地方寻找好看的字体，Font Finder 可以轻松地为你提供。它是用 Rust 编程语言编写的自由、开源的 GTK3 应用程序。与使用 Python 编写的 Typecatcher 不同，Font Finder 可以按类别过滤字体，没有 Python 运行时依赖关系，并且有更好的性能和更低的资源消耗。

在这个简短的教程中，我们将看到如何在 Linux 中安装和使用 Font Finder。

### 安装 Font Finder

由于 Fond Finder 是使用 Rust 语言编写的，因此你需要向下面描述的那样在系统中安装 Rust。

安装 Rust 后，运行以下命令安装 Font Finder：

```
$ cargo install fontfinder
```

Font Finder 也可以从 [flatpak app][3] 安装。首先在你的系统中安装 Flatpak，如下面的链接所述。

然后，使用命令安装 Font Finder：

```
$ flatpak install flathub io.github.mmstick.FontFinder
```

### 在 Linux 中使用 Font Finder 搜索和安装 Google Web 字体

你可以从程序启动器启动 Font Finder，也可以运行以下命令启动它。

```
$ flatpak run io.github.mmstick.FontFinder
```

这是 Font Finder 默认界面的样子。

![][5]

正如你所看到的，Font Finder 的用户界面非常简单。所有 Google Web 字体都列在左侧窗格中，相应字体的预览显示在右侧窗格中。你可以在预览框中输入任何单词以查看单词在所选字体中的外观。在左上方还有一个搜索框，可以让你快速搜索你选择的字体。

默认情况下，Font Finder 显示所有类型的字体。但是，你可以通过搜索框上方的类别下拉框中的分类显示字体。

![][6]

要安装字体，只需选择它并点击顶部的 “Install” 按钮即可。

![][7]

你可以在任何文本处理程序中测试新安装的字体。

![][8]

同样，要删除字体，只需从 Font Finder 面板中选择它并单击 “Uninstall” 按钮。就这么简单！

左上角的设置按钮（齿轮按钮）提供了切换到暗色预览的选项。

![][9]

如你所见，Font Finder 非常简单，完全可以像在主页上宣传的那样完成工作。如果你正在寻找安装 Google Web 字体的程序，Font Finder 就是这样的一个程序。

今天就是这些。希望这有帮助。还有更好的东西。敬请关注！

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/font-finder-easily-search-and-install-google-web-fonts-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/install-google-web-fonts-ubuntu/
[2]:https://fonts.google.com/
[3]:https://flathub.org/apps/details/io.github.mmstick.FontFinder
[4]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]:http://www.ostechnix.com/wp-content/uploads/2018/04/font-finder-1.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/04/font-finder-2.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/04/font-finder-3.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/04/font-finder-5.png
[9]:http://www.ostechnix.com/wp-content/uploads/2018/04/font-finder-4.png
