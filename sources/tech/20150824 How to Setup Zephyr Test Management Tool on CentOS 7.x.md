How to Setup Zephyr Test Management Tool on CentOS 7.x
================================================================================
Test Management encompasses anything and everything that you need to do as testers. Test management tools are used to store information on how testing is to be done, plan testing activities and report the status of quality assurance activities. So in this article we will illustrate you about the setup of Zephyr test management tool that includes everything needed to manage the test process can save testers hassle of installing separate applications that are necessary for the testing process. Once you have done with its setup you will be able to track bugs, defects and allows the project tasks for collaboration with your team as you can easily share and access the data across multiple project teams for communication and collaboration throughout the testing process.

### Requirements for Zephyr ###

We are going to install and run Zephyr under the following set of its minimum resources. Resources can be enhanced as per your infrastructure requirements. We will be installing Zephyr on the CentOS-7 64-bit while its binary distributions are available for almost all Linux operating systems.

注：表格
<table width="669" style="height: 231px;">
<tbody>
<tr>
<td width="660" colspan="3"><strong>Zephyr test management tool</strong></td>
</tr>
<tr>
<td width="140"><strong>Linux OS</strong></td>
<td width="312">CentOS Linux 7 (Core), 64-bit</td>
<td width="209"></td>
</tr>
<tr>
<td width="140"><strong>Packages</strong></td>
<td width="312">JDK 7 or above ,&nbsp; Oracle JDK 6 update</td>
<td width="209">No Prior Tomcat, MySQL installed</td>
</tr>
<tr>
<td width="140"><strong>RAM</strong></td>
<td width="312">4 GB</td>
<td width="209">Preferred 8 GB</td>
</tr>
<tr>
<td width="140"><strong>CPU</strong></td>
<td width="521" colspan="2">2.0 GHZ or Higher</td>
</tr>
<tr>
<td width="140"><strong>Hard Disk</strong></td>
<td width="521" colspan="2">30 GB , Atleast 5GB must be free</td>
</tr>
</tbody>
</table>

You must have super user (root) access to perform the installation process for Zephyr and make sure that you have properly configured yout network with static IP address and its default set of ports must be available and allowed in the firewall where as the Port 80/443, 8005, 8009, 8010 will used by tomcat and Port 443 or 2099 will used within Zephyr by flex for the RTMP protocol.

### Install Java JDK 7 ###

Java JDK 7 is the basic requirement for the installation of Zephyr, if its not already installed in your operating system then do the following to install Java and setup its JAVA_HOME environment variables to be properly configured.

Let’s issue the below commands to install Java JDK 7.

    [root@centos-007 ~]# yum install java-1.7.0-openjdk-1.7.0.79-2.5.5.2.el7_1

----------

    [root@centos-007 ~]# yum install java-1.7.0-openjdk-devel-1.7.0.85-2.6.1.2.el7_1.x86_64

Once your java is installed including its required dependencies, run the following commands to set its JAVA_HOME environment variables.

    [root@centos-007 ~]# export JAVA_HOME=/usr/java/default
    [root@centos-007 ~]# export PATH=/usr/java/default/bin:$PATH

Now check the version of java to verify its installation with following command.

    [root@centos-007 ~]# java –version

----------

    java version "1.7.0_79"
    OpenJDK Runtime Environment (rhel-2.5.5.2.el7_1-x86_64 u79-b14)
    OpenJDK 64-Bit Server VM (build 24.79-b02, mixed mode)

The output shows that we we have successfully installed OpenJDK Java verion 1.7.0_79.

### Install MySQL 5.6.X ###

If you have other MySQLs on the machine then it is recommended to remove them and
install this version on top of them or upgrade their schemas to what is specified. As this specific major/minor (5.6.X) version of MySQL is required with the root username as a prerequisite of Zephyr.

To install MySQL 5.6 on CentOS-7.1 lets do the following steps:

Download the rpm package, which will create a yum repo file for MySQL Server installation.

    [root@centos-007 ~]# yum install wget
    [root@centos-007 ~]# wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm

Now Install this downloaded rpm package by using rpm command.

    [root@centos-007 ~]# rpm -ivh mysql-community-release-el7-5.noarch.rpm

After the installation of this package you will get two new yum repo related to MySQL. Then by using yum command, now we will install MySQL Server 5.6 and all dependencies will be installed itself.

    [root@centos-007 ~]# yum install mysql-server

Once the installation process completes, run the following commands to start mysqld services and check its status whether its active or not.

    [root@centos-007 ~]# service mysqld start
    [root@centos-007 ~]# service mysqld status

On fresh installation of MySQL Server. The MySQL root user password is blank.
For good security practice, we should reset the password MySQL root user.

Connect to MySQL using the auto-generated empty password and change the
root password.

    [root@centos-007 ~]# mysql
    mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('your_password');
    mysql> flush privileges;
    mysql> quit;

Now we need to configure the required database parameters in the default configuration file of MySQL. Let's open its file located in "/etc/" folder and update it as follow.

    [root@centos-007 ~]# vi /etc/my.cnf

----------

    [mysqld]
    datadir=/var/lib/mysql
    socket=/var/lib/mysql/mysql.sock
    symbolic-links=0

    sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
    max_allowed_packet=150M
    max_connections=600
    default-storage-engine=INNODB
    character-set-server=utf8
    collation-server=utf8_unicode_ci

    [mysqld_safe]
    log-error=/var/log/mysqld.log
    pid-file=/var/run/mysqld/mysqld.pid
    default-storage-engine=INNODB
    character-set-server=utf8
    collation-server=utf8_unicode_ci

    [mysql]
    max_allowed_packet = 150M
    [mysqldump]
    quick

Save the changes made in the configuration file and restart mysql services.

    [root@centos-007 ~]# service mysqld restart

### Download Zephyr Installation Package ###

We done with installation of required packages necessary to install Zephyr. Now we need to get the binary distributed package of Zephyr and its license key. Go to official download link of Zephyr that is http://download.yourzephyr.com/linux/download.php give your email ID and click to download.

![Zephyr Download](http://blog.linoxide.com/wp-content/uploads/2015/08/13.png)

Then and confirm your mentioned Email Address and you will get the Zephyr Download link and its License Key link. So click on the provided links and choose the appropriate version of your Operating system to download the binary installation package and its license file to the server.

We have placed it in the home directory and modify its permissions to make it executable.

![Zephyr Binary](http://blog.linoxide.com/wp-content/uploads/2015/08/22.png)

### Start Zephyr Installation and Configuration ###

Now we are ready to start the installation of Zephyr by executing its binary installation script as below.

    [root@centos-007 ~]# ./zephyr_4_7_9213_linux_setup.sh –c

Once you run the above command, it will check for the Java environment variables to be properly setup and configured. If there's some mis-configuration you might the error like.

    testing JVM in /usr ...
    Starting Installer ...
    Error : Either JDK is not found at expected locations or JDK version is mismatched.
    Zephyr requires Oracle Java Development Kit (JDK) version 1.7 or higher.

Once you have properly configured your Java, then it will start installation of Zephyr and asks to press "o" to proceed and "c" to cancel the setup. Let's type "o" and press "Enter" key to start installation.

![install zephyr](http://blog.linoxide.com/wp-content/uploads/2015/08/32.png)

The next option is to review all the requirements for the Zephyr setup and Press "Enter" to move forward to next option.

![zephyr requirements](http://blog.linoxide.com/wp-content/uploads/2015/08/42.png)

To accept the license agreement type "1" and Press Enter.

    I accept the terms of this license agreement [1], I do not accept the terms of this license agreement [2, Enter]

Here we need to choose the appropriate destination location where we want to install the zephyr and choose the default ports, if you want to choose other than default ports, you are free to mention here.

![installation folder](http://blog.linoxide.com/wp-content/uploads/2015/08/52.png)

Then customize the mysql database parameters and give the right paths to the configurations file. You might the an error at this point as shown below.

    Please update MySQL configuration. Configuration parameter max_connection should be at least 500 (max_connection = 500) and max_allowed_packet should be at least 50MB (max_allowed_packet = 50M).

To overcome this error make sure that you have configure the "max_connection" and "max_allowed_packet" limits properly in the mysql configuration file. So confirm these settings, connect to mysql server and run the commands as shown.

![mysql connections](http://blog.linoxide.com/wp-content/uploads/2015/08/62.png)

Once you have configured your mysql database properly, it will extract the configuration files to complete the setup.

![mysql customization](http://blog.linoxide.com/wp-content/uploads/2015/08/72.png)

The installation process completes with successful installation of Zephyr 4.7 on your computer. To Launch Zephyr Desktop type "y" to finish Zephyr installation.

![launch zephyr](http://blog.linoxide.com/wp-content/uploads/2015/08/82.png)

### Launch Zephyr Desktop ###

Open your web browser to launch Zephyr Desktop with your localhost IP adress and you will be direted to the Zephyr Desktop.

    http://your_server_IP/zephyr/desktop/

![Zephyr Desktop](http://blog.linoxide.com/wp-content/uploads/2015/08/91.png)

From your Zephyr Dashboard click on the "Test Manager" and login with the dault user name and password that is "test.manager".

![Test Manage Login](http://blog.linoxide.com/wp-content/uploads/2015/08/test_manager_login.png)

Once you are loged in you will be able to configure your administrative settings as shown. So choose the settings you wish to put according to your environment.

![Test Manage Administration](http://blog.linoxide.com/wp-content/uploads/2015/08/test_manage_admin.png)

Save the settings after you have done with your administrative settings, similarly do the settings of resources management and project setup and start using Zephyr as a complete set of your testing management tool. You check and edit the status of your administrative settings from the Department Dashboard Management as shown.

![zephyr dashboard](http://blog.linoxide.com/wp-content/uploads/2015/08/dashboard.png)

### Conclusion ###

Cheers! we have done with the complete setup of Zephyr installation setup on Centos 7.1. We hope you are now much aware of Zephyr Test management tool which offer the prospect of streamlining the testing process and allow quick access to data analysis, collaborative tools and easy communication across multiple project teams. Feel free to comment us if you find any difficulty while you are doing it in your environment.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-zephyr-tool-centos-7-x/

作者：[Kashif Siddique][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/