如何用mod_jk连接器来集成Apache2和Tomcat 7
================================================================================
Apache是最流行的web服务器。通常用来接收客户端的请求并响应。它得到一个URL并将它翻译成一个文件名（或者静态请求），并将文件从本地磁盘中通过因特网返回，或者将它翻译成程序名执行它，接着将输出返回给请求方。如果web服务器不能处理和完成请求，它会返回一个错误信息。

在本篇中，我们会列出Apache的特性以及我们该如何用mod_jk连接器来集成Tomcat7和Tomcat8.

### Apache的特性 ###

如我们所说Apache是最流行的web服务器。下面是流行背后的原因：

- 它是自由工具，你可以很简单地下载和安装
- 它开放源码因此你可以查看源码，调整它，优化它，并且修复错误和安全漏洞。也可以增加新的功能和模块。
- 它可以用在只有一两个页面的小网站，或者是有成千上万个页面的大网站，每月处理上百万的常规访问者的请求。它可以同时处理静态和动态内容。
- 提高的缓存模块（mod_cache、 mod_disk_cache、 mod_mem_cache）。
- Apache 2 支持 IPv6.

### Tomcat 目录 ###

${tomcat_home} 是tomcat的根目录。你的tomcat安装应该有下面的子目录：

- ${tomcat_home}\conf – 存放不同配置文件的地方
- ${tomcat_home}\webapps – 包含示例程序
- ${tomcat_home}\bin – 存放插件的地方

### Mod_jk 模块 ###

mod_jk有两种可接受的方式：二进制或者源码。取决于你运行的web服务器的平台，二进制版本的mod_jk也许可以找到。如果有二进制版本的话建议使用这个。

mod_jk模块在这些平台上开发及测试过：

- Linux、 FreeBSD、 AIX、 HP-UX、 MacOS X、 Solaris ，应该在主流的Unix平台上都支持Apache 1.3 和/或者 2.x。
- 0-i386 SP4/SP5/SP6a (应该可以于其他的服务包一起工作), Win2K and WinXP and Win98
- Cygwin (需要你有apache服务器及autoconf/automake支持工具)
- Netware
- i5/OS V5R4 (System I) 中的 Apache HTTP Server 2.0.58。 确保已经安装了Apache PTF
- Tomcat 3.2 到 Tomcat 8.

The mod_jk 需要两个组件：

- **mod_jk.xxx** – Apache HTTP服务器模块，取决于你的操作系统，它可能是mod_jk.so、mod_jk.nlm或者MOD_JK.SRVPGM。
- **workers.properties** - 描述主机以及处理器使用的端口（Tomcat进程）。在下载的源码内可以在conf目录下找到workers.properties文件。

和Apache HTTP服务器其他的模块一样，mod_jk应该安装在你的Apache服务器下的模块目录下：/usr/lib/apache，你应该更新你的**httpd.conf**文件。

### 安装 ###

它需要非root用户在安装钱使用“sudo”特权。现在我们开始安装，我们将使用下面的命令来安装Apache2和Tomcat：

    sudo apt-get install apache2
    
    sudo apt-get install tomcat7
    
    sudo apt-get install tomcat7-admin

下面在我们将会使用下面的命令来创建一个测试程序：

    cd /var/lib/tomcat7/webapps
    sudo mkdir tomcat-demo
    sudo mkdir tomcat-demo/goodmoring
    sudo vim tomcat-demo/helloworld/index.jsp

粘贴下面的代码：

    <HTML> 
     <HEAD>  
      <TITLE>Good Morning</TITLE> 
     </HEAD> 
     <BODY>  
      <H1>Good Morning</H1>   
      Today is: <%= new java.util.Date().toString() %> 
     </BODY>
    </HTML>

一切完毕后，我们将使用下面的命令安装和配置mod_jk:

    sudo apt-get install libapache2-mod-jk

我们将使用下面的命令启用Tomcat的8443转发端口：

    sudo vim /etc/tomcat7/server.xml

我们将解除下面的注释行：

    <Connector port="8009" protocol="AJP/1.3" redirectPort="8443" />

之后，我们将用下面的命令位Apache创建workers.properties文件：

    sudo vim /etc/apache2/workers.properties

粘贴下面的行：

    # Define 1 real worker using ajp13 
     worker.list=worker 
     # Set properties for worker (ajp13) 
     worker.worker.type=ajp13 
     worker.worker.host=localhost
     worker.worker.port=8009

现在我们将使用下面的命令来让Apache使用这个worker：

    sudo vim /etc/apache2/mods-available/jk.conf

我们将JkWorkersFile属性成下面这行：

    /etc/apache2/workers.properties

最后配置Apache交给Tomcat处理的URL

    sudo vim /etc/apache2/sites-enabled/000-default

我们将在配置文件中下面的行：

    <VirtualHost *:80>
    .......................................
    .......................................
    JkMount /tomcat-demo* worker1
    </VirtualHost *:80>

现在用下面的命令重启服务来检查它们的功能：

    sudo /etc/init.d/tomcat7 restart
    sudo /etc/init.d/apache2 restart

### 总结 ###

在本篇中我们展示了你该如何使用mod_jk连接器配置和安装Apache2以及Tomcat7。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/integrate-apache2-tomcat-7-using-mod_jk-connector/

作者：[anismaj][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/anis/
