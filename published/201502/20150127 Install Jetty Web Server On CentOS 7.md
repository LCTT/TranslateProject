在CentOS 7中安装Jetty服务器
================================================================================
[Jetty][1] 是一款纯Java的HTTP **(Web) 服务器**和Java Servlet容器。 通常在更大的网络框架中，Jetty经常用于设备间的通信，而其他Web服务器通常给“人类”传递文件 :D。Jetty是一个Eclipse基金会的免费开源项目。这个Web服务器用于如Apache ActiveMQ、 Alfresco、 Apache Geronimo、 Apache Maven、 Apache Spark、Google App Engine、 Eclipse、 FUSE、 Twitter的 Streaming API 和 Zimbra中。

这篇文章会介绍‘如何在CentOS服务器中安装Jetty服务器’。

**首先我们要用下面的命令安装JDK：**

    yum -y install java-1.7.0-openjdk wget

**JDK安装之后，我们就可以下载最新版本的Jetty了：**

    wget http://download.eclipse.org/jetty/stable-9/dist/jetty-distribution-9.2.5.v20141112.tar.gz

**解压并移动下载的包到/opt：**

    tar zxvf jetty-distribution-9.2.5.v20141112.tar.gz -C /opt/

**重命名文件夹名为jetty:**

    mv /opt/jetty-distribution-9.2.5.v20141112/ /opt/jetty

**创建一个jetty用户：**

    useradd -m jetty

**改变jetty文件夹的所属用户:**

    chown -R jetty:jetty /opt/jetty/

**为jetty.sh创建一个软链接到 /etc/init.d directory 来创建一个启动脚本文件：**

    ln -s /opt/jetty/bin/jetty.sh /etc/init.d/jetty

**添加脚本：**

    chkconfig --add jetty

**是jetty在系统启动时启动：**

    chkconfig --level 345 jetty on

**使用你最喜欢的文本编辑器打开 /etc/default/jetty 并修改端口和监听地址：**

    vi /etc/default/jetty

----------

    JETTY_HOME=/opt/jetty
    JETTY_USER=jetty
    JETTY_PORT=8080
    JETTY_HOST=50.116.24.78
    JETTY_LOGS=/opt/jetty/logs/

**我们完成了安装，现在可以启动jetty服务了 **

    service jetty start

完成了！

现在你可以在  **http://\<你的 IP 地址>:8080** 中访问了

就是这样。

干杯！！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-jetty-web-server-centos-7/

作者：[Jijo][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/jijo/
[1]:http://eclipse.org/jetty/
