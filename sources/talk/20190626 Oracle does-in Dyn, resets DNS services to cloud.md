[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Oracle does-in Dyn, resets DNS services to cloud)
[#]: via: (https://www.networkworld.com/article/3405181/oracle-does-in-dyn-resets-dns-services-to-cloud.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Oracle does-in Dyn, resets DNS services to cloud
======
Oracle wants its DNS customers to migrate from its Dyn service to Oracle Cloud services, but some of those customers are very unhappy.
![Rob van der Meijden \(CC0\)][1]

Some may call it a normal, even boring course of vendor business operations but others find it a pain the rump or worse.

That about sums up the reaction to news this week that [Oracle will end its Dyn Domain Name System enterprise services by 2020][2] and try to get customers to move to DNS services provided through Oracle Cloud.

**More about DNS:**

  * [DNS in the cloud: Why and why not][3]
  * [DNS over HTTPS seeks to make internet use more private][4]
  * [How to protect your infrastructure from DNS cache poisoning][5]
  * [ICANN housecleaning revokes old DNS security key][6]



Oracle said that since its acquisition of [Dyn][7] in 2016 and the ensuing acquisition of Zenedge, its engineering teams have been working to integrate Dyn’s products and services into the Oracle Cloud Infrastructure platform. “Enterprises can now leverage the best-in-class [DNS][8], web application security, and email delivery services within Oracle Cloud Infrastructure and enhance their applications with a comprehensive platform to build, scale, and operate their cloud infrastructure," according to [Oracle's][2]
[FAQ][2] on the move. "As a result, Dyn legacy Enterprise services are targeted to be retired on May 31, 2020 with the exception of Internet Intelligence.”

But is the DNS in Oracle’s Cloud support really best in class? In the next breath the company states the Oracle Cloud Infrastructure DNS service will not support Dynamic DNS (Remote Access is not impacted) DNSSEC, Webhop (HTTP redirect), nor Zone transfer to external nameservers.

Not supporting DNSSEC for example seems a bit short-sighted.  In February the Internet Corporation for Assigned Names and Numbers [called for widespread community effort to install stronger DNS security technology][9]. 

Specifically ICANN called for full deployment of the Domain Name System Security Extensions ([DNSSEC][10]) across all unsecured domain names. [DNS][11], often called the internet’s phonebook, is part of the global internet infrastructure that translates between common language domain names and IP addresses that computers need to access websites or send emails.  DNSSEC adds a layer of security on top of DNS.

Full deployment of DNSSEC ensures end users are connecting to the actual web site or other service corresponding to a particular domain name, ICANN said.   “Although this will not solve all the security problems of the Internet, it does protect a critical piece of it – the directory lookup – complementing other technologies such as [SSL][12] (https:) that protect the "conversation” and provide a platform for yet-to-be-developed security improvements,” ICANN said.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][13] ]**

Reactions from Dyn customers on sites such as _[Reddit][14]_ and _Hacker News/ [YCombinator][15]_ were none too pleased about the change:

_This isn't surprising, but still upsetting._

_First as noted, no Dynamic DNS or DNSSEC?? REALLY?? Come on._

_Second as also noted, the migration is manually! You have to download a zone record and upload it, and that's after manually creating your account._

_I'll be switching to Cloudflare. Been considering it for a while, but now it makes sense_.

Another commenter wrote:

_No dynamic DNS? This is literally the name of the company they bought._

_And the migration is just a sign up for a new service after exporting my zone config? They really don't care about losing customers it would seem. Easy enough, my router supports domains.google.com for ddns and my domain registration is already there, it's time for DNS to follow it._

Yet another:

_As a lesson to anyone else hoping to do a shutdown with a migration to a different service with your company. If you are going to treat me the same as any new subscriber, where I have to re-signup, re-add my payment method, export my settings and then import them again, you're asking me to buy all over again. If you ask me to buy, then I get will reevaluate the relationship, and if it's just as easy to migrate to another supplier I will move. Migrating internally should have been "push this button to accept the new terms and pricing, you don't even need to talk with your registrar. “I’ve been a Dyn customer for over a decade, and now I'm moving because it's just as easy to move as it is to stay, and I do not want to have to type in "oracle.com" to manage my service._

The move could no doubt be a boon for other DNS providers such as Clouflare, Rackspace, Verisign and NS1.

“The DNS industry has experienced similar consolidation with Oracle’s acquisition of [Dyn][16] and [Neustar][17]’s acquisition of UltraDNS and Verisign’s DNS contracts. So often, the shiny, acquired tech is relegated to a loss leader, used as a wedge in the door to sell legacy products.  Or worse, the product is abandoned,” wrote NS1’s chief operation officer Brian Zeman in a [blog][18] about the Oracle change.

“Innovation in acquired technologies slows and may even disappear. Support experts are replaced by generalists. That increases tremendous risk for the installed base whose businesses depend on those services. Consolidation is especially problematic with DNS because it is the first stop for all application traffic, which makes it a key point of leverage in modern application development and delivery.” 

While morphing Dyn into Oracle’s cloud may be a business/technical decision, it also seems to mean a loss of a number of jobs. In Manchester, NH where Dyn is located, the _New Hampshire Union Leader_ has been detailing the layoffs and possible sale of the company’s office space.

According to the _[Union Leader][19]_: “Dozens of employees at Oracle + Dyn learned Tuesday they were being laid off in at least the third wave of job cuts since March. The company is eliminating its entire sales and marketing department, according to several workers.  As of a year ago, Oracle + Dyn employed about 400 workers in Manchester, but cut a reported 30 workers in March and another batch in mid-June before Tuesday’s round of layoffs.”

Oracle has [not acknowledged][20] the layoffs but [numerous reports][21] in the past few weeks say the company has been restructuring around the globe.

Join the Network World communities on [Facebook][22] and [LinkedIn][23] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3405181/oracle-does-in-dyn-resets-dns-services-to-cloud.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2017/10/grave_tombstone_rip_cemetery_1920_cc0_via_pixabay_by_rob_van_der_meijden-100740483-large.jpg
[2]: https://www.oracle.com/corporate/acquisitions/dyn/technologies/enterprise-customer-faq.html
[3]: https://www.networkworld.com/article/3273891/hybrid-cloud/dns-in-the-cloud-why-and-why-not.html
[4]: https://www.networkworld.com/article/3322023/internet/dns-over-https-seeks-to-make-internet-use-more-private.html
[5]: https://www.networkworld.com/article/3298160/internet/how-to-protect-your-infrastructure-from-dns-cache-poisoning.html
[6]: https://www.networkworld.com/article/3331606/security/icann-housecleaning-revokes-old-dns-security-key.html
[7]: https://dyn.com/blog/network-world-qa-who-is-dyn/
[8]: https://www.networkworld.com/article/3268449/what-is-dns-and-how-does-it-work.html
[9]: https://www.networkworld.com/article/3343185/icann-urges-adopting-dnssec-now.html
[10]: https://www.icann.org/resources/pages/dnssec-qaa-2014-01-29-en
[11]: https://www.networkworld.com/article/3268449/internet/what-is-dns-and-how-does-it-work.html
[12]: https://www.networkworld.com/article/2303073/lan-wan-what-is-transport-layer-security-protocol.html
[13]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[14]: https://www.reddit.com/r/sysadmin/comments/c5clp9/oracle_wants_dyn_managed_dns_customers_to_move_to/
[15]: https://news.ycombinator.com/item?id=20276070
[16]: https://ns1.com/blog/oracles-acquisition-of-dyn
[17]: https://ns1.com/blog/verisign-neustar-acquisition
[18]: https://ns1.com/blog/fight-dns-industry-consolidation-with-ns1-innovation-and-services
[19]: https://www.unionleader.com/news/business/oracle-dyn-axes-dozens-of-jobs-in-manchester-millyard/article_9970c8e2-09bd-5d27-8d19-40603b1cd9a1.html
[20]: https://spectrum.ieee.org/view-from-the-valley/at-work/tech-careers/oracle-swings-the-layoff-axe-and-clearcuts-teams-of-engineers
[21]: https://www.geekwire.com/2019/report-oracle-lays-off-hundreds-seattle-office-cloud-strategy-remains-grounded/
[22]: https://www.facebook.com/NetworkWorld/
[23]: https://www.linkedin.com/company/network-world
