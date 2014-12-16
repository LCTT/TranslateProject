Translating by GOLinux!
Install Jetty 9 (Java servlet engine and webserver) on Ubuntu 14.10 Server
================================================================================
Jetty provides a Web server and javax.servlet container, plus support for SPDY, WebSocket, OSGi, JMX, JNDI, JAAS and many other integrations. These components are open source and available for commercial use and distribution.

Jetty is used in a wide variety of projects and products, both in development and production. Jetty can be easily embedded in devices, tools, frameworks, application servers, and clusters. See the Jetty Powered page for more uses of Jetty.

### Jetty Features ###

- Full-featured and standards-based
- Open source and commercially usable
- Flexible and extensible
- Small footprint
- Embeddable
- Asynchronous
- Enterprise scalable
- Dual licensed under Apache and Eclipse

### Install Jetty9 on ubuntu 14.10 server ###

#### Prerequisites ####

You need to install Java before installing jetty server using the following command

    sudo apt-get install openjdk-8-jdk

This will install it to /usr/lib/jvm/java-8-openjdk-i386. A symlink java-1.8.0-openjdk-i386 is created in the directory /usr/lib/jvm/. A symlink is also created at /usr/bin/java

Now you need to download Jetty9 from [here][1] after downloading you need to extract using the following command

    $tar -xvf jetty-distribution-9.2.5.v20141112.tar.gz

This unpacks the jetty-distribution-9.2.5.v20141112 and you need to Move the archive to /opt/jetty using the following command

    $mv jetty-distribution-9.2.5.v20141112 /opt/jetty

You need to Create jetty user and make it the owner of /opt/jetty directory

    sudo useradd jetty -U -s /bin/false

    sudo chown -R jetty:jetty /opt/jetty

#### Jetty Startup Script ####

Copy the Jetty script to run as a service using the following command

    $ cp /opt/jetty/bin/jetty.sh /etc/init.d/jetty

Now you need to create jetty settings file with the following content

    sudo vi /etc/default/jetty

Add the following lines

    JAVA_HOME=/usr/bin/java
    JETTY_HOME=/opt/jetty
    NO_START=0
    JETTY_ARGS=jetty.port=8085
    JETTY_HOST=0.0.0.0
    JETTY_USER=jetty 

Save and exit the file

You need to start jetty service using the following command

    sudo service jetty start

You should see output similar to the following

    Starting Jetty: OK Mon Nov 24 11:55:48 GMT 2014

If you see the following error

#### ** ERROR: JETTY_HOME not set, you need to set it or install in a standard location ####

You need to make sure you have correct jetty home path in /etc/default/jetty file i.e JETTY_HOME=/opt/jetty

You can test the jetty using the following URL

It should now be running on port 8085! Visit in your browser http://serverip:8085 and you should see a Jetty screen.

#### Jetty Service checking ####

Verify and check your configuration with the following command

    sudo service jetty check

Jetty automatically start on reboot using the following command

    sudo update-rc.d jetty defaults

Reboot the server and test if Jetty starts automatically.

To check which port Jetty is running or whether there are any conflicts with other programs for that port, run netstat -tln

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/install-jetty-9-java-servlet-engine-and-webserver-on-ubuntu-14-10-server.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://download.eclipse.org/jetty/stable-9/dist/
