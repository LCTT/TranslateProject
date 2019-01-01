在 Linux 下截屏并编辑的最佳工具
======

> 有几种获取屏幕截图并对其进行添加文字、箭头等编辑的方法，这里提及的的屏幕截图工具在 Ubuntu 和其它主流 Linux 发行版中都能够使用。

![在 Ubuntu Linux 中如何获取屏幕截图][1]

当我的主力操作系统从 Windows 转换到 Ubuntu 的时候，首要考虑的就是屏幕截图工具的可用性。尽管使用默认的键盘快捷键也可以获取屏幕截图，但如果使用屏幕截图工具，可以更方便地对屏幕截图进行编辑。

本文将会介绍在不适用第三方工具的情况下，如何通过系统自带的方法和工具获取屏幕截图，另外还会介绍一些可用于 Linux 的最佳截图工具。

### 方法 1：在 Linux 中截图的默认方式

你想要截取整个屏幕？屏幕中的某个区域？某个特定的窗口？

如果只需要获取一张屏幕截图，不对其进行编辑的话，那么键盘的默认快捷键就可以满足要求了。而且不仅仅是 Ubuntu ，绝大部分的 Linux 发行版和桌面环境都支持以下这些快捷键：

- `PrtSc` – 获取整个屏幕的截图并保存到 Pictures 目录。
- `Shift + PrtSc` – 获取屏幕的某个区域截图并保存到 Pictures 目录。
- `Alt + PrtSc` –获取当前窗口的截图并保存到 Pictures 目录。
- `Ctrl + PrtSc` – 获取整个屏幕的截图并存放到剪贴板。
- `Shift + Ctrl + PrtSc` – 获取屏幕的某个区域截图并存放到剪贴板。
- `Ctrl + Alt + PrtSc` – 获取当前窗口的 截图并存放到剪贴板。

如上所述，在 Linux 中使用默认的快捷键获取屏幕截图是相当简单的。但如果要在不把屏幕截图导入到其它应用程序的情况下对屏幕截图进行编辑，还是使用屏幕截图工具比较方便。

### 方法 2：在 Linux 中使用 Flameshot 获取屏幕截图并编辑

![flameshot][2]

功能概述：

  * 注释 (高亮、标示、添加文本、框选)
  * 图片模糊
  * 图片裁剪
  * 上传到 Imgur
  * 用另一个应用打开截图

Flameshot 在去年发布到 [GitHub][3]，并成为一个引人注目的工具。

如果你需要的是一个能够用于标注、模糊、上传到 imgur 的新式截图工具，那么 Flameshot 是一个好的选择。

下面将会介绍如何安装 Flameshot 并根据你的偏好进行配置。

如果你用的是 Ubuntu，那么只需要在 Ubuntu 软件中心上搜索，就可以找到 Flameshot 进而完成安装了。要是你想使用终端来安装，可以执行以下命令：

```
sudo apt install flameshot
```

如果你在安装过程中遇到问题，可以按照[官方的安装说明][4]进行操作。安装完成后，你还需要进行配置。尽管可以通过搜索来随时启动 Flameshot，但如果想使用 `PrtSc` 键触发启动，则需要指定对应的键盘快捷键。以下是相关配置步骤：

  * 进入系统设置中的“键盘设置”
  * 页面中会列出所有现有的键盘快捷键，拉到底部就会看见一个 “+” 按钮
  * 点击 “+” 按钮添加自定义快捷键并输入以下两个字段：
    * “名称”： 任意名称均可。
    * “命令”： `/usr/bin/flameshot gui`
  * 最后将这个快捷操作绑定到  `PrtSc` 键上，可能会提示与系统的截图功能相冲突，但可以忽略掉这个警告。

配置之后，你的自定义快捷键页面大概会是以下这样：

![][5]

*将键盘快捷键映射到 Flameshot*

### 方法 3：在 Linux 中使用 Shutter 获取屏幕截图并编辑

![][6]

功能概述：

  * 注释 (高亮、标示、添加文本、框选)
  * 图片模糊
  * 图片裁剪
  * 上传到图片网站

[Shutter][7] 是一个对所有主流 Linux 发行版都适用的屏幕截图工具。尽管最近已经不太更新了，但仍然是操作屏幕截图的一个优秀工具。

在使用过程中可能会遇到这个工具的一些缺陷。Shutter 在任何一款最新的 Linux 发行版上最常见的问题就是由于缺少了任务栏上的程序图标，导致默认禁用了编辑屏幕截图的功能。 对于这个缺陷，还是有解决方案的。你只需要跟随我们的教程[在 Shutter 中修复这个禁止编辑选项并将程序图标在任务栏上显示出来][8]。问题修复后，就可以使用 Shutter 来快速编辑屏幕截图了。

同样地，在软件中心搜索也可以找到进而安装 Shutter，也可以在基于 Ubuntu 的发行版中执行以下命令使用命令行安装：

```
sudo apt install shutter
```

类似 Flameshot，你可以通过搜索 Shutter 手动启动它，也可以按照相似的方式设置自定义快捷方式以 `PrtSc` 键唤起 Shutter。

如果要指定自定义键盘快捷键，只需要执行以下命令：

```
shutter -f
```

### 方法 4：在 Linux 中使用 GIMP 获取屏幕截图

![][9]

功能概述：

  * 高级图像编辑功能（缩放、添加滤镜、颜色校正、添加图层、裁剪等）
  * 截取某一区域的屏幕截图

如果需要对屏幕截图进行一些预先编辑，GIMP 是一个不错的选择。

通过软件中心可以安装 GIMP。如果在安装时遇到问题，可以参考其[官方网站的安装说明][10]。

要使用 GIMP 获取屏幕截图，需要先启动程序，然后通过 “File-> Create-> Screenshot” 导航。

打开 Screenshot 选项后，会看到几个控制点来控制屏幕截图范围。点击 “Snap” 截取屏幕截图，图像将自动显示在 GIMP 中可供编辑。

### 方法 5：在 Linux 中使用命令行工具获取屏幕截图

这一节内容仅适用于终端爱好者。如果你也喜欢使用终端，可以使用 “GNOME 截图工具”或 “ImageMagick” 或 “Deepin Scrot”，大部分流行的 Linux 发行版中都自带这些工具。

要立即获取屏幕截图，可以执行以下命令：

#### GNOME 截图工具（可用于 GNOME 桌面）

```
gnome-screenshot
```

GNOME 截图工具是使用 GNOME 桌面的 Linux 发行版中都自带的一个默认工具。如果需要延时获取屏幕截图，可以执行以下命令（这里的 `5` 是需要延迟的秒数）：

```
gnome-screenshot -d -5
```

#### ImageMagick

如果你的操作系统是 Ubuntu、Mint 或其它流行的 Linux 发行版，一般会自带 [ImageMagick][11] 这个工具。如果没有这个工具，也可以按照[官方安装说明][12]使用安装源来安装。你也可以在终端中执行这个命令：

```
sudo apt-get install imagemagick
```

安装完成后，执行下面的命令就可以获取到屏幕截图（截取整个屏幕）：

```
import -window root image.png
```

这里的 “image.png” 就是屏幕截图文件保存的名称。

要获取屏幕一个区域的截图，可以执行以下命令:

```
import image.png
```

#### Deepin Scrot

Deepin Scrot 是基于终端的一个较新的截图工具。和前面两个工具类似，一般自带于 Linux 发行版中。如果需要自行安装，可以执行以下命令：

```
sudo apt-get install scrot
```

安装完成后，使用下面这些命令可以获取屏幕截图。

获取整个屏幕的截图：

```
scrot myimage.png
```

获取屏幕某一区域的截图：

```
scrot -s myimage.png
```

### 总结

以上是一些在 Linux 上的优秀截图工具。当然还有很多截图工具没有提及（例如用于 KDE 发行版的 [Spectacle][13]），但相比起来还是上面几个工具更为好用。

如果你有比文章中提到的更好的截图工具，欢迎讨论！

--------------------------------------------------------------------------------

via: https://itsfoss.com/take-screenshot-linux/

作者：[Ankush Das][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[1]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/Taking-Screenshots-in-Linux.png
[2]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/flameshot-pic.png
[3]: https://github.com/lupoDharkael/flameshot
[4]: https://github.com/lupoDharkael/flameshot#installation
[5]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/flameshot-config-default.png
[6]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/shutter-screenshot.jpg
[7]: http://shutter-project.org/
[8]: https://itsfoss.com/shutter-edit-button-disabled/
[9]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/gimp-screenshot.jpg
[10]: https://www.gimp.org/downloads/
[11]: https://www.imagemagick.org/script/index.php
[12]: https://www.imagemagick.org/script/install-source.php
[13]: https://www.kde.org/applications/graphics/spectacle/

