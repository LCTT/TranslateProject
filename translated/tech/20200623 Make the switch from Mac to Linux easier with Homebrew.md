[#]: collector: (lujun9972)
[#]: translator: ( nophDog)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Make the switch from Mac to Linux easier with Homebrew)
[#]: via: (https://opensource.com/article/20/6/homebrew-linux)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

Homebrew 让你从 Mac 切换到 Linux 更轻松
======
不管你是想要更舒服地从 Mac 搬到 Linux，还是不满意常规的 Linux 包管理器，都可以试试 Homebrew。
![Digital images of a computer desktop][1]

[Homebrew][2] 项目最初是为了给 Mac 用户提供一个非官方的类 Linux 包管理器。用户很快就爱上了它友好的界面以及帮助性的提示，而且 —— 真是爱恨纠缠 —— 它已经被移植到 Linux 系统。

一开始，macOS 和 Linux 有两个分开的项目（Homebrew 与 Linuxbrew），但是目前在两个操作系统上，都是由 Homebrew 核心管理。由于我正 [从 Mac 切换到 Linux][3]，所以一直在研究我在 macOS 最常用的开源软件在 Linux 表现如何，最终，我很高兴地发现 Homebrew 也支持 Linux，太赞了！

### 为什么要在 Linux 使用 Homebrew 呢？

长期的 Linux 用户对 Homebrew 的第一反应是：“为什么不用......呢”，省略号代表他们喜欢的 Linux 包管理器。基于 Debian 的系统早就有了 `apt`，基于 Fedora 的系统则有 `dnf` 和 `yum`，并且像 Flatpak 跟 AppImage 这样的项目，在两种系统上都能流畅运行。我花了不少时间尝试这些技术，不得不说它们都很强大。

那我为什么还要 [坚持使用 Homebrew][4] 呢？首先，我对它非常熟悉。在为我过去使用的专利软件寻找替代品的过程中，我已经学会了许多使用方法，而且越来越熟练 —— 就像我使用 Homebrew 一样 —— 让我专注于一次学习一件事情，而不会被不同系统间的差异搞垮。

此外，我没有看到哪一个包管理器像 Homebrew 一样，对用户如此友好。命令井井有条，默认的帮助命令显示如下：

```
$ brew -h
Example usage:
  brew search [TEXT|/REGEX/]
  brew info [FORMULA...]
  brew install FORMULA...
  brew update
  brew upgrade [FORMULA...]
  brew uninstall FORMULA...
  brew list [FORMULA...]

Troubleshooting:
  brew config
  brew doctor
  brew install --verbose --debug FORMULA

Contributing:
  brew create [URL [--no-fetch]]
  brew edit [FORMULA...]

Further help:
  brew commands
  brew help [COMMAND]
  man brew
  <https://docs.brew.sh>
```

过于简短的输入可能会被误解成它的缺陷，但是你仔细看看每一个子命令，都有很丰富的功能。虽然这一列只有短短 23 行，但对进阶用户来说，光是子命令 `install` 就包含整整 79 行信息量：


```
$ brew --help | wc -l
23
$ brew install --help | wc -l
79
```

忽视或者安装依赖，用什么编译器从源码编译，使用上游 Git 提交或者官方 “bottled” 版应用，这些你都可以选择。总而言之，Homebrew 即适合新手，也同样能满足老鸟。

### 开始在 Linux 使用 Homebrew

如果你想要试着使用 Homebrew，可以用这个一行脚本在 Mac 或者 Linux 上进行安装：

```
`$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
```

这条命令会立即开始安装 Homebrew。如果你比较谨慎，可以使用 `curl` 将文件下载到本地，检查完毕之后再运行。

```
$ curl -fsSL <https://raw.githubusercontent.com/Homebrew/install/master/install.sh> \--output homebrew_installer.sh
$ more homebrew_installer.sh # review the script until you feel comfortable
$ bash homebrew_installer.sh
```

对 Linux 的安装指导包括如何配置点文件，尤其是 Debian 系统的 `~/.profile` 和 Fedora 系统的 `~/.bash_profile`。


```
$ test -d /home/linuxbrew/.linuxbrew &amp;&amp; eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
$ test -r ~/.bash_profile &amp;&amp; echo "eval \$($(brew --prefix)/bin/brew shellenv)" &gt;&gt;~/.bash_profile
$ echo "eval \$($(brew --prefix)/bin/brew shellenv)" &gt;&gt;~/.profile
```

为了确认已经安装好，Homebrew 团队提供一个空的 `hello` formulae 供测试：


```
$ brew install hello
==&gt; Downloading <https://linuxbrew.bintray.com/bottles/hello-2.10.x86\_64\_linux.bottle.tar.gz>
######################################################################## 100.0%
==&gt; Pouring hello-2.10.x86_64_linux.bottle.tar.gz
🍺  /home/linuxbrew/.linuxbrew/Cellar/hello/2.10: 52 files, 595.6KB
```

It looks like my installation is working without any issues, so I'll explore a little more.
看起来安装毫无问题，那我来试试。

### Brew for command-line utilities
### 命令行工具 Brew

Homebrew 宣称自己默认只 “安装你需要但 [Linux] 不需要的东西”。

在 Homebrew 中，你可以用 `brew` 命令安装任何命令行软件。这些包的定义文件叫做 “formulae”，而且它们是编译好的文件，通过 “bottles” 共享。在 Homebrew 的世界里，还有许多 “beer-oriented” 术语，但这个包管理器主要目的是让软件便于使用。

什么样的软件呢？对我这样的技术玩家（既然你已经在读这篇文章，估计你也是）来说最方便的东西。例如，便利的 `tree` 命令，可以展示目录结构，或者 `pyenv`，我用来 [在 Mac 管理不同版本 Python][5]。

你可以用 `search` 命令查看所有可以安装的 formulae，在后面通过 `wc` 命令看看一共有多少：


```
# -l counts the number of lines
$ brew search | wc -l
    5087
```

迄今为止，一共有 5000 多个 formulae，这囊括了很多软件。需要注意的是：并非所有 formula 都能在 Linux 运行。在 `brew search --help` 输出中有一部分提到可以通过操作系统标识来筛选软件。它会在浏览器打开用于每一个操作系统的软件仓库。我运行的是 Fedora，所以我打算试一试：


```
`$ brew search --fedora tree`
```

浏览器打开了网址 `https://apps.fedoraproject.org/packages/s/tree`，向我展示了所有 Fedora 的可用选项。你也可以通过其它方法进行浏览。Formulae 集中整理到由操作系统划分的核心仓库当中（Mac 在 [Homebrew Core][6]，Linux 在 [Linux Core][7]）。同样也可以通过 Homebrew API [在网页显示][8]。

尽管已经安装好这些软件，我又通过其它用户的推荐找到很多新工具。我列出一些我最喜欢的工具，你可以在里面找点灵感：

  * `pyenv`、`rbenv` 和 `nodenv` 用来管理（相应的） Python、Ruby 和 Node.js 版本
  * `imagemagick` 用于脚本化编辑图片
  * `pandoc` 用于脚本化转换文档格式（我通常将 .docx 文件转成 .md 或者 .html）
  * `hub` 为 GitHub 用户提供 [更好的 Git 体验][9]
  * `tldr` 展示命令工具的用法


想要深入了解 Homebrew，可以去 [trldr 页面][10] 看看，比起应用的 man 页面，它要友好得多。使用 `search` 命令确认你可以安装：

```
$ brew search tldr
==&gt; Formulae
tldr ✔
```

太好了！勾号说明你可以安装。那么继续吧：


```
$ brew install tldr
==&gt; Downloading <https://linuxbrew.bintray.com/bottles/tldr-1.3.0\_2.x86\_64\_linux.bottle.1.tar.gz>
######################################################################## 100.0%
==&gt; Pouring tldr-1.3.0_2.x86_64_linux.bottle.1.tar.gz
🍺  /home/linuxbrew/.linuxbrew/Cellar/tldr/1.3.0_2: 6 files, 63.2KB
```

Homebrew 提供编译好的二进制文件，所以你也不必在本地机器上编译源码。这能节省很多时间，也不用听 CPU 风扇的噪声。我同样欣赏 Homebrew 的另外一点，你不完全理解每一个选项的含义也不会影响正常使用。若你想自己编译，可以在 `brew install` 命令后面加上 `-s` 或者 `--build-from-source` 标识，这样就能从源码编译 formula（即便已经有一个 bottle 存在）。

同样，软件之后的复杂度也很有意思。使用 `info` 查看 `tldr` 软件的依赖管理，formula 源代码在磁盘上的分布，甚至还能查看公开数据。


```
$ brew info tldr
tldr: stable 1.3.0 (bottled), HEAD
Simplified and community-driven man pages
<https://tldr.sh/>
Conflicts with:
  tealdeer (because both install `tldr` binaries)
/home/linuxbrew/.linuxbrew/Cellar/tldr/1.3.0_2 (6 files, 63.2KB) *
  Poured from bottle on 2020-06-08 at 15:56:15
From: <https://github.com/Homebrew/linuxbrew-core/blob/master/Formula/tldr.rb>
==&gt; Dependencies
Build: pkg-config ✔
Required: libzip ✔, curl ✔
==&gt; Options
\--HEAD
        Install HEAD version
==&gt; Analytics
install: 197 (30 days), 647 (90 days), 1,546 (365 days)
install-on-request: 197 (30 days), 646 (90 days), 1,546 (365 days)
build-error: 0 (30 days)
```

### 从 Mac 到 Linux 的一点不足

在 macOS，Homebrew 的 `cask` 子命令可以让用户完全使用命令行安装、管理图形界面软件。不幸的是，`cask` 只在部分 Linux 发行版有效。我在安装一个开源工具时遇到了问题：


```
$ brew cask install tusk
Error: Installing casks is supported only on macOS
```

我在 [论坛][11] 提问，迅速得到其他用户的一些反馈。总结一下，方案如下：

* 复刻该项目，构建这个特性，然后告诉别人值得这样做
* 给该软件写一个 formula，从源代码编译
* 为该软件创建一个第三方仓库


对我来说还有最后一件很有意思的事情。Homebrew 通过 [创建并维护 “taps”][12] （另一个 beer-influenced 名词）管理第三方仓库。当你对系统越来越熟悉时，你会将 Taps 加入这个生态，花点时间研究它能让你受益匪浅。

### 备份 Homebrew 的安装记录

我最中意的 Homebrew 特性之一就是你可以像其它任何 [版本控制工具备份点文件][13] 一样备份你的安装记录。为了实现这个目的，Homebrew 提供 `bundle` 子命令，它有一个子命令叫 `dump` 可以生成一份 Brewfile。这个文件包含你目前所有安装的工具列表，可以反复使用。进入你想使用的目录然后运行命令，它会根据你所安装的软件生成 Brewfile：


```
$ cd ~/Development/dotfiles # This is my dotfile folder
$ brew bundle dump
$ ls Brewfile
Brewfile
```

当我换了一台机器，想要安装一样的软件时，进入含有 Brewfile 的文件夹，然后重新安装：


```
$ ls Brewfile
Brewfile
$ brew bundle
```

它会在我的新机器上安装所有列出的 formulae。

#### 在 Mac 和 Linux 同时管理 Brewfile

Brewfile 非常适合备份你目前的安装记录，但是如果某些在 Mac 上运行的软件无法运行在 Linux 呢？或者刚好相反？我发现不管是 Mac 还是 Linux，如果软件无法在当前操作系统运行，Homebrew 会优雅地忽略那一行。如果它遇到不兼容的请求（正如使用 brew 在 Linux 安装 cask），它会选择跳过，继续安装过程：


```
$ brew bundle --file=Brewfile.example

Skipping cask licecap (on Linux)
Skipping cask macdown (on Linux)
Installing fish
Homebrew Bundle complete! 1 Brewfile dependency now installed.
```

为了尽量保持配置文件的简洁，我在跨操作系统时使用同一份 Brewfile，因为它只安装与操作系统相关的版本，所以我一直没有遇到任何问题。

### 使用 Homebrew 管理软件包

Homebrew 已经成了我必备的命令行工具，由于我很熟悉它，所以在 Linux 上的体验也充满乐趣。Homebrew 让我的工具井井有条，并且时刻保持更新，我愈发欣赏它在实用性与功能上找到的平衡点。我喜欢只保留用户必要的包管理信息，大多数人能够从中受益。如果你对目前的 Linux 包管理起很满意，Homebrew 可能会让你觉得很基础，但是你要去深入研究，发掘本文没有提到的高级用法。

对 Linux 用户来说，他们有很多包管理器可以选择。如果你来自 MacOS，Homebrew 会让你宾至如归。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/homebrew-linux

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/nophDog)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://brew.sh/
[3]: https://opensource.com/article/19/10/why-switch-mac-linux
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://opensource.com/article/20/4/pyenv
[6]: https://github.com/Homebrew/homebrew-core
[7]: https://github.com/Homebrew/linuxbrew-core
[8]: https://formulae.brew.sh/formula/
[9]: https://opensource.com/article/20/3/github-hub
[10]: https://github.com/tldr-pages/tldr
[11]: https://discourse.brew.sh/t/add-linux-support-to-existing-cask/5766
[12]: https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap
[13]: https://opensource.com/article/19/3/move-your-dotfiles-version-control
