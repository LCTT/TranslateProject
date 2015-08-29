用这些专用工具让你截图更简单
================================================================================
“一图胜千言”，这句二十世纪早期在美国应运而生的名言，说的是一张单一的静止图片所蕴含的信息足以匹敌大量的描述性文字。本质上说，图片所传递的信息量的确是比文字更有效更高效。

截图（或抓帧）是一种捕捉自计算机的快照或图片，用来记录可视设备的输出。屏幕捕捉软件能从计算机中获取到截图。此类软件有很多用处，因为一张图片能很好地说明计算机软件的操作，截图在软件开发过程和文档中扮演了一个很重要的角色。或者，如果你的电脑有了技术性问题，一张截图能让技术支持理解你碰到的这个问题。要写好计算机相关的文章、文档和教程，没有一款好的截图工具是几乎不可能的。如果你想保存你放在屏幕上的一些零星的信息，特别是不方便打字时，截图也很有用。

在开源世界，Linux有许多专注于截图功能的工具供选择，基于图形的和控制台的都有。如果要说一个功能丰富的专用截图工具，看起来没有能超过Shutter的。这款工具是小型开源工具的杰出代表，但是也有其它的不错替代品可以选择。

屏幕捕捉功能不仅仅只有专门的工具提供，GIMP和ImageMagick这两款主攻图像处理的工具，也能提供像样的屏幕捕捉功能。


### Shutter ###

![Shutter in action](http://www.linuxlinks.com/portal/content/reviews/Graphics/Screenshot-Shutter1.png)

Shutter是一款功能丰富的截图软件。你可以对特定区域、窗口、整个屏幕甚至是网站截图 - 并为其应用不同的效果，比如用高亮的点在上面绘图，然后上传至一个图片托管网站，一切尽在这个小窗口内。

包含特性：

- 截图范围：
    - 一个特定区域
    - 窗口
    - 完整的桌面
    - 脚本生成的网页
- 在截图中应用不同效果
- 热键
- 打印
- 直接截图或指定延迟时间截图
- 将截图保存至一个指定目录并用一个简便方法重命名它（用指定通配符）
- 完全集成在GNOME桌面中（TrayIcon等等）
- 当你截了一张图并根据尺寸的百分比直接生成缩略图
- Shutter会话集：
    - 跟踪会话中所有的截图
    - 复制截图至剪贴板
    - 打印截图
    - 删除截图
    - 重命名文件
- 直接上传你的文件至图像托管网站（比如 http://ubuntu-pics.de ），得到链接并将它们与其他人分享
- 用内置的绘画工具直接编辑截图

--- 

- 主页： [shutter-project.org][1]
- 开发者： Mario Kemper和Shutter团队
- 许可证： GNU GPL v3
- 版本号： 0.93.1


### HotShots ###

![HotShots in action](http://www.linuxlinks.com/portal/content/reviews/Graphics/Screenshot-HotShots.png)

HotShots是一款捕捉屏幕并能以各种图片格式保存的软件，同时也能添加注释和图形数据（箭头、行、文本 ...）。

你也可以把你的作品上传到网上（FTP/一些web服务），HotShots是用Qt开发而成的。

HotShots无法从Ubuntu的Software Center中获取，不过用以下命令可以轻松地来安装它：

    sudo add-apt-repository ppa:ubuntuhandbook1/apps     
    sudo apt-get update
    sudo apt-get install hotshots

包含特性：

- 简单易用
- 功能完整
- 内置编辑器
- 热键
- 内置放大功能
- 手动控制和多屏捕捉
- 支持输出格式：Black & Whte (bw), Encapsulated PostScript (eps, epsf), Encapsulated PostScript Interchange (epsi), OpenEXR (exr), PC Paintbrush Exchange (pcx), Photoshop Document (psd), ras, rgb, rgba, Irix RGB (sgi), Truevision Targa (tga), eXperimental Computing Facility (xcf), Windows Bitmap (bmp), DirectDraw Surface (dds), Graphic Interchange Format (gif), Icon Image (ico), Joint Photographic Experts Group 2000 (jp2), Joint Photographic Experts Group (jpeg, jpg), Multiple-image Network Graphics (mng), Portable Pixmap (ppm), Scalable Vector Graphics (svg), svgz, Tagged Image File Format (tif, tiff), webp, X11 Bitmap (xbm), X11 Pixmap (xpm), and Khoros Visualization (xv)
- 国际化支持：巴斯克语、中文、捷克语、法语、加利西亚语、德语、希腊语、意大利语、日语、立陶宛语、波兰语、葡萄牙语、罗马尼亚语、俄罗斯语、塞尔维亚语、僧伽罗语、斯洛伐克语、西班牙语、土耳其语、乌克兰语和越南语

---

- 主页： [thehive.xbee.net][2]
- 开发者 xbee
- 许可证： GNU GPL v2
- 版本号： 2.2.0

### ScreenCloud ###

![ScreenCloud in action](http://www.linuxlinks.com/portal/content/reviews/Graphics/Screenshot-ScreenCloud.png)

ScreenCloud是一款易于使用的开源截图工具。

在这款软件中，用户可以用三个热键之一或只需点击ScreenCloud托盘图标就能进行截图，用户也可以自行选择保存截图的地址。

如果你选择上传你的截图到screencloud网站，链接会自动复制到你的剪贴板上，你能通过email或在一个聊天对话框里和你的朋友同事分享它，他们肯定会点击这个链接来看你的截图的。

包含特性：

- 捕捉整个屏幕，窗口和截选区域
- 快速又简单：截取图片，粘贴链接，完成
- 免费托管你的截图
- 热键
- 设置定时器延迟
- 允许 '捕捉窗口边框'
- 启用/禁用通知
- 设置开机自启动
- 调整账户/上传/文件名/快捷方式的设置
- 跨平台工具
- 插件支持：保存至Dropbox，Imgur等等
- 支持上传至FTP和SFTP服务器

---

- 主页： [screencloud.net][3]
- 开发者： Olav S Thoresen
- 许可证： GNU GPL v2
- 版本号： 1.2.1

### KSnapshot ###

![KSnapShot in action](http://www.linuxlinks.com/portal/content/reviews/Graphics/Screenshot-KSnapshot.png)

KSnapshot也是一款易于使用的截图工具，它能给整个桌面、单一窗口、窗口的一部分或一块所选区域捕捉图像。图像能以各种不同格式保存。

KSnapshot也允许用户用热键来进行截图。除了保存截图之外，它也可以被复制到剪贴板或用任何与图像文件关联的程序打开。

KSnapshot是KDE 4图形模块的一部分。

包含特性：

- 以多种格式保存截图
- 延迟截图
- 剔除窗口装饰（边框、菜单等）
- 复制截图至剪贴板
- 热键
- 能用它的D-Bus接口进行脚本化

---

- 主页： [www.kde.org][4]
- 开发者： KDE, Richard J. Moore, Aaron J. Seigo, Matthias Ettrich
- 许可证： GNU GPL v2
- 版本号： 0.8.2

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/2015062316235249/ScreenCapture.html

译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://shutter-project.org/
[2]:http://thehive.xbee.net/
[3]:https://screencloud.net/
[4]:https://www.kde.org/applications/graphics/ksnapshot/
