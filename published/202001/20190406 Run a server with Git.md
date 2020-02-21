[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11795-1.html)
[#]: subject: (Run a server with Git)
[#]: via: (https://opensource.com/article/19/4/server-administration-git)
[#]: author: (Seth Kenlon  https://opensource.com/users/seth/users/seth)

使用 Git 来管理 Git 服务器
======

> 借助 Gitolite，你可以使用 Git 来管理 Git 服务器。在我们的系列文章中了解这些鲜为人知的 Git 用途。

![](https://img.linux.net.cn/data/attachment/album/202001/18/132045yrr1pb9n497tfbiy.png)

正如我在系列文章中演示的那样，[Git][2] 除了跟踪源代码外，还可以做很多事情。信不信由你，Git 甚至可以管理你的 Git 服务器，因此你可以或多或少地使用 Git 本身来运行 Git 服务器。

当然，这涉及除日常使用 Git 之外的许多组件，其中最重要的是 [Gitolite][3]，该后端应用程序可以管理你使用 Git 的每个细微的配置。Gitolite 的优点在于，由于它使用 Git 作为其前端接口，因此很容易将 Git 服务器管理集成到其他基于 Git 的工作流中。Gitolite 可以精确控制谁可以访问你服务器上的特定存储库以及他们具有哪些权限。你可以使用常规的 Linux 系统工具自行管理此类事务，但是如果有好几个用户和不止一两个仓库，则需要大量的工作。

Gitolite 的开发人员做了艰苦的工作，使你可以轻松地为许多用户提供对你的 Git 服务器的访问权，而又不让他们访问你的整个环境 —— 而这一切，你可以使用 Git 来完成全部工作。

Gitolite 并**不是**图形化的管理员和用户面板。优秀的 [Gitea][4] 项目可提供这种体验，但是本文重点介绍 Gitolite 的简单优雅和令人舒适的熟悉感。

### 安装 Gitolite

假设你的 Git 服务器运行在 Linux 上，则可以使用包管理器安装 Gitolite（在 CentOS 和 RHEL 上为 `yum`，在 Debian 和 Ubuntu 上为 `apt`，在 OpenSUSE 上为 `zypper` 等）。例如，在 RHEL 上：

```
$ sudo yum install gitolite3
```

许多发行版的存储库提供的仍是旧版本的 Gitolite，但最新版本为版本 3。

你必须具有对服务器的无密码 SSH 访问权限。如果愿意，你可以使用密码登录服务器，但是 Gitolite 依赖于 SSH 密钥，因此必须配置使用密钥登录的选项。如果你不知道如何配置服务器以进行无密码 SSH 访问，请首先学习如何进行操作（Steve Ovens 的 Ansible 文章的[设置 SSH 密钥身份验证][5]部分对此进行了很好的说明）。这是加强服务器管理的安全以及运行 Gitolite 的重要组成部分。

### 配置 Git 用户

如果没有 Gitolite，则如果某人请求访问你在服务器上托管的 Git 存储库时，则必须向该人提供用户帐户。Git 提供了一个特殊的外壳，即 `git-shell`，这是一个仅执行 Git 任务的特别的特定 shell。这可以让你有个只能通过非常受限的 Shell 环境来过滤访问你的服务器的用户。

这个解决方案是一个办法，但通常意味着用户可以访问服务器上的所有存储库，除非你具有用于组权限的良好模式，并在创建新存储库时严格遵循这些权限。这种方式还需要在系统级别进行大量手动配置，这通常是只有特定级别的系统管理员才能做的工作，而不一定是通常负责 Git 存储库的人员。

Gitolite 通过为需要访问任何存储库的每个人指定一个用户名来完全回避此问题。默认情况下，该用户名是 `git`，并且由于 Gitolite 的文档中假定使用的是它，因此在学习该工具时保留它是一个很好的默认设置。对于曾经使用过 GitLab 或 GitHub 或任何其他 Git 托管服务的人来说，这也是一个众所周知的约定。

Gitolite 将此用户称为**托管用户**。在服务器上创建一个帐户以充当托管用户（我习惯使用 `git`，因为这是惯例）：

```
$ sudo adduser --create-home git
```

为了控制该 `git` 用户帐户，该帐户必须具有属于你的有效 SSH 公钥。你应该已经进行了设置，因此复制你的公钥（**而不是你的私钥**）添加到 `git` 用户的家目录中：

```
$ sudo cp ~/.ssh/id_ed25519.pub /home/git/
$ sudo chown git:git /home/git/id_ed25519.pub
```

如果你的公钥不以扩展名 `.pub` 结尾，则 Gitolite 不会使用它，因此请相应地重命名该文件。切换为该用户帐户以运行 Gitolite 的安装程序：

```
$ sudo su - git
$ gitolite setup --pubkey id_ed25519.pub
```

安装脚本运行后，`git` 的家用户目录将有一个 `repository` 目录，该目录（目前）包含存储库 `git-admin.git` 和 `testing.git`。这就是该服务器所需的全部设置，现在请登出 `git` 用户。 

### 使用 Gitolite

管理 Gitolite 就是编辑 Git 存储库中的文本文件，尤其是 `gitolite-admin.git` 中的。你不会通过 SSH 进入服务器来进行 Git 管理，并且 Gitolite 也建议你不要这样尝试。在 Gitolite 服务器上存储你和你的用户的存储库是个**裸**存储库，因此最好不要使用它们。

```
$ git clone git@example.com:gitolite-admin.git gitolite-admin.git
$ cd gitolite-admin.git
$ ls -1
conf
keydir
```

该存储库中的 `conf` 目录包含一个名为 `gitolite.conf` 的文件。在文本编辑器中打开它，或使用 `cat` 查看其内容：

```
repo gitolite-admin
    RW+     =   id_ed22519

repo testing
    RW+     =   @all
```

你可能对该配置文件的功能有所了解：`gitolite-admin` 代表此存储库，并且 `id_ed25519` 密钥的所有者具有读取、写入和管理 Git 的权限。换句话说，不是将用户映射到普通的本地 Unix 用户（因为所有用户都使用 `git` 用户托管用户身份），而是将用户映射到 `keydir` 目录中列出的 SSH 密钥。

`testing.git` 存储库使用特殊组符号为访问服务器的每个人提供了全部权限。

#### 添加用户

如果要向 Git 服务器添加一个名为 `alice` 的用户，Alice 必须向你发送她的 SSH 公钥。Gitolite 使用文件名的 `.pub` 扩展名左边的任何内容作为该 Git 用户的标识符。不要使用默认的密钥名称值，而是给密钥指定一个指示密钥所有者的名称。如果用户有多个密钥（例如，一个用于笔记本电脑，一个用于台式机），则可以使用子目录来避免文件名冲突。例如，Alice 在笔记本电脑上使用的密钥可能是默认的 `id_rsa.pub`，因此将其重命名为`alice.pub` 或类似名称（或让用户根据其计算机上的本地用户帐户来命名密钥），然后将其放入 `gitolite-admin.git/keydir/work/laptop/` 目录中。如果她从她的桌面计算机发送了另一个密钥，命名为 `alice.pub`（与上一个相同），然后将其添加到 `keydir/home/desktop/` 中。另一个密钥可能放到 `keydir/home/desktop/` 中，依此类推。Gitolite 递归地在 `keydir` 中搜索与存储库“用户”相匹配的 `.pub` 文件，并将所有匹配项视为相同的身份。

当你将密钥添加到 `keydir` 目录时，必须将它们提交回服务器。这是一件很容易忘记的事情，这里有一个使用自动化的 Git 应用程序（例如 [Sparkleshare][7]）的真正的理由，因此任何更改都将立即提交给你的 Gitolite 管理员。第一次忘记提交和推送，在浪费了三个小时的你和你的用户的故障排除时间之后，你会发现 Gitolite 是使用 Sparkleshare 的完美理由。

```
$ git add keydir
$ git commit -m 'added alice-laptop-0.pub'
$ git push origin HEAD
```

默认情况下，Alice 可以访问 `testing.git` 目录，因此她可以使用该目录测试连接性和功能。

#### 设置权限

与用户一样，目录权限和组也是从你可能习惯的的常规 Unix 工具中抽象出来的（或可从在线信息查找）。在 `gitolite-admin.git/conf` 目录中的 `gitolite.conf` 文件中授予对项目的权限。权限分为四个级别：

* `R` 允许只读。在存储库上具有 `R` 权限的用户可以克隆它，仅此而已。
* `RW` 允许用户执行分支的快进推送、创建新分支和创建新标签。对于大多数用户来说，这个基本上就像是一个“普通”的 Git 存储库。
* `RW+` 允许可能具有破坏性的 Git 动作。用户可以执行常规的快进推送、回滚推送、变基以及删除分支和标签。你可能想要或不希望将其授予项目中的所有贡献者。
* `-` 明确拒绝访问存储库。这与未在存储库的配置中列出的用户相同。

通过调整 `gitolite.conf` 来创建一个新的存储库或修改现有存储库的权限。例如，授予 Alice 权限来管理一个名为 `widgets.git` 的新存储库：

```
repo gitolite-admin
    RW+     =   id_ed22519

repo testing
    RW+     =   @all

repo widgets
    RW+     =   alice
```

现在，Alice（也仅有 Alice 一个人）可以克隆该存储库：

```
[alice]$ git clone git@example.com:widgets.git
Cloning into 'widgets'...
warning: You appear to have cloned an empty repository.
```

在第一次推送时，Alice 必须使用 `-u` 选项将其分支发送到空存储库（如同她在任何 Git 主机上做的一样）。

为了简化用户管理，你可以定义存储库组：

```
@qtrepo = widgets
@qtrepo = games

repo gitolite-admin
    RW+     =   id_ed22519

repo testing
    RW+     =   @all

repo @qtrepo
    RW+     =   alice
```

正如你可以创建组存储库一样，你也可以对用户进行分组。默认情况下存在一个用户组：`@all`。如你所料，它包括所有用户，无一例外。你也可以创建自己的组：

```
@qtrepo = widgets
@qtrepo = games

@developers = alice bob

repo gitolite-admin
    RW+     =   id_ed22519

repo testing
    RW+     =   @all

repo @qtrepo
    RW+     =   @developers
```

与添加或修改密钥文件一样，对 `gitolite.conf` 文件的任何更改都必须提交并推送以生效。

### 创建存储库

默认情况下，Gitolite 假设存储库的创建是从上至下进行。例如，有权访问 Git 服务器的项目经理创建了一个项目存储库，并通过 Gitolite 管理仓库添加了开发人员。

实际上，你可能更愿意向用户授予创建存储库的权限。Gitolite 称这些为“<ruby>野生仓库（通配仓库）<rt>wild repos</rt></ruby>”（我不确定这是关于仓库的形成方式的描述，还是指配置文件所需的通配符）。这是一个例子：

```
@managers = alice bob

repo foo/CREATOR/[a-z]..*
    C   =   @managers
    RW+ =   CREATOR
    RW  =   WRITERS
    R   =   READERS
```

第一行定义了一组用户：该组称为 `@managers`，其中包含用户 `alice` 和 `bob`。下一行设置了通配符允许创建尚不存在的存储库，放在名为 `foo` 的目录下的创建该存储库的用户名的子目录中。例如：

```
[alice]$ git clone git@example.com:foo/alice/cool-app.git
Cloning into cool-app'...
Initialized empty Git repository in /home/git/repositories/foo/alice/cool-app.git
warning: You appear to have cloned an empty repository.
```

野生仓库的创建者可以使用一些机制来定义谁可以读取和写入其存储库，但是他们是有范围限定的。在大多数情况下，Gitolite 假定由一组特定的用户来管理项目权限。一种解决方案是使用 Git 挂钩来授予所有用户对 `gitolite-admin` 的访问权限，以要求管理者批准将更改合并到 master 分支中。

### 了解更多

Gitolite 具有比此介绍性文章所涵盖的更多功能，因此请尝试一下。其[文档][8]非常出色，一旦你通读了它，就可以自定义 Gitolite 服务器，以向用户提供你喜欢的任何级别的控制。Gitolite 是一种维护成本低、简单的系统，你可以安装、设置它，然后基本上就可以将其忘却。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/server-administration-git

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/server_data_system_admin.png?itok=q6HCfNQ8 (computer servers processing data)
[2]: https://git-scm.com/
[3]: http://gitolite.com
[4]: http://gitea.io
[5]: Setting%20up%20SSH%20key%20authentication
[6]: mailto:git@example.com
[7]: https://opensource.com/article/19/4/file-sharing-git
[8]: http://gitolite.com/gitolite/quick_install.html
