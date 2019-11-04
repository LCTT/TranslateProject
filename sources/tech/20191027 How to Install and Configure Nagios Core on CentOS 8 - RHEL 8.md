[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install and Configure Nagios Core on CentOS 8 / RHEL 8)
[#]: via: (https://www.linuxtechi.com/install-nagios-core-rhel-8-centos-8/)
[#]: author: (James Kiarie https://www.linuxtechi.com/author/james/)

How to Install and Configure Nagios Core on CentOS 8 / RHEL 8
======

**Nagios** is a free and opensource network and alerting engine used to monitor various devices, such as network devices, and servers in a network. It supports both **Linux** and **Windows OS** and provides an intuitive web interface that allows you to easily monitor network resources. When professionally configured, it can alert you in the event a server or a network device goes down or malfunctions via email alerts. In this topic, we shed light on how you can install and configure Nagios core on **RHEL 8** / **CentOS 8**.

[![Install-Nagios-Core-RHEL8-CentOS8][1]][2]

### Prerequisites of Nagios Core

Before we begin, perform a flight check and ensure you have the following:

  * An instance of RHEL 8 / CentOS 8
  * SSH access to the instance
  * A fast and stable internet connection



With the above requirements in check, let’s roll our sleeves!

### Step 1: Install LAMP Stack

For Nagios to work as expected, you need to install LAMP stack or any other web hosting stack since it’s going to run on a browser. To achieve this, execute the command:

```
# dnf install httpd mariadb-server php-mysqlnd php-fpm
```

![Install-LAMP-stack-CentOS8][1]

You need to ensure that Apache web server is up and running. To do so, start and enable Apache server using the commands:

```
# systemctl start httpd
# systemctl enable httpd
```

![Start-enable-httpd-centos8][1]

To check the status of Apache server run

```
# systemctl status httpd
```

![Check-status-httpd-centos8][1]

Next, we need to start and enable MariaDB server, run the following commands

```
# systemctl start mariadb
# systemctl enable mariadb
```

![Start-enable-MariaDB-CentOS8][1]

To check MariaDB status run:

```
# systemctl status mariadb
```

![Check-MariaDB-status-CentOS8][1]

Also, you might consider hardening or securing your server and making it less susceptible to unauthorized access. To secure your server, run the command:

```
# mysql_secure_installation
```

Be sure to set a strong password for your MySQL instance. For the subsequent prompts, Type **Yes** and hit **ENTER**

![Secure-MySQL-server-CentOS8][1]

### Step 2: Install Required packages

Apart from installing the LAMP server, some additional packages are needed for the installation and proper configuration of Nagios. Therefore, install the packages as shown below:

```
# dnf install gcc glibc glibc-common wget gd gd-devel perl postfix
```

![Install-requisite-packages-CentOS8][1]

### Step 3: Create a Nagios user account

Next, we need to create a user account for the Nagios user. To achieve this , run the command:

```
# adduser nagios
# passwd nagios
```

![Create-new-user-for-Nagios][1]

Now, we need to create a group for Nagios and add the Nagios user to this group.

```
# groupadd nagiosxi
```

Now add the Nagios user to the group

```
# usermod -aG nagiosxi nagios
```

Also, add Apache user to the Nagios group

```
# usermod -aG nagiosxi apache
```

![Add-Nagios-group-user][1]

### Step 4: Download and install Nagios core

We can now proceed and install Nagios Core. The latest stable version in Nagios 4.4.5 which was released on August 19, 2019.  But first, download the Nagios tarball file from its official site.

To download Nagios core, first head to the tmp directory

```
# cd /tmp
```

Next download the tarball file

```
# wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.5.tar.gz
```

![Download-Nagios-CentOS8][1]

After downloading the tarball file, extract it using the command:

```
# tar -xvf nagios-4.4.5.tar.gz
```

Next, navigate to the uncompressed folder

```
# cd nagios-4.4.5
```

Run the commands below in this order

```
# ./configure --with-command-group=nagcmd
# make all
# make install
# make install-init
# make install-daemoninit
# make install-config
# make install-commandmode
# make install-exfoliation
```

To setup Apache configuration issue the command:

```
# make install-webconf
```

### Step 5: Configure Apache Web Server Authentication

Next, we are going to setup authentication for the user **nagiosadmin**. Please be mindful not to change the username or else, you may be required to perform further configuration which may be quite tedious.

To set up authentication run the command:

```
# htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
```

![Configure-Apache-webserver-authentication-CentOS8][1]

You will be prompted for the password of the nagiosadmin user. Enter and confirm the password as requested. This is the user that you will use to login to Nagios towards the end of this tutorial.

For the changes to come into effect, restart your web server.

```
# systemctl restart httpd
```

### Step 6: Download &amp; install Nagios Plugins

Plugins will extend the functionality of the Nagios Server. They will help you monitor various services, network devices, and applications. To download the plugin tarball file run the command:

```
# wget https://nagios-plugins.org/download/nagios-plugins-2.2.1.tar.gz
```

Next, extract the tarball file and navigate to the uncompressed plugin folder

```
# tar -xvf nagios-plugins-2.2.1.tar.gz
# cd nagios-plugins-2.2.1
```

To install the plugins compile the source code as shown

```
# ./configure --with-nagios-user=nagios --with-nagios-group=nagiosxi
# make
# make install
```

### Step 7: Verify and Start Nagios

After the successful installation of Nagios plugins, verify the Nagios configuration to ensure that all is well and there is no error in the configuration:

```
# /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
```

![Verify-Nagios-settings-CentOS8][1]

Next, start Nagios and verify its status

```
# systemctl start nagios
# systemctl status nagios
```

![Start-check-status-Nagios-CentOS8][1]

In case Firewall is running on system then allow “80” using the following command

```
# firewall-cmd --permanent --add-port=80/tcp# firewall-cmd --reload
```

### Step 8: Access Nagios dashboard via the web browser

To access Nagios, browse your server’s IP address as shown

<http://server-ip/nagios>

A pop-up will appear prompting for the username and the password of the user we created earlier in Step 5. Enter the credentials and hit ‘**Sign In**’

![Access-Nagios-via-web-browser-CentOS8][1]

This ushers you to the Nagios dashboard as shown below

![Nagios-dashboard-CentOS8][1]

We have finally successfully installed and configured Nagios Core on CentOS 8 / RHEL 8. Your feedback is most welcome.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-nagios-core-rhel-8-centos-8/

作者：[James Kiarie][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Install-Nagios-Core-RHEL8-CentOS8.jpg
