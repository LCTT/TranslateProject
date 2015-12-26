translating by Ezio

How to Setup Drone - a Continuous Integration Service in Linux
==============================================================

Are you tired of cloning, building, testing, and deploying codes time and again? If yes, switch to continuous integration. Continuous Integration aka CI is practice in software engineering of making frequent commits to the code base, building, testing and deploying as we go. CI helps to quickly integrate new codes into the existing code base. If this process is made automated, then this will speed up the development process as it reduces the time taken for the developer to build and test things manually. [Drone][1] is a free and open source project which provides an awesome environment of continuous integration service and is released under Apache License Version 2.0. It integrates with many repository providers like Github, Bitbucket and Google Code and has the ability to pull codes from the repositories enabling us to build the source code written in number of languages including PHP, Node, Ruby, Go, Dart, Python, C/C++, JAVA and more. It is made such a powerful platform cause it uses containers and docker technology for every build making users a complete control over their build environment with guaranteed isolation.

如果你对一次又一次的克隆、构建、测试和部署代码感到厌倦了，可以考虑一下持续集成。持续集成也就是CI，是软件工程的像我们一样的频繁提交的代码库，构建、测试和部署的实践。CI 帮助我们快速的集成新代码到已有的代码基线。如果这个过程是自动化进行的，那么就会提高开发的速度，因为这可以减少开发人员手工构建和测试的时间。[Drone][1] 是一个免费的开源项目，用来提供一个非常棒的持续集成服务的环境，采用了Apache 2.0 协议。它已经集成近很多代码库提供商，比如Github、Bitbucket 以及Google COde，并且它可以从代码库提取代码，使我们可以编译多种语言，包括PHP, Node, Ruby, Go, Dart, Python, C/C++, JAVA 等等。它是如此一个强大的平台是因为它每次构建都使用了容器和docker 技术，这让用户可以在保证隔离的条件下完全控制他们自己的构建环境。

### 1. 安装 Docker ###

First of all, we'll gonna install Docker as its the most vital element for the complete workflow of Drone. Drone does a proper utilization of docker for the purpose of building and testing application. This container technology speeds up the development of the applications. To install docker, we'll need to run the following commands with respective the distribution of linux. In this tutorial, we'll cover the steps with Ubuntu 14.04 and CentOS 7 linux distributions.

首先，我们要安装docker，因为这是Drone 的工作流的最关键的元素。Drone 合理的利用了docker 来构建和测试应用。容器技术提高了应用部署的效率。要安装docker ，我们需要在不同的linux 发行版本运行下面对应的命令，我们这里会说明Ubuntu 14.04 和CentOS 7 两个版本。

#### Ubuntu ####

To install Docker in Ubuntu, we can simply run the following commands in a terminal or console.

要在Ubuntu 上安装Docker ，我们只需要运行下面的命令。

    # apt-get update
    # apt-get install docker.io

After the installation is done, we'll restart our docker engine using service command.

安装之后我们需要使用`service` 命令重启docker 引擎。

    # service docker restart

Then, we'll make docker start automatically in every system boot.

然后我们让docker 在系统启动时自动启动。

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

First, we'll gonna update every packages installed in our centos machine. We can do that by running the following command.

第一，我们要更新机器上已经安装的软件包。我们可以使用下面的命令。

    #  sudo yum update

To install docker in centos, we can simply run the following commands.

要在centos 上安装docker，我们可以简单的运行下面的命令。

    #  curl -sSL https://get.docker.com/ | sh

After our docker engine is installed in our centos machine, we'll simply start it by running the following systemd command as systemd is the default init system in centos 7.

安装好docker 引擎之后我么只需要简单实用下面的`systemd` 命令启动docker，因为centos 7 的默认init 系统是systemd。

    # systemctl start docker

Then, we'll enable docker to start automatically in every system startup.

然后我们要让docker 在系统启动时自动启动。

    # systemctl enable docker

    ln -s '/usr/lib/systemd/system/docker.service' '/etc/systemd/system/multi-user.target.wants/docker.service'

### 2. 安装 SQlite 驱动 ###

It uses SQlite3 database server for storing its data and information by default. It will automatically create a database file named drone.sqlite under /var/lib/drone/ which will handle database schema setup and migration. To setup SQlite3 drivers, we'll need to follow the below steps.

Drone 默认使用SQLite3 数据库服务器来保存数据和信息。它会在/var/lib/drone/ 自动创建名为drone.sqlite 的数据库来处理数据库模式的创建和迁移。要安装SQLite3 我们要完成以下几步。

#### Ubuntu 14.04 ####

As SQlite3 is available on the default respository of Ubuntu 14.04, we'll simply install it by running the following apt command.

因为SQLite3 存在于Ubuntu 14.04 的默认软件库，我们只需要简单的使用apt 命令安装它。

    # apt-get install libsqlite3-dev

#### CentOS 7 ####

To install it on CentOS 7 machine, we'll need to run the following yum command.

要在Centos 7 上安装选哟使用下面的yum 命令。

    # yum install sqlite-devel

### 3. 安装 Drone ###

Finally, after we have installed those dependencies successfully, we'll now go further towards the installation of drone in our machine. In this step, we'll simply download the binary package of it from the official download link of the respective binary formats and then install them using the default package manager.

最后，我们安装好依赖的软件，我们现在更进一步的接近安装Drone。在这一步里我们值简单的从官方链接下载对应的二进制软件包，然后使用默认软件包管理器安装Drone。

#### Ubuntu ####

We'll use wget to download the debian package of drone for ubuntu from the [official Debian file download link][2]. Here is the command to download the required debian package of drone.

我们将使用wget 从官方的[Debian 文件下载链接][2]下载drone 的debian 软件包。下面就是下载命令。

    # wget downloads.drone.io/master/drone.deb

    Resolving downloads.drone.io (downloads.drone.io)... 54.231.48.98
    Connecting to downloads.drone.io (downloads.drone.io)|54.231.48.98|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 7722384 (7.4M) [application/x-debian-package]
    Saving to: 'drone.deb'
    100%[======================================>] 7,722,384 1.38MB/s in 17s
    2015-11-06 14:09:28 (456 KB/s) - 'drone.deb' saved [7722384/7722384]

After its downloaded, we'll gonna install it with dpkg package manager.

下载好之后，我们将使用dpkg 软件包管理器安装它。

    # dpkg -i drone.deb

    Selecting previously unselected package drone.
    (Reading database ... 28077 files and directories currently installed.)
    Preparing to unpack drone.deb ...
    Unpacking drone (0.3.0-alpha-1442513246) ...
    Setting up drone (0.3.0-alpha-1442513246) ...
    Your system ubuntu 14: using upstart to control Drone
    drone start/running, process 9512

#### CentOS ####

In the machine running CentOS, we'll download the RPM package from the [official download link for RPM][3] using wget command as shown below.

在CentOS 机器上我们要使用wget 命令从[下载链接][3]下载RPM 包。

    # wget downloads.drone.io/master/drone.rpm

    --2015-11-06 11:06:45-- http://downloads.drone.io/master/drone.rpm
    Resolving downloads.drone.io (downloads.drone.io)... 54.231.114.18
    Connecting to downloads.drone.io (downloads.drone.io)|54.231.114.18|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 7763311 (7.4M) [application/x-redhat-package-manager]
    Saving to: ‘drone.rpm’
    100%[======================================>] 7,763,311 1.18MB/s in 20s
    2015-11-06 11:07:06 (374 KB/s) - ‘drone.rpm’ saved [7763311/7763311]

Then, we'll install the download rpm package using yum package manager.

然后我们使用yum 安装rpm 包。

    # yum localinstall drone.rpm

### 4. 配置端口 ###

After the installation is completed, we'll gonna configure drone to make it workable. The configuration of drone is inside **/etc/drone/drone.toml** file. By default, drone web interface is exposed under port 80 which is the default port of http, if we wanna change it, we can change it by replacing the value under server block as shown below.

安装完成之后，我们要使它工作要先进行配置。drone 的配置文件在**/etc/drone/drone.toml** 。默认情况下drone 的web 接口使用的是80，而这也是http 默认的端口，如果我们要下面所示的修改配置文件里server 块对应的值。

    [server]
    port=":80"

### 5. 集成 Github ###

In order to run Drone we must setup at least one integration points between GitHub, GitHub Enterprise, Gitlab, Gogs, Bitbucket. In this tutorial, we'll only integrate github but if we wanna integrate other we can do that from the configuration file. In order to integrate github, we'll need to create a new application in our [github settings][4].



![Registering App Github](http://blog.linoxide.com/wp-content/uploads/2015/11/registering-app-github.png)

To create, we'll need to click on Register a New Application then fill out the form as shown in the following image.

![Registering OAuth app github](http://blog.linoxide.com/wp-content/uploads/2015/11/registering-OAuth-app-github.png)

We should make sure that **Authorization callback URL** looks like http://drone.linoxide.com/api/auth/github.com under the configuration of the application. Then, we'll click on Register application. After done, we'll note the Client ID and Client Secret key as we'll need to configure it in our drone configuration.

![Client ID and Secret Token](http://blog.linoxide.com/wp-content/uploads/2015/11/client-id-secret-token.png)

After thats done, we'll need to edit our drone configuration using a text editor by running the following command.

    # nano /etc/drone/drone.toml

Then, we'll find the [github] section and append the section with the above noted configuration as shown below.

    [github]
    client="3dd44b969709c518603c"
    secret="4ee261abdb431bdc5e96b19cc3c498403853632a"
    # orgs=[]
    # open=false

![Configuring Github Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-github-drone-e1446835124465.png)

### 6. Configuring SMTP server ###

If we wanna enable drone to send notifications via emails, then we'll need to specify the SMTP configuration of our SMTP server. If we already have an SMTP server, we can use its configuration but as we don't have an SMTP server, we'll need to install an MTA ie Postfix and then specify the SMTP configuration in the drone configuration.

#### On Ubuntu ####

We can install postfix in ubuntu by running the following apt command.

    # apt-get install postfix

#### On CentOS ####

We can install postfix in CentOS by running the following yum command.

    # yum install postfix

After installing, we'll need to edit the configuration of our postfix configuration using a text editor.

    # nano /etc/postfix/main.cf

Then, we'll need to replace the value of myhostname parameter to our FQDN ie drone.linoxide.com .

    myhostname = drone.linoxide.com

Now, we'll gonna finally configure the SMTP section of our drone configuration file.

    # nano /etc/drone/drone.toml

Then, we'll find the [stmp] section and then we'll need to append the setting as follows.

    [smtp]
    host = "drone.linoxide.com"
    port = "587"
    from = "root@drone.linoxide.com"
    user = "root"
    pass = "password"

![Configuring SMTP Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-smtp-drone.png)

Note: Here, **user** and **pass** parameters are strongly recommended to be changed according to one's user configuration.

### 7. Configuring Worker ###

As we know that drone utilizes docker for its building and testing task, we'll need to configure docker as the worker for our drone. To do so, we'll need to edit the [worker] section in the drone configuration file.

    # nano /etc/drone/drone.toml

Then, we'll uncomment the following lines and append as shown below.

    [worker]
    nodes=[
    "unix:///var/run/docker.sock",
    "unix:///var/run/docker.sock"
    ]

Here, we have set only 2 node which means the above configuration is capable of executing only 2 build at a time. In order to increase concurrency, we can increase the number of nodes.

    [worker]
    nodes=[
    "unix:///var/run/docker.sock",
    "unix:///var/run/docker.sock",
    "unix:///var/run/docker.sock",
    "unix:///var/run/docker.sock"
    ]

Here, in the above configuration, drone is configured to process four builds at a time, using the local docker daemon.

### 8. Restarting Drone ###

Finally, after everything is done regarding the installation and configuration, we'll now start our drone server in our linux machine.

#### On Ubuntu ####

To start drone in our Ubuntu 14.04 machine, we'll simply run service command as the default init system of Ubuntu 14.04 is SysVinit.

    # service drone restart

To make drone start automatically in every boot of the system, we'll run the following command.

    # update-rc.d drone defaults

#### On CentOS ####

To start drone in CentOS machine, we'll simply run systemd command as CentOS 7 is shipped with systemd as init system.

    # systemctl restart drone

Then, we'll enable drone to start automatically in every system boot.

    # systemctl enable drone

### 9. Allowing Firewalls ###

As we know drone utilizes port 80 by default and we haven't changed the port, we'll gonna configure our firewall programs to allow port 80 (http) and be accessible from other machines in the network.

#### On Ubuntu 14.04 ####

Iptables is a popular firewall program which is installed in the ubuntu distributions by default. We'll make iptables to expose port 80 so that we can make our Drone web interface accessible in the network.

    # iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
    # /etc/init.d/iptables save

#### On CentOS 7 ####

As CentOS 7 has systemd installed by default, it contains firewalld running as firewall problem. In order to open the port 80 (http service) on firewalld, we'll need to execute the following commands.

    # firewall-cmd --permanent --add-service=http

    success

    # firewall-cmd --reload

    success

### 10. Accessing Web Interface ###

Now, we'll gonna open the web interface of drone using our favourite web browser. To do so, we'll need to point our web browser to our machine running drone in it. As the default port of drone is 80 and we have also set 80 in this tutorial, we'll simply point our browser to http://ip-address/ or http://drone.linoxide.com according to our configuration. After we have done that correctly, we'll see the first page of it having options to login into our dashboard.

![Login Github Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/login-github-drone-e1446834688394.png)

As we have configured Github in the above step, we'll simply select github and we'll go through the app authentication process and after its done, we'll be forwarded to our Dashboard.

![Drone Dashboard](http://blog.linoxide.com/wp-content/uploads/2015/11/drone-dashboard.png)

Here, it will synchronize all our github repository and will ask us to activate the repo which we want to build with drone.

![Activate Repository](http://blog.linoxide.com/wp-content/uploads/2015/11/activate-repository-e1446835574595.png)

After its activated, it will ask us to add a new file named .drone.yml in our repository and define the build process and configuration in that file like which image to fetch and which command/script to run while compiling, etc.

We'll need to configure our .drone.yml as shown below.

    image: python
    script:
     - python helloworld.py
     - echo "Build has been completed."

After its done, we'll be able to build our application using the configuration YAML file .drone.yml in our drone appliation. All the commits made into the repository is synced in realtime. It automatically syncs the commit and changes made to the repository. Once the commit is made in the repository, build is automatically started in our drone application.

![Building Application Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/building-application-drone.png)

After the build is completed, we'll be able to see the output of the build with the output console.

![Build Success Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/build-success-drone.png)

### Conclusion ###

In this article, we learned to completely setup a workable Continuous Intergration platform with Drone. If we want, we can even get started with the services provided by the official Drone.io project. We can start with free service or paid service according to our requirements. It has changed the world of Continuous integration with its beautiful web interface and powerful bunches of features. It has the ability to integrate with many third party applications and deployment platforms. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you !

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-drone-continuous-integration-linux/

作者：[Arun Pyasi][a]
译者：[ezio](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://drone.io/
[2]:http://downloads.drone.io/master/drone.deb
[3]:http://downloads.drone.io/master/drone.rpm
[4]:https://github.com/settings/developers
