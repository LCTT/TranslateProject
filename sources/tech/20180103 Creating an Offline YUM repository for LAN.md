translating by lujun9972
Creating an Offline YUM repository for LAN
======
In our earlier tutorial, we discussed " **[How we can create our own yum repository with ISO image& by mirroring an online yum repository][1]** ". Creating your own yum repository is a good idea but not ideal if you are only using 2-3 Linux machines on your network. But it definitely has advantages when you have large number of Linux servers on your network that are updated regularly or when you have some sensitive Linux machines that can't be exposed to Internet directly.

When we have large number of Linux systems & each system is updating directly from internet, data consumed will be enormous. In  order to save the data, we can create an offline yum & share it over our Local network. Other Linux machines on network will then fetch system updates directly from this Local yum, thus saving data & also transfer speed also be very good since we will be on our local network.

We can share our yum repository using any of the following or both methods:

  *  **Using Web Server (Apache)**
  *  **Using ftp (VSFTPD)**



We will be discussing both of these methods but before we start, you should create a YUM repository using my earlier tutorial ( **[READ HERE][1]** )


##  Using Web Server

Firstly we need to install web-server (Apache) on our yum server which has IP address **192.168.1.100**. Since we have already configured a yum repository for this system, we will install apache web server using yum command,

```
$ yum install httpd
```

Next, we need to copy all the rpm packages to default apache root directory i.e. **/var/www/html** or since we have already copied our packages to **/YUM** , we can create a symbolic link from /var/www/html to /YUM

```
$ ln -s /var/www/html/Centos /yum
```

Restart you web-server to implement changes

```
$ systemctl restart httpd
```


### Configuring client machine

Configurations for sharing Yum repository on server side are complete & now we will configure our client machine, with an IP address **192.168.1.101** , to receive updates from our created offline yum.

Create a file named **offline-yum.repo** in **/etc/yum.repos.d** folder & enter the following details,

```
$ vi /etc/yum.repos.d/offline-yum.repo
```

```
name=Local YUM
baseurl=http://192.168.1.100/CentOS/7
gpgcheck=0
enabled=1
```

We have configured your Linux machine to receive updates over LAN from your offline yum repository. To confirm if the repository is working fine, try to install/update packages using yum command.

##  Using FTP server

For sharing our YUM over ftp, we will firstly install the required package i.e vsftpd

```
$ yum install vsftpd
```

Default root directory for vsftp is /var/ftp/pub, so either copy rpm packages to this folder or create a symbolic link from /var/ftp/pub,

```
$ ln -s /var/ftp/pub /YUM
```

Now, restart server for implement the changes

```
$ systemctl restart vsftpd
```

### Configuring client machine

We will now create a file named **offline-yum.repo** in **/etc/yum.repos.d** , as we did above  & enter the following details,

```
$ vi /etc/yum.repos.d/offline-yum.repo
```

```
[Offline YUM]
name=Local YUM
baseurl=ftp://192.168.1.100/pub/CentOS/7
gpgcheck=0
enabled=1
```

Your client machine is now ready to receive updates over ftp. For configuring vsftpd server to share files with other Linux system , [**read tutorial here**][2].

Both methods for sharing an offline yum over LAN are good & you can choose either of them, both of these methods should work fine. If you are having any queries/comments, please share them in the comment box down below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/offline-yum-repository-for-lan/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/creating-yum-repository-iso-online-repo/
[2]:http://linuxtechlab.com/ftp-secure-installation-configuration/
