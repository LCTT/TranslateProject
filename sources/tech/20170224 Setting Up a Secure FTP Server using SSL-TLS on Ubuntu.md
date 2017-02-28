Setting Up a Secure FTP Server using SSL/TLS on Ubuntu
============================================================

by [Aaron Kili][12] | Published: February 24, 2017 | Last Updated: February 24, 2017

 Download Your Free eBooks NOW - [10 Free Linux eBooks for Administrators][13] | [4 Free Shell Scripting eBooks][14]

In this tutorial, we will describe how to secure a FTP server (VSFTPD stands for “Very Secure FTP Daemon”) using SSL/TLS in Ubuntu 16.04/16.10.

If you’re looking to setup a secure FTP server for CentOS based distributions, you can read – [Secure an FTP Server Using SSL/TLS on CentOS][2]

After following the various steps in this guide, we will have learned the fundamentals of enabling encryption services in a FTP server for secure data transfers is crucial.

#### Requirements

1.  You must [Install and Configure a FTP Server in Ubuntu][1]

Before we move further, make sure that all commands in this article will be run as root or [sudo privileged account][3].

### Step 1: Generating SSL/TLS Certificate for FTP on Ubuntu

1. We will begin by creating a subdirectory under: /etc/ssl/ to store the SSL/TLS certificate and key files if it doesn’t exist:

```
$ sudo mkdir /etc/ssl/private
```

2. Now let’s generate the certificate and key in a single file, by running the command below.

```
$ sudo openssl req -x509 -nodes -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -days 365 -newkey rsa:2048
```

The above command will prompt you to answer the questions below, don’t forget to enter values that applicable to your scenario.

```
Country Name (2 letter code) [XX]:IN
State or Province Name (full name) []:Lower Parel
Locality Name (eg, city) [Default City]:Mumbai
Organization Name (eg, company) [Default Company Ltd]:TecMint.com
Organizational Unit Name (eg, section) []:Linux and Open Source
Common Name (eg, your name or your server's hostname) []:tecmint
Email Address []:admin@tecmint.com
```

### Step 2: Configuring VSFTPD to Use SSL/TLS on Ubuntu

3. Before we perform any VSFTPD configurations, for those who have [UFW firewall enabled][4], you have to open the ports 990 and 40000-50000 to allow TLS connections and the port range of passive ports to set in the VSFTPD configuration file respectively:

```
$ sudo ufw allow 990/tcp
$ sudo ufw allow 40000:50000/tcp
$ sudo ufw status
```

4. Now, open the VSFTPD config file and define the SSL details in it:

```
$ sudo vi /etc/vsftpd/vsftpd.conf
OR
$ sudo nano /etc/vsftpd/vsftpd.conf
```

Then, add or locate the option `ssl_enable` and set its value to YES to activate the use of SSL, again, because TLS is more secure than SSL, we will restrict VSFTPD to use TLS instead, by enabling the `ssl_tlsv1` option:

```
ssl_enable=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
```

5. Next, comment out the lines below using the `#` character as follows:

```
#rsa_cert_file=/etc/ssl/private/ssl-cert-snakeoil.pem
#rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
```

Afterwards, add the lines below to define the location of the SSL certificate and key file:

```
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem
```

6. Now, we also have to prevent anonymous users from using SSL, then force all non-anonymous logins to use a secure SSL connection for data transfer and to send the password during login:

```
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
```

7. Furthermore, we can use the options below to add more security features in the FTP server. With option `require_ssl_reuse=YES`, all SSL data connections are required to exhibit SSL session reuse; proving that they know the same master secret as the control channel. So, we should disable it.

```
require_ssl_reuse=NO
```

In addition, we can set which SSL ciphers VSFTPD will permit for encrypted SSL connections with the `ssl_ciphers` option. This will help frustrate any efforts by attackers who try to force a specific cipher which they possibly discovered vulnerabilities in:

```
ssl_ciphers=HIGH
```

8. Then, let’s define the port range (min and max port) of passive ports.

```
pasv_min_port=40000
pasv_max_port=50000
```

9. To enable SSL debugging, meaning openSSL connection diagnostics are recorded to the VSFTPD log file, we can use the `debug_ssl` option:

```
debug_ssl=YES
```

Finally save the file and close it. Then restart VSFTPD service:

```
$ systemctl restart vsftpd
```

### Step 3: Verify FTP with SSL/TLS Connections on Ubuntu

10. After performing all the above configurations, test if VSFTPD is now using SSL/TLS connections by trying to [use FTP from the command line][5] as below.

From the output below, there is an error message telling us VSFTPD can only permit users (non-anonymous) to login from secure clients which support encryption services.

```
$ ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : ravi
530 Non-anonymous sessions must use encryption.
Login failed.
421 Service not available, remote server has closed connection
ftp>
```

The command line doesn’t support encryption services thus resulting to the error above. Therefore, to securely connect to a FTP server with encryption services enabled, we need a FTP client that supports SSL/TLS connections by default, such as FileZilla.

### Step 4:Install FileZilla On Clients to Connect FTP Securely

FileZilla is a powerful, widely used cross-platform FTP client which supports FTP over SSL/TLS and more. To install FileZilla on a Linux client machine, use the following command.

```
--------- On Debian/Ubuntu ---------
$ sudo apt-get install filezilla   
--------- On CentOS/RHEL/Fedora --------- 
# yum install epel-release filezilla
--------- On Fedora 22+ --------- 
$ sudo dnf install filezilla
```

12. Once the installation completes, open it and go to File=>Sites Manager or (press Ctrl+S) to get the Site Manager interface below.

[
 ![Filezilla Site Manager](http://www.tecmint.com/wp-content/uploads/2017/02/Filezilla-Site-Manager.png) 
][6]

Filezilla Site Manager

13. Now, define the host/site name, add the IP address, define the protocol to use, encryption and logon type as in the screen shot below (use values that apply to your scenario):

Click on New Site button to configure a new site/host connection.

```
Host:  192.168.56.10
Protocol:  FTP – File Transfer Protocol
Encryption:  Require explicit FTP over   #recommended 
Logon Type: Ask for password	        #recommended 
User: username
```
[
 ![Configure New FTP Site on Filezilla](http://www.tecmint.com/wp-content/uploads/2017/02/Configure-New-FTP-Site-on-Filezilla.png) 
][7]

Configure New FTP Site on Filezilla

14. Then click on Connect from the interface above to enter the password, and then verify the certificate being used for the SSL/TLS connection, and click OK once more to connect to the FTP server:

[
 ![Verify FTP SSL Certificate](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-SSL-Certificate-1.png) 
][8]

Verify FTP SSL Certificate

15. Now, you should have logged successfully into the FTP server over a TLS connection, check the connection status section for more information from the interface below.

[
 ![Connected to Ubuntu FTP Server](http://www.tecmint.com/wp-content/uploads/2017/02/Connected-Ubuntu-FTP-Server.png) 
][9]

Connected to Ubuntu FTP Server

16. Lastly, let’s [transfer files from the local machine to the FTP sever][10] in the files folder, take a look at the lower end of the FileZilla interface to view reports concerning file transfers.

[
 ![Secure FTP File Transfer using Filezilla](http://www.tecmint.com/wp-content/uploads/2017/02/Transfer-Files-Securely-using-FTP.png) 
][11]

Secure FTP File Transfer using Filezilla

That’s all! Always remember that installing a FTP server without enabling encryption services has certain security implications. As we explained in this tutorial, you can configure a FTP server to use SSL/TLS connections to implement security in Ubuntu 16.04/16.10.

If you face any issues in setting up SSL/TLS on FTP server, do use the comment form below to share your problems or thoughts concerning this tutorial/topic.

--------------------------------------------------------------------------------


作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/secure-ftp-server-using-ssl-tls-on-ubuntu/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/install-ftp-server-in-ubuntu/
[2]:http://www.tecmint.com/axel-commandline-download-accelerator-for-linux/
[3]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[4]:http://www.tecmint.com/how-to-install-and-configure-ufw-firewall/
[5]:http://www.tecmint.com/sftp-command-examples/
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Filezilla-Site-Manager.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Configure-New-FTP-Site-on-Filezilla.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-SSL-Certificate-1.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Connected-Ubuntu-FTP-Server.png
[10]:http://www.tecmint.com/sftp-command-examples/
[11]:http://www.tecmint.com/wp-content/uploads/2017/02/Transfer-Files-Securely-using-FTP.png
[12]:http://www.tecmint.com/author/aaronkili/
[13]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[14]:http://www.tecmint.com/free-linux-shell-scripting-books/
