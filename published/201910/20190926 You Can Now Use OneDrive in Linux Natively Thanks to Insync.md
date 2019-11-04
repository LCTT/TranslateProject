[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11433-1.html)
[#]: subject: (You Can Now Use OneDrive in Linux Natively Thanks to Insync)
[#]: via: (https://itsfoss.com/use-onedrive-on-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

现在你可以借助 Insync 在 Linux 中原生使用 OneDrive
======

[OneDrive][1] 是微软的一项云存储服务，它为每个用户提供 5GB 的免费存储空间。它已与微软帐户集成，如果你使用 Windows，那么已在其中预安装了 OneDrive。

OneDrive 无法在 Linux 中作为桌面应用使用。你可以通过网页访问已存储的文件，但无法像在文件管理器中那样使用云存储。

好消息是，你现在可以使用一个非官方工具，它可让你在 Ubuntu 或其他 Linux 发行版中使用 OneDrive。

当 [Insync][2] 在 Linux 上支持 Google Drive 时，它变成了 Linux 上非常流行的高级第三方同步工具。我们有篇对 [Insync 支持 Google Drive][3] 的详细点评文章。

而最近[发布的 Insync 3][4] 支持了 OneDrive。因此在本文中，我们将看下如何在 Insync 中使用 OneDrive 以及它的新功能。

> 非 FOSS 警告

> 少数开发者会对非 FOSS 软件引入 Linux 感到痛苦。作为专注于桌面 Linux 的门户，即使不是 FOSS，我们也会在此介绍此类软件。

> Insync 3 既不是开源软件，也不免费使用。你只有 15 天的试用期进行测试。如果你喜欢它，那么可以按每个帐户终生 29.99 美元的费用购买。

> 我们不会拿钱来推广它们（以防你这么想）。我们不会在这里这么做。

### 在 Linux 中通过 Insync 获得原生 OneDrive 体验

![][5]

尽管它是一个付费工具，但依赖 OneDrive 的用户或许希望在他们的 Linux 系统中获得同步 OneDrive  的无缝体验。

首先，你需要从[官方页面][6]下载适合你 Linux 发行版的软件包。

- [下载 Insync][7]

你也可以选择添加仓库并进行安装。你将在 Insync 的[官方网站][7]看到说明。

安装完成后，只需启动并选择 OneDrive 选项。

![][8]

另外，要注意的是，你添加的每个 OneDrive 或 Google Drive 帐户都需要单独的许可证。

现在，在授权 OneDrive 帐户后，你必须选择一个用于同步所有内容的基础文件夹，这是 Insync 3 中的一项新功能。

![Insync 3 Base Folder][9]

除此之外，设置完成后，你还可以选择性地同步本地或云端的文件/文件夹。

![Insync Selective Sync][10]

你还可以通过添加自己的规则来自定义同步选项，以忽略/同步所需的文件夹和文件，这完全是可选的。

![Insync Customize Sync Preferences][11]

最后，就这样完成了。

![Insync 3][12]

你现在可以在包括带有 Insync 的 Linux 桌面在内的多个平台使用 OneDrive 开始同步文件/文件夹。除了上面所有新功能/更改之外，你还可以在 Insync 上获得更快/更流畅的体验。

此外，借助 Insync 3，你可以查看同步进度：

![][13]

### 总结

总的来说，对于希望在 Linux 系统上同步 OneDrive 的用户而言，Insync 3 是令人印象深刻的升级。如果你不想付款，你可以尝试其他 [Linux 的免费云服务][14]。

你如何看待 Insync？如果你已经在使用它，到目前为止的体验如何？在下面的评论中让我们知道你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/use-onedrive-on-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://onedrive.live.com
[2]: https://www.insynchq.com
[3]: https://itsfoss.com/insync-linux-review/
[4]: https://www.insynchq.com/blog/insync-3/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/onedrive-linux.png?ssl=1
[6]: https://www.insynchq.com/downloads?start=true
[7]: https://www.insynchq.com/downloads
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/insync-3one-drive-sync.png?ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/insync-3-base-folder-1.png?ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/insync-selective-syncs.png?ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/insync-customize-sync.png?ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/insync-homescreen.png?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/insync-3-progress-bar.png?ssl=1
[14]: https://itsfoss.com/cloud-services-linux/
