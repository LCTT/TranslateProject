使用 LSWC 在 Linux 中自动更改壁纸
======

> 简介：这是一个小脚本，可以在 Linux 桌面上定期自动更改壁纸。

顾名思义，LittleSimpleWallpaperChanger （LSWC）是一个小脚本，可以定期地随机更改壁纸。

我知道在“外观”或“更改桌面背景”设置中有一个随机壁纸选项。但那是随机更改预置的壁纸而不是你添加的壁纸。

因此，在本文中，我们将看到如何使用 LittleSimpleWallpaperChanger 设置包含照片的随机桌面壁纸。

### Little Simple Wallpaper Changer (LSWC)

[LittleSimpleWallpaperChanger][1] （LSWC） 是一个非常轻量级的脚本，它在后台运行，从用户指定的文件夹中更改壁纸。壁纸以 1 至 5 分钟的随机间隔变化。该软件设置起来相当简单，设置完后，用户就可以不用再操心了。

![Little Simple Wallpaper Changer to change wallpapers in Linux][2]

#### 安装 LSWC

[点此链接下载 LSWC][3]。压缩文件的大小约为 15KB。

  * 进入下载位置。
  * 右键单击下载的 .zip 文件，然后选择“在此处解压”。
  * 打开解压后的文件夹，右键单击并选择“在终端中打开”。
  * 在终端中复制粘贴命令 `bash ./README_and_install.sh` 并按回车键。
  * 然后会弹出一个对话框，要求你选择包含壁纸的文件夹。单击它，然后选择你存放壁纸的文件夹。
  * 就是这样。然后重启计算机。

![Little Simple Wallpaper Changer for Linux][4]

#### 使用 LSWC

安装时，LSWC 会要求你选择包含壁纸的文件夹。因此，我建议你在安装 LSWC 之前创建一个文件夹并将你想要的壁纸全部移动到那。或者你可以使用图片文件夹中的“壁纸”文件夹。**所有壁纸都必须是 .jpg 格式。**

你可以添加更多壁纸或从所选文件夹中删除当前壁纸。要更改壁纸文件夹位置，你可以从以下文件中编辑壁纸的位置。

```
.config/lswc/homepath.conf
```

#### 删除 LSWC

打开终端并运行以下命令以停止 LSWC：

```
pkill lswc
```

在文件管理器中打开家目录，然后按 `Ctrl+H` 显示隐藏文件，接着删除以下文件：

  * `.local` 中的 `scripts` 文件夹
  * `.config` 中的 `lswc` 文件夹
  * `.config/autostart` 中的 `lswc.desktop` 文件

这就完成了。创建自己的桌面背景幻灯片。LSWC 非常轻巧，易于使用。安装它然后忘记它。

LSWC 功能不是很丰富，但这是有意的。它做了它打算做的事情，那就是更换壁纸。如果你想要一个自动下载壁纸的工具试试 [WallpaperDownloader][5]。

请在下面的评论栏分享你对这个漂亮的小软件的想法。别忘了分享这篇文章。干杯。

--------------------------------------------------------------------------------

via: https://itsfoss.com/little-simple-wallpaper-changer/

作者：[Aquil Roshan][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/aquil/
[1]:https://github.com/LittleSimpleWallpaperChanger/lswc
[2]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/Little-simple-wallpaper-changer-2-800x450.jpg
[3]:https://github.com/LittleSimpleWallpaperChanger/lswc/raw/master/Lswc.zip
[4]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/Little-simple-wallpaper-changer-1-800x450.jpg
[5]:https://itsfoss.com/wallpaperdownloader-linux/
