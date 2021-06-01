[#]: subject: (An Open-Source App to Control All Your RGB Lighting Settings)
[#]: via: (https://itsfoss.com/openrgb/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13377-1.html)

OpenRGB：一个控制所有 RGB 灯光设置的开源应用
======

> OpenRGB 是一个有用的开源工具，可以一个工具管理所有的 RGB 灯光。让我们来了解一下它。

![](https://img.linux.net.cn/data/attachment/album/202105/10/113851zqod756ft373tz36.jpg)

无论是你的键盘、鼠标、CPU 风扇、AIO，还是其他连接的外围设备或组件，Linux 都没有官方软件支持来控制 RGB 灯光。

而 OpenRGB 似乎是一个适用于 Linux 的多合一 RGB 灯光控制工具。

### OpenRGB：多合一的 RGB 灯光控制中心

![][1]

是的，你可能会找到不同的工具来调整设置，如 **Piper** 专门 [在 Linux 上配置游戏鼠标][2]。但是，如果你有各种组件或外设，要把它们都设置成你喜欢的 RGB 颜色，那将是一件很麻烦的事情。

OpenRGB 是一个令人印象深刻的工具，它不仅专注于 Linux，也可用于 Windows 和 MacOS。

它不仅仅是一个将所有 RGB 灯光设置放在一个工具下的想法，而是旨在摆脱所有需要安装来调整灯光设置的臃肿软件。

即使你使用的是 Windows 系统的机器，你可能也知道像 Razer Synapse 这样的软件工具是占用资源的，并伴随着它们的问题。因此，OpenRGB 不仅仅局限于 Linux 用户，还适用于每一个希望调整 RGB 设置的用户。

它支持大量设备，但你不应该期待对所有设备的支持。

### OpenRGB 的特点

![][3]

它在提供简单的用户体验的同时，赋予了你许多有用的功能。其中的一些特点是：

  * 轻便的用户界面
  * 跨平台支持
  * 能够使用插件扩展功能
  * 设置颜色和效果
  * 能够保存和加载配置文件
  * 查看设备信息
  * 连接 OpenRGB 的多个实例，在多台电脑上同步灯光

![][4]

除了上述所有的特点外，你还可以很好地控制照明区域、色彩模式、颜色等。

### 在 Linux 中安装 OpenRGB

你可以在其官方网站上找到 AppImage 文件和 DEB 包。对于 Arch Linux 用户，你也可以在 [AUR][5] 中找到它。

如需更多帮助，你可以参考我们的 [AppImage 指南][6]和[安装 DEB 文件的方法][7]来设置。

官方网站应该也可以让你下载其他平台的软件包。但是，如果你想探索更多关于它的信息或自己编译它，请前往它的 [GitLab 页面][8]。

- [OpenRGB][9]

### 总结

尽管我没有很多支持 RGB 的设备/组件，但我可以成功地调整我的罗技 G502 鼠标。

如果你想摆脱多个应用，用一个轻量级的界面来管理你所有的 RGB 灯光，我肯定会推荐你试一试。

你已经试过它了吗？欢迎在评论中分享你对它的看法！

--------------------------------------------------------------------------------

via: https://itsfoss.com/openrgb/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/openrgb.jpg?resize=800%2C406&ssl=1
[2]: https://itsfoss.com/piper-configure-gaming-mouse-linux/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/openrgb-supported-devices.jpg?resize=800%2C404&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/openrgb-logi.jpg?resize=800%2C398&ssl=1
[5]: https://itsfoss.com/aur-arch-linux/
[6]: https://itsfoss.com/use-appimage-linux/
[7]: https://itsfoss.com/install-deb-files-ubuntu/
[8]: https://gitlab.com/CalcProgrammer1/OpenRGB
[9]: https://openrgb.org/
