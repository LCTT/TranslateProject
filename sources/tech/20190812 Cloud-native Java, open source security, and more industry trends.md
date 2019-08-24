[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cloud-native Java, open source security, and more industry trends)
[#]: via: (https://opensource.com/article/19/8/cloud-native-java-and-more)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

Cloud-native Java, open source security, and more industry trends
======
A weekly look at open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a senior product marketing manager at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are five of my and their favorite articles from that update.

## [Why is modern web development so complicated?][2]

> Modern frontend web development is a polarizing experience: many love it, others despise it.
>
> I am a huge fan of modern web development, though I would describe it as "magical"—and magic has its upsides and downsides... Recently I’ve been needing to explain “modern web development workflows” to folks who only have a cursory of vanilla web development workflows and… It is a LOT to explain! Even a hasty explanation ends up being pretty long. So in the effort of writing more of my explanations down, here is the beginning of a long yet hasty explanation of the evolution of web development..

**The impact:** Specific enough to be useful to (especially new) frontend developers, but simple and well explained enough to help non-developers understand better some of the frontend developer problems. By the end, you'll (kinda) know the difference between Javascript and WebAPIs and how 2019 Javascript is different than 2006 Javascript.

## [Open sourcing the Kubernetes security audit][3]

> Last year, the Cloud Native Computing Foundation (CNCF) began the process of performing and open sourcing third-party security audits for its projects in order to improve the overall security of our ecosystem. The idea was to start with a handful of projects and gather feedback from the CNCF community as to whether or not this pilot program was useful. The first projects to undergo this process were [CoreDNS][4], [Envoy][5] and [Prometheus][6]. These first public audits identified security issues from general weaknesses to critical vulnerabilities. With these results, project maintainers for CoreDNS, Envoy and Prometheus have been able to address the identified vulnerabilities and add documentation to help users.
>
> The main takeaway from these initial audits is that a public security audit is a great way to test the quality of an open source project along with its vulnerability management process and more importantly, how resilient the open source project’s security practices are. With CNCF [graduated projects][7] especially, which are used widely in production by some of the largest companies in the world, it is imperative that they adhere to the highest levels of security best practices.

**The impact:** A lot of companies are placing big bets on Kubernetes being to the cloud what Linux is to that data center. Seeing 4 of those companies working together to make sure the project is doing what it should be from a security perspective inspires confidence. Sharing that research shows that open source is so much more than code in a repository; it is the capturing and sharing of expert opinions in a way that benefits the community at large rather than the interests of a few.

## [Quarkus—what's next for the lightweight Java framework?][8]

> What does “container first” mean? What are the strengths of Quarkus? What’s new in 0.20.0? What features can we look forward to in the future? When will version 1.0.0 be released? We have so many questions about Quarkus and Alex Soto was kind enough to answer them all. _With the release of Quarkus 0.20.0, we decided to get in touch with [JAX London speaker][9], Java Champion, and Director of Developer Experience at Red Hat – Alex Soto. He was kind enough to answer all our questions about the past, present, and future of Quarkus. It seems like we have a lot to look forward to with this exciting lightweight framework!_

**The impact**: Someone clever recently told me that Quarkus has the potential to make Java "possibly one of the best languages for containers and serverless environments". That made me do a double-take; while Java is one of the most popular programming languages ([if not the most popular][10]) it probably isn't the first one that jumps to mind when you hear the words "cloud native." Quarkus could extend and grow the value of the skills held by a huge chunk of the developer workforce by allowing them to apply their experience to new challenges.

## [Julia programming language: Users reveal what they love and hate the most about it][11]

> The most popular technical feature of Julia is speed and performance followed by ease of use, while the most popular non-technical feature is that users don't have to pay to use it. 
>
> Users also report their biggest gripes with the language. The top one is that packages for add-on features aren't sufficiently mature or well maintained to meet their needs. 

**The impact:** The Julia 1.0 release has been out for a year now, and has seen impressive growth in a bunch of relevant metrics (downloads, GitHub stars, etc). It is a language aimed squarely at some of our biggest current and future challenges ("scientific computing, machine learning, data mining, large-scale linear algebra, distributed and parallel computing") so finding out how it's users are feeling about it gives an indirect read on how well those challenges are being addressed.

## [Multi-cloud by the numbers: 11 interesting stats][12]

> If you boil our recent dive into [interesting stats about Kubernetes][13] down to its bottom line, it looks something like this: [Kubernetes'][14] popularity will continue for the foreseeable future.
>
> Spoiler alert: When you dig up recent numbers about [multi-cloud][15] usage, they tell a similar story: Adoption is soaring.
>
> This congruity makes sense. Perhaps not every organization will use Kubernetes to manage its multi-cloud and/or [hybrid cloud][16] infrastructure, but the two increasingly go hand-in-hand. Even when they don’t, they both reflect a general shift toward more distributed and heterogeneous IT environments, as well as [cloud-native development][17] and other overlapping trends.

**The impact**: Another explanation of increasing adoption of "multi-cloud strategies" is they retroactively legitimize decisions taken in separate parts of an organization without consultation as "strategic." "Wait, so you bought hours from who? And you bought hours from the other one? Why wasn't that in the meeting minutes? I guess we're a multi-cloud company now!" Of course I'm joking, I'm sure most big companies are a lot better coordinated than that, right?

_I hope you enjoyed this list of what stood out to me from last week and come back next Monday for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/cloud-native-java-and-more

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://www.vrk.dev/2019/07/11/why-is-modern-web-development-so-complicated-a-long-yet-hasty-explanation-part-1/
[3]: https://www.cncf.io/blog/2019/08/06/open-sourcing-the-kubernetes-security-audit/
[4]: https://coredns.io/2018/03/15/cure53-security-assessment/
[5]: https://github.com/envoyproxy/envoy/blob/master/docs/SECURITY_AUDIT.pdf
[6]: https://cure53.de/pentest-report_prometheus.pdf
[7]: https://www.cncf.io/projects/
[8]: https://jaxenter.com/quarkus-whats-next-for-the-lightweight-java-framework-160793.html
[9]: https://jaxlondon.com/cloud-kubernetes-serverless/java-particle-acceleration-using-quarkus/
[10]: https://opensource.com/article/19/8/possibly%20one%20of%20the%20best%20languages%20for%20containers%20and%20serverless%20environments.
[11]: https://www.zdnet.com/article/julia-programming-language-users-reveal-what-they-love-and-hate-the-most-about-it/#ftag=RSSbaffb68
[12]: https://enterprisersproject.com/article/2019/8/multi-cloud-statistics
[13]: https://enterprisersproject.com/article/2019/7/kubernetes-statistics-13-compelling
[14]: https://www.redhat.com/en/topics/containers/what-is-kubernetes?intcmp=701f2000000tjyaAAA
[15]: https://www.redhat.com/en/topics/cloud-computing/what-is-multicloud?intcmp=701f2000000tjyaAAA
[16]: https://enterprisersproject.com/hybrid-cloud
[17]: https://enterprisersproject.com/article/2018/10/how-explain-cloud-native-apps-plain-english
