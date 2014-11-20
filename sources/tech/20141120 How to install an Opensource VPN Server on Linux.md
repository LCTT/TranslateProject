How to install an Opensource VPN Server on Linux
================================================================================
![](http://techarena51.com/wp-content/uploads/2014/10/open-vpn.png)

One of the most concerning factors to me while browsing, Is how can I ensure that my data remains private and secure ? While searching for answers, I came cross a number of ways in which you can remain anonymous like using a proxy website. But still using a third party service was not assuring enough. What I needed was a software which could be installed and run by me thus ensuring that I and only I would have access to the data.

So what is such a software called?

It’s called a VPN service or short for Virtual Private Network. It allows you to encrypt your data via SSL when you connect through it. Since the connection is encrypted even your ISP cannot see what your browsing.

In this Linux Tutorial , I will be installing an OpenVPN Access Server on CentOS 7 . OpenVPN is easy to use, OpenSource and has community based support. It has clients for Windows, Android, and Mac.

### Step 1. Install OpenVPN Access Server on your Centos 7 Linux machine or [VPS][1]. ###

Download the package from https://openvpn.net/index.php/access-server/download-openvpn-as-sw.html, Ubuntu users can download appropriate packages and install OpenVPN Access Server on Ubuntu as well.

    [leo@vps ]$ cd /tmp
    [leo@vps tmp]$ wget http://swupdate.openvpn.org/as/openvpn-as-2.0.10-CentOS7.x86_64.rpm
    [leo@vps tmp]$ sudo rpm -Uvh openvpn-as-2.0.10-CentOS7.x86_64.rpm
    Preparing...                          ################################# [100%]
    Updating / installing...
       1:openvpn-as-0:2.0.10-CentOSrelease################################# [100%]
    The Access Server has been successfully installed in /usr/local/openvpn_as
    Configuration log file has been written to /usr/local/openvpn_as/init.log
    Please enter "passwd openvpn" to set the initial
    administrative password, then login as "openvpn" to continue
    configuration here: https://yourhostIP:943/admin
    To reconfigure manually, use the /usr/local/openvpn_as/bin/ovpn-init tool.
    
    Access Server web UIs are available here:
    Admin  UI: https://yourhostIP:943/admin
    Client UI: https://yourhostIP:943/

### Step 2: Setup a password for an OpenVPN client ###

    [leo_g@vps ]$passwd openvpn

### Step 3: Log into the server via the admin Url https://yourhostIP:943/admin and start the server. ###

![](http://techarena51.com/wp-content/uploads/2014/10/open-vpn.png)

Type in the username “openvpn” and the password you set earlier

![](http://techarena51.com/wp-content/uploads/2014/10/open-vpn-1.png)

### Step 4: Install the client from the Client Url. ( It will give you an option to download the Installer) ###

![](http://techarena51.com/wp-content/uploads/2014/10/open-vpn-client-url.png)

You can read instructions [here][3] on how to install it for your OS.

### Step 5: Connect to your server with your username and password that you created earlier. ###

![](http://openvpn.net/images/howto/connecting/OpenVPN_Client_Connect_2.png)

That’s it, you can goto whatismyip.com and check your IP, should be that of your CentOS 7 OpenVPN Access Server. 

--------------------------------------------------------------------------------

via: http://techarena51.com/index.php/how-to-install-an-opensource-vpn-server-on-linux/

作者：[Leo G][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://techarena51.com/
[1]:https://play.google.com/store/apps/details?id=net.openvpn.openvpn&hl=en
[2]:http://supportinc.net/vps-hosting.php
[3]:https://openvpn.net/index.php/access-server/docs/admin-guides-sp-859543150/howto-connect-client-configuration.html