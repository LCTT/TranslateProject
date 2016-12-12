翻译中 by zky001
How to check if port is in use on Linux or Unix
============================================================

[
 ![](https://s0.cyberciti.org/images/category/old/linux-logo.png)
][1]

How do I determine if a port is in use under Linux or Unix-like system? How can I verify which ports are listening on Linux server?

It is important you verify which ports are listing on the server’s network interfaces. You need to pay attention to open ports to detect an intrusion. Apart from an intrusion, for troubleshooting purposes, it may be necessary to check if a port is already in use by a different application on your servers. For example, you may install Apache and Nginx server on the same system. So it is necessary to know if Apache or Nginx is using TCP port # 80/443\. This quick tutorial provides steps to use the netstat, nmap and lsof command to check the ports in use and view the application that is utilizing the port.

### How to check the listening ports and applications on Linux:

1.  Open a terminal application i.e. shell prompt.
2.  Run any one of the following command:
  
  ```
  sudo lsof -i -P -n | grep LISTEN 
  sudo netstat -tulpn | grep LISTEN
  sudo nmap -sTU -O IP-address-Here
  ```
  
Let us see commands and its output in details.

### Option #1: lsof command

The syntax is:

```
$ sudo lsof -i -P -n
$ sudo lsof -i -P -n | grep LISTEN
$ doas lsof -i -P -n | grep LISTEN 
```

### [OpenBSD] ###

Sample outputs:

[
 ![Fig.01: Check the listening ports and applications with lsof command](https://s0.cyberciti.org/uploads/faq/2016/11/lsof-outputs.png) 
][2]

Fig.01: Check the listening ports and applications with lsof command

Consider the last line from above outputs:

```
sshd    85379     root    3u  IPv4 0xffff80000039e000      0t0  TCP 10.86.128.138:22 (LISTEN)
```

- sshd is the name of the application.
- 10.86.128.138 is the IP address to which sshd application bind to (LISTEN)
- 22 is the TCP port that is being used (LISTEN)
- 85379 is the process ID of the sshd process

### Option #2: netstat command

You can check the listening ports and applications with netstat as follows.

### Linux netstat syntax

```
$ netstat -tulpn | grep LISTEN
```

### FreeBSD/MacOS X netstat syntax

```
$ netstat -anp tcp | grep LISTEN
$ netstat -anp udp | grep LISTEN
```

### OpenBSD netstat syntax

````
$ netstat -na -f inet | grep LISTEN
$ netstat -nat | grep LISTEN
```

### Option #3: nmap command

The syntax is:

```
$ sudo nmap -sT -O localhost
$ sudo nmap -sU -O 192.168.2.13 ##[ list open UDP ports ]##
$ sudo nmap -sT -O 192.168.2.13 ##[ list open TCP ports ]##
```

Sample outputs:

[
 ![Fig.02: Determines which ports are listening for TCP connections using nmap](https://s0.cyberciti.org/uploads/faq/2016/11/nmap-outputs.png) 
][3]

Fig.02: Determines which ports are listening for TCP connections using nmap

You can combine TCP/UDP scan in a single command:

`$ sudo nmap -sTU -O 192.168.2.13`

### A note about Windows users

You can check port usage from Windows operating system using following command:

```
netstat -bano | more
netstat -bano | grep LISTENING
netstat -bano | findstr /R /C:"[LISTING]"
````

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/

作者：[ VIVEK GITE][a]
译者：[zky001](https://github.com/zky001)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/
[1]:https://www.cyberciti.biz/faq/category/linux/
[2]:http://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/lsof-outputs/
[3]:http://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/nmap-outputs/
