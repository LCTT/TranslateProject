如何在 CentOS/RHEL 中为 Apache Tomcat 绑定 IPv4 地址
================================================================================
今天我们来学习一下如何在CentOS 7 Linux分布式系统中为Tomcat绑定IPv4。

**Apache Tomcat** 是由[Apache 软件基金会][1] 开发的开源web服务器和servlet容器。它实现了Java Servlet，JavaServer页面（JSP），Java的统一表达式语言，以及Sun Microsystems的Java的WebSocket规范，并提供了一个运行java代码的web服务器环境。

如果由于tomcat默认绑定到IPv6而导致我们的web服务器不能正常工作，就有必要将tomcat绑定到IPv4。众所周知，IPv6是为设备分配IP地址的现代方法，虽然在不久的将来也许会得到应用，但是现在并没有得到完全应用。由于没有用处，目前我们并不需要将我们的Tomcat服务器向IPv6转换，我们应该将其绑定到IPv4。

在开始将tomcat绑定到IPv4之前，我们应该确保在我们的CentOS 7中已经安装了tomcat。可以看这个[如何在CentOS 7.0服务器中安装tomcat 8][2]的指导。

### 1. 切换到tomcat用户 ###

首先，我们要切换到 **tomcat** 用户。我们可以通过在shell或者终端中运行 **su tomcat** 命令完成。

	# su tomcat

![切换到tomcat用户](http://blog.linoxide.com/wp-content/uploads/2015/01/switch-user-tomcat.png)

### 2. 找到文件 Catalina.sh ###

现在我们要进入Apache Tomcat安装目录下的bin文件夹，通常是 **/usr/share/apache-tomcat-8.0.x/bin/**， 这里的x是 Apache Tomcat发行版的子版本号。因为我的CentOS 7服务器中安装的版本是8.0.18，这里我的目录是 **/usr/share/apache-tomcat-8.0.18/bin/**。

    $ cd /usr/share/apache-tomcat-8.0.18/bin

**注意：请用你系统中安装的Apache Tomcat的版本号替换8.0.18。**

在bin目录中，有一个名字是catalina.sh的脚本文件。这就是我们要编辑的文件，我们将在里面增加一行将tomcat绑定到IPv4的配置信息。你可以通过在shell或者终端中运行命令 **ls** 来查看这个文件。

    $ ls

![查找文件 catalina.sh](http://blog.linoxide.com/wp-content/uploads/2015/01/finding-catalina.sh_.png)

### 3. 配置 Catalina.sh ###

如图所示，我们将在catalina.sh脚本文件的最后增加一行 `JAVA_OPTS= "$JAVA_OPTS -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses"`。我们可以使用我们喜欢的文本编辑器来编辑这个文件，例如nano、vim等等。这里我们使用nano。

    $ nano catalina.sh

![Catalina script](http://blog.linoxide.com/wp-content/uploads/2015/01/catalina-script.png)

然后，如下图所示，将该行增加到文件。

![配置 catalina](http://blog.linoxide.com/wp-content/uploads/2015/01/configured-catalina.png)

现在，我们已经将配置信息增加到文件中。保存文件并退出nano。

### 4. 重启 ###

现在，我们通过重启tomcat服务器使配置生效。我们要先运行shutdown.sh，然后运行startup.sh。

    $ ./shutdown.sh

运行可执行文件startup.sh:

    $ ./startup.sh

![重启apache tomcat 服务器](http://blog.linoxide.com/wp-content/uploads/2015/01/restarting-tomcat-server.png)

这将重启我们的tomcat服务器并加载将服务器绑定到IPv4的配置信息。

### 结尾 ###

好了，我们终于将我们运行在CentOS 7 Linux发行版上的tomcat服务器绑定到IPv4上了。尽管IPv6在不久的将来也许会得到应用，但由于现在还没有使用，如果因为将你的Tomcat服务器绑定到IPv6上而使得你的tomcat服务器不工作，就有必要将tomcat绑定到IPv4上，这也很简单。如果你有任何疑问，建议，反馈，请在下面的评论框中写下来，让我们知道有什么需要增加或者改进。非常感谢！

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/bind-apache-tomcat-ipv4-centos/

作者：[Arun Pyasi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.apache.org/
[2]:http://linoxide.com/linux-how-to/install-tomcat-8-centos-7/
