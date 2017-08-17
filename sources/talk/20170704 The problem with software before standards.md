Translating by softpaopao

The problem with software before standards
============================================================

### Open source projects need to get serious about including standards in their deliverables.

 
![The problem with software before standards](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/suitcase_container_bag.png?itok=eiZigBYU "The problem with software before standards")
Image by : 

opensource.com

By any measure, the rise of open source software as an alternative to the old, proprietary ways has been remarkable. Today, there are tens of millions of libraries hosted at GitHub alone, and the number of major projects is growing rapidly. As of this writing, the [Apache Software Foundation][4] hosts over [300 projects][5], while the [Linux Foundation][6] supports over 60. Meanwhile, the more narrowly focused [OpenStack Foundation][7] boasts 60,000 members living in more than 180 countries.

So, what could possibly be wrong with this picture?

What's missing is enough awareness that, while open source software can meet the great majority of user demands, standing alone it can't meet all of them. Worse yet, too many members of the open source community (business leads as well as developers) have no interest in making use of the most appropriate tools available to close the gap.

Let's start by identifying the problem that needs to be solved, and then see how that problem used to be solved in the past.

The problem is that there are often many projects trying to solve the same small piece of a larger problem. Customers want to be able to have a choice among competing products and to easily switch among products if they're not satisfied. That's not possible right now, and until this problem is solved, it will hold back open source adoption.

It's also not a new problem or a problem without traditional solutions. Over the course of a century and a half, user expectations of broad choice and freedom to switch vendors were satisfied through the development of standards. In the physical world, you can choose between myriad vendors of screws, light bulbs, tires, extension cords, and even of the proper shape wine glass for the pour of your choice, because standards provide the physical specifications for each of these goods. In the world of health and safety, our well-being relies on thousands of standards developed by the private sector that ensure proper results while maximizing competition.

When information and communications technology (ICT) came along, the same approach was taken with the formation of major organizations such as the International Telecommunication Union (ITU), International Electrotechnical Commission (IEC), and the Standards Association of the Institute of Electrical and Electronics Engineers (IEEE-SA). Close to 1,000 consortia followed to develop, promote, or test compliance with ICT standards.

While not all ICT standards resulted in seamless interoperability, the technology world we live in today exists courtesy of the tens of thousands of essential standards that fulfill that promise, as implemented in computers, mobile devices, Wi-Fi routers, and indeed everything else that runs on electricity.

The point here is that, over a very long time, a system evolved that could meet customers' desires to have broad product offerings, avoid vendor lock-in, and enjoy services on a global basis.

Now let's look at how open software is evolving.

The good news is that great software is being created. The bad news is that in many key areas, like cloud computing and network virtualization, no single foundation is developing the entire stack. Instead, discrete projects develop individual layers, or parts of layers, and then rely on real-time, goodwill-based collaboration up and down the stack among peer projects. When this process works well, the results are good but have the potential to create lock-in the same way that traditional, proprietary products could. When the process works badly, it can result in much wasted time and effort for vendors and community members, as well as disappointed customer expectations.

The clear way to provide a solution is to create standards that allow customers to avoid lock-in, along with encouraging the availability of multiple solutions competing through value-added features and services. But, with rare exceptions, that's not what's happening in the world of open source.

The main reason behind this is the prevailing opinion in the open source community is that standards are limiting, irrelevant, and unnecessary. Within a single, well-integrated stack, that may be the case. But for customers that want freedom of choice and ongoing, robust competition, the result could be a return to the bad old days of being locked into a technology, albeit with multiple vendors offering similarly integrated stacks.

A good description of the problem can be found in a June 14, 2017, article written by Yaron Haviv, "[We'll Be Enslaved to Proprietary Clouds Unless We Collaborate][8]":

> _Cross-project integration is not exactly prevalent in today's open source ecosystem, and it's a problem. Open source projects that enable large-scale collaboration and are built on a layered and modular architecture—such as Linux_ — _have proven their success time and again. But the Linux ideology stands in stark contrast to the general state of much of today's open source community._ 
> 
>  _Case in point: big data ecosystems, where numerous overlapping implementations rarely share components or use common APIs and layers. They also tend to lack standard wire protocols, and each processing framework (think Spark, Presto, and Flink) has its own data source API._ 
> 
>  _This lack of collaboration is causing angst. Without it, projects are not interchangeable, resulting in negative repercussions for customers by essentially locking them in and slowing down the evolution of projects because each one has to start from scratch and re-invent the wheel._

Haviv proposes two ways to resolve the situation:

*   Closer collaboration among projects, leading to consolidation, the elimination of overlaps between multiple projects, and tighter integration within a stack;

*   The development of APIs to make switching easier.

Both these approaches make sense. But unless something changes, we'll see only the first, and that's where the prospect for lock-in is found. The result would be where the industry found itself in the WinTel world of the past or throughout Apple's history, where competing product choice is sacrificed in exchange for tight integration.

The same thing can, and likely will, happen in the new open source world if open source projects continue to ignore the need for standards so that competition can exist within layers, and even between stacks. Where things stand today, there's almost no chance of that happening.

The reason is that while some projects pay lip service to develop software first and standards later, there is no real interest in following through with the standards. The main reason is that most business people and developers don't know much about standards. Unfortunately, that's all too understandable and likely to get worse. The reasons are several:

*   Universities dedicate almost no training time to standards;

*   Companies that used to have staffs of standards professionals have disbanded those departments and now deploy engineers with far less training to participate in standards organizations;

*   There is little career value in establishing expertise in representing an employer in standards work;

*   Engineers participating in standards activities may be required to further the strategic interests of their employer at the cost of what they believe to be the best technical solution;

*   There is little to no communication between open source developers and standards professionals within many companies;

*   Many software engineers view standards as being in direct conflict with the "four freedoms" underlying the FOSS definition.

Now let's look at what's going on in the world of open source:

*   It would be difficult for any software engineer today to not know about open source;

*   It's a tool engineers are comfortable with and often use on a daily basis;

*   Much of the sexiest, most cutting-edge work is being done in open source projects;

*   Developers with expertise in hot open source areas are much sought after and command substantial compensation premiums;

*   Developers enjoy unprecedented autonomy in developing software within well-respected projects;

*   Virtually all of the major ICT companies participate in multiple open source projects, often with a combined cost (dues plus dedicated employees) of over $1 million per year per company at the highest membership level.

When viewed in a vacuum, this comparison would seem to indicate that standards are headed for the ash heap of history in ICT. But the reality is more nuanced. It also ignores the reality that open source development can be a more delicate flower than many might assume. The reasons include the following:

*   Major supporters of projects can decommit (and sometimes have done so), leading to the failure of a project;

*   Personality and cultural conflicts within communities can lead to disruptions;

*   The ability of key projects to more tightly integrate remains to be seen;

*   Proprietary game playing has sometimes undercut, and in some cases caused the failure of, highly funded open source projects;

*   Over time, individual companies may decide that their open source strategies have failed to bring the rewards they anticipated;

*   A few well-publicized failures of key open source projects could lead vendors to back off from investing in new projects and persuade customers to be wary of committing to open source solutions.

Curiously enough, the collaborative entities that are addressing these issues most aggressively are standards organizations, in part because they feel (rightly) threatened by the rise of open source collaboration. Their responses include upgrading their intellectual property rights policies to allow all types of collaboration to occur under the same umbrella, including development of open source tools, inclusion of open source code in standards, and development of open source reference implementations of standards, among other types of work projects.

The result is that standards organizations are retooling themselves to provide an approach-neutral venue for the development of complete solutions. Those solutions can incorporate whatever type of collaborative work product, or hybrid work product, the marketplace may need. As this process continues, it is likely that vendors will begin to pursue some initiatives within standards organizations that might otherwise have made their way to open source foundations.

For all these reasons, it's crucial that open source projects get serious about including standards in their deliverables or otherwise partner with appropriate standards-developers to jointly provide complete solutions. The result will not only be greater product choice and less customer lock-in, but far greater confidence by customers in open source solutions, and therefore far greater demand for and use of open source products and services.

If that doesn't happen it will be a great shame, because the open source cause has the most to lose. It's up to the projects now to decide whether to give the market what it wants and needs or reconcile themselves to a future of decreasing influence, rather than continuing success.

 _This was originally published on ConsortiumInfo.org's [Standards Blog][2] and is republished with permission._

--------------------------------------------------------------------------------

作者简介：

Andy Updegrove - Andy helps CEOs, management teams, and their investors build successful organizations. Regionally, he’s been a pioneer in providing business-minded legal counsel and strategic advice to high-tech companies since 1979. On the global stage, he’s represented, and usually helped launch, more than 135 worldwide standard setting, open source, promotional and advocacy consortia, including some of the largest and most influential standard setting organizations in the world. 


via: https://opensource.com/article/17/7/software-standards

作者：[ Andy Updegrove][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/andrewupdegrove
[1]:https://opensource.com/article/17/7/software-standards?rate=kKK6oD-vGSEdDMj7OHpBMSqASMqbz3ii94q1Kj12lCI
[2]:http://www.consortiuminfo.org/standardsblog/article.php?story=20170616133415179
[3]:https://opensource.com/user/16796/feed
[4]:https://www.apache.org/
[5]:https://projects.apache.org/
[6]:https://www.linuxfoundation.org/
[7]:https://www.linuxfoundation.org/projects/directory
[8]:https://www.enterprisetech.com/2017/06/14/well-enslaved-proprietary-clouds-unless-collaborate/
[9]:https://opensource.com/users/andrewupdegrove
[10]:https://opensource.com/users/andrewupdegrove
[11]:https://opensource.com/article/17/7/software-standards#comments
