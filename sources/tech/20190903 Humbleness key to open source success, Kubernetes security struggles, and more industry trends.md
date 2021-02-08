[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Humbleness key to open source success, Kubernetes security struggles, and more industry trends)
[#]: via: (https://opensource.com/article/19/9/kubernetes-security-struggles-and-more)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

Humbleness key to open source success, Kubernetes security struggles, and more industry trends
======
A weekly look at open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a senior product marketing manager at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are five of my and their favorite articles from that update.

## [How will open source deal with success?][2]

> “The old school model is quarterly growth and never over-extend yourself,” Wright explained. “The newer model is very different. You look at it as a big upfront investment and then capture the most mindshare or market share that you possibly can and growth is more important than profitability. If you flip that from a business context to an open source community context, if the metrics are all about growth and not about sustainability then you are going to incentive the wrong kind of behavior and that’s the thing that worries me.”

**The impact:** The importance of this could easily be summarized as "be humble." A hot streak can easily change the thinking from "we can do anything together" to "nothing can stop this" and of course pride comes before the fall.

## [10 Quarkus videos to get you up to speed with supersonic, subatomic Java][3]

> Maybe you’ve heard about [Quarkus][4], also known as supersonic, subatomic Java. According to [Quarkus.io][5], it’s a [Kubernetes][6]-native Java stack tailored for GraalVM and OpenJDK HotSpot, crafted from the best of breed Java libraries and standards.
>
> To help you learn more, we’ve rounded up 10 talks showing Quarkus in action. These videos will take your Quarkus knowledge to the next level.

**The impact**: The promise of the second sentence is to help you understand what the first one means. Videos 4 (Taste of serverless application development) and 9 (Build Eclipse MicroProfile apps quickly with Quarkus) are probably the most practical.

## [exFAT in the Linux kernel? Yes!][7]

> It’s important to us that the Linux community can make use of exFAT included in the Linux kernel with confidence. To this end, we will be making Microsoft’s technical specification for exFAT publicly available to facilitate development of conformant, interoperable implementations. We also support the eventual inclusion of a Linux kernel with exFAT support in a future revision of the Open Invention Network’s Linux System Definition, where, once accepted, the code will benefit from the defensive patent commitments of OIN’s 3040+ members and licensees.

**The impact**: exFAT is a lowest common denominator filesystem (your microwave can probably read exFAT-formatted USB drives). At the very least, Apple no longer has to license the format. Open sourcing it could just be a good way to squeeze out the last little bit of juice.

## [Announcing the CNCF Kubernetes Project Journey Report][8]

> We wanted to create a series of reports that help explain our nurturing efforts and some of the positive trends and outcomes we see developing around our hosted projects. This report attempts to objectively assess the state of the Kubernetes project and how the CNCF has impacted the progress and growth of Kubernetes. We recognize that it’s impossible to sort out correlation and causation but this report attempts to document correlations. For the report, we pulled data from multiple sources, particularly CNCF’s own [DevStats tool][9], which provides detailed development statistics for all CNCF projects.

**The impact**: On the one hand the CNCF clearly has an interest in making donor organizations feel like their money is being well spent. On the other hand, the money is clearly being well spent: the year-on-year stats improvement is incredible.

## [The continuing rise of Kubernetes analysed: Security struggles and lifecycle learnings][10]

> In an early sign of Kubernetes going mainstream, in 2016 Niantic released the massively popular mobile game Pokémon Go, which was built on Kubernetes and deployed in Google Container Engine. At launch, the game experienced usability issues caused by a massive user interest in U.S—the number of users logging in ended up being 50x the original estimation, and 10x the prediction for worst case scenario. By using the inherent scalability advantages of Kubernetes, Pokémon Go went on to successfully launch in Japan two weeks later despite traffic tripling what was experienced during the U.S launch.

**The impact**: Two things stood out to me: 1) Kubernetes powers Pokemon (!?!) and 2) 2016 seems like so long ago. Sure, the stuff about containers and Kubernetes pushing organizations to adopt new security approaches and the bit about their biggest security concerns (misconfiguration) is interesting but... Pokemon!

_I hope you enjoyed this list of what stood out to me from last week and come back next Monday for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/kubernetes-security-struggles-and-more

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://www.sdxcentral.com/articles/opinion-editorial/how-will-open-source-deal-with-success/2019/08/
[3]: https://developers.redhat.com/blog/2019/08/26/10-quarkus-videos-to-get-you-up-to-speed-with-supersonic-subatomic-java/
[4]: https://developers.redhat.com/blog/2019/05/09/create-your-first-quarkus-project-with-eclipse-ide-red-hat-codeready-studio/
[5]: https://quarkus.io/
[6]: https://developers.redhat.com/topics/kubernetes/
[7]: https://cloudblogs.microsoft.com/opensource/2019/08/28/exfat-linux-kernel/
[8]: https://www.cncf.io/blog/2019/08/29/announcing-the-cncf-kubernetes-project-journey-report/
[9]: https://k8s.devstats.cncf.io/d/12/dashboards?orgId=1&refresh=15m
[10]: https://www.cloudcomputing-news.net/news/2019/aug/29/continuing-rise-kubernetes-analysed-security-struggles-and-lifecycle-learnings/
