使用一个树莓派和 projectx/os 托管你自己的电子邮件
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2)

现在有大量的理由，不能再将存储你的数据的任务委以他人之手，也不能在第三方公司运行你的服务；隐私、所有权、以及防范任何人拿你的数据去“赚钱”。但是对于大多数人来说，自己去运行一个服务器，是件即费时间又需要太多的专业知识的事情。不得已，我们只能妥协。抛开这些顾虑，使用某些公司的云服务，随之而来的就是广告、数据挖掘和售卖、以及其它可能的任何东西。

[projectx/os][1]  项目就是要去除这种顾虑，它可以在家里毫不费力地做服务托管，并且可以很容易地创建一个类似于 Gmail 的帐户。实现上述目标，你只需一个 $35 的树莓派 3 和一个基于 Debian 的操作系统镜像 —— 并且不需要很多的专业知识。仅需要四步就可以实现：

  1. 解压缩一个 ZIP 文件到 SD 存储卡中。
  2. 编辑 SD 上的一个文本文件以便于它连接你的 WiFi（如果你不使用有线网络的话）。
  3. 将这个 SD 卡插到树莓派 3 中。
  4. 使用你的智能手机在树莓派 3 上安装 "email 服务器“ 应用并选择一个二级域。



服务器应用程序（比如电子邮件服务器）被分解到多个容器中，它们中的每个都只能够使用指定的方式与外界通讯，它们使用了管理粒度非常细的隔离措施以提高安全性。例如，入站 SMTP，[SpamAssassin][2]（防垃圾邮件平台），[Dovecot][3] （安全 IMAP 服务器），并且 webmail 都使用了独立的容器，它们之间相互不能看到对方的数据，因此，单个守护进程出现问题不会波及其它的进程。

另外，它们都是无状态容器，比如 SpamAssassin 和入站 SMTP，每次收到电子邮件之后，它们的连接都会被拆除并重建，因此，即便是有人找到了 bug 并利用了它，他们也不能访问以前的电子邮件或者接下来的电子邮件；他们只能访问他们自己挖掘出漏洞的那封电子邮件。幸运的是，大多数对外发布的、最容易受到攻击的服务都是隔离的和无状态的。

所有存储的数据都使用 [dm-crypt][4] 进行加密。非公开服务，比如 Dovecot（IMAP）或者 webmail，都是在内部监听，并使用 [ZeroTier One][5] 加密整个网络，因此只有你的设备（智能手机、笔记本电脑、平板等等）才能访问它们。

虽然电子邮件并不是端到端加密的（除非你使用了 [PGP][6]），但是非加密的电子邮件绝不会跨越网络，并且也不会存储在磁盘上。现在明文的电子邮件只存在于双方的私有邮件服务器上，它们都在他们的家中受到很好的安全保护并且只能通过他们的客户端访问（智能手机、笔记本电脑、平板等等）。

另一个好处就是，个人设备都使用一个密码保护（不是指纹或者其它生物识别技术），而且在你家中的设备都受到美国的 [第四宪法修正案][7] 的保护，比起由公司所有的第三方数据中心，它们受到更强的法律保护。当然，如果你的电子邮件使用的是 Gmail，Google 还保存着你的电子邮件的拷贝。

### 展望

电子邮件是我使用 project/os 项目打包的第一个应用程序。想像一下，一个应用程序商店有全部的服务器软件，为易于安装和使用将它们打包到一起。想要一个博客？添加一个 WordPress 应用程序！想替换安全的 Dropbox ？添加一个 [Seafile][8] 应用程序或者一个 [Syncthing][9] 后端应用程序。 [IPFS][10] 节点？ [Mastodon][11] 实例？GitLab 服务器？各种家庭自动化/物联网后端服务？这里有大量的非常好的开源服务器软件 ，它们都非常易于安装，并且可以使用它们来替换那些有专利的云服务。

Nolan Leake 的 [在每个家庭中都有一个云：0 系统管理员技能就可以在家里托管服务器][12] 将在三月 8 - 11日的  [Southern California Linux Expo][12] 进行。使用折扣代码 **OSDC** 去注册可以 50% 的价格得到门票。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/host-your-own-email

作者：[Nolan Leake][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/nolan
[1]:https://git.sigbus.net/projectx/os
[2]:http://spamassassin.apache.org/
[3]:https://www.dovecot.org/
[4]:https://gitlab.com/cryptsetup/cryptsetup/wikis/DMCrypt
[5]:https://www.zerotier.com/download.shtml
[6]:https://en.wikipedia.org/wiki/Pretty_Good_Privacy
[7]:https://simple.wikipedia.org/wiki/Fourth_Amendment_to_the_United_States_Constitution
[8]:https://www.seafile.com/en/home/
[9]:https://syncthing.net/
[10]:https://ipfs.io/
[11]:https://github.com/tootsuite/mastodon
[12]:https://www.socallinuxexpo.org/scale/16x/presentations/cloud-every-home-host-servers-home-0-sysadmin-skills
[13]:https://register.socallinuxexpo.org/reg6/
