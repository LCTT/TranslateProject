Monitoring Server: Install Zabbix on an Ubuntu 16.04 Server
============================================================

 [![Zabbix logo](https://www.unixmen.com/wp-content/uploads/2017/06/zabbix_logo.png "zabbix_logo")][3] 

### Monitoring Server – What is Zabbix

[Zabbix][2] is an enterprise-class open source distributed monitoring server solution. The software monitors different parameters of a network and the integrity of a server, and also allows the configuration of email based alerts for any event. Zabbix offers reporting and data visualization features based on the data stored in a database (MySQL, for example). Every metric collected by the software is accessible through a web-based interface.

Zabbix is released under the terms of the GNU General Public License version 2 (GPLv2), totally free of cost.

In this tutorial we will install Zabbix on an Ubuntu 16.04 server running MySQL, Apache and PHP.

### Install the Zabbix Server

First, we’ll need to install a few PHP modules required by Zabbix:

```
# apt-get install php7.0-bcmath php7.0-xml php7.0-mbstring
```
The Zabbix package available in the Ubuntu repositories is outdated. Use the official Zabbix repository to install the latest stable version.

Install the repository package by executing the following commands:

```
$ wget http://repo.zabbix.com/zabbix/3.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.2-1+xenial_all.deb
# dpkg -i zabbix-release_3.2-1+xenial_all.deb
```

Then update the `apt` packages source:

```
# apt-get update
```
Now it’s possible to install Zabbix Server with MySQL support and the PHP front-end. Execute the command:
```
# apt-get install zabbix-server-mysql zabbix-frontend-php
```

Install the Zabbix agent:

```
# apt-get install zabbix-agent
```

Zabbix is now installed. The next step is to configure a database for storing its data.

### Configure MySQL for Zabbix

We need to create a new MySQL database, in which Zabbix will store the collected data.

Start the MySQL shell:

```
$ mysql -uroot -p
```

Next:

```
mysql> CREATE DATABASE zabbix CHARACTER SET utf8 COLLATE utf8_bin;
Query OK, 1 row affected (0.00 sec)

mysql> GRANT ALL PRIVILEGES ON zabbix.* TO zabbix@localhost IDENTIFIED BY 'usr_strong_pwd';
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> EXIT;
Bye
```

Next, import the initial schema and data.

```
# zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -uzabbix -p zabbix
```

Enter the password for the **zabbix** user created in the MySQL shell.

Next, we need to edit the Zabbix Server configuration file, which is `/etc/zabbix/zabbis_server.conf`:

```
# $EDITOR /etc/zabbix/zabbix_server.conf
```

Search the `DBPassword` section of the file:

```
### Option: DBPassword                           
#       Database password. Ignored for SQLite.   
#       Comment this line if no password is used.
#                                                
# Mandatory: no                                  
# Default:                                       
# DBPassword=

```

Uncomment the `DBPassword=` line and edit by adding the password created in MySQL:

```
DBPassword=usr_strong_pwd

```

Next, look for the `DBHost=` line and uncomment it.

Save and exit.

### Configure PHP

We need to configure PHP for working with Zabbix. During the installation process, the installer created a configuration file in `/etc/zabbix`, named `apache.conf`. Open this file:

```
# $EDITOR /etc/zabbix/apache.conf
```

Here, right now, it’s necessary only to uncomment the `date.timezone` setting and set the correct timezone:

```

<IfModule mod_php7.c>
    php_value max_execution_time 300
    php_value memory_limit 128M
    php_value post_max_size 16M
    php_value upload_max_filesize 2M
    php_value max_input_time 300
    php_value always_populate_raw_post_data -1
    php_value date.timezone Europe/Rome
</IfModule>

```

Save and exit.

At this point, restart Apache and start the Zabbix Server service, enabling it for starting at boot time:

```
# systemctl restart apache2
# systemctl start zabbix-server
# systemctl enable zabbix-server
```
Check the Zabbix status with `systemctl`:
```
# systemctl status zabbix-server
```

This command should output:

```
â zabbix-server.service - Zabbix Server
 Loaded: loaded (/lib/systemd/system/zabbix-server.service; enabled; vendor pr
 Active: active (running) ...
```

At this point, the server-side part of Zabbix has been correctly installed and configured.

### Configure Zabbix Web Fronted

As mentioned in the introduction, Zabbix has a web-based front-end which we’ll use for visualizing collected data. However, this interface has to be configured.

With a web browser, go to URL `http://localhost/zabbix`.

![Zabbix monitoring server Frontend Setup](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot1.png)

Click on  _**Next step**_ 

![snapshot2](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot2.png)

Be sure that all the values are **Ok**, and then click on  _**Next step** _ again.

![Zabbix MySQL configuration](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot3.png)
Insert the MySQL **zabbix** user password, and then click on  _**Next step**_ .

![Zabbix server details](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot4.png)

Click on  _**Next step**_ , and the installer will show the following page with all the configuration parameters. Check again to ensure that everything is correct..

![Zabbix pre-installation details](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot5.png)

![Zabbix installation finished](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot6.png)

Click **Next step** to proceed to the final screen.

Click finish to complete the front-end installation. The default user name is **Admin** with **zabbix **as the password.

### Getting Started with the Zabbix Server

![Zabbix login interface](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot7.png)

After logging in with the above mentioned credentials, we will see the Zabbix dashboard:
![zabbix dashboard](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot8.png)
Go on  _Administration -> Users_  for an overview about enabled accounts
![Zabbix users](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot9.png)
Create a new account by clicking on  _**Create user**_ 
![Zabbix User Creation](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot10.png)
Click on **Add** in the **Groups** section and select one group
![snapshot11](https://www.unixmen.com/wp-content/uploads/2017/06/snapshot11.png)
Save the new user credentials, and it will appear in the  _Administration -> Users _ panel.**Note that in Zabbix access rights to hosts are assigned to user groups, not individual users.**

### Conclusion

This concludes the tutorial for the Zabbix Server installation. Now, the monitoring infrastructure is ready to do its job and collect data about servers that need to be added in the Zabbix configuration.

--------------------------------------------------------------------------------

via: https://www.unixmen.com/monitoring-server-install-zabbix-ubuntu-16-04/

作者：[Giuseppe Molica ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/tutan/
[1]:https://www.unixmen.com/author/tutan/
[2]:http://www.zabbix.com/
[3]:https://www.unixmen.com/wp-content/uploads/2017/06/zabbix_logo.png
