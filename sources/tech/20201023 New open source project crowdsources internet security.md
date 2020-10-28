[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (New open source project crowdsources internet security)
[#]: via: (https://opensource.com/article/20/10/crowdsec)
[#]: author: (Philippe Humeau https://opensource.com/users/philippe-humeau)

New open source project crowdsources internet security
======
CrowdSec aims to leverage the power of the crowd to create a very
accurate IP reputation database
![Lots of people in a crowd.][1]

[CrowdSec][2] is a new security project designed to protect servers, services, containers, or virtual machines exposed on the internet with a server-side agent. It was inspired by [Fail2Ban][3] and aims to be a modernized, collaborative version of that intrusion-prevention framework.

CrowdSec is free and open source (under an MIT License), with the source code available on [GitHub][4]. It is currently is available for Linux, with ports to macOS and Windows on the roadmap.

### How CrowdSec works

CrowdSec is written in Golang and was designed to run on modern, complex architectures such as clouds, lambdas, and containers. To achieve this, it's "decoupled," meaning you can "detect here" (e.g., in your database logs) and "remedy there" (e.g., in your firewall or rproxy).

The tool uses [leaky buckets][5] internally to allow for tight event control. Scenarios are written in YAML to make them as simple and readable as possible without sacrificing granularity. The inference engine lets you get insights from chain buckets or meta-buckets, meaning if several buckets (e.g., web scan, port scan, and login attempt failed) overflow into a "meta-bucket," you can trigger a "targeted attack" remediation.

Aggressive Internet Protocols (IPs) are dealt with using bouncers. The [CrowdSec Hub][6] offers ready-to-use data connectors, bouncers (e.g., Nginx, PHP, Cloudflare, Netfilter), and scenarios to deter various attack classes. Bouncers can remedy threats in various ways.

It works on bouncers such as Captcha, limiting applicative rights, multi-factor authentication, throttling queries, or activating Cloudflare attack mode just when needed. You can get a sense of what's happening locally (and where it's occurring) with a lightweight visualization interface and strong [Prometheus][7] observability.

![CrowdSec's operation][8]

(CrowdSec, [CC BY-SA 4.0][9])

### Crowdsourcing security

While the software currently looks like a spruced up Fail2Ban, the goal is to leverage the power of the crowd to create a very accurate IP reputation database. When CrowdSec bounces a specific IP, the triggered scenario and the timestamp are sent to our API to be checked and integrated into the global consensus of bad IPs.

While we are already redistributing a blocklist to our community (you can see it by entering `cscli ban list --api` on the command line), we plan to really improve this part as soon as we have dealt with other prerequisite code lines. The network already has sightings of 100,000+ IPs (refreshed daily) and is able to redistribute ~10% (10,000) of those to our community members. The project has also been designed to be [GDPR][10] compliant and privacy respectful, both in technical and legal terms.

Our vision is that once the CrowdSec community is large enough, we will all generate, in real time, the most accurate IP reputation database available. This global reputation engine, coupled with local behavior assessment and remediation, should allow many businesses to achieve tighter security at a very low cost.

### Case studies

Here are two examples of what CrowdSec does.

> A company protecting its customers from DDoS attacks set up a DDoS mitigation strategy relying on Fail2Ban. When one of its customers was attacked by a 7,000-machine botnet, CrowdSec was able to ingest all the logs and successfully banned more than 95% of the botnet, efficiently mitigating the attack, in less than five minutes. For the sake of comparison, Fail2Ban would have needed to process several thousand logs per minute, which is quite challenging and would have taken nearly 50 minutes to deal with this attack.

> An e-commerce business was going through a massive credit card stuffing attack. The attacker was spamming the payment gateway, testing thousands of different credit card details using a sole IP address. Instead of having to amend all of its apps to try to detect the attack, by installing CrowdSec, the company could scan all the logs and block the intrusion within minutes.

### Business model

A common stress in open source projects is setting up a viable monetization model. So, in full transparency, we'll offer premium subscriptions to businesses that want to leverage the IP reputation database without contributing to it or sharing their banned IP data. This will allow anyone to query the IP reputation database upon receiving the first packet from an unknown IP before accepting it.

### Getting started and getting involved

CrowdSec's setup is quick and easy (taking just five minutes, tops). It's heavily assisted by a wizard to allow as many people and organizations as possible to use it. The project is production-grade and already runs in many places, including hosting companies, although it's still in beta.

Currently, our community members come from 28 countries across five different continents. We are looking for more users, contributors, and ambassadors to take the project to the next level.

![User map][11]

We would love to hear your feedback and engage in further discussions, so please don't hesitate to comment, reach out through our [website][2], [GitHub][4], or [Discourse][12], or give us a shout on [Gitter][13].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/crowdsec

作者：[Philippe Humeau][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/philippe-humeau
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_community_1.png?itok=rT7EdN2m (Lots of people in a crowd.)
[2]: https://crowdsec.net/
[3]: https://www.fail2ban.org/
[4]: https://github.com/CrowdSecurity/crowdsec
[5]: https://en.wikipedia.org/wiki/Leaky_bucket
[6]: https://hub.crowdsec.net/
[7]: https://opensource.com/article/19/11/introduction-monitoring-prometheus
[8]: https://opensource.com/sites/default/files/uploads/crowdsec_operation.jpg (CrowdSec's operation)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://en.wikipedia.org/wiki/General_Data_Protection_Regulation
[11]: https://opensource.com/sites/default/files/cs_user_map.png (User map)
[12]: https://discourse.crowdsec.net/
[13]: https://gitter.im/crowdsec-project/community
