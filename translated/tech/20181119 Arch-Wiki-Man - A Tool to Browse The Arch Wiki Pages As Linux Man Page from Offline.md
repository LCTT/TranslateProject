[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: subject: "Arch-Wiki-Man – A Tool to Browse The Arch Wiki Pages As Linux Man Page from Offline"
[#]: via: "https://www.2daygeek.com/arch-wiki-man-a-tool-to-browse-the-arch-wiki-pages-as-linux-man-page-from-offline/"
[#]: author: "[Prakash Subramanian](https://www.2daygeek.com/author/prakash/)"
[#]: url: " "

Arch-Wiki-Man – 一个以  Linux Man 手册样式离线浏览 Arch Wiki 的工具
======

现在上网已经很方便了，但技术上会有限制。

看到技术的发展，我很惊讶，但与此同时，各个地方都会出现衰退。

当你搜索有关其他 Linux 发型版本的某些东西时，大多数时候你会首先得到一个第三方的链接，但是对于 Arch Linux 来说，每次你都会得到 Arch Wiki 页面的结果。

因为 Arch Wiki 提供了除第三方网站以外的大多数解决方案。

到目前为止，你也许可以使用 Web 浏览器为你的 Arch Linux 系统找到一个解决方案，但现在你可以不用这么做了。

一个名为 arch-wiki-man 的工具t提供了一个在命令行中更快地执行这个操作的方案。如果你是一个 Arch Linux 爱好者，我建议你阅读 **[Arch Linux 安装后指南][1]** ，它可以帮助你调整你的系统以供日常使用。

### arch-wiki-man 是什么？

[arch-wiki-man][2] 工具允许用户在离线的时候从命令行（CLI）中搜索 Arch Wiki 页面。它允许用户以 Linux Man 手册样式访问和搜索整个 Wiki 页面。

而且，你无需切换到GUI。更新将每两天自动推送一次，因此，你的 Arch Wiki 本地副本页面将是最新的。这个工具的名字是`awman`， `awman` 是 Arch Wiki Man 的缩写。

我们已经写出了名为 **[Arch Wiki 命令行实用程序][3]** (arch-wiki-cli)的类似工具。它允许用户从互联网上搜索 Arch Wiki。但确保你因该在线使用这个实用程序。

### 如何安装 arch-wiki-man 工具？

arch-wiki-man 工具可以在 AUR 仓库（LCTT译者注：AUR 即 Arch 用户软件仓库（Archx User Repository））中获得，因此，我们需要使用 AUR 工具来安装它。有许多 AUR 工具可用，而且我们曾写了一篇有关非常著名的 AUR 工具： **[Yaourt AUR helper][4]** 和  **[Packer AUR helper][5]** 的文章，

```
$ yaourt -S arch-wiki-man

or

$ packer -S arch-wiki-man
```

或者，我们可以使用 npm 包管理器来安装它，确保你已经在你的系统上安装了 **[NodeJS][6]** 。然后运行以下命令来安装它。

```
$ npm install -g arch-wiki-man
```

### 如何更新 Arch Wiki 本地副本？

正如前面更新的那样，更新每两天自动推送一次，也可以通过运行以下命令来完成更新。

```
$ sudo awman-update
[sudo] password for daygeek:
[email protected] /usr/lib/node_modules/arch-wiki-man
└── [email protected]

arch-wiki-md-repo has been successfully updated or reinstalled.
```

awman-update 是一种更快更方便的更新方法。但是，你也可以通过运行以下命令重新安装arch-wiki-man 来获取更新。

```
$ yaourt -S arch-wiki-man

or

$ packer -S arch-wiki-man
```

### 如何在终端中使用 Arch Wiki ？

它有着简易的接口且易于使用。想要搜索，只需要运行 `awman` 加搜索项目。一般语法如下所示。

```
$ awman Search-Term
```

### 如何搜索多个匹配项？

如果希望列出包含`installation`字符串的所有结果的标题，运行以下格式的命令，如果输出有多个结果，那么你将会获得一个选择菜单来浏览每个项目。

```
$ awman installation
```

![][8]

详细页面的截屏

![][9]

### 在标题和描述中搜索给定的字符串

 `-d` 或 `--desc-search` 选项允许用户在标题和描述中搜索给定的字符串。

```
$ awman -d mirrors

or

$ awman --desc-search mirrors
? Select an article: (Use arrow keys)
❯ [1/3] Mirrors: Related articles
 [2/3] DeveloperWiki-NewMirrors: Contents
 [3/3] Powerpill: Powerpill is a pac
```

### 在内容中搜索给定的字符串

 `-k` 或 `--apropos` 选项也允许用户在内容中搜索给定的字符串。但须注意，此选项会显著降低搜索速度，因为此选项会扫描整个 Wiki 页面的内容。

```
$ awman -k openjdk

or

$ awman --apropos openjdk
? Select an article: (Use arrow keys)
❯ [1/26] Hadoop: Related articles
 [2/26] XDG Base Directory support: Related articles
 [3/26] Steam-Game-specific troubleshooting: See Steam/Troubleshooting first.
 [4/26] Android: Related articles
 [5/26] Elasticsearch: Elasticsearch is a search engine based on Lucene. It provides a distributed, mul..
 [6/26] LibreOffice: Related articles
 [7/26] Browser plugins: Related articles
(Move up and down to reveal more choices)
```

### 在浏览器中打开搜索结果

 `-w` 或 `--web` 选项允许用户在 Web 浏览器中打开搜索结果。

```
$ awman -w AUR helper

or

$ awman --web AUR helper
```

![][10]

### 以其他语言搜索

`-w` 或 `--web` 选项允许用户在 Web 浏览器中打开搜索结果。想要查看支持的语言列表，请运行以下命令。

```
$ awman --list-languages
arabic
bulgarian
catalan
chinesesim
chinesetrad
croatian
czech
danish
dutch
english
esperanto
finnish
greek
hebrew
hungarian
indonesian
italian
korean
lithuanian
norwegian
polish
portuguese
russian
serbian
slovak
spanish
swedish
thai
ukrainian
```

使用你的首选语言运行 `awman` 命令以查看除英语以外的其他语言的结果。

```
$ awman -l chinesesim deepin
```

![][11]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/arch-wiki-man-a-tool-to-browse-the-arch-wiki-pages-as-linux-man-page-from-offline/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[Auk7F7](https://github.com/Auk7F7)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/arch-linux-post-installation-30-things-to-do-after-installing-arch-linux/
[2]: https://github.com/greg-js/arch-wiki-man
[3]: https://www.2daygeek.com/search-arch-wiki-website-command-line-terminal/
[4]: https://www.2daygeek.com/install-yaourt-aur-helper-on-arch-linux/
[5]: https://www.2daygeek.com/install-packer-aur-helper-on-arch-linux/
[6]: https://www.2daygeek.com/install-nodejs-on-ubuntu-centos-debian-fedora-mint-rhel-opensuse/
[7]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[8]: https://www.2daygeek.com/wp-content/uploads/2018/11/arch-wiki-man-%E2%80%93-A-Tool-to-Browse-The-Arch-Wiki-Pages-As-Linux-Man-page-from-Offline-1.png
[9]: https://www.2daygeek.com/wp-content/uploads/2018/11/arch-wiki-man-%E2%80%93-A-Tool-to-Browse-The-Arch-Wiki-Pages-As-Linux-Man-page-from-Offline-2.png
[10]: https://www.2daygeek.com/wp-content/uploads/2018/11/arch-wiki-man-%E2%80%93-A-Tool-to-Browse-The-Arch-Wiki-Pages-As-Linux-Man-page-from-Offline-3.png
[11]: https://www.2daygeek.com/wp-content/uploads/2018/11/arch-wiki-man-%E2%80%93-A-Tool-to-Browse-The-Arch-Wiki-Pages-As-Linux-Man-page-from-Offline-4.png
