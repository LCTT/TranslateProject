Howto Configure FTP Server with Proftpd on Fedora 22
================================================================================
In this article, we'll learn about setting up an FTP server with Proftpd running Fedora 22 in our machine or server. [ProFTPD][1] is a free and open source FTP daemon software licensed under GPL. It is among most popular FTP server among machines running Linux. Its primary design aims to have an FTP server with many advanced features and provisioning users for more configuration options for easy customization. It includes a number of configuration options that are still not available with many other FTP daemons. It was initially developed by the developers as an alternative with better security and configuration to wu-ftpd server. An FTP server is a program that allows us to upload or download files and folders from a remote server where it is setup using an FTP client. Some of the features of ProFTPD daemon are as follows, you can check more features on [http://www.proftpd.org/features.html][2] .

- It includes a per directory ".ftpaccess" access configuration similar to Apache's ".htaccess"
- It features multiple virtual FTP server with multiple users login and anonymous FTP services.
- It can be run either as a stand-alone server or from inetd/xinetd.
- Its ownership, file/folder attributes and file/folder permissions are UNIX-based.
- It can be run as standalone mode in order to protect the system from damage that can be caused from root access.
- The modular design of it makes it easily extensible with modules like LDAP servers, SSL/TLS encryption, RADIUS support, etc.
- IPv6 support is also included in the ProFTPD server.

Here are some easy to perform steps on how we can setup an FTP Server with ProFTPD in Fedora 22 operating system.

### 1. Installing ProFTPD ###

First of all, we'll wanna install Proftpd server in our box running Fedora 22 as its operating system. As yum package manager has been depreciated, we'll use the latest and greatest built package manager called dnf. DNF is pretty easy to use and highly user friendly package manager available in Fedora 22. We'll simply use it to install proftpd daemon server. To do so, we'll need to run the following command in a terminal or a console in sudo mode.

    $ sudo dnf -y install proftpd proftpd-utils

### 2. Configuring ProFTPD ###

Now, we'll make changes to some configurations in the daemon. To configure the daemon, we will need to edit /etc/proftpd.conf with a text editor. The main configuration file of the ProFTPD daemon is **/etc/proftpd.conf** so, any changes made to this file will affect the FTP server. Here, are some changes we make in this initial step.

    $ sudo vi /etc/proftpd.conf

Next, after we open the file using a text editor, we'll wanna make changes to the ServerName and ServerAdmin as hostname and email address respectively.  Here's what we have made changes to those configs.

    ServerName       "ftp.linoxide.com"
    ServerAdmin      arun@linoxide.com

After that, we'll wanna the following lines into the configuration file so that it logs access & auth into its specified log files.

    ExtendedLog /var/log/proftpd/access.log WRITE,READ default
    ExtendedLog /var/log/proftpd/auth.log AUTH auth

![Configuring ProFTPD Config](http://blog.linoxide.com/wp-content/uploads/2015/06/configuring-proftpd-config.png)

### 3. Adding FTP users ###

After configure the basics of the configuration file, we'll surely wanna create an FTP user which is rooted at a specific directory we want. The current users that we use to login into our machine are automatically enabled with the FTP service, we can even use it to login into the FTP server. But, in this tutorial, we'll gonna create a new user with a specified home directory to the ftp server.

Here, we'll create a new group named ftpgroup.

    $ sudo groupadd ftpgroup

Then, we'll gonna add a new user arunftp into the group with home directory specified as /ftp-dir/

    $ sudo useradd -G ftpgroup arunftp -s /sbin/nologin -d /ftp-dir/

After the user has been created and added to the group, we'll wanna set a password to the user arunftp.

    $ sudo passwd arunftp

    Changing password for user arunftp.
    New password:
    Retype new password:
    passwd: all authentication tokens updated successfully.

Now, we'll set read and write permission of the home directory by the ftp users by executing the following command.

    $ sudo setsebool -P allow_ftpd_full_access=1
    $ sudo setsebool -P ftp_home_dir=1

Then, we'll wanna make that directory and its contents unable to get removed or renamed by any other users.

    $ sudo chmod -R 1777 /ftp-dir/

### 4. Enabling TLS Support ###

FTP is considered less secure in comparison to the latest encryption methods used these days as anybody sniffing the network card can read the data pass through FTP. So, we'll enable TLS Encryption support in our FTP server. To do so, we'll need to a edit /etc/proftpd.conf configuration file. Before that, we'll wanna backup our existing configuration file to make sure we can revert our configuration if any unexpected happens.

    $ sudo cp /etc/proftpd.conf /etc/proftpd.conf.bak

Then, we'll wanna edit the configuration file using our favorite text editor.

    $ sudo vi /etc/proftpd.conf

Then, we'll wanna add the following lines just below line we configured in step 2 .

    TLSEngine on
    TLSRequired on
    TLSProtocol SSLv23
    TLSLog /var/log/proftpd/tls.log
    TLSRSACertificateFile /etc/pki/tls/certs/proftpd.pem
    TLSRSACertificateKeyFile /etc/pki/tls/certs/proftpd.pem

![Enabling TLS Configuration](http://blog.linoxide.com/wp-content/uploads/2015/06/tls-configuration.png)

After finishing up with the configuration, we'll wanna save and exit it.

Next, we'll need to generate the SSL certificates inside **/etc/pki/tls/certs/** directory as proftpd.pem. To do so, first we'll need to install openssl in our Fedora 22 machine.

    $ sudo dnf install openssl

Then, we'll gonna generate the SSL certificate by running the following command.

    $ sudo openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/pki/tls/certs/proftpd.pem -out /etc/pki/tls/certs/proftpd.pem

We'll be asked with some information that will be associated into the certificate. After completing the required information, it will generate a 2048 bit RSA private key.

    Generating a 2048 bit RSA private key
    ...................+++
    ...................+++
    writing new private key to '/etc/pki/tls/certs/proftpd.pem'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [XX]:NP
    State or Province Name (full name) []:Narayani
    Locality Name (eg, city) [Default City]:Bharatpur
    Organization Name (eg, company) [Default Company Ltd]:Linoxide
    Organizational Unit Name (eg, section) []:Linux Freedom
    Common Name (eg, your name or your server's hostname) []:ftp.linoxide.com
    Email Address []:arun@linoxide.com

After that, we'll gonna change the permission of the generated certificate file in order to secure it.

    $ sudo chmod 600 /etc/pki/tls/certs/proftpd.pem

### 5. Allowing FTP through Firewall ###

Now, we'll need to allow the ftp ports that are usually blocked by the firewall by default. So, we'll allow ports and enable access to the ftp through firewall.

If **TLS/SSL Encryption is enabled** run the following command.

    $sudo firewall-cmd --add-port=1024-65534/tcp
    $ sudo firewall-cmd --add-port=1024-65534/tcp --permanent

If **TLS/SSL Encryption is disabled** run the following command.

    $ sudo firewall-cmd --permanent --zone=public --add-service=ftp

    success

Then, we'll need to reload the firewall configuration.

    $ sudo firewall-cmd --reload

    success

### 6. Starting and Enabling ProFTPD ###

After everything is set, we'll finally start our ProFTPD and give it a try. To start the proftpd ftp daemon, we'll need to run the following command.

    $ sudo systemctl start proftpd.service

Then, we'll wanna enable proftpd to start on every boot.

    $ sudo systemctl enable proftpd.service

    Created symlink from /etc/systemd/system/multi-user.target.wants/proftpd.service to /usr/lib/systemd/system/proftpd.service.

### 7. Logging into the FTP server ###

Now, if everything was configured and done as expected, we must be able to connect to the ftp server and login with the details we set above. Here, we'll gonna configure our FTP client, filezilla with hostname as **server's ip or url**, Protocol as **FTP**, User as **arunftp** and password as the one we set in above step 3. If you followed step 4 for enabling TLS support, then we'll need to set the Encryption type as **Require explicit FTP over TLS** but if you didn't follow step 4 and don't wanna use TLS encryption then set the Encryption type as **Plain FTP**.

![FTP Login Details](http://blog.linoxide.com/wp-content/uploads/2015/06/ftp-login-details.png)

To setup the above configuration, we'll need goto File which is under the Menu and then click on Site Manager in which we can click on new site then configure as illustrated above.

![FTP SSL Certificate](http://blog.linoxide.com/wp-content/uploads/2015/06/ftp-ssl-certificate.png)

Then, we're asked to accept the SSL certificate, that can be done by click OK. After that, we are able to upload and download required files and folders from our FTP server.

### Conclusion ###

Finally, we have successfully installed and configured our Fedora 22 box with Proftpd FTP server. Proftpd is an awesome powerful highly configurable and extensible FTP daemon. The above tutorial illustrates us how we can configure a secure FTP server with TLS encryption. It is highly recommended to configure FTP server with TLS encryption as it enables SSL certificate security to the data transfer and login. Here, we haven't configured anonymous access to the FTP cause they are usually not recommended in a protected FTP system. An FTP access makes pretty easy for people to upload and download at good efficient performance. We can even change the ports for the users for additional security. So, if you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/configure-ftp-proftpd-fedora-22/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.proftpd.org/
[2]:http://www.proftpd.org/features.html