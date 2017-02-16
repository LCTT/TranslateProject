How to Install, Configure and Secure FTP Server in CentOS 7 – [Comprehensive Guide]
============================================================

FTP (File Transfer Protocol) is a traditional and widely used standard tool for [transferring files between a server and clients][1] over a network, especially where no authentication is necessary (permits anonymous users to connect to a server). We must understand that FTP is unsecure by default, because it transmits user credentials and data without encryption.

In this guide, we will describe the steps to install, configure and secure a FTP server (VSFTPD stands for “Very Secure FTP Daemon“) in CentOS/RHEL 7 and Fedora distributions.

Note that all the commands in this guide will be run as root, in case you are not operating the server with the root account, use the [sudo command][2] to gain root privileges.

### Step 1: Installing FTP Server

1. Installing vsftpd server is straight forward, just run the following command in the terminal.

```
# yum install vsftpd
```

2. After the installation completes, the service will be disabled at first, so we need to start it manually for the time being and enable it to start automatically from the next system boot as well:

```
# systemctl start vsftpd
# systemctl enable vsftpd
```

3. Next, in order to allow access to FTP services from external systems, we have to open port 21, where the FTP daemons are listening as follows:

```
# firewall-cmd --zone=public --permanent --add-port=21/tcp
# firewall-cmd --zone=public --permanent --add-service=ftp
# firewall-cmd --reload
```

### Step 2: Configuring FTP Server

4. Now we will move over to perform a few configurations to setup and secure our FTP server, let us start by making a backup of the original config file /etc/vsftpd/vsftpd.conf:

```
# cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.orig
```

Next, open the config file above and set the following options with these corresponding values:

```
anonymous_enable=NO             # disable  anonymous login
local_enable=YES		# permit local logins
write_enable=YES		# enable FTP commands which change the filesystem
local_umask=022		        # value of umask for file creation for local users
dirmessage_enable=YES	        # enable showing of messages when users first enter a new directory
xferlog_enable=YES		# a log file will be maintained detailing uploads and downloads
connect_from_port_20=YES        # use port 20 (ftp-data) on the server machine for PORT style connections
xferlog_std_format=YES          # keep standard log file format
listen=NO   			# prevent vsftpd from running in standalone mode
listen_ipv6=YES		        # vsftpd will listen on an IPv6 socket instead of an IPv4 one
pam_service_name=vsftpd         # name of the PAM service vsftpd will use
userlist_enable=YES  	        # enable vsftpd to load a list of usernames
tcp_wrappers=YES  		# turn on tcp wrappers
```

5. Now configure FTP to allow/deny FTP access to users based on the user list file `/etc/vsftpd.userlist`.

By default, users listed in `userlist_file=/etc/vsftpd.userlist` are denied login access with userlist_deny option set to YES, if userlist_enable=YES.

However, userlist_deny=NO alters the setting, meaning that only users explicitly listed in userlist_file=/etc/vsftpd.userlist will be permitted to login.

```
userlist_enable=YES                   # vsftpd will load a list of usernames, from the filename given by userlist_file
userlist_file=/etc/vsftpd.userlist    # stores usernames.
userlist_deny=NO   
```

That’s not all, when users login to the FTP server, they are placed in a chroot’ed jail, this is the local root directory which will act as their home directory for the FTP session only.

Next, we will look at two possible scenarios of how to chroot FTP users to Home directories (local root) directory for FTP users, as explained below.

6. Now add these two following options to restrict FTP users to their Home directories.

```
chroot_local_user=YES
allow_writeable_chroot=YES
```

chroot_local_user=YES means local users will be placed in a chroot jail, their home directory after login by default settings.

And also by default, vsftpd does not allow the chroot jail directory to be writable for security reasons, however, we can use the option allow_writeable_chroot=YES to override this setting.

Save the file and close it.

### Securing FTP Server with SELinux

7. Now, let’s set the SELinux boolean below to allow FTP to read files in a user’s home directory. Note that this was initially done using the the command:

```
# setsebool -P ftp_home_dir on
```

However, the `ftp_home_dir` directive has been disabled by default as explained in this bug report: [https://bugzilla.redhat.com/show_bug.cgi?id=1097775][3].

Now we will use semanage command to set SELinux rule to allow FTP to read/write user’s home directory.

```
# semanage boolean -m ftpd_full_access --on
```

At this point, we have to restart vsftpd to effect all the changes we made so far above:

```
# systemctl restart vsftpd
```

### Step 4: Testing FTP Server

8. Now we will test FTP server by creating a FTP user with [useradd command][4].

```
# useradd -m -c “Ravi Saive, CEO” -s /bin/bash ravi
# passwd ravi
```

Afterwards, we have to add the user ravi to the file /etc/vsftpd.userlist using the [echo command][5] as follows:

```
# echo "ravi" | tee -a /etc/vsftpd.userlist
# cat /etc/vsftpd.userlist
```

9. Now it’s time to test if our settings above are working correctly. Let’s start by testing anonymous logins, we can see from the screen shot below that anonymous logins are not permitted:

```
# ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : anonymous
530 Permission denied.
Login failed.
ftp>
```
[
 ![Test Anonymous FTP Login](http://www.tecmint.com/wp-content/uploads/2017/02/Test-Anonymous-FTP-Login.png) 
][6]

Test Anonymous FTP Login

10. Let’s also test if a user not listed in the file /etc/vsftpd.userlist will be granted permission to login, which is not the case as in the screen shot below:

```
# ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : aaronkilik
530 Permission denied.
Login failed.
ftp>
```
[
 ![FTP User Login Failed](http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Login-Failed.png) 
][7]

FTP User Login Failed

11. Now do a final check if a user listed in the file /etc/vsftpd.userlist, is actually placed in his/her home directory after login:

```
# ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : ravi
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
```
[
 ![FTP User Login Successful[](http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Login.png) 
][8]

FTP User Login Successful[

Warning: Using `allow_writeable_chroot=YES` has certain security implications, especially if the users have upload permission, or shell access.

Only activate this option if you exactly know what you are doing. It’s important to note that these security implications arenot vsftpd specific, they apply to all FTP daemons which offer to put local users in chroot jails as well.

Therefore, we will look at a more secure way of setting a different non-writable local root directory in the next section.

### Step 5: Configure Different FTP User Home Directories

12. Open the vsftpd configuration file again and start by commenting the unsecure option below:

```
#allow_writeable_chroot=YES
```

Then create the alternative local root directory for the user (`ravi`, yours is probably different) and remove write permissions to all users to this directory:

```
# mkdir /home/ravi/ftp
# chown nobody:nobody /home/ravi/ftp
# chmod a-w /home/ravi/ftp
```

13. Next, create a directory under the local root where the user will store his/her files:

```
# mkdir /home/ravi/ftp/files
# chown ravi:ravi  /home/ravi/ftp/files
# chmod 0700 /home/ravi/ftp/files/
```

Then add/modify the following options in the vsftpd config file with these values:

```
user_sub_token=$USER         # inserts the username in the local root directory 
local_root=/home/$USER/ftp   # defines any users local root directory
```

Save the file and close it. Once again, let’s restart the service with the new settings:

```
# systemctl restart vsftpd
```

14. Now do a final test again and see that the users local root directory is the FTP directory we created in his home directory.

```
# ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : ravi
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
```
[
 ![FTP User Home Directory Login Successful](http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Home-Directory-Login-Successful.png) 
][9]

FTP User Home Directory Login Successful

That’s it! In this article, we described how to install, configure as well as secure a FTP server in CentOS 7, use the comment section below to write back to us concerning this guide/share any useful information about this topic.

**Suggested Read:** [Install ProFTPD Server on RHEL/CentOS 7][10]

In the next article, we will also show you how to [secure an FTP server using SSL/TLS][11] connections in CentOS 7, until then, stay connected to TecMint.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-ftp-server-in-centos-7/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/scp-commands-examples/
[2]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[3]:https://bugzilla.redhat.com/show_bug.cgi?id=1097775
[4]:http://www.tecmint.com/add-users-in-linux/
[5]:http://www.tecmint.com/echo-command-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Test-Anonymous-FTP-Login.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Login-Failed.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Login.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Home-Directory-Login-Successful.png
[10]:http://www.tecmint.com/install-proftpd-in-centos-7/
[11]:http://www.tecmint.com/secure-vsftpd-using-ssl-tls-on-centos/
