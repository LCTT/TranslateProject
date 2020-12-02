[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How this open source security tool halted significant DDoS attacks)
[#]: via: (https://opensource.com/article/20/12/open-source-vs-ddos-attacks)
[#]: author: (Philippe Humeau https://opensource.com/users/philippe-humeau)

How this open source security tool halted significant DDoS attacks
======
Configuration changes to CrowdSec stopped a 7,000-machine botnet in less
than a minute.
![Security monster][1]

In 2020, our ways of living and working were turned completely upside down in a matter of days. As COVID-19 began to spread across the globe, we brought our companies home, and staying connected to our colleagues, friends, and family online became a critical necessity. This opened the door for hackers to cause disruption; for example, distributed denial of service (DDoS) attacks around the world were [up 151%][2] in the first half of the year, according to Neustar.

[CrowdSec][3] is an open source security engine that analyzes visitor behavior and provides an adapted response to all kinds of attacks. It parses logs from any source and applies heuristic scenarios to identify aggressive behavior and protect against most attack classes. It then shares that intelligence with other CrowdSec installations; every time an internet protocol (IP) address is blocked, it informs the entire user community. This creates a [real-time, collaborative IP reputation database][4] that leverages the crowd's power to make the internet safer.

### How CrowdSec works: a case study

Sorf Networks, a Turkey-based technology company that provides high-configuration managed servers and DDoS protection solutions for its clients, offers an example of how CrowdSec works. One of Sorf's customers was experiencing daily DDoS attacks from 10,000+ machine botnets and struggled to find a solution that would meet technical requirements to deal with them in a timely manner.

While the customer took general precautions to mitigate those attacks, such as introducing JavaScript (JS) challenges, rate-limiting, and so on, they weren't viable on the entire attack surface. Some URLs needed to be consumed by very basic software that didn't support JS challenges. Hackers being hackers, this was exactly what they targeted every single day: the weakest link in the chain.

Sorf Networks first set up a DDoS mitigation strategy for its customer using [Fail2ban][5] (which inspired CrowdSec); it helped to some degree, but it was too slow. It required 50 minutes to process logs and deal with 7,000- to 10,000-machine DDoS attacks—which rendered it ineffective in this situation. Also, logs continued to stack because it did not ban IPs, and it needed to process several thousand logs per second, which was not possible.

In DDoS testing using a rented botnet, an attack reached around 6,700 requests per second from 8,600 unique IPs. This is a capture of one server's traffic.

![Server traffic][6]

(©2020, CrowdSec)

Although CrowdSec technology can cope with huge attacks, its default setup can process only around 1,000 endpoints per second. Sorf needed a tailor-made configuration to deal with this much traffic on a single machine.

Sorf's team made changes in CrowdSec's configuration to significantly improve its throughput to absorb the log volume. First, it removed expensive and non-crucial enrichment parsers, such as [GeoIP enrichment][7]. It also increased the default number of allowed go-routines from one to five. Afterward, the team did another live test with 8,000 to 9,000 hosts, averaging between 6,000 and 7,000 requests per second. This solution came at a cost, as CrowdSec was eating 600% CPU during the operation, but its memory consumption stayed around 270MB.

The results, however, showed remarkable success:

  * In one minute, CrowdSec was able to ingest all the logs
  * 95% of the botnet was banned and the attack efficiently mitigated
  * 15 domains are now protected from DDoS attacks



According to Sorf Networks' director Cagdas Aydogdu, CrowdSec's platform enabled the team "to deliver a world-class and efficient defense system … in an incredibly short timeframe."

* * *

_This article has been adapted from [How to stop a 7k machine botnet in 1 minute with CrowdSec][8], originally published on CrowdSec's website._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/open-source-vs-ddos-attacks

作者：[Philippe Humeau][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
