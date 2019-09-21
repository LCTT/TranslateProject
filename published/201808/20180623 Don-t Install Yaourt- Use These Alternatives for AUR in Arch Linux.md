Yaourt 已死！在 Arch 上使用这些替代品
======

**前略：Yaourt 曾是最流行的 AUR 助手，但现已停止开发。在这篇文章中，我们会为 Arch 衍生发行版们列出 Yaourt 最佳的替代品。**

[Arch User Repository][1] （常被称作 AUR），是一个为 Arch 用户而生的社区驱动软件仓库。Debian/Ubuntu 用户的对应类比是 PPA。

AUR 包含了不直接被 [Arch Linux][2] 官方所背书的软件。如果有人想在 Arch 上发布软件或者包，它可以通过这个社区仓库提供。这让最终用户们可以使用到比默认仓库里更多的软件。

所以你该如何使用 AUR 呢？简单来说，你需要另外的工具以从 AUR 中安装软件。Arch 的包管理器 [pacman][3] 不直接支持 AUR。那些支持 AUR 的“特殊工具”我们称之为 [AUR 助手][4]。

Yaourt （Yet AnOther User Repository Tool）（曾经）是 `pacman` 的一个封装，便于用户在 Arch Linux 上安装 AUR 软件。它基本上采用和 `pacman` 一样的语法。Yaourt 对于 AUR 的搜索、安装，乃至冲突解决和包依赖关系维护都有着良好的支持。

然而，Yaourt 的开发进度近来十分缓慢，甚至在 Arch Wiki 上已经被[列为][5]“停止或有问题”。[许多 Arch 用户认为它不安全][6] 进而开始寻找其它的 AUR 助手。

![Yaourt 以外的 AUR Helpers][7]

在这篇文章中，我们会介绍 Yaourt 最佳的替代品以便于你从 AUR 安装软件。

### 最好的 AUR 助手

我刻意忽略掉了例如 Trizen 和 Packer 这样的流行的选择，因为它们也被列为“停止或有问题”的了。

#### 1、 aurman

[aurman][8] 是最好的 AUR 助手之一，也能胜任 Yaourt 替代品的地位。它有非常类似于 `pacman` 的语法，可以支持所有的  `pacman` 操作。你可以搜索 AUR、解决包依赖，在构建 AUR 包前检查 PKGBUILD 的内容等等。

aurman 的特性：

  * aurman 支持所有 `pacman` 操作，并且引入了可靠的包依赖解决方案、冲突判定和<ruby>分包<rt>split package</rt></ruby>支持
  * 线程化的 sudo 循环会在后台运行，所以你每次安装只需要输入一次管理员密码
  * 提供开发包支持，并且可以区分显性安装和隐性安装的包
  * 支持搜索 AUR 包和仓库
  * 在构建 AUR 包之前，你可以检视并编辑 PKGBUILD 的内容
  * 可以用作单独的 [包依赖解决工具][9]

安装 aurman：

```
git clone https://aur.archlinux.org/aurman.git
cd aurman
makepkg -si
```

使用 aurman：

用名字搜索：

```
aurman -Ss <package-name>
```

安装：

```
aurman -S &lt;package-name>
```

#### 2、 yay

[yay][10] 是下一个最好的 AUR 助手。它使用 Go 语言写成，宗旨是提供最少化用户输入的 `pacman` 界面、yaourt 式的搜索，而几乎没有任何依赖软件。

yay 的特性：

  * `yay` 提供 AUR 表格补全，并且从 ABS 或 AUR 下载 PKGBUILD
  * 支持收窄搜索，并且不需要引用 PKGBUILD 源
  * `yay` 的二进制文件除了 `pacman` 以外别无依赖
  * 提供先进的包依赖解决方案，以及在编译安装之后移除编译时的依赖
  * 当在 `/etc/pacman.conf` 文件配置中启用了色彩时支持色彩输出
  * `yay` 可被配置成只支持 AUR 或者 repo 里的软件包

安装 yay：

你可以从 `git` 克隆并编译安装。

```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

使用 yay：

搜索：

```
yay -Ss <package-name>
```

安装：

```
yay -S <package-name>
```

#### 3、 pakku

[Pakku][11] 是另一个还处于开发早期的 pacman 封装，虽然它还处于开放早期，但这不说明它逊于其它任何 AUR 助手。Pakku 能很好地支持从 AUR 搜索和安装，并且也可以在安装后移除不必要的编译依赖。

pakku 的特性：

  * 从 AUR 搜索和安装软件
  * 检视不同构建之间的文件和变化
  * 从官方仓库编译，并事后移除编译依赖
  * 获取 PKGBUILD 以及 pacman 整合
  * 类 pacman 的用户界面和选项支持
  * 支持pacman 配置文件以及无需 PKGBUILD 源

安装 pakku：

```
git clone https://aur.archlinux.org/pakku.git
cd pakku
makepkg -si
```

使用 pakku：

搜索：

```
pakku -Ss spotify
```

安装：

```
pakku -S spotify
```

#### 4、 aurutils

[aurutils][12] 本质上是一堆使用 AUR 的自动化脚本的集合。它可以搜索 AUR、检查更新，并且解决包依赖。

aurutils 的特性：

  * aurutils 使用本地仓库以支持 pacman 文件，所有的包都支持 `–asdeps`
  * 不同的任务可以有多个仓库
  * `aursync -u` 一键同步本地代码库
  * `aursearch` 搜索提供 pkgbase、长格式和 raw 支持
  * 能忽略指定包

安装 aurutils：

```
git clone https://aur.archlinux.org/aurutils.git
cd aurutils
makepkg -si
```

使用 aurutils：

搜索：

```
aurutils -Ss <package-name>
```

安装：

```
aurutils -S <package-name>
```

所有这些包，在有 Yaourt 或者其它 AUR 助手的情况下都可以直接安装。

### 写在最后

Arch Linux 有着[很多 AUR 助手][4] 可以自动完成 AUR 各方面的日常任务。很多用户依然使用 Yaourt 来完成 AUR 相关任务，每个人都有自己不一样的偏好，欢迎留言告诉我们你在 Arch 里使用什么，又有什么心得？

--------------------------------------------------------------------------------

via: https://itsfoss.com/best-aur-helpers/

作者：[Ambarish Kumar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[Moelf](https://github.com/Moelf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ambarish/
[1]:https://wiki.archlinux.org/index.php/Arch_User_Repository
[2]:https://www.archlinux.org/
[3]:https://wiki.archlinux.org/index.php/pacman
[4]:https://wiki.archlinux.org/index.php/AUR_helpers
[5]:https://wiki.archlinux.org/index.php/AUR_helpers#Comparison_table
[6]:https://www.reddit.com/r/archlinux/comments/4azqyb/whats_so_bad_with_yaourt/
[7]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/06/no-yaourt-arch-800x450.jpeg
[8]:https://github.com/polygamma/aurman
[9]:https://github.com/polygamma/aurman/wiki/Using-aurman-as-dependency-solver
[10]:https://github.com/Jguer/yay
[11]:https://github.com/kitsunyan/pakku
[12]:https://github.com/AladW/aurutils
