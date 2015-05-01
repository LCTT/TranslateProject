translating---geekpi

How To Integrate Apache2 With Tomcat 7 Using mod_jk Connector
================================================================================
Apache is the most popular available web server. A web server is used basically to accept requests from clients and send responses to those requests. It gets an URL, translates it to a filename (for static requests), and sends that file back over the internet from the local disk, or it translates it to a program name, executes it, and then sends the output of that program back over the internet to the requesting party. If the web server was not able to process and complete the request, it instead returns an error message.

In this article we will list the features of Apache, and how we can integrate it with Tomcat8 and Tomcat7 using the mod_jk connector.

### Features of Apache ###

As we said Apache is the most popular available web server. The reasons behind its popularity are the following features:

- It is free tool that you can download and install it easily.
- It is open source web server so you can easily see the code, adjust it, optimize it, and fix errors and security holes. New features and modules can be also added.
- It can be used for small websites of one or two pages, or huge websites of hundreds and thousands of pages, serving millions of regular visitors each month. It can serve both static and dynamic content.
- Improved caching modules (mod_cache, mod_disk_cache, mod_mem_cache).
- Apache 2 supports the Internet protocol IPv6.

### Tomcat directory ###

${tomcat_home} is the root directory of tomcat. Your Tomcat installation should have the following subdirectories:

- ${tomcat_home}\conf – Where you can place various configuration files
- ${tomcat_home}\webapps – Containing example applications
- ${tomcat_home}\bin – Where you place web server plugins

### Mod_jk module ###

The mod_jk can be obtained in two formats: binary and source. Depending on the platform you are running your web server on, a binary version of mod_jk may be available. It is recommended to use the binary version if it is available.

The mod_jk module was developed and tested on:

- Linux, FreeBSD, AIX, HP-UX, MacOS X, Solaris and should work on major Unix’s platforms supporting Apache 1.3 and/or 2.x
- 0-i386 SP4/SP5/SP6a (should be able to work with other service packs), Win2K and WinXP and Win98
- Cygwin (until you have an apache server and autoconf/automake support tools)
- Netware
- i5/OS V5R4 (System I) with Apache HTTP Server 2.0.58. Be sure to have the latest Apache PTF installed.
- Tomcat 3.2 to Tomcat 8.

The mod_jk requires two entities:

- **mod_jk.xxx** – The Apache HTTP Server module, depending on your operating system, it will be mod_jk.so, mod_jk.nlm or MOD_JK.SRVPGM.
- **workers.properties** – A file that describes the host and used ports by the workers (Tomcat processes). A sample workers.properties can be found under the conf directory in the source download.

Also as with other Apache HTTP Server modules, mod_jk should be first installed on the modules directory of your Apache webserver: /usr/lib/apache and you should update your **httpd.conf** file.

### Installation ###

It is required to have a non-root user system with the “sudo” privileges before starting the installation. Now we will start our installation, so we will install Apache2 and Tomcat using the following command:

    sudo apt-get install apache2
    
    sudo apt-get install tomcat7
    
    sudo apt-get install tomcat7-admin

And now we will create a test application for Tomcat using the following commands:

    cd /var/lib/tomcat7/webapps
    sudo mkdir tomcat-demo
    sudo mkdir tomcat-demo/goodmoring
    sudo vim tomcat-demo/helloworld/index.jsp

And paste the following code:

    <HTML> 
     <HEAD>  
      <TITLE>Good Morning</TITLE> 
     </HEAD> 
     <BODY>  
      <H1>Good Morning</H1>   
      Today is: <%= new java.util.Date().toString() %> 
     </BODY>
    </HTML>

Everything is okay, good now we will install and configure the mod_jk using the following command:

    sudo apt-get install libapache2-mod-jk

We have to start by enabling the redirect port 8443 on Tomcat using the following command:

    sudo vim /etc/tomcat7/server.xml

And we will uncomment the following line:

    <Connector port="8009" protocol="AJP/1.3" redirectPort="8443" />

After that, we will create our workers.properties file for Apache using the following command:

    sudo vim /etc/apache2/workers.properties

Paste the following text:

    # Define 1 real worker using ajp13 
     worker.list=worker 
     # Set properties for worker (ajp13) 
     worker.worker.type=ajp13 
     worker.worker.host=localhost
     worker.worker.port=8009

Now we will use the following command to let Apache use this worker:

    sudo vim /etc/apache2/mods-available/jk.conf

And we will change the JkWorkersFile property to the following one;

    /etc/apache2/workers.properties

Finally to configure the URL Apache should pass through the Tomcat

    sudo vim /etc/apache2/sites-enabled/000-default

And we will add the following line in the configurtation file:

    <VirtualHost *:80>
    .......................................
    .......................................
    JkMount /tomcat-demo* worker1
    </VirtualHost *:80>

You can now restart the servers using the following commands to check their functionality:

    sudo /etc/init.d/tomcat7 restart
    sudo /etc/init.d/apache2 restart

### Conclusion ###

In this article we showed you how to configure and install Apache2 and Tomcat 7 using the mod_jk connector.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/integrate-apache2-tomcat-7-using-mod_jk-connector/

作者：[anismaj][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/anis/
