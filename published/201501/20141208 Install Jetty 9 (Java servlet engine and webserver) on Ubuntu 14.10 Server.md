Ubuntu 14.10 Server上安装Jetty 9（Java服务引擎和Web服务器）
================================================================================
Jetty提供了一个Web服务器和javax.servlet容器，为SPDY、WebSocket、OSGi、JMX、JNDI、JAAS以及许多其它集成套件添加了支持。这些组件都是开源的，也可用于商业用途和分发。

Jetty被广泛用于多种项目和产品，都可以在开发环境和生产环境中使用。Jetty可以很容易地嵌入到设备、工具、框架、应用服务器以及集群中。更多用途可参见Jetty网页。

### Jetty特性 ###

- 全功能并基于标准
- 开源与商用两可
- 灵活和可扩展
- 小足迹
- 可嵌入
- 异步支持
- 企业弹性扩展
- Apache和Eclipse双重许可证

### ubuntu 14.10 server上安装Jetty 9 ###

#### 先决条件 ####

在安装Jetty服务器前，您需要通过以下命令安装Java

    sudo apt-get install openjdk-8-jdk

Java将会安装到/usr/lib/jvm/java-8-openjdk-i386，同时在该目录下会创建一个名为java-8-openjdk-i386的符号链接，在/usr/bin/java下也会相应创建符号链接。

现在你需要从[这里][1]下载Jetty9，在下载完成后，你需要使用以下命令来解压缩

    $tar -xvf jetty-distribution-9.2.5.v20141112.tar.gz

该操作会将它解压到jetty-distribution-9.2.5.v20141112，而你需要使用以下命令将归档文件移动到/opt/jetty

    $mv jetty-distribution-9.2.5.v20141112 /opt/jetty

你需要创建jetty用户，并将其设置成/opt/jetty目录的属主

    sudo useradd jetty -U -s /bin/false

    sudo chown -R jetty:jetty /opt/jetty


使用以下命令拷贝Jetty脚本到启动目录，以便让它作为一个服务来运行

    $ cp /opt/jetty/bin/jetty.sh /etc/init.d/jetty

现在，你需要使用以下内容来创建Jetty设置文件

    sudo vi /etc/default/jetty

添加以下行

    JAVA_HOME=/usr/bin/java
    JETTY_HOME=/opt/jetty
    NO_START=0
    JETTY_ARGS=jetty.port=8085
    JETTY_HOST=0.0.0.0
    JETTY_USER=jetty 

保存并退出该文件

你需要使用以下命令来启动Jetty服务

    sudo service jetty start

你应该看到和下面类似的输出

    Starting Jetty: OK Mon Nov 24 11:55:48 GMT 2014

如果你看到了下面的错误

#### ** ERROR: JETTY_HOME not set, you need to set it or install in a standard location ####

你需要确保在/etc/default/jetty文件中设置了正确的Jetty家目录路径，你可以使用以下URL来测试jetty。

Jetty现在应该运行在8085端口，打开浏览器并访问http://服务器IP:8085，你应该可以看到Jetty屏幕。

#### Jetty服务检查 ####

使用以下命令来验证并检查配置

    sudo service jetty check

使用以下命令来让Jetty开重启后自动启动

    sudo update-rc.d jetty defaults

重启服务器并测试Jetty是否自动启动。

要检查Jetty运行在哪个端口上，或者该端口是否与其它程序冲突，可以运行netstat -tln

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/install-jetty-9-java-servlet-engine-and-webserver-on-ubuntu-14-10-server.html

作者：[ruchi][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://download.eclipse.org/jetty/stable-9/dist/
