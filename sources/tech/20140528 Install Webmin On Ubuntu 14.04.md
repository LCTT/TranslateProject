Install Webmin On Ubuntu 14.04
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/webmin-790x586.jpg)

[Webmin][1] is an open source, web based system administration tool for Unix/Linux. Using Webmin, you can setup and configure all services such as DNS, DHCP, Apache, NFS, and Samba etc via any modern web browsers. So, you don’t have to remember all commands or edit any configuration files manually.

### Install Webmin On Ubuntu 14.04 LTS using official repository ###

Add the webmin official repository:

Edit file **/etc/apt/sources.list**,

    sudo vi /etc/apt/sources.list

Add the following lines:

    deb http://download.webmin.com/download/repository sarge contrib
    deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib

Add the GPG key:

    sudo wget http://www.webmin.com/jcameron-key.asc
    sudo apt-key add jcameron-key.asc

Update the sources list:

    sudo apt-get update

Install webmin using the following command:

    sudo apt-get install webmin

Allow the webmin default port “10000″ via firewall, if you want to access the webmin console from a remote system.

    sudo ufw allow 10000

### Access Webmin console ###

Open up your browser and navigate to the URL **https://ip-address:10000/**. The following screen should appear. Enter the user name and password to log in to webmin console.

![Login to Webmin](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/Login-to-Webmin-Mozilla-Firefox_010.png)

This is how my Webmin Dashboard looked.

![Webmin 1.690 on server.unixmen.local (Ubuntu Linux 14.04)](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/Webmin-1.690-on-server.unixmen.local-Ubuntu-Linux-14.04-Mozilla-Firefox_011.png)

That’s it. Now you’ll be able to manage and configure your Ubuntu server graphically. Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-webmin-ubuntu-14-04/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.webmin.com/