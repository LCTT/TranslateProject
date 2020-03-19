[#]: collector: (lujun9972)
[#]: translator: (hkurj)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 Best AUR (Arch User Repository) Helpers for Arch Linux)
[#]: via: (https://www.2daygeek.com/best-aur-arch-user-repository-helpers-arch-linux-manjaro/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

6个用于Arch Linux的最佳AUR（Arch用户软件仓库）助手
======

Arch Linux是Linux发行版，主要基于面向x86-64微处理器计算机的二进制软件包。

Arch Linux使用的是滚动发布模型，该模型频繁的将更新交付给应用程序。

它使用名为 **[pacman][1]** 的软件包管理器，它允许安装，删除和更新软件包。

由于Arch Linux是为有经验的用户构建的，建议新手在使用其他Linux后再来尝试。

### 什么是AUR（Arch用户软件仓库）？

[Arch用户软件仓库][2]通常称为AUR，是Arch用户基于社区的软件存储库。

AUR社区用户根据软件包流行程度编译进入Arch官方存储库。

### 什么是AUR助手？

[AUR助手][3]是一个包装程序，允许用户从AUR存储库安装软件包，而无需手动干预。

很多用法实现了自动化，比如包搜索，解决依赖关系，检索和构建AUR包，Web内容检索和AUR包提交之类。

**以下列出了6种最佳的AUR助手：**

  * Yay (Yet another Yogurt)
  * Pakku
  * Pacaur
  * Pikaur
  * Trizen
  * Aura


### 1) Yay (Yet another Yogurt)

[Yay][4]是Arch Linux下基于CLI的最佳AUR助手，使用GO语言编写。 Yay基于yaourt，apacman和pacaur设计。

这是给推荐新手最合适的AUR助手。使用方法和pacman使用的命令选项很相似，允许用户在搜索过程中找到匹配的软件包提供程序并可供选择。

### 如何安装yay

依次运行以下命令以在Arch Linux的系统上安装。

```
$ sudo pacman -S git go base-devel
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
```
### 如何使用yay

yay语法与pacman相同，使用以下命令安装软件包。

```
$ yay -s arch-wiki-man
```

### 2) Pakku

[Pakku][5]可以被视为一个初始阶段的Pacman。 它是一个包装程序，允许用户从AUR搜索或安装软件包。

它在删除依赖项方面做得不错，并且还允许通过克隆PKGBUILD来安装软件包。

### 如何安装Pakku

要在Arch Linux的系统上安装pakku，请一一运行以下命令。

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/pakku.git
$ cd pakku
$ makepkg -si
```

### 如何使用Pakku

pakku语法与pacman相同，使用以下命令安装软件包。

```
$ pakku -s dropbox
```

### 3) Pacaur

另一个基于CLI的AUR助手，可帮助减少用户提示交互。

[Pacaur][6]专为倾向于自动化重复任务的高级用户而设计。 用户需要熟悉makepkg及其配置的AUR手动构建过程。

### 如何安装Pacaur

要在Arch Linux的系统上安装pakku，请一一运行以下命令。

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/pacaur.git
$ cd pacaur
$ makepkg -si
```

### 如何使用Pacaur

Pacaur语法与pacman相同，使用以下命令安装软件包。
```
$ pacaur -s spotify
```

### 4) Pikaur

[Pikaur][7]是具有最小依赖性的AUR助手，可以一次查看所有PKGBUILD，无需用户交互即可全部构建。

Pikaur将通过控制pacman来告知Pacman下一个步骤。

### 如何安装Pikaur

要在Arch Linux的系统上安装pakku，请一一运行以下命令。

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/pikaur.git
$ cd pikaur
$ makepkg -fsri
```
### 如何使用Pikaur

Pikaur语法与pacman相同，使用以下命令安装软件包。

```
$ pacaur -s spotify
```

### 5) Trizen

[Trizen][8]是用Perl编写的基于命令行的AUR轻量级包装器。 面向速度的AUR助手，它允许用户搜索，安装软件包，还允许阅读AUR软件包注释。

支持编辑文本文件，并且输入/输出使用UTF-8。 内置与pacman的交互功能。

### 如何安装Trizen

要在Arch Linux的系统上安装pakku，请一一运行以下命令。

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/trizen.git
$ cd trizen
$ makepkg -si
```
### 如何使用Trizen
### How to Use Trizen

Trizen语法与pacman相同，使用以下命令安装软件包。

```
$ pacaur -s google-chrome
```

### 6) Aura

[Aura][9]是用Haskell编写的，用于Arch Linux和AUR的安全，多语言包管理器。 它支持许多Pacman操作和子选项，可轻松进行开发并编写精美的代码。

它可以自动从Arch用户软件仓库安装软件包。使用Aura时，用户通常会在系统升级方面遇到困难。

### 如何安装Aura

要在Arch Linux的系统上安装pakku，请一一运行以下命令。

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/aura.git
$ cd aura
$ makepkg -si
```

### 如何使用Aura

Aura语法与pacman相同，使用以下命令安装软件包。

```
$ pacaur -s android-sdk
```

### 结论

用户可以凭借这些分析在上述6个AUR助手中进行选择。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/best-aur-arch-user-repository-helpers-arch-linux-manjaro/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[hkurj](https://github.com/hkurj)
校对：[校对者ID](https://github.com/校对者ID)

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
