Install Zabbix Monitoring Server and Agent on Debian 9
======

Monitoring tools are used to continuously keep track of the status of the system and send out alerts and notifications if anything goes wrong. Also, monitoring tools help you to ensure that your critical systems, applications and services are always up and running. Monitoring tools are a supplement for your network security, allowing you to detect malicious traffic, where it's coming from and how to cancel it.

Zabbix is a free, open source and the ultimate enterprise-level monitoring tool designed for real-time monitoring of millions of metrics collected from tens of thousands of servers, virtual machines and network devices. Zabbix has been designed to skill from small environment to large environment. Its web front-end is written in PHP, backend is written in C and uses MySQL, PostgreSQL, SQLite, Oracle or IBM DB2 to store data. Zabbix provides graphing functionality that allows you to get an overview of the current state of specific nodes and the network

Some of the major features of the Zabbix are listed below:

  * Monitoring Servers, Databases, Applications, Network Devices, Vmware hypervisor, Virtual Machines and much more.
  * Special designed to support small to large environments to improve the quality of your services and reduce operating costs by avoiding downtime.
  * Fully open source, so you don't need to pay anything.
  * Provide user friendly web interface to do everything from a central location.
  * Comes with SNMP to monitor Network device and IPMI to monitor Hardware device.
  * Web-based front end that allows full system control from a browser.

This tutorial will walk you through the step by step instruction of how to install Zabbix Server and Zabbix agent on Debian 9 server. We will also explain how to add the Zabbix agent to the Zabbix server for monitoring.

#### Requirements

  * Two system with Debian 9 installed.
  * Minimum 1 GB of RAM and 10 DB of disk space required. Amount of RAM and Disk space depends on the number of hosts and the parameters that are being monitored.
  * A non-root user with sudo privileges setup on your server.



#### Getting Started

Before starting, it is necessary to update your server's package repository to the latest stable version. You can update it by just running the following command on both instances:

```
sudo apt-get update -y
sudo apt-get upgrade -y
```

Next, restart your system to apply these changes.

#### Install Apache, PHP and MariaDB

Zabbix runs on Apache web server, written in PHP and uses MariaDB/MySQL to store their data. So in order to install Zabbix, you will require Apache, MariaDB and PHP to work. First, install Apache, PHP and Other PHP modules by running the following command:

```
sudo apt-get install apache2 libapache2-mod-php7.0 php7.0 php7.0-xml php7.0-bcmath php7.0-mbstring -y
```

Next, you will need to add MariaDB repository to your system. Because, latest version of the MariaDB is not available in Debian 9 default repository.

You can add the repository by running the following command:

```
sudo apt-get install software-properties-common -y
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64] http://www.ftp.saix.net/DB/mariadb/repo/10.1/debian stretch main'
```

Next, update the repository by running the following command:

```
sudo apt-get update -y
```

Finally, install the MariaDB server with the following command:

```
sudo apt-get install mariadb-server -y
```

By default, MariaDB installation is not secured. So you will need to secure it first. You can do this by running the mysql_secure_installation script.

```
sudo mysql_secure_installation
```

Answer all the questions as shown below:
```

Enter current password for root (enter for none): Enter
Set root password? [Y/n]: Y
New password:
Re-enter new password:
Remove anonymous users? [Y/n]: Y
Disallow root login remotely? [Y/n]: Y
Remove test database and access to it? [Y/n]: Y
Reload privilege tables now? [Y/n]: Y

```

The above script will set the root password, remove test database, remove anonymous user and Disallow root login from a remote location.

Once the MariaDB installation is secured, start the Apache and MariaDB service and enable them to start on boot time by running the following command:

```
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl start mysql
sudo systemctl enable mysql
```

#### Installing Zabbix Server

By default, Zabbix is available in the Debian 9 repository, but it might be outdated. So it is recommended to install most recent version from the official Zabbix repositories. You can download and add the latest version of the Zabbix repository with the following command:

```
wget http://repo.zabbix.com/zabbix/3.0/debian/pool/main/z/zabbix-release/zabbix-release_3.0-2+stretch_all.deb
```

Next, install the downloaded repository with the following command:

```
sudo dpkg -i zabbix-release_3.0-2+stretch_all.deb
```

Next, update the package cache and install Zabbix server with web front-end and Mysql support by running the following command:

```
sudo apt-get update -y
sudo apt-get install zabbix-server-mysql zabbix-frontend-php -y
```

You will also need to install the Zabbix agent to collect data about the Zabbix server status itself:

```
sudo apt-get install zabbix-agent -y
```

After installing Zabbix agent, start the Zabbix agent service and enable it to start on boot time by running the following command:

```
sudo systemctl start zabbix-agent
sudo systemctl enable zabbix-agent
```

#### Configuring Zabbix Database

Zabbix uses MariaDB/MySQL as a database backend. So, you will need to create a MySQL database and User for zabbix installation:

First, log into MySQL shell with the following command:

```
mysql -u root -p
```

Enter your root password, then create a database for Zabbix with the following command:

```
MariaDB [(none)]> CREATE DATABASE zabbixdb character set utf8 collate utf8_bin;
```

Next, create a user for Zabbix, assign a password and grant all privileges on Zabbix database with the following command:

```
MariaDB [(none)]> CREATE user zabbix identified by 'password';
MariaDB [(none)]> GRANT ALL PRIVILEGES on zabbixdb.* to zabbixuser@localhost identified by 'password';
```

Next, flush the privileges with the following command:

```
MariaDB [(none)]> FLUSH PRIVILEGES;
```

Finally, exit from the MySQL shell with the following command:

```
MariaDB [(none)]> exit;
```

Next, import initial schema and data to the newly created database with the following command:

```
cd /usr/share/doc/zabbix-server-mysql*/
zcat create.sql.gz | mysql -u zabbix -p zabbixdb
```

#### Configuring Zabbix

Zabbix creates its own configuration file at `/etc/zabbix/apache.conf`. Edit this file and update the Timezone and PHP setting as per your need:

```
sudo nano /etc/zabbix/apache.conf
```

Change the file as shown below:
```
 php_value max_execution_time 300
 php_value memory_limit 128M
 php_value post_max_size 32M
 php_value upload_max_filesize 8M
 php_value max_input_time 300
 php_value always_populate_raw_post_data -1
 php_value date.timezone Asia/Kolkata

```

Save the file when you are finished.

Next, you will need to update the database details for Zabbix. You can do this by editing `/etc/zabbix/zabbix_server.conf` file:

```
sudo nano /etc/zabbix/zabbix_server.conf
```

Change the following lines:
```
DBHost=localhost
DBName=zabbixdb
DBUser=zabbixuser
DBPassword=password

```

Save and close the file when you are finished. Then restart all the services with the following command:

```
sudo systemctl restart apache2
sudo systemctl restart mysql
sudo systemctl restart zabbix-server
```

#### Configuring Firewall

Before proceeding, you will need to configure the UFW firewall to secure Zabbix server.

First, make sure UFW is installed on your system. Otherewise, you can install it by running the following command:

```
sudo apt-get install ufw -y
```

Next, enable the UFW firewall:

```
sudo ufw enable
```

Next, allow port 10050, 10051 and 80 through UFW with the following command:

```
sudo ufw allow 10050/tcp
sudo ufw allow 10051/tcp
sudo ufw allow 80/tcp
```

Finally, reload the firewall to apply these changes with the following command:

```
sudo ufw reload
```

Once the UFW firewall is configured you can proceed to install the Zabbix server via web interface.

#### Accessing Zabbix Web Installation Wizard

Once everything is fine, it's time to access Zabbix web installation wizard.

Open your web browser and navigate the <http://zabbix-server-ip/zabbix> URL , you will be redirected to the following page:

[![Zabbix 3.0][2]][3]

Click on the **Next step** button, you should see the following page:

[![Zabbix Prerequisites][4]][5]

Here, all the Zabbix pre-requisites are checked and verified, then click on the **Next step** button you should see the following page:

[![Database Configuration][6]][7]

Here, provide the Zabbix database name, database user and password then click on the **Next step** button, you should see the following page:

[![Zabbix Server Details][8]][9]

Here, specify the Zabbix server details and Port number then click on the **Next step** button, you should see the pre-installation summary of Zabbix Server in following page:

[![Installation summary][10]][11]

Next, click on the **Next step** button to start the Zabbix installation. Once the Zabbix installation is completed successfully, you should see the following page:

[![Zabbix installed successfully][12]][13]

Here, click on the **Finish** button, it will redirect to the Zabbix login page as shown below:

[![Login to Zabbix][14]][15]

Here, provide username as Admin and password as zabbix then click on the **Sign in** button. You should see the Zabbix server dashboard in the following image:

[![Zabbix Dashboard][16]][17]

Your Zabbix web installation is now finished.

#### Install Zabbix Agent

Now your Zabbix server is up and functioning. It's time to add Zabbix agent node to the Zabbix Server for Monitoring.

First, log into Zabbix agent instance and add the Zabbix repository with the following command:

```
wget http://repo.zabbix.com/zabbix/3.0/debian/pool/main/z/zabbix-release/zabbix-release_3.0-2+stretch_all.deb
sudo dpkg -i zabbix-release_3.0-2+stretch_all.deb
sudo apt-get update -y
```

Once you have configured Zabbix repository on your system, install the Zabbix agent by just running the following command:

```
sudo apt-get install zabbix-agent -y
```

Once the Zabbix agent is installed, you will need to configure Zabbix agent to communicate with Zabbix server. You can do this by editing the Zabbix agent configuration file:

```
sudo nano /etc/zabbix/zabbix_agentd.conf
```

Change the file as shown below:
```
 #Zabbix Server IP Address / Hostname

 Server=192.168.0.103

 #Zabbix Agent Hostname

 Hostname=zabbix-agent


```

Save and close the file when you are finished, then restart the Zabbix agent service and enable it to start on boot time with the following command:

```
sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent
```

#### Add Zabbix Agent Node to Zabbix Server

Next, you will need to add the Zabbix agent node to the Zabbix server for monitoring. First, log in to the Zabbix server web interface.

[![Zabbix UI][18]][19]

Next, Click on **Configuration --> Hosts -> Create Host**, you should see the following page:

[![Create Host in Zabbix][20]][21]

Here, specify the Hostname, IP address and Group names of Zabbix agent. Then navigate to Templates tab, you should see the following page:

[![specify the Hostname, IP address and Group name][22]][23]

Here, search appropriate templates and click on **Add** button, you should see the following page:

[![OS Template][24]][25]

Finally, click on **Add** button again. You will see your new host with green labels indicating that everything is working fine.

[![Hast successfully added to Zabbix][26]][27]

If you have extra servers and network devices that you want to monitor, log into each host, install the Zabbix agent and add each host from the Zabbix web interface.

#### Conclusion

Congratulations! you have successfully installed the Zabbix server and Zabbix agent in Debian 9 server. You have also added Zabbix agent node to the Zabbix server for monitoring. You can now easily list the current issue and past history, get the latest data of hosts, list the current problems and also visualized the collected resource statistics such as CPU load, CPU utilization, Memory usage, etc via graphs. I hope you can now easily install and configure Zabbix on Debian 9 server and deploy it on production environment. Compared to other monitoring software, Zabbix allows you to build your own maps of different network segments while monitoring many hosts. You can also monitor Windows host using Zabbix windows agent. For more information, you can refer the [Zabbix Documentation Page][28]. Feel free to ask me if you have any questions.


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/install-zabbix-monitoring-server-and-agent-on-debian-9/

作者：[Hitesh Jethva][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:/cdn-cgi/l/email-protection
[2]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-zabbix-welcome-page.png
[3]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-zabbix-welcome-page.png
[4]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-zabbix-pre-requisite-check-page.png
[5]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-zabbix-pre-requisite-check-page.png
[6]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-zabbix-db-config-page.png
[7]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-zabbix-db-config-page.png
[8]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-zabbix-server-details.png
[9]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-zabbix-server-details.png
[10]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-pre-installation-summary.png
[11]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-pre-installation-summary.png
[12]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-zabbix-install-success.png
[13]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-zabbix-install-success.png
[14]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-zabbix-login-page.png
[15]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-zabbix-login-page.png
[16]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-zabbix-welcome-dashboard.png
[17]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-zabbix-welcome-dashboard.png
[18]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-zabbix-welcome-dashboard1.png
[19]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-zabbix-welcome-dashboard1.png
[20]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-zabbix-agent-host1.png
[21]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-zabbix-agent-host1.png
[22]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-zabbix-agent-add-templates.png
[23]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-zabbix-agent-add-templates.png
[24]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-zabbix-agent-select-templates.png
[25]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-zabbix-agent-select-templates.png
[26]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/Screenshot-of-zabbix-agent-dashboard.png
[27]:https://www.howtoforge.com/images/install_zabbix_monitoring_server_and_agent_on_debian_9/big/Screenshot-of-zabbix-agent-dashboard.png
[28]:https://www.zabbix.com/documentation/3.2/
