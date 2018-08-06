What data is too risky for the cloud?
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_cloud21x_cc.png?itok=5UwC92dO)

In this four-part series, we've been looking at the pitfalls every organization should avoid when transitioning operations to the cloud—specifically into hybrid multi-cloud environments.

[In part one][1], we covered basic definitions and our views on hybrid cloud and multi-cloud, making sure to show the dividing lines between the two. In [part two][2], we discussed the first of three pitfalls: why cost is not always the obvious motivator for moving to the cloud. And, in [part three][3], we examined the viability of moving all workloads to the cloud.

Finally, in part four, we're looking at what to do with data in the cloud. Should you move data into the cloud? How much? What data works in the cloud and what creates too much risk to move?

### Data… data… data

The crucial factor influencing all your decisions about data in the cloud is determining your bandwidth and storage needs. Gartner projects that "data storage will be a [$173 billion][4] business in 2018" and a lot of that money is wasted on unneeded capacity: "companies globally could save $62 billion in IT costs just by optimizing their workloads." Stunningly, companies are "paying an average of 36% more for cloud services than they actually need to," according to Gartner's research.

If you've read the first three articles in this series, you shouldn't be surprised by this. What is surprising, however, is Gartner's conclusion that, "only 25% of companies would save money if they transferred their server data directly onto the cloud."

Wait a minute … workloads can be optimized for the cloud, but only a small percentage of companies would save money by moving data into the cloud? What does this mean?

If you consider cloud providers typically charge rates based on bandwidth, moving all of your on-premises data to the cloud soon becomes a cost burden. There are three scenarios where companies decide it's worth putting data in the cloud:

  * A single cloud with storage and applications
  * Applications in the cloud with storage on premises
  * Applications in the cloud and data cached in the cloud, with storage on premises



In the first scenario, bandwidth costs are reduced by keeping everything with a single cloud vendor. However, this creates lock-in, which often is contrary to a CIO's cloud strategy or risk prevention plan.

The second scenario keeps only the data that applications collect in the cloud and transports out the minimum to on-premises storage. This requires a carefully considered strategy where only applications that use minimal data are deployed in the cloud.

In the third scenario, data is cached in the cloud with applications and storage of that data, or the "one truth," stored on premises. This means analytics, artificial intelligence, and machine learning can be run on premises without having to upload data to cloud providers and then back again after processing. The cached data is based only on application needs and can even be cached across multi-cloud deployments.

For more insight, download a Red Hat [case study][5] that describes Amsterdam Airport Schiphol's data, cloud, and deployment strategies across a hybrid multi-cloud environment.

### Data dangers

Most companies recognize that their data is their proprietary advantage, their intellectual capacity, in their market. As such, they've thought very carefully about where it will be stored.

Imagine this scenario: You're a retailer, one of the top 10 worldwide. You've been planning your cloud strategy for some time now and have decided to use Amazon's cloud services. Suddenly, [Amazon buys Whole Foods][6] and is moving into your market.

Overnight, Amazon has grown to 50% of your retail size. Do you trust its cloud with your retail data? What do you do if your data is already in the Amazon cloud? Did you create your cloud plan with an exit strategy? While Amazon might never leverage your data's potential insights—the company even has protocols against this—can you trust anyone's word in today's world?

### Pitfalls shared, pitfalls avoided

Sharing just a few pitfalls we have seen in our experience should help your company plan a safer, more secure, and persistent cloud strategy. Understanding that [cost is not the obvious motivator][2], [not everything should be in the cloud][3], and you must manage your data effectively in the cloud are all keys to your success.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/data-risky-cloud

作者：[Eric D.Schabell][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/eschabell
[1]:https://opensource.com/article/18/4/pitfalls-hybrid-multi-cloud
[2]:https://opensource.com/article/18/6/reasons-move-to-cloud
[3]:https://opensource.com/article/18/7/why-you-cant-move-everything-cloud
[4]:http://www.businessinsider.com/companies-waste-62-billion-on-the-cloud-by-paying-for-storage-they-dont-need-according-to-a-report-2017-11
[5]:https://www.redhat.com/en/resources/amsterdam-airport-schiphol-case-study
[6]:https://www.forbes.com/sites/ciocentral/2017/06/23/amazon-buys-whole-foods-now-what-the-story-behind-the-story/#33e9cc6be898
