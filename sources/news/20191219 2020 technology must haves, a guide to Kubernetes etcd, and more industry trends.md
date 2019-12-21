[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (2020 technology must haves, a guide to Kubernetes etcd, and more industry trends)
[#]: via: (https://opensource.com/article/19/12/gartner-ectd-and-more-industry-trends)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

2020 technology must haves, a guide to Kubernetes etcd, and more industry trends
======
A weekly look at open source community, market, and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a senior product marketing manager at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are five of my and their favorite articles from that update.

## [Gartner's top 10 infrastructure and operations trends for 2020][2]

> “The vast majority of organisations that do not adopt a shared self-service platform approach will find that their DevOps initiatives simply do not scale,” said Winser. "Adopting a shared platform approach enables product teams to draw from an I&amp;O digital toolbox of possibilities, while benefiting from high standards of governance and efficiency needed for scale."

**The impact**: The breakneck change of technology development and adoption will not slow down next year, as the things you've been reading about for the last two years become things you have to figure out to deal with every day.

## [A guide to Kubernetes etcd: All you need to know to set up etcd clusters][3]

> Etcd is a distributed reliable key-value store which is simple, fast and secure. It acts like a backend service discovery and database, runs on different servers in Kubernetes clusters at the same time to monitor changes in clusters and to store state/configuration data that should to be accessed by a Kubernetes master or clusters. Additionally, etcd allows Kubernetes master to support discovery service so that deployed application can declare their availability for inclusion in service.

**The impact**: This is actually way more than I needed to know about setting up etcd clusters, but now I have a mental model of what that could look like, and you can too.

## [How the open source model could fuel the future of digital marketing][4]

> In other words, the broad adoption of open source culture has the power to completely invert the traditional marketing funnel. In the future, prospective customers could be first introduced to “late funnel” materials and then buy into the broader narrative — a complete reversal of how traditional marketing approaches decision-makers today.

**The impact**: The SEO on this cuts two ways: It can introduce uninitiated marketing people to open source and uninitiated technical people to the ways that technology actually gets adopted. Neat!

## [Kubernetes integrates interoperability, storage, waits on sidecars][5]

> In a [recent interview][6], Lachlan Evenson, and was also a lead on the Kubernetes 1.16 release, said sidecar containers was one of the features that team was a “little disappointed” it could not include in their release.
>
> Guinevere Saenger, software engineer at GitHub and lead for the 1.17 release team, explained that sidecar containers gained increased focus “about a month ago,” and that its implementation “changes the pod spec, so this is a change that affects a lot of areas and needs to be handled with care.” She noted that it did move closer to completion and “will again be prioritized for 1.18.”

**The impact**: You can read between the lines to understand a lot more about the Kubernetes sausage-making process. It's got governance, tradeoffs, themes, and timeframes; all the stuff that is often invisible to consumers of a project.

_I hope you enjoyed this list of what stood out to me from last week and come back next Monday for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/gartner-ectd-and-more-industry-trends

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://www.information-age.com/gartner-top-10-infrastructure-and-operations-trends-2020-123486509/
[3]: https://superuser.openstack.org/articles/a-guide-to-kubernetes-etcd-all-you-need-to-know-to-set-up-etcd-clusters/
[4]: https://www.forbes.com/sites/forbescommunicationscouncil/2019/11/19/how-the-open-source-model-could-fuel-the-future-of-digital-marketing/#71b602fb20a5
[5]: https://www.sdxcentral.com/articles/news/kubernetes-integrates-interoperability-storage-waits-on-sidecars/2019/12/
[6]: https://kubernetes.io/blog/2019/12/06/when-youre-in-the-release-team-youre-family-the-kubernetes-1.16-release-interview/
