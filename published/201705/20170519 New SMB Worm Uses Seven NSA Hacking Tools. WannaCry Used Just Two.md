新的“永恒之石”病毒利用了七个 NSA 黑客工具，“想哭”病毒才两个
===========
      
![永恒之石](https://www.bleepstatic.com/content/posts/2017/05/19/EternalRocks.png)

研究人员们发现有一个新的蠕虫病毒正在通过 SMB 文件共享漏洞传播，但是不同于“想哭”（WannaCry）勒索病毒的构成，这个病毒利用了 7 个 NSA 黑客工具，而不是“想哭”（WannaCry）勒索病毒的两个。

这个蠕虫病毒的存在首次发现是在周三，它感染了 [Miroslav Stampar][15] 的 SMB 文件共享的蜜罐，Miroslav Stampar 是克罗地亚政府计算机应急响应小组成员，也是用来探测和利用 SQL 注入漏洞的 SQLMAP 工具的制造者。

### 永恒之石利用了七个 NSA 的工具

Stampar 命名这个在样本中被发现的病毒为“永恒之石”（EternalRocks），其基于蠕虫病毒可执行的特性，它通过 6 个以 SMB 文件共享漏洞为中心的 NSA 工具来感染暴露在外网的一台开启 SMB 端口的计算机。这些被叫做 **永恒之蓝**、**永恒战士**、**永恒浪漫**和 **永恒协同**的 SMB 漏洞被利用危害易受攻击的计算机，而  **SMBTOUCH** 和 **ARCHITOUCH** 这两个 NSA 工具起到了检测 SMB 文件共享漏洞的作用。

一旦这个蠕虫病毒获得了最初的立足点，那么它会用另一个叫做 **DOUBLEPULSAR** 的 NSA 工具扩散到新的易受攻击的机器上。

![永恒之石名字的起源](https://www.bleepstatic.com/images/news/u/986406/Malware/EternalRocks-properties.png)

**“永恒之石”名字的起源**

[“想哭”勒索病毒爆发][16]，用了一个 SMB 蠕虫病毒感染计算机并扩散给新的受害人，这影响了超过 24 万受害者。


不同于“永恒之石”，“想哭”的 SMB 蠕虫病毒只利用了永恒之蓝这一个漏洞做初步感染，然后通过 DOUBLEPULSAR 来扩散到其他的计算机上。

### “永恒之石”更加复杂，但危险性较低

作为蠕虫病毒，“永恒之石”没有“想哭”那么危险，这是由于它当前不传递任何恶意的内容，然而，这并不意味着“永恒之石”不复杂，据 Stampar 说，实际恰恰相反。

首先，“永恒之石”要比“想哭”的 SMB 蠕虫病毒更加隐蔽，一旦病毒感染了一台计算机，它会发起有两个阶段的安装过程，其中另一个是延迟执行的。

在病毒的第一个安装过程阶段，永恒之石获取一个感染计算机主机的立足点，下载 tor 客户端，然后连接到它的命令控制服务器，其定位在暗网的一个 .onion 的域名上。

在一个预定的时间内，一般是 24 个小时，命令控制器会响应，这个长延迟执行进程的做法最有可能绕过沙盒安全测试环境和安全研究人员们对病毒的分析，因为没多少人愿意一整天来等命令控制器响应。


> [ Follow][1] [![](https://pbs.twimg.com/profile_images/687638130694995970/Xtras5w3_normal.png) Miroslav Stampar @stamparm][6]
> 
> Update on [#EternalRocks][7]. Original name is actually "MicroBotMassiveNet" while author's nick is "tmc" [https://github.com/stamparm/EternalRocks/#debug-strings …][8]
> 
> [<time class="dt-updated" datetime="2017-05-19T09:10:50+0000" pubdate="" title="Time posted: 19 May 2017, 09:10:50 (UTC)">5:10 PM - 19 May 2017</time>][9]
> 
> *   [][2]
> 
> *   [ 2525 Retweets][3]
> 
> *   [ 1717 likes][4]

[Twitter Ads info & Privacy][11]</twitterwidget>

### 没有停止开关的域名

此外，“永恒之石”病毒也会用和一个与“想哭” SMB 的蠕虫病毒文件相同名字的一个文件，以此愚弄安全研究人员来误判它。 

但是不同于“想哭”病毒，永恒之石不包括停止开关的域名，但这是安全研究人员唯一用来停止“想哭”病毒爆发的方法。

在病毒隐匿期满且命令控制器有了响应，永恒之石开始进入安装过程的第二阶段，它会下载一个名为 shadowbrokers.zip 的归档形式的第二阶段恶意组件。

这个文件能够自解压，它包含着 shadow Brokers 黑客组织在 2017 年 4 月泄漏的七个 NSA 的 SMB 漏洞工具。
这个蠕虫病毒会开始一个快速的 ip 扫描过程并且尝试连接随机的 ip 地址。

![shadowbrokers.zip的内容](https://www.bleepstatic.com/images/news/u/986406/Malware/EternalRocks-exploits.png)

**在 shadowbrokers.zip 压缩包里发现了 NSA 工具的配置文件。**

### “永恒之石”可以马上成为武器

由于该病毒集成的漏洞较多且广泛，缺少停止开关的域名，而且有它的隐匿期，如果病毒的作者决定用它来作为勒索、银行木马、远程控制或者其他功能的武器，“永恒之石”可能会对 SMB 端口暴露在互联网的易受攻击的计算机造成严重的威胁。

就目前来看，蠕虫病毒看起来像是一个试验，或者是恶意软件作者在进行测试或者为未来的威胁而做的微调。

然而，这并不意味着“永恒之石”是无害的，感染了这个病毒的计算机是通过命令控制服务器来控制，并且蠕虫病毒的制造者能够利用这个隐藏通讯连接，发送新的恶意软件到这台感染了病毒的电脑上。

此外，DOUBLEPULSAR，这是一个带有后门的植入仍然运行在感染了永恒之石的 PC 上，不幸的是，该病毒的作者没有采取任何措施来保护这个 DOUBLEPULSAR 的植入，这意味这缺省其运行在未被保护的状态下，其他的恶意的用户能使用它作为把感染了永恒之石的计算机的后门，发送他们自己的恶意软件到这些感染病毒的 PC 上。

关于这个病毒的感染过程的 IOC 和更多信息能够在 Stampar 在几天前设置的 [GitHub] 仓库上获得。

### SMB 漏洞的混战

当前，有许多人在扫描旧的和未打补丁的 SMB 服务，系统管理员已经注意到并且开始给易受攻击的计算机打补丁，关闭旧版的 SMBv1 协议，慢慢的来减少被永恒之石感染的计算机数量。

此外，像 Adylkuzz 这类恶意软件，也会关闭 SMB 端口，来阻止来自其它威胁软件的进一步利用，这同时也导致了“永恒之石”和其它利用 SMB 漏洞的恶意软件潜在目标数量的减少，来自 [Forcepoint][21]、[Cyphort][22] 和 [Secdo][23] 的报告详细介绍了当前针对 SMB 端口的计算机的威胁情况。

虽然如此，系统管理员补丁打的越快，系统越安全，“蠕虫病毒感染速度正在和系统管理员给机器打补丁速度比赛”，Stampar 在一次私人谈话中告诉 BleepingComputer 记者，“一旦计算机被感染，它能在任何时间将其作为武器，不论你打多时间多近的补丁。”

（题图：Miroslav Stampar, BleepingComputer & [Ana María Lora Macias][13]）

--------------------------------------------------------------------------------

作者简介：

Catalin 涉及了各方面，像数据泄漏、软件漏洞、漏洞利用、黑客新闻、暗网、编程话题、社交媒体、Web技术、产品研发等领域。

---------------

via: https://www.bleepingcomputer.com/news/security/new-smb-worm-uses-seven-nsa-hacking-tools-wannacry-used-just-two/

作者：[CATALIN CIMPANU][a]
译者：[hwlog](https://github.com/hwlog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.bleepingcomputer.com/author/catalin-cimpanu/
[1]:https://twitter.com/stamparm
[2]:https://twitter.com/intent/tweet?in_reply_to=865494946974900224
[3]:https://twitter.com/intent/retweet?tweet_id=865494946974900224
[4]:https://twitter.com/intent/like?tweet_id=865494946974900224
[5]:https://twitter.com/stamparm/status/865494946974900224/photo/1
[6]:https://twitter.com/stamparm
[7]:https://twitter.com/hashtag/EternalRocks?src=hash
[8]:https://t.co/xqoxkNYfM7
[9]:https://twitter.com/stamparm/status/865494946974900224
[10]:https://twitter.com/stamparm/status/865494946974900224/photo/1
[11]:https://support.twitter.com/articles/20175256
[12]:https://www.bleepingcomputer.com/news/security/new-smb-worm-uses-seven-nsa-hacking-tools-wannacry-used-just-two/#comment_form
[13]:https://thenounproject.com/search/?q=worm&i=24323
[14]:https://www.bleepingcomputer.com/author/catalin-cimpanu/
[15]:https://about.me/stamparm
[16]:https://www.bleepingcomputer.com/news/security/wana-decrypt0r-ransomware-using-nsa-exploit-leaked-by-shadow-brokers-is-on-a-rampage/
[17]:https://www.bleepingcomputer.com/news/security/shadow-brokers-release-new-files-revealing-windows-exploits-swift-attacks/
[18]:https://www.bleepingcomputer.com/news/security/over-36-000-computers-infected-with-nsas-doublepulsar-malware/
[19]:https://github.com/stamparm/EternalRocks/
[20]:https://www.bleepingcomputer.com/news/security/adylkuzz-cryptocurrency-miner-may-have-saved-you-from-the-wannacry-ransomware/
[21]:https://blogs.forcepoint.com/security-labs/wannacry-multiple-malware-families-using-eternalblue-exploit
[22]:https://www.cyphort.com/eternalblue-exploit-actively-used-deliver-remote-access-trojans/
[23]:http://blog.secdo.com/multiple-groups-exploiting-eternalblue-weeks-before-wannacry
