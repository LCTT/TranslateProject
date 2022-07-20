[#]: subject: "How to Install yay AUR Helper in Arch Linux [Beginner’s Guide]"
[#]: via: "https://www.debugpoint.com/install-yay-arch/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14846-1.html"

初级：如何在 Arch Linux 中安装 Yay AUR 助手
======

![](https://www.debugpoint.com/wp-content/uploads/2021/01/yay2021.jpg)

> 这个初学者指南解释了在 Arch Linux 中安装 Yay AUR 助手的步骤。

Yay 是 “Yet Another Yogurt” 的缩写（LCTT 校注：Yogurt 是另外一个已经停止维护的 AUR 助手）。从技术上讲，它是用 [Go 编程语言][2] 编写的 [pacman][1] 封装器和 AUR 助手。它是当今最流行的 [Arch 用户仓库（AUR）][3] 助手。使用 Yay，你可以利用庞大的 Arch 用户软件包库并轻松编译和安装任何软件。

它可以自动执行许多包管理任务，例如搜索、动态解决依赖关系、编译和构建包，当然还有在 AUR 发布包。

让我们看看如何在 Arch Linux 或任何基于 Arch 的发行版（如 Manjaro）中安装 Yay。安装 Arch Linux 后，你可以通过 pacman 包管理器从三个主要的 Arch 官方仓库安装包。但是在全新的 Arch Linux 安装后，默认情况下不会安装 Yay。因此，你需要手动安装它以利用 AUR。

本指南涵盖以下主题：

* 在 Arch Linux 中安装 Yay
* 在 Manjaro 中安装 Yay
* 如何在 Arch Linux 和 Manjaro 中使用 Yay 安装包
* 一些 Yay 的技巧

### 在 Arch Linux 中安装 Yay

#### 先决条件

打开终端并运行以下命令。出现提示时提供管理员密码。这些步骤需要 [base-devel][4] 包和 git 包进行编译和安装。

```
sudo pacman -S base-devel
```

```
sudo pacman -S git
```

![Install git][5]

#### 安装 Yay

`yay` 包在 Arch 仓库中有两个版本，如下所示。

- [yay][6] – 稳定版
- [yay-git][7]– 开发版

对于本指南，我使用了稳定版。现在，进入 `/opt` 目录并克隆 git 仓库。

```
cd /opt
sudo git clone https://aur.archlinux.org/yay.git
```

![clone the yay repo][8]

更改源目录的所有者。将 `debugpoint` 替换为你的用户名。

```
sudo chown -R debugpoint:users ./yay
```

如果你不知道用户或组，可以使用以下示例查找用户和组。

```
id debugpoint
```

进入目录并编译。

```
cd yay
```

```
makepkg -si
```

这样就完成了 Arch Linux 中 Yay 的安装。

![Install yay in Arch Linux][9]

### 在 Manjaro 中安装 Yay

如果你使用 Manjaro Linux，`yay` 包可以在社区仓库中找到。你可以在 Manjaro 中使用以下命令轻松安装。

```
pacman -Syyupacman -S yay
```

现在，让我们看看如何使用 Yay 安装任何软件包，以及一些基本的 `yay` 用法。

### 如何使用 Yay 安装包

首先在 AUR 网站上搜索安装任何应用以获取包名。例如，要安装 [featherpad][10] 文本编辑器，请运行以下命令。

```
yay -S featherpad
```

安装后，你可以在应用菜单中找到应用启动器。

![Install a sample application (featherpad) using yay][11]

### 一些 Yay 的技巧

你还可以使用 yay 进行许多调整和系统操作。下面是一些示例。

**刷新系统包并升级**：

```
yay -Syu
```

**使用包的开发版本并升级（运行此命令时要小心）**：

```
yay -Syu --devel --timeupdate
```

**删除任何包（例如，featherpad）**：

```
yay -Rns featherpad
```

**快速获取系统统计信息**：

![system stat using yay][12]

```
yay -Ps
```

我希望这个初学者指南能帮助你在 [Arch Linux][13] 中安装 Yay，然后使用 Yay 安装包，并执行不同的系统操作。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/install-yay-arch/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://wiki.archlinux.org/index.php/pacman
[2]: https://golang.org/
[3]: https://wiki.archlinux.org/index.php/Arch_User_Repository
[4]: https://aur.archlinux.org/packages/meta-group-base-devel/
[5]: https://www.debugpoint.com/wp-content/uploads/2021/01/Install-git-1024x291.png
[6]: https://aur.archlinux.org/packages/yay/
[7]: https://aur.archlinux.org/packages/yay-git/
[8]: https://www.debugpoint.com/wp-content/uploads/2021/01/clone-the-yay-repo-1024x271.png
[9]: https://www.debugpoint.com/wp-content/uploads/2021/01/Install-yay-in-Arch-Linux-1024x460.png
[10]: https://aur.archlinux.org/packages/featherpad-git/
[11]: https://www.debugpoint.com/wp-content/uploads/2021/01/Install-a-sample-application-featherpad-using-yay-1024x620.png
[12]: https://www.debugpoint.com/wp-content/uploads/2021/01/system-stat-using-yay.png
[13]: https://www.debugpoint.com/tag/arch-linux/
