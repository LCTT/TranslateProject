如何在 linux 上配置持续集成服务 - Drone
==============================================================

如果你对一次又一次的克隆、构建、测试和部署代码感到厌倦了，可以考虑一下持续集成。持续集成简称 CI，是一种像我们一样的频繁提交的代码库，构建、测试和部署的软件工程实践。CI 可以帮助我们快速的集成新代码到已有的代码库。如果这个过程是自动化进行的，那么就会提高开发的速度，因为这可以减少开发人员手工构建和测试的时间。[Drone][1] 是一个自由开源项目，用来提供一个非常棒的持续集成服务的环境，采用 Apache 2.0 协议发布。它已经集成近很多代码库提供商，比如 Github、Bitbucket 以及 Google Code，它可以从代码库提取代码，使我们可以对包括 PHP, Node, Ruby, Go, Dart, Python, C/C++, JAVA 等等在内的各种语言编译构建。它是如此一个强大的平台，它使用了容器和 docker 技术，这让用户每次构建都可以在保证隔离的条件下完全控制他们自己的构建环境。

### 1. 安装 Docker ###

首先，我们要安装 docker，因为这是 Drone 的工作流的最关键的元素。Drone 合理的利用了 docker 来构建和测试应用。容器技术提高了应用部署的效率。要安装 docker ，我们需要在不同的 linux 发行版本运行下面对应的命令，我们这里会说明 Ubuntu 14.04 和 CentOS 7 两个版本。

#### Ubuntu ####

要在 Ubuntu 上安装 Docker ，我们只需要运行下面的命令。

    # apt-get update
    # apt-get install docker.io

安装之后我们需要使用`service` 命令重启 docker 引擎。

    # service docker restart

然后我们让 docker 在系统启动时自动启动。

    # update-rc.d docker defaults

    Adding system startup for /etc/init.d/docker ...
    /etc/rc0.d/K20docker -> ../init.d/docker
    /etc/rc1.d/K20docker -> ../init.d/docker
    /etc/rc6.d/K20docker -> ../init.d/docker
    /etc/rc2.d/S20docker -> ../init.d/docker
    /etc/rc3.d/S20docker -> ../init.d/docker
    /etc/rc4.d/S20docker -> ../init.d/docker
    /etc/rc5.d/S20docker -> ../init.d/docker

#### CentOS ####

第一，我们要更新机器上已经安装的软件包。我们可以使用下面的命令。

    #  sudo yum update

要在 centos 上安装 docker，我们可以简单的运行下面的命令。

    #  curl -sSL https://get.docker.com/ | sh

安装好 docker 引擎之后我么只需要简单使用下面的`systemd` 命令启动 docker，因为 centos 7 的默认初始化系统是 systemd。

    # systemctl start docker

然后我们要让 docker 在系统启动时自动启动。

    # systemctl enable docker

    ln -s '/usr/lib/systemd/system/docker.service' '/etc/systemd/system/multi-user.target.wants/docker.service'

### 2. 安装 SQlite 驱动 ###

Drone 默认使用 SQlite3 数据库服务器来保存数据和信息。它会在 /var/lib/drone/ 自动创建名为 drone.sqlite 的数据库来处理数据库模式的创建和迁移。要安装 SQlite3 我们要完成以下几步。

#### Ubuntu 14.04 ####

因为 SQlite3 存在于 Ubuntu 14.04 的默认软件库，我们只需要简单的使用 apt 命令安装它。

    # apt-get install libsqlite3-dev

#### CentOS 7 ####

要在 Centos 7 上安装需要使用下面的 yum 命令。

    # yum install sqlite-devel

### 3. 安装 Drone ###

最后，我们安装好依赖的软件，我们现在更进一步的接近安装 Drone。在这一步里我们只简单的从官方链接下载对应的二进制软件包，然后使用默认软件包管理器安装 Drone。

#### Ubuntu ####

我们将使用 wget 从官方的 [Debian 文件下载链接][2]下载 drone 的 debian 软件包。下面就是下载命令。

    # wget downloads.drone.io/master/drone.deb

    Resolving downloads.drone.io (downloads.drone.io)... 54.231.48.98
    Connecting to downloads.drone.io (downloads.drone.io)|54.231.48.98|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 7722384 (7.4M) [application/x-debian-package]
    Saving to: 'drone.deb'
    100%[======================================>] 7,722,384 1.38MB/s in 17s
    2015-11-06 14:09:28 (456 KB/s) - 'drone.deb' saved [7722384/7722384]

下载好之后，我们将使用 dpkg 软件包管理器安装它。

    # dpkg -i drone.deb

    Selecting previously unselected package drone.
    (Reading database ... 28077 files and directories currently installed.)
    Preparing to unpack drone.deb ...
    Unpacking drone (0.3.0-alpha-1442513246) ...
    Setting up drone (0.3.0-alpha-1442513246) ...
    Your system ubuntu 14: using upstart to control Drone
    drone start/running, process 9512

#### CentOS ####

在 CentOS 机器上我们要使用 wget 命令从[下载链接][3]下载 RPM 包。

    # wget downloads.drone.io/master/drone.rpm

    --2015-11-06 11:06:45-- http://downloads.drone.io/master/drone.rpm
    Resolving downloads.drone.io (downloads.drone.io)... 54.231.114.18
    Connecting to downloads.drone.io (downloads.drone.io)|54.231.114.18|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 7763311 (7.4M) [application/x-redhat-package-manager]
    Saving to: ‘drone.rpm’
    100%[======================================>] 7,763,311 1.18MB/s in 20s
    2015-11-06 11:07:06 (374 KB/s) - ‘drone.rpm’ saved [7763311/7763311]

然后我们使用 yum 安装 rpm 包。

    # yum localinstall drone.rpm

### 4. 配置端口 ###

安装完成之后，我们要先进行配置才能工作起来。drone 的配置文件在**/etc/drone/drone.toml** 。默认情况下 drone 的 web 接口使用的是80，而这也是 http 默认的端口，如果我们修改它，请按下面所示的修改配置文件里 server 块对应的值。

    [server]
    port=":80"

### 5. 集成 Github ###

为了运行 Drone 我们必须设置最少一个和 GitHub、GitHub 企业版，Gitlab，Gogs，Bitbucket 关联的集成点。在本文里我们只集成了 github，但是如果我们要集成其他的服务，我们可以在配置文件做修改。为了集成 github 我们需要在github 的设置里创建一个新的应用：https://github.com/settings/developers 。

![Registering App Github](http://blog.linoxide.com/wp-content/uploads/2015/11/registering-app-github.png)

要创建一个应用，我们需要在 `New Application` 页面点击 `Register`，然后如下所示填表。

![Registering OAuth app github](http://blog.linoxide.com/wp-content/uploads/2015/11/registering-OAuth-app-github.png)

我们应该保证在应用的配置项里设置了**授权回调链接**，链接看起来类似 `http://drone.linoxide.com/api/auth/github.com`。然后我们点击注册应用。所有都做好之后我们会看到我们需要在我们的 Drone 配置文件里配置的客户端 ID 和客户端密钥。

![Client ID and Secret Token](http://blog.linoxide.com/wp-content/uploads/2015/11/client-id-secret-token.png)

在这些都完成之后我们需要使用文本编辑器编辑 drone 配置文件，比如使用下面的命令。

    # nano /etc/drone/drone.toml

然后我们会在 drone 的配置文件里面找到`[github]` 部分，紧接着的是下面所示的配置内容

    [github]
    client="3dd44b969709c518603c"
    secret="4ee261abdb431bdc5e96b19cc3c498403853632a"
    # orgs=[]
    # open=false

![Configuring Github Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-github-drone-e1446835124465.png)

### 6. 配置 SMTP 服务器 ###

如果我们想让 drone 使用 email 发送通知，那么我们需要在 SMTP 配置里面设置我们的 SMTP 服务器。如果我们已经有了一个 SMTP 服务，那就只需要简单的使用它的配置文件就行了，但是因为我们没有一个 SMTP 服务器，我们需要安装一个 MTA 比如 Postfix，然后在 drone 配置文件里配置好 SMTP。

#### Ubuntu ####

在 ubuntu 里使用下面的 apt 命令安装 postfix。

    # apt-get install postfix

#### CentOS ####

在 CentOS 里使用下面的 yum 命令安装 postfix。

    # yum install postfix

安装好之后，我们需要编辑我们的 postfix 配置文件。

    # nano /etc/postfix/main.cf

然后我们要把 myhostname 的值替换为我们自己的 FQDN，比如 drone.linoxide.com。

    myhostname = drone.linoxide.com

现在开始配置 drone 配置文件里的 SMTP 部分。

    # nano /etc/drone/drone.toml

找到`[smtp]` 部分补充上下面的内容。

    [smtp]
    host = "drone.linoxide.com"
    port = "587"
    from = "root@drone.linoxide.com"
    user = "root"
    pass = "password"

![Configuring SMTP Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-smtp-drone.png)

注意：这里的 **user** 和 **pass** 参数强烈推荐一定要改成某个具体用户的配置。

### 7. 配置 Worker ###

如我们所知的 drone 利用了 docker 完成构建、测试任务，我们需要把 docker 配置为 drone 的 worker。要完成这些需要修改 drone 配置文件里的`[worker]` 部分。

    # nano /etc/drone/drone.toml

然后取消底下几行的注释并且补充上下面的内容。

    [worker]
    nodes=[
    "unix:///var/run/docker.sock",
    "unix:///var/run/docker.sock"
    ]

这里我们只设置了两个节点，这意味着上面的配置文件只能同时执行2 个构建操作。要提高并发性可以增大节点的值。

    [worker]
    nodes=[
    "unix:///var/run/docker.sock",
    "unix:///var/run/docker.sock",
    "unix:///var/run/docker.sock",
    "unix:///var/run/docker.sock"
    ]

使用上面的配置文件 drone 被配置为使用本地的 docker 守护程序可以同时构建4个任务。

### 8. 重启 Drone ###

最后，当所有的安装和配置都准备好之后，我们现在要在本地的 linux 机器上启动 drone 服务器。

####  Ubuntu ####

因为 ubuntu 14.04 使用了 sysvinit 作为默认的初始化系统，所以只需要简单执行下面的 service 命令就可以启动 drone 了。

    # service drone restart

要让 drone 在系统启动时也自动运行，需要运行下面的命令。

    # update-rc.d drone defaults

#### CentOS ####

因为 CentOS 7使用 systemd 作为初始化系统，所以只需要运行下面的 systemd 命令就可以重启 drone。

    # systemctl restart drone

要让 drone 自动运行只需要运行下面的命令。

    # systemctl enable drone

### 9. 添加防火墙例外规则 ###

众所周知 drone 默认使用了80 端口而我们又没有修改它，所以我们需要配置防火墙程序允许80 端口（http）开放并允许其他机器可以通过网络连接。

#### Ubuntu 14.04 ####

iptables 是最流行的防火墙程序，并且 ubuntu 默认安装了它。我们需要修改 iptable 以暴露端口80，这样我们才能让 drone 的 web 界面在网络上被大家访问。

    # iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
    # /etc/init.d/iptables save

#### CentOS 7 ####

因为 CentOS 7 默认安装了 systemd，它使用 firewalld 作为防火墙程序。为了在 firewalld 上打开80端口（http 服务），我们需要执行下面的命令。

    # firewall-cmd --permanent --add-service=http

    success

    # firewall-cmd --reload

    success

### 10. 访问 web 界面 ###

现在我们将在我们最喜欢的浏览器上通过 web 界面打开 drone。要完成这些我们要把浏览器指向运行 drone 的服务器。因为 drone 默认使用80 端口而我们有没有修改过，所以我们只需要在浏览器里根据我们的配置输入`http://ip-address/` 或 `http://drone.linoxide.com` 就行了。在我们正确的完成了上述操作后，我们就可以看到登录界面了。

![Login Github Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/login-github-drone-e1446834688394.png)

因为在上面的步骤里配置了 Github，我们现在只需要简单的选择 github 然后进入应用授权步骤，这些完成后我们就可以进入工作台了。

![Drone Dashboard](http://blog.linoxide.com/wp-content/uploads/2015/11/drone-dashboard.png)

这里它会同步我们在 github 上的代码库，然后询问我们要在 drone 上构建那个代码库。

![Activate Repository](http://blog.linoxide.com/wp-content/uploads/2015/11/activate-repository-e1446835574595.png)

这一步完成后，它会询问我们在代码库里添加`.drone.yml` 文件的新名称，并且在这个文件里定义构建的过程和配置项，比如使用那个 docker 镜像，执行那些命令和脚本来编译，等等。

我们按照下面的内容来配置我们的`.drone.yml`。

    image: python
    script:
     - python helloworld.py
     - echo "Build has been completed."

这一步完成后我们就可以使用 drone 应用里的 YAML 格式的配置文件来构建我们的应用了。所有对代码库的提交和改变此时都会同步到这个仓库。一旦提交完成了，drone 就会自动开始构建。

![Building Application Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/building-application-drone.png)

所有操作都完成后，我们就能在终端看到构建的结果了。

![Build Success Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/build-success-drone.png)

### 总结 ###

在本文中我们学习了如何安装一个可以工作的使用 drone 的持续集成平台。如果我们愿意我们甚至可以从 drone.io 官方提供的服务开始工作。我们可以根据自己的需求从免费的服务或者收费服务开始。它通过漂亮的 web 界面和强大的功能改变了持续集成的世界。它可以集成很多第三方应用和部署平台。如果你有任何问题、建议可以直接反馈给我们，谢谢。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-drone-continuous-integration-linux/

作者：[Arun Pyasi][a]
译者：[ezio](https://github.com/oska874)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://drone.io/
[2]:http://downloads.drone.io/master/drone.deb
[3]:http://downloads.drone.io/master/drone.rpm
[4]:https://github.com/settings/developers
