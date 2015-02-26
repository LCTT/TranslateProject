怎样选择你的最佳商用Linux服务器
=====================================================

所谓适合你的商用Linux服务器，可能只是能符合你的职员水准的服务器。


![img](http://www.itworld.com/sites/default/files/best-penguin.jpg "penguins")
供图： flickr/Pete

与上千种Linux桌面版本相比，Linux服务器只有可怜的十几种。但想要选对适合你的企业需要的仍然不是件容易的事情。我可以帮助你。Linux 方面我有20年经验了，对Linux服务器略懂一二。

> 参考：

> * [众多Linux服务器测试中Ubuntu的表现][1]

> * [选择桌面Linux发行版本的第一条原则：用户更了解自己][2]

我觉得选Linux服务器首先要考虑的是你的IT部门对Linux有多熟悉。尽管这些年Linux专家好找多了，但是专业搞Linux的人还是不太好找。

今年早些时候我去俄勒冈州的波特兰参加一个叫做OSCon的开源大会的时候，我确认了一个事实就是每家公司（包括某家叫什么软的）都在考虑[雇佣有Linux和开源工作经验的人][3]。


特别地，从已有经验来看，雇主在找有[几年Linux使用经验]的职员的时候都遇到了麻烦。或者确切地说是你需要保证你的Linux服务器火车准点的雇员。


不难看出，如果你手底下没有一群经验丰富的Linux技术人员的话，你要避免选择像[Debian][5]这样没有供应商提供技术支持的版本。

别搞错了，如果有经验丰富的人员的话Debian是个很棒的选择，但是如果你的职员连BASH和C Shell有什么区别都不知道的话那还是算了吧。

> 推荐给Linux新手的Linux服务器

	- RHEL
	- SUSE
	- Oracle Linux
	- Turnkey Linux

如果你的职员是Linux新手，你需要用一个商业版本的Linux。在它们之中，多数人力荐的是[Red Hat Enterprise Linux][6]。

Red Hat靠对商用的支持成为了第一个资产过亿的Linux公司。RHEL比起其它Linux有很大的优势，因为它有着全套的工具——[企业级支持][8]，[专业认证][9]，[硬件认证][10]，通过[Red Hat Network (RHN)][11] 的自动在线更新 —— 那让CFO和CIO们很开心。

话说回来，Red Hat 确实有个真正的对手：[SUSE Linux Enterprise Sever (SLES)][12]。

像RHEL一样，SLES有着[技术支持][13]；由它的姊妹公司Novell负责的[人员认证][14]，[硬件认证][15]，[在线更新][16]。

那么，在它们当中该怎么选择呢？你可以试试先。它们用起来都很容易。就我而言，它们我都用过。总之要视实际情况而定，它们各有用武之地。

还有一个企业级Linux可以选择: [Oracle Linux][17]。尽管它是以RHEL为模仿对象和奋斗目标的，反正我不用。我所知道的唯一在商用中使用它的是一群把它们的IT鸡蛋们都放在Oracle这个篮子里面的人。

> 推荐给非专家用户的Linux服务器

	- CentOS
	- openSUSE
	- Ubuntu Server

假设你中等水平，你的手下了解一些Linux的知识但并不是专家，怎么办呢？

我将推荐几个Linux。首先，如果你喜欢RHEL的话，那么一个免费的RHEL的克隆版本[CentOS][18]，值得你去关注。

CentOS 人气很高。如果你有一个运行在大多Web托管服务上的Apache服务器软件，很有可能你的网站就是运行在CentOS上的。要在网上寻找这个发行版的免费技术支持也不是件难事。

如果你在担心Red Hat找CentOS麻烦的话，尽管放心好了。虽然Red Hat对Oracle Linux没什么好感，但对CentOS不一样。RedHat的CEO James Whitehurst最近说：“CentOS 是 [RHEL生态系统成为行业标杆][19]的原因之一。如果不是它，Linux就必须付费使用而RHEL也就不会这么流行了。所以，往小处看我们是损失了一些收入，但从长远看，CentOS 在使RHEL成功方面扮演着非常重要的角色。”

另外一个给稍微了解一点Linux的人的选择是[openSUSE][20]。这是SUSE的社区版本。尽管它不提供SLES的技术支持，它还是挺好用的。我的家用服务器就是用的openSUSE。

[Fedora][21]是RHEL的社区版，但我不推荐用它做服务器。Fedora对想要挖掘Linux潜力的开发者们是不错的，但它不适合想要一个稳定的服务器的人。

另外一个中游的选择是Canonical的Ubuntu。Ubuntu以桌面版本及其在平板电脑和智能手机上的设计而闻名，同时它也有相当好的服务器版本：[Ubuntu Server][22]。

像RHEL和SLES一样，Ubuntu也有技术支持和认证服务，但比不上Red Hat 和SUSE的资源丰富。另一方面，Ubuntu作服务器的话还是挺容易上手的。

 
> 专家级Linux服务器

	- Arch
	- Gentoo
	- Debian
	- Fedora

如果你对云计算感兴趣，Ubuntu（像RHEL一样）[和OpenStack结合地很好][23]。另外，Ubuntu的母公司Canonical提供了[Juju][24]，一套非常方便的DevOps（开发/运营）的[工具][25]，这使得Ubuntu的架设、配置、管理、维护、升级和扩展服务器变得更简单。

当我们在探讨云的时候，你也应该考虑你是不是真的需要在你的办公室或者数据中心里运行通用Linux服务器。很有可能你能在云的某一特定Linux服务器上运行服务。

多数公用云计算服务，如Amazon Web Services(AWS)，Azure和RackSpace，提供Linux服务器。这样的话配置服务器等等一些难做的工作就已经替你做好了。

举个例子，在Amazon Elastic Cloud (AE2)上，Amazon提供了随时可用的Amazon Machine Images (AMIs)，包括上文提到的每一种Linux发行版本，还有它自己的[Amazon Linux][26]可以选择。Microsoft的Azure呢，不管你信不信，[支持CentOS，openSUSE，SUSE和Ubuntu][27]。最后，RackSpace，一个OpenStack的拥护者，[支持大多数主流Linux服务器版本][28]和两个轻量级Linux，Arch和Gentoo。然而，像Debian一样，我仅推荐那些特别了解这些Linux发行版的人使用它们作为关键业务服务器。

谁说你就算是在云上都要有一个全功能Linux服务器？你可能只需要一个针对特定工作的Linux服务器。[Turnkey Linux][29]可以满足你。


Turnkey基于64位的Debian，但它需要的专业知识最少。因为它只提供特定的服务而不是一个全功能的发行版本。

Turnkey有超过100个可用的应用。包括Apache，Linux，MySQL，PHP/Python/Perl (LAMP) ；WordPress博客平台；Drupal内容管理系统（CMS）以及像Ushahidi这样的大流量购物服务器，优秀的人际关系管理（CRM）应用Zurmo，人道救援管理系统Sahana Eden。你可以在AWS，裸机，虚拟机（VM）或者Infrastructure as a Service(IaaS)云上面使用它们。

简言之，不论你对Linux知道多少，总有一款Linux服务器版适合你进行商用。动手吧！


via: http://www.itworld.com/operating-systems/372236/how-choose-best-linux-server-your-business

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[boredivan][] 校对：[jasminepeng][]


[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[boredivan]:http://linux.cn/space/boredivan
[jasminepeng]:http://linux.cn/space/jasminepeng

[1]:http://www.itworld.com/slideshow/119061/ubuntu-impresses-test-linux-servers-372374
[2]:http://www.itworld.com/operating-systems/370104/first-rule-choosing-desktop-linux-distribution-user-know-thyself
[3]:http://blog.smartbear.com/open-source/yes-open-source-jobs-are-hot-and-we-have-stats-to-prove-it/
[4]:http://www.itworld.com/it-managementstrategy/250988/where-are-all-linux-professionals
[5]:http://www.debian.org/
[6]:http://www.redhat.com/products/enterprise-linux/
[7]:http://www.itworld.com/it-managementstrategy/263212/red-hat-joins-billion-dollar-club
[8]:http://www.redhat.com/support/
[9]:http://www.redhat.com/training/certifications/
[10]:http://www.redhat.com/rhel/compatibility/hardware/
[11]:https://access.redhat.com/subscriptions/rhntransition/
[12]:https://www.suse.com/products/server/
[13]:https://www.suse.com/products/expandedsupport/
[14]:http://www.novell.com/training/certinfo/clp/
[15]:https://www.suse.com/partners/ihv/yes/
[16]:https://www.suse.com/products/register.html
[17]:http://www.oracle.com/us/technologies/linux/overview/index.html
[18]:http://www.centos.org/
[19]:http://readwrite.com/2013/08/13/red-hat-ceo-centos-open-source
[20]:http://www.opensuse.org/en/
[21]:http://fedoraproject.org/
[22]:http://www.ubuntu.com/server
[23]:http://www.ubuntu.com/cloud/build-a-cloud
[24]:https://juju.ubuntu.com/
[25]:https://community.csc.com/community/cio-engage/blog/2013/08/25/beyond-chef-and-puppet-ubuntu-juju
[26]:https://aws.amazon.com/marketplace/pp/B00635Y2IW/ref=mkt_ste_ec2_amznlinux
[27]:http://www.windowsazure.com/en-us/manage/linux/other-resources/endorsed-distributions/
[28]:http://www.rackspace.com/knowledge_center/article/choosing-a-linux-distribution
[29]:http://www.turnkeylinux.org/
