[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11142-1.html)
[#]: subject: (Type Linux Commands In Capital Letters To Run Them As Sudo User)
[#]: via: (https://www.ostechnix.com/type-linux-commands-in-capital-letters-to-run-them-as-sudo-user/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

用大写字母输入 Linux 命令以将其作为 sudo 用户运行
======

![Type Linux Commands In Capital Letters To Run Them As Sudo User][1]

我非常喜欢 Linux 社区的原因是他们创建了很多有趣的项目，你很少能在任何其他操作系统中找到它们。不久前，我们看了一个名为 [Hollywood][2] 的有趣项目，它在类 Ubuntu 系统将终端变成了好莱坞技术情景剧的黑客界面。还有一些其他工具，例如 `cowsay`、`fortune`、`sl` 和 `toilet` 等，用来消磨时间自娱自乐！它们可能没有用，但这些程序娱乐性不错并且使用起来很有趣。今天，我偶然发现了另一个名为 `SUDO` 的类似工具。正如名字暗示的那样，你无论何时用大写字母输入 Linux 命令，`SUDO` 程序都会将它们作为 sudo 用户运行！这意味着，你无需在要运行的 Linux 命令前面输入 `sudo`。很酷，不是么？

### 安装 SUDO

> 提醒一句：

> 在安装这个程序（或任何程序）之前，请查看源代码（最后给出的链接），并查看是否包含会损害你的系统的可疑/恶意代码。在 VM 中测试它。如果你喜欢或觉得它很有用，你可以在个人/生产系统中使用它。

用 Git 克隆 `SUDO` 仓库：

```
$ git clone https://github.com/jthistle/SUDO.git
```

此命令将克隆 SUDO GIT 仓库的内容，并将它们保存在当前目录下的 `SUDO` 的目录中。

```
Cloning into 'SUDO'...
remote: Enumerating objects: 42, done.
remote: Counting objects: 100% (42/42), done.
remote: Compressing objects: 100% (29/29), done.
remote: Total 42 (delta 17), reused 30 (delta 12), pack-reused 0
Unpacking objects: 100% (42/42), done.
```

切换到 `SUDO` 目录：

```
$ cd SUDO/
```

并使用命令安装它：

```
$ ./install.sh
```

该命令将在 `~/.bashrc` 文件中添加以下行：

```
[...]
# SUDO - shout at bash to su commands
# Distributed under GNU GPLv2, @jthistle on github

shopt -s expand_aliases

IFS_=${IFS}
IFS=":" read -ra PATHS <<< "$PATH"

for i in "${PATHS[@]}"; do
    for j in $( ls "$i" ); do
        if [ ${j^^} != $j ] && [ $j != "sudo" ]; then
            alias ${j^^}="sudo $j"
        fi
    done
done

alias SUDO='sudo $(history -p !!)'

IFS=${IFS_}

# end SUDO
```

它还会备份你的 `~/.bashrc` 并将其保存为 `~/.bashrc.old`。如果有重大错误，你可以恢复它。

最后，使用命令更新更改：

```
$ source ~/.bashrc
```

### 现在，用大写字母中输入 Linux 命令，将它们作为 Sudo 用户运行

通常我们像下面那样执行需要 sudo/root 权限的命令。

```
$ sudo mkdir /ostechnix
```

对么？没错！上面的命令将在根目录（`/`）中创建名为 `ostechnix` 的目录。让我们使用 `Ctrl + c` 取消。

一旦安装了 `SUDO`，你就可以**在不使用 sudo 的情况下输入任何大写 Linux 命令**并运行它们。因此，你可以像下面那样运行上面的命令：

```
$ MKDIR /ostechnix
$ TOUCH /ostechnix/test.txt
$ LS /ostechnix
```

![][3]

用大写字母输入 Linux 命令以将其作为 sudo 用户运行

请注意**它无法绕过 sudo 密码**。你仍然需要键入 `sudo` 密码才能执行给定的命令。它只会有助于避免在每个命令前面输入 `sudo`。

相关阅读：

  * [如何在 Linux 中没有 sudo 密码运行特定命令][4]
  * [如何恢复用户的 sudo 权限][5]
  * [如何在 Ubuntu 上为用户授予和删除 sudo 权限][6]
  * [如何在 Linux 系统中查找所有 sudo 用户][7]
  * [如何在终端中输入密码时显示星号][8]
  * [如何更改 Linux 中的 sudo 提示符][9]


当然，输入 `sudo` 只需几秒钟，所以这不是什么大问题。 我必须告诉这是一个用来消磨时间的有趣且无用的项目。 如果你不喜欢它，那就去学习一些有用的东西吧。 如果你喜欢它，试一试，玩得开心！

资源：

  * [SUDO GitHub 仓库][10]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/type-linux-commands-in-capital-letters-to-run-them-as-sudo-user/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/sudo-720x340.png
[2]: https://www.ostechnix.com/turn-ubuntu-terminal-hollywood-technical-melodrama-hacker-interface/
[3]: https://www.ostechnix.com/wp-content/uploads/2019/07/SUDO-in-action.gif
[4]: https://www.ostechnix.com/run-particular-commands-without-sudo-password-linux/
[5]: https://www.ostechnix.com/how-to-restore-sudo-privileges-to-a-user/
[6]: https://www.ostechnix.com/how-to-grant-and-remove-sudo-privileges-to-users-on-ubuntu/
[7]: https://www.ostechnix.com/find-sudo-users-linux-system/
[8]: https://www.ostechnix.com/display-asterisks-type-password-terminal/
[9]: https://www.ostechnix.com/change-sudo-prompt-linux-unix/
[10]: https://github.com/jthistle/SUDO
