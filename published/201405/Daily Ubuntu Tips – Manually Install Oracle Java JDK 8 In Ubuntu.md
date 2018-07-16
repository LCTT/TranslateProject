每日 Ubuntu 小技巧 - 在 Ubuntu 中手动安装 Oracle Java JDK 8
================================================================================
这篇简短的教程将会演示如何在 Ubuntu 系统中安装 Oracle 公司最新发布的 Java JDK 8。这里使用的方法是教你如何从下载页面下载安装包，然后不使用外部的 PPA 或者第三方源代码在 Ubuntu 中安装。

这种方法不需要依赖于第三方的源仓库。你只需要从 Oracle 的官方下载页直接下载，然后安装就行。

JDK 8 是一个重要的发行版本，也加入了最新的叫做 Lambda 表达式的新语言功能，此功能可以“把函数用作方法参数，或者代码块当作日期数据使用”。

这一个版本也发布了一个新的 java.util.stream 包类集合，提供了基于流的 API，用来支持函数式操作的功能。

关于此次发布版本的更多信息，请访问它的发布主页 @ [http://www.oracle.com/technetwork/java/javase/8-whats-new-2157071.html][1]

要下载和安装 Java JDK8，请访问[下载页][2]获得最新的发行版本。根据你机器的 Ubuntu 系统的情况可以选择下载 32 位或 64 位的发行版本。

这里是[下载页面][3]

在下载之前，您必须接受许可协议。

下载文件，保存。在 Ubuntu 系统中 Firefox 浏览器会默认保存到 **~/Downloads** 目录下。

![oracle-jdk8-ubuntu ](http://www.liberiangeek.net/wp-content/uploads/2014/03/oraclejdk8ubuntu.png)

第二步，打开终端运行如下命令来解压下载的文件。

    tar -xvf ~/Downloads/jdk-8-linux-x64.tar.gz

然后运行如下的命令，在 /usr/lib 目录中创建一个为保存 Java  JDK 8 文件的目录。

    sudo mkdir -p /usr/lib/jvm/jdk1.8.0/

接下来运行如下命令把解压的 JDK 文件内容都移动到创建的目录中。

    sudo mv jdk1.8.0/* /usr/lib/jvm/jdk1.8.0/

下一步，运行如下命令来配置 Java

    sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0/bin/java" 1

接下来，拷贝和粘贴下面这一行到终端执行，以启用 Javac 模块。

    sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0/bin/javac" 1

最后，拷贝和粘贴下面一行到终端以完成最终的安装。

    sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.8.0/bin/javaws" 1

要验证下 Java 是否已经完全安装的话，可以运行下面的命令来测试。

    java –version 

祝你玩的开心~

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/03/daily-ubuntu-tips-manually-install-oracle-java-jdk-8-in-ubuntu/

译者：[runningwater](https://github.com/runningwater) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.oracle.com/technetwork/java/javase/8-whats-new-2157071.html
[2]:http://www.oracle.com/technetwork/java/javase/downloads/index.html
[3]:http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
