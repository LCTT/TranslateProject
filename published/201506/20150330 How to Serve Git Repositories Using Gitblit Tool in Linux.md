如何在Linux下使用Gitblit工具创建Git仓库服务
================================================================================
嗨！朋友，今天我们将学习如何在你的Linux服务器或者PC上安装Gitblit工具。首先，我们看看什么是Git，它的功能以及安装Gitblit的步骤。[Git是分布式版本控制系统][1]，它强调速度、数据一致性，并且支持分布式、非线性工作流。它最初由Linus Torvalds在2005年为Linux内核设计和开发，使用GPLv2证书，并从此成为软件开发中使用最广泛的版本控制系统。

[Gitblit是完全开源的软件][2]，它基于纯粹的Java堆栈，被设计以在Git仓库速度和效率方面胜任从小型到极大型的项目。它很容易学习和上手，并有着闪电般的性能。它在很多方面远胜 Subversion、CVS、Perforce和ClearCase等SCM（版本控制）工具，比如，如快速本地分支、易于暂存、多工作流等。

#### Gitblit的功能 ####

- 它可以做为一个哑仓库视图，没有管理控制以及用户账户。
- 它可以做为完整的Git服务，拥有克隆、推送和仓库访问控制。
- 它能独立于其他Git工具使用（包括实际的Git），它能和您已有的工具协作。

### 1.创建Gitblit安装目录 ###

首先我们将在我们的服务器上建立一个目录，并在该目录下安装最新的Gitblit。

    $ sudo mkdir -p /opt/gitblit

    $ cd /opt/gitblit

![创建gitblit目录](http://blog.linoxide.com/wp-content/uploads/2015/01/creating-directory-gitblit.png)

### 2. 下载并解压 ###

现在，我们将从Gitblit官方站点下载最新版的Gitblit。这里我们将安装1.6.2版本。所以，请在安装时根据具体的版本对命令进行修改。

    $ sudo wget http://dl.bintray.com/gitblit/releases/gitblit-1.6.2.tar.gz

![下载gitblit安装包](http://blog.linoxide.com/wp-content/uploads/2015/01/downloading-gitblit.png)

接下来，我们将下载到的tar压缩包解压至之前创建的目录 /opt/gitblit/

    $ sudo tar -zxvf gitblit-1.6.2.tar.gz

![解压gitblit压缩包](http://blog.linoxide.com/wp-content/uploads/2015/01/extracting-gitblit-tar.png)

### 3.配置并运行 ###

现在，我们将对Gitblit进行配置。如果你想要定制Gitblit的行为，你可以修改`gitblit/data/gitblit.properties`。在完成配置后，我们将运行安装好的gitblit。有两种方式来运行gitblit，第一种是通过下面的命令手动运行：

    $ sudo java -jar gitblit.jar --baseFolder data

另一种是将gitblit添加为服务。下面是在linux下将gitblit添加为服务的步骤。

由于我在使用Ubuntu，下面的命令将是  sudo cp service-ubuntu.sh /etc/init.d/gitblit，所以请根据你的发行版修改文件名service-ubuntu.sh为相应的你运行的发行版。

    $ sudo ./install-service-ubuntu.sh

    $ sudo service gitblit  start

![启动gitblit服务](http://blog.linoxide.com/wp-content/uploads/2015/01/starting-gitblit-service.png)

在你的浏览器中打开`http://localhost:8080`或`https://localhost:8443`，也可以将localhost根据本地配置替换为IP地址。输入默认的管理员凭证：admin / admin并点击login按钮。

![gitblit欢迎页面](http://blog.linoxide.com/wp-content/uploads/2015/01/gitblit-welcome.png)

现在，我们将添加一个新的用户。首先，你需要以admin用户登录，username = **admin**，password = **admin**。

然后，点击用户图标 > users > (+) new user 来创建一个新用户，如下图所示。

![添加新用户](http://blog.linoxide.com/wp-content/uploads/2015/01/add-user.png)

现在，我们将创建一个开箱可用的仓库。点击 repositories > (+) new repository。然后，如下图所示添加新的仓库。

![添加新的仓库](http://blog.linoxide.com/wp-content/uploads/2015/01/add-new-repository.png)

#### 使用命令行创建一个新的仓库 ####

        touch README.md
        git init
        git add README.md
        git commit -m "first commit"
        git remote add origin ssh://arunlinoxide@localhost:29418/linoxide.com.git
        git push -u origin master

请将其中的用户名arunlinoxide替换为你添加的用户名。

#### 在命令行中push一个已存在的仓库 ####

        git remote add origin ssh://arunlinoxide@localhost:29418/linoxide.com.git
        git push -u origin master

**注意**：强烈建议所有人修改用户名“admin”的密码。

### 结论 ###

欢呼吧！我们已经在Linux电脑中安装好了最新版本的Gitblit。接下来我们便可以在我们的大小项目中享受这样一个优美的版本控制系统。有了Gitblit，版本控制便再容易不过了。它有易于学习、轻量级、高性能的特点。因此，如果你有任何的问题、建议和反馈，请在留言处留言。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/serve-git-repositories-gitblit/

作者：[Arun Pyasi][a]
译者：[wwy-hust](https://github.com/wwy-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://git-scm.com/
[2]:http://gitblit.com/