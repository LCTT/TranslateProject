Dropbox 在 Linux 上终止除了 Ext4 之外所有文件系统的同步支持
======

> Dropbox 正考虑将同步支持限制为少数几种文件系统类型：Windows 的 NTFS、macOS 的 HFS+/APFS 和 Linux 的 Ext4。

![Dropbox ends support for various file system types][1]

[Dropbox][2] 是最受欢迎的 [Linux 中的云服务][3]之一。很多人都在使用 Linux 下的 Dropbox 同步客户端。但是，最近，一些用户在他们的 Dropbox Linux 桌面客户端上收到一条警告说：

> “移动 Dropbox 文件夹位置，
>  Dropbox 将在 11 月停止同步“

### Dropbox 将仅支持少量文件系统

一个 [Reddit 主题][4]强调了一位用户在 [Dropbox 论坛][5]上查询了该消息后的公告，该消息被社区管理员标记为意外新闻。这是[回复][6]中的内容：

> “大家好，在 2018 年 11 月 7 日，我们会结束 Dropbox 在某些不常见文件系统的同步支持。支持的文件系统是 Windows 的 NTFS、macOS 的 HFS+ 或 APFS，以及Linux 的 Ext4。
>
> [Dropbox 官方论坛][6]

![Dropbox official confirmation over limitation on supported file systems][7] 

*Dropbox 官方确认支持文件系统的限制*

此举旨在提供稳定和一致的体验。Dropbox 还更新了其[桌面要求][8]。

### 那你该怎么办？

如果你在不受支持的文件系统上使用 Dropbox 进行同步，那么应该考虑更改位置。

Linux 仅支持 Ext4 文件系统。但这并不是一个令人担忧的新闻，因为你可能已经在使用 Ext4 文件系统了。

在 Ubuntu 或其他基于 Ubuntu 的发行版上，打开磁盘应用并查看 Linux 系统所在分区的文件系统。

![Check file system type on Ubuntu][9]

*检查 Ubuntu 上的文件系统类型*

如果你的系统上没有安装磁盘应用，那么可以[使用命令行了解文件系统类型][10]。

如果你使用的是 Ext4 文件系统并仍然收到来自 Dropbox 的警告，请检查你是否有可能收到通知的非活动计算机/设备。如果是，[将该系统与你的 Dropbox 帐户取消连接][11]。

### Dropbox 也不支持加密的 Ext4 吗？

一些用户还报告说他们在加密 Ext4 文件系统同步时也收到了警告。那么，这是否意味着 Linux 的 Dropbox 客户端只支持未加密的 Ext4 文件系统？这方面 Dropbox 没有官方声明。

你使用的是什么文件系统？你也收到了警告吗？如果你在收到警告后仍不确定该怎么做，你应该前往该方案的[官方帮助中心页面][12]。

请在下面的评论中告诉我们你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/dropbox-linux-ext4-only/

作者：[Ankush Das][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/08/dropbox-filesystem-support-featured.png?w=800&ssl=1
[2]: https://www.dropbox.com/
[3]: https://itsfoss.com/cloud-services-linux/
[4]: https://www.reddit.com/r/linux/comments/966xt0/linux_dropbox_client_will_stop_syncing_on_any/
[5]: https://www.dropboxforum.com/t5/Syncing-and-uploads/
[6]: https://www.dropboxforum.com/t5/Syncing-and-uploads/Linux-Dropbox-client-warn-me-that-it-ll-stop-syncing-in-Nov-why/m-p/290065/highlight/true#M42255
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/08/dropbox-stopping-file-system-supports.jpeg?w=800&ssl=1
[8]: https://www.dropbox.com/help/desktop-web/system-requirements#desktop
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/08/check-file-system-type-ubuntu.jpg?w=800&ssl=1
[10]: https://www.thegeekstuff.com/2011/04/identify-file-system-type/
[11]: https://www.dropbox.com/help/mobile/unlink-relink-computer-mobile
[12]: https://www.dropbox.com/help/desktop-web/cant-establish-secure-connection#location
