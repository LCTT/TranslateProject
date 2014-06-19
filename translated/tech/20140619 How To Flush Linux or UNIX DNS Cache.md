如何清除 Linux/Unix DNS缓存
================================================================================
![](http://figs.cyberciti.biz/3rdparty/configure.png)

我在Linux下使用拨号连接上网，频繁的拨号断线造成DNS的问题。我如何在Linux/Unix发行版下使用shell命令清除DNS缓存？


在MS-Windows下,你可以使用[ipconfig命令来清除dns缓存][1]。然而，Linux和Unix提供了不同的方法来清除缓存。Linux可以运行nscd或者BIND或者dnsmasq作为名称服务缓存守护进程。大型或者工作组服务器可能使用BIND或者dnsmasq作为专用缓存服务器来加速查询。

### 如何: 清除 nscd dns 缓存 ###

Nscd caches libc-issued requests to the Name Service. If retrieving NSS data is fairly expensive, nscd is able to speed up consecutive access to the same data dramatically and increase overall system performance. Just restart nscd:
Nscd缓存libc发给名称服务的请求。如果检索NSS数据是很昂贵的，那么nscd能够显著加快连续访问同一数据并提高整个系统的性能。只需重启nscd：

    $ sudo /etc/init.d/nscd restart

或

    # service nscd restart

或

    # service nscd reload

这个守护进程给最常用的名称服务请求提供了高速缓存。默认的配置文件/etc/nscd.conf，决定了高速缓存守护进程的行为。

### 清除 dnsmasq dns 缓存 ###

[dnsmasq的是一个轻量级的DNS][2]，TFTP和DHCP服务器。它的目的是给局域网提供耦合的DNS和DHCP服务。 dnsmasq的接受DNS查询，并从本地高速缓存应答它们或将其转发到一个真正的递归DNS服务器。该软件也安装了很多便宜的路由器来缓存DNS查询。只需启动dnsmasq的服务来清除DNS缓存：

    $ sudo /etc/init.d/dnsmasq restart

或者

    # service dnsmasq restart

### 清除BIND缓存服务器的dns缓存 ###

A caching BIND server obtains information from another server (a Zone Master) in response to a host query and then saves (caches) the data locally. All you have to do is restart bind to clear its cache:
一台BIND缓存服务器从另一台服务器（区域主）响应主机的查询而获得信息，然后保存（缓存)数据到本地。您所要做的就是重新绑定以清除其缓存：

    # /etc/init.d/named restart

你也可以使用下面rndc命令来清除所有的缓存:

    # rndc restart

或者

    # rndc exec

flushname命令刷新所有的连接到一个特定的域名的记录。本例中刷新cyberciti.biz相关域的所有记录：

    # rndc flushname cyberciti.biz

它同样也可以用来清除BIND View.比如,LAN和WAN的View可以用下面的命令清除:

    # rndc flush lan
    # rndc flush wan

###  Mac OS X Unix 用户提示 ###

使用root用户输入下面的命令:

    # dscacheutil -flushcache

或者

    $ sudo dscacheutil -flushcache

如果你正在使用OSX 10.5 或者更早的版本,尝试使用下面的命令:

    lookupd -flushcache

### /etc/hosts 文件的一个提示 ###

/etc/hosts作为一个静态查询主机的表格。你需要在类Unix操作系统下依据你的要求移除并且/或者更新它：

    # vi /etc/hosts

#### 示例输出: ####

    127.0.0.1	localhost
    127.0.1.1	wks01.WAG160N	wks01
    # The following lines are desirable for IPv6 capable hosts
    ::1     ip6-localhost ip6-loopback
    fe00::0 ip6-localnet
    ff00::0 ip6-mcastprefix
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
    10.37.34.2     build
    192.168.1.10	nas01
    192.168.1.11	nas02
    192.168.1.12	nas03
    #192.168.2.50	nfs2.nixcraft.net.in nfs2
    #192.168.2.51	nfs1.nixcraft.net.in nfs1
    172.168.232.50  nfs1.nixcraft.net.in nfs1
    172.168.232.51  nfs2.nixcraft.net.in nfs2
    192.168.1.101	vm01

### 再看这里: ###

相关: 在Windows Vista / XP中用ipconfig 命令[ 清除 DNS 缓存][3]

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/rhel-debian-ubuntu-flush-clear-dns-cache/

译者：[geekpi](https://github.com/译者ID) 校对：[geekpi](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://theos.in/windows-vista/flush-dns-cache-with-ipconfig/
[2]:http://www.cyberciti.biz/tips/how-do-i-improve-dns-performance-on-linuxwindows-desktop.html
[3]:http://theos.in/windows-vista/flush-dns-cache-with-ipconfig/
