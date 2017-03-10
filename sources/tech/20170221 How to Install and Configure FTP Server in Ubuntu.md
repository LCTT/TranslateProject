ucasfl translating
How to Install and Configure FTP Server in Ubuntu
============================================================

FTP (File Transfer Protocol) is a relatively old and most used standard network protocol used for uploading/downloading files between two computers over a network. However, FTP by its original insecure, because it transmits data together with user credentials (username and password) without encryption.

Warning: If you planning to use FTP, consider configuring FTP connection with SSL/TLS (will cover in next article). Otherwise, it’s always better to use secure FTP such as [SFTP][1].

**Suggested Read:** [How to Install and Secure FTP Server in CentOS 7][2]

In this tutorial, we will show how to install, configure and secure a FTP server (VSFTPD in full “Very Secure FTP Daemon“) in Ubuntu to have a powerful security against FTP vulnerabilities.

### Step 1: Installing VsFTP Server in Ubuntu

1. First, we need to update the system package sources list and then install VSFTPD binary package as follows:

```
$ sudo apt-get update
$ sudo apt-get install vsftpd
```

2. Once the installation completes, the service will be disabled initially, therefore, we need to start it manually for the mean time and also enable it to start automatically from the next system boot:

```
------------- On SystemD -------------
# systemctl start vsftpd
# systemctl enable vsftpd
------------- On SysVInit -------------
# service vsftpd start
# chkconfig --level 35 vsftpd on
```

3. Next, if you have [UFW firewall][3] enabled ( its not enabled by default) on the server, you have to open ports 21and 20 where the FTP daemons are listening, in order to allow access to FTP services from remote machines, then add the new firewall rules as follows:

```
$ sudo ufw allow 20/tcp
$ sudo ufw allow 21/tcp
$ sudo ufw status
```

### Step 2: Configuring and Securing VsFTP Server in Ubuntu

4. Let’s now perform a few configurations to setup and secure our FTP server, first we will create a backup of the original config file /etc/vsftpd/vsftpd.conf like so:

```
$ sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
```

Next, let’s open the vsftpd config file.

```
$ sudo vi /etc/vsftpd.conf
OR
$ sudo nano /etc/vsftpd.conf
```

Add/modify the following options with these values:

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

5. Now, configure VSFTPD to allow/deny FTP access to users based on the user list file /etc/vsftpd.userlist.

Note that by default, users listed in userlist_file=/etc/vsftpd.userlist are denied login access with `userlist_deny=YES` option if `userlist_enable=YES`.

But, the option `userlist_deny=NO` twists the meaning of the default setting, so only users whose username is explicitly listed in userlist_file=/etc/vsftpd.userlist will be allowed to login to the FTP server.

```
userlist_enable=YES                   # vsftpd will load a list of usernames, from the filename given by userlist_file
userlist_file=/etc/vsftpd.userlist    # stores usernames.
userlist_deny=NO   
```

Important: When users login to the FTP server, they are placed in a chrooted jail, this is the local root directory which will act as their home directory for the FTP session only.

Next, we will look at two possible scenarios of how to set the chrooted jail (local root) directory, as explained below.

6. At this point, let’s add/modify/uncomment these two following options to [restrict FTP users to their Home directories][4].

```
chroot_local_user=YES
allow_writeable_chroot=YES
```

The option `chroot_local_user=YES` importantly means local users will be placed in a chroot jail, their home directory by default after login.

And we must as well understand that VSFTPD does not permit the chroot jail directory to be writable, by default for security reasons, however, we can use the option allow_writeable_chroot=YES to disable this setting.

Save the file and close it. Then we have to restart VSFTPD services for the changes above to take effect:

```
------------- On SystemD -------------
# systemctl restart vsftpd
------------- On SysVInit -------------
# service vsftpd restart
```

### Step 3: Testing VsFTP Server in Ubuntu

7. Now we will test FTP server by creating a FTP user with [useradd command][5] as follows:

```
$ sudo useradd -m -c "Aaron Kili, Contributor" -s /bin/bash aaronkilik
$ sudo passwd aaronkilik
```

Then, we have to explicitly list the user aaronkilik in the file /etc/vsftpd.userlist with the [echo command][6] and tee command as below:

```
$ echo "aaronkilik" | sudo tee -a /etc/vsftpd.userlist
$ cat /etc/vsftpd.userlist
```

8. Now it’s about time to test our above configurations are functioning as required. We will begin by testing anonymous logins; we can clearly see from the output below that anonymous logins are not permitted on the FTP server:

```
# ftp 192.168.56.102
Connected to 192.168.56.102  (192.168.56.102).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.102:aaronkilik) : anonymous
530 Permission denied.
Login failed.
ftp> bye
221 Goodbye.
```

9. Next, let’s test if a user not listed in the file /etc/vsftpd.userlist will be granted permission to login, which is not true from the output that follows:

```
# ftp 192.168.56.102
Connected to 192.168.56.102  (192.168.56.102).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : user1
530 Permission denied.
Login failed.
ftp> bye
221 Goodbye.
```

10. Now we will carry out a final test to determine whether a user listed in the file /etc/vsftpd.userlist, is actually placed in his/her home directory after login. And this is true from the output below:

```
# ftp 192.168.56.102
Connected to 192.168.56.102  (192.168.56.102).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.102:aaronkilik) : aaronkilik
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
```
[
 ![Verify FTP Login in Ubuntu](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-Login-in-Ubuntu.png)
][7]

Verify FTP Login in Ubuntu

Warning: Setting the option `allow_writeable_chroot=YES` can be so dangerous, it has possible security implications, especially if the users have upload permission, or more so, shell access. Only use it if you exactly know what you are doing.

We should note that these security implications are not specific to VSFTPD, they can also affect all other FTP daemons which offer to put local users in chroot jails.

Because of this reason, in the section below, we will explain a more secure method of setting a different non-writable local root directory for a user.

### Step 4: Configure FTP User Home Directories in Ubuntu

11. Now, open the VSFTPD configuration file once more time.

```
$ sudo vi /etc/vsftpd.conf
OR
$ sudo nano /etc/vsftpd.conf
```

and comment out the unsecure option using the `#` character as shown below:

```
#allow_writeable_chroot=YES
```

Next, create the alternative local root directory for the user (aaronkilik, yours is possibly not the same) and set the required permissions by disabling write permissions to all other users to this directory:

```
$ sudo mkdir /home/aaronkilik/ftp
$ sudo chown nobody:nogroup /home/aaronkilik/ftp
$ sudo chmod a-w /home/aaronkilik/ftp
```

12. Then, create a directory under the local root with the appropriate permissions where the user will store his files:

```
$ sudo mkdir /home/aaronkilik/ftp/files
$ sudo chown -R aaronkilk:aaronkilik /home/aaronkilik/ftp/files
$ sudo chmod -R 0770 /home/aaronkilik/ftp/files/
```

Afterwards, add/modify the options below in the VSFTPD config file with their corresponding values:

```
user_sub_token=$USER          # inserts the username in the local root directory
local_root=/home/$USER/ftp    # defines any users local root directory
```

Save the file and close it. And restart the VSFTPD services with the recent settings:

```
------------- On SystemD -------------
# systemctl restart vsftpd
------------- On SysVInit -------------
# service vsftpd restart
```

13. Now, let’s perform a final check and make sure that the user’s local root directory is the FTP directory we created in his Home directory.

```
# ftp 192.168.56.102
Connected to 192.168.56.102  (192.168.56.102).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:aaronkilik) : aaronkilik
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
```
[
 ![FTP User Home Directory Login](http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Home-Directory-Login.png)
][8]

FTP User Home Directory Login

That’s it! Remember to share your opinion about this guide via the comment form below or possibly provide us any important information concerning the topic.

Last but not least, do not miss our next article, where we will describe how to [secure an FTP server using SSL/TLS][9] connections in Ubuntu 16.04/16.10, until then, always stay tunned to TecMint.

--------------------------------------------------------------------------------


作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-ftp-server-in-ubuntu/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/sftp-command-examples/
[2]:http://www.tecmint.com/install-ftp-server-in-centos-7/
[3]:http://www.tecmint.com/how-to-install-and-configure-ufw-firewall/
[4]:http://www.tecmint.com/restrict-sftp-user-home-directories-using-chroot/
[5]:http://www.tecmint.com/add-users-in-linux/
[6]:http://www.tecmint.com/echo-command-in-linux/
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-Login-in-Ubuntu.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/FTP-User-Home-Directory-Login.png
[9]:http://www.tecmint.com/secure-ftp-server-using-ssl-tls-on-ubuntu/
[10]:http://www.tecmint.com/author/aaronkili/
[11]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[12]:http://www.tecmint.com/free-linux-shell-scripting-books/
