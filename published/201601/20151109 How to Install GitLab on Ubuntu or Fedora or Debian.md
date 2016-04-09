如何在 Ubuntu/Fedora/Debian 中安装 GitLab
================================================================================

在 Git 问世之前，分布式版本控制从来都不是一件简单的事。Git 是一个自由开源的软件，旨在轻松且快速地对从小规模到非常巨大的项目进行管理。Git 最开始由 Linus Torvalds 开发，他同时也是著名的 Linux 内核的创建者。在 git 和分布式版本控制系统领域中，[GitLab][1] 是一个极棒的新产品。它是一个基于 web 的 Git 仓库管理应用，包含代码审查、wiki、问题跟踪等诸多功能。使用 GitLab 可以很方便、快速地创建、审查、部署及托管代码。尽管它在其官方的服务器提供了与 Github 类似的免费托管的代码仓库，但它也可以运行在我们自己的服务器上。GitLab 有两个不同的版本：社区版(Community Edition)和企业版(Enterprise Edition)。社区版本完全免费且开源，遵循 MIT 协议；而企业版则遵循一个专有的协议，包含一些社区版中没有的功能。下面介绍的是有关如何在我们自己的运行着 Ubuntu、Fedora 或 Debian 操作系统的机器上安装 GitLab 社区版的简单步骤。

### 1. 安装先决条件 ###

首先，我们需要安装 GitLab 所依赖的软件包。我们将安装 `curl`，用以下载我们所需的文件；安装`openssh-server` ，以此来通过 ssh 协议登录到我们的机器上；安装`ca-certificates`，用它来添加 CA 认证；以及 `postfix`，把它作为一个 MTA(Mail Transfer Agent，邮件传输代理)。

注： 若要安装 GitLab 社区版，我们需要一个至少包含 2 GB 内存和 2 核 CPU 的 linux 机器。

#### 在 Ubuntu 14 .04/Debian 8.x 中 ####

鉴于这些依赖包都可以在 Ubuntu 14.04 和 Debian 8.x 的官方软件仓库中获取到，我们只需通过使用 `apt-get` 包管理器来安装它们。为此，我们需要在一个终端或控制台中执行下面的命令：

    # apt-get install curl openssh-server ca-certificates postfix

![install dependencies gitlab ubuntu debian](http://blog.linoxide.com/wp-content/uploads/2015/10/install-dependencies-gitlab-ubuntu-debian.png)

#### 在 Fedora 22 中 ####

在 Fedora 22 中，由于 `yum` 已经被弃用了，默认的包管理器是 `dnf`。为了安装上面那些需要的软件包，我们只需运行下面的 dnf 命令：

    # dnf install curl openssh-server postfix

![install dependencies gitlab fedora](http://blog.linoxide.com/wp-content/uploads/2015/10/install-dependencies-gitlab-fedora.png)

### 2. 打开并开启服务 ###

现在，我们将使用我们默认的初始化系统来打开 sshd 和 postfix 服务。并且我们将使得它们在每次系统启动时被自动开启。

#### 在 Ubuntu 14.04 中 ####

由于在 Ubuntu 14.04 中安装的是 SysVinit 初始化系统，我们将使用 service 命令来开启 sshd 和 postfix 守护进程：

    # service sshd start
    # service postfix start

现在，为了使得它们在每次开机启动时被自动开启，我们需要运行下面的 update-rc.d 命令：

    # update-rc.d sshd enable
    # update-rc.d postfix enable

#### 在 Fedora 22/Debian 8.x 中 ####

鉴于 Fedora 22 和 Debian 8.x 已经用 Systemd 代替了 SysVinit 来作为默认的初始化系统，我们只需运行下面的命令来开启 sshd 和 postfix 服务：

    # systemctl start sshd postfix

现在，为了使得它们在每次开机启动时可以自动运行，我们需要运行下面的 systemctl 命令：

    # systemctl enable sshd postfix

    Created symlink from /etc/systemd/system/multi-user.target.wants/sshd.service to /usr/lib/systemd/system/sshd.service.
	Created symlink from /etc/systemd/system/multi-user.target.wants/postfix.service to /usr/lib/systemd/system/postfix.service.

### 3. 下载 GitLab ###

现在，我们将使用 curl 从官方的 GitLab 社区版仓库下载二进制安装文件。首先，为了得到所需文件的下载链接，我们需要浏览到该软件仓库的页面。为此，我们需要在运行着相应操作系统的 linux 机器上运行下面的命令。

#### 在 Ubuntu 14.04 中 ####

由于 Ubuntu 和 Debian 使用相同的 debian 格式的安装包，我们需要在 [https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs][2] 下搜索所需版本的 GitLab，然后点击有着 ubuntu/trusty 标签的链接，即我们运行着的 Ubuntu 14.04。接着一个新的页面将会出现，我们将看到一个下载按钮，然后我们在它的上面右击，得到文件的链接，然后像下面这样使用 curl 来下载它。

    # curl https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/trusty/gitlab-ce_8.1.2-ce.0_amd64.deb

![Downloading Gitlab Ubuntu](http://blog.linoxide.com/wp-content/uploads/2015/10/downloading-gitlab-ubuntu.png)

#### 在 Debian 8.x 中 ####

与 Ubuntu 类似，我们需要在 [https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs][3] 页面中搜索所需版本的 GitLab，然后点击带有 debian/jessie 标签的链接，即我们运行着的 Debian 8.x。接着，一个新的页面将会出现，然后我们在下载按钮上右击，得到文件的下载链接。最后我们像下面这样使用 curl 来下载该文件。

    # curl https://packages.gitlab.com/gitlab/gitlab-ce/packages/debian/jessie/gitlab-ce_8.1.2-ce.0_amd64.deb/download

![Downloading Gitlab Debian](http://blog.linoxide.com/wp-content/uploads/2015/10/downloading-gitlab-debian.png)

#### 在 Fedora 22 中####

由于 Fedora 使用 rpm 文件来作为软件包，我们将在 [https://packages.gitlab.com/gitlab/gitlab-ce?filter=rpms][4] 页面下搜索所需版本的 GitLab，然后点击所需发行包的链接，这里由于我们运行的是 Fedora 22，所以我们将选择带有 el/7 标签的发行包。一个新的页面将会出现，在其中我们可以看到一个下载按钮，我们将右击它，得到所需文件的链接，然后像下面这样使用 curl 来下载它。

    # curl https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/7/gitlab-ce-8.1.2-ce.0.el7.x86_64.rpm/download

![Downloading Gitlab Fedora](http://blog.linoxide.com/wp-content/uploads/2015/10/downloading-gitlab-fedora.png)

### 4. 安装 GitLab ###

在相应的软件源被添加到我们的 linux 机器上之后，现在我们将使用相应 linux 发行版本中的默认包管理器来安装 GitLab 社区版。

#### 在 Ubuntu 14.04/Debian 8.x 中 ####

要在运行着 Ubuntu 14.04 或 Debian 8.x linux 发行版本的机器上安装 GitLab 社区版，我们只需运行如下的命令：

    # dpkg -i gitlab-ce_8.1.2-ce.0_amd64.deb

![Installing Gitlab Ubuntu Debian](http://blog.linoxide.com/wp-content/uploads/2015/10/installing-gitlab-ubuntu-debian.png)

#### 在 Fedora 22 中 ####

我们只需执行下面的 dnf 命令来在我们的 Fedora 22 机器上安装 GitLab。

    # dnf install gitlab-ce-8.1.2-ce.0.el7.x86_64.rpm

![Installing Gitlab Fedora](http://blog.linoxide.com/wp-content/uploads/2015/10/installing-gitlab-fedora.png)

### 5. 配置和开启 GitLab ###

GitLab 社区版已经成功地安装在我们的 linux 系统中了，接下来我们将要配置和开启它了。为此，我们需要运行下面的命令，这在 Ubuntu、Debian 和 Fedora 发行版本上都一样：

    # gitlab-ctl reconfigure

![Reconfiguring Gitlab](http://blog.linoxide.com/wp-content/uploads/2015/10/reconfiguring-gitlab.png)

### 6. 允许通过防火墙 ###

假如在我们的 linux 机器中已经启用了防火墙程序，为了使得 GitLab 社区版的 web 界面可以通过网络进行访问，我们需要允许 80 端口通过防火墙，这个端口是 GitLab 社区版的默认端口。为此，我们需要运行下面的命令。

#### 在 iptables 中 ####

Ubuntu 14.04 默认安装和使用的是 iptables。所以，我们将运行下面的 iptables 命令来打开 80 端口：

    # iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT

    # /etc/init.d/iptables save

#### 在 firewalld 中 ####

由于 Fedora 22 和 Debian 8.x 默认安装了 systemd，它包含了作为防火墙程序的 firewalld。为了使得 80 端口（http 服务） 能够通过 firewalld，我们需要执行下面的命令。

    # firewall-cmd --permanent --add-service=http

    success

    # firewall-cmd --reload

    success

### 7. 访问 GitLab Web 界面 ###

最后，我们将访问 GitLab 社区版的 web 界面。为此，我们需要将我们的 web 浏览器指向 GitLab 服务器的网址，根据我们的配置，可能是 http://ip-address/ 或 http://domain.com/ 的格式。在我们成功指向该网址后，我们将会看到下面的页面。

![Gitlab Login Screen](http://blog.linoxide.com/wp-content/uploads/2015/10/gitlab-login-screen.png)

现在，为了登录进面板，我们需要点击登录按钮，它将询问我们的用户名和密码。然后我们将输入默认的用户名和密码，即 **root** 和 **5iveL!fe** 。在登录进控制面板后，我们将被强制要求为我们的 GitLab root 用户输入新的密码。

![Setting New Password Gitlab](http://blog.linoxide.com/wp-content/uploads/2015/10/setting-new-password-gitlab.png)

### 8. 创建仓库 ###

在我们成功地更改密码并登录到我们的控制面板之后，现在，我们将为我们的新项目创建一个新的仓库。为此，我们需要来到项目栏，然后点击 **新项目** 绿色按钮。

![Creating New Projects](http://blog.linoxide.com/wp-content/uploads/2015/10/creating-new-projects.png)

接着，我们将被询问给我们的项目输入所需的信息和设定，正如下面展示的那样。我们甚至可以从其他的 git 仓库提供商和仓库中导入我们的项目。

![Creating New Project](http://blog.linoxide.com/wp-content/uploads/2015/10/configuring-git-project.png)

做完这些后，我们将能够使用任何包含基本 git 命令行的 Git 客户端来访问我们的 Git 仓库。我们可以看到在仓库中进行的任何活动，例如创建一个里程碑，管理问题，合并请求，管理成员，便签，Wiki 等。

![Gitlab Menu](http://blog.linoxide.com/wp-content/uploads/2015/10/gitlab-menu.png)

### 总结 ###

GitLab 是一个用来管理 git 仓库的很棒的开源 web 应用。它有着漂亮的带有诸多酷炫功能的响应式界面。它还打包有许多酷炫功能，例如管理群组，分发密钥，持续集成，查看日志，广播消息，钩子，系统 OAuth 应用，模板等。（注：OAuth 是一个开放标准，允许用户让第三方应用访问该用户在某一网站上存储的私密的资源（如照片，视频，联系人列表），而无需将用户名和密码提供给第三方应用。--- 摘取自 [维基百科上的 OAuth 词条](https://zh.wikipedia.org/wiki/OAuth)） 它还可以和大量的工具进行交互如 Slack，Hipchat，LDAP，JIRA，Jenkins，有很多类型的钩子和完整的 API。它至少需要 2 GB 的内存和 2 核 CPU 来流畅运行，支持多达 500 个用户，但它也可以被扩展到多个工作服务器上。

假如你有任何的问题，建议，回馈，请将它们写在下面的评论框中，以便我们可以提升或更新我们的内容。谢谢！

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-gitlab-on-ubuntu-fedora-debian/

作者：[Arun Pyasi][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://about.gitlab.com/
[2]:https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs
[3]:https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs
[4]:https://packages.gitlab.com/gitlab/gitlab-ce?filter=rpms