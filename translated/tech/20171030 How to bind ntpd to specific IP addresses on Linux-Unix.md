如何在 Linux/Unix 之上绑定 ntpd 到特定的 IP 地址
======

默认的情况下，我们的 ntpd/NTP 服务器会监听所有的端口或者 IP 地址，也就是：0.0.0.0:123。 怎么才可以在一个 Linux 或是 FreeBSD Unix 服务器上，确保只监听特定的 IP 地址，比如 localhost 或者是  192.168.1.1:123 ？

NTP 是网络时间协议的首字母简写，这是一个用来同步两台电脑之间时间的协议。ntpd 是一个操作系统守护进程，可以设置并且保证系统的时间与互联网标准时间服务器同步。

[![如何在Linux和Unix服务器，防止 NTPD 监听0.0.0.0:123 并将其绑定到特定的 IP 地址][1]][1]

NTP使用 `/etc/directory` 之下的 `ntp.conf`作为配置文件。



## /etc/ntp.conf 之中的端口指令

你可以通过设置端口命令来防止 ntpd 监听 0.0.0.0:123，语法如下：

```
interface listen IPv4|IPv6|all
interface ignore IPv4|IPv6|all
interface drop IPv4|IPv6|all
```

上面的配置可以使 ntpd 监听或者断开一个网络地址而不需要任何的请求。**这样将会** 举个例子，如果要忽略所有端口之上的监听，加入下面的语句到`/etc/ntp.conf`：

The above configures which network addresses ntpd listens or dropped without processing any requests. **The ignore prevents opening matching addresses, drop causes ntpd to open the address and drop all received packets without examination.** For example to ignore listing on all interfaces, add the following in /etc/ntp.conf:

`interface ignore wildcard`

如果只监听 127.0.0.1 和 192.168.1.1 则是这样：

```
interface listen 127.0.0.1
interface listen 192.168.1.1
```

这是我 FreeBSD 云服务器上的样例 /etc/ntp.conf 文件:

`$ egrep -v '^#|$^' /etc/ntp.conf`

样例输出为:

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


## 重启 ntpd

在 FreeBSD Unix 之上重新加载/重启 ntpd

`$ sudo /etc/rc.d/ntpd restart`
或者 [在Debian和Ubuntu Linux 之上使用下面的命令][2]:
`$ sudo systemctl restart ntp`
或者 [在CentOS/RHEL 7/Fedora Linux 之上使用下面的命令][2]:
`$ sudo systemctl restart ntpd`

## 校验

使用 `netstat` 和 `ss` 命令来检查 ntpd只绑定到了特定的 IP 地址：

`$ netstat -tulpn | grep :123`
或是
`$ ss -tulpn | grep :123`
样例输出:

```
udp        0      0 10.105.28.1:123         0.0.0.0:*                           -               
udp        0      0 172.16.3.1:123          0.0.0.0:*                           -
```
使用

使用 [socksata命令（FreeBSD Unix 服务群）][3]:

```
$ sudo sockstat
$ sudo sockstat -4
$ sudo sockstat -4 | grep :123
```


样例输出:

```
root     ntpd       59914 22 udp4   127.0.0.1:123         *:*
root     ntpd       59914 24 udp4   127.0.1.1:123         *:*
```



## Vivek Gite 投稿

这个作者是 nixCraft 的作者并且是一位经验丰富的系统管理员，也是一名 Linux 操作系统和 Unix shell 脚本的训练师。他为全球不同行业，包括 IT、教育业、安全防护、空间研究和非营利性组织的客户工作。关注他的 [Twitter][4], [Facebook][5], [Google+][6]。



--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-bind-ntpd-to-specific-ip-addresses-on-linuxunix/

作者：[Vivek Gite][a]
译者：[Drshu](https://github.com/Drshu)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2017/10/how-to-prevent-ntpd-to-listen-on-all-interfaces-on-linux-unix-box.jpg
[2]:https://www.cyberciti.biz/faq/restarting-ntp-service-on-linux/
[3]:https://www.cyberciti.biz/faq/freebsd-unix-find-the-process-pid-listening-on-a-certain-port-commands/
[4]:https://twitter.com/nixcraft
[5]:https://facebook.com/nixcraft
[6]:https://plus.google.com/+CybercitiBiz
