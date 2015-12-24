translated by ivo-wang
How to Configure OpenNMS on CentOS 7.x
================================================================================
Systems management and monitoring services are very important that provides information to view important systems management information that allow us to to make decisions based on this information. To make sure the network is running at its best and to minimize the network downtime we need to improve application performance. So, in this article we will make you understand the step by step procedure to setup OpenNMS in your IT infrastructure. OpenNMS is a free open source enterprise level network monitoring and management platform that provides information to allow us to make decisions in regards to future network and capacity planning.

OpenNMS designed to manage tens of thousands of devices from a single server as well as manage unlimited devices using a cluster of servers. It includes a discovery engine to automatically configure and manage network devices without operator intervention. It is written in Java and is published under the GNU General Public License. OpenNMS is known for its scalability with its main functional areas in services monitoring, data collection using SNMP and event management and notifications.

### Installing OpenNMS RPM Repository ###

We will start from the installation of OpenNMS RPM for our CentOs 7.1 operating system as its available for most of the RPM-based distributions through Yum at their official link http://yum.opennms.org/ .

![OpenNMS RPM](http://blog.linoxide.com/wp-content/uploads/2015/08/18.png)

Then open your command line interface of CentOS 7.1 and login with root credentials to run the below command with “wget” to get the required RPM.

    [root@open-nms ~]# wget http://yum.opennms.org/repofiles/opennms-repo-stable-rhel7.noarch.rpm

![Download RPM](http://blog.linoxide.com/wp-content/uploads/2015/08/26.png)

Now we need to install this repository so that the OpenNMS package information could be available through yum for installation. Let’s run the command below with same root level credentials to do so.

    [root@open-nms ~]# rpm -Uvh opennms-repo-stable-rhel7.noarch.rpm

![Installing RPM](http://blog.linoxide.com/wp-content/uploads/2015/08/36.png)

### Installing Prerequisite Packages for OpenNMS ###

Now before we start installation of OpenNMS, let’s make sure you’ve done the following prerequisites.

**Install JDK 7**

Its recommended that you install the latest stable Java 7 JDK from Oracle for the best performance to integrate JDK in our YUM repository as a fallback. Let’s go to the Oracle Java 7 SE JDK download page, accept the license if you agree, choose the platform and architecture. Once it has finished downloading, execute it from the command-line and then install the resulting JDK rpm.

Else run the below command to install using the Yum from the the available system repositories.

    [root@open-nms ~]# yum install java-1.7.0-openjdk-1.7.0.85-2.6.1.2.el7_1

Once you have installed the Java you can confirm its installation using below command and check its installed version.

    [root@open-nms ~]# java -version

![Java version](http://blog.linoxide.com/wp-content/uploads/2015/08/46.png)

**Install PostgreSQL**

Now we will install the PostgreSQL that is a must requirement to setup the database for OpenNMS. PostgreSQL is included in all of the major YUM-based distributions. To install, simply run the below command.

    [root@open-nms ~]# yum install postgresql postgresql-server

![Installing Postgresql](http://blog.linoxide.com/wp-content/uploads/2015/08/55.png)

### Prepare the Database for OpenNMS ###

Once you have installed PostgreSQL, now you'll need to make sure that PostgreSQL is up and active. Let’s run the below command to first initialize the database and then start its services.

    [root@open-nms ~]# /sbin/service postgresql initdb
    [root@open-nms ~]# /sbin/service postgresql start

![start DB](http://blog.linoxide.com/wp-content/uploads/2015/08/64.png)

Now to confirm the status of your PostgreSQL database you can run the below command.

    [root@open-nms ~]# service postgresql status

![PostgreSQL status](http://blog.linoxide.com/wp-content/uploads/2015/08/74.png)

To ensure that PostgreSQL will start after a reboot, use the “systemctl”command to enable start on bootup using below command.

    [root@open-nms ~]# systemctl enable postgresql
    ln -s '/usr/lib/systemd/system/postgresql.service' '/etc/systemd/system/multi-user.target.wants/postgresql.service'

### Configure PostgreSQL ###

Locate the Postgres “data” directory. Often this is located in /var/lib/pgsql/data directory and Open the postgresql.conf file in text editor and configure the following parameters as shown.

    [root@open-nms ~]# vim /var/lib/pgsql/data/postgresql.conf

----------

    #------------------------------------------------------------------------------
    # CONNECTIONS AND AUTHENTICATION
    #------------------------------------------------------------------------------

    listen_addresses = 'localhost'
    max_connections = 256

    #------------------------------------------------------------------------------
    # RESOURCE USAGE (except WAL)
    #------------------------------------------------------------------------------

    shared_buffers = 1024MB

**User Access to the Database**

PostgreSQL only allows you to connect if you are logged in to the local account name that matches the PostgreSQL user. Since OpenNMS runs as root, it cannot connect as a "postgres" or "opennms" user by default, so we have to change the configuration to allow user access to the database by opening the below configuration file.

    [root@open-nms ~]# vim /var/lib/pgsql/data/pg_hba.conf

Update the configuration file as shown below and change the METHOD settings from "ident" to "trust"

![user access to db](http://blog.linoxide.com/wp-content/uploads/2015/08/84.png)

Write and quit the file to make saved changes and then restart PostgreSQL services.

    [root@open-nms ~]# service postgresql restart

### Starting OpenNMS Installation ###

Now we are ready go with installation of OpenNMS as we have almost don with its prerequisites. Using the YUM packaging system will download and install all of the required components and their dependencies, if they are not already installed on your system.
So let's riun th belwo command to start OpenNMS installation that will pull everything you need to have a working OpenNMS, including the OpenNMS core, web UI, and a set of common plugins.

    [root@open-nms ~]# yum -y install opennms

![OpenNMS Installation](http://blog.linoxide.com/wp-content/uploads/2015/08/93.png)

The above command will ends up with successful installation of OpenNMS and its derivative packages.

### Configure JAVA for OpenNMS ###

In order to integrate the default version of Java with OpenNMS we will run the below command.

    [root@open-nms ~]# /opt/opennms/bin/runjava -s

![java integration](http://blog.linoxide.com/wp-content/uploads/2015/08/102.png)

### Run the OpenNMS installer ###

Now it's time to start the OpenNMS installer that will create and configure the OpenNMS database, while the same command will be used in case we want to update it to the latest version. To do so, we will run the following command.

    [root@open-nms ~]# /opt/opennms/bin/install -dis

The above install command will take many options with following mechanism.

-d - to update the database
-i - to insert any default data that belongs in the database
-s - to create or update the stored procedures OpenNMS uses for certain kinds of data access

    ==============================================================================
    OpenNMS Installer
    ==============================================================================

    Configures PostgreSQL tables, users, and other miscellaneous settings.

    DEBUG: Platform is IPv6 ready: true
    - searching for libjicmp.so:
    - trying to load /usr/lib64/libjicmp.so: OK
    - searching for libjicmp6.so:
    - trying to load /usr/lib64/libjicmp6.so: OK
    - searching for libjrrd.so:
    - trying to load /usr/lib64/libjrrd.so: OK
    - using SQL directory... /opt/opennms/etc
    - using create.sql... /opt/opennms/etc/create.sql
    17:27:51.178 [Main] INFO org.opennms.core.schema.Migrator - PL/PgSQL call handler exists
    17:27:51.180 [Main] INFO org.opennms.core.schema.Migrator - PL/PgSQL language exists
    - checking if database "opennms" is unicode... ALREADY UNICODE
    - Creating imports directory (/opt/opennms/etc/imports... OK
    - Checking for old import files in /opt/opennms/etc... DONE
    INFO 16/08/15 17:27:liquibase: Reading from databasechangelog
    Installer completed successfully!

    ==============================================================================
    OpenNMS Upgrader
    ==============================================================================

    OpenNMS is currently stopped
    Found upgrade task SnmpInterfaceRrdMigratorOnline
    Found upgrade task KscReportsMigrator
    Found upgrade task JettyConfigMigratorOffline
    Found upgrade task DataCollectionConfigMigratorOffline
    Processing RequisitionsMigratorOffline: Remove non-ip-snmp-primary and non-ip-interfaces from requisitions: NMS-5630, NMS-5571
    - Running pre-execution phase
    Backing up: /opt/opennms/etc/imports
    - Running post-execution phase
    Removing backup /opt/opennms/etc/datacollection.zip

    Finished in 0 seconds

    Upgrade completed successfully!

### Firewall configurations to Allow OpenNMS ###

Here we have to allow OpenNMS management interface port 8980 through firewall or router to access the management web interface from the remote systems. So use the following commands to do so.

    [root@open-nms etc]# firewall-cmd --permanent --add-port=8980/tcp
    [root@open-nms etc]# firewall-cmd --reload

### Start OpenNMS and Login to Web Interface ###

Let's start OpenNMS service and enable to it start at each bootup by using the below command.

    [root@open-nms ~]#systemctl start opennms
    [root@open-nms ~]#systemctl enable opennms

Once the services are up are ready to go with its web management interface. Open your web browser and access it with your server's IP address and 8980 port.

http://servers_ip:8980/

Give the username and password where as the default username and password is admin/admin.

![opennms login](http://blog.linoxide.com/wp-content/uploads/2015/08/opennms-login.png)

After successful authentication with your provided username and password you will be directed towards the the Home page of OpenNMS where you can configure the new monitoring devices/nodes/services etc.

![opennms home](http://blog.linoxide.com/wp-content/uploads/2015/08/opennms-home.png)

### Conclusion ###

Congratulations! we have successfully setup OpenNMS on CentOS 7.1. So, at the end of this tutorial, you are now able to install and configure OpenNMS with its prerequisites that included PostgreSQL and JAVA setup. So let's enjoy with the great network monitoring system with open source roots using OpenNMS that provide a bevy of features at no cost than their high-end competitors, and can scale to monitor large numbers of network nodes.

--------------------------------------------------------------------------------

via: http://linoxide.com/monitoring-2/install-configure-opennms-centos-7-x/

作者：[Kashif Siddique][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
