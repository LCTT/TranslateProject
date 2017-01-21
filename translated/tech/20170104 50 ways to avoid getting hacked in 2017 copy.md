50 种系统免遭黑客侵袭的方法 [2017 年版]
============================================================

> Paul Simon 概括了“与爱人分手的 50 法”，而这里，我们提供了提高系统安全性的 50 种方法。

 ![secure your systems](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/rh_003601_05_mech_osyearbook2016_security_cc.png?itok=VNmpz6K- "secure your systems") 

图片来自： 

Opensource.com

当我还是小孩子，耳畔萦绕着 Paul Simon 的流行歌：“[与爱人分手的50法][3]”。当我渐渐地长大，突然受歌的启发，收集了 50 种方法，免得你——门内汉和门外汉——遭受黑客侵袭啊：

### “你刚刚从后头溜出去了，杰克”

1、 备份你的数据。如果你不幸被勒索软件光顾，那么你就不用支付赎金，因为你做了备份。

2、 当你需要在公共场所为你的手机充电，那就使用 [sysncstop][4]吧，或者你也可以用你的备份电池。（LCTT 译注：sysncstop 是一种可以在公共场所安全充电的 USB 设备。在公共场所充电的风险，你知道的。）

3、 利用好你的审计系统，里头有好多很酷的工具可以帮助你监控系统。如果你确实遭到了入侵，那么审计系统也许就可以告诉你发生了什么，以及攻击者做了些什么。

4、 说到日志，把日志定向到集中式服务器上总是一个不错的想法，因为如果某个黑客侵入你的系统里，他首先要攻击的就是日志系统以便隐藏他的踪迹。构建一个好的入侵检测系统来监控日志，这对于防范黑客也很有帮助。

### “做份新的计划吧，斯坦”

5、 以强制模式运行 SELinux（见 [StopDisablingSelinux.com][5]）。不要觉得我现在还在喋喋不休地说这个可笑。SELinux 可以防止 0day 漏洞的影响。当[破壳][6]漏洞出现的时候，SELinux 曾是唯一的防护手段。

6、 如果可能，在 [SELinux 沙盒][7]中运行应用程序吧——在容器火遍全球前，它就已经是容器了。同时，请关注 [Flatpack][8] 开发，这个工具很快会开发沙盒功能。

7、 不要安装或者使用 Flash。Firefox 不再支持它了，同时也希望大多数 web 服务器正在远离它。

8、 使用[受约束的 SELinux 用户][9]来控制用户在你的系统中所能做的事。如果你正运行着一台共享登录的系统，设置用户为 `guest_t`。

### “你不必害羞，罗伊”

9、 利用 [systemd 工具的能力][10]来帮助你提升系统安全。大多数系统攻击是通过那些监听着网络的服务来实现的，而 Systemd 提供了一些很棒的方法来锁定服务。例如，使用 [PrivateTmp=yes][11] 。Privatemp 利用挂载命名空间来为服务器的 `/tmp` 设置一个私有的 **tmpfs** 挂载，这可以阻止被入侵的服务访问到主机 `/tmp` 中的内容，以及针对系统中基于监听 `/tmp` 的服务的潜在攻击。 

10、 `InaccessibleDirectories=/home` 是一个 systemd 单元的选项，它使用挂载命名空间的方式使从服务的角度看不到 `/home` 目录（或者其它任何目录），这会使得被入侵的服务攻击到数据更为困难。

11、 `ReadOnlyDirectories=/var` 是另外一个 systemd 单元的选项，它使用挂载命名空间的方式来将目录内容变成只读模式。基本上你总是可以让 `/usr` 运行在**只读模式**。这可以阻止一个被入侵的应用程序重写二进制文件，因为那可以在下次服务重启时，该服务依旧是被入侵的。

12、 降低服务权限（`CapabilityBoundingSet=CAP_CHOWN CAP_KILL`）。在内核中，特权服务被分解成一些列不同的权限。大多数服务不需要很多权限（如果需要一些的话），而 systemd 提供了一个简单的开关来从服务中剥离这些权限。

13、 如果服务不使用网络，那么你可以使用 `PrivateNetwork=yes` 来为该服务关闭网络功能。只需在服务的单元文件中开启该选项，就可以享受它带来的好处，关闭服务所有可用的网络。黑客常常并不是真的想破坏你的机器——他只是想用它作为攻击服务器来攻击其它机器。如果服务连不上网络，那么就不会受到攻击。

14、 控制服务可用的设备。 Systemd 提供了 `DeviceAllow` 配置，它控制了该服务可用的设备。`DeviceAllow=/dev/null rw` 将访问限制为 `/dev/null`，且仅可访问该设备节点，不允许对其它任何设备节点的访问。该功能实现于设备的 cgroup 控制器顶端。

15、 Systemd 系统即将迎来的一个新功能是 [`ProtectSystem Strict`][2]，该功能可以开启所有这些命名空间以完全锁定服务运行的环境。

### “刚刚重获自由”

16、 不要使用没有运行着 SELinux（[SEAndroid][11]）强制模式的手机。幸运的是，我听说目前超过 90% 的安卓手机都运行着 SEAndroid 的强制模式，这真让我高兴。现在要是我们能让那些果粉们使用 SELinux 就好了。

17、 只从受信源安装软件。不要安装你从因特网找来的危险东西，对于你的手机、计算机系统、虚拟机以及容器等等也一样。

18、 我不会在我的手机上进行网上银行操作——我只在我的 Linux 计算机上做这事儿。如果黑客偷了我的信用卡，也许我就丢了那么 50 美元；而如果他黑进我的银行账户，那我丢的钱就会更多。我想我是个老古板。（“滚出我的地盘。”——那些老古板都会这样说。）

19、 我用我手机做的一件很酷的事情，就是设置让我的信用卡公司每次在我的信用卡消费时给我发送短信。那样的话，如果账号被盗，我会更快地知道。

20、 当你需要安全地通讯，请使用 [Signal 安全信息应用][12]。

### “搭个便车，格斯”

21、 在你的计算机系统上运行 Linux。当我第一次想用计算机联络我的父亲时，在他的计算机中毒前，我很少回家。我回去给他的系统安了个 Linux，而他从那以后就一直运行着它。我相信 Linux 大体上说是一个更加安全的系统，因为它的设计方式。而且我也相信这个桌面被黑的可能性也相对较小，因为用它的人相对较少。有些人或许要持反对意见了，他们会说 Windows 在过去几年中已经有了很大的改进了，但对于我而言，我仍然坚持己见。

22、 只运行那些有[安全响应团队][13]进行安全监管的发行版。企业软件及其重要。

23、 运行一个企业级内核。在容器中，单点故障往往是内核。如果你想要保证它安全，那么就使用一个企业级内核，即便它不是一个最新的版本，但也包含了最新的安全补丁。记住，最新的内核虽然带来了最新的安全补丁，但是它也带来了大量的新代码，这些代码可能存在漏洞。

### “你不要说太多”

24、 大多数非法入侵都是通过社会工程学实施的——例如，电子邮件链接、web 浏览器攻击，以及电话。对于此，最好的选择是接受相关教育，并且对一切留个心眼儿。没有哪个来自尼日利亚的家伙会给你钱，国税局也不会打电话到你家问你要钱。如果你电子邮件收到了来自你银行的电子邮件，里面包含有到某个网站的链接，那么不要直接去点击那个链接，在 web 浏览器中输入那个地址来打开。

25、 总是把你的系统打上最新的安全补丁。已知有安全漏洞以及过时的系统的数量十分可怕，脚本小子们依赖于你**不**更新系统。

26、 当连接到网络上的服务时，请始终使用 HTTPS。Chrome 和 Firefox 现在有个强制开启 HTTPS 的模式。到 2016 年为止，那些还不支持安全通讯的网站可能就不值得你们访问。

27、 在你的容器中使用 [seccomp][14]，这会将攻击限制在内核之外，内核是个单点故障。限制什么进程可以具体讨论。

### “就把那钥匙丢下吧，李”

28、 使用 [YubiKey][15] 来存储私钥。

29、 加密你系统上的数据。至少对于笔记本而言，应该把**家目录**以及你的其它数据目录加密。几年前，我正乘坐在伦敦的地铁上，我的笔记本就成了某些人的目标——我下了车，车门关上了，而我发现我的笔记本不见了。此时，地铁已经驶出了站台。幸运的是，我把磁盘加密了。

30、 给你的所有网站用上 [Let's Encrypt][16] 吧，没有任何理由不再运行 HTTPS 了。

31、 绝不要在不同 web 服务器上使用相同的密码。虽然这个很难不落入陷阱，但是像 [Let's Encrypt][16] 这样的工具会有很大帮助。如果你使用 ssh 密钥来登录进系统，这会更好。

32、 使用双因素认证（2FA）。密码变得无关紧要，使用 Yubikey 以及诸如此类的工具可以使得双因素认证很方便，我们都有手机。在大脑中记一个密码，并在手机中生成一个密钥，总是比一个密码来得更好。

33、 网站总要我注册个帐号，没有比这更激怒我的事情了——我们就不能做得更好点？对于网站密码，始终都要使用密码生成工具来生成。我是个保守派：我使用 [Password Safe][17] 来生成密码，然后剪切粘贴到 web 浏览器中。我听说，其他人使用 [LastPass][18]，或者其它整合在手机和 web 服务中的工具也用着不错。

34、 配置像 [FreeIPA][19] 之类的服务用于身份认证。使用像 [Kerberos][20] 之类的工具来认证和授权，会使得跟踪雇员及其对系统的访问更为简便（而且它也有很酷的加密服务）。使用活动目录也很不错，或许我有点偏颇。

35、 如果你经常输入密码，那就使用一个容易记忆的句子，而不是一个单词。我所偏好的用于记忆密码的方式，就是使用有几个单词并且易于输入的词组。

### “让自己自由”

36、 使用 [USBGuard][21] 来保护你的系统免遭流氓 USB 设备破坏。

37、 在过去几年中，我一直工作于容器方面，让我们来说说容器的安全吧。首先，让它们在开启强制模式的 SELinux 的系统中运行。如果你的系统不支持 SELinux，那就换个支持它的版本吧。SELinux 是使用文件系统来保护容器免遭破坏的最佳工具。

38、 如果可能，在容器中跑你的服务吧。我相信，使用 [OCI 镜像格式][22] 和 Linux 容器技术是应用的未来。用 [runC][23]、OCID、RKT、Systemd-nspawn 等等来启动这些容器。虽然我常常说“容器并不包容“，但是不要在容器外面运行这些服务更好一些。

39、 在虚拟机中运行容器。虚拟机提供比容器更好的隔离机制，在虚拟机中跑像容器之类的东西，更加灵活有弹性，并且互相隔离。

40、 在不同的虚拟机中，按不同的安全需求跑容器应用。你可以在 DMZ 中的虚拟机上跑 web 服务容器，而在 DMZ 外的虚拟机上跑数据容器。

41、 同时，记得在不同的物理机上跑需要最高安全性的虚拟机，并且容器放在不同虚拟机上（这也叫深度防护）（LCTT 译注：此处原文有误，根据理解修改）。

42、 以[只读模式][24]跑容器。开发环境中的容器需要能够写入到 `/usr`，但是生产环境中的容器只能写入到 `tmpfs`，并且将卷挂载到容器中。

43、 [降低容器权限][25]。不管是在容器中，还是在容器外，我们都以比它们所需的更多的“权限”跑它们的进程，你可以通过降低权限来让你的进程更加安全。

44、 [不要以 root 身份在容器中跑进程][26]。大多数服务都不需要 root 特权，或者它们需要该权限来绑定到低于 1024 的端口，然后切换到非 root 用户。我建议你始终以非 root 身份来跑应用。

45、 给你的容器打上最新的 CVE 补丁。使用像 OpenShift 这样的工具来构建并维护你的容器镜像是个不错的主意，因为它会在新的安全补丁出现时自动重构容器镜像。

46、 我的一个同事说 “Docker 就是用来在你的主机上以 root 身份运行来自因特网的随机代码的。”从一个受信源获取软件，不要抓取你在 docker.io 上随便找到的第一个 Apache 应用。[操作系统有重要关系][27]。

47、 在一台受限的容器化优化的主机上跑生产环境容器，例如在一台[原子主机][28]上，它开启了所有安全特性，为运行中的容器而优化，带有限制攻击层和原子级更新。有什么不喜欢的吗？

48、 使用像 [OpenScap][29] 这样的工具来扫描你系统的漏洞。糟糕的是，新的漏洞总是层出不穷，所以你得时刻更新你的扫描器。（也可以看看 [原子扫描][30]，用于扫描你的容器。）

49、 OpenScap 也具有扫描[安全配置][31]的功能，如 STIG（安全技术部署指南）。

50、 为你孩子收到的所有那些圣诞物联网设备设置一个特别的客户网络。我钟爱我的 Amazon Echo，还有自动化灯以及电源开关（“Alexa，打开圣诞灯“），但是所有这些都是由可能存在安全问题的 Linux 操作系统控制。

### ”一定还有着另外 50 种免遭黑客侵害的方法“

你会为这个列表添加点什么呢？在下面的评论中告诉我们吧。

_Josh Bressers 对本文作出贡献。_

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/walsh1.jpg?itok=JbZWFm6J)

Daniel J Walsh - Daniel Walsh 已经致力于计算机安全领域将近 30 年。Dan 在 2001 年 8 月份加入 Red Hat。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/yearbook-50-ways-avoid-getting-hacked

作者：[Daniel J Walsh][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rhatdan
[1]:http://danwalsh.livejournal.com/51459.html
[2]:https://www.phoronix.com/scan.php?page=news_item&px=systemd-New-Protect-Tunables
[3]:https://www.youtube.com/watch?v=0H5chfbcWtY
[4]:http://syncstop.com/
[5]:http://stopdisablingselinux.com/
[6]:http://danwalsh.livejournal.com/71122.html
[7]:http://danwalsh.livejournal.com/31146.html
[8]:http://flatpak.org/
[9]:http://danwalsh.livejournal.com/37404.html
[10]:http://0pointer.de/blog/projects/security.html
[11]:https://source.android.com/security/selinux/
[12]:https://whispersystems.org/
[13]:https://access.redhat.com/blogs/766093/posts/2695561
[14]:https://lwn.net/Articles/656307/
[15]:https://www.yubico.com/
[16]:https://letsencrypt.org/
[17]:https://pwsafe.org/
[18]:https://www.lastpass.com/
[19]:https://www.freeipa.org/page/Main_Page
[20]:https://web.mit.edu/kerberos/
[21]:https://github.com/dkopecek/usbguard
[22]:https://www.opencontainers.org/
[23]:https://runc.io/
[24]:http://www.projectatomic.io/blog/2015/12/making-docker-images-write-only-in-production/
[25]:http://rhelblog.redhat.com/2016/10/17/secure-your-containers-with-this-one-weird-trick/
[26]:https://www.projectatomic.io/blog/2016/01/how-to-run-a-more-secure-non-root-user-container/
[27]:https://opensource.com/16/12/yearbook-why-operating-system-matters
[28]:https://access.redhat.com/articles/rhel-atomic-getting-started
[29]:https://www.open-scap.org/
[30]:https://developers.redhat.com/blog/2016/05/02/introducing-atomic-scan-container-vulnerability-detection/
[31]:https://www.open-scap.org/security-policies/scap-security-guide/
