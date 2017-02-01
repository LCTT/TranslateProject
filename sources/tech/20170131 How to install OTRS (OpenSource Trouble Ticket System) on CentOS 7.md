How to install OTRS (OpenSource Trouble Ticket System) on CentOS 7
============================================================

### On this page

1.  [The Environment][1]
2.  [Preparation][2]
3.  [Install MariaDB on Centos 7][3]
4.  [Install EPEL ][4]
5.  [Install OTRS][5]
6.  [Configure OTRS on CentOS 7][6]

OTRS (open-source trouble ticket system software) is a sophisticated open source software used by companies to improve their operation related to customer support, help desk, call centers and more. OTRS is written in PERL and provides the following important features:

*   Customers can register and create/interact with a Ticket via the customer portal and by email, phone, and fax with each queue (Attendants/Technicians post box).
*   Tickets can be managed by their priority, assignment, transmission and follow-up. A ticket can be split, merged, bulk actions can be applied, and links to each other and notifications can be set. Services can be configurated through the service catalog.
*   To increase the team capacity, auto email (automatic answers), text templates and signatures can be configured. The system supports notes and attachments on tickets.
*   Others capabilities include: statistics and reports (CSV/PDF), SLA and many other features.

### The Environment

This article covers the OTRS 5 installation and basic configuration. This article was writen based on the following enviroment: A Virtual Box VM with CENTOS 7 Minimal, 2GB RAM, 8GB HD and 2 network interfaces (host only and NAT).

### Preparation

Assuming that you use a fresh installation of Centos 7 Minimal,  before to install OTRS, run the following command to update the system and install aditional packages: 

```
yum update
```

Transaction Summary ================================================================================ Install 1 Package Upgrade 39 Packages Total download size: 91 M Is this ok [y/d/N]: **y**

Install a text editor or use VI. In this article we use VIM, run the following command to install it:

```
yum install vim
```

To install the WGET package, run the following command:

```
yum install wget
```

To configure the Centos 7 network, run the following command to open the NMTUI (Network Manager Text User Interface) tool and edit the interfaces and hostname if nescessary:

```
nmtui
```

[
 ![](https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/OTRS_How_To_Alexandre_Costa.jpg) 
][7]

 After setup of network settings and hostname on CentOS 7, run the following command to apply the changes:

```
service networks restart
```

To verify the network information, run the following command:

```
ip addr
```

The output looks like this on my system:

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether 08:00:27:67:bc:73 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic enp0s3
       valid_lft 84631sec preferred_lft 84631sec
    inet6 fe80::9e25:c982:1091:90eb/64 scope link 
       valid_lft forever preferred_lft forever
3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether 08:00:27:68:88:f3 brd ff:ff:ff:ff:ff:ff
    inet 192.168.56.101/24 brd 192.168.56.255 scope global dynamic enp0s8
       valid_lft 1044sec preferred_lft 1044sec
    inet6 fe80::a00:27ff:fe68:88f3/64 scope link 
       valid_lft forever preferred_lft forever 
```

Disable SELINUX (Security Enhanced Linux) on Centos 7, edit the following config file:

```
vim /etc/selinux/config
```

```
"/etc/selinux/config" 14L, 547C# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=enforcing
# SELINUXTYPE= can take one of three two values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes are prootected. 
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted  
```

Change the value **enforcing** of directive SELINUX to **disabled**, save the file and reboot the server.

To check the status of SELinux on Centos 7, run the following command:

```
getenforce
```

The output must be:

```
Disabled
```

### Install MariaDB on Centos 7

To install MariaDB on Centos 7, run the following command:

```
yum -y install mariadb-server
```

Create the file with the name **zotrs.cnf** in the following directory:

```
/etc/my.cnf.d/
```

To create and edit the file, run the following command:

```
vim /etc/my.cnf.d/zotrs.cnf
```

Fill the file with the following content and save it:

```
max_allowed_packet = 20M
query_cache_size = 32M
innodb_log_file_size = 256M
```

To start MariaDB, run the following command:

```
systemctl start mariadb
```

To increase the security of MariaDB, run the following command:

```
/usr/bin/mysql_secure_installation
```

Setup the options accordind the following output:

```
NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user.  If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none):<Press Enter>
```

```
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.

Set root password? [Y/n] <Press Y>
```

Set the root password:

```
New password: 
Re-enter new password: 
Password updated successfully!
Reloading privilege tables..
 ... Success!

By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] <Press Y>
```

```
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] <Choose acording your needs>
```

```
 ... Success!

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] <Press Y>
```

```
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] <Press Y>
```

```
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!

```

Setup MariaDB to start up automatically at boot time:

systemctl enable mariadb.service

To download OTRS, run the following command:

```
wget http://ftp.otrs.org/pub/otrs/RPMS/rhel/7/otrs-5.0.15-01.n oarch.rpm
```

### Install EPEL 

Before we install OTRS, setup the EPEL repositoy on Centos 7\. Run the following command to do so:

```
[root@centos7 ~]# yum -y http://mirror.globo.com/epel/7/x86_64/e/epel-r release-7-9.noarch.rpm
```

### Install OTRS

Install OTRS with the following command:

```
yum install -nogpgcheck otrs-5.0.15-01.noarch.rpm
```

A list of software package will be installed, eg. Apache and all dependencies will be resolved automatically, at to the end of output press Y:

```
Transaction Summary
================================================================================
Install  1 Package (+143 Dependent packages)

Total size: 148 M
Total download size: 23 M
Installed size: 181 M
Is this ok [y/d/N]: y 
```

To start Apache (httpd), run the following command:

```
systemctl start httpd.service
```

To enable Apache (httpd) startup with systemd on Centos7, run the following command:

```
systemctl enable httpd.service
```

Enable SSL in Apache and configure a SelfSigned Certificate. Install the Mod_SSL module for the Apache HTTP Server, run the following command:

```
yum -y install mod_ssl
```

To generate a self-signed SSL certificate, go to the following directory:

```
cd /etc/pki/tls/certs/
```

And run the following command to generate the key (centos7.key is the name of my certificate, feel free to change it):

```
make centos7.key
```

```
umask 77 ; \ /usr/bin/openssl genrsa -aes128 2048 > centos7.key Generating RSA private key, 2048 bit long modulus .+++ .........................................................................................+++ e is 65537 (0x10001) Enter pass phrase: **<Insert your Own Password>**

Verifying - Enter pass phrase:**<Retype the Password>**
```

To generate the server SSL private key with OpenSSL, run the following command:

```
openssl rsa -in centos7.key -out centos7.key
```

```
Enter pass phrase for centos7.key: **<Type the Password> **writing RSA key
```

Run the following command to create the CSR (Certificate Signing Request) file (centos7.csr is the name of my certificate, feel free to change it):

```
make centos7.csr
```

Fill the questions acording your needs:

```
umask 77 ; \ /usr/bin/openssl req -utf8 -new -key centos7.key -out centos7.csr You are about to be asked to enter information that will be incorporated into your certificate request. What you are about to enter is what is called a Distinguished Name or a DN. There are quite a few fields but you can leave some blank For some fields there will be a default value, If you enter '.', the field will be left blank. -----

Country Name (2 letter code) [XX]:

State or Province Name (full name) []:

Locality Name (eg, city) [Default City]:

Organization Name (eg, company) [Default Company Ltd]:

Organizational Unit Name (eg, section) []:

Centos7 Common Name (eg, your name or your server's hostname) []:

Email Address []:

Please enter the following 'extra' attributes to be sent with your certificate request A challenge password []: **<press enter>**

An optional company name []:
```

Generate a CSR (Certificate Signing Request) for the server with the OpenSSL tool:

```
openssl x509 -in centos7.csr -out centos7.crt -req -signkey centos7.key
```

The output is:

```
Signature ok subject=/C=BR/ST=SP/L=Campinas/O=Centos7/OU=Centos7/CN=centos7.local Getting Private key
```

Before we edit the ssl.conf file, make a copy of the file with the following command:

```
cp /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.conf.old
```

Then edit the file:

```
vim /etc/httpd/conf.d/ssl.conf
```

Find the following directives, uncomment each one and edit them like this:

```
SSLCertificateKeyFile /etc/pki/tls/certs/centos7.key

SSLCertificateFile /etc/pki/tls/certs/centos7.csr

SSLProtocol -All +TLSv1 +TLSv1.1 +TLSv1.2

ServerName centos7.local:443
```

Restart Apache with the following command:

```
systemctl restart httpd
```

To force OTRS to run in https mode, edit the following file:

```
vim /etc/httpd/conf/httpd.conf
```

At the end of file, uncoment the following directive:

```
IncludeOptional conf.d/*.conf
```

Edit the file zzz_otrs.conf:

```
vim /etc/httpd/conf.d/zzz_otrs.conf
```

After the line 26 (before the line module  mod_version.c) add the following directives:

```
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}
```

Restart Apache:

```
[root@centos7 ~]# systemctl restart httpd
```

To use extended features in OTRS, we have to install some PERL modules. Run the following command to install them:

```
yum -y install "perl(Text::CSV_XS)" "perl(Crypt::Eksblowfish::Bcrypt)" "perl(YAML::XS)" "perl(JSON::XS)" "perl(Encode::HanExtra)" "perl(Mail::IMAPClient)" "perl(ModPerl::Util)"
```

The OTRS system has a tool to check the PERL modules, run it like this to verify the system requirements:

```
cd /opt/otrs/bin
```

and run:

```
./otrs.CheckModules.pl
```

The output for our configuration must be:

```
o Apache::DBI......................ok (v1.12) o Apache2::Reload..................ok (v0.13) o Archive::Tar.....................ok (v1.92) o Archive::Zip.....................ok (v1.30) o Crypt::Eksblowfish::Bcrypt.......ok (v0.009) o Crypt::SSLeay....................ok (v0.64) o Date::Format.....................ok (v2.24) o DBI..............................ok (v1.627) o DBD::mysql.......................ok (v4.023) o DBD::ODBC........................Not installed! (optional - Required to connect to a MS-SQL database.) o DBD::Oracle......................Not installed! (optional - Required to connect to a Oracle database.) o DBD::Pg..........................Not installed! Use: 'yum install "perl(DBD::Pg)"' (optional - Required to connect to a PostgreSQL database.) o Digest::SHA......................ok (v5.85) o Encode::HanExtra.................ok (v0.23) o IO::Socket::SSL..................ok (v1.94) o JSON::XS.........................ok (v3.01) o List::Util::XS...................ok (v1.27) o LWP::UserAgent...................ok (v6.13) o Mail::IMAPClient.................ok (v3.37) o IO::Socket::SSL................ok (v1.94) o ModPerl::Util....................ok (v2.000010) o Net::DNS.........................ok (v0.72) o Net::LDAP........................ok (v0.56) o Template.........................ok (v2.24) o Template::Stash::XS..............ok (undef) o Text::CSV_XS.....................ok (v1.00) o Time::HiRes......................ok (v1.9725) o Time::Piece......................ok (v1.20_01) o XML::LibXML......................ok (v2.0018) o XML::LibXSLT.....................ok (v1.80) o XML::Parser......................ok (v2.41) o YAML::XS.........................ok (v0.54)
```

To start the OTRS Daemon with the "otrs" user, run the following command:

```
su -c "/opt/otrs/bin/otrs.Daemon.pl start" -s /bin/bash otrs
```

To disable the CentOS 7 firewall, run the following command:

```
systemctl stop firewalld
```

To disable CentOS 7 Firewall to start up automaticaly, run:

```
systemctl disable firewalld.service
```

Start the OTRS Daemon with:

```
su -c "/opt/otrs/bin/otrs.Daemon.pl start" -s /bin/bash otrsCron.sh
```

The output of command must be:

```
/opt/otrs/bin Cron.sh - start/stop OTRS cronjobs Copyright (C) 2001-2012 OTRS AG, http://otrs.org/ (using /opt/otrs) done
```

If you want to check the OTRS Daemon status, run the following command:

```
su -c "/opt/otrs/bin/otrs.Daemon.pl status" -s /bin/bash otrsCron.sh
```

Configuring OTRS in the crontab. Change the user root to otrs and start to edit the crontab:

```
su otrs

crontab -e
```

Fill the crontab with the following content and save it:

```
# --
# Copyright (C) 2001-2016 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

# Who gets the cron emails?
MAILTO="root@localhost"
# --
# Copyright (C) 2001-2016 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

# check OTRS daemon status
*/5 * * * *    $HOME/bin/otrs.Daemon.pl start >> /dev/null
```

### Configure OTRS on CentOS 7

Open a web browser and open the URL [https://centos7.local/otrs/installer.pl][8]. Remember, centos7.local is the name of my server, insert your hostname or IP address. The first screen shows the 4 steps to conclude the OTRS installation, press Next.  

[
 ![OTRS installation screen](https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/OTRS_How_To_Alexandre_Costa.13_.jpg) 
][9]

License: to continue, read and accept the license to continue:

[
 ![Accept the license and continue](https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/OTRS_How_To_Alexandre_Costa.14_.jpg) 
][10] 

Database Selection: select  the option **MySQL** and in the Install Type, mark the Create a new database for OTRS option and click on the next button:

[
 ![Select database type mysql](https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/OTRS_How_To_Alexandre_Costa.15_.jpg) 
][11]

Configure MySQL: fill the fields User, Password and Host (remember the data of the MariaDB configuration that we made) and press check database settings:

[
 ![Insert database login details](https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/OTRS_How_To_Alexandre_Costa.16_.jpg) 
][12]

The OTRS installer will create the database in MariaDB, press next button:

[
 ![Create OTRS database](https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/OTRS_How_To_Alexandre_Costa.17_.jpg) 
][13]

OTRS database created successfully: 

[
 ![OTRS Database created](https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/OTRS_How_To_Alexandre_Costa.18_.jpg) 
][14]

Config system settings: fill the fields with your own information and press next:

[
 ![Set the personal config details](https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/OTRS_How_To_Alexandre_Costa.19_.jpg) 
][15]

OTRS E-mail configuration: fill in the fields acording your e-mail server. In my setup, for outbound email I use SMPTTLS and port 587, for inbound email, I use pop3, you will need an e-mail account. Check mail configuration or skip this step:

[
 ![Email setup in OTRS](https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/OTRS_How_To_Alexandre_Costa.21_.jpg) 
][16]

To finish, take a note about the user and password to access the OTRS, after login you can change the password:

[
 ![OTRS Username and password](https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/OTRS_How_To_Alexandre_Costa.23_.jpg) 
][17]

The OTRS url login is [https://centos7.local/otrs/index.pl?][18]. Remember, centos7.local is the name of my server, insert your hostnamen or IP address.:

[
 ![Login to OTRS](https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/OTRS_How_To_Alexandre_Costa.25_.jpg) 
][19]

Login at the OTRS:

[
 ![OTRS Admin Login](https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/OTRS_How_To_Alexandre_Costa.27_.jpg) 
][20]

OTRS is installed and ready to be configured with your support rules or business model.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-otrs-on-centos-7/

作者：[Alexandre Costa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-install-otrs-on-centos-7/
[1]:https://www.howtoforge.com/tutorial/how-to-install-otrs-on-centos-7/#thenbspenvironment
[2]:https://www.howtoforge.com/tutorial/how-to-install-otrs-on-centos-7/#preparation
[3]:https://www.howtoforge.com/tutorial/how-to-install-otrs-on-centos-7/#install-mariadb-on-centos-
[4]:https://www.howtoforge.com/tutorial/how-to-install-otrs-on-centos-7/#install-epelnbsp
[5]:https://www.howtoforge.com/tutorial/how-to-install-otrs-on-centos-7/#install-otrs
[6]:https://www.howtoforge.com/tutorial/how-to-install-otrs-on-centos-7/#configure-otrs-on-centos-
[7]:https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/big/OTRS_How_To_Alexandre_Costa.jpg
[8]:http://centos7.local/otrs/installer.pl
[9]:https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/big/OTRS_How_To_Alexandre_Costa.13_.jpg
[10]:https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/big/OTRS_How_To_Alexandre_Costa.14_.jpg
[11]:https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/big/OTRS_How_To_Alexandre_Costa.15_.jpg
[12]:https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/big/OTRS_How_To_Alexandre_Costa.16_.jpg
[13]:https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/big/OTRS_How_To_Alexandre_Costa.17_.jpg
[14]:https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/big/OTRS_How_To_Alexandre_Costa.18_.jpg
[15]:https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/big/OTRS_How_To_Alexandre_Costa.19_.jpg
[16]:https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/big/OTRS_How_To_Alexandre_Costa.21_.jpg
[17]:https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/big/OTRS_How_To_Alexandre_Costa.23_.jpg
[18]:https://centos7.local/otrs/index.pl
[19]:https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/big/OTRS_How_To_Alexandre_Costa.25_.jpg
[20]:https://www.howtoforge.com/images/how_to_install_and_configure_otrs_open_source_trouble_ticket_system_software_on_centos_7/big/OTRS_How_To_Alexandre_Costa.27_.jpg
