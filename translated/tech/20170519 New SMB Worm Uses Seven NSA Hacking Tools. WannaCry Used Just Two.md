### 新基于SMB漏洞的蠕虫病毒用了7个NSA的黑客工具，WannaCry只用了两个。
      
20170519 New SMB Worm Uses Seven NSA Hacking Tools. WannaCry Used Just Two.md
![永恒之石](https://www.bleepstatic.com/content/posts/2017/05/19/EternalRocks.png)

研究人员们发现有一个新的蠕虫病毒正在通过SMB文件共享漏洞传播，, 但是不同于WannaCry勒索病毒的构成，这个病毒用了7个NSA黑客工具，而不是两个。

这个蠕虫病毒的存在首次发现是在周三，他感染了克罗地亚政府计算机应急响应小组成员，用来探测和利用SQL注入漏洞的SQLMAP工具的制造者叫做[Miroslav Stampar][15]的SMB文件共享的蜜罐。

### 永恒之石用了七个NSA的工具

Stampar命名这个在样本中被发现的病毒为永恒之石，是基于蠕虫病毒可执行的特性，它通过6个以SMB文件共享漏洞为中心的NSA工具来感染暴露在外网的一台开启SMB端口的计算机。这些被叫做 **永恒之蓝**, **永恒战士**, **永恒浪漫**, and **永恒协同**的SMB漏洞被利用危害易受攻击的计算机，而  **SMBTOUCH** 和 **ARCHITOUCH** 这两个NSA工具是起检测SMB文件共享漏洞的作用。
一旦这个蠕虫病毒获得了最初的立足点，那么它会用另一个叫做**DOUBLEPULSAR**的NSA工具扩散到新的易受攻击的机器上。

![永恒之石名字的起源](https://www.bleepstatic.com/images/news/u/986406/Malware/EternalRocks-properties.png)
**永恒之石名字的起源**

[WannaCry勒索病毒爆发][16], 用了一个SMB蠕虫病毒感染计算机并扩散给新的受害人，这影响了超过24万受害者。


不同于永恒之石，WannaCry的SMB蠕虫病毒只用了永恒之蓝这一个初始伤害，然后通过 DOUBLEPULSAR 来扩散到其他的计算机上。

### 永恒之石更加复杂且危险

作为蠕虫病毒，永恒之石比WannaCry更加危险，由于它当前不传递任何恶意的内容，然而，并不意味着永恒之石不复杂，据Stampar说，实际恰恰相反。

首先, 永恒之石要比WannaCry的SMB蠕虫病毒构成更加狡猾，一旦病毒感染了一台计算机，它会发起有两个阶段的安装过程，其中另一个是延迟执行的。

在病毒的第一个安装过程阶段，永恒之石获取一个感染计算机主机的立足点，下载tor客户端，然后连接到它的命令控制服务器，定位在暗网的一个.onion的域名上。

在一个预定的时间内，一般24个小时，命令控制器会响应，这个延迟执行进程的角色最有可能绕过沙盒安全测试环境和安全研究人员们分析这个病毒，因为没多少人愿意一整天来等命令控制器响应。
<twitterwidget class="twitter-tweet twitter-tweet-rendered" id="twitter-widget-0" data-tweet-id="865494946974900224" style="position: static; visibility: visible; display: block; transform: rotate(0deg); width: 500px; margin: 10px auto; max-width: 100%; min-width: 220px;">[View image on Twitter][10] [![View image on Twitter](https://pbs.twimg.com/media/DALa50RUwAAXWlg.jpg:small "View image on Twitter")][5] 

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

此外,永恒之石病毒也会用和他相同的名字的另一个WannaCry的SMB的蠕虫病毒文件，企图愚弄安全研究人员来误判它。 

但是不同于WannaCry病毒，永恒之石不包括停止开关的域名，但这是安全研究人员唯一用来停止Wannacry爆发的方法。
在病毒隐匿期满且命令控制器有了响应，永恒之石开始进入安装过程的第二阶段，它会下载一个名为shadowbrokers.zip形式的第二阶段恶意组件。

这个文件能够自解压，它包含着shadow Brokers黑客组织在2017年4月泄漏的七个NSA的SMB漏洞工具。
这个蠕虫病毒会开始一个快速的ip扫描过程并且尝试连接随机的ip地址。

![shadowbrokers.zip的内容](https://www.bleepstatic.com/images/news/u/986406/Malware/EternalRocks-exploits.png)
**在shadowbrokers.zip压缩包里发现了NSA工具的配置文件。**

### 永恒之石可以马上成为武器

由于该病毒集成的漏洞较多且广泛，缺少停止开关的域名，而且有它的隐匿期，如何病毒的作者决定用它来作为勒索，银行木马，远程控制或者其他功能的武器，永恒之石可能会对SMB端口暴露在外网的易受攻击的计算机造成严重的威胁。

就目前来看，蠕虫病毒看起来像是一个试验，或者是恶意软件作者在进行测试或者微调一个未来的威胁。

然而，这并不意味着永恒之石是无害的，感染了这个病毒的计算机是通过命令控制服务器来控制，并且蠕虫病毒的制造者能够隐藏这个通讯连接，然后发送新的恶意软件到这台感染了病毒的电脑上。

此外, DOUBLEPULSAR,一个带有后门的植入仍然运行在感染了永恒之石的PC上，不幸的是，该病毒的作者没有采取任何措施来保护这个DOUBLEPULSAR的植入，这意味这在缺省为被保护的状态下，其他的具有威胁的用户能把感染了永恒之石的计算机作为后门，发送他们自己的恶意软件到这些感染病毒的PC上。
关于这个病毒的感染过程的输入输出体系和更多信息能够在Stampar在几天前设置的[GitHub repo]库上获得。

### SMB漏洞的混战

当前, 有多个用户在扫描旧的和未打补丁的SMB服务，系统管理员已经注意到并且开始给易受攻击的计算机打补丁，关闭旧版的SMBv1协议，慢慢的来减少被永恒之石感染的计算机数量。

此外, 像Adylkuzz这类恶意软件，也会关闭SMB端口，来阻止来自其他威胁的漏洞，同时也导致了永恒之石和其他利用SMB漏洞的恶意软件潜在目标数量的减少，报告来自 [Forcepoint][21], [Cyphort][22], and [Secdo][23] 细节是当前其他软件会威胁有SMB端口的计算机。

虽然如此, 系统管理员补丁打的越快，系统越安全，“蠕虫病毒感染速度正在和系统管理员给机器打补丁速度比赛”，Stampar在一次私人谈话告诉BleepingComputer记者 . "一旦计算机被感染, 他能在任何时间将其作为武器，不论你打多时间多近的补丁."

 _Image credits: Miroslav Stampar, BleepingComputer & [Ana María Lora Macias][13]_

--------------------------------------------------------------------------------

作者简介：

Catalin涉及了各方面，像数据泄漏, 软件漏洞, 漏洞利用, 黑客新闻, 暗网, 编程话题, 社交媒体, web技术, 产品研发等领域.

---------------

via: https://www.bleepingcomputer.com/news/security/new-smb-worm-uses-seven-nsa-hacking-tools-wannacry-used-just-two/

作者：[CATALIN CIMPANU ][a]
译者：[hwlog](https://github.com/hwlog)
校对：[校对者ID](https://github.com/校对者ID)

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
