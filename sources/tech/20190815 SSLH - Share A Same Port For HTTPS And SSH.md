[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SSLH – Share A Same Port For HTTPS And SSH)
[#]: via: (https://www.ostechnix.com/sslh-share-port-https-ssh/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

SSLH – Share A Same Port For HTTPS And SSH
======

![SSLH - Share A Same Port For HTTPS And SSH][1]

Some Internet service providers and corporate companies might have blocked most of the ports, and allowed only a few specific ports such as port 80 and 443 to tighten their security. In such cases, we have no choice, but use a same port for multiple programs, say the HTTPS Port **443** , which is rarely blocked. Here is where **SSLH** , a SSL/SSH multiplexer, comes in help. It will listen for incoming connections on a port 443. To put this more simply, SSLH allows us to run several programs/services on port 443 on a Linux system. So, you can use both SSL and SSH using a same port at the same time. If you ever been in a situation where most ports are blocked by the firewalls, you can use SSLH to access your remote server. This brief tutorial describes how to share a same port for https, ssh using SSLH in Unix-like operating systems.

### SSLH – Share A Same Port For HTTPS, SSH, And OpenVPN

##### Install SSLH

SSLH is packaged for most Linux distributions, so you can install it using the default package managers.

On **Debian** , **Ubuntu** , and derivatives, run:

```
$ sudo apt-get install sslh
```

While installing SSLH, you will prompted whether you want to run sslh as a service from inetd, or as a standalone server. Each choice has its own benefits. With only a few connection per day, it is probably better to run sslh from inetd in order to save resources. On the other hand, with many connections, sslh should run as a standalone server to avoid spawning a new process for each incoming connection.

![][2]

Install sslh

On **Arch Linux** and derivatives like Antergos, Manjaro Linux, install it using Pacman as shown below.

```
$ sudo pacman -S sslh
```

On **RHEL** , **CentOS** , you need to add **EPEL** repository and then install SSLH as shown below.

```
$ sudo yum install epel-release

$ sudo yum install sslh
```

On **Fedora** :

```
$ sudo dnf install sslh
```

If it is not available on default repositories, you can manually compile and install SSLH as described [**here**][3].

##### Configure Apache or Nginx webservers

As you already know, Apache and Nginx webservers will listen on all network interfaces (i.e **0.0.0.0:443** ) by default. We need to change this setting to tell the webserver to listen on the localhost interface only (i.e **127.0.0.1:443 **or **localhost:443** ).

To do so, edit the webserver (nginx or apache) configuration file and find the following line:

```
listen 443 ssl;
```

And, change it to:

```
listen 127.0.0.1:443 ssl;
```

If you’re using Virutalhosts in Apache, make sure you have changed that it too.

```
VirtualHost 127.0.0.1:443
```

Save and close the config files. Do not restart the services. We haven’t finished yet.

##### Configure SSLH

Once you have made the webservers to listen on local interface only, edit SSLH config file:

```
$ sudo vi /etc/default/sslh
```

Find the following line:

```
Run=no
```

And, change it to:

```
Run=yes
```

Then, scroll a little bit down and modify the following line to allow SSLH to listen on port 443 on all available interfaces (Eg. 0.0.0.0:443).

```
DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 --ssh 127.0.0.1:22 --ssl 127.0.0.1:443 --pidfile /var/run/sslh/sslh.pid"
```

Where,

  * –user sslh : Requires to run under this specified username.
  * –listen 0.0.0.0:443 : SSLH is listening on port 443 on all available interfaces.
  * –sshs 127.0.0.1:22 : Route SSH traffic to port 22 on the localhost.
  * –ssl 127.0.0.1:443 : Route HTTPS/SSL traffic to port 443 on the localhost.



Save and close the file.

Finally, enable and start sslh service to update the changes.

```
$ sudo systemctl enable sslh

$ sudo systemctl start sslh
```

##### Testing

Check if the SSLH daemon is listening to 443.

```
$ ps -ef | grep sslh
sslh 2746 1 0 15:51 ? 00:00:00 /usr/sbin/sslh --foreground --user sslh --listen 0.0.0.0 443 --ssh 127.0.0.1 22 --ssl 127.0.0.1 443 --pidfile /var/run/sslh/sslh.pid
sslh 2747 2746 0 15:51 ? 00:00:00 /usr/sbin/sslh --foreground --user sslh --listen 0.0.0.0 443 --ssh 127.0.0.1 22 --ssl 127.0.0.1 443 --pidfile /var/run/sslh/sslh.pid
sk 2754 1432 0 15:51 pts/0 00:00:00 grep --color=auto sslh
```

Now, you can access your remote server via SSH using port 443:

```
$ ssh -p 443 [email protected]
```

**Sample output:**

```
[email protected]'s password:
Welcome to Ubuntu 18.04.2 LTS (GNU/Linux 4.15.0-55-generic x86_64)

* Documentation: https://help.ubuntu.com
* Management: https://landscape.canonical.com
* Support: https://ubuntu.com/advantage

System information as of Wed Aug 14 13:11:04 IST 2019

System load: 0.23 Processes: 101
Usage of /: 53.5% of 19.56GB Users logged in: 0
Memory usage: 9% IP address for enp0s3: 192.168.225.50
Swap usage: 0% IP address for enp0s8: 192.168.225.51

* Keen to learn Istio? It's included in the single-package MicroK8s.

https://snapcraft.io/microk8s

61 packages can be updated.
22 updates are security updates.


Last login: Wed Aug 14 13:10:33 2019 from 127.0.0.1
```

![][4]

Access remote systems via SSH using port 443

See? I can now be able to access the remote server via SSH even if the default SSH port 22 is blocked. As you see in the above example, I have used the https port 443 for SSH connection. Also, we can use the same port 443 for openVPN connections too.

* * *

**Suggested read:**

  * [**How To SSH Into A Particular Directory On Linux**][5]
  * [**How To Create SSH Alias In Linux**][6]
  * [**How To Configure SSH Key-based Authentication In Linux**][7]
  * [**How To Stop SSH Session From Disconnecting In Linux**][8]
  * [**Allow Or Deny SSH Access To A Particular User Or Group In Linux**][9]
  * [**4 Ways To Keep A Command Running After You Log Out Of The SSH Session**][10]
  * [**ScanSSH – Fast SSH Server And Open Proxy Scanner**][11]



* * *

I tested SSLH on my Ubuntu 18.04 LTS server and it worked just fine as described above. I tested SSLH in a protected local area network, so I am not aware of the security issues. If you’re using it in production, let us know the advantages and disadvantages of using SSLH in the comment section below.

For more details, check the official GitHub page given below.

**Resource:**

  * [**SSLH GitHub Repository**][12]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/sslh-share-port-https-ssh/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2017/08/SSLH-Share-A-Same-Port-For-HTTPS-And-SSH-1-720x340.jpg
[2]: https://www.ostechnix.com/wp-content/uploads/2017/08/install-sslh.png
[3]: https://github.com/yrutschle/sslh/blob/master/doc/INSTALL.md
[4]: https://www.ostechnix.com/wp-content/uploads/2017/08/Access-remote-systems-via-SSH-using-port-443.png
[5]: https://www.ostechnix.com/how-to-ssh-into-a-particular-directory-on-linux/
[6]: https://www.ostechnix.com/how-to-create-ssh-alias-in-linux/
[7]: https://www.ostechnix.com/configure-ssh-key-based-authentication-linux/
[8]: https://www.ostechnix.com/how-to-stop-ssh-session-from-disconnecting-in-linux/
[9]: https://www.ostechnix.com/allow-deny-ssh-access-particular-user-group-linux/
[10]: https://www.ostechnix.com/4-ways-keep-command-running-log-ssh-session/
[11]: https://www.ostechnix.com/scanssh-fast-ssh-server-open-proxy-scanner/
[12]: https://github.com/yrutschle/sslh
