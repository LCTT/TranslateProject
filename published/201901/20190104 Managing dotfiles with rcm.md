[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10466-1.html)
[#]: subject: (Managing dotfiles with rcm)
[#]: via: (https://fedoramagazine.org/managing-dotfiles-rcm/)
[#]: author: (Link Dupont https://fedoramagazine.org/author/linkdupont/)

用 rcm 管理隐藏文件
======

![](https://fedoramagazine.org/wp-content/uploads/2018/12/dotfiles-816x345.jpg)

许多 GNU/Linux 程序的一个特点是有个易于编辑的配置文件。几乎所有常见的自由软件都将配置设置保存在纯文本文件中，通常采用结构化格式，如 JSON、YAML 或[“类似 ini”][1] 的文件中。这些配置文件经常隐藏在用户的主目录中。但是，基本的 `ls` 不会显示它们。UNIX 标准要求以点开头的任何文件或目录名称都被视为“隐藏”，除非用户特意要求，否则不会列在目录列表中。例如，要使用 `ls` 列出所有文件，要传递 `-a` 选项。

随着时间的推移，这些配置文件会有很多定制配置，管理它们变得越来越具有挑战性。不仅如此，在多台计算机之间保持同步是大型组织所面临的共同挑战。最后，许多用户也对其独特的配置感到自豪，并希望以简单的方式与朋友分享。这就是用到 rcm 介入的地方。

rcm 是一个 “rc” 文件管理套件（“rc” 是命名配置文件的另一种约定，它已被某些 GNU/Linux 程序采用，如 `screen` 或 `bash`）。 rcm 提供了一套命令来管理和列出它跟踪的文件。使用 `dnf` 安装 rcm。

### 开始使用

默认情况下，rcm 使用 `~/.dotfiles` 来存储它管理的所有隐藏文件。一个被管理的隐藏文件实际保存在 `~/.dotfiles` 目录中，而它的符号链接会放在文件原本的位置。例如，如果 `~/.bashrc` 由 rcm 所管理，那么详细列表将如下所示。

```
[link@localhost ~]$ ls -l ~/.bashrc
lrwxrwxrwx. 1 link link 27 Dec 16 05:19 .bashrc -> /home/link/.dotfiles/bashrc
[link@localhost ~]$
```

rcm 包含 4 个命令：

  * `mkrc` – 将文件转换为由 rcm 管理的隐藏文件
  * `lsrc` – 列出由 rcm 管理的文件
  * `rcup` – 同步由 rcm 管理的隐藏文件
  * `rcdn` – 删除 rcm 管理的所有符号链接

### 在两台计算机上共享 bashrc

如今用户在多台计算机上拥有 shell 帐户并不罕见。在这些计算机之间同步隐藏文件可能是一个挑战。这里将提供一种可能的解决方案，仅使用 rcm 和 git。

首先使用 `mkrc` 将文件转换成由 rcm 管理的文件。

```
[link@localhost ~]$ mkrc -v ~/.bashrc
Moving...
'/home/link/.bashrc' -> '/home/link/.dotfiles/bashrc'
Linking...
'/home/link/.dotfiles/bashrc' -> '/home/link/.bashrc'
[link@localhost ~]$
```

接下来使用 `lsrc` 验证列表是否正确。

```
[link@localhost ~]$ lsrc
/home/link/.bashrc:/home/link/.dotfiles/bashrc
[link@localhost ~]$
```

现在在 `~/.dotfiles` 中创建一个 git 仓库，并使用你选择的 git 仓库托管设置一个远程仓库。提交 `bashrc` 文件并推送一个新分支。

```
[link@localhost ~]$ cd ~/.dotfiles
[link@localhost .dotfiles]$ git init
Initialized empty Git repository in /home/link/.dotfiles/.git/
[link@localhost .dotfiles]$ git remote add origin git@github.com:linkdupont/dotfiles.git
[link@localhost .dotfiles]$ git add bashrc
[link@localhost .dotfiles]$ git commit -m "initial commit"
[master (root-commit) b54406b] initial commit
1 file changed, 15 insertions(+)
create mode 100644 bashrc
[link@localhost .dotfiles]$ git push -u origin master
...
[link@localhost .dotfiles]$
```

在第二台机器上，克隆这个仓库到 `~/.dotfiles` 中。

```
[link@remotehost ~]$ git clone git@github.com:linkdupont/dotfiles.git ~/.dotfiles
...
[link@remotehost ~]$
```

现在使用 `rcup` 更新受 rcm 管理的符号链接。

```
[link@remotehost ~]$ rcup -v
replacing identical but unlinked /home/link/.bashrc
removed '/home/link/.bashrc'
'/home/link/.dotfiles/bashrc' -> '/home/link/.bashrc'
[link@remotehost ~]$
```

覆盖现有的 `~/.bashrc`（如果存在）并重启 shell。

就是这些了！指定主机选项 （`-o`） 是对上面这种情况的有用补充。如往常一样，请阅读手册页。它们包含了很多示例命令。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/managing-dotfiles-rcm/

作者：[Link Dupont][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/linkdupont/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/INI_file
