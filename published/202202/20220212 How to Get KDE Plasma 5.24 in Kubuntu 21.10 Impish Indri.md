[#]: subject: "How to Get KDE Plasma 5.24 in Kubuntu 21.10 Impish Indri"
[#]: via: "https://www.debugpoint.com/2022/02/kde-plasma-5-24-kubuntu-21-10/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14279-1.html"

如何在 Kubuntu 21.10 中升级 KDE Plasma 5.24
======

![](https://img.linux.net.cn/data/attachment/album/202202/17/093727qw3js653lzksscfw.jpg)

> KDE 开发人员启用了有名的 Backports PPA，以便你在 Kubuntu 21.10 中安装/升级到 KDE Plasma 5.24。 以下是方法。

KDE Plasma 5.24 最近的 [发布][1] 带来了令人兴奋的变化。在这个新版本中，你会得到一个全新的概览页面，它很像 GNOME 的概览。此外，还有崭新的默认 Breeze 主题、性能提升、通知外观的调整等。在我们的 [官方综述页面][2] 可以阅读更多关于这些功能的信息。

如果你很匆忙，没有时间阅读文章，这里有一组简短的命令，可以做到这些。😃

```
sudo add-apt-repository ppa:kubuntu-ppa/backports
sudo apt update
sudo apt full-upgrade
```

如果你运行 Kubuntu 21.10 Impish Indri，你不会马上得到这个更新。因为 Kubuntu 21.10 Impish Indri 目前采用 KDE Plasma 5.22.5 作为稳定版本。尽管 Kubuntu 21.10 计划在 2022 年 7 月结束生命，但你仍然可以通过 Backports PPA 安装 KDE Plasma 5.24。

然而，请注意，你将在 2022 年 4 月的 Kubuntu 22.04 LTS 中得到 KDE Plasma 5.24，这要比 Kubuntu 21.10 的寿命结束早得多。

### 如何在 Kubuntu 21.10 中安装 KDE Plasma 5.24

下面是你如何将 Kubuntu 21.10 中现有的 KDE Plasma 更新到最新版本。

#### 如何在 Kubuntu 21.10 中安装 KDE Plasma 5.24

如果你习惯使用“<ruby>发现<rt>Discover</rt></ruby>” 感到满意，请添加 Backports PPA `ppa:kubuntu-ppa/backports` 作为软件源并点击更新。一旦检索到更新的软件包信息，就可以安装。

我建议使用以下终端方法，以获得更快和无错误的安装。

打开 Konsole，运行以下命令来添加 backports PPA。如果你喜欢，你可以验证你运行的 Plasma 是什么版本。

```
sudo add-apt-repository ppa:kubuntu-ppa/backports
```

![Add the PPA][7]

现在，刷新软件包列表并验证最新的 5.24 软件包是否可供升级。

![Check the latest KDE Plasma 5.24 packages before upgrading][8]

现在运行最后的命令来启动升级。

```
sudo apt full-upgrade
```

上面的命令会下载大约 270MB 以上的软件包。升级过程大约需要 10 分钟。命令完成后，重启你的系统。

而你应该通过 Kubuntu 21.10 Impish Indri 获得了全新的 KDE Plasma 5.24。

![KDE Plasma 5.24 in Kubuntu 21.10][9]

#### 如何在 Ubuntu 21.10 中与 GNOME 一起安装 KDE Plasma 5.24

如果你正在运行带有默认 GNOME 的 Ubuntu 21.10 Impish Indri，你也可以体验全新的 KDE Plasma 桌面，只需对上述命令稍作修改即可。

打开一个终端，依次运行下面的命令。

```
sudo add-apt-repository ppa:kubuntu-ppa/backpots
sudo apt update
sudo apt install kubuntu-desktop
```

上述命令完成后，重启系统。在登录页面上，选择 KDE Plasma 作为桌面环境。然后你就可以开始了。

这将与 GNOME 桌面一起安装 KDE Plasma 5.24。

#### 我可以在 Ubuntu 20.04 LTS 中安装 KDE Plasma 5.24 吗？

Ubuntu 20.04 LTS 版有早期的 KDE Plasma 5.18、KDE Framework 5.68、KDE Applications 19.12.3。所以，在它的整个生命周期中，它不会收到最新的 KDE 更新。所以，从技术上讲，你可以添加上述 PPA 并安装 KDE Plasma 5.24。但我不建议这样做，因为不兼容的软件包框架可能会导致系统不稳定。

所以，建议你使用 Kubuntu 21.10 和上述的 Backports PPA 或者使用 KDE Neon 来体验最新的 Plasma 桌面。

### 如何卸载

在任何时候，如果你想回到 KDE Plasma 桌面的原始版本，那么你可以安装 `ppa-purge` 并删除 PPA，接着刷新软件包。

打开一个终端，依次执行以下命令。

```
sudo apt install ppa-purge
sudo ppa-purge ppa:kubuntu-ppa/backports
sudo apt update
```

当命令完成，重启你的系统。

### 结束语

我希望这个快速指南能让你从不同的使用情况下全面升级到 KDE Plasma 5.24。希望你能在没有任何错误的情况下完成升级。

请在下面的评论栏里告诉我进展如何。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/kde-plasma-5-24-kubuntu-21-10/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://kde.org/announcements/plasma/5/5.24.0/
[3]: tmp.iA5hKjVLOx#how-to-install-kde-plasma-5-24-in-kubuntu-21-10-1
[4]: tmp.iA5hKjVLOx#how-to-install-kde-plasma-5-24-in-ubuntu-21-10-alongside-gnome
[5]: tmp.iA5hKjVLOx#can-i-install-kde-plasma-5-24-in-ubuntu-20-04-lts
[6]: tmp.iA5hKjVLOx#how-to-uninstall
[7]: https://www.debugpoint.com/wp-content/uploads/2022/02/Add-the-PPA.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/02/Check-the-latest-KDE-Plasma-5.24-packages-before-upgrade.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/02/KDE-Plasma-5.24-in-Kubuntu-21.10-1024x579.jpg
[10]: https://t.me/debugpoint
[11]: https://twitter.com/DebugPoint
[12]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[13]: https://facebook.com/DebugPoint
