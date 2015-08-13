translating-----geekpi

Darkstat is a Web Based Network Traffic Analyzer – Install it on Linux
================================================================================
Darkstat is a simple, web based network traffic analyzer application. It works on many popular operating systems like Linux, Solaris, Mac and AIX. It keeps running in the background as a daemon and continues collecting  and sniffing network data and presents it in easily understandable format within its web interface. It can generate traffic reports for hosts, identify which ports are open on some particular host and is IPV 6 complaint application.  Let’s see how we can install and configure it on Linux operating system.

### Installing Darkstat on Linux ###

**Install Darkstat on Fedora/CentOS/RHEL:**

In order to install it on Fedora/RHEL and CentOS Linux distributions, run following command on the terminal.

    sudo yum install darkstat

**Install Darkstat on Ubuntu/Debian:**

Run following on the terminal to install it on Ubuntu and Debian.

    sudo apt-get install darkstat

Congratulations, Darkstat has been installed on your Linux system now.

### Configuring Darkstat ###

In order to run this application properly, we need to perform some basic configurations. Edit /etc/darkstat/init.cfg file in Gedit text editor by running the following command on the terminal.

    sudo gedit /etc/darkstat/init.cfg

![](http://linuxpitstop.com/wp-content/uploads/2015/08/13.png)
Edit Darkstat

Change START_DARKSTAT parameter to “yes” and provide your network interface in “INTERFACE”. Make sure to uncomment DIR, PORT, BINDIP, and LOCAL parameters here. If you wish to bind the web interface for Darkstat to some specific IP, provide it in BINDIP section.

### Starting Darkstat Daemon ###

Once the installation and configuration for Darkstat is complete, run following command to start its daemon.

    sudo /etc/init.d/darkstat start

![Restarting Darkstat](http://linuxpitstop.com/wp-content/uploads/2015/08/23.png)

You can configure Darkstat to start on system boot by running the following command:

    chkconfig darkstat on

Launch your browser and load **http://localhost:666** and it will display the web based graphical interface for Darkstat. Start using this tool to analyze your network traffic.

![Darkstat](http://linuxpitstop.com/wp-content/uploads/2015/08/32.png)

### Conclusion ###

It is a lightweight tool with very low memory footprints. The key reason for the popularity of this tool is simplicity, ease of configuration and usage. It is a must-have application for System and Network Administrators.

--------------------------------------------------------------------------------

via: http://linuxpitstop.com/install-darkstat-on-ubuntu-linux/

作者：[Aun][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linuxpitstop.com/author/aun/
