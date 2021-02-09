[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Enterprise JavaBeans, infrastructure predictions, and more industry trends)
[#]: via: (https://opensource.com/article/19/10/enterprise-javabeans-and-more-industry-trends)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

Enterprise JavaBeans, infrastructure predictions, and more industry trends
======
A weekly look at open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a senior product marketing manager at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are five of my and their favorite articles from that update.

## [Gartner: 10 infrastructure trends you need to know][2]

> Corporate network infrastructure is only going to get more involved  over the next two to three years as automation, network challenges, and hybrid cloud become more integral to the enterprise.

**The impact:** The theme running through all these predictions is the impact of increased complexity. As consumers of technology, we expect things to get easier and easier. As producers of technology, we know what's going on behind the curtains to make that simplicity possible is its opposite.

## [Jakarta EE: What's in store for Enterprise JavaBeans?][3]

> [Enterprise JavaBeans (EJB)][4] has been very important to the Java EE ecosystem and promoted many robust solutions to enterprise problems. Besides that, in the past when integration techniques were not so advanced, EJB did great work with remote EJB, integrating many Java EE applications. However, remote EJB is not necessary anymore, and we have many techniques and tools that are better for doing that. So, does EJB still have a place in this new cloud-native world?

**The impact:** This offers some insights into how programming languages and frameworks evolve and change over time. Respond to changes in developer affinity by identifying the good stuff in a language and getting it landed somewhere else. Ideally that "somewhere else" should be an open standard so that no single vendor gets to control your technology destiny.

## [From virtualization to containerization][5]

> Before the telecom industry has got to grips with "step one" virtualization, many industry leaders are already moving on to the next level—containerization. This is a key part of making network software cloud-native i.e. designed, developed, and optimized to exploit cloud technology such as distributed processing and data stores.

**The impact:** There are certain industries that make big technology decisions on long time horizons; I can only imagine the FOMO that the fast-moving world of infrastructure technology could cause when you've picked something and it starts to look a bit crufty next to the new hotness.

## [How do you rollback deployments in Kubernetes?][6]

> There are several strategies when it comes to deploying apps into production. In Kubernetes, rolling updates are the default strategy to update the running version of your app. The rolling update cycles previous Pod out and bring newer Pod in incrementally.

**The impact:** What is the cloud-native distributed equivalent to **ctrl+z**? And aren't you glad there is one?

## [What's a Trusted Compute Base?][7]

> A few months ago, in an article called [Turtles—and chains of trust][8], I briefly mentioned Trusted Compute Bases, or TCBs, but then didn’t go any deeper.  I had a bit of a search across the articles on this blog, and realised that I’ve never gone into this topic in much detail, which feels like a mistake, so I’m going to do it now.

**The impact:** The issue of to what extent you can trust the computer systems that power your whole life is only going to become more prevalent and more vexing. That turns out to be a great argument for open source from the bottom turtle (hardware) all the way up.

_I hope you enjoyed this list of what stood out to me from last week and come back next Monday for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/enterprise-javabeans-and-more-industry-trends

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://www.networkworld.com/article/3447397/gartner-10-infrastructure-trends-you-need-to-know.html
[3]: https://developers.redhat.com/blog/2019/10/22/jakarta-ee-whats-in-store-for-enterprise-javabeans/
[4]: https://docs.oracle.com/cd/E13222_01/wls/docs100/ejb/deploy.html
[5]: https://www.lightreading.com/nfv/from-virtualization-to-containerization/a/d-id/755016
[6]: https://learnk8s.io/kubernetes-rollbacks/
[7]: https://aliceevebob.com/2019/10/22/whats-a-trusted-compute-base/
[8]: https://aliceevebob.com/2019/07/02/turtles-and-chains-of-trust/
