[#]: subject: "Fixing 'target not found' Error in Arch Linux"
[#]: via: "https://itsfoss.com/target-not-found-arch-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

修复 Arch Linux 中的 “target not found” 错误
======

有一天，我尝试在 Arch Linux 上安装 Hyprland。当我使用 [Pacman 命令安装][1]它时，它抛出 “target not found” 错误。

````

    [abhishek@itsfoss ~]$ sudo pacman -S hyprland
    [sudo] password for abhishek:
    error: target not found: hyprland
    [abhishek@itsfoss ~]

````

这是一个意外，因为我知道 Hyprland 是可用的。

**我的修复方法**是更新系统，在大多数情况下，它可以解决此问题。

````

     sudo pacman -Syu

````

这里，本地包数据库不同步。我需要更新缓存。这里还建议更新系统。

在大多数情况下，这就是修复此错误的方法。但是，你看到此错误的原因可能还有其他一些。让我在这里详细讨论它们。

###修复：更新系统

Arch Linux 是一个[滚动发布发行版][2]，并且它提供的更新非常频繁。如果你不每隔几天更新一次系统，你的本地包数据库将与远程镜像不同步，并且你将在安装软件包时遇到问题。

本地包数据库仅保留包的元数据，例如版本号、用于获取包的仓库 URL 等。

当你搜索软件包时，pacman 会提供搜索结果，表明该软件包可用。但是，该包在你的本地数据库中具有较旧的版本号。当 pacman 在远程仓库中搜索包（以获取实际的包）时，它不再找到旧版本的 URL。

这就是导致 “target not found” 错误的原因。

修复方法是更新本地数据库。这可以与 `pacman -Sy` 一起使用，但是，建议[更新整个 Arch Linux 系统][3]以避免依赖冲突等。

````

     sudo pacman -Syu

````

📋

如果你已有几周没有更新系统，请做好更新超过 1 GB 的准备。这可能需要一些时间，具体取决于你的互联网速度和你使用的镜像。

就我而言，Arch 安装在我的辅助系统上。由于我一周左右无法使用它，该系统已经过时了。更新后，我就可以安装 [Hyprland][4]。

![][5]

💡

如果这不起作用，请通过添加额外的 y 强制刷新所有包数据库： sudo pacman -Syyu

### 修复 “target not found” 错误的其他建议

如果上述方法没有为你解决此错误，这里有一些修复此错误的提示。

#### 仔细检查包名称

我亲爱的 Watson，这可能看起来很简单，但人们通常只是错误地输入了包名称。

Linux 区分大小写，包通常以小写命名。因此，如果你流行的工具是 Flameshot，那么它的包名称很可能是 flameshot。

此外，某些软件的拼写与常见软件的拼写不同。例如，它是 hyprland，这使我错误地输入了 hyperland（使用通常的 “hyper” 拼写）。

![][6]

在极少数情况下，可能会混淆是 `l`、`I` 或者 `1`。

基本上，确保你输入的包名称是正确的。

#### 查看该软件包在仓库中是否可用

Arch Linux 的仓库中有大量软件包。但这并不意味着它拥有所有可能的 Linux 软件包。

访问 Arch Linux 官方软件包网站：

[Arch Linux 软件包搜索][7]

在这里输入包名，查看该包是否可用。如果是，它是哪个仓库以及它在哪个设备上可用。

![][8]

`x86_64` 适用于 Intel 架构，任何包含 ARM 架构的均适用于[树莓派类设备][9]。

💡

如果在某些仓库中找到该软件包，但 pacman 即使在更新的系统上也找不到它，请检查 pacman conf 文件并查看是否启用了所述仓库。

#### 确保它不是 AUR 包

[Arch User Repository (AUR)][10] 是提供更新包的附加社区支持平台。

现在，有多种使用 AUR 包的方法，但 pacman 不是其中之一。

检查你尝试安装的软件包是否是 AUR 软件包。首先检查官方 Arch 仓库，如上所述。如果不存在，请检查 AUR 页面。

如果它是 AUR 包，则必须 [使用 yay][11] 或一些[其他 AUR 帮助程序][12]。你不能使用 pacman 安装 AUR 软件包。

### 你能解决这个问题吗？

在大多数情况下，更新系统可以解决此问题。在极少数情况下，可能还有其他原因，我已经提到了一些建议。

现在轮到你了。如果你能够解决此问题，请在评论区告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/target-not-found-arch-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/pacman-command/
[2]: https://itsfoss.com/rolling-release/
[3]: https://itsfoss.com/update-arch-linux/
[4]: https://hyprland.org/
[5]: https://itsfoss.com/content/images/2023/11/installing-hyperland.png
[6]: https://itsfoss.com/content/images/2023/11/pacman-target-not-found-error-arch-linux.png
[7]: https://archlinux.org/packages/
[8]: https://itsfoss.com/content/images/2023/11/arch-linux-package-search.png
[9]: https://itsfoss.com/raspberry-pi-alternatives/
[10]: https://itsfoss.com/aur-arch-linux/
[11]: https://itsfoss.com/install-yay-arch-linux/
[12]: https://itsfoss.com/best-aur-helpers/
