每日 Ubuntu 小技巧 : Ubuntu 中安装 NetBeans IDE 8.0
================================================================================
NetBeans 8.0 刚刚发布，如果你还没有安装的话，这篇简短的教程将会演示如何在 Ubuntu 系统上快速的安装。对安装 NetBeans 需要帮助的开发者来说，这往篇文章会是不错的指导。

给那些还不知道 NetBeans 的解释下，NetBeans 是一款 IDE 应用软件工具，用户可以快速、高效的开发和构建桌面应用程序、移动应用程序及网页应用程序。

它是免费及和开源的产品，并且由很多用户及开发者所组成的一个巨大社区所支持。

在发布的版本 8 里面增加的一些功能是：对 JDK 8 编辑器和工具增强功能的支持、Tomcat 8.0 的支持、CDI 增强功能集成、一个新的 Maven 图形布局切换器、一个支持和创造 JQuery 控件和插件的编辑器、HTML 5 及 PHP 5.5 的支持。

关于此发布版本更多细节，[请查看它的发布主页][1]。

下载和安装 NetBeans IDE 有两种主要的方式。一种是下载包含 JDK8 和 NetBeans 的一个包文件。这种组合使得运行在 Java 平台的应用程序可扩展性很强。

[从这儿下载][2]，可获得此包。

另外一种获得 NetBeans 的方法就是直接从它的官方下载页面来下载和安装。这种方式，可以有选择性的下载包含有像 NetBeans 平台 SDK、Java FX、Java EE、Java ME、HTML5、C/C++、Groovy、PHP 和 Apache 的 Tomcat 8.0 等组件的完全包。

有五个可选的下载包，选择您想要的一个，然后点击下按钮。

要获得这些包，请浏览[ NetBeans 下载页面][3]。

### 安装 NetBeans 前安装 Java JDK ###

在安装 NetBeans 前，必须要安装 Java JDK。没有 JDK，NetBeans 是安装不上的。关于怎么安装 Java JDK 的知识，可以读读 [这篇文章][4]。

安装了 Java JDK 后，继续下面的 NetBeans 安装。

如果您选择的是 Oracle 公司的版本的话，JDK 已经集成在下载包文件中了，您需要做的就是运行可执行文件把 JDK 和 NetBeans 都安装上。

下载好您需要的安装包后，运行如下的命令，使安装包变为可执行状态。

    chmod +x ~/Downloads/netbeans-8.0-linux*.sh

上面的命令是假设这个文件已经下载到您的 Ubuntu 系统的下载目录中了。

下一步，运行如下命令来开始安装。

    sh -c " ~/Downloads/netbeans-8.0-linux*.sh"

根据安装向导操作，直到安装完成。

![netbeans-ubuntu](http://www.liberiangeek.net/wp-content/uploads/2014/03/netbeansubuntu.png)

祝你顺利~

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/03/daily-ubuntu-tips-install-netbeans-ide-8-0-in-ubuntu/

译者：[runningwater](https://github.com/runningwater) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://netbeans.org/community/releases/80/index.html
[2]:http://www.oracle.com/technetwork/java/javase/downloads/jdk-netbeans-jsp-142931.html
[3]:https://netbeans.org/downloads/
[4]:http://www.liberiangeek.net/2013/10/netbeans-ide-7-4-released-heres-install-ubuntu/