[#]: subject: "Manage Flatpak Permission Using Flatseal"
[#]: via: "https://www.debugpoint.com/2022/06/manage-flatpak-permission-flatseal/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 Flatseal 管理 Flatpak 的权限
======
了解如何使用 Flatseal 应用管理 Flatpak 权限，它为你提供了一个友好的 GUI 和额外的功能。

从新用户的角度来看，在 Linux 中安装应用可能是一个挑战。主要原因是有这么多的 [Linux 发行版][1]。而你需要为各种 Linux 发行版提供不同的安装方法或说明。对于一些用户来说，这可能会让他们不知所措。此外，对于开发者来说，为不同的发行版创建独立的软件包和构建也很困难。

### Flatpak 解决了这个问题。如何解决？

它使用了容器技术，使同一个应用的可执行文件在所有的 Linux 平台上都能类似地运行。例如，一个单一的可执行文件可以在 Ubuntu、Fedora、OpenSUSE、Arch Linux 和许多其他平台上运行。

此外，开发人员还可以减少为不同平台打包同一应用的努力。他们可以专注于应用的功能，而不是发行或部署。

此外，Flatpak 应用还能即时更新，当有了最新版本，你就能得到它。

所有这些好处也开启了一个重要的问题。Flatpak 应用需要的权限是什么？你如何轻松地管理它们？例如，一个应用可能只需要网络访问，而不需要磁盘空间。或者另一个可能有截图的权限，但可能根本就不需要。

所以，审查一个 Flatpak 应用的权限是非常必要的。这与你的安卓或 iOS 应用的权限类似。

最后，即使你是一个新用户，管理和审查权限也不是那么困难，这要感谢图形化的应用 - Flatseal。

### 什么是 Flatseal？

Flatseal 是一个 Flatpak 应用，它为你提供了一个友好的用户界面来查看和改变你系统中所有 Flatpak 应用的权限。

它是一个优秀的小程序，每个应用的每个权限部分都有一个易于使用的切换按钮。下面是它的外观（图 1）。

![Figure 1 – Flatseal App][2]

### 你如何使用 Flatseal 来管理 Flatpak 的权限？

当打开 Flatseal 应用时，它应该在左边的导航栏列出所有的 Flatpak 应用。而当你选择了一个应用，它就会在右边的主窗口中显示可用的权限设置。

现在，对于每个 Flatpak 权限控制，当前值显示在切换开关中。如果该权限正在使用中，它应该被设置。否则，它应该是灰色的。

首先，要设置权限，你必须进入你的系统的应用。然后，你可以从权限列表中启用或禁用任何各自的控制。

其次，如果你想设置一个适用于你系统中所有 Flatpak 的全局控制，你可以在左上方选择“所有应用”并应用全局设置（图 2）。

![Figure 2: Manage Flatpak Permission using Flatseal][3]

这真是超级简单。不是吗？

### 使用 Flatseal 管理 Flatpak 权限的例子

让我们举个例子。

在我的系统中，我安装了上述 Flatpak（图 2）。让我们挑选 Telegram 桌面应用。目前，Telegram 桌面没有访问任何主目录或用户文件的权限（图 3）。

![Figure 3: Telegram Desktop Flatpak App does not have permission to the home folders][4]

现在，如果我想允许所有的用户文件和任何特定的文件夹（例如：/home/Downloads），你可以通过打开启用开关来给予它。请看下面的图 4。

![Figure 4: Permission changed of Telegram Desktop to give access to folders][5]

同样地，你可以启用或禁用你想要的权限。在内部，Flatseal 执行内部的 Flatpak 命令来实现这一点。

例如，上述情况可能转化为以下命令。

```
flatpak override org.telegram.desktop --filesystem=/home/Downloads
```

而要删除：

```
flatpak override org.telegram.desktop --nofilesystem=/home/Downloads
```

Flatseal 还有一个很酷的功能，它在用户特定的权限变化旁边显示一个小的警报图标（见图 4）。

### 我可以在所有的 Linux 发行版中安装 Flatseal 吗？

是的，你可以把 [Flatseal][6] 作为 Flatpak 安装在所有 Linux 发行版中。你可以使用[本指南][7]设置你的系统，并运行以下命令进行安装。或者，[点击这里][8]直接启动特定系统的安装程序。

```
flatpak install flathub com.github.tchx84.Flatseal
```

### 结束语

我希望上面的 Flatpak 权限管理指南足够简单，让你了解并开始使用 Flatpak。它超级容易控制，使用起来也容易得多。另外，你可能想访问我们更多的 [Flatpak 指南][9]。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/06/manage-flatpak-permission-flatseal/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/category/distributions
[2]: https://www.debugpoint.com/wp-content/uploads/2022/06/Flatseal-App.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/06/Manage-Flatpak-Permission-using-Flatseal.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/06/Telegram-Desktop-Flatpak-App-does-not-have-permission-to-the-home-folders.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/06/Permission-changed-of-Telegram-Desktop-to-give-access-to-folders.jpg
[6]: https://flathub.org/apps/details/com.github.tchx84.Flatseal
[7]: https://flatpak.org/setup/
[8]: https://dl.flathub.org/repo/appstream/com.github.tchx84.Flatseal.flatpakref
[9]: https://www.debugpoint.com/tag/flatpak/
