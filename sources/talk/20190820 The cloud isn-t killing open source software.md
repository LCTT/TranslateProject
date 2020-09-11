[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The cloud isn't killing open source software)
[#]: via: (https://opensource.com/article/19/8/open-source-licensing)
[#]: author: (Peter Zaitsev https://opensource.com/users/peter-zaitsev)

The cloud isn't killing open source software
======
How the cloud motivates open source businesses to evolve quickly.
![Globe up in the clouds][1]

Over the last few months, I participated in two keynote panels where people asked questions about open source licensing:

  * Do we need to redefine what open source means in the age of the cloud?
  * Are cloud vendors abusing open source?
  * Will open source, as we know it, survive?



Last year was the most eventful in my memory for the usually very conservative open source licensing space:

  * [Elastic][2] and [Confluent][3] introduced their own licenses for a portion of their stack.
  * [Redis Labs][4] changed its license for some extensions by adding "Commons Clause," then changed the entire license a few months later.
  * [MongoDB][5] famously proposed a new license called Server-Side Public License (SSPL) to the Open Source Initiative (OSI) for approval, only to [retract][6] the proposal before the OSI had an opportunity to reach a decision. Many in the open source community regarded SSPL as failing to meet the standards of open source licenses. As a result, MongoDB is under a license that can be described as "[source-available][7]" but not open source, given that it has not been approved by the OSI.



### Competition in the cloud

The most common reason given for software vendors making these changes is "foul play" by cloud vendors. The argument is that cloud vendors unfairly offer open source software "as a service," capturing large portions of the revenue, while the original software vendor continues to carry most of the development costs. Market rumors claim Amazon Web Services (AWS) makes more revenue from MySQL than Oracle, which owns the product.

So, who is claiming foul play is destroying the open source ecosystem? Typically, the loudest voices are venture-funded open source software companies. These companies require a very high growth rate to justify their hefty valuation, so it makes sense that they would prefer not to worry about additional competition.

But I reject this argument. If you have an open source license for your software, you need to accept the benefits and drawbacks that go along with it. Besides, you are likely to have a much faster and larger adoption rate partly because other businesses, large and small, can make money from your software. You need to accept and even expect competition from these businesses.

In simple terms, there will be a larger cake, but you will only get a slice of it. If you want a bigger slice of that cake, you can choose a proprietary license for all or some of your software (the latter is often called "open core"). Or, you can choose more or less permissive open source licensing. Choosing the right mix and adapting it as time goes by is critical for the success of businesses that produce open source software.

### Open source communities

But what about software users and the open source communities that surround these projects? These groups generally love to see their software available from cloud vendors, for example, database-as-a-service (DBaaS), as it makes the software much easier to access and gives users more choices than ever. This can have a very positive impact on the community. For example, the adoption of PostgreSQL, which was not easy to use, was dramatically boosted by its availability on Heroku and then as DBaaS on major cloud vendors.

Another criticism leveled at cloud vendors is that they do not support open source communities. This is partly due to their reluctance to share software code. They do, however, contribute significantly to the community by pushing the boundaries of usability, and more and more, we see examples of cloud vendors contributing code. AWS, which gets most of the criticism, has multiple [open source projects][8] and contributes to other projects. Amazon [contributed Encryption in Transit to Redis][9] and recently released [Open Distro for Elasticsearch][10], which provides open source equivalents for many features not available in the open source version of the Elastic platform.

### Open source now and in the future

So, while open source companies impacted by cloud vendors continue to argue that such competition can kill their business—and consequently kill open source projects—this argument is misguided. Competition is not new. Weaker companies that fail to adjust to these new business realities may fail. Other companies will thrive or be acquired by stronger players. This process generally leads to better products and more choice.

This is especially true for open source software, which, unlike proprietary software, cannot be wiped out by a company's failure. Once released, open source code is _always_ open (you can only change the license for new releases), so everyone can exercise the right to fork and continue development if there is demand.

So, I believe open source software is working exactly as intended.

Some businesses attempt to balance open and proprietary software licenses and are now changing to restrictive licenses. Time will tell whether this will protect them or result in their users seeking a more open alternative.

But, what about "source-available" licenses? This is a new category and another option for software vendors and users. However, it can be confusing. The source-available category is not well defined. Some people even refer to this software as open source, as you can browse the source code on GitHub. When source-available code is mixed in with truly open source components in the same product, it can be problematic. If issues arise, they could damage the reputation of the open source software and even expose the user to potential litigation. I hope that standardized source-available licenses will be developed and adopted by software vendors, as was the case with open source licenses.

At [Percona][11], we find ourselves in a unique position. We have spent years using the freedom of open source to develop better versions of existing software, with enhanced features, at no cost to our users. Percona Server for MySQL is as open as MySQL Community Edition but has many of the enhanced features available in MySQL Enterprise as well as additional benefits. This also applies to Percona Server for MongoDB. So, we compete with MongoDB and Oracle, while also being thankful for the amazing engineering work they are doing.

We also compete with DBaaS on other cloud vendors. DBaaS is a great choice for smaller companies that aren't worried about vendor lock-in. It offers superb value without huge costs and is a great choice for some customers. This rivalry is sometimes unpleasant, but it is ultimately fair, and the competition pushes us to be a better company.

In summary, there is no need to panic! The cloud is not going to kill open source software, but it should motivate open source software businesses to adjust and evolve their operations. It is clear that agility will be key, and businesses that can take advantage of new developments and adapt to changing market conditions will be more successful. The final result is likely to be more open software and also more non-open source software, all operating under a variety of licenses.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/open-source-licensing

作者：[Peter Zaitsev][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/peter-zaitsev
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-globe.png?itok=_drXt4Tn (Globe up in the clouds)
[2]: https://www.elastic.co/guide/en/elastic-stack-overview/current/license-management.html
[3]: https://www.confluent.io/blog/license-changes-confluent-platform
[4]: https://redislabs.com/blog/redis-labs-modules-license-changes/
[5]: https://www.mongodb.com/licensing/server-side-public-license
[6]: http://lists.opensource.org/pipermail/license-review_lists.opensource.org/2019-March/003989.html
[7]: https://en.wikipedia.org/wiki/Source-available_software
[8]: https://aws.amazon.com/opensource/
[9]: https://aws.amazon.com/blogs/opensource/open-sourcing-encryption-in-transit-redis/
[10]: https://aws.amazon.com/blogs/opensource/keeping-open-source-open-open-distro-for-elasticsearch/
[11]: https://www.percona.com/
