Translating by GOLinux!
How to configure rsyslog client for remote logging on CentOS
================================================================================
**rsyslog** is an open source utility widely used on Linux systems to forward or receive log messages via TCP/UDP protocols. rsyslog daemon can be configured in two scenarios. Configured as a log collector server, rsyslog daemon can gather log data from all other hosts in the network, which are configured to send their internal logs to the server. In another role, rsyslog daemon can be configured as a client which filters and sends internal log messages to either a local folder (e.g. /var/log) or a remote rsyslog server based on routing facility.

Assuming that you already have a rsyslog server [up and running][1] on your network, this guide will show you how to set up a CentOS system to route its internal log messages to a remote rsyslog server. This will greatly improve your system's disk usage, especially if you don't have a separate large partition dedicated for /var directory.

### Step One: Install Rsyslog Daemon ###

On CentOS 6 and 7, rsyslog daemon comes preinstalled. To verify that rsyslog is installed on your CentOS system, issue the following command:

    # rpm -qa | grep rsyslog
    # rsyslogd -v 

![](https://farm8.staticflickr.com/7502/15988316295_ac2e07e7f3_z.jpg)

If for some reason rsyslog daemon is missing on your system, issue the following command to install it:

     # yum install rsyslog 

### Step Two: Configure Rsyslog Daemon as a Client ###

The next step is to transform your CentOS machine into a rsyslog client which sends all of its internal log messages to the central remote log server.

To do so, open the main rsyslog configuration file located in /etc path with your favorite text editor:

    # nano /etc/rsyslog.conf 

After the file is opened for editing, you need to add the following statement at the bottom of the file. Replace the IP address with your remote rsyslog server's IP address.

    *.*  @192.168.1.25:514 

The above statement tells rsyslog daemon to route every log message from every facility on the system to the remote rsyslog server (192.168.1.25) on UDP port 514.

If for some reasons you need a more reliable protocol like TCP, and the rsyslog server is configured to listen for TCP connections, you must add an extra @ character in front of the remote host's IP address as in the below excerpt:

    *.*  @@192.168.1.25:514 

Note that you can also replace the IP address of the rsyslog server with its DNS name (FQDN).

If you want to forward log messages from a specific facility only, let's say kernel facility, then you can use the following statement in your rsyslog configuration file.

    kern.* @192.168.1.25:514 

Once you have modified the configuration, you need to restart the daemon to activate the change:

**On CentOS 7:**

    # systemctl restart rsyslog.service 

**On CentOS 6:**

     # service rsyslog restart 

In another scenario, let's assume that you have installed an application named "foobar" on your machine, which generates logs to /var/log/foobar.log file. Now you want to direct only its logs to a remote rsyslog server. This can be achieved by loading imfile module in the rsyslog configuration as follows.

First load the imfile module. This must be done just once.

    module(load="imfile" PollingInterval="5") 

Then specify the path to the log file that the imfile module should monitor:

    input(type="imfile"
          File="/var/log/foobar.log"
          Tag="foobar"
          Severity="error"
          Facility="local7")

Finally, direct local7 facility to the remote rsyslog server:

    local7.* @192.168.1.25:514

Don't forget to restart rsyslog daemon.

### Step Three: Enable Rsyslog Daemon to Auto-start ###

To automatically start rsyslog client after every system reboot, run the following command to enable it system-wide:

**On CentOS 7:**

    # systemctl enable rsyslog.service 

**On CentOS 6:**

    # chkconfig rsyslog on 

### Summary ###

In this tutorial I demonstrated how to turn a CentOS system into rsyslog client to force it to send its log messages to a remote rsyslog server. Here I assume that the connection between a rsyslog client and rsyslog server is secure (e.g., within corporate network protected by a firewall). Under any circumstances do not configure a rsyslog client to forward log messages over insecure networks or, especially, over the Internet as the syslog protocol is a clear-text protocol. For secure transmission, consider encrypting syslog messages using [TLS/SSL][2].

--------------------------------------------------------------------------------

via: http://xmodulo.com/configure-rsyslog-client-centos.html

作者：[Caezsar M][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/caezsar
[1]:http://xmodulo.com/configure-syslog-server-linux.html
[2]:http://www.rsyslog.com/doc/rsyslog_tls.html
