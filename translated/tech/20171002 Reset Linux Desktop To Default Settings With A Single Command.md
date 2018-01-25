使用一个命令重置 Linux 桌面到默认设置
======
![](https://www.ostechnix.com/wp-content/uploads/2017/10/Reset-Linux-Desktop-To-Default-Settings-720x340.jpg)

前段时间，我们分享了一篇关于 [**Resetter**][1] 的文章 - 这是一个有用的软件，可以在几分钟内将 Ubuntu 重置为出厂默认设置。使用 Resetter，任何人都可以轻松地将 Ubuntu 重置为第一次安装时的状态。今天，我偶然发现了一个类似的东西。不，它不是一个应用程序，而是一个单行的命令来重置你的 Linux 桌面设置、调整和定制到默认状态。

### 将 Linux 桌面重置为默认设置

这个命令会将 Ubuntu Unity、Gnome 和 MATE 桌面重置为默认状态。我在我的 **Arch Linux MATE** 和 **Ubuntu 16.04 Unity** 上测试了这个命令。它可以在两个系统上工作。我希望它也能在其他桌面上运行。在写这篇文章的时候，我还没有安装 GNOME 的 Linux 桌面，因此我无法确认。但是，我相信它也可以在 Gnome 桌面环境中使用。

**一句忠告：**请注意，此命令将重置你在系统中所做的所有定制和调整，包括 Unity 启动器或 Dock 中的固定应用程序、桌面小程序、桌面指示器、系统字体、GTK主题、图标主题、显示器分辨率、键盘快捷键、窗口按钮位置、菜单和启动器行为等。

好的是它只会重置桌面设置。它不会影响其他不使用 dconf 的程序。此外，它不会删除你的个人资料。

现在，让我们开始。要将 Ubuntu Unity 或其他带有 GNOME/MATE 环境的 Linux 桌面重置，运行下面的命令：
```
dconf reset -f /
```

在运行上述命令之前，这是我的 Ubuntu 16.04 LTS 桌面：

[![][2]][3]

如你所见，我已经改变了桌面壁纸和主题。

这是运行该命令后，我的 Ubuntu 16.04 LTS 桌面的样子：

[![][2]][4]

看见了么？现在，我的 Ubuntu 桌面已经回到了出厂设置。

有关 “dconf” 命令的更多详细信息，请参阅手册页。
```
man dconf
```

在重置桌面上我个人更喜欢 “Resetter” 而不是 “dconf” 命令。因为，Resetter 给用户提供了更多的选择。用户可以决定删除哪些应用程序、保留哪些应用程序、是保留现有用户帐户还是创建新用户等等。如果你懒得安装 Resetter，你可以使用这个 “dconf” 命令在几分钟内将你的 Linux 系统重置为默认设置。

就是这样了。希望这个有帮助。我将很快发布另一篇有用的指导。敬请关注！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/reset-linux-desktop-default-settings-single-command/

作者：[Edwin Arteaga][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com
[1]:https://www.ostechnix.com/reset-ubuntu-factory-defaults/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/10/Before-resetting-Ubuntu-to-default-1.png ()
[4]:http://www.ostechnix.com/wp-content/uploads/2017/10/After-resetting-Ubuntu-to-default-1.png ()
