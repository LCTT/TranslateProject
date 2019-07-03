[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Find The Port Number Of A Service In Linux)
[#]: via: (https://www.ostechnix.com/how-to-find-the-port-number-of-a-service-in-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Find The Port Number Of A Service In Linux
======

![Find The Port Number Of A Service In Linux OS][1]

You might often need to find the port names and numbers for some reasons. If so, you’re in luck. Today, in this brief tutorial, we are going to see the easiest and quickest ways to find the port number of a service in Linux operating system. There could be many methods to do it, but I am aware of the following three methods only at present. Read on.

### Find The Port Number Of A Service In Linux

**Method 1 – Using[Grep][2] command:**

To find the default port number of a given service in Linux using grep command, just run:

```
$ grep <port> /etc/services
```

For example, to find the default port of a SSH service, simply run:

```
$ grep ssh /etc/services
```

It’s that simple. This command should work on most Linux distributions. Here is the sample output from my Arch Linux test box:

```
ssh 22/tcp
ssh 22/udp
ssh 22/sctp
sshell 614/tcp
sshell 614/udp
netconf-ssh 830/tcp
netconf-ssh 830/udp
sdo-ssh 3897/tcp
sdo-ssh 3897/udp
netconf-ch-ssh 4334/tcp
snmpssh 5161/tcp
snmpssh-trap 5162/tcp
tl1-ssh 6252/tcp
tl1-ssh 6252/udp
ssh-mgmt 17235/tcp
ssh-mgmt 17235/udp
```

As you can see in the above output, the default port number of SSH service is 22.

Let us find the port number of Apache web server. To do so, the command would be:

```
$ grep http /etc/services
# http://www.iana.org/assignments/port-numbers
http 80/tcp www www-http # WorldWideWeb HTTP
http 80/udp www www-http # HyperText Transfer Protocol
http 80/sctp # HyperText Transfer Protocol
https 443/tcp # http protocol over TLS/SSL
https 443/udp # http protocol over TLS/SSL
https 443/sctp # http protocol over TLS/SSL
gss-http 488/tcp
gss-http 488/udp
webcache 8080/tcp http-alt # WWW caching service
webcache 8080/udp http-alt # WWW caching service
[...]
```

How about FTP port number? That’s easy!

```
$ grep ftp /etc/services
ftp-data 20/tcp
ftp-data 20/udp
# 21 is registered to ftp, but also used by fsp
ftp 21/tcp
ftp 21/udp fsp fspd
tftp 69/tcp
[...]
```

**Method 2 – Using getent command**

As you can see, the above commands shows all port names and numbers for the given search term “ssh”, “http” and “ftp”. That means, you will get a quite long output of all port names that matches with the given search term.

You can, however, narrow down the result to exact output using “getent” command like below:

```
$ getent services ssh
ssh 22/tcp

$ getent services http
http 80/tcp www www-http

$ getent services ftp
ftp 21/tcp
```

If you don’t know the port name but the port number, simply replace the port name with number like below:

```
$ getent services 80
http 80/tcp
```

To display all port names and numbers, simply run:

```
$ getent services
```

* * *

**Suggested read:**

  * [**How To Change Apache Default Port To A Custom Port**][3]
  * [**How To Change FTP Default Port To A Custom Port**][4]
  * [**How To Change SSH Default Port To A Custom Port**][5]



* * *

**Method 3 – Using Whatportis Utility**

The **Whatportis** is a simple python script used to find port names and numbers. Unlike the above commands, this utility displays the output in a nice tabular column format.

Make sure you have installed PIP package manager. If not, refer the following link.

  * [**How To Manage Python Packages Using Pip**][6]



Once installed PIP, run the following command to install Whatportis utility.

```
$ pip install whatportis
```

Now, you can find what port is associated with a service as shown below.

```
$ whatportis ssh

$ whatportis ftp

$ whatportis http
```

Sample output from my CentOS 7 server:

![][7]

Find The Port Number Of A Service In Linux

If you don’t know the exact name of a service, use **–like** flag to display the relevant results.

```
$ whatportis mysql --like
```

The above commands helped you to find what port is associated with a service. You can also find what service is associated with a port number like below.

```
$ whatportis 993
```

You can even display the results in **JSON** format.

```
$ whatportis 993 --json
```

![][8]

For more details, refer the GitHub repository.

  * [**Whatportis GitHub Repository**][9]



And, that’s all for now. You know now how to find the port names and numbers in Linux using three simple methods. If you know any other methods/commands, let me know in the comment section below. I will check and update this guide accordingly.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-find-the-port-number-of-a-service-in-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2018/06/Find-The-Port-Number-720x340.png
[2]: https://www.ostechnix.com/the-grep-command-tutorial-with-examples-for-beginners/
[3]: https://www.ostechnix.com/how-to-change-apache-ftp-and-ssh-default-port-to-a-custom-port-part-1/
[4]: https://www.ostechnix.com/how-to-change-apache-ftp-and-ssh-default-port-to-a-custom-port-part-2/
[5]: https://www.ostechnix.com/how-to-change-apache-ftp-and-ssh-default-port-to-a-custom-port-part-3/
[6]: https://www.ostechnix.com/manage-python-packages-using-pip/
[7]: https://www.ostechnix.com/wp-content/uploads/2018/06/whatportis.png
[8]: https://www.ostechnix.com/wp-content/uploads/2018/06/whatportis-1.png
[9]: https://github.com/ncrocfer/whatportis
