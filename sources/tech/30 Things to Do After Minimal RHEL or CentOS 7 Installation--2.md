Translating by ictlyh
30 Things to Do After Minimal RHEL/CentOS 7 Installation--2
================================================================================
### 7. Install PHP ###

PHP is a server-side scripting language for web based services. It is frequently used as general-purpose programming language as well. Install PHP on CentOS Minimal Server as.

    # yum install php

After installing php, make sure to restart Apache service to render PHP in Web Browser.

    # systemctl restart httpd.service

Next, verify PHP by creating following php script in the Apache document root directory.

    # echo -e "<?php\nphpinfo();\n?>"  > /var/ww/html/phpinfo.php

Now view the PHP file, we just created (phpinfo.php) in Linux Command Line as below.

    # php /var/www/html/phpinfo.php
    OR
    # links http://127.0.0.1/phpinfo.php

![Verify PHP](http://www.tecmint.com/wp-content/uploads/2015/04/Verify-PHP.jpeg)
Verify PHP

### 8. Install MariaDB Database ###

MariaDB is a fork of MySQL. RedHat Enterprise Linux and its derivatives have shifted to MariaDB from MySQL. It is the Primary Database management System. It is again one of those tools which is necessary to have and you will need it sooner or later no matter what kind of server you are setting. Install MariaDB on CentOS Minimal Install server as below.

    # yum install mariadb-server mariadb

![Install MariaDB Database](http://www.tecmint.com/wp-content/uploads/2015/04/Install-MariaDB-Database.jpeg)
Install MariaDB Database

Start and configure MariaDB to start automatically at boot.

    # systemctl start mariadb.service
    # systemctl enable mariadb.service

Allow service mysql (mariadb) through firewall.

    # firewall-cmd –add-service=mysql

Now it’s time to secure MariaDB server.

    # /usr/bin/mysql_secure_installation

![Secure MariaDB Database](http://www.tecmint.com/wp-content/uploads/2015/04/Secure-MariaDB.jpeg)
Secure MariaDB Database

Read Also:

- [Installing LAMP (Linux, Apache, MariaDB, PHP/PhpMyAdmin) in CentOS 7.0][1]
- [Creating Apache Virtual Hosts in CentOS 7.0][2]

### 9. Install and Configure SSH Server ###

SSH stands for Secure Shell which is the default protocol in Linux for remote management. SSH is one of those essential piece of software which comes default with CentOS Minimal Server.

Check Currently Installed SSH version.

    # SSH -V

![Check SSH Version](http://www.tecmint.com/wp-content/uploads/2015/04/Check-SSH-Version.jpeg)
Check SSH Version

Use Secure Protocol over the default SSH Protocol and change port number also for extra Security. Edit the SSH configuration file ‘/etc/ssh/ssh_config‘.

Uncomment the line below line or delete 1 from the Protocol string, so the line seems like:

    # Protocol 2,1 (Original)
    Protocol 2 (Now)

This change force SSH to use Protocol 2 which is considered to be more secure than Protocol 1 and also make sure to change the port number 22 to any in the configuration.

![Secure SSH Login](http://www.tecmint.com/wp-content/uploads/2015/04/Secure-SSH.jpeg)
Secure SSH Login

Disable SSH ‘root login‘ and allow to connect to root only after login to normal user account for added additional Security. For this, open and edit configuration file ‘/etc/ssh/sshd_config‘ and change PermitRootLogin yes t PermitRootLogin no.

    # PermitRootLogin yes (Original) 
    PermitRootLogin no (Now)

![Disable SSH Root Login](http://www.tecmint.com/wp-content/uploads/2015/04/Disable-SSH-Root-Login.jpeg)
Disable SSH Root Login

Finally, restart SSH service to reflect new changes..

    # systemctl restart sshd.service

Read Also:

- [5 Best Practices to Secure and Protect SSH Server][3]
- [SSH Passwordless Login Using SSH Keygen in 5 Easy Steps][4]
- [No Password SSH Keys Authentication” with PuTTY][5]

### 10. Install GCC (GNU Compiler Collection) ###

GCC stands for GNU Compiler Collection is a compiler system developed by GNU Project that support various programming languages. It is not installed by default in CentOS Minimal Install. To install gcc compiler run the below command.

    # yum install gcc

![Install GCC in CentOS](http://www.tecmint.com/wp-content/uploads/2015/04/Install-GCC-in-CentOS.jpeg)
Install GCC GNU Compiler

Check the version of installed gcc.

    # gcc --version

![Check GCC Version](http://www.tecmint.com/wp-content/uploads/2015/04/Check-GCC-Version.jpeg)
Check GCC Version

### 11. Install Java ###

Java is a general purpose class based, object-oriented Programming language. It is not installed by default in CentOS Minimal Server. Install Java from repository as below.

    # yum install java

![Install Java on CentOS](http://www.tecmint.com/wp-content/uploads/2015/04/Install-java.jpeg)
Install Java

Check version of Java Installed.

    # java -version

![Check Java Version](http://www.tecmint.com/wp-content/uploads/2015/04/Check-Java-Version.jpeg)
Check Java Version

--------------------------------------------------------------------------------

via: http://www.tecmint.com/things-to-do-after-minimal-rhel-centos-7-installation/2/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/install-lamp-in-centos-7/
[2]:http://www.tecmint.com/apache-virtual-hosting-in-centos/
[3]:http://www.tecmint.com/5-best-practices-to-secure-and-protect-ssh-server/
[4]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[5]:http://www.tecmint.com/ssh-passwordless-login-with-putty/