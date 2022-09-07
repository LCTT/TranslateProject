[#]: subject: "The only Linux command you need to know"
[#]: via: "https://opensource.com/article/22/6/linux-cheat-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14961-1.html"

“作弊”：只需要知道这一个 Linux 命令就够了
======

> Linux cheat 命令是一个实用程序，可以用来搜索和显示你想要使用的命令的使用示例。

![](https://img.linux.net.cn/data/attachment/album/202208/24/160901xi66t9pe74x7pxqp.jpg)

互联网上有很多关于 Linux 和开源的信息，但是当你想要深入工作，通常需要一份便捷的文档。早在 Linux 出现之前的 Unix 系统中，就有 `man`（“manual” 的缩写）和 `info` 命令了，二者都会显示命令、配置文件、系统调用等的官方项目文档。

关于 `man` 和 `info` 页面是对知晓如何使用工具的用户的有用提醒，还是为初次使用的用户提供介绍存在争议。不管怎样，`man` 和 `info` 页面介绍了工具以及如何使用该工具，很少涉及特定任务以及如何完成它们。正是出于这个原因，开发了 `cheat` 命令。

例如，设想你想不起来如何 [解压 tar 压缩包文件][2] 。`man` 页面会给你展示所有的选项，但需要你将这些信息转换为命令：

```
tar -A [OPTIONS] ARCHIVE ARCHIVE
tar -c [-f ARCHIVE] [OPTIONS] [FILE...]
tar -d [-f ARCHIVE] [OPTIONS] [FILE...]
tar -t [-f ARCHIVE] [OPTIONS] [MEMBER...]
tar -r [-f ARCHIVE] [OPTIONS] [FILE...]
tar -u [-f ARCHIVE] [OPTIONS] [FILE...]
tar -x [-f ARCHIVE] [OPTIONS] [MEMBER...]
```

这确实是一些用户需要的，但是也使一些用户感到困惑。相比之下，`cheat` 命令会罗列常用命令：

```
$ cheat tar

# To extract an uncompressed archive:
tar -xvf /path/to/foo.tar

# To extract a .tar in specified Directory:
tar -xvf /path/to/foo.tar -C /path/to/destination/

# To create an uncompressed archive:
tar -cvf /path/to/foo.tar /path/to/foo/

# To extract a .tgz or .tar.gz archive:
tar -xzvf /path/to/foo.tgz
tar -xzvf /path/to/foo.tar.gz
[...]
```

这真是雪中送炭！

### Linux Cheat 命令

`cheat` 命令是一个实用程序，可以用来搜索和显示你想要使用的命令的使用示例。如大多数 Unix 命令一样，同一个概念有多种不同的实现方式，它包括一个 [使用 Go 编写][3] 的和一个由我帮助维护的 [仅用 100 行 Bash 编写][4] 的两个版本。

若要安装 Go 版本的，下载 [最新版][5] 并将它放在某个 [路径][6] 中，例如 `~/.local/bin/` 或 `/usr/local/bin` 中。若安装 Bash 版本，下载最新版并运行 `install-cheat.sh` 脚本：

```
$ sh ./install-cheat.sh
```

如需配置后安装，请使用 [自动工具][7]（Autotools）：

```
$ aclocal ; autoconf
$ automake --add-missing ; autoreconf
$ ./configure --prefix=$HOME/.local
$ make
$ make install
```

### 在 Linux 中安装 Cheat 程序

Cheat 只是包含常用命令的纯文本文件。该程序可以从 [github.com/cheat/cheatsheets][8] 获得。当你第一次运行命令时，Go 版本会自动为你下载支持列表。如果你使用 Bash 版本，用 `--fetch` 选项可以下载支持列表：

```
$ cheat --fetch
```

与 `man` 一样，你的系统上可以有多个备忘单集合。 Go 版本的 `cheat` 使用 [YAML][9] 配置文件来定义每个集合的位置。Bash 版本在安装过程中定义了路径，默认下载 [github.com/cheat/cheatsheets][10] 集合以及 [opensource.com][11] 自己的 [gitlab.com/opensource.com/cheatsheets][12] 集合。

### 列出 Cheat 支持项目

使用 `--list` 选项即可查看 `cheat` 支持的项目：

```
$ cheat --list
7z
ab
acl
alias
ansi
ansible
ansible-galaxy
ansible-vault
apk
[...]
```

### 使用 Cheat 查看 Linux 命令

使用 `cheat` 查看命令如同使用 `man` 和 `info` 查看一样简单。只需要输入你需要查询的命令即可：

```
$ cheat alias

# To show a list of your current shell aliases:
alias

# To alias `ls -l` to `ll`:
alias ll='ls -l'
```

默认情况下，`cheat` 命令会使用你的 [环境变量][13] `PAGER` 中指定的分页器。你可以在运行 `cheat` 命令前改写 `PAGER` 变量值，暂时修改环境变量。

```
$ PAGER=most cheat less
```

如果你只是想在没有 `PAGER` 的情况下将 `cheat` [输出][14] 到终端里，在 Bash 版中有 `--cat` 选项可以使用：

```
$ cheat --cat less
```

### 这并不是作弊

`cheat` 系统抓住了要害，你不必拼凑有关如何使用命令的线索，你只需按照示例进行操作即可。当然，对于复杂的命令，它不是深入研究实际文档的捷径，但为了快速借用，它还是可以的。

甚至你可以通过将文件放入其中一个备忘单集合中，来创建自己的备忘单。好消息是，因为这些项目是开源的，所以你可以将你的个人备忘单贡献给 GitHub 集合。另一个好消息是，当有新的 opensource.com [备忘单][15] 版本发布时，我们将从现在开始包含纯文本版本，以便你可以将其添加到你的收藏中。

该命令称为 “<ruby>作弊<rt>cheat</rt></ruby>”，但正如任何 Linux 用户都会向你保证的那样，它实际上并不是作弊。它只是以开源的方式工作得更巧妙。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/linux-cheat-command

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/command_line_prompt.png
[2]: https://opensource.com/article/17/7/how-unzip-targz-file
[3]: https://github.com/cheat/cheat
[4]: https://gitlab.com/slackermedia/cheat
[5]: https://github.com/cheat/cheat/releases
[6]: https://opensource.com/article/17/6/set-path-linux
[7]: https://opensource.com/article/19/7/introduction-gnu-autotools
[8]: https://github.com/cheat/cheatsheets
[9]: https://opensource.com/article/21/9/yaml-cheat-sheet
[10]: https://github.com/cheat/cheatsheets
[11]: http://Opensource.com
[12]: https://gitlab.com/opensource.com/cheatsheets
[13]: https://opensource.com/article/19/8/what-are-environment-variables
[14]: https://opensource.com/article/19/2/getting-started-cat-command
[15]: https://opensource.com/downloads
