OneNewLife translated

怎样在 RHEL，CentOS 和 Fedora 上安装 Git 并设置 Git 账号
=========

对于新手来说，Git 是一个免费、开源、高效的分布式版本控制系统（VCS），它是为了给广泛的小规模软件开发项目提供速度、高性能以及数据一致性而设计的。

Git 是一个软件仓库，它可以让你追踪你的软件改动，回滚到之前的版本以及创建新版本的目录和文件。

Git 主要是用 C 语言来写的，当中还混入了 Perl 和各种各样的 shell 脚本。它主要在 Linux 内核上运行，并且有以下列举的卓越的性能：

1.  容易上手
2.  运行速度飞快且大部分操作在本地进行，因此，它为需要与远程服务器通信的集中式系统提供了巨大的速度。
3.  高性能
4.  提供数据一致性检查
5.  启用低开销的本地分支
6.  提供非常便利的暂存区
7.  可以集成其它工具来维持大量工作流

在这篇操作指南中，我们将介绍在 CentOS/RHEL 7/6 和 Fedora 20-24 Linux 发行版上安装 Git 的必要步骤以及怎么配置 Git，以便于你可以快速开始参与工作。

### 使用 Yum 安装 Git

我们应该从系统默认的仓库安装 Git，并通过运行以下 [YUM 包管理器][8] 的更新命令来确保你系统的软件包都是最新的：

```
# yum update

```

接着，通过以下命令来安装 Git：

```
# yum install git

```

在 Git 成功安装之后，你可以通过以下命令来显示 Git 安装的版本：

```
# git --version

```

[![检查 Git 的安装版本](http://www.tecmint.com/wp-content/uploads/2016/10/Check-Git-Version.png)][7]

检查 Git 安装的版本

注意：从系统默认仓库安装的 Git 会是比较旧的版本。如果你想拥有最新版的 Git，请考虑使用以下说明来编译源代码进行安装。

### 从源代码安装 Git

开始之前，你首先需要从系统默认仓库安装所需的软件依赖包，以及从源代码构建二进制文件所需的实用工具：

```
# yum groupinstall "Development Tools"
# yum install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel

```

安装所需的软件依赖包之后，转到官方的 [Git 发布页面][6]，抓取最新版的 Git 并使用下列命令编译它的源代码：

```
# wget https://github.com/git/git/archive/v2.10.1.tar.gz -O git.tar.gz
# tar -zxf git.tar.gz
# cd git-2.10.1/
# make configure
# ./configure --prefix=/usr/local
# make install
# git --version

```

[![检查 Git 的安装版本](http://www.tecmint.com/wp-content/uploads/2016/10/Check-Git-Source-Version.png)][5]

检查 Git 的安装版本

**推荐阅读:** [Linux 下 11 个最好用的 Git 客户端和 Git 仓库查看器][4]

### 在 Linux 设置 Git 账户

在这个环节中，我们将介绍如何使用正确的用户信息（如：姓名、邮件地址）和 `git config` 命令来设置 Git 账户，以避免出现提交错误。

注意：确保将用户名替换为在你的系统上创建和使用的 Git 用户的真实名称。

你可以使用下面的 [useradd 命令][3] 创建一个 Git 用户，其中 `-m` 选项用于在 `/home` 目录下创建用户主目录，`-s` 选项用于指定用户默认的 shell。

```
# useradd -m -s /bin/bash username
# passwd username

```

现在，将新用户添加到 `wheel` 用户组以启用其使用 `sudo` 命令的权限：

```
# usermod username -aG wheel

```

[![创建 Git 用户账号](http://www.tecmint.com/wp-content/uploads/2016/10/Create-Git-User-Account.png)][2]

创建 Git 用户账号

然后通过以下命令使用新用户配置 Git：

```
# su username
$ sudo git config --global user.name "Your Name"
$ sudo git config --global user.email "you@example.com"

```

现在通过下面的命令校验 Git 的配置。

```
$ sudo git config --list

```

如果配置没有错误的话，你应该能够查看具有以下详细信息的输出：

```
user.name=username
user.email= username@some-domian.com

```

[![在 Linux 设置 Git 用户](http://www.tecmint.com/wp-content/uploads/2016/10/Setup-Git-Account.png)][1]
>在 Linux 设置 Git 用户

##### 总结

在这个简单的教程中，我们已经了解怎么在你的 Linux 系统上安装 Git 以及配置它。我相信你应该可以驾轻就熟。

--------------------------------------------------------------------------------

编译自: http://www.tecmint.com/install-git-centos-fedora-redhat/

作者：[Aaron Kili ][a]

译者：[OneNewLife](https://github.com/OneNewLife)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2016/10/Setup-Git-Account.png
[2]:http://www.tecmint.com/wp-content/uploads/2016/10/Create-Git-User-Account.png
[3]:http://www.tecmint.com/add-users-in-linux/
[4]:http://www.tecmint.com/best-gui-git-clients-git-repository-viewers-for-linux/
[5]:http://www.tecmint.com/wp-content/uploads/2016/10/Check-Git-Source-Version.png
[6]:https://github.com/git/git/releases
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/Check-Git-Version.png
[8]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
