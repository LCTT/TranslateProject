在Ubuntu/Fedora/CentOS中安装Gitblit
================================================================================
**Git**是一款注重速度、数据完整性、分布式支持和非线性工作流的分布式版本控制工具。Git最初由Linus Torvalds在2005年为Linux内核开发而设计，如今已经成为被广泛接受的版本控制系统。

和其他大多数分布式版本控制系统比起来，不像大多数客户端-服务端的系统，每个Git工作目录是一个完整的仓库，带有完整的历史记录和完整的版本跟踪能力，不需要依赖网络或者中心服务器。像Linux内核一样，Git也是在GPLv2许可证下分发的自由软件。

本篇教程我会演示如何安装 gitlit 服务器。gitlit的最新稳定版是1.6.2。[Gitblit][1]是一款开源、纯Java开发的用于管理、浏览和提供[Git][2]仓库服务的软件。它被设计成一款为希望托管中心仓库的小型工作组服务的工具。

    mkdir -p /opt/gitblit; cd /opt/gitblit; wget http://dl.bintray.com/gitblit/releases/gitblit-1.6.2.tar.gz

### 列出解压后目录内容： ###

    root@vps124229 [/opt/gitblit]# ls
    ./                      docs/                 gitblit-stop.sh*            LICENSE              service-ubuntu.sh*
    ../                     ext/                  install-service-centos.sh*  migrate-tickets.sh*
    add-indexed-branch.sh*  gitblit-1.6.2.tar.gz  install-service-fedora.sh*  NOTICE
    authority.sh*           gitblit.jar           install-service-ubuntu.sh*  reindex-tickets.sh*
    data/                   gitblit.sh*           java-proxy-config.sh*       service-centos.sh*
    
默认配置文件在data/gitblit.properties，你可以根据需要自己修改。
    
### 启动gitlit服务： ###

**通过service命令：**

    root@vps124229 [/opt/gitblit]# cp service-centos.sh /etc/init.d/gitblit
    root@vps124229 [/opt/gitblit]# chkconfig --add gitblit
    root@vps124229 [/opt/gitblit]# service gitblit  start
    Starting gitblit server
    .

**手动启动：**

    root@vps124229 [/opt/gitblit]# java -jar gitblit.jar --baseFolder data
    2015-01-10 09:16:53 [INFO ] *****************************************************************
    2015-01-10 09:16:53 [INFO ]             _____  _  _    _      _  _  _
    2015-01-10 09:16:53 [INFO ]            |  __ \(_)| |  | |    | |(_)| |
    2015-01-10 09:16:53 [INFO ]            | |  \/ _ | |_ | |__  | | _ | |_
    2015-01-10 09:16:53 [INFO ]            | | __ | || __|| '_ \ | || || __|
    2015-01-10 09:16:53 [INFO ]            | |_\ \| || |_ | |_) || || || |_
    2015-01-10 09:16:53 [INFO ]             \____/|_| \__||_.__/ |_||_| \__|
    2015-01-10 09:16:53 [INFO ]                          Gitblit v1.6.2
    2015-01-10 09:16:53 [INFO ] 
    2015-01-10 09:16:53 [INFO ] *****************************************************************
    2015-01-10 09:16:53 [INFO ] Running on Linux (3.8.13-xxxx-grs-ipv6-64-vps)
    2015-01-10 09:16:53 [INFO ] Logging initialized @842ms
    2015-01-10 09:16:54 [INFO ] Using JCE Unlimited Strength Jurisdiction Policy files
    2015-01-10 09:16:54 [INFO ] Setting up HTTPS transport on port 8443
    2015-01-10 09:16:54 [INFO ]    certificate alias = localhost
    2015-01-10 09:16:54 [INFO ]    keyStorePath   = /opt/gitblit/data/serverKeyStore.jks
    2015-01-10 09:16:54 [INFO ]    trustStorePath = /opt/gitblit/data/serverTrustStore.jks
    2015-01-10 09:16:54 [INFO ]    crlPath        = /opt/gitblit/data/certs/caRevocationList.crl
    2015-01-10 09:16:54 [INFO ] Shutdown Monitor listening on port 8081
    2015-01-10 09:16:54 [INFO ] jetty-9.2.3.v20140905
    2015-01-10 09:16:55 [INFO ] NO JSP Support for /, did not find org.apache.jasper.servlet.JspServlet
    2015-01-10 09:16:55 [INFO ] 
    2015-01-10 09:16:55 [INFO ] ----[com.gitblit.manager.IRuntimeManager]----
    2015-01-10 09:16:55 [INFO ] Basefolder  : /opt/gitblit/data
    2015-01-10 09:16:55 [INFO ] Settings    : /opt/gitblit/data/gitblit.properties
    2015-01-10 09:16:55 [INFO ] JVM timezone: America/Montreal (EST -0500)
    2015-01-10 09:16:55 [INFO ] App timezone: America/Montreal (EST -0500)
    2015-01-10 09:16:55 [INFO ] JVM locale  : en_US
    2015-01-10 09:16:55 [INFO ] App locale  : <client>
    2015-01-10 09:16:55 [INFO ] PF4J runtime mode is 'deployment'
    2015-01-10 09:16:55 [INFO ] Enabled plugins: []
    2015-01-10 09:16:55 [INFO ] Disabled plugins: []
    2015-01-10 09:16:55 [INFO ] 
    2015-01-10 09:16:55 [INFO ] ----[com.gitblit.manager.INotificationManager]----
    2015-01-10 09:16:55 [WARN ] Mail service disabled.
    2015-01-10 09:16:55 [INFO ] 
    2015-01-10 09:16:55 [INFO ] ----[com.gitblit.manager.IUserManager]----
    2015-01-10 09:16:55 [INFO ] ConfigUserService(/opt/gitblit/data/users.conf)
    2015-01-10 09:16:55 [INFO ] 
    2015-01-10 09:16:55 [INFO ] ----[com.gitblit.manager.IAuthenticationManager]----
    2015-01-10 09:16:55 [INFO ] External authentication disabled.
    2015-01-10 09:16:55 [INFO ] 
    2015-01-10 09:16:55 [INFO ] ----    [com.gitblit.transport.ssh.IPublicKeyManager]----
    2015-01-10 09:16:55 [INFO ] FileKeyManager (/opt/gitblit/data/ssh)
    2015-01-10 09:16:55 [INFO ] 
    2015-01-10 09:16:55 [INFO ] ----[com.gitblit.manager.IRepositoryManager]----
    2015-01-10 09:16:55 [INFO ] Repositories folder : /opt/gitblit/data/git
    2015-01-10 09:16:55 [INFO ] Identifying repositories...
    2015-01-10 09:16:55 [INFO ] 0 repositories identified with calculated folder sizes in 11 msecs
    2015-01-10 09:16:55 [INFO ] Lucene will process indexed branches every 2 minutes.
    2015-01-10 09:16:55 [INFO ] Garbage Collector (GC) is disabled.
    2015-01-10 09:16:55 [INFO ] Mirror service is disabled.
    2015-01-10 09:16:55 [INFO ] Alias UTF-9 & UTF-18 encodings as UTF-8 in JGit
    2015-01-10 09:16:55 [INFO ] Preparing 14 day commit cache. please wait...
    2015-01-10 09:16:55 [INFO ] 0 repositories identified with calculated folder sizes in 0 msecs
    2015-01-10 09:16:55 [INFO ] built 14 day commit cache of 0 commits across 0 repositories in 2 msecs
    2015-01-10 09:16:55 [INFO ] 
    2015-01-10 09:16:55 [INFO ] ----[com.gitblit.manager.IProjectManager]----
    2015-01-10 09:16:55 [INFO ] 
    2015-01-10 09:16:55 [INFO ] ----[com.gitblit.manager.IFederationManager]----
    2015-01-10 09:16:55 [INFO ] 
    2015-01-10 09:16:55 [INFO ] ----[com.gitblit.manager.IGitblit]----
    2015-01-10 09:16:55 [INFO ] Starting services manager...
    2015-01-10 09:16:55 [INFO ] Federation passphrase is blank! This server can not be PULLED from.
    2015-01-10 09:16:55 [INFO ] Fanout PubSub service is disabled.
    2015-01-10 09:16:55 [INFO ] Git Daemon is listening on 0.0.0.0:9418
    2015-01-10 09:16:55 [INFO ] SSH Daemon (NIO2) is listening on 0.0.0.0:29418
    2015-01-10 09:16:55 [WARN ] No ticket service configured.
    2015-01-10 09:16:55 [INFO ] 
    2015-01-10 09:16:55 [INFO ] ----[com.gitblit.manager.IPluginManager]----
    2015-01-10 09:16:55 [INFO ] No plugins
    2015-01-10 09:16:55 [INFO ] 
    2015-01-10 09:16:55 [INFO ] All managers started.

打开浏览器，依据你的配置进入**http://localhost:8080** 或者 **https://localhost:8443**。 输入默认的管理员授权：**admin / admin** 并点击**Login** 按钮

![snapshot2](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/snapshot2.png)

### 添加用户： ###

![snapshot1](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/snapshot1.png)

###添加仓库：###

![snapshot3](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/snapshot3.png)

### 用命令行创建新的仓库： ###

    touch README.md
    git init
    git add README.md
    git commit -m "first commit"
    git remote add origin ssh://admin@142.4.202.70:29418/Programming.git
    git push -u origin master

### 从命令行推送已有的仓库： ###

    git remote add origin ssh://admin@142.4.202.70:29418/Programming.git
    git push -u origin master

完成！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-gitblit-ubuntu-fedora-centos/

作者：[M.el Khamlichi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/pirat9/
[1]:http://gitblit.com/
[2]:http://git-scm.com/