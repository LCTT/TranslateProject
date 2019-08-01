[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11172-1.html)
[#]: subject: (How to Upgrade Debian 9 (Stretch) to Debian 10 (Buster) via Command Line)
[#]: via: (https://www.linuxtechi.com/upgrade-debian-9-to-debian-10-command-line/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

如何通过命令行升级 Debian 9 为 Debian 10 
======

我们已经在先前的文章中看到如何安装 [Debian 10（Buster）][1]。今天，我们将学习如何从 Debian 9 升级为 Debian 10，虽然我们已将看到 Debian 10 和它的特色，所以这里我们不会深入介绍。但是可能读者没有机会读到那篇文章，让我们快速了解一下 Debian 10 和它的新功能。

![](https://www.linuxtechi.com/wp-content/uploads/2019/07/Upgrade-Debian-9-to-Debian-10.jpg)

在差不多两年的开发后，Debian 团队最终发布一个稳定版本，Debian 10 的代码名称是 Buster。Buster 是一个 LTS (长期支持支持)版本，因此未来将由 Debian 支持 5 年。

### Debian 10（Buster）新的特色

Debian 10（Buster）回报给大多数 Debian 爱好者大量的新特色。一些特色包括：

  * GNOME 桌面 3.30
  * 默认启用 AppArmor
  * 支持 Linux 内核 4.19.0-4
  * 支持 OpenJDk 11.0
  * 从 Nodejs 4 ~ 8 升级到 Nodejs 10.15.2
  * Iptables 替换为 NFTables

等等。

### 从 Debian 9 到 Debian 10 的逐步升级指南

在我们开始升级 Debian 10 前，让我们看看升级需要的必备条件：

#### 步骤 1) Debian 升级必备条件

  * 一个良好的网络连接
  * root 用户权限
  * 数据备份

备份你所有的应用程序代码库、数据文件、用户账号详细信息、配置文件是极其重要的，以便在升级出错时，你可以总是可以还原到先前的版本。

#### 步骤 2) 升级 Debian 9 现有的软件包

接下来的步骤是升级你所有现有的软件包，因为一些软件包被标志为保留不能升级，从 Debian 9 升级为 Debian 10 有失败或引发一些问题的可能性。所以，我们不冒任何风险，更好地升级软件包。使用下面的代码来升级软件包：

```
root@linuxtechi:~$ sudo apt update && sudo apt upgrade -y
```

#### 步骤 3) 修改软件包存储库文件 /etc/sources.list

接下来的步骤是修改软件包存储库文件 `/etc/sources.list`，你需要用文本 `Buster` 替换 `Stretch`。

但是，在你更改任何东西前，确保如下创建一个 `sources.list` 文件的备份：

```
root@linuxtechi:~$ sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
```

现在使用下面的 `sed` 命令来在软件包存储库文件中使用 `buster` 替换 `stretch`，示例如下显示：

```
root@linuxtechi:~$ sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list
root@linuxtechi:~$ sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list.d/*.list
```

更新后，你需要如下更新软件包存储库索引：

```
root@linuxtechi:~$ sudo apt update
```

在开始升级你现有的 Debian 操作系统前，让我们使用下面的命令验证当前版本，

```
root@linuxtechi:~$ cat /etc/*-release
PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
NAME="Debian GNU/Linux"
VERSION_ID="9"
VERSION="9 (stretch)"
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
root@linuxtechi:~$
```

#### 步骤 4) 从 Debian 9 升级到 Debian 10

你做完所有的更改后，是时候从 Debian 9 升级到 Debian 10 了。但是在这之前，再次如下确保更新你的软件包：

```
root@linuxtechi:~$ sudo apt update && sudo apt upgrade -y
```

在软件包升级期间，你将被提示启动服务，所以选择你较喜欢的选项。

一旦你系统的所有软件包升级完成，就升级你的发行版的软件包。使用下面的代码来升级发行版：

```
root@linuxtechi:~$ sudo apt dist-upgrade -y
```

升级过程可能花费一些时间，取决于你的网络速度。记住在升级过程中，你将被询问一些问题，在软件包升级后是否需要重启服务、你是否需要保留现存的配置文件等。如果你不想进行一些自定义更改，简单地键入 “Y” ，来让升级过程继续。

#### 步骤 5) 验证升级

一旦升级过程完成，重启你的机器，并使用下面的方法检测版本：

```
root@linuxtechi:~$ lsb_release -a
```

如果你获得如下输出：

```
Distributor ID: Debian
Description:    Debian GNU/Linux 10 (buster)
Release:        10
Codename:       buster
root@linuxtechi:~$
```

是的，你已经成功地从 Debian 9 升级到 Debian 10。

验证升级的备用方法：

```
root@linuxtechi:~$ cat /etc/*-release
PRETTY_NAME="Debian GNU/Linux 10 (buster)"
NAME="Debian GNU/Linux"
VERSION_ID="10"
VERSION="10 (buster)"
VERSION_CODENAME=buster
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
root@linuxtechi:~$
```

### 结束

希望上面的逐步指南为你提供了从 Debian 9（Stretch）简单地升级为 Debian 10（Buster）的所有信息。在评论部分，请给予你使用 Debian 10 的反馈、建议、体验。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/upgrade-debian-9-to-debian-10-command-line/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-11083-1.html
