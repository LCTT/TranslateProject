[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11917-1.html)
[#]: subject: (Dino is a Modern Looking Open Source XMPP Client)
[#]: via: (https://itsfoss.com/dino-xmpp-client/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Dino：一个有着现代外观的开源 XMPP 客户端
======

> Dino 是一个相对较新的开源 XMPP 客户端，它试图提供良好的用户体验，鼓励注重隐私的用户使用 XMPP 发送消息。

![](https://img.linux.net.cn/data/attachment/album/202002/22/102844mhzgzb3533xgq6d8.jpg)

### Dino：一个开源 XMPP 客户端

![][1]

[XMPP][2]（<ruby>可扩展通讯和表示协议<rt>eXtensible Messaging Presence Protocol</rt></ruby>） 是一个去中心化的网络模型，可促进即时消息传递和协作。去中心化意味着没有中央服务器可以访问你的数据。通信直接点对点。

我们中的一些人可能会称它为“老派”技术，可能是因为 XMPP 客户端通常用户体验非常糟糕，或者仅仅是因为它需要时间来适应（或设置它）。

这时候 [Dino][3] 作为现代 XMPP 客户端出现了，在不损害你的隐私的情况下提供干净清爽的用户体验。

### 用户体验

![][4]

Dino 试图改善 XMPP 客户端的用户体验，但值得注意的是，它的外观和感受将在一定程度上取决于你的 Linux 发行版。你的图标主题或 Gnome 主题会让你的个人体验更好或更糟。

从技术上讲，它的用户界面非常简单，易于使用。所以，我建议你看下 Ubuntu 中的[最佳图标主题][5]和 [GNOME 主题][6]来调整 Dino 的外观。

### Dino 的特性

![Dino Screenshot][7]

你可以将 Dino 用作 Slack、[Signal][8] 或 [Wire][9] 的替代产品，来用于你的业务或个人用途。

它提供了消息应用所需的所有基本特性，让我们看下你可以从中得到的：

* 去中心化通信
* 如果无法设置自己的服务器，它支持公共 XMPP 的服务器
* 和其他流行消息应用相似的 UI，因此易于使用
* 图像和文件共享
* 支持多个帐户
* 高级消息搜索
* 支持 [OpenPGP][10] 和 [OMEMO][11] 加密
* 轻量级原生桌面应用

### 在 Linux 上安装 Dino

你可能会发现它列在你的软件中心中，也可能未找到。Dino 为基于 Debian（deb）和 Fedora（rpm）的发行版提供了可用的二进制文件。

Dino 在 Ubuntu 的 universe 仓库中，你可以使用以下命令安装它：

```
sudo apt install dino-im
```

类似地，你可以在 [GitHub 分发包页面][12]上找到其他 Linux 发行版的包。

如果你想要获取最新的，你可以在 [OpenSUSE 的软件页面][13]找到 Dino 的 **.deb** 和 .**rpm** （每日构建版）安装在 Linux 中。

在任何一种情况下，前往它的 [Github 页面][14]或点击下面的链接访问官方网站。

- [下载 Dino][3]

### 总结

在我编写这篇文章时快速测试过它，它工作良好，没有出过问题。我将尝试探索更多，并希望能涵盖更多有关 XMPP 的文章来鼓励用户使用 XMPP 的客户端和服务器用于通信。

你觉得 Dino 怎么样？你会推荐另一个可能好于 Dino 的开源 XMPP 客户端吗？在下面的评论中让我知道你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/dino-xmpp-client/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/dino-main.png?ssl=1
[2]: https://xmpp.org/about/
[3]: https://dino.im/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/dino-xmpp-client.jpg?ssl=1
[5]: https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[6]: https://itsfoss.com/best-gtk-themes/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/dino-screenshot.png?ssl=1
[8]: https://itsfoss.com/signal-messaging-app/
[9]: https://itsfoss.com/wire-messaging-linux/
[10]: https://www.openpgp.org/
[11]: https://en.wikipedia.org/wiki/OMEMO
[12]: https://github.com/dino/dino/wiki/Distribution-Packages
[13]: https://software.opensuse.org/download.html?project=network:messaging:xmpp:dino&package=dino
[14]: https://github.com/dino/dino

