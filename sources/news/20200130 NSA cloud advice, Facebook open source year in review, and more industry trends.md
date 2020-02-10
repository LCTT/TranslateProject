[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (NSA cloud advice, Facebook open source year in review, and more industry trends)
[#]: via: (https://opensource.com/article/20/1/nsa-facebook-more-industry-trends)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

NSA cloud advice, Facebook open source year in review, and more industry trends
======
A weekly look at open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a senior product marketing manager at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are five of my and their favorite articles from that update.

## [Facebook open source year in review][2]

> Last year was a busy one for our [open source][3] engineers. In 2019 we released 170 new open source projects, bringing our portfolio to a total of 579 [active repositories][3]. While it’s important for our internal engineers to contribute to these projects (and they certainly do — with more than 82,000 commits this year), we are also incredibly grateful for the massive support from external contributors. Approximately 2,500 external contributors committed more than 32,000 changes. In addition to these contributions, nearly 93,000 new people starred our projects this year, growing the most important component of any open source project — the community! Facebook Open Source would not be here without your contributions, so we want to thank you for your participation in 2019.

**The impact**: Facebook got ~33% more changes than they would have had they decided to develop these as closed projects. Organizations addressing similar challenges got an 82,000-commit boost in exchange. What a clear illustration of the business impact of open source development.

## [Cloud advice from the NSA][4]

> This document divides cloud vulnerabilities into four classes (misconfiguration, poor access control, shared tenancy vulnerabilities, and supply chain vulnerabilities) that encompass the vast majority of known vulnerabilities. Cloud customers have a critical role in mitigating misconfiguration and poor access control, but can also take actions to protect cloud resources from the exploitation of shared tenancy and supply chain vulnerabilities. Descriptions of each vulnerability class along with the most effective mitigations are provided to help organizations lock down their cloud resources. By taking a risk-based approach to cloud adoption, organizations can securely benefit from the cloud’s extensive capabilities.

**The impact**: The Fear, Uncertainty, and Doubt (FUD) that has been associated with cloud adoption is being debunked more all the time. None other then the US Department of Defense has done a lot of the thinking so you don't have to, and there is a good chance that their concerns are at least as dire as yours are.

## [With Kubernetes, China Minsheng Bank transformed its legacy applications][5]

> But all of CMBC’s legacy applications—for example, the core banking system, payment systems, and channel systems—were written in C and Java, using traditional architecture. “We wanted to do distributed applications because in the past we used VMs in our own data center, and that was quite expensive and with low resource utilization rate,” says Zhang. “Our biggest challenge is how to make our traditional legacy applications adaptable to the cloud native environment.” So far, around 20 applications are running in production on the Kubernetes platform, and 30 new applications are in active development to adopt the Kubernetes platform.

**The impact**: This illustrates nicely the challenges and opportunities facing businesses in a competitive environment, and suggests a common adoption pattern. Do new stuff the new way, and move the old stuff as it makes sense.

## [The '5 Rs' of the move to cloud native: Re-platform, re-host, re-factor, replace, retire][6]

> The bottom line is that telcos and service providers will go cloud native when it is cheaper for them to migrate to the cloud and pay cloud costs than it is to remain in the data centre. That time is now and by adhering to the "5 Rs" of the move to cloud native, Re-platform, Re-host, Re-factor, Replace and/or Retire, the path is open, clearly marked and the goal eminently achievable.

**The impact**: Cloud-native is basically used as a synonym for open source in this interview; there is no other type of technology that will deliver the same lift.

## [Fedora CoreOS out of preview][7]

> Fedora CoreOS is a new Fedora Edition built specifically for running containerized workloads securely and at scale. It’s the successor to both [Fedora Atomic Host][8] and [CoreOS Container Linux][9] and is part of our effort to explore new ways of assembling and updating an OS. Fedora CoreOS combines the provisioning tools and automatic update model of Container Linux with the packaging technology, OCI support, and SELinux security of Atomic Host.  For more on the Fedora CoreOS philosophy, goals, and design, see the [announcement of the preview release][10].

**The impact**: Collapsing these two branches of the Linux family tree into one another moves the state of the art forward for everyone (once you get through the migration).

_I hope you enjoyed this list of what stood out to me from last week and come back next Monday for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/nsa-facebook-more-industry-trends

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://opensource.com/article/20/1/hybrid-developer-future-industry-trends
[3]: https://opensource.facebook.com/
[4]: https://media.defense.gov/2020/Jan/22/2002237484/-1/-1/0/CSI-MITIGATING-CLOUD-VULNERABILITIES_20200121.PDF
[5]: https://www.cncf.io/blog/2020/01/23/with-kubernetes-china-minsheng-bank-transformed-its-legacy-applications-and-moved-into-ai-blockchain-and-big-data/
[6]: https://www.telecomtv.com/content/cloud-native/the-5-rs-of-the-move-to-cloud-native-re-platform-re-host-re-factor-replace-retire-37473/
[7]: https://fedoramagazine.org/fedora-coreos-out-of-preview/
[8]: https://www.projectatomic.io/
[9]: https://coreos.com/os/docs/latest/
[10]: https://fedoramagazine.org/introducing-fedora-coreos/
