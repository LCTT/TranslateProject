[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12158-1.html)
[#]: subject: (Things You Should Know About Ubuntu 20.04)
[#]: via: (https://itsfoss.com/ubuntu-20-04-faq/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

关于 Ubuntu 20.04 你应该了解的事情
======

[Ubuntu 20.04][1] 已经发布，你可能对升级、安装等有一些问题和疑问。

我在各种社交媒体渠道上主持了一些问答环节，回答像你这样的读者的疑虑。我将列出这些关于 Ubuntu 20.04 的常见问题，并给出答案。我希望它能帮助你消除你的疑虑。如果你仍有问题，请随时在下面的评论栏提问。

### Ubuntu 20.04：已回复的问题

![][2]

为了澄清一下，这里的一些答案也许受我个人意见的影响。如果你是一个有经验的 Ubuntu 用户，有些问题听起来可能有点愚蠢，但它对 Ubuntu 新用户不是这样。

#### Ubuntu 20.04 何时发布？

Ubuntu 20.04 LTS 于 2020 年 4 月 23 日发布。所有变种，如 Kubuntu、Lubuntu,、Xubuntu、Budgie、MATE 都将和 20.04 同一天发布。

#### Ubuntu 20.04 的系统要求是什么？

对于默认的 GNOME 版本，应至少具有 4GB 的内存、2GHz 双核处理器和至少 25GB 的磁盘空间。

其他 [Ubuntu 变种][3]可能有不同的系统要求。

#### 我可以在 32 位系统上使用 Ubuntu 20.04 吗？

完全不行。你不能在 32 位系统上使用 Ubuntu 20.04。即使你使用的是 32 位 Ubuntu 18.04，也不能升级到 Ubuntu 20.04。32 位的系统 ISO 是以前用的。

![Error while upgrading 32-bit Ubuntu 18.04 to Ubuntu 20.04][4]

#### 我可以在 Ubuntu 20.04 上使用 Wine 吗？

是的，你仍然可以在 Ubuntu 20.04 上使用 Wine，因为仍然用于 Wine 和 [Steam Play][5] 软件包所需的 32 位库。

#### 我需要购买 Ubuntu 20.04 或许可证？

不，Ubuntu 完全可以免费使用。你不必像在 Windows 中那样购买许可证密钥或激活 Ubuntu。

Ubuntu 的下载页会请求你捐赠一些资金，如果你想为开发这个强大的操作系统捐钱，由你自己决定。

#### GNOME 版本是什么？

Ubuntu 20.04 有 GNOME 3.36。

#### Ubuntu 20.04 的性能是否优于 Ubuntu 18.04？

是的，在几个方面。Ubuntu 20.04 系统速度更快，甚至超快。我在下面这个视频的 4:40 处展示了性能对比。

- [video](https://img.linux.net.cn/static/video/Top%207%20Best%20Features%20You%27ll%20Love%20in%20Ubuntu%2020.04-lpq8pm_xkSE.mp4)

在 GNOME 3.36 中，滚动、窗口动画和其他 UI 元素更加流畅，提供了更流畅的体验。

#### Ubuntu 20.04 将支持多长时间？

它是一个长期支持（LTS）版本，与任何 LTS 版本一样，它将在五年内得到支持。这意味着 Ubuntu 20.04 将在 2025 年 4 月之前获得安全和维护更新。

#### 升级到 Ubuntu 20.04 时，是否会丢失数据？

你可以从 Ubuntu 19.10 或 Ubuntu 18.04 升级到 Ubuntu 20.04。你无需创建 live USB 并从中安装。你所需要的是一个良好的互联网连接，来下载约 1.5GB 的数据。

从现有系统升级不会破坏你的文件。你应该会留有所有文件，并且大多数现有软件应具有相同的版本或升级后的版本。

如果你使用了某些第三方工具或[其他 PPA][6]，升级过程将禁用它们。如果 Ubuntu 20.04 可以使用这些其他存储库，那么可以再次启用它们。

升级大约需要一个小时，重启后，你将登录到新版本。

虽然你的数据不会被触碰，并且不会丢失系统文件和配置，但最好在外部设备备份重要数据。

#### 何时可以升级到 Ubuntu 20.04？

![][7]

如果你正在使用 Ubuntu 19.10 并有正确的更新设置（如前面部分所述），那么应在发布后的几天内通知你升级到 Ubuntu 20.04。

对于 Ubuntu 18.04 用户，可能需要几周时间才能正式通知他们 Ubuntu 20.04 可用。可能，你可能会在第一个点版本 Ubuntu 20.04.1 后获得提示。

#### 如果我升级到 Ubuntu 20.04，我可以降级到 19.10 或 18.04 吗？

不行。虽然升级到新版本很容易，但无法选择降级。如果你想回到 Ubuntu 18.04，你需要重新[安装 Ubuntu 18.04][8]。

#### 我使用的是 Ubuntu 18.04 LTS。我应该升级到 Ubuntu 20.04 LTS 吗？

这取决于你。如果你对 Ubuntu 20.04 中的新功能印象深刻，并希望上手尝试，那么你应该升级。

如果你想要一个更稳定的系统，我建议等待第一个点版本 Ubuntu 20.04.1，新版本会有 bug 修复。20.04.1 通常在 Ubuntu 20.04 发布后大约两个月到来。

无论是那种情况，我都建议你或早或晚升级到 Ubuntu 20.04。Ubuntu 20.04 具有更新的内核、性能改进，尤其是仓库中有更新版本的软件。

在外部磁盘上进行备份，并且有良好的互联网连接，升级不应成为问题。

#### 我应该重新安装 Ubuntu 20.04 还是从 18.04/19.10 升级到 Ubuntu？

如果你可以选择，请备份数据，并重新安装 Ubuntu 20.04。

从现有版本升级到 20.04 是一个方便的选择。然而，在我看来，它仍然保留有一些旧版本的痕迹/包。全新安装更加干净。

#### 关于 Ubuntu 20.04 的任何其他问题？

如果你对 Ubuntu 20.04 有任何疑问，请随时在下面发表评论。如果你认为应该将其他信息添加到列表中，请让我知道。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-20-04-faq/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-12142-1.html
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/ubuntu_20_04_faq.jpg?ssl=1
[3]: https://itsfoss.com/which-ubuntu-install/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/ubuntu-32-bit.jpg?ssl=1
[5]: https://itsfoss.com/steam-play/
[6]: https://itsfoss.com/ppa-guide/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/upgrade-ubuntu-20-04.jpg?ssl=1
[8]: https://itsfoss.com/install-ubuntu/
