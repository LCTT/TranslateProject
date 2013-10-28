                        翻译  hello world
Install Apache With SSL in Ubuntu 13.10
================================================================================
In this short tutorial let me show you how to install Apache with SSL support. My testbox details are given below:

### The System info ###

    root@ubuntu-unixmen:~# ifconfig
    eth0 Link encap:Ethernet HWaddr 08:00:27:b8:b4:87
    inet addr:10.1.1.110 Bcast:10.1.1.255 Mask:255.255.255.0
    inet6 addr: fe80::a00:27ff:feb8:b487/64 Scope:Link
    UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
    RX packets:1738 errors:0 dropped:0 overruns:0 frame:0
    TX packets:69 errors:0 dropped:0 overruns:0 carrier:0
    collisions:0 txqueuelen:1000
    RX bytes:168845 (168.8 KB) TX bytes:9767 (9.7 KB)

----------

    root@ubuntu-unixmen:~# cat /etc/issue
    Ubuntu 13.10 \n \l

### Install apache ###

    sudo apt-get install apache2 apache2-doc apache2-utils
    Reading package lists... Done
    Building dependency tree 
    Reading state information... Done
    The following extra packages will be installed:
    apache2-bin apache2-data libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap ssl-cert

### Test apache page ###

Open up the browser and navigate to http://ip-address/. You should see something like this.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/apache2-ubuntu.png)

### Create diretory ###

Create a directory called **ssl**.

    sudo mkdir /etc/apache2/ssl

### Create a self-signed certificate ###

    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt
    Generating a 2048 bit RSA private key.......................................................................................+++....................................+++writing new private key to '/etc/apache2/ssl/apache.key'-----You are about to be asked to enter information that will be incorporatedinto your certificate request.What you are about to enter is what is called a Distinguished Name or a DN.There are quite a few fields but you can leave some blankFor some fields there will be a default value,If you enter '.', the field will be left blank.-----Country Name (2 letter code) [AU]:

### Activate Apache SSL module ###

Run the following command to enable ssl mode.

    $ a2enmod ssl
    Considering dependency setenvif for ssl:
    Module setenvif already enabled
    Considering dependency mime for ssl:
    Module mime already enabled
    Considering dependency socache_shmcb for ssl:
    Enabling module socache_shmcb.
    Enabling module ssl

Edit **/etc/apache2/sites-enabled/default-ssl.conf** fie,

    &lt;VirtualHost 10.1.1.110:443&gt;
    ServerAdmin webmaster@localhost
    ServerName www.unixmen.com:443
    
    SSLEngine on
    SSLCertificateFile /etc/apache2/ssl/apache.crt
    SSLCertificateKeyFile /etc/apache2/ssl/apache.key

### Activate Apache default ssl virtual host: ###

    a2ensite default-ssl
    Enabling site default-ssl.
    To activate the new configuration, you need to run:
    service apache2 reload

### Restart Apache: ###

    sudo service apache2 restart

### Test SSL Connection ###

Open browser and navigate **to https://IP-address**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/apache-cert.png)

You’re done. Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-apache-ssl-ubuntu-13-10/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
