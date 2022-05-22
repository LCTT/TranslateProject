[#]: subject: "20 essential Linux commands for every user"
[#]: via: "https://opensource.com/article/21/9/essential-linux-commands"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13759-1.html"

用户必会的 20 个 Linux 基础命令
======

> 无论新手老手，这 20 个 Linux 命令都能让你的操作更轻松。

![](https://img.linux.net.cn/data/attachment/album/202109/07/082525n7amf7gejo16zaxx.jpg)

在黝黑的终端窗口中输入命令，这样的方式对某些人群来说可能好像过时了，但对许多专业计算机人员来说，这几乎是计算机完成能够执行的所有任务的最有效、最简便和最清晰的方式。如今，一些项目将开源命令引入了 macOS 和 Windows 等非开放平台，因此终端命令不仅仅是针对 Linux 和 BSD 用户，更是与每个人都息息相关。你可能会惊讶地发现，在一台普通的 [POSIX][2] 计算机上安装了数千个命令，当然，其中很多命令并不是真的有用，至少不是直接或经常性被使用。而其中的一部分命令虽然不是有效终端必须使用的命令，但相比其他命令而言使用频率较高，值得大家学习一下。

以下是终端用户最可能会使用的前 20 个命令：

### cd

在终端外，你可以单击图标从一个文件夹移动到另一个文件夹，但在终端中，你需要使用 `cd`。`cd` 命令代表<ruby>变更目录<rt>change directory</rt></ruby>，是用户在 Linux 系统中移动的方式。这是 Linux 中从一个地方到另一个地方最快、最直接的路线。

例如，在桌面上，当你想从你的主目录（你保存所有文件夹的地方）移动到一个名为 `presentations` 的文件夹时，你首先要打开你的 `Documents` 文件夹，然后打开一个名叫 `work` 的文件夹，然后是 `projects` 文件夹，然后是 `conference` 文件夹，最后是 `presentations` 文件夹，里面存放的是 LibreOffice Impress 幻灯片。这个过程包含了很多次的双击操作。同时屏幕上还需要许多鼠标移动动作，这取决于新窗口出现的位置，以及大脑需要跟踪的许多路径点。许多人通过将 _所有文件_ 都放在桌面上来避免这个看似微不足道的任务。

而终端用户只需键入以下内容即可避免此问题：

```
$ cd ~/Documents/work/projects/conference/presentations
```

一些有经验的终端用户甚至都懒得输入所有这些，而是使用 `Tab` 键自动完成单词填充。更甚者，有时你都不必依赖自动完成，而是改用通配符：

```
$ cd ~/Doc*/work/*/conf*/p*
```

### pwd

用 Buckaroo Banzai 的话来说：“无论你走到哪里，你就在那里。”

当你想弄清楚确切位置时，就可以使用 `pwd` 命令。`pwd` 代表<ruby>打印工作目录<rt>print working directory</rt></ruby>，这正是它的作用。`--physical`（在某些情况时缩写为 `-P`）显示解析所有符号链接后的确切位置。

```
$ pwd
/home/tux/presentation

$ pwd --physical
/home/tux/Documents/work/projects/conference/presentations
```

### sed

流编辑器 `sed` 更广为人知的是一个强大的批量 _查找和替换_ 命令，但它同时也是一个正当合理的文本编辑器。你可以通过阅读我的 [介绍性文章][3] 来学习使用它，然后通过我的 [高级教程和备忘录][4] 成为老手。

### grep

`grep` 命令使用很普遍，以至于经常被用作动词（例如 “我会对一些文件进行 grep”）和动名词（例如 “grep 一些输出”）。无论是查看日志文件还是解析其他命令的输出，它都是在 shell 中解析文本时的关键组件。这是忙碌的用户专注于特定信息的一种方式。考虑一下计算世界中的数据量，`grep` 命令的流行就见怪不怪了。你可以通过阅读我的 [介绍性文章][5] 了解 `grep`，然后下载 [备忘录][6] 学习。

### file

当你需要知道文件包含什么类型的数据时，请使用 `file` 命令：

```
$ file example.foo
example.foo: RIFF (little-endian) data, Web/P image [...]

$ file example.bar
example.bar: ELF 64-bit LSB executable, x86-64 [...]
```

当然，`file` 命令并不神奇。它只不过是根据文件如何标识自身而进行输出的，并且文件可能是错误的、损坏的或伪装的。使用 [hexdump][7] 进行严格检查的方式确定性更强，但对于日常使用而言，`file` 命令非常方便。

### awk

`awk` 不仅仅是一个命令，它还是一种字面意义上的 [编程语言][8]。[点此下载我们的免费 Awk 电子书][9] 进行学习，你可能会写出远超你想象的脚本。

### curl

`curl` 命令是用于终端的 [非交互式 Web 浏览器][10]。它是面向 Web 和 API 开发人员的 [开发工具][11]。它是一个复杂灵活的命令，但如果你想从你的终端顺利地与 Web 服务交互，该命令是很值得学习的。

下载我们免费的 [curl 备忘录][12]，你可以从中学会 `curl` 的许多选项。

### ps

管理系统资源主要由内核负责，当你更喜欢或更需要手动管理时，可以使用 `ps` 命令。读者可以在我的 [使用 procps-ng 监控 Linux 系统][13] 文章中了解 `ps`。

### cat

[cat 命令][14] 是<ruby>连接<rt>concatenate</rt></ruby>的缩写，它曾因为能将若干小文件合并而显得非常有用，这些小文件可能是由于大小限制而（使用 `split` 命令）拆分的。如今，`cat` 主要是用来将文本文件的内容转储到终端中以供快速阅读，除非你为此专门去使用 `head`、`tail`、`more` 或 `less` 等命令。

尽管它的原始用途几乎已被弃用，并且其他几个命令也主要提供了其次要功能，但 `cat` 仍然是一个有用的工具。例如，它可以是复制（`cp`）命令的替代品：

```
$ cat myfile.ogg > /backups/myfile.ogg
```

它可以显示文件中不便观察的隐形字符。例如，使用 `--show-tabs` 选项，分割 [YAML][15] 的 `Tab` 字符就会显示为 `^I`：

```
$ cat --show-tabs my.yaml

---

- hosts: all
  tasks:
  - name: Make sure the current version of 'sysstat' is installed.
    dnf:
     name:
^I- sysstat
^I- httpd
^I- mariadb-server
     state: latest
```

它还可以用 `--show-nonprinting` 显示非打印字符，用 `--show-ends` 标记行尾，用 `--number` 提供行号，等等。

### find

`find` 命令可以用来查找文件，但它还有许多选项，这些选项可以帮助你通过各种过滤器和参数查找文件。读者可以从我的 [介绍性文章][16] 中学习该命令的基础知识。

如果你一直想知道为什么最基本的、不起眼的 [ls 命令][17]，不在本文列表中，那是因为 `find` 的灵活性。它不仅可以列表文件：

```
$ find .
./bar.txt
./baz.xml
./foo.txt
[...]
```

它还可以提供包含详细信息的长列表功能：

```
$ find . -ls
3014803  464 -rw-rw-r--   1 tux users  473385 Jul 26 07:25 ./foo.txt
3014837  900 -rwxrwxr-x   1 tux users  918217 Nov  6  2019 ./baz.xml
3026891  452 -rw-rw-r--   1 tux users  461354 Aug 10 13:41 ./foo.txt
[...]
```

这是一个技术问题，但也是很一个巧妙的技巧。

### tar

人们有时会引用 BSD 的 `tar` 语法来拿 Linux 命令开玩笑。尽管有这样的名声，但 `tar` 命令实际上非常直观。读者可以阅读我的 [如何解压缩 tar.gz 文件][18] 文章，了解在需要时使用 `tar` 命令的简单知识。

### more、less 和 most

这些统称为分页命令。分页命令与 `cat` 类似，但前者会在屏幕底部暂停输出，直到你向下滚动查看更多内容。这些命令比较简单，但每个之间都有细微差别。用户是用箭头键还是空格键滚动？是必须手动退出，还是在显示的文件末尾自动退出？用户的首选搜索行为是什么样的？选择你最喜欢的分页命令并将其设置在 `.bashrc` 中吧！

### ssh 和 scp

OpenSSH 不仅有助于保护与远程系统的连接安全，还可以用于启用其他命令。例如，对于许多用户来说，有了 `.ssh` 目录，他们才能与 Git 存储库顺利交互、将更新发布到网站、登录云控制平台。

### mv

`mv` 命令有双重作用：它既可以 [移动文件][19] 又可以 [重命名文件][20]。它有几个可用的保护措施，例如 `--interactive` 和 `--no-clobber` 选项避免破坏现有文件，`--backup` 命令确保数据在新位置验证之前被保留，以及 `--update` 选项确保旧版本不会替换新版本文件。

### sudo

当某个用户账户的用户名已知，且具有 _全部_ 系统权限时，该用户很快就会成为黑客攻击的目标。`sudo` 命令消除了对字面上 `root` 用户的需求，从而优雅地移除了有关系统的重要信息。不过这还不是全部，使用 `sudo` 你还可以轻松地管理单个命令、用户和组的权限。你可以在选定的命令上启用无密码执行、记录用户会话、使用摘要验证来验证命令，[等等][21]。

### alias

使用 `alias` 命令将长命令变成易于记忆的快捷方式：

```
$ alias ls='ls --classify --almost-all --ignore-backups --color'
```

### clear

有时终端会显得很混乱，输入 `clear`（或在某些 shell 中按 `Ctrl+L`）后，你就能得到漂亮、刷新的屏幕了。

### setfacl

传统上，POSIX 文件权限由 `chown` 和 `chmod` 决定。然而，如今系统变得更加复杂，因此有一个灵活性更高的命令。`setfacl` 命令允许创建一个 [访问控制列表（ACL）][22]，可以配置任意用户所需权限，并可以为文件夹及其中创建的内容设置默认权限。

### netcat

可能需要使用 `netcat`（`nc`）的人不多，但这些使用它的人确离不开它。`nc` 命令是一个通用的网络连接工具。

它可以连接到一个端口，类似于 `telnet` 命令：

```
$ nc -u 192.168.0.12 80
```

它可以 ping 一个端口，类似于 `ping` 命令：

```
$ nc -zvn 192.168.0.12 25
```

它可以探测开放端口，类似于 `nmap` 命令：

```
$ nc -zv 192.168.0.12 25-80
```

以上仅是该命令的一小部分用途。

### 你自己构建的命令

在某种程度上，Linux 终端是一个创造性解决问题的平台。当你学习命令时，你也在学习可用于创建自己的命令的组块。我的 [shell 历史][23] 中的许多命令都是自己编写的 shell 脚本，从而实现了根据自己想要的工作方式定制工作流程。你为自己的效率和舒适度而设计的命令也可以作为 shell 中的基本命令。花些时间了解一些很棒的命令，然后试着构建自己的命令吧。当你构建出的命令非常好用时，把它开源，这样就可以与他人分享你的想法啦！ 

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/essential-linux-commands

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/article/20/12/sed
[4]: https://opensource.com/article/21/3/sed-cheat-sheet
[5]: https://opensource.com/article/21/3/grep-cheat-sheet
[6]: https://opensource.com/downloads/grep-cheat-sheet
[7]: https://opensource.com/article/19/8/dig-binary-files-hexdump
[8]: https://opensource.com/article/21/1/learn-awk
[9]: https://opensource.com/article/20/9/awk-ebook
[10]: https://opensource.com/article/20/5/curl-cheat-sheet
[11]: https://www.redhat.com/sysadmin/use-curl-api
[12]: https://opensource.com/downloads/curl-command-cheat-sheet
[13]: https://opensource.com/article/21/8/linux-procps-ng
[14]: https://opensource.com/article/19/2/getting-started-cat-command
[15]: https://www.redhat.com/sysadmin/yaml-beginners
[16]: https://opensource.com/article/21/8/find-files-and-directories-find
[17]: https://opensource.com/article/19/7/master-ls-command
[18]: https://opensource.com/article/17/7/how-unzip-targz-file
[19]: https://opensource.com/article/21/8/move-files-linux
[20]: https://opensource.com/article/21/8/rename-file-linux-terminal
[21]: https://opensource.com/article/19/10/know-about-sudo
[22]: https://opensource.com/article/20/3/external-drives-linux
[23]: https://opensource.com/article/18/6/history-command
