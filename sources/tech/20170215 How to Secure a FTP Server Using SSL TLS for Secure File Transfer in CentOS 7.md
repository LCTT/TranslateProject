How to Secure a FTP Server Using SSL/TLS for Secure File Transfer in CentOS 7
============================================================

By its original design, FTP (File Transfer Protocol) is not secure, meaning it doesn’t encrypt data being transmitted between two machines, along with user’s credentials. This poses a massive threat to data as well as server security.

In this tutorial, we will explain how to manually enable data encryption services in a FTP server in CentOS/RHEL 7 and Fedora; we will go through various steps of securing VSFTPD (Very Secure FTP Daemon) services using SSL/TLS certificates.

#### Prerequisites:

1.  You must have [installed and configured a FTP server in CentOS 7][1]

Before we start, note that all the commands in this tutorial will be run as root, otherwise, use the [sudo command][2] to gain root privileges if you are not controlling the server using the root account.

### Step 1\. Generating SSL/TLS Certificate and Private Key

1. We need to start by creating a subdirectory under: `/etc/ssl/` where we will store the SSL/TLS certificate and key files:

```
# mkdir /etc/ssl/private
```

2. Then run the command below to create the certificate and key for vsftpd in a single file, here is the explanation of each flag used.

1.  req – is a command for X.509 Certificate Signing Request (CSR) management.
2.  x509 – means X.509 certificate data management.
3.  days – defines number of days certificate is valid for.
4.  newkey – specifies certificate key processor.
5.  rsa:2048 – RSA key processor, will generate a 2048 bit private key.
6.  keyout – sets the key storage file.
7.  out – sets the certificate storage file, note that both certificate and key are stored in the same file: /etc/ssl/private/vsftpd.pem.

```
# openssl req -x509 -nodes -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -days 365 -newkey rsa:2048
```

The above command will ask you to answer the questions below, remember to use values that apply to your scenario.

```
Country Name (2 letter code) [XX]:IN
State or Province Name (full name) []:Lower Parel
Locality Name (eg, city) [Default City]:Mumbai
Organization Name (eg, company) [Default Company Ltd]:TecMint.com
Organizational Unit Name (eg, section) []:Linux and Open Source
Common Name (eg, your name or your server's hostname) []:tecmint
Email Address []:admin@tecmint.com
```

### Step 2\. Configuring VSFTPD To Use SSL/TLS

3. Before we perform any VSFTPD configurations, let’s open the ports 990 and 40000-50000 to allow TLS connections and the port range of passive ports to define in the VSFTPD configuration file respectively:

```
# firewall-cmd --zone=public --permanent --add-port=990/tcp
# firewall-cmd --zone=public --permanent --add-port=40000-50000/tcp
# firewall-cmd --reload
```

4. Now, open the VSFTPD config file and specify the SSL details in it:

```
# vi /etc/vsftpd/vsftpd.conf
```

Look for the option ssl_enable and set its value to `YES` to activate the use of SSL, in addition, since TSL is more secure than SSL, we will restrict VSFTPD to employ TLS instead, using the ssl_tlsv1_2 option:

```
ssl_enable=YES
ssl_tlsv1_2=YES
ssl_sslv2=NO
ssl_sslv3=NO
```

5. Then, add the lines below to define the location of the SSL certificate and key file:

```
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem
```

6. Next, we have to prevent anonymous users from using SSL, then force all non-anonymous logins to use a secure SSL connection for data transfer and to send the password during login:

```
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
```

7. In addition, we can add the options below to boost up FTP server security. When option require_ssl_reuse is set to `YES`, then, all SSL data connections are required to exhibit SSL session reuse; proving that they know the same master secret as the control channel.

Therefore, we have to turn it off.

```
require_ssl_reuse=NO
```

Again, we need to select which SSL ciphers VSFTPD will permit for encrypted SSL connections with the ssl_ciphers option. This can greatly limit efforts of attackers who try to force a particular cipher which they probably discovered vulnerabilities in:

```
ssl_ciphers=HIGH
```

8. Now, set the port range (min and max port) of passive ports.

```
pasv_min_port=40000
pasv_max_port=50000
```

9. Optionally, allow SSL debugging, meaning openSSL connection diagnostics are recorded to the VSFTPD log file with the debug_ssl option:

```
debug_ssl=YES
```

Save all the changes and close the file. Then let’s restart VSFTPD service:

```
# systemctl restart vsftpd
```

### Step 3: Testing FTP server With SSL/TLS Connections

10. After doing all the above configurations, test if VSFTPD is using SSL/TLS connections by attempting to use FTP from the command line as follows:

```
# ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : ravi
530 Non-anonymous sessions must use encryption.
Login failed.
421 Service not available, remote server has closed connection
ftp>
```
[
 ![Verify FTP SSL Secure Connection](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-Secure-Connection.png) 
][3]

Verify FTP SSL Secure Connection

From the screen shot above, we can see that there is an error informing us that VSFTPD can only allow user to login from clients that support encryption services.

The command line does not offer encryption services thus producing the error. So, to securely connect to the server, we need a FTP client that supports SSL/TLS connections such as FileZilla.

### Step 4: Install FileZilla to Securely Connect to a FTP Server

11. FileZilla is a modern, popular and importantly cross-platform FTP client that supports SSL/TLS connections by default.

To install FileZilla in Linux, run the command below:

```
--------- On CentOS/RHEL/Fedora --------- 
# yum install epel-release filezilla
--------- On Debian/Ubuntu ---------
$ sudo apt-get install  filezilla   
```

12. When the installation completes (or else if you already have it installed), open it and go to File=>Sites Manager or (press `Ctrl+S`) to get the Site Manager interface below.

Click on New Site button to add a new site/host connection details.

[
 ![Add New FTP Site in Filezilla](http://www.tecmint.com/wp-content/uploads/2017/02/Add-New-FTP-Site-in-Filezilla.png) 
][4]

Add New FTP Site in Filezilla

13. Next, set the host/site name, add the IP address, define the protocol to use, encryption and logon type as in the screen shot below (use values that apply to your scenario):

```
Host:  192.168.56.10
Protocol:  FTP – File Transfer Protocol
Encryption:  Require explicit FTP over   #recommended 
Logon Type: Ask for password	        #recommended 
User: username
```
[
 ![Add FTP Server Details in Filezilla](http://www.tecmint.com/wp-content/uploads/2017/02/Add-FTP-Server-Details-in-Filezilla.png) 
][5]

Add FTP Server Details in Filezilla

14. Then click on Connect to enter the password again, and then verify the certificate being used for the SSL/TLS connection and click `OK` once more to connect to the FTP server:

[
 ![Verify FTP SSL Certificate](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-SSL-Certificate.png) 
][6]

Verify FTP SSL Certificate

At this stage, we should have logged successfully into the FTP server over a TLS connection, check the connection status section for more information from the interface below.

[
 ![Connected to FTP Server Over TLS/SSL ](http://www.tecmint.com/wp-content/uploads/2017/02/connected-to-ftp-server-with-tls.png) 
][7]

Connected to FTP Server Over TLS/SSL

15. Last but not least, try [transferring files from the local machine to the FTP sever][8] in the files folder, take a look at the lower end of the FileZilla interface to view reports concerning file transfers.

[
 ![Transfer Files Securely Using FTP](http://www.tecmint.com/wp-content/uploads/2017/02/Transfer-Files-Securely-Using-FTP.png) 
][9]

Transfer Files Securely Using FTP

That’s all! Always keep in mind that FTP is not secure by default, unless we configure it to use SSL/TLS connections as we showed you in this tutorial. Do share your thoughts about this tutorial/topic via the feedback form below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/secure-vsftpd-using-ssl-tls-on-centos/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/install-ftp-server-in-centos-7/
[2]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-Secure-Connection.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-New-FTP-Site-in-Filezilla.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-FTP-Server-Details-in-Filezilla.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-SSL-Certificate.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/connected-to-ftp-server-with-tls.png
[8]:http://www.tecmint.com/sftp-command-examples/
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Transfer-Files-Securely-Using-FTP.png
