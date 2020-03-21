[#]: collector: (lujun9972)
[#]: translator: (hkurj)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12019-1.html)
[#]: subject: (6 Best AUR (Arch User Repository) Helpers for Arch Linux)
[#]: via: (https://www.2daygeek.com/best-aur-arch-user-repository-helpers-arch-linux-manjaro/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

6 个用于 Arch Linux 的最佳 AUR 助手
======

![](https://img.linux.net.cn/data/attachment/album/202003/21/082920kxdmlwkk7xx7llpw.jpeg)

Arch Linux 是一款 Linux 发行版，主要由针对 x86-64 微处理器计算机的二进制软件包组成。Arch Linux 使用的是滚动发布模型，这种模式会频繁的给应用程序交付更新。它使用名为 [pacman][1] 的软件包管理器，可以用来安装、删除和更新软件包。

由于 Arch Linux 是为有经验的用户构建的，建议新手在使用过其他 Linux 后再来尝试。

### 什么是 AUR（Arch 用户软件仓库）？

[Arch 用户软件仓库][2] 通常称为 AUR，是给 Arch 用户的基于社区的软件存储库。

根据软件包在  AUR 社区的流行程度，用户编译的软件包会进入到 Arch 的官方存储库。

### 什么是 AUR 助手？

[AUR 助手][3]是一个包装程序，允许用户从 AUR 存储库安装软件包，而无需手动干预。

很多用例实现了自动化，比如包搜索、解决依赖关系、检索和构建 AUR 包、Web 内容检索和 AUR 包提交之类。

以下列出了 6 种最佳的 AUR 助手：

* Yay（Yet another Yogurt）
* Pakku
* Pacaur
* Pikaur
* Trizen
* Aura

### 1）Yay（Yet another Yogurt）

[Yay][4] 是 Arch Linux 下基于 CLI 的最佳 AUR 助手，使用 Go 语言编写。Yay 是基于 yaourt、apacman 和 pacaur 设计的。

这是最合适推荐给新手的 AUR 助手。类似于 Pacman，其使用方法和 `pacman` 中的命令和选项很相似，可以让用户在搜索过程中找到匹配的软件包提供程序，并进行选择。

#### 如何安装 yay

依次运行以下命令以在 Arch Linux 系统上安装。

```
$ sudo pacman -S git go base-devel
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
```

#### 如何使用 yay

`yay` 语法与 `pacman` 相同，使用以下命令安装软件包。

```
$ yay -s arch-wiki-man
```

### 2）Pakku

[Pakku][5] 可以被视为一个初始阶段的 Pacman。它是一个包装程序，可以让用户从 AUR 中搜索或安装软件包。

它在删除依赖项方面做得不错，并且还允许通过克隆 PKGBUILD 来安装软件包。

#### 如何安装 Pakku

要在 Arch Linux 的系统上安装 Pakku，请依次运行以下命令。

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/pakku.git
$ cd pakku
$ makepkg -si
```

#### 如何使用 Pakku

`pakku` 语法与 `pacman` 相同，使用以下命令安装软件包。

```
$ pakku -s dropbox
```

### 3）Pacaur

另一个基于 CLI 的 AUR 助手，可帮助减少用户与提示符的交互。

[Pacaur][6] 专为倾向于自动化重复任务的高级用户而设计。用户需要熟悉 `makepkg` 及其配置的 AUR 手动构建过程。

#### 如何安装 Pacaur

要在 Arch Linux 的系统上安装 Pakku，请依次运行以下命令。

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/pacaur.git
$ cd pacaur
$ makepkg -si
```

#### 如何使用 Pacaur

`pacaur` 语法与 `pacman` 相同，使用以下命令安装软件包。

```
$ pacaur -s spotify
```

### 4）Pikaur

[Pikaur][7] 是具有最小依赖性的 AUR 助手，可以一次查看所有 PKGBUILD，无需用户交互即可全部构建。

Pikaur 将通过控制 `pacman` 命令来告知 Pacman 要执行的下一个步骤。

#### 如何安装 Pikaur

要在 Arch Linux 的系统上安装 Pakku，请依次运行以下命令。

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/pikaur.git
$ cd pikaur
$ makepkg -fsri
```

#### 如何使用 Pikaur

`pikaur` 语法与 `pacman` 相同，使用以下命令安装软件包。

```
$ pacaur -s spotify
```

### 5）Trizen

[Trizen][8] 是用 Perl 编写的基于命令行的 AUR 轻量级包装器。这个面向速度的 AUR 助手，它允许用户搜索、安装软件包，还允许阅读 AUR 软件包注释。

支持编辑文本文件，并且输入/输出使用 UTF-8。内置与 `pacman` 的交互功能。

#### 如何安装 Trizen

要在 Arch Linux 的系统上安装 Trizen，请依次运行以下命令。

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/trizen.git
$ cd trizen
$ makepkg -si
```

#### 如何使用 Trizen

`trizen` 语法与 `pacman` 相同，使用以下命令安装软件包。

```
$ pacaur -s google-chrome
```

### 6）Aura

[Aura][9] 是用 Haskell 编写的，是用于 Arch Linux 和 AUR 的安全的多语言包管理器。它支持许多Pacman 操作和子选项，可轻松进行开发并编写精美的代码。

它可以自动从 AUR 安装软件包。使用 Aura 时，用户通常会在系统升级方面遇到一些困难。

#### 如何安装 Aura

要在 Arch Linux 的系统上安装 Pakku，请依次运行以下命令。

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/aura.git
$ cd aura
$ makepkg -si
```

#### 如何使用 Aura

`aura` 语法与 `pacman` 相同，使用以下命令安装软件包。

```
$ pacaur -s android-sdk
```

### 结论

用户可以凭借这些分析在上述 6 个 AUR 助手中进行选择。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/best-aur-arch-user-repository-helpers-arch-linux-manjaro/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[hkurj](https://github.com/hkurj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[2]: https://wiki.archlinux.org/index.php/Arch_User_Repository
[3]: https://wiki.archlinux.org/index.php/AUR_helpers
[4]: https://github.com/Jguer/yay
[5]: https://github.com/kitsunyan/pakku
[6]: https://github.com/E5ten/pacaur
[7]: https://github.com/actionless/pikaur
[8]: https://github.com/trizen/trizen
[9]: https://github.com/fosskers/aura
