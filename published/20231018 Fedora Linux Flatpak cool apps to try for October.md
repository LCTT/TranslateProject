[#]: subject: "Fedora Linux Flatpak cool apps to try for October"
[#]: via: "https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-october/"
[#]: author: "Eduard Lucena https://fedoramagazine.org/author/x3mboy/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16343-1.html"

10 月份在 Fedora Linux 上值得尝试的酷炫 Flatpak应用
======

![][0]

> 本文介绍了 Flathub 中可用的项目以及安装说明。

[Flathub][2] 是获取和分发适用于所有 Linux 的应用的地方。它由 Flatpak 提供支持，允许 Flathub 应用在几乎任何 Linux 发行版上运行。

请阅读 “[Flatpak 入门][3]”。要启用 flathub 作为你的 flatpak 提供商，请使用 [flatpak 站点][4] 上的说明。

### Warehouse

[Warehouse][5] 是一个图形程序，用于管理已安装的 Flatpak 应用程序和 Flatpak 远程应用。一些最重要的功能是：

- 查看 Flatpak 信息
- 管理用户数据
- 批量操作
- 剩余数据管理
- 管理远程应用

你可以通过单击网站上的安装按钮或手动使用以下命令来安装 “Warehouse”：

```
flatpak install flathub io.github.flattool.Warehouse
```

### Jogger

[Jogger][6] 是一款适用于 Gnome Mobile 的应用，用于跟踪跑步和其他锻炼。它是用 GTK4、Libadwaita、Rust 和 Sqlite 构建的。尽管它的目标是 Gnome Mobile，但它在 Gnome Shell 下运行得很好，而且我发现它对于保存我的统计数据非常有用。其中一些功能是：

- 使用 Geoclue 位置跟踪锻炼
- 从 Fitotrack 导出导入锻炼
- 手动输入锻炼
- 查看锻炼详情
- 编辑锻炼
- 删除锻炼
- 计算锻炼消耗的卡路里

你可以通过单击网站上的安装按钮或使用以下命令手动安装 “Jogger”：

```
flatpak install flathub xyz.slothlife.Jogger
```

### Kooha

[Kooha][7] 是一个简单的屏幕录像机，具有简约的界面。你只需单击录制按钮即可，无需配置一堆设置。

Kooha 的主要特点包括：

- 录制麦克风、桌面音频或同时录制两者
- 支持 WebM、MP4、GIF 和 Matroska 格式
- 选择要录制的监视器、窗口或屏幕的一部分
- 多种来源选择
- 可配置的保存位置、指针可见性、帧速率和延迟
- 它在 Wayland 上运行得很好。

```
flatpak install flathub io.github.seadve.Kooha
```

### Warzone 2100

谁不喜欢经典的 Linux 游戏呢？

[Warzone 2100][8] 让你指挥“计划”部队，在人类几乎被核导弹摧毁后重建世界。

![][9]

Warzone 2100 于 1999 年发行，由 Pumpkin Studios 开发，是一款开创性的创新型 3D 即时战略游戏。

2004 年，Eidos 与 Pumpkin Studios 合作，以 GNU GPL 条款发布了游戏的源代码。此版本包含除音乐和游戏内视频序列之外的所有内容。当然，这些后来也被发布。

该游戏有一个问题：它使用旧的平台包（org.kde.Platform 6.4）。这意味着它需要更多的磁盘空间，但乐趣是值得的！

你可以通过单击网站上的安装按钮或使用以下命令手动安装 “Warzone 2100”：

```
flatpak install flathub net.wz2100.wz2100
```

Warzone 2100 也可以在 Fedora 仓库中以 rpm 形式使用。

*（题图原始图片由 Daimar Stein 提供）*

---

via: https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-october/

作者：[Eduard Lucena][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/x3mboy/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/10/flatpak_for_October-816x345.jpg
[2]: https://flathub.org
[3]: https://fedoramagazine.org/getting-started-flatpak/
[4]: https://flatpak.org/setup/Fedora
[5]: https://flathub.org/apps/io.github.flattool.Warehouse
[6]: https://flathub.org/apps/xyz.slothlife.Jogger
[7]: https://flathub.org/apps/io.github.seadve.Kooha
[8]: https://flathub.org/apps/net.wz2100.wz2100
[9]: https://fedoramagazine.org/wp-content/uploads/2023/10/image-1024x738.png
[0]: https://img.linux.net.cn/data/attachment/album/202311/02/210448a8vbipsdww8qk8bp.jpg
