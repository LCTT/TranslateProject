如何使用netstat命令验证DDOS入侵
================================================================================

一般来说，服务器非常慢可能原因是多方面的，有可能是配置错误，脚本错误或者是一些奇诡的硬件。当然也有可能是有人对你的服务器进行 Dos (拒绝服务攻击)或者 DDOS (分布式拒绝服务攻击)。

Dos攻击或者DDos攻击目的是使服务器或者网络资源耗尽，使其他用户无法使用。一般来说，这种攻击主要针对重要的网站或服务，比如银行、信用卡支付网关甚至是根域名服务器。Dos攻击主要通过强制目标主机重启或大量消耗其主机资源，使得目标主机无法提供服务或者妨害主机和用户之间的通信的手段，使得主机无法提供正常的服务的。

在本文中你将知道如何在终端中使用netstat命令判断服务器是否遭受Dos攻击。

netstat命令的用户手册描述其作用是用来显示网络连接、路由表、接口统计、伪连接和组播成员的。

### 一些例子和解释 ###

    netstat -na

该命令将显示所有活动的网络连接。

    netstat -an | grep :80 | sort
    
显示所有80端口的网络连接并排序。这里的80端口是http端口，所以可以用来监控web服务。如果看到同一个IP有大量连接的话就可以判定单点流量攻击了。

    netstat -n -p|grep SYN_REC | wc -l
    
这个命令可以查找出当前服务器有多少个活动的 SYNC_REC 连接。正常来说这个值很小，最好小于5。 当有Dos攻击或者邮件炸弹的时候，这个值相当的高。尽管如此，这个值和系统有很大关系，有的服务器值就很高，也是正常现象。

    netstat -n -p | grep SYN_REC | sort -u
    
列出所有连接过的IP地址。

    netstat -n -p | grep SYN_REC | awk '{print $5}' | awk -F: '{print $1}'
    
列出所有发送SYN_REC连接节点的IP地址。

    netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
    
使用netstat命令计算每个主机连接到本机的连接数。

    netstat -anp |grep 'tcp|udp' | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
    
列出所有连接到本机的UDP或者TCP连接的IP数量。

    netstat -ntu | grep ESTAB | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr
    
检查 ESTABLISHED 连接并且列出每个IP地址的连接数量。

    netstat -plan|grep :80|awk {'print $5'}|cut -d: -f 1|sort|uniq -c|sort -nk 1
    
列出所有连接到本机80端口的IP地址和其连接数。80端口一般是用来处理HTTP网页请求。

### 如何减少DOS攻击 ###

一旦你获得攻击服务器的IP地址你就可以使用以下命令拒绝此IP的所有连接。

    iptables -A INPUT 1 -s $IPADRESS -j DROP/REJECT

注意，你需要将 $IPADRESS 替换成需要拒绝连接的IP地址。

执行完以上命令后，使用以下命令结束所有的httpd连接以清理系统。

    killall -KILL httpd

然后执行以下命令重启httpd服务。

    service httpd start           #RedHat 系统 
    
    /etc/init/d/apache2 restart   #Debian 系统


--------------------------------------------------------------------------------


via: http://linuxaria.com/howto/how-to-verify-ddos-attack-with-netstat-command-on-linux-terminal

译者：[shipsw](https://github.com/shipsw) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出


