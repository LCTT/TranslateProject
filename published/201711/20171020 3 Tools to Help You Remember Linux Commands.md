记不住 Linux 命令？这三个工具可以帮你
============================================================

![apropos](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/commands-main.jpg?itok=OESH_Evp "apropos")

*apropos 工具几乎默认安装在每个 Linux 发行版上，它可以帮你找到你所需的命令。*

Linux 桌面从开始的简陋到现在走了很长的路。在我早期使用 Linux 的那段日子里，掌握命令行是最基本的 —— 即使是在桌面版。不过现在变了，很多人可能从没用过命令行。但对于 Linux 系统管理员来说，可不能这样。实际上，对于任何 Linux 管理员（不管是服务器还是桌面），命令行仍是必须的。从管理网络到系统安全，再到应用和系统设定 —— 没有什么工具比命令行更强大。

但是，实际上……你可以在 Linux 系统里找到_非常多_命令。比如只看 `/usr/bin` 目录，你就可以找到很多命令执行文件（你可以运行 `ls/usr/bin/ | wc -l` 看一下你的系统里这个目录下到底有多少命令）。当然，它们并不全是针对用户的执行文件，但是可以让你感受下 Linux 命令数量。在我的 Elementary OS 系统里，目录 `/usr/bin` 下有 2029 个可执行文件。尽管我只会用到其中的一小部分，我要怎么才能记住这一部分呢？

幸运的是，你可以使用一些工具和技巧，这样你就不用每天挣扎着去记忆这些命令了。我想和大家分享几个这样的小技巧，希望能让你们能稍微有效地使用命令行（顺便节省点脑力）。

我们从一个系统内置的工具开始介绍，然后再介绍两个可以安装的非常实用的程序。

### Bash 命令历史

不管你知不知道，Bash（最流行的 Linux shell）会保留你执行过的命令的历史。想实际操作下看看吗？有两种方式。打开终端窗口然后按向上方向键。你应该可以看到会有命令出现，一个接一个。一旦你找到了想用的命令，不用修改的话，可以直接按 Enter 键执行，或者修改后再按 Enter 键。

要重新执行（或修改一下再执行）之前运行过的命令，这是一个很好的方式。我经常用这个功能。它不仅仅让我不用去记忆一个命令的所有细节，而且可以不用一遍遍重复地输入同样的命令。

说到 Bash 的命令历史，如果你执行命令 `history`，你可以列出你过去执行过的命令列表（图 1）。

![Bash 命令历史](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/commands_1.jpg?itok=2eqm9ii_ "Bash history")

*图 1: 你能找到我敲的命令里的错误吗？*

你的 Bash 命令历史保存的历史命令的数量可以在 `~/.bashrc` 文件里设置。在这个文件里，你可以找到下面两行：

```
HISTSIZE=1000

HISTFILESIZE=2000
```

`HISTSIZE` 是命令历史列表里记录的命令的最大数量，而 `HISTFILESIZE` 是命令历史文件的最大行数。

显然，默认情况下，Bash 会记录你的 1000 条历史命令。这已经很多了。有时候，这也被认为是一个安全漏洞。如果你在意的话，你可以随意减小这个数值，在安全性和实用性之间平衡。如果你不希望 Bash 记录你的命令历史，可以将 `HISTSIZE` 设置为 `0`。

如果你修改了 `~/.bashrc` 文件，记得要登出后再重新登录（否则改动不会生效）。

### apropos

这是第一个我要介绍的工具，可以帮助你记忆 Linux 命令。apropos （意即“关于”）能够搜索 Linux 帮助文档来帮你找到你想要的命令。比如说，你不记得你用的发行版用的什么防火墙工具了。你可以输入 `apropos  “firewall” `，然后这个工具会返回相关的命令（图 2）。

![apropos](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/commands_2.jpg?itok=MX5zHfet "apropos")

*图 2: 你用的什么防火墙？*

再假如你需要一个操作目录的命令，但是完全不知道要用哪个呢？输入 `apropos “directory”` 就可以列出在帮助文档里包含了字符 “directory” 的所有命令（图 3）。

![apropos directory](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/commands_3.jpg?itok=ALEsfP4q "apropos directory")

*图 3: 可以操作目录的工具有哪些呢？*

apropos 工具在几乎所有 Linux 发行版里都会默认安装。

### Fish

还有另一个能帮助你记忆命令的很好的工具。Fish 是 Linux/Unix/Mac OS 的一个命令行 shell，有一些很好用的功能。

*   自动推荐
*   VGA 颜色
*   完美的脚本支持
*   基于网页的配置
*   帮助文档自动补全
*   语法高亮
*   以及更多

自动推荐功能让 fish 非常方便（特别是你想不起来一些命令的时候）。

你可能觉得挺好，但是 fish 没有被默认安装。对于 Ubuntu（以及它的衍生版），你可以用下面的命令安装：

```
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt update
sudo apt install fish
```

对于类 CentOS 系统，可以这样安装 fish。用下面的命令增加仓库：

```
sudo -s
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
```

用下面的命令更新仓库：

```
yum repolist
yum update
```

然后用下面的命令安装 fish：

```
yum install fish
```

fish 用起来可能没你想象的那么直观。记住，fish 是一个 shell，所以在使用命令之前你得先登录进去。在你的终端里，运行命令 fish 然后你就会看到自己已经打开了一个新的 shell（图 4）。

![fish shell](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/commands_4.jpg?itok=8TBGVhVk "fish shell")

*图 4: fish 的交互式 shell。*

在开始输入命令的时候，fish 会自动补齐命令。如果推荐的命令不是你想要的，按下键盘的 Tab 键可以浏览更多选择。如果正好是你想要的，按下键盘的向右键补齐命令，然后按下 Enter 执行。在用完 fish 后，输入 exit 来退出 shell。

Fish 还可以做更多事情，但是这里只介绍用来帮助你记住命令，自动推荐功能足够了。

### 保持学习

Linux 上有太多的命令了。但你也不用记住所有命令。多亏有 Bash 命令历史以及像 apropos 和 fish 这样的工具，你不用消耗太多记忆来回忆那些帮你完成任务的命令。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/10/3-tools-help-you-remember-linux-commands

作者：[JACK WALLEN][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/licenses/category/used-permission
[6]:https://www.linux.com/files/images/commands1jpg
[7]:https://www.linux.com/files/images/commands2jpg
[8]:https://www.linux.com/files/images/commands3jpg
[9]:https://www.linux.com/files/images/commands4jpg
[10]:https://www.linux.com/files/images/commands-mainjpg
[11]:http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
