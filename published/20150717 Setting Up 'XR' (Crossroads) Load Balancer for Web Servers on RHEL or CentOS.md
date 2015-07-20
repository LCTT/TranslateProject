
在 RHEL/CentOS 上为Web服务器设置 “XR”（Crossroads） 负载均衡器
================================================================================
Crossroads 是一个独立的服务，并且是一个开源的负载均衡和故障转移实用程序，基于Linux和TCP服务。它可用于HTTP，HTTPS，SSH，SMTP和DNS等，它也是一个多线程的工具，它只消耗一个存储空间以此来提高性能达到负载均衡的目的。

首先来看看 XR 是如何工作的。我们可以找到 XR 分派的网络客户端和服务器之间到负载均衡服务器上的请求。 

如果一台服务器宕机，XR 会转发客户端请求到另一个服务器，所以客户感觉不到停机时间。看看下面的图来了解什么样的情况下，我们要使用 XR 处理。

![Install XR Crossroads Load Balancer](http://www.tecmint.com/wp-content/uploads/2015/07/Install-XR-Crossroads-Load-Balancer.jpg)

安装 XR Crossroads 负载均衡器

有两个 Web 服务器，一个网关服务器，我们安装和设置 XR 接收客户端请求，分发到服务器之间。

    XR Crossroads 网关服务器：172.16.1.204 

    Web 服务器01：172.16.1.222

    Web 服务器02：192.168.1.161

在上述情况下，我们网关服务器（即 XR Crossroads）的IP地址是172.16.1.222，webserver01 为172.16.1.222，它监听8888端口，webserver02 是192.168.1.161，它监听端口5555。

现在，我们需要的是均衡所有的请求，通过 XR 网关从网上接收请求然后分发它到两个web服务器已达到负载均衡。

### 第1步：在网关服务器上安装 XR Crossroads 负载均衡器 ###

**1. 不幸的是，没有为 crosscroads 提供可用的 RPM 包，我们只能从源码安装。**

要编译 XR，你必须在系统上安装 C++ 编译器和 GNU make 组件，才能继续无差错的安装。

    # yum install gcc gcc-c++ make

接下来，去他们的官方网站（[https://crossroads.e-tunity.com] [1]）下载此压缩包（即 crossroads-stable.tar.gz）。

或者，您可以使用 wget 去下载包然后解压在任何位置（如：/usr/src/），进入解压目录，并使用 “make install” 命令安装。

    # wget https://crossroads.e-tunity.com/downloads/crossroads-stable.tar.gz
    # tar -xvf crossroads-stable.tar.gz
    # cd crossroads-2.74/
    # make install

![Install XR Crossroads Load Balancer](http://www.tecmint.com/wp-content/uploads/2015/07/Install-XR-Crossroads-Load-Balancer.png)

安装 XR Crossroads 负载均衡器

安装完成后，二进制文件安装在 /usr/sbin 目录下，XR 的配置文件在 /etc 下名为 “xrctl.xml” 。

**2. 最后一个条件，你需要两个web服务器。为了方便使用，我在一台服务器中创建两个 Python SimpleHTTPServer 实例。**

要了解如何设置一个 python SimpleHTTPServer，请阅读我们此处的文章 [Create Two Web Servers Easily Using SimpleHTTPServer][2].


正如我所说的，我们要使用两个web服务器，webserver01 通过8888端口运行在172.16.1.222上，webserver02 通过5555端口运行在192.168.1.161上。

![XR WebServer 01](http://www.tecmint.com/wp-content/uploads/2015/07/XR-WebServer01.jpg)

XR WebServer 01

![XR WebServer 02](http://www.tecmint.com/wp-content/uploads/2015/07/XR-WebServer02.jpg)

XR WebServer 02

### Step 2: 配置 XR Crossroads 负载均衡器 ###

**3. 这个位置是最关键的。现在我们要做的就是配置`xrctl.xml` 文件并通过 XR 服务器接受来自互联网的请求分发到 web 服务器之间。**

现在打开`xrctl.xml`文件用 [vi/vim editor][3].

    # vim /etc/xrctl.xml

并作如下修改。

    <?xml version=<94>1.0<94> encoding=<94>UTF-8<94>?>
    <configuration>
    <system>
    <uselogger>true</uselogger>
    <logdir>/tmp</logdir>
    </system>
    <service>
    <name>Tecmint</name>
    <server>
    <address>172.16.1.204:8080</address>
    <type>tcp</type>
    <webinterface>0:8010</webinterface>
    <verbose>yes</verbose>
    <clientreadtimeout>0</clientreadtimeout>
    <clientwritetimout>0</clientwritetimeout>
    <backendreadtimeout>0</backendreadtimeout>
    <backendwritetimeout>0</backendwritetimeout>
    </server>
    <backend>
    <address>172.16.1.222:8888</address>
    </backend>
    <backend>
    <address>192.168.1.161:5555</address>
    </backend>
    </service>
    </configuration>

![Configure XR Crossroads Load Balancer](http://www.tecmint.com/wp-content/uploads/2015/07/Configure-XR-Crossroads-Load-Balancer.jpg)

配置 XR Crossroads 负载均衡器

在这里，你可以看到在 xrctl.xml 做了一个非常基本的 XR 配置。我已经定义了 XR 服务器是什么，XR 的后端服务和端口及网络接口端是什么。

**4. 现在，你需要通过以下命令来启动该 XR 守护进程。**

    # xrctl start
    # xrctl status

![Start XR Crossroads](http://www.tecmint.com/wp-content/uploads/2015/07/Start-XR-Crossroads.jpg)

启动 XR Crossroads

**5. 好的。现在是时候来检查该配置是否可以工作正常了。打开两个网页浏览器，输入 XR 服务器端口的 IP 地址，并查看输出。**

![Verify Web Server Load Balancing](http://www.tecmint.com/wp-content/uploads/2015/07/Verify-Web-Server-Load-Balancing.jpg)

验证 Web 服务器负载均衡

太棒了。它工作正常。是时候玩玩 XR 了。

**6. 现在可以登录到 XR Crossroads 仪表盘，看看我们已经配置的网络接口的端口。在网络接口输入你的 XR 服务器的 IP 地址和端口你将看到在  xrctl.xml 中的配置。**

    http://172.16.1.204:8010

![XR Crossroads Dashboard](http://www.tecmint.com/wp-content/uploads/2015/07/XR-Crossroads-Dashboard.jpg)

XR Crossroads 仪表盘

看起来很像了。它容易理解，用户界面​​友好，易于使用。它在右上角显示每个服务器能容纳多少个连接连同关于接收该请求的附加细节。你也可以设置每个服务器承担的负载量，最大连接数和平均负载等。。

最大的好处是，即使没有配置文件 xrctl.xml，你也可以做到这一点。你唯一要做的就是运行以下命令，它会做这项工作。

    # xr --verbose --server tcp:172.16.1.204:8080 --backend 172.16.1.222:8888 --backend 192.168.1.161:5555

上面语法的详细说明：

- -verbose 将显示命令执行后的信息。
- -server 定义你在安装包中的 XR 服务器。
- -backend 定义你需要平衡到 Web 服务器的流量。
- tcp 的定义，它使用 TCP 服务。

欲了解更多详情，有关文件及 CROSSROADS 的配置，请访问他们的官方网站: [https://crossroads.e-tunity.com/][4].

XR Corssroads 使用许多方法来提高服务器性能，避免宕机，让你的管理任务更轻松，更简便。希望你喜欢此文章，并随时在下面发表你的评论和建议，方便与 Tecmint 保持联系。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/setting-up-xr-crossroads-load-balancer-for-web-servers-on-rhel-centos/

作者：[Thilina Uvindasiri][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/thilidhanushka/
[1]:https://crossroads.e-tunity.com/
[2]:http://www.tecmint.com/python-simplehttpserver-to-create-webserver-or-serve-files-instantly/
[3]:http://www.tecmint.com/vi-editor-usage/
[4]:https://crossroads.e-tunity.com/
