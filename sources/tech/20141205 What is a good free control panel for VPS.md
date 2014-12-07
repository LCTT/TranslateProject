What is a good free control panel for VPS
================================================================================
Anyone with a reasonable level of Linux skills knows that no control panel can beat the plain-old command line interface for managing a [virtual private server][1] (VPS). One can still argue that there is a place for a good server control panel though, due to the streamlined interface for getting routine administration tasks done easily with a few mouse clicks.

As far as control panels are concerned, even with the feature-rich commercial control panels with all the bells and whistles, there are viable free open-source alternatives which can be as powerful and versatile. Standing out among them is [Ajenti][2] server administration panel.

Ajenti allows you to easily configure a variety of common server programs such as Apache/nginx, Samba, BIND, Squid, MySQL, cron, firewall, and so on, making it a great time saver for administering common VPS instances. For production environments, Ajenti also offers add-ons and platform support for virtual web hosting management and custom web UI development.

Ajenti comes with a [dual license][3]; It is free to use (AGPLv3) for your personal servers, a company's internal hardware boxes, or educational institutions. However, if you are a hosting company or a hardware vendor, you need to purchase a commercial license to use Ajenti as part of commercial offerings.

### Install Ajenti on Linux ###

For easy of installation, Ajenti offers its own repository for major Linux distros. All it takes to install Ajenti on Linux is to configure a target repository and install it with a default package manager.

Upon installation, a RSA private key and certificate will be automatically generated for SSL, and Ajenti will listen on HTTPS port 8000 for secure web access. If you are using firewall, you need to allow TCP/8000 port in the firewall. For security, it is a good idea to block access to port 8000 by default, and add only selected few IP addresses to the white list.

#### Install Ajenti on Debian ####

    $ wget http://repo.ajenti.org/debian/key -O- | sudo apt-key add -
    $ sudo sh -c 'echo "deb http://repo.ajenti.org/debian main main debian" >> /etc/apt/sources.list'
    $ sudo apt-get update
    $ sudo apt-get install ajenti 

#### Install Ajenti on Ubuntu ####

    $ wget http://repo.ajenti.org/debian/key -O- | sudo apt-key add -
    $ sudo sh -c 'echo "deb http://repo.ajenti.org/ng/debian main main ubuntu" >> /etc/apt/sources.list'
    $ sudo apt-get update
    $ sudo apt-get install ajenti 

#### Install Ajenti on CentOS/RHEL or Fedora ####

On CentOS/RHEL, [configure][4] EPEL repository first, and then run the following. On Fedora, use the following commands directly.

    $ wget http://repo.ajenti.org/ajenti-repo-1.0-1.noarch.rpm
    $ sudo rpm -ivh ajenti-repo-1.0-1.noarch.rpm
    $ sudo yum install ajenti 

Next, configure the firewall.

On Fedora or CentOS/RHEL 7:

    $ sudo firewall-cmd --zone=public --add-port=8000/tcp --permanent
    $ sudo firewall-cmd --reload 

On CentOS/RHEL 6:

    $ sudo iptables -I INPUT -p tcp -m tcp --dport 8000 -j ACCEPT
    $ sudo service iptables save 

### Access Ajenti Web Interface ###

Before accessing Ajenti's web interface, make sure to start ajenti service.

    $ sudo service ajenti restart 

Direct your web browser to https://<server-ip-address>:8000, and you will see the following Ajenti login interface.

![](https://farm8.staticflickr.com/7512/15712738197_eeccd0f9dd_z.jpg)

The default login credential is "root" for username and "admin" for password. Once you log in, you will see the initial Ajengi menu.

![](https://farm8.staticflickr.com/7498/15897850312_d2ca46fa4b_z.jpg)

Under "SOFTWARE" section in the left panel, you will see a list of installed services. When you install any new server software supported by Ajenti, the software will be automatically added to the list once you restart ajenti service.

     $ sudo service ajenti restart 

### VPS Management via Ajenti Web Interface ###

Ajenti's web interface is extremely intuitive and easy to use. Here are a few examples of Ajenti functionality.

#### Pluggable Architecture ####

Ajenti comes with a number of application-specific plugins, which makes Ajenti highly extensible. When you install a new software on your VPS, a corresponding Ajenti plugin (if any) will be automatically enabled to manage the software. The "Plugins" menu will show what plugins are available/enabled, and which plugin is associated with what software.

![](https://farm8.staticflickr.com/7501/15872690086_26d05ea570_z.jpg)

#### Package Management ####

Ajenti offers a web interface for installing and upgrading packages on VPS.

![](https://farm9.staticflickr.com/8571/15896505171_daf8c2d9db_z.jpg)

#### Firewall Configuration ####

Ajenti allows you to manage firewall rules (iptables or CSF) in two ways. One is to use a user-friendly web panel interface, and the other is to edit raw firewall rules directly. 

![](https://farm8.staticflickr.com/7490/15276234634_a220f2a555_z.jpg)

![](https://farm8.staticflickr.com/7499/15711196520_343d0668ff_z.jpg)

#### Log Inspection ####

You can browse system logs in /var/log via Ajenti's web interface.

![](https://farm8.staticflickr.com/7529/15276234684_a5375c9b6d_z.jpg)

#### Process Monitoring ####

You can see a list of processes sorted by CPU or RAM usage, and can kill them as needed.

![](https://farm8.staticflickr.com/7556/15711008948_ed359c284d_z.jpg)

#### Terminal Access ####

For low-level VPS access, Ajenti offers a web-based terminal interface where you can type Linux commands. You can open multiple terminal tabs within a web panel as shown below.

![](https://farm8.staticflickr.com/7568/15896505251_8271ac16dd_z.jpg)

#### Apache Web Server Administration ####

You can edit Apache configuration file, and manage apache2 service.

![](https://farm8.staticflickr.com/7572/15711009108_bb806d2dcd_z.jpg)

#### MySQL/MariaDB Management ####

You can access MySQL/MariaDB server and execute raw SQL commands on it.

![](https://farm8.staticflickr.com/7580/15276234754_02375fd17b_z.jpg)

#### Squid Configuration ####

You can configure ACL, HTTP access rules, filtering ports for Squid proxy server.

![](https://farm8.staticflickr.com/7568/15712738507_e2ef48b78f_z.jpg)

#### Startup Service Management ####

You can view, start, stop and restart installed services.

![](https://farm8.staticflickr.com/7538/15898503935_1edf5c67ae_z.jpg)

### Conclusion ###

Ajenti is a convenient and easy-to-use web control panel for common server administration, with the possibility to add [custom plugins][5] that you can develop. However, remember that any good control panel does not obviate the need for you to learn what's happening behind the scene on your [VPS][6]. A control panel will become a real time saver only when you fully understand what you are doing, and be able to handle the consequence of your action without relying on the control panel.

--------------------------------------------------------------------------------

via: http://xmodulo.com/free-control-panel-for-vps.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/go/digitalocean
[2]:http://ajenti.org/
[3]:http://ajenti.org/licensing
[4]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[5]:http://docs.ajenti.org/en/latest/dev/intro.html
[6]:http://xmodulo.com/go/digitalocean