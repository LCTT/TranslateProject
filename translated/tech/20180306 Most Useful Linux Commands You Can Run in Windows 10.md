
运行在 Windows 10 系统中绝对实用的 Linux 命令
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/wsl-commands.png?itok=91oEXdO8)

在本系列早先的文章中，我们讨论了关于如何在 [Windows 10 上开启 WSL 之旅][1] 的内容。作为本系列的最后一篇文章，我们准备探讨一些能在 Windows 10 上广泛使用的 Linux 命令。

话题深入之前，请先让我们明确本教程所适用的人群。本文适用于使用 Windows 10 系统的初级开发者，帮助其了解学习关于 Azure、AWS 或是私有云的 Linux 平台。换句话说，就是为了帮助初次接触 Linux 系统的 Windows 10 用户。

您的工作量决定了您所需要的命令，而我的需求可能和您的不一样。本文旨在帮助您在 Windwos 10 上舒服的使用 Linux。不过请牢记，WSL 并不提供硬件访问的功能，比如声卡、GPU，至少官方是这么描述的。但是这可能并不能阻止 Linux 用户的折腾精神。很多用户不仅完成了硬件访问，甚至已经在 Windows 10 上安装上了 Linux 桌面程序。但是本文并不会涉及这些内容，我们可能会讨论这些，但不是现在。

下面是我们需要着手的任务。

### 如何让您的 Linux 系统保持到最新的版本

因为 Linux 运行在了 Windows 系统中，所以您将被剥夺 Linux 系统所提供的所有安全服务。另外，如果不及时给 Linux 系统打补丁，Windows 设备将被迫暴露在外界威胁中，所以还请保持您的 Linux 设备到最新版本。

WSL 官方支持 openSUSE、SUSE Linux Enterprise 和 Ubuntu。您也可以安装其他发行版，但是我只需要它们当中的两个就可以完成我的所有工作，毕竟，我只需要访问一些 Linux 基础程序。

**更新 openSUSE Leap：**
```
sudo zypper up

```

如果您想升级系统，您可以运行下面的命令：
```
sudo zypper dup

```

**更新 Ubuntu：**
```
sudo apt-get update

sudo apt-get dist-upgrade

```

由于 Linux 系统的更新是渐进式的，所以更新系统成为了我的日常。Windows 10 的更新通常需要重启系统，而 Linux 不同，一般只有 KB 或是 MB 级的更新，无需重启。

### 管理文件目录

系统更新之后，我们还剩余一些非必要或是不那么重要的任务。

系统更新之外的第二重要的任务是使用 Linux 管理本地和远程文件。我承认我更青睐图形界面程序，但是终端能提供更可靠、更有价值的服务。使用 Explorer 程序，尝试移动 1 TB 的文件，祝你好运。数据量大的话，我通常使用 rsync 命令来移动它们。如果中断任务，rsync 可以在上次停止的节点继续工作。

虽然您可能更习惯使用 cp 或是 mv 命令复制、移动文件，但是我还是喜欢灵活的 rsync 命令，了解 rsync 对远程文件传输也有帮助。使用 rsync 大半为了完成下面三个任务： 

**使用 rsync 复制整个目录：**
```
rsync -avzP /source-directory /destination directory

```

**使用 rsync 移动文件：**
```
rsync --remove-source-files -avzP /source-directory /destination-directory

```

在成功复制目标目录之后，此命令将删除源文件。

**使用 rsync 同步文件：**

我的文件可能在多处存储。但是，我只会在主要位置中增加或是删除。如果不使用专业的软件，同步文件可能会给用户带来挑战，而 rsync 刚好可以简化这个过程。这个命令可以让两个目录文件内容同步，留个印象，也许用得上。
```
rsync --delete -avzP /source-directory /destination-directory

```

如果原目录中没有找到文件，上述命令将删除目标目录中的文件，并通过另一种方式创建源目录的镜像复制。

### 文件自动备份

保持文件备份是一项普通的工作。为了保持我的设备的完全同步，我运行了一个 cron 作业在夜间持续同步我的所有目录。保持一个外部驱动，每周我都会手动同步。由于可能删掉我不想删除的文件，所以我并没有使用 --delete 选项。

**创建 cron 作业, 打开 crontab:**
```
crontab -e

```

移动大文件时，我会选择在系统空闲的深夜执行该命令。此命令将在每天早上 1 点运行，您大概可以这样修改它：
```
# 0 1 * * * rsync -avzP /source-directory /destination-directory

```

这是使用 crontab 的定时作业的命令结构：
```
# m h dom mon dow command

```

在此，m = 分钟, h = 小时, dom= 本月的某天, mon= 月; dow= 本周的某天。

我们将在每天早上 1 点运行这条命令。您可以选择 dow 或是 dom（比如，每月 5 号）等。您可以在 [这里][2] 阅读更多相关内容。

### 管理远程服务器

在 Windows 系统上使用 WSL 的优势之一就是能方便管理远程 Linux 服务器，WSL 能提供原生的 Linux 工具给您。首先，您需要使用 ssh 命令登陆远程 Linux 服务器。

比如，我的服务器 ip 是 192.168.0.112；端口为 2018（不是默认的 22 端口）；Linux 用户名是 swapnil，密码是 `就不告诉你`。
```
ssh -p2018 swapnil@192.168.0.112

```

它会向您请求用户密码，然后您就可以登陆到 Linux 服务器了。现在您可以执行任意您想执行的所有操作，且不需使用额外的 puTTY 程序。

使用 rsync ，您可以很轻易的将本地文件传输到远程设备。源文件还是目标目录取决于您是上传文件到服务器，还是下载文件到本地目录，您可以使用 [username@IP][3]。

如果我想在服务器中复制一些文本内容到 home 目录，参照这里的目录： 
```
rsync -avzP /source-directory-on-local-machine ‘ssh -p2018’ swapnil@192.168.0.112:/home/swapnil/Documents/

```

这将会在远程服务器中复制文件到 `Documents` 目录。

### 总结

本教程主要是为了证明您可以通过 Windows 10 系统的 WSL 完成 Linux 系的很大一部分的任务。通常来说，它提高了生产效率。现在，Linux 的世界已经向 Windwos 10 系统打开怀抱了，尽情探索吧。如果您有任何疑问，或是想了解 WSL 涉及到的其他层面，欢迎在下方的评论区分享您的想法。

在 [Administering Linux on Azure (LFS205)][4] 课程中了解更多，可以在 [这里][5] 注册。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/3/most-useful-linux-commands-you-can-run-windows-10

作者：[SAPNIL BHARTIYA][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/blog/learn/2018/2/how-get-started-using-wsl-windows-10
[2]:http://www.adminschoice.com/crontab-quick-reference
[3]:mailto:username@IP
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/administering-linux-on-azure
[5]:http://bit.ly/2FpFtPg
