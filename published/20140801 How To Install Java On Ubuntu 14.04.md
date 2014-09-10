怎样在Ubuntu 14.04中安装Java
=====================================================================================================

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Install_Java_Ubuntu_Linux_Mint.jpeg)

想知道**如何在Ubuntu 14.04中安装Java**？安装Java肯定是[安装Ubuntu 14.04后首先要做的几件事情之一](1)，而且这也很简单。

许多人比较厌恶Java，但是很有可能因为某些原因你需要安装Java，尽管你很讨厌它。在这篇文章中，我们将展示如何在Ubuntu 14.04安装Java（也可能在Linux Mint 17同样适用）。

### JRE vs OpenJDK vs Oracle JDK ###

在我们继续了解如何安装Java之前，让我们快速地了解JRE、OpenJDK和Oracle JDK之间的不同之处。

- JRE（Java Runtime Environment），它是你运行一个基于Java语言应用程序的所正常需要的环境。如果你不是一个程序员的话，这些足够你的需要。
- JDK代表Java开发工具包，如果你想做一些有关Java的开发（阅读程序），这正是你所需要的。
- OpenJDK是Java开发工具包的开源实现，Oracle JDK是Java开发工具包的官方Oracle版本。尽管OpenJDK已经足够满足大多数的案例，但是许多程序比如[Android Studio](2)建议使用Oracle JDK，以避免UI/性能问题。

### 检查Java是否已经安装在Ubuntu上 ###

打开终端，使用下面的命令：
	
	java -version

如果你看到像下面的输出，这就意味着你并没有安装过Java:

	The program ‘java’ can be found in the following packages:
	* default-jre
	* gcj-4.6-jre-headless
	* openjdk-6-jre-headless
	* gcj-4.5-jre-headless
	* openjdk-7-jre-headless
	Try: sudo apt-get install

### 在Ubuntu和Linux Mint上安装Java ###

看了各种类型‘Java’的不同之后，让我们看如何安装他们。

#### 在Ubuntu和Linux Mint上安装JRE ####

打开终端，使用下面的命令安装JRE：

	sudo apt-get install default-jre

#### 在Ubuntu和Linux Mint上安装OpenJDK ####

在终端，使用下面的命令安装OpenJDK Java开发工具包：

	sudo apt-get install default-jdk

特殊地，如果你想要安装Java 7或者Java 6等等，你可以使用openjdk-7-jdk/openjdk-6jdk，但是记住在此之前安装openjdk-7-jre/openjdk-6-jre。

#### 在Ubuntu和Linux Mint上安装Oracle JDK ####

使用下面的命令安装，只需一些时间，它就会下载许多的文件，所及你要确保你的网络环境良好：

	sudo add-apt-repository ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java8-installer
	sudo apt-get install oracle-java8-set-default

如果你想安装Java 7(i.e Java 1.7)，在上面的命令中用java7代替java8。

我希望这篇文章能够帮助你学会在Ubuntu,Linux Mint和其它基于Ubuntu的Linux发行版本上安装Java，我们欢迎所有问题或者建议。

------------------------------------------------------------------------------------------------------------------

via: http://itsfoss.com/install-java-ubuntu-1404/

作者：[Abhishek][a]
译者：[su-kaiyao](https://github.com/su-kaiyao)
校对：[wxy](https://github.com/wxy)
 
本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
 
[a]:http://itsfoss.com/author/Abhishek/
[1]:http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/
[2]:http://itsfoss.com/install-android-studio-ubuntu-linux/

