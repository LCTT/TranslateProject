[SteveArcher Translating]
Little Known Apache Mesos Project Helps Mesosphere Raise $10M From Andreessen Horowitz
================================================================================
![](http://thenewstack.io/wp-content/uploads/2014/04/clouds.jpg)

[Mesosphere][1], the company trying to build a business around the little-known open source [Apache Mesos][2] project, just racked up a $10 million investment from Andreessen Horowitz. Here’s why it attracted that kind of cash.

Mesos, software for automatic scaling, was in fact built around five years ago and is already in use on more than 50,000 cores at Twitter, according to Florian Leibert, CEO and co-founder of Mesosphere. EBay, AirBnB, Netflix and HubSpot are also fans.

While those big Web companies have discovered Mesos, the technology isn’t widely known among enterprises. But it could fill a need for companies which are trying to adopt some of the techniques available to them in public clouds on their internal data centers.

Mesos manages clusters of machines, automatically scaling apps as needed. It requires a small bit of software on each machine – the software uses zero processing power and “negligible” memory, according to Liebert — which coordinates with a master scheduler. The software on each machine reports information about the capacity of the virtual machine or bare metal server to the scheduler, which allocates jobs to available machines.

“If a task goes down and it doesn’t report back, the master knows to reschedule it and knows where it has resources,” said Matt Trifiro, senior vice president at Mesosphere.

Mesos can automatically scale a variety of jobs including Hadoop databases, nodes running Ruby on Rails, and Cassandra.

Using Mesos, Hubspot slashed its Amazon Web Services bill in half, said Liebert. That’s because Mesos efficiently assigns workloads to available machines.

However, Mesos might be most appealing to businesses that are trying to essentially create an AWS-like environment internally, said Jay Lyman, an analyst at 451 Research. AWS offers some [tools for automatic scaling][3]. But many businesses are still shy about running everything on public cloud infrastructure. At the same time, they don’t want to block their developers from taking advantage of the capabilities available in public clouds like AWS. They’d like to make those capabilities available on their private clouds.

“You’re seeing the interface of AWS-style strategy meets the old guard and command and control and stability,” he said.

Mesos can run in both a private cloud and AWS, offering businesses the opportunity to most efficiently use their internal cloud and fallover to AWS when they need to scale.

Mesos has some shortcomings in that regard, however. It [doesn’t run][4] any Windows or legacy apps like SAP, for instance.

However, “if a team is contemplating cloud, they’re probably pretty deep into Linux already,” said Lyman.

In the future, it’s possible Mesosphere could support Windows. Initially, technologies like Puppet and Chef only supported Linux too, Lyman noted. “It speaks to the early nature of Mesosphere. It’s pretty immature right now,” he said.

Mesosphere is targeting the many enterprises that are building more and more apps running on Linux and modern programming languages as well as the first generation Web 2.0 companies like Twitter and Netflix that didn’t have technology like Mesos when they first launched. “Those are the two most common early adopter profiles,” Trifiro said.

Before the end of the year, Mesosphere hopes to release commercial products with documentation, earning revenue from support and licensing. It has built a large-scale orchestration tool called Marathon and supports Docker integration. It’s currently offering packaged Mesos distributions for free in hopes of seeding the market.

Mesosphere is also currently working with a handful of early customers. It helped HubSpot get going with its use of Mesos.

Mesosphere isn’t alone in going after this use case. Rightscale, Scalr and Enstratius, now owned by Dell, all offer some version of scaling or cloud management technology. Mesosphere argues that Mesos, and the company’s own technologies, go above and beyond what’s on the market to create server clusters that essentially operate as one machine. The new investment from Andreessen could help it gain momentum.

--------------------------------------------------------------------------------

via: http://thenewstack.io/little-known-apache-mesos-project-helps-mesosphere-raise-10m-from-andreessen/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://mesosphere.io/
[2]:http://mesos.apache.org/
[3]:http://aws.amazon.com/autoscaling/
[4]:http://mesosphere.io/learn/