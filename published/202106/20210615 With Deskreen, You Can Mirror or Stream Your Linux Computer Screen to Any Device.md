[#]: subject: (With Deskreen, You Can Mirror or Stream Your Linux Computer Screen to Any Device)
[#]: via: (https://itsfoss.com/deskreen/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13507-1.html)

用 Deskreen 将你的 Linux 屏幕镜像或串流到任何设备上
======

其它平台上的屏幕共享或屏幕镜像应用并不那么好。尽管大多数选项仅适用于 Windows/Mac，而你可能很难找到一个适用于 Linux 的开源解决方案。

有了这个应用，你可以与连接到网络的任何设备共享你的屏幕。

如果你有多显示器设置，你会意识到拥有多个屏幕的好处。而且，有了 Deskreen，你可以把任何设备变成你的副屏，多么令人激动啊！

### Deskreen：将任何设备变成你的 Linux 系统的副屏

![我把我的 Linux Mint 桌面镜像到我的 Android 手机上][1]

[Deskreen][2] 是一个自由开源的应用，可以让你使用任何带有 Web 浏览器的设备来作为电脑的副屏。

如果你愿意，它还支持多个设备连接。

Deskreen 很容易使用，当你的所有设备都连接到同一个 Wi-Fi 网络时，它可以正常工作。

让我们来看看它的功能和工作原理。

### Deskreen 的功能

Deskreen 的功能包括以下要点：

  * 分享整个屏幕的能力
  * 选择一个特定的应用窗口进行串流
  * 翻转模式，将你的屏幕作为提词器使用
  * 支持多种设备
  * 高级视频质量设置
  * 提供端对端加密
  * 最小的系统要求
  * 黑暗模式

没有一个冗长的功能列表，但对大多数用户来说应该是足够的。

### 如何使用 Deskreen 应用？

Deskreen 使用分为三个简单的步骤，让我为你强调一下，以便你开始使用：

首先，当你启动该应用时，它会显示一个二维码和一个 IP 地址，以帮助你用 Web 浏览器连接其他设备，以串流你的屏幕。

![][4]

你可以按你喜欢的方式，在你的辅助设备上的 Web 浏览器的帮助下建立连接。

当你扫描二维码或在浏览器的地址栏中输入 IP 地址，你会在 Deskreen 应用上得到一个提示，允许或拒绝连接。除非是你不认识它，否则就允许吧。

![][5]

接下来，你将被要求选择你想要串流的内容（你的整个屏幕或特定的应用窗口）：

![][6]

你可以选择串流整个屏幕或选择你想串流的窗口。然而，并不是每个应用窗口都能被检测到。

在我的快速测试中，我没有检测到 Rocket.Chat 应用窗口，但它似乎能检测到 Slack 窗口、Deskscreen 窗口和终端。

![][7]

你只需要选择源并确认，就可以了。你应该注意到它在你的副屏（手机/桌面）上开始串流。

![][8]

这是它完成后的样子：

![][9]

Deskreen 还为你提供了管理连接设备的能力。因此，如果你需要断开任何会话或所有会话的连接，你可以从设置中进行操作。

### 在 Linux 中安装 Deskreen

你会找到一个用于 Linux 机器的 DEB 包和 AppImage 文件。如果你不知道，可以通过我们的 [安装 DEB 包][10] 和 [使用 AppImage 文件][11] 指南来安装它。

你可以从 [官方网站][2] 下载它，或者从它的 [GitHub 页面][12]探索更多的信息。

- [Deskreen][2]

### 结束语

考虑到它使用 Wi-Fi 网络工作，在串流方面绝对没有问题。这是一种奇妙的方式，可以与别人分享你的屏幕，或者出于任何目的将其串流到第二个设备上。

当然，它不能取代你的电脑的第二个显示器的优势，但在一些使用情况下，你可能不需要第二个屏幕。

现在，我想问你，你能想到哪些实际应用可以用到 Deskreen？

--------------------------------------------------------------------------------

via: https://itsfoss.com/deskreen/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/deskreen-app.jpg?resize=800%2C450&ssl=1
[2]: https://deskreen.com/lang-en
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/deskreen-connect.png?resize=800%2C559&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/deskscreen-connect.png?resize=800%2C553&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/deskreen-select.png?resize=800%2C549&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/deskreen-app-window.png?resize=800%2C551&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/deskreen-confirm-1.png?resize=800%2C554&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/deskscreen-done.png?resize=873%2C599&ssl=1
[10]: https://itsfoss.com/install-deb-files-ubuntu/
[11]: https://itsfoss.com/use-appimage-linux/
[12]: https://github.com/pavlobu/deskreen
