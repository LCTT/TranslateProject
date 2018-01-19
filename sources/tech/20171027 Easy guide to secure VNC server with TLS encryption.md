translating---geekpi

Easy guide to secure VNC server with TLS encryption
======
In this tutorial, we will learn to install VNC server & secure VNC server sessions with TLS encryption.
This method has been tested on CentOS 6 & 7 but should work on other versions/OS as well (RHEL, Scientific Linux etc).

**(Recommended Read:[Ultimate guide for Securing SSH sessions][1] )**

### Installing VNC server

Before we install VNC server on our machines, make sure we are have a working GUI. If GUI is not installed on our machine, we can install it by executing the following command,

```
yum groupinstall "GNOME Desktop"
```

Now we will tigervnc as our VNC server, to install it run,

```
# yum install tigervnc-server
```

Once VNC server has been installed, we will create a new user to access the server,

```
# useradd vncuser
```

& assign it a password for accessing VNC by using following command,

```
# vncpasswd vncuser
```

Now we have a little change in configuration on CentOS 6 & 7, we will first address the CentOS 6 configuration,

#### CentOS 6

Now we need to edit VNC configuration file,

```
 **# vim /etc/sysconfig/vncservers**
```

& add the following lines,

```
[ …]
VNCSERVERS= "1:vncuser"
VNCSERVERARGS[1]= "-geometry 1024×768″
```

Save the file & exit. Next restart the vnc service to implement the changes,

```
# service vncserver restart
```

& enable it at boot,

```
# chkconfig vncserver on
```

#### CentOS 7

On CentOS 7, /etc/sysconfig/vncservers file has been changed to /lib/systemd/system/vncserver@.service. We will use this configuration file as reference, so create a copy of the file,

```
# cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
```

Next we will edit the file to include our created user,

```
# vim /etc/systemd/system/vncserver@:1.service
```

& edit the user on the following 2 lines,

```
ExecStart=/sbin/runuser -l vncuser -c "/usr/bin/vncserver %i"
PIDFile=/home/vncuser/.vnc/%H%i.pid
```

Save file & exit. Next restart the service & enable it at boot,

```
systemctl restart[[email protected]][2]:1.service
systemctl enable[[email protected]][2]:1.service
```

We now have our VNC server ready & can connect to it from a client machine using the IP address of VNC server. But we before we do that, we will secure our connections with TLS encryption.

### Securing the VNC session

To secure VNC server session, we will first configure the encryption method to secure VNC server sessions. We will be using TLS encryption but can also use SSL encryption. Execute the following command to start using TLS encrytption on VNC server,

```
# vncserver -SecurityTypes=VeNCrypt,TLSVnc
```

You will asked to enter a password to access VNC (if using any other user, than the above mentioned user)

![secure vnc server][4]

We can now access the server using the VNC viewer from the client machine, use the following command to start vnc viewer with secure connection,

 **# vncviewer -SecurityTypes=VeNCrypt,TLSVnc 192.168.1.45:1**

here, 192.168.1.45 is the IP address of the VNC server.

![secure vnc server][6]

Enter the password & we can than access the server remotely & that too with TLS encryption.

This completes our tutorial, feel free to send your suggestions or queries using the comment box below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/secure-vnc-server-tls-encryption/

作者：[Shusain][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/ultimate-guide-to-securing-ssh-sessions/
[2]:/cdn-cgi/l/email-protection
[3]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=642%2C241
[4]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2017/10/secure_vnc-1.png?resize=642%2C241
[5]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=665%2C419
[6]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/10/secure_vnc-2.png?resize=665%2C419
