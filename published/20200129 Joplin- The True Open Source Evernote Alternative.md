[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11896-1.html)
[#]: subject: (Joplin: The True Open Source Evernote Alternative)
[#]: via: (https://itsfoss.com/joplin/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Joplin：真正的 Evernote 开源替代品
======

> Joplin 是一个开源笔记记录和待办应用。你可以将笔记组织到笔记本中并标记它们。Joplin 还提供网络剪贴板来保存来自互联网的文章。

### Joplin：开源笔记管理器

![][4]

如果你喜欢 [Evernote][2]，那么你不会不太适应这个开源软件 [Joplin][3]。

Joplin 是一个优秀的开源笔记应用，拥有丰富的功能。你可以记笔记、记录待办事项并且通过和 Dropbox 和 NextCloud 等云服务链接来跨设备同步笔记。同步过程通过端到端加密保护。

Joplin 还有一个 Web 剪贴板，能让你将网页另存为笔记。这个网络剪贴板可用于 Firefox 和 Chrome/Chromium 浏览器。

Joplin 可以导入 enex 格式的 Evernote 文件，这让从 Evernote 切换变得容易。

因为数据自行保存，所以你可以用 Joplin 格式或者原始格式导出所有文件。

### Joplin 的功能

![][1]

以下是 Joplin 的所有功能列表：

* 将笔记保存到笔记本和子笔记本中，以便更好地组织
* 创建待办事项清单
* 可以标记和搜索笔记
* 离线优先，因此即使没有互联网连接，所有数据始终在设备上可用
* Markdown 笔记支持图片、数学符号和复选框
* 支持附件
* 可在桌面、移动设备和终端（CLI）使用
* 可在 Firefox 和 Chrome 使用[网页剪切板][5]
* 端到端加密
* 保留笔记历史
* 根据名称、时间等对笔记进行排序
* 可与 [Nextcloud][7]、Dropbox、WebDAV 和 OneDrive 等各种[云服务][6]同步
* 从 Evernote 导入文件
* 导出 JEX 文件（Joplin 导出格式）和原始文件
* 支持笔记、待办事项、标签和笔记本
* 任意跳转功能
* 支持移动设备和桌面应用通知
* 地理位置支持
* 支持多种语言
* 外部编辑器支持：在 Joplin 中一键用你最喜欢的编辑器打开笔记

### 在 Linux 和其它平台上安装 Joplin

![][10]

[Joplin][11] 是一个跨平台应用，可用于 Linux、macOS 和 Windows。在移动设备上，你可以[获取 APK 文件][12]将其安装在 Android 和基于 Android 的 ROM 上。你也可以[从谷歌 Play 商店下载][13]。

在 Linux 中，你可以获取 Joplin 的 [AppImage][14] 文件，并作为可执行文件运行。你需要为下载的文件授予执行权限。

- [下载 Joplin][15]

### 体验 Joplin

Joplin 中的笔记使用 Markdown，但你不需要了解它。编辑器的顶部面板能让你以图形方式选择项目符号、标题、图像、链接等。

虽然 Joplin 提供了许多有趣的功能，但你需要自己去尝试。例如，默认情况下未启用 Web 剪切板，我需要发现如何打开它。

你需要从桌面应用启用剪切板。在顶部菜单中，进入 “Tools->Options”。你可以在此处找到 Web 剪切板选项：

![Enable Web Clipper from the desktop application first][16]

它的 Web 剪切板不如 Evernote 的 Web 剪切板聪明，后者可以以图形方式剪辑网页文章的一部分。但是，也足够了。

这是一个在活跃开发中的开源软件，我希望它随着时间的推移得到更多的改进。

### 总结

如果你正在寻找一个不错的拥有 Web 剪切板的笔记应用，你可以试试 Joplin。如果你喜欢它，并将继续使用，尝试通过捐赠或改进代码和文档来帮助 Joplin 开发。我以 FOSS 的名义[捐赠][17]了 25 欧。

如果你曾经使用过 Joplin，或者仍在使用它，你对此的体验如何？如果你用的是其他笔记应用，你会切换到 Joplin 么？欢迎分享你的观点。

--------------------------------------------------------------------------------

via: https://itsfoss.com/joplin/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/joplin_logo.png?ssl=1
[2]: https://evernote.com/
[3]: https://joplinapp.org/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/joplin_featured.jpg?ssl=1
[5]: https://joplinapp.org/clipper/
[6]: https://itsfoss.com/cloud-services-linux/
[7]: https://nextcloud.com/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/joplin_ubuntu.jpg?ssl=1
[11]: https://github.com/laurent22/joplin
[12]: https://itsfoss.com/download-apk-ubuntu/
[13]: https://play.google.com/store/apps/details?id=net.cozic.joplin&hl=en_US
[14]: https://itsfoss.com/use-appimage-linux/
[15]: https://github.com/laurent22/joplin/releases
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/joplin_web_clipper.jpg?ssl=1
[17]: https://itsfoss.com/donations-foss/
