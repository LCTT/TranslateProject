如何在 Ubuntu / Fedora / Debian 安装GitLab
================================================================================
在git 之前分布式版本控制一点都不简单。Git 是被设计用来对各种规模的工程进行版本控制的一个免费和开源的软件。git 最开始是被Linus Torvalds 设计开发的，同时他也是著名的linux 内核的创建者。[GitLab][1]是一个在git 和分布式版本控制系统领域里很棒的开发工具。他是基于web 的git 仓库管理应用，同时也包含了很多其它特性，如代码审查，wiki 页面，问题追踪等等很多功能。通过gitlab创建、审查和发布代码非常简单，有序而且快速。它可以被部署在我们自己的服务器上，同时他也在自己的官方服务器上提供免费的仓库托管服务，类似于github。gitlab 有两个版本，社区版和企业版。社区版是一个完整的免费而且开源，MIT 授权的版本，而企业版是处于专利授权，而且包含了一些CE 版本没有的功能。下面是给出了在我们运行Ubuntu，Fedora，Debian 系统上安装gitlab的一些简单的步骤

### 1. 安装前准备 ###

首先，我们要安装gitlab 社区版的依赖关系。我们要安装curl 来下载我们需要的依赖文件，安装openssh-server 这样就可以用ssh 登录我们的机器，安装ca-certifificates 来添加CA 认证，以及安装postfix 用来发送邮件。

注意：要安装GitLab CE，我们需要一台最低配置是双核处理器，2GB 内存的安装了linux 的电脑。

#### Ubuntu 14 .04/Debian 8.x ####
因为这些包都存在于Ubuntu 14.04 和Debian 8.x 官方仓库，我们只需要用apt-get 就可以完成安装。只要在终端或者命令行里执行下面的命令即可。

    # apt-get install curl openssh-server ca-certificates postfix

![install dependencies gitlab ubuntu debian](http://blog.linoxide.com/wp-content/uploads/2015/10/install-dependencies-gitlab-ubuntu-debian.png)

#### Fedora 22 ####

在Fedora 22 上，默认的包管理系统是dnfd，yum已经被抛弃了。所以我们只需要简单的运行下面的dnf 命令就可以安装好依赖的文件。

    # dnf install curl openssh-server postfix

![install dependencies gitlab fedora](http://blog.linoxide.com/wp-content/uploads/2015/10/install-dependencies-gitlab-fedora.png)

### 2. 启动服务 ###

现在，我们要在我们默认的init 系统里启动sshd 和postfix 服务。我们也会设置他们在每次系统启动时自动运行。

#### Ubuntu 14.04 ####

因为SysVinit 是Ubuntu 14.04 的默认init 系统，我们将使用services 命令来启动sshd 和postfix 守护程序。

    # service sshd start
    # service postfix start

现在，为了让他们每次开机后自动运行，我们需要运行下列的update-rc.d 命令。

    # update-rc.d sshd enable
    # update-rc.d postfix enable

#### Fedora 22/Debian 8.x ####

因为Fedora 22 和Debian 8.x 使用了Systemd 作为默认的init 系统，我们需要运行下列的命令来启动sshd 和postfix 服务。

    # systemctl start sshd postfix

现在，为了让这两个服务自动运行，我们需要运行下面的命令。

    # systemctl enable sshd postfix

创建/etc/systemd/system/multi-user.target.wants/sshd.service 的链接到/usr/lib/systemd/system/sshd.service

创建/etc/systemd/system/multi-user.target.wants/postfix.service 的链接到/usr/lib/systemd/system/postfix.service

### 3. 下载 GitLab ###

我们可以使用curl 从官方的 gitlab CE 仓库下载它的二进制安装文件。首先我们要在官网找到它的下载链接，要实现这个目的，我们可以在对应的系统平台运行下面的命令。

#### On Ubuntu 14.04 ####

因为Ubuntu 和Debian 都使用一样的debian 格式文件，我们要在 [https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs][2] 寻找需要的gitlab 版本，然后点击ubuntu/trusty 标签，因为我们运行的系统是Ubuntu 14.04。接下来一个包含下载按钮的新的页面会出现，我们只需要点击它，获得下载链接，然后用curl 下载，如下所示：

    # curl https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/trusty/gitlab-ce_8.1.2-ce.0_amd64.deb

![Downloading Gitlab Ubuntu](http://blog.linoxide.com/wp-content/uploads/2015/10/downloading-gitlab-ubuntu.png)

#### Debian 8.x ####

类似于ubuntu，我们要也在[https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs][3]寻找指定的版本，然后点击debian/jessie 标签，因为我们运行的系统是Debian 8.x。接下来一个包含下载按钮的新的页面会出现，我们只需要点击它，获得下载链接，然后用curl 下载，如下所示：

    # curl https://packages.gitlab.com/gitlab/gitlab-ce/packages/debian/jessie/gitlab-ce_8.1.2-ce.0_amd64.deb/download

![Downloading Gitlab Debian](http://blog.linoxide.com/wp-content/uploads/2015/10/downloading-gitlab-debian.png)

#### Fedora 22 ####

因为fedora 使用rpm 作为安装包格式，我们要在 [https://packages.gitlab.com/gitlab/gitlab-ce?filter=rpms][4] 寻找指定的版本，然后点击el/7 标签，因为我们运行的系统是Fedora 22。接下来一个包含下载按钮的新的页面会出现，我们只需要点击它，获得下载链接，然后用curl 下载，如下所示：

    # curl https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/7/gitlab-ce-8.1.2-ce.0.el7.x86_64.rpm/download

![Downloading Gitlab Fedora](http://blog.linoxide.com/wp-content/uploads/2015/10/downloading-gitlab-fedora.png)

### 4. 安装 GitLab ###

在我们的仓库源添加到我们的linux 主机后，我们现在需要使用Linux 发行版本对应的默认包管理系统来完成gitlab 社区版的安装。

#### Ubuntu 14.04/Debian 8.x ####

在ubuntu 14.04 和Debian 8.x 这两个使用apt-get 包管理系统的linux 发行版上安装gitlab 只需要执行下面的命令：

    # dpkg -i gitlab-ce_8.1.2-ce.0_amd64.deb

![Installing Gitlab Ubuntu Debian](http://blog.linoxide.com/wp-content/uploads/2015/10/installing-gitlab-ubuntu-debian.png)

#### Fedora 22 ####

我们在Fedora 22 可以执行下面的dnf 命令安装gitlab。

    # dnf install gitlab-ce-8.1.2-ce.0.el7.x86_64.rpm

![Installing Gitlab Fedora](http://blog.linoxide.com/wp-content/uploads/2015/10/installing-gitlab-fedora.png)

### 5. 配置和启动GitLab ###

接下来，gitlab CE 已经被成功的安装到我们的Linux 系统。我们现在要开始配置和启动它。要完成这些，需要运行下面的命令，这些命令在Ubuntu，Debian和Fedora 这些发行版本上都一样。

    # gitlab-ctl reconfigure

![Reconfiguring Gitlab](http://blog.linoxide.com/wp-content/uploads/2015/10/reconfiguring-gitlab.png)

### 6. 添加防火墙允许项 ###

如果我们为了自己系统的安全性考虑而打开了防火墙程序，我们需要允许gitlab 使用的默认端口80 能够通信，这样子我们才能通过网络在web 界面访问gitlab CE。firewalld 和ipdatles 是在linux 系统上使用最广泛的防火墙程序。为了配置好防火墙，我们需要运行下面的命令。

#### Iptables ####
iptables 在Ubuntu 14.04 上默认安装并使用。所以我们需要运行下面的iptables 命令来添加打开端口80 的语句：

    # iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT

    # /etc/init.d/iptables save

#### Firewalld ####

Fedora 22 和Debian 8.x 默认安装了systemd，它已经包含了firewalld 作为默认的防火墙程序运行。为了添加打开端口80 的命令到firewalld，我们需要执行下面的命令。

    # firewall-cmd --permanent --add-service=http

    success

    # firewall-cmd --reload

    success

### 7. 访问gitlab 的web 页面###

最后，我们现在可以通过web 界面访问Gitlab CE。做到这一点可以在web 浏览器里访问http://ip-address/ 或 http://domain.com/，这要根据我们的配置来定。在我们成功登录之后，屏幕会有如下显示。

![Gitlab Login Screen](http://blog.linoxide.com/wp-content/uploads/2015/10/gitlab-login-screen.png)

现在，为了登录我们需要点击Login 按钮，它要求用户名和密码。我们现在可以输入默认的用户名和密码：**root** 和 **5iveL!fe**。在登录到仪表盘以后，我们会被要求输入gitlab root 用户的新密码。

![Setting New Password Gitlab](http://blog.linoxide.com/wp-content/uploads/2015/10/setting-new-password-gitlab.png)

### 8. 创建仓库###

在我们成功的修改密码并且登录到我们自己的仪表盘后，我们现在就来为我们的新工程创建一个新的仓库。过程如下，先跳转到Projects 页面点击**NEW PROJECT**的绿色按钮。

![Creating New Projects](http://blog.linoxide.com/wp-content/uploads/2015/10/creating-new-projects.png)

然后被要求输入我们的仓库的必要信息和配置，如下所示。我们也可以从其他git 仓库服务商导入已有的仓库。

![Creating New Project](http://blog.linoxide.com/wp-content/uploads/2015/10/configuring-git-project.png)

这些都完成之后就可以使用git 客户端包括git 命令行来访问我们自己的git 仓库。我们可以查看对工程做的任何操作，如创建里程碑，管理问题记录，合并请求，管理成员，标签以及工程的wiki 页面。

![Gitlab Menu](http://blog.linoxide.com/wp-content/uploads/2015/10/gitlab-menu.png)

### 总结 ###

gitlab 是一个很棒的开源web 应用程序，可以很好的管理我们的git 仓库。他又一个很漂亮，响应很好的界面，和很多非常酷的特性。它集成了很多酷酷的功能，如管理组，部署key，持续集成，日志记录，广播消息，钩子接口，OAuth 系统认证，模板和很多其他的功能。他有能力可以继承大量的工具，如Slack，Hipchat，LDAP，JIRA，Jenkins，很多种类的钩子和完整的API 。它需要最少2GB 内存和双核处理器才能流畅的支持500个以上的用户，但是也可以扩展为多个活跃的服务器。如果你有任何问题、建议、反馈，请写在下面的评论框，这样我们就可以改进和更新我们的内容，谢谢。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-gitlab-on-ubuntu-fedora-debian/

作者：[Arun Pyasi][a]
译者：[oska874](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://about.gitlab.com/
[2]:https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs
[3]:https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs
[4]:https://packages.gitlab.com/gitlab/gitlab-ce?filter=rpms
