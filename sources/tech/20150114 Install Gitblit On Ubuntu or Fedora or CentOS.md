Translating-----geekpi

Install Gitblit On Ubuntu / Fedora / CentOS
================================================================================
**Git** is a distributed revision control system with an emphasis on speed, data integrity, and support for distributed, non-linear workflows. Git was initially designed and developed by Linus Torvalds for Linux kernel development in 2005, and has since become the most widely adopted version control system for software development.

As with most other distributed revision control systems, and unlike most client–server systems, every Git working directory is a full-fledged repository with complete history and full version-tracking capabilities, independent of network access or a central server. Like the Linux kernel, Git is free software distributed under the terms of the GNU General Public License version 2.

In this tutorial let me show you how to install gitblit server. The recent stable release of gitblit is 1.6.2. [Gitblit][1] is an open-source, pure Java stack for managing, viewing, and serving [Git][2] repositories. It’s designed primarily as a tool for small workgroups who want to host centralized repositories.

    mkdir -p /opt/gitblit; cd /opt/gitblit; wget http://dl.bintray.com/gitblit/releases/gitblit-1.6.2.tar.gz

### List the directory: ###

    root@vps124229 [/opt/gitblit]# ls
    ./                      docs/                 gitblit-stop.sh*            LICENSE              service-ubuntu.sh*
    ../                     ext/                  install-service-centos.sh*  migrate-tickets.sh*
    add-indexed-branch.sh*  gitblit-1.6.2.tar.gz  install-service-fedora.sh*  NOTICE
    authority.sh*           gitblit.jar           install-service-ubuntu.sh*  reindex-tickets.sh*
    data/                   gitblit.sh*           java-proxy-config.sh*       service-centos.sh*
    
The default configurations in this file data/gitblit.properties you can change it to your need.
    
### Start gitblit server with: ###

### Via service: ###

    root@vps124229 [/opt/gitblit]# cp service-centos.sh /etc/init.d/gitblit
    root@vps124229 [/opt/gitblit]# chkconfig --add gitblit
    root@vps124229 [/opt/gitblit]# service gitblit  start
    Starting gitblit server
    .

### Start it manually: ###

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

Open your browser to **http://localhost:8080** or **https://localhost:8443** depending on your chosen configuration. Enter the default administrator credentials: **admin / admin** and click the **Login** button.

![snapshot2](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/snapshot2.png)

### Add user: ###

![snapshot1](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/snapshot1.png)

Add repo:

![snapshot3](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/snapshot3.png)

### Create a new repository on the command-line: ###

    touch README.md
    git init
    git add README.md
    git commit -m "first commit"
    git remote add origin ssh://admin@142.4.202.70:29418/Programming.git
    git push -u origin master

### Push an existing repository from the command-line: ###

    git remote add origin ssh://admin@142.4.202.70:29418/Programming.git
    git push -u origin master

Done!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-gitblit-ubuntu-fedora-centos/

作者：[M.el Khamlichi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/pirat9/
[1]:http://gitblit.com/
[2]:http://git-scm.com/