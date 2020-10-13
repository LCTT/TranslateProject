[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11960-1.html)
[#]: subject: (Syncthing: Open Source P2P File Syncing Tool)
[#]: via: (https://itsfoss.com/syncthing/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Syncthing：开源 P2P 文件同步工具
======

> Syncthing 是一个开源的 P2P 文件同步工具，可用于在多个设备（包括 Android 手机）之间同步文件。

![](https://img.linux.net.cn/data/attachment/album/202003/05/094211oy2dosttvoaseovk.jpg)

通常，我们有 [MEGA][1] 或 Dropbox 之类的云同步解决方案，以便在云上备份我们的文件，同时更易于共享。但是，如果要跨多个设备同步文件而不将其存储在云中怎么办？

这就是 [Syncthing][2] 派上用场的地方了。

### Syncthing：一个跨设备同步文件的开源工具

![][3]

Syncthing 可让你跨多个设备同步文件（包括对 Android 智能手机的支持）。它主要通过 Linux 上的 Web UI 进行工作，但也提供了 GUI（需要单独安装）。

然而，Syncthing 完全没有利用云，它是 [P2P][4] 文件同步工具。你的数据不会被发送到中央服务器。而是会在所有设备之间同步。因此，它并不能真正取代 [Linux 上的典型云存储服务][5]。

要添加远程设备，你只需要设备 ID（或直接扫描二维码），而无需 IP 地址。

如果你想要远程备份文件，那么你可能应该依靠云。

![Syncthing GUI][6]

考虑到所有因素，Syncthing 可以在很多方面派上用场。从技术上讲，你可以安全、私密地在多个系统上访问重要文件，而不必担心有人监视你的数据。

例如，你可能不想在云上存储一些敏感文件，因此你可以添加其他受信任的设备来同步并保留这些文件的副本。

即使我对它的描述很简单，但它并不像看到的那么简单。如果你感兴趣的话，我建议你阅读[官方 FAQ][7] 来了解它如何工作的。

### Syncthing 的特性

你可能不希望同步工具中有很多选项。它要可靠地同步文件，应该非常简单。

Syncthing 确实非常简单且易于理解。即使这样，如果你想使用它的所有功能，那么也建议你阅读它的[文档][8]。

在这里，我将重点介绍 Syncthing 的一些有用特性：

#### 跨平台支持

![Syncthing on Android][9]

作为开源解决方案，它支持 Windows、Linux 和 macOS。

除此之外，它还支持 Android 智能手机。如果你使用的是 iOS 设备，那么你会感到失望。到目前为止，它还没有支持 iOS 的计划。

#### 文件版本控制

![Syncthing File Versioning][10]

如果替换或删除了旧文件，那么 Syncthing 会利用各种[文件版本控制方法][11]来存档旧文件。

默认情况下，你不会发现它启用。但是，当你创建一个要同步的文件夹时，你将找到将文件版本控制切换为首选方法的选项。

#### 易于使用

作为 P2P 文件同步工具，它无需高级调整即可使用。

但是，它允许你在需要时配置高级设置。

#### 安全和隐私

即使你不与任何云服务提供商共享数据，仍会有一些连接可能会引起窃听者的注意。因此，Syncthing 使用 TLS 保护通信。

此外，它还有可靠的身份验证方法，以确保仅授予只有你允许的设备/连接能够取得同步/读取数据的权限。

对于 Android 智能手机，如果你使用 [Orbot 应用][12]，你还可以强制将流量通过 Tor。在 Android 中你还有几个不同选择。

#### 其他功能

![][13]

当你探索这个工具时，你会注意到可以同步的文件夹数和可同步的设备数没有限制。

因此，作为一个有着丰富有用特性的自由开源解决方案，对于在寻找 P2P 同步客户端的 Linux 用户而言是一个令人印象深刻的选择。

### 在 Linux 上安装 Syncthing

你可能无法在官网上找到 .deb 或者 .AppImage 文件。但是，你可在 [Snap 商店][14]中找到 snap 包。如果你好奇，你可以阅读在 Linux 上[使用 snap 应用][15]的文章来开始使用。

你可能无法在软件中心找到它（如果你找到了，那它可能不是最新版本）。

**注意：**如果你需要一个 GUI 应用而不是浏览器来管理它，它还有一个 [Syncthing-GTK][16]。

- [Syncthing][2]

如果你有基于 Debian 的发行版，你也可以利用终端来安装它，这些说明位于[官方下载页面][17]上。

### 我在 Syncthing 方面的体验

就个人而言，我把它安装在 Pop!_OS 19.10 上，并在写这篇文章之前用了一会儿。

我尝试同步文件夹、删除它们、添加重复文件以查看文件版本控制是否工作，等等。它工作良好。

然而，当我尝试同步它到手机（安卓），同步启动有点晚，它不是很快。因此，如果我们可以选择显式强制同步，那会有所帮助。或者，我错过了什么选项吗？如果是的话，请在评论中让我知道。

从技术上讲，它使用系统资源来工作，因此，如果你连接了多个设备进行同步，这可能会提高同步速度（上传/下载）。

总体而言，它工作良好，但我必须说，你不应该依赖它作为唯一的数据备份方案。

### 总结

你试过 Syncthing 了吗？如果有的话，你的体验如何？欢迎在下面的评论中分享。

此外，如果你知道一些不错的替代品，也请让我知道。

--------------------------------------------------------------------------------

via: https://itsfoss.com/syncthing/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-mega-cloud-storage-linux/
[2]: https://syncthing.net/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/syncthing-screenshot.jpg?ssl=1
[4]: https://en.wikipedia.org/wiki/Peer-to-peer
[5]: https://itsfoss.com/cloud-services-linux/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/syncthing-gtk.png?ssl=1
[7]: https://docs.syncthing.net/users/faq.html
[8]: https://docs.syncthing.net/users/index.html
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/syncthing-android.jpg?ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/syncthing-file-versioning.jpg?ssl=1
[11]: https://docs.syncthing.net/users/versioning.html
[12]: https://play.google.com/store/apps/details?id=org.torproject.android&hl=en_IN
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/syncthing-screenshot1.jpg?ssl=1
[14]: https://snapcraft.io/syncthing
[15]: https://itsfoss.com/install-snap-linux/
[16]: https://github.com/syncthing/syncthing-gtk/releases/latest
[17]: https://syncthing.net/downloads/
