[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12897-1.html)
[#]: subject: (How this open source security tool halted significant DDoS attacks)
[#]: via: (https://opensource.com/article/20/12/open-source-vs-ddos-attacks)
[#]: author: (Philippe Humeau https://opensource.com/users/philippe-humeau)

如何在 1 分钟内阻止 7000 台机器的僵尸网络
======

> 对 CrowdSec 的配置更改，在不到一分钟的时间内阻止了一个 7000 台机器的僵尸网络的攻击。

![](https://img.linux.net.cn/data/attachment/album/202012/07/220444x6kaedeu6ko0e7uo.jpg)

2020 年，我们的生活和工作方式在短短几天内被彻底颠覆。随着 COVID-19 开始在全球范围内蔓延，我们将工作带回家，与同事、朋友和家人保持在线联系成为关键的必需品。这为黑客造成破坏打开了大门。例如，根据 Neustar 的数据，今年上半年全球的分布式拒绝服务（DDOS） 攻击[增长了 151%][2]。

[CrowdSec][3] 是一个开源的安全引擎，它可以分析访问者的行为，并提供适应各种攻击的响应。它能解析来自各种来源的日志，并应用启发式方案来识别攻击性行为，并防范大多数攻击类别。并且，它与其它安装的 CrowdSec 系统共享该情报。每次 IP 地址被阻止时，它都会通知整个用户社区。这就创建了一个[实时、协作的 IP 信誉数据库][4]，利用人群的力量使互联网更加安全。

### CrowdSec 如何工作：案例研究

Sorf Networks 是一家总部位于土耳其的技术公司，为客户提供高配置的托管服务器和 DDoS 防护解决方案，它提供了一个 CrowdSec 工作的例子。Sorf 的一个客户每天都会遇到来自 1 万多台机器僵尸网络的 DDoS 攻击，并努力寻找一种能够满足技术要求的解决方案来及时处理这些攻击。

虽然客户采取了一般的预防措施来缓解这些攻击，比如引入 JavaScript（JS）<ruby>挑战<rt>challenges</rt></ruby>、限速等，但这些措施在整个攻击面并不可行。一些 URL 需要被非常基本的软件使用，而这些软件不支持 JS 挑战。黑客就是黑客，这正是他们每天的目标：链条上最薄弱的环节。

Sorf Networks 首先使用 [Fail2ban][5]（这启发了 CrowdSec）为其客户建立了一个 DDoS 缓解策略。它在一定程度上帮助了客户，但它太慢了。它需要 50 分钟来处理日志和处理 7000 到 10000 台机器的 DDoS 攻击。这使得它在这种情况下没有效果。另外，因为它没有禁止 IP，日志会持续堆积，它需要每秒处理几千条日志，这是不可能的。

在使用租用的僵尸网络进行的 DDoS 测试中，一次攻击可以高达每秒 6700 个左右的请求，这些请求来自 8600 个独立 IP。这是对一台服务器流量的捕捉：

![Server traffic][6]

虽然 CrowdSec 技术可以应对巨大的攻击，但其默认设置每秒只能处理约 1000 个端点。Sorf 需要一个量身定做的配置来处理单台机器上这么多的流量。

Sorf 的团队对 CrowdSec 的配置进行了修改，以显著提高其吞吐量来处理日志。首先，它去掉了高消耗且非关键的<ruby>富集<rt>enrichment</rt></ruby>解析器，例如 [GeoIP 富集][7]。它还将允许的 goroutine 的默认数量从一个增加到五个。之后，团队又用 8000 到 9000 台主机做了一次实测，平均每秒 6000 到 7000 个请求。这个方案是有代价的，因为 CrowdSec 在运行过程中吃掉了 600% 的 CPU，但其内存消耗却保持在 270MB 左右。

然而，结果却显示出明显的成功：

  * 在一分钟内，CrowdSec 能够处理所有的日志
  * 95% 的僵尸网络被禁止，攻击得到有效缓解
  * 15 个域现在受到保护，不受 DDoS 攻击

根据 Sorf Networks 的总监 Cagdas Aydogdu 的说法，CrowdSec 的平台使团队“能够在令人难以置信的短时间内提供一个世界级的高效防御系统”。

* * *

本文改编自[如何用 CrowdSec 在 1 分钟内阻止 7000 台机器的僵尸网络][8]，原载于 CrowdSec 网站。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/open-source-vs-ddos-attacks

作者：[Philippe Humeau][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/philippe-humeau
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_password_chaos_engineer_monster.png?itok=J31aRccu (Security monster)
[2]: https://www.businesswire.com/news/home/20200916005046/en/DDoS-Attacks-Increase-by-151-in-First-Half-Of-2020
[3]: https://crowdsec.net/
[4]: https://opensource.com/article/20/10/crowdsec
[5]: https://www.fail2ban.org
[6]: https://opensource.com/sites/default/files/uploads/crowdsec_servertraffic.png (Server traffic)
[7]: https://hub.crowdsec.net/author/crowdsecurity/configurations/geoip-enrich
[8]: https://crowdsec.net/2020/10/21/how-to-stop-a-botnet-with-crowdsec/
