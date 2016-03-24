translated by iov-wang
How to Install OsTicket Ticketing System in Fedora 22 / Centos 7
================================================================================
In this article, we'll learn how to setup help desk ticketing system with osTicket in our machine or server running Fedora 22 or CentOS 7 as operating system. osTicket is a free and open source popular customer support ticketing system developed and maintained by [Enhancesoft][1] and its contributors. osTicket is the best solution for help and support ticketing system and management for better communication and support assistance with clients and customers. It has the ability to easily integrate with inquiries created via email, phone and web based forms into a beautiful multi-user web interface. osTicket makes us easy to manage, organize and log all our support requests and responses in one single place. It is a simple, lightweight, reliable, open source, web-based and easy to setup and use help desk ticketing system.

Here are some easy steps on how we can setup Help Desk ticketing system with osTicket in Fedora 22 or CentOS 7 operating system.

### 1. Installing LAMP stack ###

First of all, we'll need to install LAMP Stack to make osTicket working. LAMP stack is the combination of Apache web server, MySQL or MariaDB database system and PHP. To install a complete suit of LAMP stack that we need for the installation of osTicket, we'll need to run the following commands in a shell or a terminal.

**On Fedora 22**

LAMP stack is available on the official repository of Fedora 22. As the default package manager of Fedora 22 is the latest DNF package manager, we'll need to run the following command.

    $ sudo dnf install httpd mariadb mariadb-server php php-mysql php-fpm php-cli php-xml php-common php-gd php-imap php-mbstring wget

**On CentOS 7**

As there is LAMP stack available on the official repository of CentOS 7, we'll gonna install it using yum package manager.

    $ sudo yum install httpd mariadb mariadb-server php php-mysql php-fpm php-cli php-xml php-common php-gd php-imap php-mbstring wget

### 2. Starting Apache Web Server and MariaDB ###

Next, we'll gonna start MariaDB server and Apache Web Server to get started.

    $ sudo systemctl start mariadb httpd

Then, we'll gonna enable them to start on every boot of the system.

    $ sudo systemctl enable mariadb httpd

    Created symlink from /etc/systemd/system/multi-user.target.wants/mariadb.service to /usr/lib/systemd/system/mariadb.service.
    Created symlink from /etc/systemd/system/multi-user.target.wants/httpd.service to /usr/lib/systemd/system/httpd.service.

### 3. Downloading osTicket package ###

Next, we'll gonna download the latest release of osTicket ie version 1.9.9 . We can download it from the official download page [http://osticket.com/download][2] or from the official github repository. [https://github.com/osTicket/osTicket-1.8/releases][3] . Here, in this tutorial we'll download the tarball of the latest release of osTicket from the github release page using wget command.

    $ cd /tmp/
    $ wget https://github.com/osTicket/osTicket-1.8/releases/download/v1.9.9/osTicket-v1.9.9-1-gbe2f138.zip

    --2015-07-16 09:14:23-- https://github.com/osTicket/osTicket-1.8/releases/download/v1.9.9/osTicket-v1.9.9-1-gbe2f138.zip
    Resolving github.com (github.com)... 192.30.252.131
    ...
    Connecting to s3.amazonaws.com (s3.amazonaws.com)|54.231.244.4|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 7150871 (6.8M) [application/octet-stream]
    Saving to: ‘osTicket-v1.9.9-1-gbe2f138.zip’
    osTicket-v1.9.9-1-gb 100%[========================>] 6.82M 1.25MB/s in 12s
    2015-07-16 09:14:37 (604 KB/s) - ‘osTicket-v1.9.9-1-gbe2f138.zip’ saved [7150871/7150871]

### 4. Extracting the osTicket ###

After we have successfully downloaded the osTicket zipped package, we'll now gonna extract the zip. As the default root directory of Apache web server is /var/www/html/ , we'll gonna create a directory called "**support**" where we'll extract the whole directory and files of the compressed zip file. To do so, we'll need to run the following commands in a terminal or a shell.

    $ unzip osTicket-v1.9.9-1-gbe2f138.zip

Then, we'll move the whole extracted files to it.

    $ sudo mv /tmp/upload /var/www/html/support

### 5. Fixing Ownership and Permission ###

Now, we'll gonna assign the ownership of the directories and files under /var/ww/html/support to apache to enable writable access to the apache process owner. To do so, we'll need to run the following command.

    $ sudo chown apache: -R /var/www/html/support

Then, we'll also need to copy a sample configuration file to its default configuration file. To do so, we'll need to run the below command.

    $ cd /var/www/html/support/
    $ sudo cp include/ost-sampleconfig.php include/ost-config.php
    $ sudo chmod 0666 include/ost-config.php

If you have SELinux enabled on the system, run the following command.

    $ sudo chcon -R -t httpd_sys_content_t /var/www/html/vtigercrm
    $ sudo chcon -R -t httpd_sys_rw_content_t /var/www/html/vtigercrm

### 6. Configuring MariaDB ###

As this is the first time we're going to configure MariaDB, we'll need to create a password for the root user of mariadb so that we can use it to login and create the database for our osTicket installation. To do so, we'll need to run the following command in a terminal or a shell.

    $ sudo mysql_secure_installation

    ...
    Enter current password for root (enter for none):
    OK, successfully used password, moving on...

    Setting the root password ensures that nobody can log into the MariaDB
    root user without the proper authorisation.

    Set root password? [Y/n] y
    New password:
    Re-enter new password:
    Password updated successfully!
    Reloading privilege tables..
    Success!
    ...
    All done! If you've completed all of the above steps, your MariaDB
    installation should now be secure.

    Thanks for using MariaDB!

Note: Above, we are asked to enter the root password of the mariadb server but as we are setting for the first time and no password has been set yet, we'll simply hit enter while asking the current mariadb root password. Then, we'll need to enter twice the new password we wanna set. Then, we can simply hit enter in every argument in order to set default configurations.

### 7. Creating osTicket Database ###

As osTicket needs a database system to store its data and information, we'll be configuring MariaDB for osTicket. So, we'll need to first login into the mariadb command environment. To do so, we'll need to run the following command.

    $ sudo mysql -u root -p

Now, we'll gonna create a new database "**osticket_db**" with user "**osticket_user**" and password "osticket_password" which will be granted access to the database. To do so, we'll need to run the following commands inside the MariaDB command environment.

    > CREATE DATABASE osticket_db;
    > CREATE USER 'osticket_user'@'localhost' IDENTIFIED BY 'osticket_password';
    > GRANT ALL PRIVILEGES on osticket_db.* TO 'osticket_user'@'localhost' ;
    > FLUSH PRIVILEGES;
    > EXIT;

**Note**: It is strictly recommended to replace the database name, user and password as your desire for security issue.

### 8. Allowing Firewall ###

If we are running a firewall program, we'll need to configure our firewall to allow port 80 so that the Apache web server's default port will be accessible externally. This will allow us to navigate our web browser to osTicket's web interface with the default http port 80. To do so, we'll need to run the following command.

    $ sudo firewall-cmd --zone=public --add-port=80/tcp --permanent

After done, we'll need to reload our firewall service.

    $ sudo firewall-cmd --reload

### 9. Web based Installation ###

Finally, is everything is done as described above, we'll now should be able to navigate osTicket's Installer by pointing our web browser to http://domain.com/support or http://ip-address/support . Now, we'll be shown if the dependencies required by osTicket are installed or not. As we've already installed all the necessary packages, we'll be welcomed with **green colored tick** to proceed forward.

![osTicket Requirements Check](http://blog.linoxide.com/wp-content/uploads/2015/07/osticket-requirements-check1.png)

After that, we'll be required to enter the details for our osTicket instance as shown below. We'll need to enter the database name, username, password and hostname and other important account information that we'll require while logging into the admin panel.

![osticket configuration](http://blog.linoxide.com/wp-content/uploads/2015/07/osticket-configuration.png)

After the installation has been completed successfully, we'll be welcomed by a Congratulations screen. There we can see two links, one for our Admin Panel and the other for the support center as the homepage of the osTicket Support Help Desk.

![osticket installation completed](http://blog.linoxide.com/wp-content/uploads/2015/07/osticket-installation-completed.png)

If we click on http://ip-address/support or http://domain.com/support, we'll be redirected to the osTicket support page which is as shown below.

![osticket support homepage](http://blog.linoxide.com/wp-content/uploads/2015/07/osticket-support-homepage.png)

Next, to login into the admin panel, we'll need to navigate our web browser to http://ip-address/support/scp or http://domain.com/support/scp . Then, we'll need to enter the login details we had just created above while configuring the database and other information in the web installer. After successful login, we'll be able to access our dashboard and other admin sections.

![osticket admin panel](http://blog.linoxide.com/wp-content/uploads/2015/07/osticket-admin-panel.png)

### 10. Post Installation ###

After we have finished the web installation of osTicket, we'll now need to secure some of our configuration files. To do so, we'll need to run the following command.

    $ sudo rm -rf /var/www/html/support/setup/
    $ sudo chmod 644 /var/www/html/support/include/ost-config.php

### Conclusion ###

osTicket is an awesome help desk ticketing system providing several new features. It supports rich text or HTML emails, ticket filters, agent collision avoidance, auto-responder and many more features. The user interface of osTicket is very beautiful with easy to use control panel. It is a complete set of tools required for a help and support ticketing system. It is the best solution for providing customers a better way to communicate with the support team. It helps a company to make their customers happy with them regarding the support and help desk. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-osticket-fedora-22-centos-7/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.enhancesoft.com/
[2]:http://osticket.com/download
[3]:https://github.com/osTicket/osTicket-1.8/releases
