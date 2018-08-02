可代替 Dropbox 的 5 个开源软件
=====

> 寻找一个不会破坏你的安全、自由或银行资产的文件共享应用。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dropbox.jpg?itok=qFwcqboT)

Dropbox 在文件共享应用中是个 800 磅的大猩猩。尽管它是个极度流行的工具，但你可能仍想使用一个软件去替代它。

也行你出于各种好的理由，包括安全和自由，这使你决定用[开源方式][1]。亦或是你已经被数据泄露吓坏了，或者定价计划不能满足你实际需要的存储量。

幸运的是，有各种各样的开源文件共享应用，可以提供给你更多的存储容量，更好的安全性，并且以低于 Dropbox 很多的价格来让你掌控你自己的数据。有多低呢？如果你有一定的技术和一台 Linux 服务器可供使用，那尝试一下免费的应用吧。

这里有 5 个最好的可以代替 Dropbox 的开源应用，以及其他一些，你可能想考虑使用。

### ownCloud

![](https://opensource.com/sites/default/files/uploads/owncloud.png)

[ownCloud][2] 发布于 2010 年，是本文所列应用中最老的，但是不要被这件事蒙蔽：它仍然十分流行（根据该公司统计，有超过 150 万用户），并且由由 1100 个参与者的社区积极维护，定期发布更新。

它的主要特点——文件共享和文档写作功能和 Dropbox 的功能相似。它们的主要区别（除了它的[开源协议][3]）是你的文件可以托管在你的私人 Linux 服务器或云上，给予用户对自己数据完全的控制权。（自托管是本文所列应用的一个普遍的功能。）

使用 ownCloud，你可以通过 Linux、MacOS 或 Windows 的客户端和安卓、iOS 的移动应用程序来同步和访问文件。你还可以通过带有密码保护的链接分享给其他人来协作或者上传和下载。数据传输通过端到端加密（E2EE）和 SSL 加密来保护安全。你还可以通过使用它的 [市场][4] 中的各种各样的第三方应用来扩展它的功能。当然，它也提供付费的、商业许可的企业版本。

ownCloud 提供了详尽的[文档][5]，包括安装指南和针对用户、管理员、开发者的手册。你可以从 GitHub 仓库中获取它的[源码][6]。

### NextCloud

![](https://opensource.com/sites/default/files/uploads/nextcloud.png)

[NextCloud][7] 在 2016 年从 ownCloud 分裂出来，并且具有很多相同的功能。 NextCloud 以它的高安全性和法规遵从性作为它的一个独特的[推崇的卖点][8]。它具有 HIPAA （医疗） 和 GDPR （隐私）法规遵从功能，并提供广泛的数据策略约束、加密、用户管理和审核功能。它还在传输和存储期间对数据进行加密，并且集成了移动设备管理和身份验证机制 （包括 LDAP/AD、单点登录、双因素身份验证等）。

像本文列表里的其他应用一样， NextCloud 是自托管的，但是如果你不想在自己的 Linux 上安装 NextCloud 服务器，该公司与几个[提供商][9]达成了伙伴合作，提供安装和托管，并销售服务器、设备和服务支持。在[市场][10]中提供了大量的apps 来扩展它的功能。

NextCloud 的[文档][11]为用户、管理员和开发者提供了详细的信息，并且它的论坛、IRC 频道和社交媒体提供了基于社区的支持。如果你想贡献或者获取它的源码、报告一个错误、查看它的 AGPLv3 许可，或者想了解更多，请访问它的[GitHub 项目主页][12]。

### Seafile

![](https://opensource.com/sites/default/files/uploads/seafile.png)

与 ownCloud 或 NextCloud 相比，[Seafile][13] 或许没有花里胡哨的卖点（app 生态），但是它能完成任务。实质上, 它充当了 Linux 服务器上的虚拟驱动器，以扩展你的桌面存储，并允许你使用密码保护和各种级别的权限（即只读或读写） 有选择地共享文件。

它的协作功能包括文件夹权限控制，密码保护的下载链接和像 Git 一样的版本控制和记录。文件使用双因素身份验证、文件加密和 AD/LDAP 集成进行保护，并且可以从 Windows、MacOS、Linux、iOS 或 Android 设备进行访问。

更多详细信息, 请访问 Seafile 的 [GitHub 仓库][14]、[服务手册][15]、[wiki][16] 和[论坛][17]。请注意, Seafile 的社区版在 [GPLv2][18] 下获得许可，但其专业版不是开源的。

### OnionShare

![](https://opensource.com/sites/default/files/uploads/onionshare.png)

[OnionShare][19] 是一个很酷的应用：如果你想匿名，它允许你安全地共享单个文件或文件夹。不需要设置或维护服务器，所有你需要做的就是[下载和安装][20]，无论是在 MacOS, Windows 还是 Linux 上。文件始终在你自己的计算机上； 当你共享文件时，OnionShare 创建一个 web 服务器，使其可作为 Tor 洋葱服务访问，并生成一个不可猜测的 .onion URL，这个 URL 允许收件人通过 [Tor 浏览器][21]获取文件。

你可以设置文件共享的限制，例如限制可以下载的次数或使用自动停止计时器，这会设置一个严格的过期日期/时间，超过这个期限便不可访问（即使尚未访问该文件）。

OnionShare 在 [GPLv3][22] 之下被许可；有关详细信息，请查阅其 [GitHub 仓库][22]，其中还包括[文档][23]，介绍了这个易用的文件共享软件的特点。

### Pydio Cells

![](https://opensource.com/sites/default/files/uploads/pydiochat.png)

[Pydio Cells][24] 在 2018 年 5 月推出了稳定版，是对 Pydio 共享应用程序的核心服务器代码的彻底大修。由于 Pydio 的基于 PHP 的后端的限制，开发人员决定用 Go 服务器语言和微服务体系结构重写后端。（前端仍然是基于 PHP 的）。

Pydio Cells 包括通常的共享和版本控制功能，以及应用程序中的消息接受、移动应用程序（Android 和 iOS），以及一种社交网络风格的协作方法。安全性包括基于 OpenID 连接的身份验证、rest 加密、安全策略等。企业发行版中包含着高级功能，但在社区（家庭）版本中，对于大多数中小型企业和家庭用户来说，依然是足够的。

您可以 在 Linux 和 MacOS 里[下载][25] Pydio Cells。有关详细信息, 请查阅 [文档常见问题][26]、[源码库][27] 和 [AGPLv3 许可证][28]

### 其他

如果以上选择不能满足你的需求，你可能想考虑其他开源的文件共享型应用。

* 如果你的主要目的是在设备间同步文件而不是分享文件，考察一下 [Syncthing][29]。
* 如果你是一个 Git 的粉丝而不需要一个移动应用。你可能更喜欢 [SparkleShare][30]。
* 如果你主要想要一个地方聚合所有你的个人数据, 看看 [Cozy][31]。
* 如果你想找一个轻量级的或者专注于文件共享的工具，考察一下 [Scott Nesbitt's review][32]——一个罕为人知的工具。

哪个是你最喜欢的开源文件共享应用？在评论中让我们知悉。

--------------------------------------------------------------------------------

via: https://opensource.com/alternatives/dropbox

作者：[Opensource.com][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[distant1219](https://github.com/distant1219)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com
[1]:https://opensource.com/open-source-way
[2]:https://owncloud.org/
[3]:https://www.gnu.org/licenses/agpl-3.0.html
[4]:https://marketplace.owncloud.com/
[5]:https://doc.owncloud.com/
[6]:https://github.com/owncloud
[7]:https://nextcloud.com/
[8]:https://nextcloud.com/secure/
[9]:https://nextcloud.com/providers/
[10]:https://apps.nextcloud.com/
[11]:https://nextcloud.com/support/
[12]:https://github.com/nextcloud
[13]:https://www.seafile.com/en/home/
[14]:https://github.com/haiwen/seafile
[15]:https://manual.seafile.com/
[16]:https://seacloud.cc/group/3/wiki/
[17]:https://forum.seafile.com/
[18]:https://github.com/haiwen/seafile/blob/master/LICENSE.txt
[19]:https://onionshare.org/
[20]:https://onionshare.org/#downloads
[21]:https://www.torproject.org/
[22]:https://github.com/micahflee/onionshare/blob/develop/LICENSE
[23]:https://github.com/micahflee/onionshare/wiki
[24]:https://pydio.com/en
[25]:https://pydio.com/download/
[26]:https://pydio.com/en/docs/faq
[27]:https://github.com/pydio/cells
[28]:https://github.com/pydio/pydio-core/blob/develop/LICENSE
[29]:https://syncthing.net/
[30]:http://www.sparkleshare.org/
[31]:https://cozy.io/en/
[32]:https://opensource.com/article/17/3/file-sharing-tools
