新的OpenSSL分支未包含Heartbleed漏洞，但需要认证看待
================================================================================
> 摘要：当被最新的OpenSSL安全问题困扰时，你最好解决它，虽然它并不像Heartbleed那样糟糕。

这一周对于开源团队Secure Socket Layer （SSL）的程序员们来说真是糟糕的一周。

首先，[GnuTLS][1]晦涩的表明，存在一个不太重要可很糟糕的缺陷。然后，大范围流行的OpenSSL被发现包含一个[中间人漏洞][2]。在[Heartbleed漏洞][3]惨剧后，OpenSSL需要这个来给自己醒醒脑。

![](http://cdn-static.zdnet.com/i/r/story/70/00/030273/openssl-200x55.png?hash=MwyxMwt0MJ&upscale=1)

这个漏洞，根据谷歌高级软件工程师Adam Langley描述，已经[至少存在了15年时间][4]。可惜Core Infrastructure Initiative(CII)领导下的OpenSSL的修补人员获得了[更多的资金][5]，却没能更早的修复他。

也就是说这个漏洞依然是和Heartbleed漏洞一样糟糕。对于一些新手，攻击者需要在浏览器和启用了SSL客户端的程序之间来利用这个安全漏洞。

尽管它可能被利用，你依然需要尽可能快的通过升级来解决这个漏洞。就像[NTT Com Security][6]的评估服务负责人Chris Camejo在邮件会议里说的，“它很糟糕因为已经存在了这么长的时间，看起来传播范围相当广泛。”

他补充到：“如果利用它，将使攻击者解密流量。从SSL的设计目的看，这是一个很严重的问题，同时SSL被用来保护很多的密码，信用卡卡号和其他的和网站类似的敏感数据的email连接。”

在一次单独采访中，Red Hat的产品安全高级负责人Mark Cox详细深入地介绍了[细节][7]。Cox说，OpenSSL已修正了一些安全缺陷，但鉴于我们需要想办法告诉人们不要因为Heartbleed而陷入恐慌。

Cox解释说，Heartbleed漏洞在公布之前得到了修补，但利用此漏洞的消息在修补程序之前传开，因此在这个问题上有那么多的抱怨。最新的情况，已有七个安全问题得到了修补，但其中只有两项需要管理员和用户的关注。

第一，Cox继续说道，是数据报传输层安全 (DTLS)的bug。到目前为止，还没有已知的攻击，但是存在针对它攻击成功的潜在性。

因此，虽然DTLS使用不广泛，如果您确实在使用它，它应尽快修补。

Cox然后说,"这个问题的实际上是中间人攻击"。甚至在此，为这项工作，真的有人必须是"在中间的"，来利用易受攻击的服务器和客户端之间的漏洞。

但如果有人可以这样做，他们能"绕过SSL并拿到原始数据...这是一个相当严重的问题"。

但是，从理论上讲任何人都可以利用Heartbleed漏洞来攻击SSL服务器。攻击并利用此漏洞需要能接触到客户端和服务器之间的通信网络。例如，成功的攻击可能会作出与假咖啡屋Wi-Fi接入点，被用于连接的Android版本的Chrome网络浏览器和一个未安装修补程序的Web服务器。幸运的是，谷歌[已经发布了更新的版本的浏览器][8]，35.0.1916.141，以消除此问题。

Cox，最易受攻击的系统是未安装修补程序的Android设备使用一个假的Wi-Fi热点。Morrell补充说因为Android用户在他们的手机供应商和电信公司面前属于弱势，安全漏洞更新前他们可能会受漏洞影响相当长的时间。

幸运的是，如果他们用连接的服务器已经更新，他们仍然不会受到攻击。

OpenSSL安全社区自5月初以来已经知道这个问题。工作组与Red Hat、其他主要Linux和开源组和硬件供应商，不只是简单修补bug就面对了很多麻烦，但采取下一步骤是测试修复，这样他们可以确认（如任何人都可以在安全） 它会修复漏洞，但也不引入任何新的安全问题并可在大多数 OpenSSL服务器和客户端的组合上工作。

现在，该修补补丁就在那里，OpenSSL想巩固事实，以及修补补丁，向公众表明对这些问题不必有任何不必要的恐慌。Cox添加主要的Linux供应商，如Red Hat和Ubuntu，已经有可用的修补程序。

所有的管理员需要做的是对所有服务器都要下载并安装补丁，而不是证明安全危机然后这将业务照常进行。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/new-openssl-breech-is-no-heartbleed-but-needs-to-be-taken-seriously-7000030273/

译者：[lolipop](https://github.com/stduolc) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.zdnet.com/another-serious-gnutls-bug-exposes-linux-clients-to-server-attacks-7000030205
[2]:http://www.zdnet.com/openssl-fixes-another-severe-vulnerability-7000030253/
[3]:http://www.zdnet.com/heartbleed-serious-openssl-zero-day-vulnerability-revealed-7000028166
[4]:https://www.imperialviolet.org/2014/06/05/earlyccs.html
[5]:http://www.zdnet.com/corporations-put-their-cash-where-their-open-source-security-is-7000030023/
[6]:http://www.nttcomsecurity.com/us/
[7]:http://ec.libsyn.com/p/6/a/5/6a58036510bae37c/CloudEvangelistPodcast_Ep92_MarkCox.mp3?d13a76d516d9dec20c3d276ce028ed5089ab1ce3dae902ea1d06c88537d1ce596fdc&c_id=7251647)
[8]:http://googlechromereleases.blogspot.com/2014/06/chrome-for-android-update.html