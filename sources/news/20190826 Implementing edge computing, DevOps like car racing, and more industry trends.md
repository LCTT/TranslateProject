[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Implementing edge computing, DevOps like car racing, and more industry trends)
[#]: via: (https://opensource.com/article/19/8/implementing-edge-more-industry-trends)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

Implementing edge computing, DevOps like car racing, and more industry trends
======
A weekly look at open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a senior product marketing manager at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are five of my and their favorite articles from that update.

## [How to implement edge computing][2]

> "When you have hundreds or thousands of locations, it's a challenge to manage all of that compute as you continue to scale it out at the edge," said Coufal. "For organizations heavily involved with IoT, there are cases where these enterprises can find themselves with millions of different endpoints to manage. This is where you need to automate as much as you can operationally so there is less need for humans to manage the day-to-day activities."

**The impact:** We may think that there is a lot of stuff hooked up to the internet already, but edge connected Internet of Things (IoT) devices are already proving we ain't seen nothing yet. A heuristic that breaks the potential billions of endpoints into three categories (at least in a business context) helps us think about what this IoT might actually do for us, and who should be responsible for what.

## [Can a composable hypervisor re-imagine virtualization?][3]

> Van de Ven explained that in talking with customers he has seen five areas emerge as needing re-imagining in order to support evolving virtualization plans. These include a platform that is lightweight; one that is fast; something that can support high density workloads; that has quick start up; and one that is secure. However, the degrees of those needs remains in flux.
>
> Van de Ven explained that a [composable][4] hypervisor was one way to deal with these varying needs, pointing to Intel’s work with the [recently launched][5] rust-vmm hypervisor.
>
> That [open source project][6] provides a set of common hypervisor components developed by contributing vendors that can provide a more secure, higher performance container technology designed for [cloud native][7] environments.

**The impact**: The container boom has been perhaps unprecedented in both the rapidness of its onset and the breadth of its impact. You'd be forgiven for thinking that all the innovation has moved on from virtualization; not so! For one thing, most of those containers are running in virtual machines, and there are still places where virtual machines outshine containers (particularly where security is concerned). Thankfully there are projects pushing the state of hypervisors and virtualization forward.

## [How DevOps is like auto racing][8]

> To achieve their goals, race teams don’t think from start to finish; they flip the table to look at the race from the end goal to the beginning. They set a goal, a stretch goal, and then work backward from that goal to determine how to get there. Work is delegated to team members to push toward the objectives that will get the team to the desired outcome.

**The impact**: Sometimes the best way to understand the impact of an idea is to re-imagine the stakes. Here we recontextualize the moving and configuration of bits as the direction of explosive power and get a better understanding of why process, roles, and responsibilities are important contributors to success.

## [CNCF archives the rkt project][9]

> All open source projects are subject to a lifecycle and can become less active for a number of reasons. In rkt’s case, despite its initial popularity following its creation in December 2014, and contribution to CNCF in March 2017, end user adoption has severely declined. The CNCF is also [home][10] to other container runtime projects: [containerd][11] and [CRI-O][12], and while the rkt project played an important part in the early days of cloud native adoption, in recent times user adoption has trended away from rkt towards these other projects. Furthermore, [project activity][13] and the number of contributors has also steadily declined over time, along with unpatched CVEs.

**The impact**: Betamax and laser discs pushed cassettes and DVDs to be better, and so it is with rkt. The project showed there is more than one way to run containers at a time when it looked like there was only one way to run containers. rkt galvanized a push towards standard interfaces in the container space, and for that, we are eternally grateful.

_I hope you enjoyed this list of what stood out to me from last week and come back next Monday for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/implementing-edge-more-industry-trends

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://www.techrepublic.com/article/how-to-implement-edge-computing/
[3]: https://www.sdxcentral.com/articles/news/can-a-composable-hypervisor-re-imagine-virtualization/2019/08/
[4]: https://www.sdxcentral.com/data-center/composable/definitions/what-is-composable-infrastructure-definition/ (What is Composable Infrastructure? Definition)
[5]: https://www.sdxcentral.com/articles/news/intel-pushes-open-source-hypervisor-with-cloud-giants/2019/05/
[6]: https://github.com/rust-vmm
[7]: https://www.sdxcentral.com/cloud-native/ (Cloud Native)
[8]: https://developers.redhat.com/blog/2019/08/22/how-devops-is-like-auto-racing/
[9]: https://www.cncf.io/blog/2019/08/16/cncf-archives-the-rkt-project/
[10]: https://landscape.cncf.io/category=container-runtime&format=card-mode
[11]: https://containerd.io/
[12]: https://cri-o.io/
[13]: https://rkt.devstats.cncf.io
