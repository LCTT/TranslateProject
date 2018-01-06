How to bind ntpd to specific IP addresses on Linux/Unix
======
By default, my ntpd/NTP server listens on all interfaces or IP address i.e 0.0.0.0:123. How do I make sure ntpd only listen on a specific IP address such as localhost or 192.168.1.1:123 on a Linux or FreeBSD Unix server?

NTP is an acronym for Network Time Protocol. It is used for clock synchronization between computers. The ntpd program is an operating system daemon which sets and maintains the system time of day in synchronism with Internet standard time servers.
[![How to prevent NTPD from listening on 0.0.0.0:123 and binding to specific IP addresses on a Linux/Unix server][1]][1]
The NTP is configured using ntp.conf located in /etc/ directory.

## interface directive in /etc/ntp.conf


You can prevent ntpd to listen on 0.0.0.0:123 by setting the interface command. The syntax is:
`interface listen IPv4|IPv6|all
interface ignore IPv4|IPv6|all
interface drop IPv4|IPv6|all`
The above configures which network addresses ntpd listens or dropped without processing any requests. The ignore prevents opening matching addresses, drop causes ntpd to open the address and drop all received packets without examination. For example to ignore listing on all interfaces, add the following in /etc/ntp.conf:
`interface ignore wildcard`
To listen to only 127.0.0.1 and 192.168.1.1 addresses:
`interface listen 127.0.0.1
interface listen 192.168.1.1`
Here is my sample /etc/ntp.conf file from FreeBSD cloud server:
`$ egrep -v '^#|$^' /etc/ntp.conf`
Sample outputs:
```
tos minclock 3 maxclock 6
pool 0.freebsd.pool.ntp.org iburst
restrict    default limited kod nomodify notrap noquery nopeer
restrict -6 default limited kod nomodify notrap noquery nopeer
restrict    source  limited kod nomodify notrap noquery
restrict 127.0.0.1
restrict -6 ::1
leapfile "/var/db/ntpd.leap-seconds.list"
interface ignore wildcard
interface listen 172.16.3.1
interface listen 10.105.28.1
```


## Restart ntpd

Reload/restart the ntpd on a FreeBSD unix:
`$ sudo /etc/rc.d/ntpd restart`
OR [use the following command on a Debian/Ubuntu Linux][2]:
`$ sudo systemctl restart ntp`
OR [use the following on a CentOS/RHEL 7/Fedora Linux][2]:
`$ sudo systemctl restart ntpd`

## Verification

Use the netstat command/ss command for verification or to make sure ntpd bind to the specific IP address only:
`$ netstat -tulpn | grep :123`
OR
`$ ss -tulpn | grep :123`
Sample outputs:
```
udp        0      0 10.105.28.1:123         0.0.0.0:*                           -               
udp        0      0 172.16.3.1:123          0.0.0.0:*                           -
```

udp 0 0 10.105.28.1:123 0.0.0.0:* - udp 0 0 172.16.3.1:123 0.0.0.0:* -

Use [the sockstat command on a FreeBSD Unix server][3]:
`$ sudo sockstat
$ sudo sockstat -4
$ sudo sockstat -4 | grep :123`
Sample outputs:
```
root     ntpd       59914 22 udp4   127.0.0.1:123         *:*
root     ntpd       59914 24 udp4   127.0.1.1:123         *:*
```

root ntpd 59914 22 udp4 127.0.0.1:123 *:* root ntpd 59914 24 udp4 127.0.1.1:123 *:*

## Posted by:Vivek Gite

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][4], [Facebook][5], [Google+][6].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-bind-ntpd-to-specific-ip-addresses-on-linuxunix/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2017/10/how-to-prevent-ntpd-to-listen-on-all-interfaces-on-linux-unix-box.jpg
[2]:https://www.cyberciti.biz/faq/restarting-ntp-service-on-linux/
[3]:https://www.cyberciti.biz/faq/freebsd-unix-find-the-process-pid-listening-on-a-certain-port-commands/
[4]:https://twitter.com/nixcraft
[5]:https://facebook.com/nixcraft
[6]:https://plus.google.com/+CybercitiBiz
