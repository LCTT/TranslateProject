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

Next, as GitLab CE has been successfully installed in our linux system. We'll now go ahead for configuring and starting it. To do so, we'll need to run the following command which is same in Ubuntu, Debian and Fedora distributions.

    # gitlab-ctl reconfigure

![Reconfiguring Gitlab](http://blog.linoxide.com/wp-content/uploads/2015/10/reconfiguring-gitlab.png)

### 6. Allowing Firewall ###

If we have firewall program enabled for security in our linux box, we'll need to allow port 80 which is the default port of GitLab CE in order to make the web interface accessible across the network. Firewalld and iptables are most widely used firewall programs in linux distributions. In order to do so, we'll need to run the following commands.
On Iptables

Iptables are installed and used in Ubuntu 14.04 by default. So, we'll need to run the following iptables commands to open port 80 in it.

    # iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT

    # /etc/init.d/iptables save

#### On Firewalld ####

As Fedora 22 and Debian 8.x has systemd installed by default, it contains firewalld running as firewall program. In order to open the port 80 (http service) on firewalld, we'll need to execute the below commands.

    # firewall-cmd --permanent --add-service=http

    success

    # firewall-cmd --reload

    success

### 7. Accessing GitLab Web Interface ###

Finally, we'll now go for accessing the web interface of GitLab CE. To do so, we'll need to point our web browser to the GitLab server with http://ip-address/ or http://domain.com/ according to our configuration. After we have pointed successfully, we'll see the following screen.

![Gitlab Login Screen](http://blog.linoxide.com/wp-content/uploads/2015/10/gitlab-login-screen.png)

Now, in order to login to the panel, we'll need to click on Login button which will ask us an username and a password. We'll now enter the default username and password ie **root** and **5iveL!fe** respectively. After logging into the dashboard, we'll be asked to compulsorily enter the new password for our GitLab root user.

![Setting New Password Gitlab](http://blog.linoxide.com/wp-content/uploads/2015/10/setting-new-password-gitlab.png)

### 8. Creating Repository ###

After we have successfully changed the password and logged in to our dashboard, we'll now create a new repository for our new project. To do so, we'll need to go under Projects and click on **NEW PROJECT** green button.

![Creating New Projects](http://blog.linoxide.com/wp-content/uploads/2015/10/creating-new-projects.png)

Then, we'll be asked to enter the required information and settings for our repository as shown below. We can even import our project from many git repository providers and repositories.

![Creating New Project](http://blog.linoxide.com/wp-content/uploads/2015/10/configuring-git-project.png)

After thats done, we'll be able to access our Git repository using any Git client including the basic git command line. We can see every activities done in the repository with other functions like creating a milestone, managing issues, merge requests, managing members, labels and Wiki for our projects.

![Gitlab Menu](http://blog.linoxide.com/wp-content/uploads/2015/10/gitlab-menu.png)

### Conclusion ###

GitLab is an awesome open source web application for managing our git repository. It has a beautiful, responsive interface with plenty of cool features. It is packed with many cool features like managing groups, deploying keys, Continuous Integration, viewing logs, broadcast messages, hooks, system OAuth applications, templates and more. It has the ability to integrate tons of tools such as Slack, Hipchat, LDAP, JIRA, Jenkins, many types of hooks and a complete API. It has the minimum requirement of 2 GB RAM and 2 Cores CPU to run smoothly up to 500 users but also can be scaled to multiple active servers. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you !

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-gitlab-on-ubuntu-fedora-debian/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://about.gitlab.com/
[2]:https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs
[3]:https://packages.gitlab.com/gitlab/gitlab-ce?filter=debs
[4]:https://packages.gitlab.com/gitlab/gitlab-ce?filter=rpms
