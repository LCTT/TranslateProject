Linux有问必答：如何在Linux下禁用IPv6
================================================================================
> **问题**：我发现我的一个应用程序在尝试通过IPv6建立连接，但是由于我们本地网络不允许分配IPv6的流量，IPv6连接会超时，应用程序的连接会回退到IPv4，这样就会造成不必要的延迟。由于我目前对IPv6没有任何需求，所以我想在我的Linux主机上禁用IPv6。有什么比较合适的方法呢？ 

IPv6被认为是IPv4——互联网上的传统32位地址空间——的替代产品，它用来解决现有IPv4地址空间即将耗尽的问题。然而，由于已经有大量主机、设备用IPv4连接到了互联网上，所以想在一夜之间将它们全部切换到IPv6几乎是不可能的。许多IPv4到IPv6的转换机制(例如：双协议栈、网络隧道、代理) 已经被提出来用来促进IPv6能被采用，并且很多应用也正在进行重写，如我们所提倡的，来增加对IPv6的支持。有一件事情可以确定，就是在可预见的未来里IPv4和IPv6势必将共存。

理想情况下，[向IPv6过渡的进程][1]不应该被最终的用户所看见，但是IPv4/IPv6混合环境有时会让你碰到各种源于IPv4和IPv6之间不经意间的相互碰撞的问题。举个例子，你会碰到应用程序超时的问题，比如apt-get或ssh尝试通过IPv6连接失败、DNS服务器意外清空了IPv6的AAAA记录、或者你支持IPv6的设备不兼容你的互联网服务提供商遗留下的IPv4网络，等等等等。

当然这不意味着你应该盲目地在你的Linux机器上禁用IPv6。鉴于IPv6许诺的种种好处，作为社会的一份子我们最终还是要充分拥抱它的，但是作为给最终用户进行故障排除过程的一部分，如果IPv6确实是罪魁祸首，那你可以尝试去关闭它。

这里有一些让你在Linux中部分(例如：对于某个特定的网络接口)或全部禁用IPv6的小技巧。这些小贴士应该适用于所有主流的Linux发行版包括Ubuntu、Debian、Linux Mint、CentOS、Fedora、RHEL以及Arch Linux。

### 查看IPv6在Linux中是否被启用 ###

所有现代Linux发行版默认都自动启用IPv6。为了能看到IPv6在你的Linux中是否被激活，可以使用ifconfig或ip命令。如果你在输入这些命令之后看到"inet6"字样的输出，那就意味着你的Linux系统启用了IPv6。

    $ ifconfig 

![](https://farm8.staticflickr.com/7282/16415082398_5fb0920506_b.jpg)

    $ ip addr 

![](https://farm8.staticflickr.com/7290/16415082248_c4e075548b_c.jpg)

### 临时禁用IPv6 ###

如果你想要在你的Linux系统上临时关闭IPv6，你可以用 /proc 文件系统。"临时"的意思是我们所做的禁用IPv6的更改在系统重启后将不被保存。IPv6会在你的Linux机器重启后再次被启用。

要将一个特定的网络接口禁用IPv6，使用以下命令：

    $ sudo sh -c 'echo 1 > /proc/sys/net/ipv6/conf/<interface-name>/disable_ipv6' 

举个例子，将eth0接口禁用IPv6：

    $ sudo sh -c 'echo 1 > /proc/sys/net/ipv6/conf/eth0/disable_ipv6' 

![](https://farm8.staticflickr.com/7288/15982511863_0c1feafe7f_b.jpg)

重新启用eth0接口的IPv6：

    $ sudo sh -c 'echo 0 > /proc/sys/net/ipv6/conf/eth0/disable_ipv6' 

如果你想要将整个系统所有接口包括回环接口禁用IPv6，使用以下命令：

    $ sudo sh -c 'echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' 

### 永久禁用IPv6 ###

以上方法是不能永久禁用IPv6的，你一旦重启系统IPv6还是会被启用。如果你想要永久关闭它，有几个方法你可以试试。

#### 方法一 ####

第一种方法是通过 /etc/sysctl.conf 文件对 /proc 进行永久修改。

换句话说，就是用文本编辑器打开 /etc/sysctl.conf 然后添加以下内容：

    # 禁用整个系统所有接口的IPv6
    net.ipv6.conf.all.disable_ipv6 = 1
    
    # 禁用某一个指定接口的IPv6(例如：eth0, lo)
    net.ipv6.conf.lo.disable_ipv6 = 1
    net.ipv6.conf.eth0.disable_ipv6 = 1

在 /etc/sysctl.conf 使这些更改生效，运行以下命令：

    $ sudo sysctl -p /etc/sysctl.conf 

或者直接重启。

#### 方法二 ####

另一个永久禁用IPv6的方法是在开机的时候传递一个必要的内核参数。

用文本编辑器打开 /etc/default/grub 并给GRUB_CMDLINE_LINUX变量添加"ipv6.disable=1"。

    $ sudo vi /etc/default/grub

----------

    GRUB_CMDLINE_LINUX="xxxxx ipv6.disable=1"

上面的"xxxxx"代表任何已有的内核参数，在它后面添加"ipv6.disable=1"。

![](https://farm8.staticflickr.com/7286/15982512103_ec5d940e58_b.jpg)

最后，不要忘记用以下方法保存对GRUB/GRUB2的修改：

Debian、Ubuntu或Linux Mint系统：

    $ sudo update-grub 

Fedora、CentOS/RHEL系统：

    $ sudo grub2-mkconfig -o /boot/grub2/grub.cfg 

现在只要你重启你的Linux系统，IPv6就会完全被禁用。

### 禁用IPv6之后的其它可选步骤 ###

这里有一些在你禁用IPv6后需要考虑的可选步骤，这是因为当你在内核里禁用IPv6后，其它程序也许仍然会尝试使用IPv6。在大多数情况下，应用程序的这种行为不太会影响到什么，但是出于效率或安全方面的原因，你可以为他们禁用IPv6。

#### /etc/hosts ####

根据你的设置， /etc/hosts 会包含一条或多条IPv6的hosts和它们的地址。用文本编辑器打开 /etc/hosts 并注释掉包含IPv6 hosts的脚本行。

    $ sudo vi /etc/hosts

----------

    # comment these IPv6 hosts
    # ::1     ip6-localhost ip6-loopback
    # fe00::0 ip6-localnet
    # ff00::0 ip6-mcastprefix
    # ff02::1 ip6-allnodes
    # ff02::2 ip6-allrouters

#### Network Manager ####

如果你在用NetworkManager来管理你的网络设置，你可以在NetworkManager里禁用IPv6。在NetworkManager打开wired connection，点击"IPv6 Settings"选项并在"Method"一栏选择"Ignore"，保存退出。

![](https://farm8.staticflickr.com/7293/16394993017_21917f027b_o.png)

#### SSH服务 ####

默认情况下，OpenSSH服务(sshd)会去尝试捆绑IPv4和IPv6的地址。

要强制sshd只捆绑IPv4地址，用文本编辑器打开 /etc/ssh/sshd_config 并添加以下行。inet只适用于IPv4，而inet6是适用于IPv6的。

    $ sudo vi /etc/ssh/sshd_config

----------

    AddressFamily inet

然后重启sshd服务。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/disable-ipv6-linux.html

作者：[Dan Nanni][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://www.google.com/intl/en/ipv6/statistics.html
