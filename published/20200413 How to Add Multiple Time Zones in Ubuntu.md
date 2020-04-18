[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12121-1.html)
[#]: subject: (How to Add Multiple Time Zones in Ubuntu)
[#]: via: (https://itsfoss.com/add-multiple-time-zones-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 中添加多个时区
======

> 本快速教程介绍了在 Ubuntu 和其他发行版中使用 GNOME 桌面环境添加多时区时钟的步骤。

![](https://img.linux.net.cn/data/attachment/album/202004/18/142021jborblzkglbebrkk.jpg)

如果你的家人或同事在另一个国家，或者你居住在一个有多个时区的国家，那么了解时差就变得很重要。毕竟，你不想在凌晨 4 点打电话打扰别人。

一些 Linux 用户还会记下 [UTC 时间][1]，因为大多数服务器都使用 UTC。

如果你有多个时钟，那么可以更好地管理此类情况。你可以将一个时钟设置为本地时间，并将其他时钟同步到其他时区。这使得了解不同时间变得更加容易。

在本教程中，我将向你展示如何在 Ubuntu 和其他使用 GNOME 桌面环境的 Linux 发行版中添加其他时钟。

### 在 Ubuntu（以及其他使用 GNOME 的 Linux）中添加多个时区时钟

请[检查你正在使用的桌面环境][2]。本教程仅适用于 GNOME 桌面。

要添加其他时钟，可以使用一个叫 [GNOME Clocks][3] 的小程序。

GNOME Clocks 是一个简单的应用，它可以显示多个位置的时间和日期。你也可以使用它来设置闹钟或计时器，它还包括秒表功能。

GNOME Clocks 存在于 Ubuntu 的 Universe 仓库中。因此，请确保首先[启用 Universe 仓库][4]。

你可以在软件中心中搜索 “GNOME Clocks” 并从那里安装它。

![Gnome Clocks Ubuntu Software Center][5]

或者，你可以打开终端并使用以下命令来安装 GNOME Clocks：

```
sudo apt install gnome-clocks
```

如果你使用的是其他 Linux 发行版，那么请使用发行版的软件中心或软件包管理器来安装此程序。

安装后，请按 `Super` 键（ `Windows` 键）并搜索 clocks：

![Gnome Clocks App Search Ubuntu][6]

启动程序，你应该会看到一个界面，提供一些选项，例如添加世界时钟、设置闹钟、使用秒表和计时器。

单击左上角的 “+” 号，它将为你提供搜索地理位置的选项。搜索、选择并添加。

![Adding additional clocks][7]

通过地理位置添加所需的时区后，你可以看到现在在消息托盘中添加了这个新时钟。它还显示了你当地时间与其他时区之间的时差。

![Multiple clocks for multiple time zones][8]

你可以使用 `Super + M` 键快速打开消息托盘。你可以掌握这些[有用的 Ubuntu 快捷方式][9]来节省时间。

如果要删除其他时钟，你可以从 GNOME Clocks 应用界面执行以下操作：

![Remove Additional Clocks][10]

你无法（在这里）删除当前时区并设置为其他时区。有其他方法[更改 Linux 中的当前时区][11]。

我希望你喜欢这个快速技巧。欢迎提出问题和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/add-multiple-time-zones-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Coordinated_Universal_Time
[2]: https://itsfoss.com/find-desktop-environment/
[3]: https://wiki.gnome.org/Apps/Clocks
[4]: https://itsfoss.com/ubuntu-repositories/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/gnome-clocks-ubuntu-software-center.jpg?ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/gnome-clocks-app-search-ubuntu.jpg?ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/add-multiple-time-zones-gnome.jpg?ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/multiple-clocks-ubuntu.jpg?ssl=1
[9]: https://itsfoss.com/ubuntu-shortcuts/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/remove-additional-clocks-ubuntu.jpg?ssl=1
[11]: https://itsfoss.com/change-timezone-ubuntu/
