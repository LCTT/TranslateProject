[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Y2038 problem in the Linux kernel, 25 years of Java, and other industry news)
[#]: via: (https://opensource.com/article/20/2/linux-java-and-other-industry-news)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

The Y2038 problem in the Linux kernel, 25 years of Java, and other industry news
======
A weekly look at open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a senior product marketing manager at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are five of my and their favorite articles from that update.

## [Need 32-bit Linux to run past 2038? When version 5.6 of the kernel pops, you're in for a treat][2]

> Arnd Bergmann, an engineer working on the thorny Y2038 problem in the Linux kernel, posted to the [mailing list][3] that, yup, Linux 5.6 "should be the first release that can serve as a base for a 32-bit system designed to run beyond year 2038."

**The impact:** Y2K didn't get fixed; it just got bigger and delayed. There is no magic in software or computers; just people trying to solve complicated problems as best they can, and some times introducing more complicated problems for different people to solve at some point in the future.

## [What the dev? Celebrating Java's 25th anniversary][4]

> Java is coming up on a big milestone: Its 25th anniversary! To celebrate, we take a look back over the last 25 years to see how Java has evolved over time. In this episode, Social Media and Online Editor Jenna Sargent talks to Rich Sharples, senior director of product management for middleware at Red Hat, to learn more.

**The impact:** There is something comforting about immersing yourself in a deep well of lived experience. Rich clearly lived through what he is talking about and shares insider knowlege with you (and his dog).

## [Do I need an API Gateway if I use a service mesh?][5]

> This post may not be able to break through the noise around API Gateways and Service Mesh. However, it’s 2020 and there is still abundant confusion around these topics. I have chosen to write this to help bring real concrete explanation to help clarify differences, overlap, and when to use which. Feel free to [@ me on twitter (@christianposta)][6] if you feel I’m adding to the confusion, disagree, or wish to buy me a beer (and these are not mutually exclusive reasons).

**The impact:** Yes, though they use similar terms and concepts they have different concerns and scopes.

## [What Australia's AGL Energy learned about Cloud Native compliance][7]

> This is really at the heart of what open source is, enabling everybody to contribute equally. Within large enterprises, there are controls that are needed, but if we can automate the management of the majority of these controls, we can enable an amazing culture and development experience.

**The impact:** They say "software is eating the world" and "developers are the new kingmakers." The fact that compliance in an energy utility is subject to developer experience improvement basically proves both statements.

## [Monoliths are the future][8]

> And then what they end up doing is creating 50 deployables, but it’s really a _distributed_ monolith. So it’s actually the same thing, but instead of function calls and class instantiation, they’re initiating things and throwing it over a network and hoping that it comes back. And since they can’t reliably _make it_ come back, they introduce things like [Prometheus][9], [OpenTracing][10], all of this stuff. I’m like, **“What are you doing?!”**

**The impact:** Do things for real reasons with a clear-eyed understanding of what those reasons are and how they'll make your business or your organization better.

_I hope you enjoyed this list of what stood out to me from last week and come back next Monday for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/linux-java-and-other-industry-news

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://www.theregister.co.uk/2020/01/30/linux_5_6_2038/
[3]: https://lkml.org/lkml/2020/1/29/355
[4]: https://whatthedev.buzzsprout.com/673192/2543290-celebrating-java-s-25th-anniversary-episode-16
[5]: https://blog.christianposta.com/microservices/do-i-need-an-api-gateway-if-i-have-a-service-mesh/ (Do I Need an API Gateway if I Use a Service Mesh?)
[6]: http://twitter.com/christianposta?lang=en
[7]: https://thenewstack.io/what-australias-agl-energy-learned-about-cloud-native-compliance/
[8]: https://changelog.com/posts/monoliths-are-the-future
[9]: https://prometheus.io/
[10]: https://opentracing.io
