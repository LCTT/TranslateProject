[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Don’t Sweat Over AWS Downtime)
[#]: via: (https://www.linux.com/articles/dont-sweat-over-aws-downtime/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

Don’t Sweat Over AWS Downtime
======

[![][1]][2]

[![][1]][2]

Last year on August 31st, [AWS’ Virginia-based datacenter (AWS US-EAST-1) went down due ][3]to a power failure. The back-up generators started failing within an hour or two, which ended up in bad news for many customers who were told by AWS that they have permanently lost their data.

This might be one of the extreme cases, but AWS downtime is not a rarity. According to Michael Bilancieri, SVP Products and Marketing of SIOS Technology, customers with just an average of three instances in EC2 experience downtime at least once a month. With a larger set of systems, that becomes a very significant amount of downtime on a yearly basis.

The reason for this downtime is the fact that many common system impairments and software issues are not covered by cloud vendor service level guarantees or addressed by cloud management tools.

DevOps engineers have to spend most of their precious time keeping their instances up-and-running, instead of investing their time on improving apps that add business value to their users. “The challenge for DevOps engineers is that they don’t know when something’s going to go down, so they have to monitor these systems constantly to see when something does happen and then take action,” said Bilancieri.

Without a strategic data recovery plan, businesses not only risk losing their critical data, they also lose valuable resources on things that don’t add any business value.

**AWS tools and services for high availability and data recovery**
AWS does have some services and tools that customers can use for data recovery and high availability, but they have their own limitations. Some tools, like [CloudWatch][4], do monitoring whereas other tools do corrective actions. Oftentimes, these require manual intervention, scripting, and maintenance. From a managed service standpoint, there are many vendors out there that provide application monitoring services and system monitoring services.

That’s where [SIOS AppKeeper][5] enters the picture. After a successful launch on AWS Japan, SIOS is now bringing its AppKeeper to AWS in the US.

AppKeeper ensures availability of applications and systems running in AWS EC2 environments. It continuously monitors specific services within the operating system and within the application and identify when there are issues. If something goes wrong, AppKeeper takes corrective action, depending on the configuration, to remedy the problem. “What we found is that about 85% of failure scenarios that customers experience are being addressed with AppKeeper,” said Bilancieri.

AppKeeper not only brings SIOS data recovery capabilities to AWS customers, it also allows them to leverage existing services and tools. Vendors can integrate AppKeeper with their own solutions to utilize and take advantage of the capabilities and bring that information into their own product so they can offer services to their end customers.

“They can embed AppKeeper and integrate it with their existing tools, existing dashboards and interfaces and it drives more automation for them to get better results and higher service level agreements to their customers,” said Bilancieri.

The value that AppKeeper brings to AWS is that it automates that entire process of discovery, installation at the point of configuration, monitoring, and corrective action. It takes the onus off of an administrator to set it up, maintain it, and continue to monitor and do any corrective action necessary as time goes on.
**
Making life easier for DevOps teams**
There’s so many things that DevOps teams have to look into and maintain: getting new systems in place, keeping things updated, monitoring for failures, and tracking alerts.

And when something fails, they experience a deluge of alerts coming in at them which they have to identify and investigate if they pose a downtime and whether they have already been remedied or needs to be addressed. AppKeeper takes a whole set of those service alerts from AWS out of their day-to-day monitoring job.

DevOps teams can still monitor all these activities through the AppKeeper console, but they don’t have to respond and react to them. They can configure AppKeeper to actually take action on their behalf. They can put more of their dedicated focus and time on other more critical things while AppKeeper maintains their application availability.

AppKeeper covers a wide range of services and applications. It doesn’t need to directly integrate with applications. It can actually look inside of the operating system of an instance (Windows or Linux running an EC2) and identify the services running there. It monitors both system and application services such as SAP, Sequel, Oracle, PeopleSoft, etc.

If these are running as system-level services, AppKeeper will identify them, monitor them, and ping them to check if they’re active and responsive. If they’re not, it can take action on that.

**Some of the capabilities of SIOS AppKeeper include:**
· Eliminates manual intervention by monitoring and proactively responding to service outages on AWS EC2 instances.
· Reduces downtime with automatic restarting of EC2 services or rebooting of instances when services become unavailable.
· Reduces costs and meets SLAs with automatic remediation of service outages.
· Fast and easy setup process. It takes only a few minutes and no software to install. Users simply connect to their AWS account and select which instances and services to monitor, and the level of protection they want.

**Availability and pricing**
AppKeeper is a cloud-based SaaS offering. It’s licensed at $40 per instance per month. Customers can test out a fully functioning version for free on some of their AWS instances.

--------------------------------------------------------------------------------

via: https://www.linux.com/articles/dont-sweat-over-aws-downtime/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2020/01/hands-2227857_1920-696x405.jpg (hands-2227857_1920)
[2]: https://www.linux.com/wp-content/uploads/2020/01/hands-2227857_1920.jpg
[3]: https://www.datacenterdynamics.com/news/amazon-web-services-us-east-1-goes-down/
[4]: https://aws.amazon.com/cloudwatch/
[5]: https://us.sios.com/press-releases/sios-unveils-industry-first-solution-for-automatic-remediation-of-application-failures-on-amazon-ec2-instances/
