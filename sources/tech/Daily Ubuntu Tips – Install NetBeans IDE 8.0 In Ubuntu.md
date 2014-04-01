日常 Ubuntu 小技巧 - Ubuntu 中安装 NetBeans IDE 8.0
================================================================================
NetBeans 8.0 刚刚发布，如果你还没有安装的话，这篇简短的教程将会演示如何在 Ubuntu 系统上快速的安装。对安装 NetBeans 需要帮助的开发者来说，这往篇文章会是不错的指导。

给那些还不知道 NetBeans 的解释下，NetBeans 是一款 IDE 应用软件工具，用户可以快速、高效的开发和构建桌面应用程序、移动应用程序及网页应用程序。

它是免费及和开源的产品，并且由很多用户及开发者所组成的一个巨大社区所支持。

在发布的版本 8 里面增加的一些功能是：对 JDK 8 编辑器和工具增强功能的支持、Tomcat 8.0 的支持、CDI 增强功能集成、一个新的 Maven 图形布局切换器、一个支持和创造 JQuery 控件和插件的编辑器、HTML 5 及 PHP 5.5 的支持。

关于此发布版本更多细节，[请查看它的发布主页][1]。

There are two primary ways to download and install NetBeans IDE. One is downloading a package file that combines JDK 8 and NetBeans. This combination allows for the development of applications on the Java platform.

To get this package, [download it from here][2].

Another way to get NetBeans is go download and install it directly from its download page. There, you have the option to download the complete package which contains, NetBeans Platform SDK, Java SE, Java FX, Java EE, Java ME, HTML5, C/C++, Groovy, PHP and Apache Tomcat 8.0.

There are five options of the package to download. Choose the package you wish to download and click the Download button.

To get these packages, visit [NetBeans download page][3].

### Install Java JDK first before installing NetBeans ###

Before you can install NetBeans, you must first install Java JDK. Without it, NetBeans won’t install. To lean how to install Java  JDK, read [this post][4].

After installing Java JDK, continue below to install NetBeans.

If you chose the Oracle version, then JDK is already packaged into the file. All you have to do is run the executable to install both JDK and NetBeans.

Once you’ve downloaded the package you want, run the commands below to make the package executable.

    chmod +x ~/Downloads/netbeans-8.0-linux*.sh

the commands above assume that the file was downloaded in your Downloads folder in Ubuntu

Next, run the commands below to begin the installation.

    sh -c " ~/Downloads/netbeans-8.0-linux*.sh"

Follow the wizard until the installation is complete.

![netbeans-ubuntu](http://www.liberiangeek.net/wp-content/uploads/2014/03/netbeansubuntu.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/03/daily-ubuntu-tips-install-netbeans-ide-8-0-in-ubuntu/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://netbeans.org/community/releases/80/index.html
[2]:http://www.oracle.com/technetwork/java/javase/downloads/jdk-netbeans-jsp-142931.html
[3]:https://netbeans.org/downloads/
[4]:http://www.liberiangeek.net/2013/10/netbeans-ide-7-4-released-heres-install-ubuntu/