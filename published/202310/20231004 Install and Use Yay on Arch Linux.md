[#]: subject: "Install and Use Yay on Arch Linux"
[#]: via: "https://itsfoss.com/install-yay-arch-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16284-1.html"

在 Arch Linux 上安装和使用 Yay
======

![][0]

> Yay 是最流行的 AUR 助手之一，用于处理 Arch 用户资源库中的软件包。学习在 Arch Linux 中安装它。

你可以在 <ruby>[Arch 用户仓库][1]<rt>Arch User Repository</rt></ruby>（AUR）中找到社区成员打包的大量软件。

由于它来自第三方，纯粹主义者建议从 AUR 手动下载并构建每个所需的包。

但这是一项乏味的任务，这就是为什么会有 AUR 助手来避免麻烦。

Yay 是最受欢迎的 AUR 帮助程序之一，在本教程中，我将分享如何在 Arch Linux 上安装 Yay。我还将分享一些有关使用 Yay 管理 AUR 包的技巧。


> 💡 Yay 可在 Manjaro 的仓库中找到。因此，Manjaro 用户只需使用 `pacman -S yay` 即可安装

### 在 Arch Linux 上安装 Yay

在继续安装 Yay 之前，你需要一些构建它所需的软件包。

让我把它分成几个步骤。

#### 步骤 1：安装必备包

首先刷新包缓存并更新系统是一个好主意：

```
sudo pacman -Syu
```

安装所需的 `base-devel`（包含 `makepkg` 等工具）和 `git`（克隆 yay 的 Git 仓库所需的）。

```
sudo pacman -S --needed base-devel git
```

使用 `--needed` 标志，它不会重新安装已经安装的软件包。

它看起来是这样的：

![][2]

现在你已经有了所需的软件包，是时候在你的系统上安装 [Yay][3]。

#### 步骤 2：克隆 Yay Git 仓库并切换到它

[使用 git 命令][4] “克隆” Yay 仓库。你可以在系统中的任何位置执行此操作，无论是主目录还是其他目录。

```
git clone https://aur.archlinux.org/yay.git
```

完成后，切换到克隆的目录：

```
cd yay
```

![][5]

终于可以安装 Yay 了。

#### 步骤 3：安装 Yay

事实上，你是在构建它。你将在此处看到 `PKGBUILD` 文件。使用以下命令从此处构建包：

```
makepkg -si
```

按照屏幕上的说明进行操作。当系统要求你确认时，按 `Y`。

![][6]

该过程完成后，通过检查其版本来验证 Yay 是否已成功安装。

```
yay --version
```

现在你已经成功安装了它，你可以删除克隆的 Yay Git 仓库。不再需要它了。

### 使用 Yay 进行包管理

Yay 遵循与 [pacman][7] 类似（但不相同）的命令结构。所以你用 Yay 管理 AUR 包应该不难。

搜索软件包：

```
yay search_term
```

安装软件包：

```
yay -S package_name
```

删除软件包：

```
yay -R package_name
```

要删除包及其依赖项：

```
yay -Rns package_name
```

仅升级 AUR 包：

```
yay -Sua
```

Yay 还能够升级非 AUR 软件包。上面的 `a` 标志将其限制为 AUR。

### 将 Yay 升级到新版本

现在，你可能想知道如何将 Yay 升级到可用的新版本。

答案是你不需要做任何特别的事情。当你运行以下命令时，Yay 可以自行更新：

```
yay -Sua
```

### 从 Arch 系统中删除 Yay

如果你不喜欢 Yay 或不再需要它，你可以使用 `pacman` 命令像删除任何其他软件包一样删除它：

```
sudo pacman -Rs yay
```

### 总结

这是对 Yay AUR 助手的快速介绍。你可以访问其 GitHub 仓库以了解有关其工作的更多详细信息。

Arch 用户仓库（AUR）是[为什么有些人喜欢使用 Arch Linux][9] 的原因之一。

虽然纯粹的 Arch 用户一般都会嘲笑 AUR，特别是 [AUR 助手][10]，但它们仍然因其提供的易用性而受到欢迎。

我希望你发现这个快速教程有助于在 [Arch Linux][11] 上获得 Yay。如果你仍有疑问或发现任何技术错误，请告诉我。

*（题图：MJ/f01331ab-ee70-45c4-8fd1-163e63497a6a）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-yay-arch-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/aur-arch-linux/
[2]: https://itsfoss.com/content/images/2023/10/install-prerequisite-yay.png
[3]: https://github.com/Jguer/yay
[4]: https://itsfoss.com/basic-git-commands-cheat-sheet/
[5]: https://itsfoss.com/content/images/2023/10/git-clone-yay.png
[6]: https://itsfoss.com/content/images/2023/10/building-yay-package.png
[7]: https://itsfoss.com/pacman-command/
[8]: https://github.githubassets.com/pinned-octocat.svg
[9]: https://itsfoss.com/why-arch-linux/
[10]: https://itsfoss.com/best-aur-helpers/
[11]: https://archlinux.org/
[0]: https://img.linux.net.cn/data/attachment/album/202310/14/224808sb66bbdrd4zrqk6q.jpg