[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How open source eases the shift to a hybrid cloud strategy)
[#]: via: (https://opensource.com/article/19/12/open-source-hybrid-cloud)
[#]: author: (Bart Copeland https://opensource.com/users/bartcopeland)

How open source eases the shift to a hybrid cloud strategy
======
Open source software is key to adopting a multicloud or hybrid cloud
strategy.
![Person on top of a mountain, arm raise][1]

Cloud adoption continues to grow as organizations seek to move away from legacy and monolithic strategies. Cloud-specific spending is expected to grow at more than six times the rate of general IT spending through 2020, according to [McKinsey Research][2]. But cloud adoption raises fear of [vendor lock-in][3], which is preventing many companies from going all-in on public cloud. This has led to a rise in multi-cloud and hybrid cloud deployments, which also have their challenges.

Open source technology is the key to unlocking the value in a hybrid and multi-cloud strategy.

### What's the appeal of a hybrid cloud strategy?

The hybrid cloud market is growing rapidly because it offers the benefits of the cloud without some of the drawbacks. It typically costs less to move storage to the cloud than it does to maintain a private data center. At the same time, there are certain mission-critical applications and/or sensitive data that an organization may still want to keep on-premise, which is why hybrid cloud–a mix of private and public, on-prem and off-prem–is appealing.

This is why [58 percent of enterprises][4] have a hybrid cloud strategy, according to the Rightscale State of the Cloud 2019 report. It is also why IBM acquired Red Hat for the kingly sum of $34 billion. IBM CEO Ginni Rometty noted at the time that hybrid cloud is a $1 trillion market and that IBM’s goal is to be number one in that market.

### Common challenges of moving to a hybrid cloud strategy

One challenge is the lack of a strategic plan. According to [McKinsey Research][2], many companies fall into the trap of thinking that simply moving IT systems to the cloud is equivalent to a transformational digital strategy. The "lift and shift" approach is not enough to enjoy all the benefits of the cloud, though.

Cybersecurity applications provide a good case in point. The traditional perimeter approach to security won’t translate well to the cloud, whose approach must be quite different since a cloud perimeter is nearly impossible to define. If organizations are relying on legacy perimeter security to keep their holdings in the cloud safe, they are in for a nasty surprise.

Another challenge to effective cloud migration is the status quo. For many companies, it comes down to the mindset of "If it’s not broken, why fix it? If it works fine as it is, why move it?" While many organizations understand the need for and benefits of having newer applications in the cloud, it’s not always obvious whether it also makes sense to move legacy applications over, too. In the case of cybersecurity, it very well may not be, but other applications may be best served with a move to the cloud.

To further complicate matters, public cloud providers like Microsoft Azure, Google Cloud, and AWS [are not immune to outages][5]. Whatever the reason for downtime–a database glitch, bad weather, overzealous security features–being able to share workloads across clouds can be key in the event of an outage.

### Bringing it all together with open source

Hybrid cloud and open source go hand-in-hand. In fact, many of the public cloud providers rely heavily on different open source technologies and technology stacks to run them, so open source can be used easily across both private and public clouds in most situations. Companies like [Red Hat][6], in fact, were built on the concept of facilitating hybrid cloud. Many of its customers are moving toward an open hybrid cloud strategy.

This is, in part, because open source provides flexibility and helps avoid the issues of cloud vendor lock-in. In addition, open source technologies bring breadth and depth for managers and developers alike; they give developers the tools they enjoy using.

Though the cloud market is growing quickly, it is not without its limitations and drawbacks. The majority of enterprises have what they call a hybrid cloud strategy, but it may be less strategic than they think since the "lift and shift" approach falls short. Mindsets need to shift as well to overcome the status quo, and organizations need to guard against cloud outages.

Vital to a multi-cloud approach is managing distributed workloads. Modern software architecture methodologies break monolithic applications into microservices that can be run wherever it makes sense–on-premise, in the cloud, or across both. By leveraging open source technologies from Linux to containers to Kubernetes, organizations can deploy, run and manage workloads in a secure and optimized manner. This kind of open source approach allows organizations to derive benefits far beyond just "lift and shift" in order to become more efficient, run their processes more cost-effectively, and adopt a more flexible operating model.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/open-source-hybrid-cloud

作者：[Bart Copeland][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bartcopeland
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/developer_mountain_cloud_top_strong_win.jpg?itok=axK3EX-q (Person on top of a mountain, arm raise)
[2]: https://www.mckinsey.com/business-functions/mckinsey-digital/our-insights/cloud-adoption-to-accelerate-it-modernization
[3]: https://searchconvergedinfrastructure.techtarget.com/definition/vendor-lock-in
[4]: https://www.flexera.com/about-us/press-center/rightscale-2019-state-of-the-cloud-report-from-flexera-identifies-cloud-adoption-trends.html
[5]: https://www.crn.com/slide-shows/cloud/the-10-biggest-cloud-outages-of-2018
[6]: https://siliconangle.com/2019/04/12/red-hat-strategy-validated-as-open-hybrid-cloud-goes-mainstream-googlenext19/
