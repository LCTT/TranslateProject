How to Bind Apache Tomcat to IPv4 in Centos / Redhat
================================================================================
Hi all, today we'll learn how to bind tomcat to ipv4 in CentOS 7 Linux Distribution.

**Apache Tomcat** is an open source web server and servlet container developed by the [Apache Software Foundation][1]. It implements the Java Servlet, JavaServer Pages (JSP), Java Unified Expression Language and Java WebSocket specifications from Sun Microsystems and provides a web server environment for Java code to run in.

Binding Tomcat to IPv4 is necessary if we have our server not working due to the default binding of our tomcat server to IPv6. As we know IPv6 is the modern way of assigning IP address to a device and is not in complete practice these days but may come into practice in soon future. So, currently we don't need to switch our tomcat server to IPv6 due to no use and we should bind it to IPv4.

Before thinking to bind to IPv4, we should make sure that we've got tomcat installed in our CentOS 7. Here's is a quick tutorial on [how to install tomcat 8 in CentOS 7.0 Server][2].

### 1. Switching to user tomcat ###

First of all, we'll gonna switch user to **tomcat** user. We can do that by running **su - tomcat** in a shell or terminal.

    # su - tomcat

![Switch user to tomcat](http://blog.linoxide.com/wp-content/uploads/2015/01/switch-user-tomcat.png)

### 2. Finding Catalina.sh ###

Now, we'll First Go to bin directory inside the directory of Apache Tomcat installation which is usually under **/usr/share/apache-tomcat-8.0.x/bin/** where x is sub version of the Apache Tomcat Release. In my case, its **/usr/share/apache-tomcat-8.0.18/bin/** as I have version 8.0.18 installed in my CentOS 7 Server.

    $ cd /usr/share/apache-tomcat-8.0.18/bin

**Note: Please replace 8.0.18 to the version of Apache Tomcat installed in your system. **

Inside the bin folder, there is a script file named catalina.sh . Thats the script file which we'll gonna edit and add a line of configuration which will bind tomcat to IPv4 . You can see that file by running **ls** into a terminal or shell.

    $ ls

![finding catalina.sh](http://blog.linoxide.com/wp-content/uploads/2015/01/finding-catalina.sh_.png)

### 3. Configuring Catalina.sh ###

Now, we'll add **JAVA_OPTS= "$JAVA_OPTS -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses"** to that scripting file catalina.sh  at the end of the file as shown in the figure below. We can edit the file using our favorite text editing software like nano, vim, etc. Here, we'll gonna use nano.

    $ nano catalina.sh

![Catalina script](http://blog.linoxide.com/wp-content/uploads/2015/01/catalina-script.png)

Then, add to the file as shown below:

**JAVA_OPTS= "$JAVA_OPTS -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses"**

![configured catalina](http://blog.linoxide.com/wp-content/uploads/2015/01/configured-catalina.png)

Now, as we've added the configuration to the file, we'll now save and exit nano.

### 4. Restarting ###

Now, we'll restart our tomcat server to get our configuration working. We'll need to first execute shutdown.sh and then startup.sh .

    $ ./shutdown.sh

Now, well run execute startup.sh as:

    $ ./startup.sh

![restarting apache tomcat server](http://blog.linoxide.com/wp-content/uploads/2015/01/restarting-tomcat-server.png)

This will restart our tomcat server and the configuration will be loaded which will ultimately bind the server to IPv4.

### Conclusion ###

Hurray, finally we'have got our tomcat server bind to IPv4 running in our CentOS 7 Linux Distribution. Binding to IPv4 is easy and is necessary if your Tomcat server is bind to IPv6 which will infact will make your tomcat server not working as IPv6 is not used these days and may come into practice in coming future. If you have any questions, comments, feedback please do write on the comment box below and let us know what stuffs needs to be added or improved. Thank You! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/bind-apache-tomcat-ipv4-centos/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.apache.org/
[2]:http://linoxide.com/linux-how-to/install-tomcat-8-centos-7/