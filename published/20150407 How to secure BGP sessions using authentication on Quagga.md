Quagga上使用验证加固BGP会话安全
================================================================================
BGP协议运行于TCP之上，因而，它也继承了TCP连接的所有漏洞。例如，在一个BGP会话内，攻击者可以冒充一个合法的BGP邻居，然后说服另一端的BGP路由器共享路由信息给攻击者。在攻击者通告并向邻居路由注入伪造的路由时，就会发生这个问题。毫无戒备的邻居路由器就会开始向攻击者发送通信实况，实际上这些信息并没有去向任何地方，仅仅只是被丢弃了。回到2008年，YouTube实际上也[受害于][1]这样的BGP路由中毒，并遭受了长达一个小时的视频服务大量中断。一个更加糟糕的情况是，如果攻击者是个足够懂行的人，他们可以伪装成一台透明路由器，然后嗅探经过的通信以获取敏感数据。你可以想象，这会造成深远的影响。

要保护活跃的BGP会话不受攻击，许多服务提供商在BGP会话中使用[MD5校验和及预共享密钥][2]。在受保护的BGP会话中，一台发送包的BGP路由器通过使用预共享的密钥生成MD5散列值、部分IP和TCP头以及有效载荷。然后，MD5散列作为一个TCP选项字段存储。在收到包后，接受路由器用同样的方法使用预共享密钥生成它的MD5版本。它会将它的MD5散列和接收到的某个包的值进行对比，以决定是否接受该包。对于一个攻击者而言，几乎不可能猜测到校验和或其密钥。对于BGP路由器而言，它们能在使用包的内容前确保每个包的合法性。

在本教程中，我们将为大家演示如何使用MD5校验和以及预共享密钥来加固两个邻居间的BGP会话的安全。

### 准备 ###

加固BGP会话安全是相当简单而直截了当的，我们会使用以下路由器。

<table id="content">
<tbody><tr>
<td><b>路由器名称</b></td>
<td><b>AS 号</b></td>
<td><b>IP地址</b></td>
</tr>
<tr>
<td>router-A</td>
<td>100</td>
<td>10.10.12.1/30</td>
</tr>
<tr>
<td>router-B</td>
<td>200</td>
<td>10.10.12.2/30</td>
</tr>
</tbody></table>

常用的Linux内核原生支持IPv4和IPv6的TCP MD5选项。因此，如果你从全新的[Linux机器][3]构建了一台Quagga路由器，TCP的MD5功能会自动启用。剩下来的事情，仅仅是配置Quagga以使用它的功能。但是，如果你使用的是FreeBSD机器或者为Quagga构建了一个自定义内核，请确保内核开启了TCP的MD5支持（如，Linux中的CONFIG_TCP_MD5SIG选项）。

### 配置Router-A验证功能 ###

我们将使用Quagga的CLI Shell来配置路由器，我们将使用的唯一的一个新命令是‘password’。

    [root@router-a ~]# vtysh
    router-a# conf t
    router-a(config)# router bgp 100
    router-a(config-router)# network 192.168.100.0/24
    router-a(config-router)# neighbor 10.10.12.2 remote-as 200
    router-a(config-router)# neighbor 10.10.12.2 password xmodulo

本例中使用的预共享密钥是‘xmodulo’。很明显，在生产环境中，你需要选择一个更健壮的密钥。

**注意**： 在Quagga中，‘service password-encryption’命令被用做加密配置文件中所有明文密码（如，登录密码）。然而，当我使用该命令时，我注意到BGP配置中的预共享密钥仍然是明文的。我不确定这是否是Quagga的限制，还是版本自身的问题。

### 配置Router-B验证功能 ###

我们将以类似的方式配置router-B。

    [root@router-b ~]# vtysh
    router-b# conf t
    router-b(config)# router bgp 200
    router-b(config-router)# network 192.168.200.0/24
    router-b(config-router)# neighbor 10.10.12.1 remote-as 100
    router-b(config-router)# neighbor 10.10.12.1 password xmodulo

### 验证BGP会话 ###

如果一切配置正确，那么BGP会话就应该起来了，两台路由器应该能交换路由表。这时候，TCP会话中的所有流出包都会携带一个MD5摘要的包内容和一个密钥，而摘要信息会被另一端自动验证。

我们可以像平时一样通过查看BGP的概要来验证活跃的BGP会话。MD5校验和的验证在Quagga内部是透明的，因此，你在BGP级别是无法看到的。

![](https://farm8.staticflickr.com/7621/16837774368_e9ff66b370_c.jpg)

如果你想要测试BGP验证，你可以配置一个邻居路由，设置其密码为空，或者故意使用错误的预共享密钥，然后查看发生了什么。你也可以使用包嗅探器，像tcpdump或者Wireshark等，来分析通过BGP会话的包。例如，带有“-M <secret>”选项的tcpdump将验证TCP选项字段的MD5摘要。

###小结###

在本教程中，我们演示了怎样简单地加固两台路由间的BGP会话安全。相对于其它协议而言，配置过程非常简明。强烈推荐你加固BGP会话安全，尤其是当你用另一个AS配置BGP会话的时候。预共享密钥也应该安全地保存。

--------------------------------------------------------------------------------

via: http://xmodulo.com/bgp-authentication-quagga.html

作者：[Sarmed Rahman][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:http://research.dyn.com/2008/02/pakistan-hijacks-youtube-1/
[2]:http://tools.ietf.org/html/rfc2385
[3]:https://linux.cn/article-4232-1.html
