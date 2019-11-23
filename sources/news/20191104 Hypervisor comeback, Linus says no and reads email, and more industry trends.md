[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Hypervisor comeback, Linus says no and reads email, and more industry trends)
[#]: via: (https://opensource.com/article/19/11/hypervisor-stable-kernel-and-more-industry-trends)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

Hypervisor comeback, Linus says no and reads email, and more industry trends
======
A weekly look at open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a senior product marketing manager at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are five of my and their favorite articles from that update.

## [Containers in 2019: They're calling it a [hypervisor] comeback][2]

> So what does all this mean as we continue with rapid adoption and hyper-ecosystem growth around Kubernetes and containers? Let’s try and break that down into a few key areas and see what all the excitement is about.

**The impact**: I'm pretty sure that the title of the article is an LL Cool J reference, which I wholeheartedly approve of. Even more important though is a robust unpacking of developments in the hypervisor space over the last year and how they square up against the trend towards cloud-native and container-based development.

## [Linux kernel is getting more reliable, says Linus Torvalds. Plus: What do you need to do to be him?][3]

> "In the end my job is to say no. Somebody has to be able to say no, because other developers know that if they do something bad I will say no. They hopefully in turn are more careful. But in order to be able to say no, I have to know the background, because otherwise I can't do my job. I spend all my time basically reading email about what people are working on.

**The impact**: The rehabilitation of Linus as a much chiller guy continues; this one has some good advice for people leading distributed teams.

## [Automated infrastructure in the on-premise datacenter—OpenShift 4.2 on OpenStack 15 (Stein)][4]

> Up until now IPI (Installer Provision Infrastructure) has only supported public clouds: AWS, Azure, and Google. Now with OpenShift 4.2 it is supporting OpenStack. For the first time we can bring IPI into the on-premise datacenter where it is IMHO most needed. This single feature has the potential to revolutionize on-premise environments and bring them into the cloud-age with a single click and that promise is truly something to get excited about!

**The impact**: So much tech press has started with the assumption that every company should run their infrastructure like a hyperscaler. The technology is catching up to make the user experience of that feasible.

## [Kubernetes autoscaling 101: Cluster autoscaler, horizontal autoscaler, and vertical pod autoscaler][5]

> I’m providing in this post a high-level overview of different scalability mechanisms inside Kubernetes and best ways to make them serve your needs. Remember, to truly master Kubernetes, you need to master different ways to manage the scale of cluster resources, that’s [the core of promise of Kubernetes][6].
>
> _Configuring Kubernetes clusters to balance resources and performance can be challenging, and requires expert knowledge of the inner workings of Kubernetes. Just because your app or services’ workload isn’t constant, it rather fluctuates throughout the day if not the hour. Think of it as a journey and ongoing process._

**The impact**: You can tell whether someone knows what they're talking about if they can represent it in a simple diagram. Thanks to the excellent diagrams in this post, I know more day 2 concerns of Kubernetes operators than I ever wanted to.

## [GitHub: All open source developers anywhere are welcome][7]

> Eighty percent of all open-source contributions today, come from outside of the US. The top two markets for open source development outside of the US are China and India. These markets, although we have millions of developers in them, are continuing to grow faster than any others at about 30% year-over-year average.

**The impact**: One of my open source friends likes to muse on the changing culture within the open source community. He posits that the old guard gatekeepers are already becoming irrelevant. I don't know if I completely agree, but I think you can look at the exponentially increasing contributions from places that haven't been on the open source map before and safely speculate that the open source culture of tomorrow will be radically different than that of today.

_I hope you enjoyed this list of what stood out to me from last week and come back next Monday for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/hypervisor-stable-kernel-and-more-industry-trends

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://www.infoq.com/articles/containers-hypervisors-2019/
[3]: https://www.theregister.co.uk/2019/10/30/linux_kernel_is_getting_more_reliable_says_linus_torvalds/
[4]: https://keithtenzer.com/2019/10/29/automated-infrastructure-in-the-on-premise-datacenter-openshift-4-2-on-openstack-15-stein/
[5]: https://www.cncf.io/blog/2019/10/29/kubernetes-autoscaling-101-cluster-autoscaler-horizontal-autoscaler-and-vertical-pod-autoscaler/
[6]: https://speakerdeck.com/thockin/everything-you-ever-wanted-to-know-about-resource-scheduling-dot-dot-dot-almost
[7]: https://www.zdnet.com/article/github-all-open-source-developers-anywhere-are-welcome/#ftag=RSSbaffb68
