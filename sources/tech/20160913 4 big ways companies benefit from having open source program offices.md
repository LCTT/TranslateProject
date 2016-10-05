translating by Chao-zhi

4 big ways companies benefit from having open source program offices
====

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BUSINESS_creativity.png?itok=x2HTRKVW)

In the first article in my series on open source program offices, I took a deep dive into [what an open source program office is and why your company might need one][1]. Next I looked at [how Google created a new kind of open source program office][2]. In this article, I'll explain a few benefits of having an open source program office.

At first glance, one big reason why a company not in the business of software development might more enthusiastically embrace an open source program office is because they have less to lose. After all, they're not gambling with software products that are directly tied to revenue. Facebook, for example, can easily unleash a distributed key-value datastore as an open source project because they don't sell a product called "enterprise key-value datastore." That answers the question of risk, but it still doesn't answer the question of what they gain from contributing to the open source ecosystem. Let's look at a few potential reasons and then tackle each. You'll notice a lot of overlap with vendor open source program offices, but some of the motivations are slightly different.

### Recruiting

Recruiting is perhaps the easiest way to sell an open source program office to upper management. Show them the costs associated with recruiting, as well as the return on investment, and then explain how developing relationships with talented engineers results in a pipeline of talented developers who are actually familiar with your technology and excited to help work on it. We don't really need to go in more depth here—it's self-explanatory, right?

### Technology influence

Once upon a time, companies that didn't specialize in selling software were powerless to influence development cycles of their software vendors directly, especially if they were not a large customer. Open source completely changed that dynamic and brought users onto a more level playing field with vendors. With the rise of open source development, anyone could push technology into a chosen direction, assuming they were willing to invest the time and resources. But these companies learned that simply investing in developer time, although fruitful, could be even more useful if tied to an overarching strategic effort&mdash. Think bug fixes vs. software architects—lots of companies push bug fixes to upstream open source projects, but some of these same companies began to learn that coordinating a sustained effort with a deeper commitment paid off with faster feature development, which could be good for business. With the open source program office model, companies have staffers who can sniff out strategically important open source communities in which they then invest developer resources.

With rapidly growing companies such as Google and Facebook, providing leadership in existing open source projects still proved insufficient for their expanding businesses. Facing the challenges of intense growth and building out hyperscale systems, many of the largest companies had built highly customized stacks of software for internal use only. What if they could convince others to collaborate on some of these infrastructure projects? Thus, while they maintained investments in areas such as the Linux kernel, Apache, and other existing projects, they also began to release their own large projects. Facebook released Cassandra, Twitter created Mesos, and eventually Google created the Kubernetes project. These projects have become major platforms for industry innovation, proving to be spectacular successes for the companies involved. (Note that Facebook stopped using Cassandra internally after it needed to create a new software project to solve the problem at a larger scale. However, by that time Cassandra had already become popular and DataStax had formed to take on development). Each of these projects have spawned entire ecosystems of developers, related projects, and end users that serve to accelerate growth and development.

This would not have been possible without coordination between an open source program office and strategic company initiatives. Without that effort, each of the companies mentioned would still be trying to solve these problems individually—and more slowly. Not only have these projects helped solve business problems internally, they also helped establish the companies that created them as industry heavyweights. Sure, Google has been an industry titan for a few years now, but the growth of Kubernetes ensures both better software, and a direct say in the future direction of container technologies, even more than it already had. These companies are still known for their hyperscale infrastructure and for simply being large Silicon Valley stalwarts. Lesser known, but possibly even more important, is their new relevance as technology producers. Open source program offices guide these efforts and maximize their impact, through technology recommendations and relationships with influential developers, not to mention deep expertise in community governance and people management.

### Marketing power

Going hand-in-hand with technology influence is how each company talks about its open source efforts. By honing the messages around these projects and communities, an open source program office is able to deliver maximum impact through targeted marketing campaigns. Marketing has long been a dirty word in open source circles, because everyone has had a bad experience with corporate marketing. In the case of open source communities, marketing takes on a vastly different form from a traditional approach and involves amplifying what is already happening in the communities of strategic importance. Thus, an open source program office probably won't create whiz-bang slides about a project that hasn't even released any code yet, but they'll talk about the software they've created and other initiatives they've participated in. Basically, no vaporware here.

Think of the first efforts made by Google's open source program office. They didn't simply contribute code to the Linux kernel and other projects—they talked about it a lot, often in keynotes at open source conferences. They didn't just give money to students who write open source code—they created a global program, the Google Summer of Code, that became a cultural touchstone of open source development. This marketing effort cemented Google's status as a major open source developer long before Kubernetes was even developed. As a result, Google wielded major influence during the creation of the GPLv3 license, and company speakers and open source program office representatives became staples at tech events. The open source program office is the entity best situated to coordinate these efforts and deliver real value for the parent company.

### Improve internal processes

Improving internal processes may not sound like a big benefit, but overcoming chaotic internal processes is a challenge for every open source program office, whether software vendor or company-driven. Whereas a software vendor must make sure that their processes don't step on products they release (for example, unintentionally open sourcing proprietary software), a user is more concerned with infringement of intellectual property (IP) law: patents, copyrights, and trademarks. No one wants to get sued simply for releasing software. Without an active open source program office to manage and coordinate licensing and other legal questions, large companies face great difficulty in arriving at a consensus around open source processes and governance. Why is this important? If different groups release software under incompatible licenses, not only will this prove to be an embarrassment, it also will provide a significant obstacle to achieving one of the most basic goals—improved collaboration.

Combined with the fact that many of these companies are still growing incredibly quickly, an inability to establish basic rules around process will prove unwieldy sooner than expected. I've seen large spreadsheets with a matrix of approved and unapproved licenses as well as guidelines for how to (and how not to) create open source communities while complying with legal restrictions. The key is to have something that developers can refer to when they need to make decisions, without incurring the legal overhead of a massive, work-slowing IP review every time a developer wants to contribute to an open source community.

Having an active open source program office that maintains rules over license compliance and source contribution, as well as establishing training programs for engineers, helps to avoid potential legal pitfalls and costly lawsuits. After all, what good is better collaboration on open source projects if the company loses real money because someone didn't read the license? The good news is that companies have less to worry about with respect to proprietary IP when compared to software vendors. The bad news is that their legal questions are no less complex, especially when they run directly into the legal headwinds of a software vendor.

How has your organization benefited from having an open source program office? Let me know about it in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/business/16/9/4-big-ways-companies-benefit-having-open-source-program-offices

作者：[John Mark Walker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/johnmark
[1]: https://opensource.com/business/16/5/whats-open-source-program-office
[2]: https://opensource.com/business/16/8/google-open-source-program-office
