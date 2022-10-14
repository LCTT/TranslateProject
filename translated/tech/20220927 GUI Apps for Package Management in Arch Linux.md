[#]: subject: "GUI Apps for Package Management in Arch Linux"
[#]: via: "https://itsfoss.com/arch-linux-gui-package-managers/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

# Arch Linux 中用于包管理的 GUI 应用

[安装 Arch Linux][1] 被认为具有挑战性。这就是为什么[有几个基于 Arch 的发行版][2]通过提供图形化的安装程序使事情变得简单。

即使你设法安装了 Arch Linux，你也会注意到它严重依赖命令行。如果你需要安装应用或更新系统，那么必须打开终端。

是的！ Arch Linux 没有软件中心。我知道，这让很多人感到震惊。

如果你对使用命令行管理应用感到不舒服，你可以安装一个 GUI 工具。这有助于在舒适的 GUI 中搜索包以及安装和删除它们。

想知道你应该使用 [pacman 命令][3]的哪个图形前端？我有一些建议可以帮助你入门。

**请注意，某些软件管理器是特定于桌面环境的。**

### 1. Apper

![使用 Apper 安装 Firefox][4]

Apper 是使用 PackageKit 的最小化 Qt5 应用和包管理器，它还支持 AppStream 和自动更新。但是，**没有 AUR 支持**。

要从官方仓库安装它，请使用以下命令。

```
sudo pacman -Syu apper
```

[GitLab 上的应用][5]

### 2. 深度应用商店

![使用深度应用商店安装 Firefox][6]

深度应用商店是深度桌面环境的应用商店，使用 DTK（QT5）构建，使用 PackageKit，支持 AppStream，同时提供系统更新通知。 **没有 AUR 支持**。

要安装它，请使用以下命令。

```
sudo pacman -Syu deepin-store
```

[Github 上的深度商店][7]

### 3. Discover

![使用 Discover 安装 Firefox][8]

Discover 不需要为 KDE Plasma 用户介绍。它是一个使用 PackageKit 的基于 Qt 的应用管理器，支持 AppStream、Flatpak 和固件更新。

为了安装 Flatpak 和固件更新，需要分别安装 Discover 的 `flatpak` 和 `fwupd` 包。

它没有 AUR 支持。

```
sudo pacman -Syu discover packagekit-qt5
```

[GitLab 上的 Discover][9]

### 4. GNOME PackageKit

![Installing Firefox using GNOME PackageKit][10]

GNOMEPackageKit 是一个使用 PackageKit 的 GTK3 包管理器，支持 AppStream。不幸的是，**没有 AUR 支持**。

要从官方仓库安装它，请使用以下命令。

```
sudo pacman -Syu gnome-packagekit
```

[freedesktop 上的 PackageKit][11]

### 5. GNOME 软件

![Installing Firefox using GNOME Software][12]

GNOME 软件不需要向 GNOME 桌面用户介绍。它是使用 PackageKit 的 GTK4 应用管理器，支持 AppStream、Flatpak 和固件更新。

它没有 AUR 支持。要安装来自 GNOME 软件的 Flatpak 和固件更新，需要分别安装 `flatpak` 和 `fwupd` 包。

安装它使用：

```
sudo pacman -Syu gnome-software-packagekit-plugin gnome-software
```

[GitLab 上的 GNOME 软件][13]

### 6. tkPacman

![使用 tkPacman 安装 Firefox][14]

它是用 Tcl 编写的 Tk pacman 包装器。界面类似于 [Synaptic 包管理器][15]。

由于没有 GTK/Qt 依赖，它非常轻量级，因为它使用 Tcl/Tk GUI 工具包。

它不支持 AUR，这很讽刺，因为你需要从 [AUR][16] 安装它。你需要事先安装一个 [AUR 助手][17]，如 yay。

```
yay -Syu tkpacman
```

[Sourceforge 上的 tkPacman][18]

### 7. Octopi

![使用 Octopi 安装 Firefox][19]

可以认为它是 tkPacman 的更好看的表亲。它使用 Qt5 和 Alpm，还支持 Appstream 和 **AUR (通过 yay)**。

你还可以获得桌面通知、仓库编辑器和缓存清理器。它的界面类似于 Synaptic 包管理器。

要从 AUR 安装它，请使用以下命令。

```
yay -Syu octopi
```

[GitHub 上的 Octopi][20]

### 8. Pamac

![使用 Pamac 安装 Firefox][21]

Pamac 是 Manjaro Linux 的图形包管理器。它基于 GTK3 和 Alpm，**支持 AUR、Appstream、Flatpak 和 Snap**。

Pamac 还支持自动下载更新和降级软件包。

它是 Arch Linux 衍生版中使用最广泛的应用。但因为 [DDoS AUR 网页][22]而臭名昭著。

[在 Arch Linux 上安装 Pamac][23] 有几种方法。最简单的方法是使用 AUR 助手。

```
yay -Syu pamac-aur
```

[GitLab 上的 Pamac][24]

### 总结

要删除任何上面 GUI 包管理器以及依赖项和配置文件，请使用以下命令将 _packagename_ 替换为要删除的包的名称。

```
sudo pacman -Rns packagename
```

这样看来，Arch Linux 也可以在不接触终端的情况下使用合适的工具。

还有一些其他应用程序也使用终端用户界面 (TUI)。一些例子是 [pcurses][25]、[cylon][26]、[pacseek][27] 和 [yup][28]。但是，这篇文章只讨论那些有适当的 GUI 的软件。

**注意：** PackageKit 默认打开系统权限，否则[不推荐][29]用于一般用途。因为如果用户是 wheel 组的一部分，更新或安装任何软件都不需要密码。

**你看到了在 Arch Linux 上使用 GUI 软件中心的几种选择。现在是时候决定使用其中一个了。你会选择哪一个？Pamac 或 OctoPi 还是其他？现在就在下面留言吧**。

---

via: https://itsfoss.com/arch-linux-gui-package-managers/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者 ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/install-arch-linux/
[2]: https://itsfoss.com/arch-based-linux-distros/
[3]: https://itsfoss.com/pacman-command/
[4]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[5]: https://invent.kde.org/system/apper
[6]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[7]: https://github.com/dekzi/dde-store
[8]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[9]: https://invent.kde.org/plasma/discover
[10]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[11]: https://freedesktop.org/software/PackageKit/index.html
[12]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[13]: https://gitlab.gnome.org/GNOME/gnome-software
[14]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[15]: https://itsfoss.com/synaptic-package-manager/
[16]: https://itsfoss.com/aur-arch-linux/
[17]: https://itsfoss.com/best-aur-helpers/
[18]: https://sourceforge.net/projects/tkpacman
[19]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[20]: https://github.com/aarnt/octopi
[21]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[22]: https://gitlab.manjaro.org/applications/pamac/-/issues/1017
[23]: https://itsfoss.com/install-pamac-arch-linux/
[24]: https://gitlab.manjaro.org/applications/pamac
[25]: https://github.com/schuay/pcurses
[26]: https://github.com/gavinlyonsrepo/cylon
[27]: https://github.com/moson-mo/pacseek
[28]: https://github.com/ericm/yup
[29]: https://bugs.archlinux.org/task/50459
