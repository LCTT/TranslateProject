[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11050-1.html)
[#]: subject: (BitTorrent Client Deluge 2.0 Released: Here’s What’s New)
[#]: via: (https://itsfoss.com/deluge-2-release/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

BitTorrent 客户端 Deluge 2.0 发布：新功能介绍
======

你可能已经知道 [Deluge][1] 是[最适合 Linux 用户的 Torrent 客户端][2]之一。然而，最近的稳定版本差不多是两年前的了。

尽管它仍在积极开发中，但直到最近才出了一个主要的稳定版本。我们写这篇文章时，最新版本恰好是 2.0.2。所以，如果你还没有下载最新的稳定版本，请尝试一下。

不管如何，如果你感兴趣的话，让我们看看有哪些新的功能。

### Deluge 2.0 的主要改进

新版本引入了多用户支持，这是一个非常需要的功能。除此之外，还有一些性能改进可以更快地加载更多的种子。

此外，在 2.0 版本中，Deluge 使用了 Python 3，对 Python 2.7 提供最低支持。即使是用户界面，他们也从 GTK UI 迁移到了 GTK3。

根据发行说明，还有一些更重要的补充/改进，包括：

* 多用户支持。
* 性能提升，可以更快地加载数千个种子。
* 一个模拟 GTK/Web UI 的新控制台 UI。
* GTK UI 迁移到 GTK3，并带有 UI 改进和补充。
* 磁链预获取功能可以在添加种子时选择文件。
* 完全支持 libtorrent 1.2。
* 语言切换支持。
* 改进了在 ReadTheDocs 托管的文档。
* AutoAdd 插件取代了内置功能。

### 如何安装或升级到 Deluge 2.0

![][4]

对于任何 Linux 发行版，你都应该遵循官方[安装指南][5]（使用 PPA 或 PyPi）。但是，如果你要升级，你应该留意发行说明中提到的：

> “_Deluge 2.0 与 Deluge 1.x 客户端或守护进程不兼容，因此这些也需要升级。如果第三方脚本直接连接到 Deluge 客户端，那么可能也不兼容且需要迁移。_”

因此，坚持在升级主版本之前备份你的[配置][6]以免数据丢失。而且，如果你是插件作者，那么需要升级它以使其与新版本兼容。

直接下载的安装包尚不包含 Windows 和 Mac OS。但是，说明中提到他们正在进行中。

除此之外，你可以按照更新后的官方文档中的[安装指南][5]来手动安装它们。

### 总结

你如何看待最新的稳定版本？你是否将 Deluge 用作 BitTorrent 客户端？或者你是否找到了其他更好的选择？

请在下面的评论栏告诉我们你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/deluge-2-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://dev.deluge-torrent.org/
[2]: https://itsfoss.com/best-torrent-ubuntu/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/deluge.jpg?fit=800%2C410&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/Deluge-2-release.png?resize=800%2C450&ssl=1
[5]: https://deluge.readthedocs.io/en/latest/intro/01-install.html
[6]: https://dev.deluge-torrent.org/wiki/Faq#WheredoesDelugestoreitssettingsconfig
