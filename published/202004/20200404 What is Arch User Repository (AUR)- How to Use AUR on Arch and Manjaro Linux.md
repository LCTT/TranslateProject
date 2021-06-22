[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12107-1.html)
[#]: subject: (What is Arch User Repository (AUR)? How to Use AUR on Arch and Manjaro Linux?)
[#]: via: (https://itsfoss.com/aur-arch-linux/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

什么是 Arch 用户仓库（AUR）以及如何使用？
======

如果你一直在使用 [Arch Linux][1] 或其他基于 Arch 的发行版，如 Manjaro，那么可能会遇到 AUR。你尝试安装新软件，有人建议从 AUR 中安装它。这让你感到困惑。

什么是 AUR？为什么使用它？如何使用 AUR？我将在本文中回答这些问题。

### 什么是 AUR？

![][2]

AUR 表示<ruby>Arch 用户仓库<rt>Arch User Repository</rt></ruby>。它是针对基于 Arch 的 Linux 发行版用户的社区驱动的仓库。它包含名为 [PKGBUILD][3] 的包描述，它可让你使用 [makepkg][4] 从源代码编译软件包，然后通过 [pacman][5]（Arch Linux 中的软件包管理器）安装。

创建 AUR 的目的是组织和共享社区中的新软件包，并帮助加速将流行的软件包纳入[社区仓库][6]。

进入官方仓库的大量新软件包都从 AUR 开始。在 AUR 中，用户可以贡献自己的软件包构建（PKGBUILD 和相关文件）。

AUR 社区可以对 AUR 中的软件包进行投票。如果一个软件包变得足够流行（假设它具有兼容的许可证和良好的打包技术），那么可以将其加入 `pacman` 直接访问的社区仓库中。

> 简而言之，AUR 是开发人员在 Arch 仓库中正式包含新软件之前向 Arch Linux 用户提供新软件的一种方式。

### 你应该使用 AUR 吗？有什么风险？

使用 AUR 就像过马路一样。如果你谨慎操作，应该就没问题。

如果你刚接触 Linux，建议你在建立有关 Arch/Manjaro 和 Linux 的基础知识之前不要使用 AUR。

的确，任何人都可以将软件包上传到 AUR，但[受信任用户][7]（TU）负责监视上传的内容。尽管 TU 对上传的软件包执行质量控制，但不能保证 AUR 中的软件包格式正确或没有恶意。

在实践中，AUR 似乎很安全，但理论上讲它可以造成一定程度的损害，但前提是你不小心。从 AUR 构建软件包时，聪明的 Arch 用户**总是**检查 `PKGBUILD` 和 `*.install` 文件。

此外，TU（受信任用户）还会删除 AUR 中包含在 core/extra/community 中的软件包，因此它们之间不应存在命名冲突。AUR 通常会包含软件包的开发版本（cvs/svn/git 等），但它们的名称会被修改，例如 foo-git。

对于 AUR 软件包，`pacman` 会处理依赖关系并检测文件冲突，因此，除非你默认使用 `–force` 选项，否则你不必担心用另一个包中的文件会覆盖另一个包的文件。如果这么做了，你可能会遇到比文件冲突更严重的问题。

### 如何使用 AUR？

使用 AUR 的最简单方法是通过 AUR 助手。 [AUR 助手][8] 是一个命令行工具（有些还有 GUI），可让你搜索在 AUR 上发布的软件包并安装。

#### 在 Arch Linux 上安装 AUR 助手

假设你要使用 [Yay AUR 助手][9]。确保在 Linux 上安装了 git。然后克隆仓库，进入目录并构建软件包。

依次使用以下命令：

```
sudo pacman -S git
sudo git clone https://aur.archlinux.org/yay-git.git
cd yay
makepkg -si
```

安装后，你可以使用 `yay` 命令来安装软件包：

```
yay -S package_name
```

并非必须使用 AUR 助手来从 AUR 安装软件包。从以下文章解如何在没有 AUR 助手的情况下使用 AUR。

#### 不使用 AUR 助手安装 AUR 软件包

如果你不想使用 AUR 助手，那么也可以自行从 AUR 安装软件包。

在 [AUR 页面][10]上找到要安装的软件包后，建议确认“许可证”、“流行程度”、“最新更新”、“依赖项”等，作为额外的质量控制步骤。

```
git clone [package URL]
cd [package name]
makepkg -si
```

例如。假设你要安装 [telegram 桌面包][11]：

```
git clone https://aur.archlinux.org/telegram-desktop-git.git
cd telegram-desktop-git
makepkg -si
```

#### 在 Manjaro Linux 中启用 AUR 支持

它默认情况下未启用 AUR，你必须通过 `pamac` 启用它。我的笔记本电脑运行 [Manjaro][12] Cinnamon，但是所有 Manjaro 变种的步骤都相同。

打开 Pamac（显示为 “Add/Remove Software”）：

![][13]

进入 Pamac 后，请进入如下所示的<ruby>首选项<rt>preferences</rt></ruby>。

![][14]

在首选项对话框中，进入 “AUR” 选项卡，启用 AUR 支持，启用检查更新，并关闭对话框。

![][15]

现在，你可以搜索软件包，并且可以通过软件包描述下的标签来识别属于 AUR 的软件包。

![][16]

希望本文对你有用，并关注社交媒体上即将出现的与 Arch 相关的主题。

--------------------------------------------------------------------------------

via: https://itsfoss.com/aur-arch-linux/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.archlinux.org/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/what-is-aur.png?ssl=1
[3]: https://wiki.archlinux.org/index.php/PKGBUILD
[4]: https://wiki.archlinux.org/index.php/Makepkg
[5]: https://wiki.archlinux.org/index.php/Pacman#Additional_commands
[6]: https://wiki.archlinux.org/index.php/Community_repository
[7]: https://wiki.archlinux.org/index.php/Trusted_Users
[8]: https://itsfoss.com/best-aur-helpers/
[9]: https://github.com/Jguer/yay
[10]: https://aur.archlinux.org/
[11]: https://aur.archlinux.org/packages/telegram-desktop-git
[12]: https://manjaro.org/
[13]: https://i1.wp.com/i.imgur.com/kFF6HtW.png?ssl=1
[14]: https://i0.wp.com/i.imgur.com/47r963A.png?ssl=1
[15]: https://i1.wp.com/i.imgur.com/UThiDHO.png?ssl=1
[16]: https://i2.wp.com/i.imgur.com/RM5BKi2.png?ssl=1
