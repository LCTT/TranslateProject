Install Jetty Web Server On CentOS 7
================================================================================
[Jetty][1] is a pure Java-based HTTP **(Web) server** and Java Servlet container. Jetty is now often used for machine to machine communications, usually within larger software frameworks. But the other Web Servers are usually associated with serving documents to humans. Jetty is developed as a free and open source project as part of the Eclipse Foundation. The web server is used in products such as Apache ActiveMQ, Alfresco, Apache Geronimo, Apache Maven, Apache Spark, Google App Engine, Eclipse, FUSE, Twitter’s Streaming API and Zimbra.

This article explains ‘How to install jetty web server in your CentOS server’.

**First of all we have to install java JDK, By the following command:**

    yum -y install java-1.7.0-openjdk wget

**After the JDK installation, We will download the latest version of Jetty:**

    wget http://download.eclipse.org/jetty/stable-9/dist/jetty-distribution-9.2.5.v20141112.tar.gz

**Extract and move the the downloaded package to /opt:**

    tar zxvf jetty-distribution-9.2.5.v20141112.tar.gz -C /opt/

**Rename the file name to jetty:**

    mv /opt/jetty-distribution-9.2.5.v20141112/ /opt/jetty

**Create a user called jetty:**

    useradd -m jetty

**Change the ownership of jetty:**

    chown -R jetty:jetty /opt/jetty/

**Make a Symlink jetty.sh to /etc/init.d directory to create a start up script file:**

    ln -s /opt/jetty/bin/jetty.sh /etc/init.d/jetty

**Add script:**

    chkconfig --add jetty

**Make the jetty web server auto starts on system boot:**

    chkconfig --level 345 jetty on

**Open /etc/default/jetty in your favorite editor and replace port and listening address desired value:**

    vi /etc/default/jetty

----------

    JETTY_HOME=/opt/jetty
    JETTY_USER=jetty
    JETTY_PORT=8080
    JETTY_HOST=50.116.24.78
    JETTY_LOGS=/opt/jetty/logs/

**We finished the installation, Now you have to start the jetty service.**

    service jetty start

All done!

Now you can access jetty web sever in  **http://<youripaddress>:8080**

That’s it!

Cheers!!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-jetty-web-server-centos-7/

作者：[Jijo][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/jijo/
[1]:http://eclipse.org/jetty/