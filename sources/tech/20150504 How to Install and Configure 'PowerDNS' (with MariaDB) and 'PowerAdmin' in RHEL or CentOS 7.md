How to Install and Configure ‘PowerDNS’ (with MariaDB) and ‘PowerAdmin’ in RHEL/CentOS 7
================================================================================
PowerDNS is a DNS server running on many Linux/Unix derivatives. It can be configured with different backends including BIND style zone files, relational databases or load balancing/failover algorithms. It can also be setup as a DNS recursor running as a separate process on the server.

The latest version of PowerDNS Authoritative server is 3.4.4, but the one available in the EPEL repository right now is 3.4.3. I would recommend installing the one for the EPEL repository due to the fact that this version is tested in CentOS and Fedora. That way you will also be able to easily update PowerDNS in future.

This article intends to show you how to install and setup master PowerDNS server with a MariaDB backend and the PowerAdmin – a friendly web interface managing tool for PowerDNS.

For the purpose of this article I will be using server with:

    Hostname: centos7.localhost 
    IP Address 192.168.0.102

### Step 1: Installing PowerDNS with MariaDB Backend ###

#### 1. First you need to enable the EPEL repository for your server simply use: ####

    # yum install epel-release.noarch 

![Enable Epel Repository](http://www.tecmint.com/wp-content/uploads/2015/04/Enable-Epel-Repository.png)
Enable Epel Repository

#### 2. The next step is to install the MariaDB server. This can be easily done by running the following command: ####

    # yum -y install mariadb-server mariadb

![Install MariaDB Server](http://www.tecmint.com/wp-content/uploads/2015/04/Install-MariaDB-Server.png)
Install MariaDB Server

#### 3. Next we will configure MySQL to enable and start upon system boot: ####

    # systemctl enable mariadb.service
    # systemctl start mariadb.service

![Enable Start MariaDB System Boot](http://www.tecmint.com/wp-content/uploads/2015/04/Enable-Start-MariaDB-System-Boot.png)
Enable Start MariaDB System Boot

#### 4. Now that the MySQL service is running, we will secure and setup a password for MariaDB by running: ####

    # mysql_secure_installation

#### Follow Instructions ####

    /bin/mysql_secure_installation: line 379: find_mysql_client: command not found
    
    NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
          SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!
    
    In order to log into MariaDB to secure it, we'll need the current
    password for the root user.  If you've just installed MariaDB, and
    you haven't set the root password yet, the password will be blank,
    so you should just press enter here.
    
    Enter current password for root (enter for none):  Press ENTER
    OK, successfully used password, moving on...
    
    Setting the root password ensures that nobody can log into the MariaDB
    root user without the proper authorisation.
    
    Set root password? [Y/n] y     
    New password:  ← Set New Password
    Re-enter new password:  ← Repeat Above Password
    Password updated successfully!
    Reloading privilege tables..
     ... Success!
    
    
    By default, a MariaDB installation has an anonymous user, allowing anyone
    to log into MariaDB without having to have a user account created for
    them.  This is intended only for testing, and to make the installation
    go a bit smoother.  You should remove them before moving into a
    production environment.
    
    Remove anonymous users? [Y/n] y ← Choose “y” to disable that user
     ... Success!
    
    Normally, root should only be allowed to connect from 'localhost'.  This
    ensures that someone cannot guess at the root password from the network.
    
    Disallow root login remotely? [Y/n] n ← Choose “n” for no
     ... skipping.
    
    By default, MariaDB comes with a database named 'test' that anyone can
    access.  This is also intended only for testing, and should be removed
    before moving into a production environment.
    
    Remove test database and access to it? [Y/n] y ← Choose “y” for yes
     - Dropping test database...
     ... Success!
     - Removing privileges on test database...
     ... Success!
    
    Reloading the privilege tables will ensure that all changes made so far
    will take effect immediately.
    
    Reload privilege tables now? [Y/n] y ← Choose “y” for yes
     ... Success!
    
    Cleaning up...
    
    All done!  If you've completed all of the above steps, your MariaDB
    installation should now be secure.
    
    Thanks for using MariaDB!

#### 5. Once MariaDB configuration done successfully, we can proceed further with the installation of PowerDNS. This is easily completed by running: ####

    # yum -y install pdns pdns-backend-mysql

![Install PowerDNS with MariaDB Backend](http://www.tecmint.com/wp-content/uploads/2015/04/Install-PowerDNS-with-MariaDB-Backend.png)
Install PowerDNS with MariaDB Backend

#### 6. The configuration file for PowerDNS is located in `/etc/pdns/pdns`, but before editing it, we will setup a MySQL database for PowerDNS service. First we will connect to the MySQL server and will create a database with name powerdns: ####

    # mysql -u root -p
    MariaDB [(none)]> CREATE DATABASE powerdns;

![Create PowerDNS Database](http://www.tecmint.com/wp-content/uploads/2015/04/Create-PowerDNS-Database.png)
Create PowerDNS Database

#### 7. Next, we will create a database user called powerdns: ####

    MariaDB [(none)]> GRANT ALL ON powerdns.* TO 'powerdns'@'localhost' IDENTIFIED BY ‘tecmint123’;
    MariaDB [(none)]> GRANT ALL ON powerdns.* TO 'powerdns'@'centos7.localdomain' IDENTIFIED BY 'tecmint123';
    MariaDB [(none)]> FLUSH PRIVILEGES;

![Create PowerDNS User](http://www.tecmint.com/wp-content/uploads/2015/04/Create-PowerDNS-User.png)
Create PowerDNS User

**Note**: Replace “tecmint123” with the actual password that you want to use for your setup.

#### 8. We proceed by creating the database tables used by PowerDNS. Execute those block by block: ####

    MariaDB [(none)]> USE powerdns;
    MariaDB [(none)]> CREATE TABLE domains (
    id INT auto_increment,
    name VARCHAR(255) NOT NULL,
    master VARCHAR(128) DEFAULT NULL,
    last_check INT DEFAULT NULL,
    type VARCHAR(6) NOT NULL,
    notified_serial INT DEFAULT NULL,
    account VARCHAR(40) DEFAULT NULL,
    primary key (id)
    );

![Create Table Domains for PowerDNS](http://www.tecmint.com/wp-content/uploads/2015/04/Create-Table-Domains-for-PowerDNS.png)
Create Table Domains for PowerDNS

    MariaDB [(none)]> CREATE UNIQUE INDEX name_index ON domains(name);
    MariaDB [(none)]> CREATE TABLE records (
    id INT auto_increment,
    domain_id INT DEFAULT NULL,
    name VARCHAR(255) DEFAULT NULL,
    type VARCHAR(6) DEFAULT NULL,
    content VARCHAR(255) DEFAULT NULL,
    ttl INT DEFAULT NULL,
    prio INT DEFAULT NULL,
    change_date INT DEFAULT NULL,
    primary key(id)
    );

![Create Index Domains for PowerDNS](http://www.tecmint.com/wp-content/uploads/2015/04/Create-Index-Domains-for-PowerDNS.png)
Create Index Domains for PowerDNS

    MariaDB [(none)]> CREATE INDEX rec_name_index ON records(name);
    MariaDB [(none)]> CREATE INDEX nametype_index ON records(name,type);
    MariaDB [(none)]> CREATE INDEX domain_id ON records(domain_id);

![Create Index Records](http://www.tecmint.com/wp-content/uploads/2015/04/Create-Records.png)
Create Index Records

    MariaDB [(none)]> CREATE TABLE supermasters (
    ip VARCHAR(25) NOT NULL,
    nameserver VARCHAR(255) NOT NULL,
    account VARCHAR(40) DEFAULT NULL
    );

![Create Table Supermaster](http://www.tecmint.com/wp-content/uploads/2015/04/Create-Table-Supermaster.png)
Create Table Supermaster

You can now exit the MySQL console by typing:

    MariaDB [(none)]> quit;

#### 9. Finally we can proceed with configuring our PowerDNS in a way that, it will use MySQL as backend. For that purpose open PowerDNS configuration file located at: ####

    # vim /etc/pdns/pdns.conf 

In that file look for the lines looking like this:

    #################################
    # launch        Which backends to launch and order to query them in
    #
    # launch=

Just after that put the following code:

    launch=gmysql
    gmysql-host=localhost
    gmysql-user=powerdns
    gmysql-password=user-pass
    gmysql-dbname=powerdns

Change “user-pass” with the actual password that you set earlier. Here is how my configuration looks like:

![Configure PowerDNS](http://www.tecmint.com/wp-content/uploads/2015/04/Configure-PowerDNS.png)
Configure PowerDNS

Save your change and exit from.

#### 10. Now we will start and add PowerDNS to the list of services starting at system boot: ####

    # systemctl enable pdns.service 
    # systemctl start pdns.service 

![Enable and Start PowerDNS](http://www.tecmint.com/wp-content/uploads/2015/04/Enable-and-Start-PowerDNS.png)
Enable and Start PowerDNS

At this point your PowerDNS server is up and running. For more information about PowerDNS you can refer to the manual available at [http://downloads.powerdns.com/documentation/html/index.html][1]

### Step 2: Installing PowerAdmin to Manage PowerDNS ###

#### 11. Now we will install PowerAdmin – a friendly web interface designed to manager PowerDNS servers. Since it is written in PHP, we will need to install PHP and a web server (Apache): ####

    # yum install httpd php php-devel php-gd php-imap php-ldap php-mysql php-odbc php-pear php-xml php-xmlrpc php-mbstring php-mcrypt php-mhash gettext

![Install Apache PHP](http://www.tecmint.com/wp-content/uploads/2015/04/Install-Apache-PHP.jpeg)
Install Apache PHP

PowerAdmin also requires two PEAR packages:

    # yum -y install php-pear-DB php-pear-MDB2-Driver-mysql 

![Install Pear](http://www.tecmint.com/wp-content/uploads/2015/04/Install-Pear.jpeg)
Install Pear

You can also refer to the following article for complete instructions how to install LAMP stack in CentOS 7:

- [Install LAMP in CentOS 7][2]

Once the install is complete, we will need to start and set Apache to start at system boot:

    # systemctl enable httpd.service
    # systemctl start httpd.service

![Enable Start Apache System Boot](http://www.tecmint.com/wp-content/uploads/2015/04/Enable-Start-Apache-System-Boot.png)
Enable Start Apache System Boot

#### 12. Now that all system requirements for running PowerAdmn are met, we can proceed and download the package. Since the default web directory for Apache is /var/www/html/, we will download the package in there. ####

    # cd /var/www/html/
    # wget http://downloads.sourceforge.net/project/poweradmin/poweradmin-2.1.7.tgz 
    # tar xfv poweradmin-2.1.7.tgz

![Download PowerAdmin](http://www.tecmint.com/wp-content/uploads/2015/04/Download-PowerAdmin.jpeg)
Download PowerAdmin

#### 13. Now, we can now start the web installer of PowerAdmin. Simply open: ####

    http://192.168.0.102/poweradmin-2.1.7/install/

This should bring the first step of the installation:

![Select Installation Language](http://www.tecmint.com/wp-content/uploads/2015/04/Select-Installation-Language.png)
Select Installation Language

The above page will ask you to choose the language for your PowerAdmin. Select the one you wish to use and click the “Go to step 2” button.

#### 14. The installer will expect you to have a PowerDNS database: ####

![PowerDNS Database](http://www.tecmint.com/wp-content/uploads/2015/04/PowerDNS-Database.png)
PowerDNS Database

#### 15. Since we already created one, we can proceed to the next step. You will be asked to enter the database details you setup earlier. You will also need to setup Poweradmin administrator password: ####

![Enter PowerDNS Database Settings](http://www.tecmint.com/wp-content/uploads/2015/04/PowerDNS.png)
Enter PowerDNS Database Settings

#### 16. Once you have input those, go to step 4. You will create a new user with a limited rights for Poweradmin. The fields that you need to enter here are: ####

- Username - username for hte PowerAdmin.
- Password – password for the above user.
- Hostmaster - When creating SOA records and you have not specified hostmaster, this value will be used.
- Secondary nameserver – the value will be used as primary name server when creating new DNS zones.

![PowerDNS Configuration Settings](http://www.tecmint.com/wp-content/uploads/2015/04/PowerDNS-Configuration-Settings.png)
PowerDNS Configuration Settings

#### 17. On the next step Poweradmin will ask you to create new database user with limited rights on the database tables. It will provide you with the code that you will need to put in a MySQL console: ####

![Create New Database User](http://www.tecmint.com/wp-content/uploads/2015/04/Create-New-Database-User.png)
Create New Database User

#### 18. Now open a terminal and run: ####

    # mysql -u root -p

Provide your password and execute the code provided by Poweradmin:

    MariaDB [(none)]> GRANT SELECT, INSERT, UPDATE, DELETE
    ON powerdns.*
    TO 'powermarin'@'localhost'
    IDENTIFIED BY '123qweasd';

![Grant Mysql Permissions to User](http://www.tecmint.com/wp-content/uploads/2015/04/Grant-Mysql-Permissions-to-User.png)
Grant Mysql Permissions to User

#### 19. Now go back to your browser and proceed to the next step. The installer will attempt to create its configuration file in /var/www/html/poweradmin-2.1.7/inc. ####

The file name is config.inc.php. In case the script is not able to write that file you can create it manually by copying the text and putting it in above mentioned file:

![Configuration Settings of PowerDNS](http://www.tecmint.com/wp-content/uploads/2015/04/PowerDNS-Configuration.png)
Configuration Settings of PowerDNS

#### 20. Now go to the last page where you will be informed that the installation is complete and will receive information how to access your Poweradmin install: ####

![PowerDNS Installation Completed](http://www.tecmint.com/wp-content/uploads/2015/04/PowerDNS-Installation-Completed.png)
PowerDNS Installation Completed

You can enable URLs used by other dynamic DNS providers by running:

    # cp install/htaccess.dist .htaccess 

For that purpose you will need to have mod_rewrite enabled in Apache’s configuration.

#### 21. Now it is important to remove the “install” folder from Poweradmin’s root directory with the following command: ####

    # rm -fr /var/www/html/poweradmin/install/

After that you can access your poweradmin at:

    http://192.168.0.102/poweradmin-2.1.7/

![PowerDNS Login](http://www.tecmint.com/wp-content/uploads/2015/04/PowerDNS-Login.png)
PowerDNS Login

After logging you should see the Poweradmin main page:

![PowerDNS Dashboard](http://www.tecmint.com/wp-content/uploads/2015/04/PowerDNS-Dashboard.png)
PowerDNS Dashboard

At this point your installation is complete and you are now ready to start managing your DNS zones.

### Step 3: How to Add, Edit and Delete DNS Zones in PowerDNS ###

#### 22. To add new master zone, simply click on the “Add master zone”: ####

![Add Master Zone](http://www.tecmint.com/wp-content/uploads/2015/04/Add-Master-Zone.png)
Add Master Zone

On the next page there are few things that you need to fill:

- Domain – domain for which you will be adding the zone.
- Owner – sets the owner of the DNS zone.
- Template – DNS template – leave to none.
- DNSSEC – Donany Name System Security Extensions (optional -check if you need it).

Click the “Add zone” button to add the DNS zone.

![Master DNS Zone](http://www.tecmint.com/wp-content/uploads/2015/04/Master-DNS-Zone.png)
Master DNS Zone

Now you can go back to the index page of Poweradmin by clicking the “Index” link. To review all existing DNS zones simply go to “List zones”:

![Check List of Zones](http://www.tecmint.com/wp-content/uploads/2015/04/Check-List-Zones.png)
Check List of Zones

You should now see a list of available DNS zones:

![Check List of DNS Zones](http://www.tecmint.com/wp-content/uploads/2015/04/DNS-Zones.png)
Check List of DNS Zones

#### 23. To edit an existing DNS zone or add new records click the edit icon: ####

![Edit DNS Zone](http://www.tecmint.com/wp-content/uploads/2015/04/Edit-DNS-Zone.png)
Edit DNS Zone

On the next page you will see the entries for the DNS zone you have chosen:

![Domain DNS Zone Entries](http://www.tecmint.com/wp-content/uploads/2015/04/Domain-DNS.png)
Domain DNS Zone Entries

#### 24. In here to add new DNS zone you will need to set the following information: ####

- Name – name for the entry. Only add the first part of the domain/subdomain, the rest will be added by Poweradmin.
- Type – choose the record type.
- Priority – priority of the record.
- TTL – Time To Live in seconds.

For the purpose of this article, I will add an A record for subdomain new.example.com that will resolve on IP address 192.168.0.102 with time to live 14400 seconds:

![Add New DNS Record](http://www.tecmint.com/wp-content/uploads/2015/04/Add-New-DNS-Record.png)
Add New DNS Record

Finally click the “Add record” button.

#### 25. If you wish to delete a DNS zone you can go back to the “List zone” page and click on the “Trash” icon next to the DNS zone which you wish to delete: ####

![Delete DNS Zone](http://www.tecmint.com/wp-content/uploads/2015/04/Delete-DNS-Zone.png)
Delete DNS Zone

Poweradmin will ask you if you are sure you want to delete the DNS zone. Simply click “Yes” to finish the deletion.

For more detailed instructions how to create, edit and delete zones you can refer to Poweradmin’s documentation at:

[https://github.com/poweradmin/poweradmin/wiki/Documentation][3]

I hope you have find this article interesting and useful. As always if you have any questions or comments please do not hesitate to submit them in the comment section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-powerdns-poweradmin-mariadb-in-centos-rhel/

作者：[Marin Todorov][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/marintodorov89/
[1]:http://downloads.powerdns.com/documentation/html/index.html
[2]:http://www.tecmint.com/install-lamp-in-centos-7/
[3]:https://github.com/poweradmin/poweradmin/wiki/Documentation