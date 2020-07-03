[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12338-1.html)
[#]: subject: (Introduction to Homebrew: the painless way to install anything on a Mac)
[#]: via: (https://opensource.com/article/20/6/homebrew-mac)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)


Homebrew ：在 Mac 上无痛安装软件
======

> Homebrew 软件包管理器可以让你轻松地在 Mac 上安装和更新应用程序和实用程序。

![](https://img.linux.net.cn/data/attachment/album/202006/22/102739xum6zqmoh6sso0n6.jpg)

在我追求“万物自动化”的过程中，我一直坚持走在用代码来管理我的 Mac 笔记本电脑的路上。与其用鼠标或触控板手动管理我的应用程序和实用程序，我更喜欢使用软件包管理软件来安装、更新和删除不需要的软件。

这对 Mac 用户来说是个挑战。Mac 的操作系统 macOS 始终落后于 Linux 的一个地方就是在包管理方面。Mac 用户没有默认的软件包管理器，而 Linux 用户则有很多选择 —— 从熟悉的 `yum` 和 `apt` 到现代的 [Flatpak][2]。但 Mac 呢？

这就是 [Homebrew][3] 的作用。Homebrew（自酿）填补了 MacOS 事实上的软件包管理器的空白（它也是 Linux 上的又一个可选的包管理器）。它为任何熟悉命令行的人提供了令人难以置信的流畅而直接的体验，如果你是新手，它是学习命令行的好方法。

（LCTT 译注：Homebrew 系统中采用了大量针对自酿啤酒相关的比喻，大家在使用过程中会发现这些有趣的形容。）

如果你在 Mac 上还没有 Homebrew，你可以这样来安装：

```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

该命令将执行 Homebrew 团队提供的安装程序脚本。如果你喜欢谨慎一点，可以 `curl` 下来这个文件，审核后再手动运行。

```
$ curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh --output homebrew_installer.sh
$ more homebrew_installer.sh # 审核该脚本，直到你觉得没问题了
$ bash homebrew_installer.sh
```

### 使用“酿造”来管理你的命令行实用程序

Homebrew 号称它“可以安装苹果（或你的 Linux 系统）默认没有安装的必需之物”。安装是通过  `brew`（酿造）命令进行的，它使我们能够访问成千上万的命令行实用程序，但不是更复杂的应用程序。

对于我们这些搞技术的人来说，符合“必需之物”类别的实用工具包括显示目录结构的方便的 `tree` 命令和我用来 [管理多个 Python 版本][4] 的 `pyenv`。

你可以用 `search` 子命令看到 Homebrew 中所有的“<ruby>秘方<rt>formula</rt></ruby>”，我用 `wc` 命令显示有多少个“秘方”。

```
# -l 统计行数
$ brew search | wc -l
    5013
```

有 5000 多个“秘方”，这是一个不可思议的软件数量。所以，在搜索那个庞大的清单之前，最好先对自己想要的东西有个概念。值得庆幸的是，浏览起来很方便。“秘方”被编入并集中存储到核心库中，核心库按操作系统划分（Mac 在 [Homebrew Core][5]，Linux 在 [Linux Core][6]）。它们也可以通过 Homebrew API 和[网站][7]列出。

口碑是另一个寻找实用工具的好方法。考虑到这一点，如果你正在寻找灵感，这里有一些我的最爱：

* `pyenv`、`rbenv` 和 `nodenv` 分别用于管理 Python、Ruby 和 Node.js 的版本
* `imagemagick` 用于可脚本化的图像编辑
* `pandoc` 用于可脚本化的文件转换（我经常从 .docx 切换到 .md 或 .html）
* `hub` 为 GitHub 用户提供了[更好的 Git 体验][8]。
* `tldr` 提供了解如何使用命令行工具的例子

举个例子，看看 [tldr 页面][9]，这是一个用户友好的替代方式，可以滚动浏览应用程序的手册页。你可以通过再次运行 `search` 来确认它是否可用：

```
$ brew search tldr
==> Formulae
tldr ✔
```

成功了！这个对勾让你知道它是可用的。现在你可以安装它了：

```
$ brew install tldr
==> Downloading https://homebrew.bintray.com/bottles/tldr-1.3.0_2.catalina.bottle.tar.gz
Already downloaded: /Users/mbbroberg/Library/Caches/Homebrew/downloads/901bc14594a9283e9ab20aec942dc5a9a2befb7e96e1b0fcccb4e3257918813c--tldr-1.3.0_2.catalina.bottle.tar.gz
==> Installing tldr
==> Pouring tldr-1.3.0_2.catalina.bottle.tar.gz
🍺  /usr/local/Cellar/tldr/1.3.0_2: 6 files, 35.5KB
```

值得庆幸的是，Homebrew 预先构建了二进制文件，所以你不必在本地机器上从源代码构建。这样就节省了很多时间，并免除了 CPU 风扇的噪音。我对 Homebrew 赞赏的另一件事是，你可以在不完全了解其含义的情况下欣赏此功能。

但如果你喜欢，看看复杂的东西也是很有趣的。对 `tldr` 运行 `info` 子命令，你可以看到所有的依赖管理、源代码，甚至公共分析。

```
$ brew info tldr
tldr: stable 1.3.0 (bottled), HEAD
Simplified and community-driven man pages
https://tldr.sh/
Conflicts with:
  tealdeer (because both install `tldr` binaries)
/usr/local/Cellar/tldr/1.3.0_2 (6 files, 35.5KB) *
  Poured from bottle on 2020-05-20 at 15:12:12
From: https://github.com/Homebrew/homebrew-core/blob/master/Formula/tldr.rb
==> Dependencies
Build: pkg-config ✔
Required: libzip ✔
==> Options
--HEAD
        Install HEAD version
==> Analytics
install: 2,811 (30 days), 7,875 (90 days), 27,105 (365 days)
install-on-request: 2,806 (30 days), 7,860 (90 days), 27,080 (365 days)
build-error: 0 (30 days)
```

最后，和其他优秀的软件包管理器一样，Homebrew 的 `brew uninstall` 子命令可用于快速清理和删除未使用的实用程序。

### 用“酒桶”管理你的应用程序

命令行实用程序是一匹孤狼，但完整的应用程序呢？Homebrew 保持了其标准命令的简单性，只通过其默认的 `brew` 命令行界面安装单文件应用。而应用程序不符合这种结构。它们的目录层次比较复杂，比单一的二进制要复杂得多。

幸运的是，Mac 上的 Homebrew 包含了一个名为 `cask`（酒桶）的子命令，用于处理更复杂的多目录结构。特别好的是，`cask` 使用了与标准 `brew` 命令类似的命令结构，所以你可以使用类似的 `search`、`install` 和 `info` 子命令：

```
brew search --cask | wc -l
    4772
```

哇，有近 5000 个应用程序，在 [Homebrew 的网站][10]上浏览更方便。

我将用我新喜欢的一款应用来引导你完成 `cask`。[Meld][11]（我[在 Opensource.com 上读到的][12]）。这是一个功能丰富的编辑器，可以帮助管理合并冲突。在它的网站上有下载的链接，我可以运行安装程序，并将其拖放到我的应用程序文件夹中。但我不想再这样做了，我用的是 Homebrew。

首先，我可以通过稍微不同的语法确认它可以使用：

```
$ brew search --casks meld
==> Casks
meld
```

然后我使用 `cask` 子命令来安装它：

```
$ brew cask install meld
==> Downloading https://github.com/yousseb/meld/releases/download/osx-19/meldmerge.dmg
==> Downloading from https://github-production-release-asset-2e65be.s3.amazonaws.com/28624006/66cb25
######################################################################## 100.0%
==> Verifying SHA-256 checksum for Cask 'meld'.
==> Installing Cask meld
==> Moving App 'Meld.app' to '/Applications/Meld.app'.
==> Linking Binary 'meld.wrapper.sh' to '/usr/local/bin/meld'.
🍺  meld was successfully installed!
```

Homebrew 不仅安装了应用程序，而且还在我当前的路径 `/usr/local/bin/` 下提供了它。现在，我可以从命令行运行 `meld` 或从应用程序文件夹中启动应用程序。

### 更新一切的“酿造升级”

我一直使用软件包管理器的主要原因是，我可以不断升级我的软件，以避免已知的安全漏洞，并确保我总是有最新的功能。如果我手工安装所有的东西，我必须关注每一个工具和应用程序，以了解它是否有自动更新程序，如果没有，就得自己拉回最新的版本。

升级功能是优秀的软件包管理的闪光点。由于我没有什么特殊的版本要求，所以我只需要运行一个命令就可以顺利更新一切：

```
$ brew upgrade
==> Upgrading 6 outdated packages:
helm 3.2.1 -> 3.2.2
python@3.8 3.8.2_4 -> 3.8.3
ipython 7.14.0 -> 7.15.0
go 1.14.2_1 -> 1.14.3
libzip 1.6.1 -> 1.6.1_1
sqlite 3.31.1 -> 3.32.1
```

如果你有更复杂的需求，或者想在安装升级前关注一下升级情况，有很多功能标志可供选择。例如，`-n` 提供了一个 “模拟运行”，列出了可用的升级，而不会进行安装。你也可以 “[钉][13]” 住应用程序版本来防止它升级。

### 备份你的安装

当该工具允许你像其它[点文件的版本控制方案][14]一样备份你的安装环境时，命令行实用程序和应用程序的管理就跳到了一个全新的水平。Homebrew 就有这样的功能，可以在 `dump` 子命令下使用。它会生成一个 `Brewfile`，这是一个可重复使用的当前所有安装的工具的列表。要从你的安装的环境中生成一个，进入你的合适的文件夹并运行：

```
$ cd ~/Development/dotfiles # 这是我的点文件的文件夹
$ brew bundle dump
```

当我换了机器，想用 Homebrew 安装相同的应用程序时，我就会进入装有 `Brewfile` 的文件夹并运行。

```
$ brew bundle
```

它将在我的新机器上安装所有列出的“秘方”和“酒桶”。

### 用 Homebrew 进行软件包管理

Homebrew 是我常用的命令行工具和应用程序的管理器。它可以让我保持有条理和及时更新，它的设计在易用性和功能深度之间取得了美丽的平衡。Homebrew 将软件包管理的细节最小化到只需要你知道的程度，大多数用户都会从中受益。

如果你对 Linux 软件包管理器已经驾轻就熟，你可能会认为 Homebrew 太简单了，但不要误以为 Homebrew 的易用性是功能的缺乏。稍微深入一点看，就会发现很多高级选项，远远超出了我在这里向你展示的范围。将 `-h` 添加到任何 `brew` 子命令中，会显示可用来升级、删除、故障排除，甚至使用模板贡献新 “秘方” 的丰富功能。

总的来说，Homebrew 可以让一个重度命令行的 Mac 用户变得很开心。此外，它是开源的，所以如果你愿意，你可以[贡献代码][15]。尝试一下它，让我知道你的想法，在下面留下评论。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/homebrew-mac

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_gift_giveaway_box_520x292.png?itok=w1YQhNH1 (Gift box opens with colors coming out)
[2]: https://opensource.com/article/19/10/how-build-flatpak-packaging
[3]: https://brew.sh
[4]: https://opensource.com/article/20/4/pyenv
[5]: https://github.com/Homebrew/homebrew-core
[6]: https://github.com/Homebrew/linuxbrew-core
[7]: https://formulae.brew.sh/formula/
[8]: https://opensource.com/article/20/3/github-hub
[9]: https://github.com/tldr-pages/tldr
[10]: https://formulae.brew.sh/cask/
[11]: https://meldmerge.org/
[12]: https://opensource.com/article/20/3/meld
[13]: https://docs.brew.sh/FAQ#how-do-i-stop-certain-formulae-from-being-updated
[14]: https://opensource.com/article/19/3/move-your-dotfiles-version-control
[15]: https://github.com/Homebrew/brew
