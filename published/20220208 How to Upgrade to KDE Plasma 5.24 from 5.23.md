[#]: subject: "How to Upgrade to KDE Plasma 5.24 from 5.23"
[#]: via: "https://www.debugpoint.com/2022/02/upgrade-kde-plasma-5-24/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14264-1.html"

如何从 KDE Plasma 5.23 升级到 5.24
======

> KDE 团队宣布了 KDE Plasma 5.24 LTS 版，已经可以下载和安装了。如果你打算从以前的版本升级，在这里我们给你提供了从 5.23 升级到 5.24 的简明步骤。

![KDE Plasma 5.24 桌面][1]

KDE Plasma 5.24 是 Plasma 桌面的第 26 个版本，带来了显著的视觉改变和一些后端性能的提升。在这个版本中，你会看到全新的墙纸、Breeze 主题的视觉变化、指纹登录和一个全新的概览屏幕等等。

你可以在我们的综述文章里阅读有关 [KDE Plasma 5.24 功能的细节][2]。

如果你正在运行 KDE Plasma 的早期版本，你可以按本文说明升级到最新版本。

### 如何升级到 KDE Plasma 5.24

这个版本的升级包大小适中，在我的测试机器上大约是 450MB 以上。在开始升级过程之前，请确保关闭所有应用程序并保存你的数据。

一般来说，KDE 的升级是非常稳定的，它从来不会失败。但是，如果你想格外谨慎，并且有宝贵的数据，你可能想对这些进行备份。但同样，在我看来，我相信这是没有必要的。

#### 步骤

如果你是在 KDE Neon 之中、滚动发布的发行版（如 Arch Linux、Manjaro 之类）中运行 KDE Plasma 5.23，你可以打开 KDE 工具 “<ruby>发现<rt>Discover</rt></ruby>”，点击检查更新。

你可以通过“<ruby>发现<rt>Discover</rt></ruby>”的升级包列表验证 Plasma 5.24 是否可用。

一旦确认可用，点击“<ruby>发现<rt>Discover</rt></ruby>”窗口右上方的“<ruby>全部更新<rt>Update All</rt></ruby>”按钮。

另外，你也可以从终端运行下面的命令，在 KDE Neon 中开始升级过程。

```
sudo apt update
sudo pkcon update
```

升级过程完成后重启系统。

而重启后，你应该看到全新的 KDE Plasma 5.24 出现在你面前。

### 在 Fedora 35 和 Ubuntu 21.10 中升级 KDE Plasma 5.24

截至目前，[Fedora 35][3] 和 [Ubuntu 21.10][4] 是两个主要的 KDE 的发行版。由于 [更新政策][5]，Fedora 35 不会得到这个版本，而 Fedora 36 也将很快发布。

然而，如果你仍然想做实验，你可以在 Ubuntu 21.10 和 Ubuntu 21.04 中使用下面的 Backports PPA 安装这个新版本的 Plasma 桌面。在这样做的时候，请确保你保留一份数据备份。

```
sudo add-apt-repository ppa:kubuntu-ppa/backports
sudo apt-get full-upgrade
```

在 Fedora 35 中，我试图通过下面的 COPR 仓库来安装。但是有太多的依赖性冲突需要解决，在一个稳定的系统中尝试这样做是有风险的。我建议目前不要在 Fedora 35 中尝试下面的方法。当然你仍然可以通过 `allowerasing` 标志来安装。但不要这样做。

另外，我猜 Fedora 35 的官方版本会在第一个小版本（即 5.24.1）发布时更新，该版本将于 2022 年 2 月 15 日发布，所以你可以等到那时。

另外，等待 Fedora 36 也是比较明智的做法，因为它将这个版本作为默认版本。Fedora 36 将于 2022 年 4 月发布。

![试图在 Fedora 35 中安装 Plasma 5.24][6]

```
sudo dnf copr enable marcdeop/plasma
sudo dnf copr enable marcdeop/kf5
sudo dnf upgrade --refresh
```

### 升级后的反馈

我在虚拟机中运行了升级过程，并安装了新的 KDE Plasma 5.23。升级过程很顺利，没有出现意外或错误。好吧，到目前为止，它对我来说从未失败过。

升级时间完全取决于你的互联网连接和 KDE 服务器。一般来说，它应该在 30 分钟内完成。

升级过程后的第一次重启很顺利，没有花费多少时间。

从性能上讲，我觉得它比之前的版本更流畅，这要归功于几个错误的修复和底层的性能优化。

所以，总的来说，如果你在使用 KDE Neon，你可以安全地升级。否则就等待 Ubuntu 和 Fedora 稳定版的软件包。

享受全新的 KDE Plasma 吧！

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/upgrade-kde-plasma-5-24/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/02/KDE-Plasma-5.4-Desktop-1024x576.jpg
[2]: https://www.debugpoint.com/2022/01/kde-plasma-5-24/
[3]: https://www.debugpoint.com/2021/09/fedora-35/
[4]: https://www.debugpoint.com/2021/07/ubuntu-21-10/
[5]: https://docs.fedoraproject.org/en-US/fesco/Updates_Policy/#stable-releases
[6]: https://www.debugpoint.com/wp-content/uploads/2022/02/Trying-to-Install-Plasma-5.24-in-Fedora-35-1024x576.jpg
[7]: https://t.me/debugpoint
[8]: https://twitter.com/DebugPoint
[9]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[10]: https://facebook.com/DebugPoint
