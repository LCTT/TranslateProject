[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13122-1.html)
[#]: subject: (Paru – A New AUR Helper and Pacman Wrapper Based on Yay)
[#]: via: (https://itsfoss.com/paru-aur-helper/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

Paru：基于 Yay 的新 AUR 助手
======

![](https://img.linux.net.cn/data/attachment/album/202102/16/101301ldekk9kkpqlplke6.jpg)

[用户选择 Arch Linux][1] 或 [基于 Arch 的 Linux 发行版][2]的主要原因之一就是 [Arch 用户仓库（AUR）][3]。

遗憾的是，[pacman][4]，也就是 Arch 的包管理器，不能以类似官方仓库的方式访问 AUR。AUR 中的包是以 [PKGBUILD][5] 的形式存在的，需要手动过程来构建。

AUR 助手可以自动完成这个过程。毫无疑问，[yay][6] 是最受欢迎和备受青睐的 AUR 助手之一。

最近，`yay` 的两位开发者之一的 [Morganamilo][7][宣布][8]将退出 `yay` 的维护工作，以开始自己的 AUR 助手 [paru][9]。`paru` 是用 [Rust][10] 编写的，而 `yay` 是用 [Go][11] 编写的，它的设计是基于 yay 的。

请注意，`yay` 还没有结束支持，它仍然由 [Jguer][12] 积极维护。他还[评论][13]说，`paru` 可能适合那些寻找丰富功能的 AUR 助手的用户。因此我推荐大家尝试一下。

### 安装 Paru AUR 助手

要安装 `paru`，打开你的终端，逐一输入以下命令：

```
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

现在已经安装好了，让我们来看看如何使用它。

### 使用 Paru AUR 助手的基本命令

在我看来，这些都是 `paru` 最基本的命令。你可以在 [GitHub][9] 的官方仓库中探索更多。

  * `paru <用户输入>`：搜索并安装“用户输入”
  * `paru -`：`paru -Syu` 的别名
  * `paru -Sua`：仅升级 AUR 包。
  * `paru -Qua`：打印可用的 AUR 更新
  * `paru -Gc <用户输入>`：显示“用户输入”的 AUR 评论

### 充分使用 Paru AUR 助手

你可以在 GitHub 上访问 `paru` 的[更新日志][14]来查看完整的变更日志历史，或者你可以在[首次发布][15]中查看对 `yay` 的变化。

#### 在 Paru 中启用颜色

要在 `paru` 中启用颜色，你必须先在 `pacman` 中启用它。所有的[配置文件][16]都在 `/etc` 目录下。在此例中，我[使用 Nano 文本编辑器][17]，但是，你可以选择使用任何[基于终端的文本编辑器][18]。

```
sudo nano /etc/pacman.conf
```

打开 `pacman` 配置文件后，取消 `Color` 的注释，即可启用此功能。

![][19]

#### 反转搜索顺序

根据你的搜索条件，最相关的包通常会显示在搜索结果的顶部。在 `paru` 中，你可以反转搜索顺序，使你的搜索更容易。

与前面的例子类似，打开 `paru` 配置文件：

```
sudo nano /etc/paru.conf
```

取消注释 `BottomUp` 项，然后保存文件。

![][20]

如你所见，顺序是反转的，第一个包出现在了底部。

![][21]

#### 编辑 PKGBUILD （对于高级用户）

如果你是一个有经验的 Linux 用户，你可以通过 `paru` 编辑 AUR 包。要做到这一点，你需要在 `paru` 配置文件中启用该功能，并设置你所选择的文件管理器。

在此例中，我将使用配置文件中的默认值，即 vifm 文件管理器。如果你还没有使用过它，你可能需要安装它。

```
sudo pacman -S vifm
sudo nano /etc/paru.conf
```

打开配置文件，如下所示取消注释。

![][22]

让我们回到 [Google Calendar][23] 的 AUR 包，并尝试安装它。系统会提示你审查该软件包。输入 `Y` 并按下回车。

![][24]

从文件管理器中选择 PKGBUILD，然后按下回车查看软件包。

![][25]

你所做的任何改变都将是永久性的，下次升级软件包时，你的改变将与上游软件包合并。

![][26]

### 总结

`paru` 是 [AUR 助手家族][27]的又一个有趣的新成员，前途光明。此时，我不建议更换 `yay`，因为它还在维护，但一定要试试 `paru`。你可以把它们两个都安装到你的系统中，然后得出自己的结论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/paru-aur-helper/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-arch-linux/
[2]: https://itsfoss.com/arch-based-linux-distros/
[3]: https://itsfoss.com/aur-arch-linux/
[4]: https://itsfoss.com/pacman-command/
[5]: https://wiki.archlinux.org/index.php/PKGBUILD
[6]: https://news.itsfoss.com/qt-6-released/
[7]: https://github.com/Morganamilo
[8]: https://www.reddit.com/r/archlinux/comments/jjn1c1/paru_v100_and_stepping_away_from_yay/
[9]: https://github.com/Morganamilo/paru
[10]: https://www.rust-lang.org/
[11]: https://golang.org/
[12]: https://github.com/Jguer
[13]: https://aur.archlinux.org/packages/yay/#pinned-788241
[14]: https://github.com/Morganamilo/paru/releases
[15]: https://github.com/Morganamilo/paru/releases/tag/v1.0.0
[16]: https://linuxhandbook.com/linux-directory-structure/#-etc-configuration-files
[17]: https://itsfoss.com/nano-editor-guide/
[18]: https://itsfoss.com/command-line-text-editors-linux/
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/pacman.conf-color.png?resize=800%2C480&ssl=1
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/paru.conf-bottomup.png?resize=800%2C480&ssl=1
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/paru.conf-bottomup-2.png?resize=800%2C480&ssl=1
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/paru.conf-vifm.png?resize=732%2C439&ssl=1
[23]: https://aur.archlinux.org/packages/gcalcli/
[24]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/paru-proceed-for-review.png?resize=800%2C480&ssl=1
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/paru-proceed-for-review-2.png?resize=800%2C480&ssl=1
[26]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/paru-proceed-for-review-3.png?resize=800%2C480&ssl=1
[27]: https://itsfoss.com/best-aur-helpers/
[28]: https://news.itsfoss.com/