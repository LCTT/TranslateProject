How to Install Pure-FTPd with TLS on FreeBSD 10.2
================================================================================
FTP or File Transfer Protocol is application layer standard network protocol used to transfer file from the client to the server, after user logged in to the FTP server over the TCP-Network, such as internet. FTP has been round long time ago, much longer then P2P Program, or World Wide Web, and until this day it was a primary method for sharing file with other over the internet and it it remain very popular even today. FTP provide an secure transmission, that protect username, password and encrypt the content with SSL/TLS.

Pure-FTPd is free FTP Server with strong and focus on the software security. It was great choice for you if you want to provide a fast, secure, lightweight with feature rich FTP Services. Pure-FTPd can be install on variety of Unix-like operating system, include Linux and FreeBSD. Pure-FTPd is created by Frank Dennis in 2001, based on Troll-FTPd, and until now is actively developed by a team led by Dennis.

In this tutorial we will provide about installation and configuration of "**Pure-FTPd**" with Unix-like operating system FreeBSD 10.2.

### Step 1 - Update system ###

The first thing you must do is to install and update the freebsd repository, please connect to your server with SSH and then type command below as sudo/root :

    freebsd-update fetch
    freebsd-update install

### Step 2 - Install Pure-FTPd ###

You can install Pure-FTPd from the ports method, but in this tutorial we will install from the freebsd repository with "**pkg**" command. So, now let's install :

    pkg install pure-ftpd

Once installation is finished, please add pure-ftpd to the start at the boot time with sysrc command below :

    sysrc pureftpd_enable=yes

### Step 3 - Configure Pure-FTPd ###

Configuration file for Pure-FTPd is located at directory "/usr/local/etc/", please go to the directory and copy the sample configuration for pure-ftpd to "**pure-ftpd.conf**".

    cd /usr/local/etc/
    cp pure-ftpd.conf.sample pure-ftpd.conf

Now edit the file configuration with nano editor :

    nano -c pure-ftpd.conf

Note : -c option to show line number on nano.

Go to line 59 and change the value of "VerboseLog" to "**yes**". This option is allow you as administrator to see the log all command used by the users.

    VerboseLog   yes

And now look at line 126 "PureDB" for virtual-users configuration. Virtual users is a simple mechanism to store a list of users, with their password, name, uid, directory, etc. It's just like /etc/passwd. But it's not /etc/passwd. It's a different file and only for FTP. In this tutorial we will store the list of user to the file "**/usr/local/etc/pureftpd.passwd**" and "**/usr/local/etc/pureftpd.pdb**". Please uncomment that line and change the path for the file to "/usr/local/etc/pureftpd.pdb".

    PureDB   /usr/local/etc/pureftpd.pdb

Next, uncomment on the line 336 "**CreateHomeDir**", this option make you easy to add the virtual users, allow automatically create home directories if they are missing.

    CreateHomeDir   yes

Save and exit.

Next, start pure-ftpd with service command :

    service pure-ftpd start

### Step 4 - Adding New Users ###

At this step FTP server is started without error, but you can not log in to the FTP Server, because the default configuration of pure-ftpd is disabled for anonymous users. We need to create new users with home directory, and then give it the password for login.

On thing you must do befere you add new user to pure-ftpd virtual-user is to create a system user for this, lets create new system user "**vftp**" and the default group is same as username, with home directory "**/home/vftp/**".

    pw useradd vftp -s /sbin/nologin -w no -d /home/vftp \
    -c "Virtual User Pure-FTPd" -m

Now you can add the new user for the FTP Server with "**pure-pw**" command. For an example here, we will create new user named "**akari**", so please see command below :

    pure-pw useradd akari -u vftp -g vftp -d /home/vftp/akari
    Password: TYPE YOUR PASSWORD

that command will create user "**akari**" and the data stored at the file "**/usr/local/etc/pureftpd.passwd**", not at /etc/passwd file, so this means is that you can easily create FTP-only accounts without messing up your system accounts.

Next, you must generate the PureDB user database with this command :

    pure-pw mkdb

Now restart the pure-ftpd services and try connect with user "akari" :

    service pure-ftpd restart

Trying to connect with user akari :

    ftp SERVERIP

![FTP Connect user akari](http://blog.linoxide.com/wp-content/uploads/2015/10/FTP-Connect-user-akari.png)

**NOTE :**

If you want to add new user again, you can use "**pure-pw**" command. And if you want to delete the current user, you can use this :

    pure-pw userdel useryouwanttodelete
    pure-pw mkdb

### Step 5 - Add SSL/TLS to Pure-FTPd ###

Pure-FTPd supports encryption using TLS security mechanisms. To support for TLS/SSL, make sure the OpenSSL library is already installed on your freebsd system.

Now you must generate new "**self-signed certificate**" on the directory "**/etc/ssl/private**". Before you generate the certificate, please create new directory there called "private".

    cd /etc/ssl/
    mkdir private
    cd private/

Now generate "self-signed certificate" with openssl command below :

    openssl req -x509 -nodes -newkey rsa:2048 -sha256 -keyout \
    /etc/ssl/private/pure-ftpd.pem \
    -out /etc/ssl/private/pure-ftpd.pem

FILL ALL WITH YOUR PERSONAL INFO.

![Generate Certificate pem](http://blog.linoxide.com/wp-content/uploads/2015/10/Generate-Certificate-pem.png)

Next, change the certificate permission :

    chmod 600 /etc/ssl/private/*.pem

Once the certifcate is generated, Edit the pure-ftpd configuration file :

    nano -c /usr/local/etc/pure-ftpd.conf

Uncomment on line **423** to enable the TLS :

    TLS     1

And line **439** for the certificate file path :

    CertFile       /etc/ssl/private/pure-ftpd.pem

Save and exit, then restart the pure-ftpd services :

    service pure-ftpd restart

Now let's test the Pure-FTPd that work with TLS/SSL. I'm here use "**FileZilla**" to connect to the FTP Server, and use user "**akari**" that have been created.

![Pure-FTPd with TLS SUpport](http://blog.linoxide.com/wp-content/uploads/2015/10/Pure-FTPd-with-TLS-SUpport.png)

Pure-FTPd with TLS on FreeBSD 10.2 successfully.

### Conclusion ###

FTP or File Transfer Protocol is standart protocol used to transfer file between users and the server. One of the best, lightweight and secure FTP Server Software is Pure-FTPd. It is secure and support for TLS/SSL encryption mechanism. Pure-FTPd is easy to to install and configure, you can manage the user with virtual user support, and it is make you as sysadmin is easy to manage the user if you have a much user ftp server.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-pure-ftpd-tls-freebsd-10-2/

作者：[Arul][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/