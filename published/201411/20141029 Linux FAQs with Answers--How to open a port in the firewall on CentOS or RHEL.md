Linux有问必答：在CentOS或RHEL防火墙上开启端口
================================================================================
> **问题**：我在CentOS系统上运行一台网页或文件服务器，打算远程访问服务器。因此，我需要更改防火墙规则以允许访问系统上的某个TCP端口。那么，有什么好方法在CentOS或RHEL系统的防火墙上开启TCP/UDP端口？

如果希望在服务器上提供服务，诸如CentOS或RHEL的企业级Linux发行版包含内置的强大防火墙，它们默认的防火墙规则十分严格。因此，如果你安装了任何定制的服务（比如web服务器、NFS和Samba），那么它们的流量很有可能被防火墙规则阻塞。所以需要在防火墙上开启必要的端口以允许流量通过。

在CentOS/RHEL 6或更早的版本上，iptables服务允许用户与netfilter内核模块交互来在用户空间中配置防火墙规则。然而，从CentOS/RHEL 7开始，一个叫做firewalld新用户空间接口被引入以取代iptables服务。

使用这个命令察看当前的防火墙规则：

    $ sudo iptables -L 

![](https://farm6.staticflickr.com/5601/15604533686_a8c0ae7b89_z.jpg)

现在，让我们看看如何在CentOS/RHEL上修改防火墙来开启一个端口。

### 在CentOS/RHEL 7上开启端口 ###

启动CentOS/RHEL 7后，防火墙规则设置由firewalld服务进程默认管理。一个叫做firewall-cmd的命令行客户端支持和这个守护进程通信以永久修改防火墙规则。

使用这些命令来永久打开一个新端口（如TCP/80）。

    $ sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
    $ sudo firewall-cmd --reload 

如果不使用“--permanent”标记，把么防火墙规则在重启后会失效。

### 在CentOS/RHEL 6上开启端口 ###

在CentOS/RHEL 6甚至更早版本系统上，iptables服务负责维护防火墙规则。

使用iptables的第一条命令可以通过防火墙开启一个新TCP/UDP端口。为了永久保存修改过的规则，还需要第二条命令。

    $ sudo iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
    $ sudo service iptables save 

另一种方法是通过一个名为system-config-firewall-tui的命令行用户接口（TUI）的防火墙客户端。

    $ sudo system-config-firewall-tui

选择位于中间的“Customize”按钮，按下ENTER键即可。

![](https://farm6.staticflickr.com/5602/15628237745_4409cff52f_z.jpg)

如果想要为任何已知的服务（如web服务器）修改防火墙，只需勾选该服务，然后关闭工具。如果想要开启任意一个TCP/UDP端口，选择“Forward”按钮，然后进入下一个界面。

![](https://farm4.staticflickr.com/3941/15604533696_12857827ea_z.jpg)

选择“Add”按钮添加一条新规则。

![](https://farm4.staticflickr.com/3941/15008065383_4b92cbd843_z.jpg)

指定一个端口（如80）或者端口范围（如3000-3030）和协议（如tcp或udp）。

![](https://farm4.staticflickr.com/3946/15007474154_bef75d8c72_z.jpg)

最后，保存修改过的配置，关闭工具。这样，防火墙就永久保存了。

![](https://farm4.staticflickr.com/3942/15628237765_0299a638ab_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/open-port-firewall-centos-rhel.html

译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出