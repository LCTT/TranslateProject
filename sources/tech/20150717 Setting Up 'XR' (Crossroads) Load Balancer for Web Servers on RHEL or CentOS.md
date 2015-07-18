translation by strugglingyouth
Setting Up ‘XR’ (Crossroads) Load Balancer for Web Servers on RHEL/CentOS
================================================================================
Crossroads is a service independent, open source load balance and fail-over utility for Linux and TCP based services. It can be used for HTTP, HTTPS, SSH, SMTP and DNS etc. It is also a multi-threaded utility which consumes only one memory space which leads to increase the performance when balancing load.

Let’s have a look at how XR works. We can locate XR between network clients and a nest of servers which dispatches client requests to the servers balancing the load.

If a server is down, XR forwards next client request to the next server in line, so client feels no down time. Have a look at the below diagram to understand what kind of a situation we are going to handle with XR.

![Install XR Crossroads Load Balancer](http://www.tecmint.com/wp-content/uploads/2015/07/Install-XR-Crossroads-Load-Balancer.jpg)

Install XR Crossroads Load Balancer

There are two web-servers, one gateway server which we install and setup XR to receive client requests and distribute them among the servers.

    XR Crossroads Gateway Server : 172.16.1.204
    Web Server 01 : 172.16.1.222
    Web Server 02 : 192.168.1.161

In above scenario, my gateway server (i.e XR Crossroads) bears the IP address 172.16.1.222, webserver01 is 172.16.1.222 and it listens through port 8888 and webserver02 is 192.168.1.161 and it listens through port 5555.

Now all I need is to balance the load of all the requests that receives by the XR gateway from internet and distribute them among two web-servers balancing the load.

### Step1: Install XR Crossroads Load Balancer on Gateway Server ###

**1. Unfortunately, there isn’t any binary RPM packages available for crosscroads, the only way to install XR crossroads from source tarball.**

To compile XR, you must have C++ compiler and Gnu make utilities installed on the system in order to continue installation error free.

    # yum install gcc gcc-c++ make

Next, download the source tarball by going to their official site ([https://crossroads.e-tunity.com][1]), and grab the archived package (i.e. crossroads-stable.tar.gz).

Alternatively, you use following wget utility to download the package and extract it in any location (eg: /usr/src/), go to unpacked directory and issue “make install” command.

    # wget https://crossroads.e-tunity.com/downloads/crossroads-stable.tar.gz
    # tar -xvf crossroads-stable.tar.gz
    # cd crossroads-2.74/
    # make install

![Install XR Crossroads Load Balancer](http://www.tecmint.com/wp-content/uploads/2015/07/Install-XR-Crossroads-Load-Balancer.png)

Install XR Crossroads Load Balancer

After installation finishes, the binary files are created under /usr/sbin/ and XR configuration within /etc namely “xrctl.xml”.

**2. As the last prerequisite, you need two web-servers. For ease of use, I have created two python SimpleHTTPServer instances in one server.**

To see how to setup a python SimpleHTTPServer, read our article at [Create Two Web Servers Easily Using SimpleHTTPServer][2].

As I said, we’re using two web-servers, and they are webserver01 running on 172.16.1.222 through port 8888 and webserver02 running on 192.168.1.161 through port 5555.

![XR WebServer 01](http://www.tecmint.com/wp-content/uploads/2015/07/XR-WebServer01.jpg)

XR WebServer 01

![XR WebServer 02](http://www.tecmint.com/wp-content/uploads/2015/07/XR-WebServer02.jpg)

XR WebServer 02

### Step 2: Configure XR Crossroads Load Balancer ###

**3. All requisites are in place. Now what we have to do is configure the `xrctl.xml` file to distribute the load among the web-servers which receives by the XR server from the internet.**

Now open `xrctl.xml` file with [vi/vim editor][3].

    # vim /etc/xrctl.xml

and make the changes as suggested below.

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

Configure XR Crossroads Load Balancer

Here, you can see a very basic XR configuration done within xrctl.xml. I have defined what the XR server is, what are the back end servers and their ports and web interface port for the XR.

**4. Now you need to start the XR daemon by issuing below commands.**

    # xrctl start
    # xrctl status

![Start XR Crossroads](http://www.tecmint.com/wp-content/uploads/2015/07/Start-XR-Crossroads.jpg)

Start XR Crossroads

**5. Okay great. Now it’s time to check whether the configs are working fine. Open two web browsers and enter the IP address of the XR server with port and see the output.**

![Verify Web Server Load Balancing](http://www.tecmint.com/wp-content/uploads/2015/07/Verify-Web-Server-Load-Balancing.jpg)

Verify Web Server Load Balancing

Fantastic. It works fine. now it’s time to play with XR.

**6. Now it’s time to login into XR Crossroads dashboard and see the port we’ve configured for web-interface. Enter your XR server’s IP address with the port number for web-interface you have configured in xrctl.xml.**

    http://172.16.1.204:8010

![XR Crossroads Dashboard](http://www.tecmint.com/wp-content/uploads/2015/07/XR-Crossroads-Dashboard.jpg)

XR Crossroads Dashboard

This is what it looks like. It’s easy to understand, user-friendly and easy to use. It shows how many connections each back end server received in the top right corner along with the additional details regarding the requests receiving. Even you can set the load weight each server you need to bear, maximum number of connections and load average etc..

The best part is, you actually can do this even without configuring xrctl.xml. Only thing you have to do is issue the command with following syntax and it will do the job done.

    # xr --verbose --server tcp:172.16.1.204:8080 --backend 172.16.1.222:8888 --backend 192.168.1.161:5555

Explanation of above syntax in detail:

- –verbose will show what happens when the command has executed.
- –server defines the XR server you have installed the package in.
- –backend defines the webservers you need to balance the traffic to.
- Tcp defines it uses tcp services.

For more details, about documentations and configuration of CROSSROADS, please visit their official site at: [https://crossroads.e-tunity.com/][4].

XR Corssroads enables many ways to enhance your server performance, protect downtime’s and make your admin tasks easier and handier. Hope you enjoyed the guide and feel free to comment below for the suggestions and clarifications. Keep in touch with Tecmint for handy How To’s.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/setting-up-xr-crossroads-load-balancer-for-web-servers-on-rhel-centos/

作者：[Thilina Uvindasiri][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/thilidhanushka/
[1]:https://crossroads.e-tunity.com/
[2]:http://www.tecmint.com/python-simplehttpserver-to-create-webserver-or-serve-files-instantly/
[3]:http://www.tecmint.com/vi-editor-usage/
[4]:https://crossroads.e-tunity.com/
