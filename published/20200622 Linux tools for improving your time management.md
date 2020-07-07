[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12388-1.html)
[#]: subject: (Linux tools for improving your time management)
[#]: via: (https://opensource.com/article/20/6/linux-time-management)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)

时间管理专家的 Linux 工具
======

> 无论你是需要帮助来保持专注、保持及时性，还是为了找到避免重复的捷径，这些 Linux 工具能够帮助你。

![](https://img.linux.net.cn/data/attachment/album/202007/07/084943stbchr65ke6r1cqh.jpg)

生产力是一个主观术语，但从本质上讲，它是衡量特定任务完成效率的标准。每个人都有不同的方式来提高他们的生产力：有些人需要帮助专注于任务里、有些人需要特殊的工作环境、有些人需要警报和提醒以避免错过截止日期，还有些人需要协助处理重复的手工活。幸运的是，有多种工具和技术可为你提供所需的特定支持。特别地，如果你是 Linux 用户，有一些调整可以帮助你提高生产力。这是我经常使用的两个。

### 剪贴板指示器

你是否在日常使用中，在多个文档之间的大量使用复制和粘贴？如果是这样，那么 [剪贴板指示器][2] 应该成为你的首选方案之一。将剪贴板指示器作为 GNOME 扩展安装到 Linux 发行版中。以我的经验，它对 GNOME Shell 的性能影响很小，至少比我尝试过的其他方案要小。

该工具添加了一个指示器菜单到顶部面板，并缓存剪贴板历史。你可以设置历史记录大小、要预览的字符数量。它可以在复制时显示通知，并充当保存任意复制内容的临时空间。

![Clipboard indicator menu on GNOME desktop][3]

安装扩展程序和连接器的最简单方法是使用发行版的包管理器。

对于 Fedora、CentOS 或 RHEL，请使用：

```
$ sudo dnf install chrome-gnome-shell
```

在 Ubuntu 或 Debian 上，请改用  `apt install`。

安装完成后，进入 <https://extensions.gnome.org/> 并查看已安装的扩展。

如果你使用的是 Firefox，请使用 Firefox 浏览器附加组件并安装 “GNOME Shell integration”。你将在 Firefox 工具栏中看到一个很小的脚印图标，它将带你进入“扩展”页面。在该页面上，搜索 “Clipboard Indicator” 扩展并启用它。

现在，按照提示下载 GNOME 扩展并激活它。你可以查看 `~/.local/share/gnome-shell/extensions` 来浏览你的扩展。

好了！你将在 GNOME 桌面的右上角看到一个新图标。复制任意内容并尝试其设置。

也可以使用以下命令通过 Git 进行快速安装：将仓库克隆到本地的 gnome-shell 扩展目录中：

```
$ git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git ~/.local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com
```

进入 GNOME Tweaks 工具，然后从“扩展”页面激活它。

### 番茄计时器（Pomodoro）

![Using the pomodoro timer on GNOME][4]

Pomodoro 技术是一种时间管理理念，旨在为用户提供最大注意力。每个 25 分钟的工作时间称为“pomodoro”（意大利语的“番茄”）；每个番茄之后，你需要休息五分钟。每四个番茄时间，即每 100 分钟，你就要休息 15 至 20 分钟。如果你有大量的待办事项，那么使用 Pomodoro 技术可以通过强迫你遵守严格的时间安排来帮助你更快地完成项目。

可以通过 GNOME Tweaks 网页 （extensions.gnome.org）或通过命令行来管理安装过程。对于后者，请根据你的 Linux 发行版和版本，并使用以下命令进行安装：

```
$ sudo dnf install gnome-shell-extension-pomodoro
```

或者，如果你希望从源代码构建：

```
$ git clone -b gnome-3.34 https://github.com/codito/gnome-pomodoro.git
$ cd gnome-pomodoro
```

源码有许多依赖关系，其中许多可能已经安装。为了确保这点，请安装以下内容。

```
$ sudo dnf install autoconf-archive gettext vala vala-tools pkg-config desktop-file-utils glib2-devel gtk3-devel libappstream-glib-devel libappindicator-gtk3-devel libcanberra-devel libpeas-devel sqlite-devel gom-devel gobject-introspection-devel gsettings-desktop-schemas-devel gstreamer1-devel
```

在源代码的解压目录中，完成构建。

```
$ ./autogen.sh --prefix=/usr --datadir=/usr/share 
$ make 
$ sudo make install 
```

不管是怎么安装的，请进入 GNOME Tweaks 并打开番茄计时器。如果你还没有 GNOME Tweaks，请通过包管理器或所选的软件安装程序进行安装。例如，在 Fedora 上：

```
$ sudo dnf install gnome-tweaks
```

在 Ubuntu 或 Debian上，请改用 `apt install`。

Pomodoro 桌面集成当前可在 GNOME Shell 中使用，并且它们计划在将来支持更多桌面。 查看 <https://gnomepomodoro.org/> 获取有关该项目的最新信息。同时，对于 KDE 用户，还有一个名为 [Fokus][5] 的替代品。

### Linux 上的生产力

生产力是个人的，但这是我们所有人都在以某种方式追求的东西。这些工具中的每一个要么节省了我的时间，要么使我的工作效率提高了，它们可以与 Linux 快速集成。

你是否有喜欢的生产力工具？请在评论中分享！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/linux-time-management

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://extensions.gnome.org/extension/779/clipboard-indicator/
[3]: https://opensource.com/sites/default/files/uploads/gnome-tweaks-productivity_0.png (Clipboard indicator menu on GNOME desktop)
[4]: https://opensource.com/sites/default/files/uploads/pomodoro-timer-fedora-opensourcecom.png (Using the pomodoro timer on GNOME)
[5]: https://store.kde.org/p/1308861/
