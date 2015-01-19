How to Install Cherokee Lightweight Web Server on Ubuntu 14.04
================================================================================
**Cherokee** is an free and open source high performance, lightweight, full-featured web server and running on major platform (Linux, Mac OS X, Solaris, and BSD).  It is compatible with TLS/SSL,FastCGI, SCGI, PHP, uWSGI, SSI, CGI, LDAP, HTTP proxying, video streaming, content caching, traffic shaping, virtual hosts, Apache compatible log files, and load balancing.

Today we'll  explains how to install and configure the Light Weight Cherokeeweb server on Ubuntu Server edition 14.04 LTS (Trusty)  and should also work with 12.04, 12.10 and 13. 04, just skip the modification of source list.

Step by step install and configure the Cherokee web server on Ubuntu Server edition

### 1. Updating Ubuntu Package Index ###

First, Login into Ubuntu Server and make sure your ubuntu server update, run the following commands one by one, and install any available updates:

    sudo apt-get update

    sudo apt-get upgrade

### 2. Adding PPA ###

Add the PPA cherokee webserver. by running the following commands

    sudo add-apt-repository ppa:cherokee-webserver

    sudo apt-get update

Now, only for servers running Ubuntu 14.04 LTS (Trusty) follow this step below

    cd /etc/apt/sources.list.d

    nano cherokee-webserver-ppa-trusty.list

    replace:

    deb http://ppa.launchpad.net/cherokee-webserver/ppa/ubuntu trusty main

    to:

    deb http://ppa.launchpad.net/cherokee-webserver/ppa/ubuntu saucy main

**then again run:**

    sudo apt-get update

### 3. Installing Cherokee Web Server using apt-get ###

Enter the following command to install the Cherokee web server including Module SSL

    sudo apt-get install cherokee cherokee-admin cherokee-doc libcherokee-mod-libssl libcherokee-mod-streaming libcherokee-mod-rrd

### 4. Configuring Cherokee ###

    sudo service cherokee start

The best part about using its Web Server is being able to manage all of its configurations through a simple to use web interface. This interface, known as cherokee-admin, is the recommended means of administering cherokee web server through web browser. Start cherokee-admin by running the following command:

    sudo cherokee-admin

**Note: The cherokee-admin will display the administration user name, One-time Password and administration web interface.**

**Note down your One-Time password. You will need this when you login to its admin web interface.**

By default, cherokee-admin can only accessed from localhost. If you need to access  the admin for other network address using the parameter ‘**-b**’. If you doesn’t mention any ip address, it will automatically listen to all network interfaces. Then you can connect to cherokee-admin from other network address.

    sudo cherokee-admin -b

If you need to access its admin from specific network address

    sudo cherokee-admin -b 192.168.1.102

### 5. Browse your Cherokee Admin Panel ###

Now you can access the administration panel from you favorite browser by typing http://hostname_or_IP:9090/ for me its http://127.0.0.1:9090/, it will appear on your browser like this:

![cherokee-admin-panel](http://blog.linoxide.com/wp-content/uploads/2014/12/cherokee-admin.png)

Hurray, we have successfully installed and configured Cherokee Web Server in our Ubuntu Server.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-cherokee-lightweight-web-server-ubuntu-14-04/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/