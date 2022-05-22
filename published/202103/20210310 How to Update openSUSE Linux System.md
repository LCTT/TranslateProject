[#]: subject: (How to Update openSUSE Linux System)
[#]: via: (https://itsfoss.com/update-opensuse/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13199-1.html)

如何更新 openSUSE Linux 系统
======

![](https://img.linux.net.cn/data/attachment/album/202103/13/110932nsq33tjit9933h2k.jpg)

就我记忆所及，我一直是 Ubuntu 的用户。我曾经转向过其他发行版，但最终还是一次次回到 Ubuntu。但最近，我开始使用 openSUSE 来尝试一些非 Debian 的东西。

随着我对 [openSUSE][1] 的不断探索，我不断发现 SUSE 中略有不同的东西，并打算在教程中介绍它们。

第一篇我写的是更新 openSUSE 系统。有两种方法可以做到：

  * 使用终端（适用于 openSUSE 桌面和服务器）
  * 使用图形工具（适用于 openSUSE 桌面）

### 通过命令行更新 openSUSE

更新 openSUSE 的最简单方法是使用 `zypper` 命令。它提供了补丁和更新管理的全部功能。它可以解决文件冲突和依赖性问题。更新也包括 Linux 内核。

如果你正在使用 openSUSE Leap，请使用这个命令：

```
sudo zypper update
```

你也可以用 `up` 代替 `update`，但我觉得 `update` 更容易记住。

如果你正在使用 openSUSE Tumbleweed，请使用  `dist-upgrade` 或者 `dup`（简称）。Tumbleweed 是[滚动发行版][2]，因此建议使用 `dist-upgrade` 选项。

```
sudo zypper dist-upgrade
```

它将显示要升级、删除或安装的软件包列表。

![][3]

如果你的系统需要重启，你会得到通知。

如果你只是想刷新仓库（像 `sudo apt update` 一样），你可以使用这个命令：

```
sudo zypper refresh
```

如果你想列出可用的更新，也可以这样做：

```
sudo zypper list-updates
```

### 以图形方式更新 openSUSE

如果你使用 openSUSE 作为桌面，你可以选择使用 GUI 工具来安装更新。这个工具可能会根据 [你使用的桌面环境][4] 而改变。

例如，KDE 有自己的软件中心，叫做 “Discover”。你可以用它来搜索和安装新的应用。你也可以用它来安装系统更新。

![][5]

事实上，KDE 会在通知区通知你可用的系统更新。你必须打开 Discover，因为点击通知不会自动进入 Discover。

![][6]

如果你觉得这很烦人，你可以使用这些命令禁用它：

```
sudo zypper remove plasma5-pk-updates
sudo zypper addlock plasma5-pk-updates
```

不过我不推荐。最好是获取可用的更新通知。

还有一个 YAST 软件管理 [GUI 工具][7]，你可以用它来对软件包管理进行更精细的控制。

![][8]

就是这些了。这是一篇简短的文章。在下一篇 SUSE 教程中，我将通过实例向大家展示一些常用的 `zypper` 命令。敬请期待。

--------------------------------------------------------------------------------

via: https://itsfoss.com/update-opensuse/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.opensuse.org/
[2]: https://itsfoss.com/rolling-release/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/update-opensuse-with-zypper.png?resize=800%2C406&ssl=1
[4]: https://itsfoss.com/find-desktop-environment/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/opensuse-update-gui.png?resize=800%2C500&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/update-notification-opensuse.png?resize=800%2C259&ssl=1
[7]: https://itsfoss.com/gui-cli-tui/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/yast-software-management-suse.png?resize=800%2C448&ssl=1
