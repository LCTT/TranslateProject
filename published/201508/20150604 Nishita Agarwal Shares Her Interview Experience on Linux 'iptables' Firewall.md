关于Linux防火墙'iptables'的面试问答
================================================================================
Nishita Agarwal是Tecmint的用户，她将分享关于她刚刚经历的一家公司（印度的一家私人公司Pune）的面试经验。在面试中她被问及许多不同的问题，但她是iptables方面的专家，因此她想分享这些关于iptables的问题和相应的答案给那些以后可能会进行相关面试的人。

![Linux防火墙Iptables面试问题](http://www.tecmint.com/wp-content/uploads/2015/05/Linux-iptables-Interview-Questions.jpg)

所有的问题和相应的答案都基于Nishita Agarwal的记忆并经过了重写。

> “嗨，朋友！我叫**Nishita Agarwal**。我已经取得了理学学士学位，我的专业集中在UNIX和它的变种（BSD，Linux）。它们一直深深的吸引着我。我在存储方面有1年多的经验。我正在寻求职业上的变化，并将供职于印度的Pune公司。”

下面是我在面试中被问到的问题的集合。我已经把我记忆中有关iptables的问题和它们的答案记录了下来。希望这会对您未来的面试有所帮助。

### 1. 你听说过Linux下面的iptables和Firewalld么？知不知道它们是什么，是用来干什么的？ ###

**答案** : iptables和Firewalld我都知道，并且我已经使用iptables好一段时间了。iptables主要由C语言写成，并且以GNU GPL许可证发布。它是从系统管理员的角度写的，最新的稳定版是iptables 1.4.21。iptables通常被用作类UNIX系统中的防火墙，更准确的说，可以称为iptables/netfilter。管理员通过终端/GUI工具与iptables打交道，来添加和定义防火墙规则到预定义的表中。Netfilter是内核中的一个模块，它执行包过滤的任务。
 
Firewalld是RHEL/CentOS 7（也许还有其他发行版，但我不太清楚）中最新的过滤规则的实现。它已经取代了iptables接口，并与netfilter相连接。

### 2. 你用过一些iptables的GUI或命令行工具么？ ###

**答案** : 虽然我既用过GUI工具，比如与[Webmin][1]结合的Shorewall；以及直接通过终端访问iptables，但我必须承认通过Linux终端直接访问iptables能给予用户更高级的灵活性、以及对其背后工作更好的理解的能力。GUI适合初级管理员，而终端适合有经验的管理员。

### 3. 那么iptables和firewalld的基本区别是什么呢？ ###

**答案** : iptables和firewalld都有着同样的目的（包过滤），但它们使用不同的方式。iptables与firewalld不同，在每次发生更改时都刷新整个规则集。通常iptables配置文件位于‘/etc/sysconfig/iptables‘，而firewalld的配置文件位于‘/etc/firewalld/‘。firewalld的配置文件是一组XML文件。以XML为基础进行配置的firewalld比iptables的配置更加容易，但是两者都可以完成同样的任务。例如，firewalld可以在自己的命令行界面以及基于XML的配置文件下使用iptables。

### 4. 如果有机会的话，你会在你所有的服务器上用firewalld替换iptables么？ ###

**答案** : 我对iptables很熟悉，它也工作的很好。如果没有任何需求需要firewalld的动态特性，那么没有理由把所有的配置都从iptables移动到firewalld。通常情况下，目前为止，我还没有看到iptables造成什么麻烦。IT技术的通用准则也说道“为什么要修一件没有坏的东西呢？”。上面是我自己的想法，但如果组织愿意用firewalld替换iptables的话，我不介意。

### 5. 你看上去对iptables很有信心，巧的是，我们的服务器也在使用iptables。 ###

iptables使用的表有哪些？请简要的描述iptables使用的表以及它们所支持的链。

**答案** : 谢谢您的赞赏。至于您问的问题，iptables使用的表有四个，它们是：
 
- Nat 表
- Mangle 表
- Filter 表
- Raw 表
 
Nat表 : Nat表主要用于网络地址转换。根据表中的每一条规则修改网络包的IP地址。流中的包仅遍历一遍Nat表。例如，如果一个通过某个接口的包被修饰（修改了IP地址），该流中其余的包将不再遍历这个表。通常不建议在这个表中进行过滤，由NAT表支持的链称为PREROUTING 链，POSTROUTING 链和OUTPUT 链。

Mangle表 : 正如它的名字一样，这个表用于校正网络包。它用来对特殊的包进行修改。它能够修改不同包的头部和内容。Mangle表不能用于地址伪装。支持的链包括PREROUTING 链，OUTPUT 链，Forward 链，Input 链和POSTROUTING 链。

Filter表 : Filter表是iptables中使用的默认表，它用来过滤网络包。如果没有定义任何规则，Filter表则被当作默认的表，并且基于它来过滤。支持的链有INPUT 链，OUTPUT 链，FORWARD 链。

Raw表 : Raw表在我们想要配置之前被豁免的包时被使用。它支持PREROUTING 链和OUTPUT 链。

### 6. 简要谈谈什么是iptables中的目标值（能被指定为目标），他们有什么用 ###

**答案** : 下面是在iptables中可以指定为目标的值：

- ACCEPT : 接受包
- QUEUE : 将包传递到用户空间 (应用程序和驱动所在的地方)
- DROP : 丢弃包
- RETURN : 将控制权交回调用的链并且为当前链中的包停止执行下一调用规则

### 7. 让我们来谈谈iptables技术方面的东西，我的意思是说实际使用方面 ###

你怎么检测在CentOS中安装iptables时需要的iptables的rpm？

**答案** : iptables已经被默认安装在CentOS中，我们不需要单独安装它。但可以这样检测rpm：

    # rpm -qa iptables
 
 	iptables-1.4.21-13.el7.x86_64
 
如果您需要安装它，您可以用yum来安装。
 
    # yum install iptables-services

### 8. 怎样检测并且确保iptables服务正在运行？ ###

**答案** : 您可以在终端中运行下面的命令来检测iptables的状态。

    # service status iptables			[On CentOS 6/5]
    # systemctl status iptables			[On CentOS 7]

如果iptables没有在运行，可以使用下面的语句

    ---------------- 在CentOS 6/5下 ---------------- 
    # chkconfig --level 35 iptables on
    # service iptables start

    ---------------- 在CentOS 7下 ---------------- 
    # systemctl enable iptables 
    # systemctl start iptables 

我们还可以检测iptables的模块是否被加载：

    # lsmod | grep ip_tables

### 9. 你怎么检查iptables中当前定义的规则呢？ ###

**答案** : 当前的规则可以简单的用下面的命令查看：

    # iptables -L

示例输出

    Chain INPUT (policy ACCEPT)
    target     prot opt source               destination         
    ACCEPT     all  --  anywhere             anywhere             state RELATED,ESTABLISHED
    ACCEPT     icmp --  anywhere             anywhere            
    ACCEPT     all  --  anywhere             anywhere            
    ACCEPT     tcp  --  anywhere             anywhere             state NEW tcp dpt:ssh
    REJECT     all  --  anywhere             anywhere             reject-with icmp-host-prohibited
    
    Chain FORWARD (policy ACCEPT)
    target     prot opt source               destination         
    REJECT     all  --  anywhere             anywhere             reject-with icmp-host-prohibited
    
    Chain OUTPUT (policy ACCEPT)
    target     prot opt source               destination

### 10. 你怎样刷新所有的iptables规则或者特定的链呢？ ###

**答案** : 您可以使用下面的命令来刷新一个特定的链。
 
    # iptables --flush OUTPUT

要刷新所有的规则，可以用：

    # iptables --flush

### 11. 请在iptables中添加一条规则，接受所有从一个信任的IP地址（例如，192.168.0.7）过来的包。 ###

**答案** : 上面的场景可以通过运行下面的命令来完成。

    # iptables -A INPUT -s 192.168.0.7 -j ACCEPT 

我们还可以在源IP中使用标准的斜线和子网掩码：

    # iptables -A INPUT -s 192.168.0.7/24 -j ACCEPT 
    # iptables -A INPUT -s 192.168.0.7/255.255.255.0 -j ACCEPT

### 12. 怎样在iptables中添加规则以ACCEPT，REJECT，DENY和DROP ssh的服务？ ###

**答案** : 但愿ssh运行在22端口，那也是ssh的默认端口，我们可以在iptables中添加规则来ACCEPT ssh的tcp包（在22号端口上）。

    # iptables -A INPUT -s -p tcp --dport 22 -j ACCEPT 

REJECT ssh服务（22号端口）的tcp包。

    # iptables -A INPUT -s -p tcp --dport 22 -j REJECT

DENY ssh服务（22号端口）的tcp包。

 
    # iptables -A INPUT -s -p tcp --dport 22 -j DENY

DROP ssh服务（22号端口）的tcp包。

 
    # iptables -A INPUT -s -p tcp --dport 22 -j DROP

### 13. 让我给你另一个场景，假如有一台电脑的本地IP地址是192.168.0.6。你需要封锁在21、22、23和80号端口上的连接，你会怎么做？ ###

**答案** : 这时，我所需要的就是在iptables中使用‘multiport‘选项，并将要封锁的端口号跟在它后面。上面的场景可以用下面的一条语句搞定：

    # iptables -A INPUT -s 192.168.0.6 -p tcp -m multiport --dport 22,23,80,8080 -j DROP

可以用下面的语句查看写入的规则。

    # iptables -L
    
    Chain INPUT (policy ACCEPT)
    target     prot opt source               destination         
    ACCEPT     all  --  anywhere             anywhere             state RELATED,ESTABLISHED
    ACCEPT     icmp --  anywhere             anywhere            
    ACCEPT     all  --  anywhere             anywhere            
    ACCEPT     tcp  --  anywhere             anywhere             state NEW tcp dpt:ssh
    REJECT     all  --  anywhere             anywhere             reject-with icmp-host-prohibited
    DROP       tcp  --  192.168.0.6          anywhere             multiport dports ssh,telnet,http,webcache
    
    Chain FORWARD (policy ACCEPT)
    target     prot opt source               destination         
    REJECT     all  --  anywhere             anywhere             reject-with icmp-host-prohibited
    
    Chain OUTPUT (policy ACCEPT)
    target     prot opt source               destination

**面试官** : 好了，我问的就是这些。你是一个很有价值的雇员，我们不会错过你的。我将会向HR推荐你的名字。如果你有什么问题，请问我。

作为一个候选人我不愿不断的问将来要做的项目的事以及公司里其他的事，这样会打断愉快的对话。更不用说HR轮会不会比较难，总之，我获得了机会。

同时我要感谢Avishek和Ravi（我的朋友）花时间帮我整理我的面试。

朋友！如果您有过类似的面试，并且愿意与数百万Tecmint读者一起分享您的面试经历，请将您的问题和答案发送到admin@tecmint.com。

谢谢！保持联系。如果我能更好的回答我上面的问题的话，请记得告诉我。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-firewall-iptables-interview-questions-and-answers/

作者：[Avishek Kumar][a]
译者：[wwy-hust](https://github.com/wwy-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/install-webmin-web-based-system-administration-tool-for-rhel-centos-fedora/
