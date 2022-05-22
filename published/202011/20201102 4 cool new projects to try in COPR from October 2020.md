[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12810-1.html)
[#]: subject: (4 cool new projects to try in COPR from October 2020)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-from-october-2020/)
[#]: author: (frostyx https://fedoramagazine.org/author/frostyx/)

COPR 仓库中 4 个很酷的新项目（2020.10）
======

![][1]

COPR 是个人软件仓库[集合][2]，它不在 Fedora 中。这是因为某些软件不符合轻松打包的标准；或者它可能不符合其他 Fedora 标准，尽管它是自由而开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不受 Fedora 基础设施的支持，或者是由项目自己背书的。但是，这是一种尝试新的或实验性的软件的一种巧妙的方式。

本文介绍了 COPR 中一些有趣的新项目。如果你第一次使用 COPR，请参阅 [COPR 用户文档][3]。

### Dialect

[Dialect][4] 使用谷歌翻译将文本翻译成外语。它可以记住你的翻译历史，并支持自动语言检测和文本到语音等功能。用户界面简约，模仿谷歌翻译工具本身，所以它真的很容易使用。

![][5]

#### 安装说明

目前[仓库][6]在 Fedora 33 和 Fedora Rawhide 中提供了 Dialect。要安装它，请使用下面的命令：

```
sudo dnf copr enable lyessaadi/dialect
sudo dnf install dialect
```

### GitHub CLI

[gh][7] 是一个官方的 GitHub 命令行客户端。它在终端提供了快速的访问，并完全控制你的项目问题、拉取请求和发布。议题（和其他东西）也可以在浏览器中轻松查看，以获得更标准的用户界面，或与他人分享。

![][8]

#### 安装说明

目前[仓库][9]在 Fedora 33 和 Fedora Rawhide 中提供了 `gh` 。要安装它，请使用下面的命令：

```
sudo dnf copr enable jdoss/github-cli
sudo dnf install github-cli
```

### Glide

[Glide][10] 是一个基于 GStreamer 的极简主义媒体播放器。它可以播放任何 GStreamer 支持的多媒体格式的本地和远程文件。如果你需要一个多平台的具有简单用户界面的媒体播放器，你可能会想试试 Glide。

![][11]

#### 安装说明

目前[仓库][12]在 Fedora 32、33 和 Rawhide 中提供了 Glide。要安装它，请使用下面的命令：

```
sudo dnf copr enable atim/glide-rs
sudo dnf install glide-rs
```

### Vim ALE

[ALE][13] 是 Vim 文本编辑器的一个插件，它提供了语法和语义错误检查。它还带来了诸如代码修复和许多其他类似于 IDE 的功能，如 TAB 补全、跳转到定义、查找引用、查看文档等。

![][14]

#### 安装说明

目前[仓库][15]在 Fedora 31、32、33 和 Rawhide 还有 EPEL8 中提供了 `vim-ale` 。要安装它，请使用下面的命令：

```
sudo dnf copr enable praiskup/vim-ale
sudo dnf install vim-ale
```

编者注：可在[此处][16]查阅以前的 COPR 文章。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-from-october-2020/

作者：[frostyx][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/frostyx/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html
[4]: https://github.com/gi-lom/dialect
[5]: https://fedoramagazine.org/wp-content/uploads/2020/10/dialect.png
[6]: https://copr.fedorainfracloud.org/coprs/lyessaadi/dialect/
[7]: https://github.com/cli/cli
[8]: https://fedoramagazine.org/wp-content/uploads/2020/10/github-cli.png
[9]: https://copr.fedorainfracloud.org/coprs/jdoss/github-cli/
[10]: https://github.com/philn/glide
[11]: https://fedoramagazine.org/wp-content/uploads/2020/10/glide.png
[12]: https://copr.fedorainfracloud.org/coprs/atim/glide-rs/
[13]: https://github.com/dense-analysis/ale
[14]: https://fedoramagazine.org/wp-content/uploads/2020/10/vim-ale.png
[15]: https://copr.fedorainfracloud.org/coprs/praiskup/vim-ale/
[16]: https://fedoramagazine.org/?s=COPR
