70,000 Memcached Servers Can Be Hacked Using Eight-Month-Old Flaws
============================================================



![](https://cdn.thenewstack.io/media/2017/07/261d7153-business-841174_640.jpg)

Eight months after three critical vulnerabilities were fixed in the memcached open source caching software, there are over 70,000 caching servers directly exposed on the internet that have yet to be patched. Hackers could execute malicious code on them or steal potentially sensitive data from their caches, security researchers warn.

[Memcached][1] is a software package that implements a high performance caching server for storing chunks of data obtained from database and API calls in RAM. This helps speed up dynamic web applications, making it well suited for large websites and big-data projects.

While memcached is not a database replacement, the data it stores in RAM can include user sessions and other sensitive information from database queries. As such, the server was not designed to be directly exposed to untrusted environments like the internet, even though some of the more recent versions support basic authentication.

Back in October, the memcached developers fixed three remote code execution vulnerabilities ([CVE-2016-8704][2], [CVE-2016-8705][3] and [CVE-2016-8706][4]) that were found and reported by security researchers from [Cisco Systems’ Talos division][5]. All of these flaws affected memcached’s binary protocol for storing and retrieving data and one of them was in the [Simple Authentication and Security Layer ][6](SASL) implementation.

Throughout December and January several groups of attackers wiped data from tens of thousands of publicly exposed databases including MongoDB, CouchDB, Hadoop and Elasticsearch clusters. In many cases they asked server administrators for money to return the data, but there was no evidence they actually copied it.

The Talos researchers thought that memcached servers might be the next target, especially giving the flaws they had identified a few months earlier, so in February they decided to run a series of internet scans to determine the potential attack surface.

The scan results revealed that around 108,000 memcached servers were directly exposed to the internet and only 24,000 of them required authentication. The fact that so many servers were publicly accessible without authentication was bad enough, but when they also tested for the presence of the three vulnerabilities, they found that only 200 servers requiring authentication actually had the October patches deployed. All the rest were open to hacking through the SASL vulnerability.

Overall, 85,000 or around 80 percent of all memcached servers exposed to the internet lacked the security fixes for the three critical flaws announced in October.

Troubled by the poor patch adoption rate, the Talos researchers decided to run whois queries on the IP addresses of all of those servers and send notification emails to their owners.

Earlier this month the researchers decided to redo their scans. They found that there are still 106,000 memcached servers exposed to the internet, although 28,500 have different IP addresses than the ones found in February.

Of these 106,000 servers, 73,400 or around 70 percent continue to be vulnerable to the three exploits patched in October. Over 18,000 of the identified servers require authentication and 99 percent of those continue to have the SASL vulnerability.

Even after sending tens of thousands of notification emails, the patch adoption rate improved by only 10 percent in six months.

“The severity of these types of vulnerabilities cannot be understated,” the Talos researchers said Monday in a [blog post][7]. “These vulnerabilities potentially affect a platform that is deployed across the internet by small and large enterprises alike. With the recent spate of worm attacks leveraging vulnerabilities this should be a red flag for administrators around the world. If left unaddressed the vulnerabilities could be leveraged to impact organizations globally and impact business severely.”

The conclusions of this exercise suggest that many web application owners do a poor job of safeguarding their users’ data. First, a surprisingly large number of memcached servers are directly exposed to the internet and the majority of them do not use authentication. The data cached on these servers is at risk even without the presence of any vulnerabilities.

Second, even when critical vulnerabilities that could be used to completely compromise servers are patched, many server administrators don’t apply the security fixes in a timely manner, if ever.

Under these circumstances, seeing large scale attacks against memcached servers like those that targeted MongoDB databases would not be surprising.

--------------------------------------------------------------------------------

via: https://thenewstack.io/70000-memcached-servers-can-hacked-using-eight-month-old-flaws/

作者：[Lucian Constantin ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://thenewstack.io/author/lucian/
[1]:https://memcached.org/
[2]:https://www.talosintelligence.com/reports/TALOS-2016-0219/
[3]:https://www.talosintelligence.com/reports/TALOS-2016-0220/
[4]:https://www.talosintelligence.com/reports/TALOS-2016-0221/
[5]:https://www.talosintelligence.com/
[6]:https://tools.ietf.org/html/rfc4422
[7]:http://blog.talosintelligence.com/2017/07/memcached-patch-failure.html
[8]:https://thenewstack.io/author/lucian/
