如何在Ubuntu,Linux Mint,Debian上禁用IPv6
================================================================================
### IPv6 ###

IPv6是寻址方案IPv4的下一个版本，被用来给域名分配数字地址。

IPv6比IPv4支持更多的地址。然而，它还没有被广泛支持，还在被接受的过程中。

### 你的系统支持IPv6么? ###

为了支持IPv6，需要很多事情。首先你需要系统/操作系统支持IPv6。Ubuntu，Linux Mint，和大多是现代发行版都支持它。如果你看一下ifconfig指令的输出，你就会看见你的网络接口被分配了IPv6地址。

    $ ifconfig
    eth0      Link encap:Ethernet  HWaddr 00:1c:c0:f8:79:ee  
              inet addr:192.168.1.2  Bcast:192.168.1.255  Mask:255.255.255.0
              inet6 addr: fe80::21c:c0ff:fef8:79ee/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:110880 errors:0 dropped:0 overruns:0 frame:0
              TX packets:111960 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:62289395 (62.2 MB)  TX bytes:25169458 (25.1 MB)
              Interrupt:20 Memory:e3200000-e3220000 
    
    lo        Link encap:Local Loopback  
              inet addr:127.0.0.1  Mask:255.0.0.0
              inet6 addr: ::1/128 Scope:Host
              UP LOOPBACK RUNNING  MTU:65536  Metric:1
              RX packets:45258 errors:0 dropped:0 overruns:0 frame:0
              TX packets:45258 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:0 
              RX bytes:4900560 (4.9 MB)  TX bytes:4900560 (4.9 MB)

看一下行“inet6 addr”。

接下来你需要一个支持ipv6的路由器/调制解调器。此外，你的ISP也必须支持IPv6。

除了检查网络设备的每一部分，最好查出你是否可以通过IPv6访问网站。

有很多网站可以检测你的网络连接是否支持IPv6. 这里就是个例子：[http://testmyipv6.com/][1]

下面是在内核中启用IPv6的参数：

    $ sysctl net.ipv6.conf.all.disable_ipv6
    net.ipv6.conf.all.disable_ipv6 = 0
    
    $ sysctl net.ipv6.conf.default.disable_ipv6
    net.ipv6.conf.default.disable_ipv6 = 0
    
    $ sysctl net.ipv6.conf.lo.disable_ipv6
    net.ipv6.conf.lo.disable_ipv6 = 0

同样可以在proc文件中检查

    $ cat /proc/sys/net/ipv6/conf/all/disable_ipv6
    0

注意这里的变量是控制IPv6的“禁用”。所以设置1就会禁用IPv6。

### 如果它不支持就禁用IPv6 ###

如果你的网络设备中不支持IPv6，那最好就全部禁用它们。为什么？因为这会引起域名查询延迟，在网络连接中不必要地尝试连接到IPv6地址导致延迟等等问题。

我也遇到过像这样的问题，apt-get命令偶尔会尝试连接到IPv6地址失败接着检索IPv4地址。看一下下面的输出。

    $ sudo apt-get update
    Ign http://archive.canonical.com trusty InRelease
    Ign http://archive.canonical.com raring InRelease                                                                                                    
    Err http://archive.canonical.com trusty Release.gpg                                                                                                  
      Cannot initiate the connection to archive.canonical.com:80 (2001:67c:1360:8c01::1b). - connect (101: Network is unreachable) [IP: 2001:67c:1360:8c01::1b 80]
    Err http://archive.canonical.com raring Release.gpg                                                                                                  
      Cannot initiate the connection to archive.canonical.com:80 (2001:67c:1360:8c01::1b). - connect (101: Network is unreachable) [IP: 2001:67c:1360:8c01::1b 80]
    
    .....

像这样的错误在最近的Ubuntu中更频繁了，或许它比以前更频繁地尝试使用IPv6地址。

我在其他的应用上也注意到了相似的问题，如Hexchat，同样Google Chrome也会有时会在查询域名的时候花费更长的时间。

所以最好的方案是完全禁用IPv6来摆脱这些事情。这只需要一点点配置但可以帮助你解决很多你系统上的很多问题。用户甚至反应这可以加速网络。

#### 禁用 IPv6 - 方案1 ####

编辑文件 - /etc/sysctl.conf

    $ sudo gedit /etc/sysctl.conf

在文件的最后加入下面的行。

    # IPv6 disabled
    net.ipv6.conf.all.disable_ipv6 = 1
    net.ipv6.conf.default.disable_ipv6 = 1
    net.ipv6.conf.lo.disable_ipv6 = 1

保存并关闭

重启sysctl

    $ sudo sysctl -p

再次检查ifconfig的输出，这里应该没有IPv6地址了。

    $ ifconfig
    eth0      Link encap:Ethernet  HWaddr 08:00:27:5f:28:8b  
              inet addr:192.168.1.3  Bcast:192.168.1.255  Mask:255.255.255.0
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:1346 errors:0 dropped:0 overruns:0 frame:0
              TX packets:965 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:1501691 (1.5 MB)  TX bytes:104883 (104.8 KB)

如果不行，尝试重启系统并再次检查ifconfig

#### 禁用 IPv6 - GRUB 方案 ####

IPv6同样可以通过编辑grub配置文件禁用。

    $ sudo gedit /etc/default/grub

查找包含"GRUB_CMDLINE_LINUX"的行，并如下编辑：

    GRUB_CMDLINE_LINUX="ipv6.disable=1"

同样可以加入名为"GRUB_CMDLINE_LINUX_DEFAULT"的变量，这同样有用。保存并关闭文件，重新生成grub配置。

    $ sudo update-grub2

重启，现在IPv6应该就已经禁用了。

--------------------------------------------------------------------------------

via: http://www.binarytides.com/disable-ipv6-ubuntu/

译者：[geekpi](https://github.com/geekpi) ，校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://testmyipv6.com/
