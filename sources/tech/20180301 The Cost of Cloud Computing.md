The Cost of Cloud Computing
============================================================

### A day in the life of two development teams


![](https://cdn-images-1.medium.com/max/2000/1*nBZJgNXl54jzFKa91s1KfQ.png)

Over the last few months, I’ve talked with a number people who are concerned about the cost of public cloud services in comparison to the price of traditional on-premises infrastructure. To provide some insights from the discussion, let’s follow two development teams within an enterprise — and compare how they would approach building a similar service.

The first team will deploy their application using traditional on-premises infrastructure, while the second will leverage some of the public cloud services available on AWS.

The two teams are being asked to develop a new service for a global enterprise company that currently serves millions of consumers worldwide. This new service will need to meet theses basic requirements:

1.  The ability to scale to meet elastic demands

2.  Provide resiliency in response to a datacenter failure

3.  Ensure data is secure and protected

4.  Provide in-depth debugging for troubleshooting

5.  The project must be delivered quickly

6.  The service be cost-efficient to build and maintain

As far as new services go, this seems to be a fairly standard set of requirements — nothing that would intrinsically favor either traditional on-premises infrastructure over the public cloud.

![](https://cdn-images-1.medium.com/max/1600/1*DgnAPA6P5R0yQiV8n6siJw.png)

* * *

#### 1 —Scaling to meet customer demands

When it comes to scalability, this new service needs to scale to meet the variable demands of consumers. We can’t build a service that might drop requests and cost our company money and cause reputational risk.

The Traditional Team With on-premises infrastructure, the architectural approach dictates that compute capacity needs to be sized to match your peak data demands. For services that features a variable workload, this will leave you with a lot of excess and expensive compute capacity in times of low utilization.

This approach is wasteful — and the capital expense will eat into your profits. In addition, there is a heavy operational costs with maintaining your fleet of underutilized servers. This is a cost that is often overlooked — and I cannot emphasize enough how much money and time will be wasted supporting a rack of bare-metal servers for a single service.

The Cloud Team With a cloud-based autoscaling solution, your application scales up and down in-line with demand. This means that you’re only paying for the compute resources that you consume.

A well-architected cloud-based application enables the act of scaling up and down to be seamless — and automatic. The development team defines auto-scaling groups that spin up more instances of your application based on high-CPU utilization, or a large number of requests per second, and you can customize these rules to your heart’s content.

* * *

#### 2- Resiliency in response to failure

When it comes to resiliency, hosting a service on infrastructure that resides within the same four walls isn’t an option. If your application resides within a single datacenter — then you are stuffed when ( _not if_ ) something fails.

The Traditional Team To meet basic resiliency criteria for an on-premises solution, this team would a minimum of two servers for local resiliency — replicated in a second data center for geographic redundancy.

The development team will need to identify a load balancing solution that automatically redirects traffic between sites in the event of saturation or failure — and ensure that the mirror site is continually synchronized with the entire stack.

The Cloud Team Within each of their 50 regions worldwide, AWS provides multiple  _availability zones_ . Each zone consists of one of more fault-tolerant data centers — with automated failover capabilities that can seamlessly transition AWS services to other zones within the region.

Defining your _ infrastructure as code_  within a CloudFormation template ensures your infrastructure resources remain consistent across the zones during autoscaling events — and the AWS load balancer service requires minimal effort to setup and manage the traffic flow.


* * *

#### 3 — Secure and protect your data

Security is be a fundamental requirement of any system being developed within an organization. You really don’t want to be one of the unfortunate companies dealing with fallout from a security breach.

The Traditional Team The traditional team will incur the ongoing costs of ensuring that the bare-metal servers that’s running their services is secure. This means investing in a team that is trying to monitor, identify, and patch security threats across multiple vendor solutions from a variety of unique data sources.

The Cloud Team Leveraging the public cloud does not exempt yourself from security. The cloud team still has to remain vigilant, but doesn’t have to worry about patching the underlying infrastructure. AWS actively works combat against zero-day exploits — most recently with Spectre and Meltdown.

Leveraging the identify management and encryption security services from AWS allows the cloud team to focus on their application — and not the undifferentiated security management. The API calls to AWS services are fully audited using CloudTrail, which provides transparent monitoring.

* * *

#### 4 — Monitoring and logging

Every infrastructure and application service being deployed need to be closely monitored with aggregated realtime data. The teams should have access to dashboards that provide alerts when thresholds are exceeded, and offer the ability to leverage logs for event correlation for troubleshooting.

The Traditional Team For traditional infrastructure, you will have to set up monitoring and alerting solutions across disparate vendors and snowflake solutions. Setting this up takes a hell of a lot of time — and effort and getting it right is incredibly difficult.

For many applications deployed on-premises, you may find yourself searching through log files stored on your server’s file-system in order to make sense of why your application is crashing. A lot of time will be wasted as teams need to ssh into the server, navigate to the unique directory of log files, and then grep through potentially hundreds of files. Having done this for an application that was deployed across 60 servers — I can tell you that this isn’t a pretty solution.

The Cloud Team Native AWS services such as CloudWatch and CloudTrail make monitoring cloud applications an absolute breeze. Without much setup, the development team can monitor a wide variety of different metrics for each of the deployed services — making the process of debugging issues an absolute dream.

With traditional infrastructure, teams need build their own solution, and configure their REST API or service to push log files to an aggregator. Getting this ‘out-of-the-box’ is an insane improvement fo productivity.

* * *

#### 5 — Accelerate the development

The ability to accelerate time-to-market is increasingly important in today’s business environment. The lost opportunity costs for delayed implementations can have a major impact on bottom-line profits.

The Traditional Team For most organizations, it takes a long time to purchase, configure and deploy hardware needed for new projects — and procuring extra capacity in advance leads to massive waste due to poor forecasting.

Most likely, the traditional development team will spend months working across the myriad of silos and hand-offs to create the services. Each step of the project will require a distinct work request to database, system, security, and network administrators.

The Cloud Team When it comes to developing new features in a timely manner, having a massive suite of production-ready services at the disposal of your keyboard is a developer’s paradise. Each of the AWS services is typically well documented and can be accessed programmatically via your language of choice.

With new cloud architectures such a serverless, development teams can build and deploy a scalable solution with minimal friction. For example, in just a couple of days I recently built a [serverless clone of Imgur][4] that features image recognition, a production-ready monitoring/logging solution built-in, and is incredibly resilient.

![](https://cdn-images-1.medium.com/max/1600/1*jHmtrp1OKM4mZVn-gSNoQg.png)

If I had to engineer the resiliency and scalability myself, I can guarantee you that I would still be developing this project — and the final product would have been nowhere near as good as it currently is.

Using serverless architecture, I experimented and delivered the solution in a less time that it takes to provision hardware in most companies. I simply glued together a series of AWS services with Lambda functions — and ta-da! I focused on developing the solution, while the undifferentiated scalability and resiliency is handled for me by AWS.

* * *

#### The cost verdict on cloud computing

When it comes to scalability, the cloud team is the clear winner with demand-drive elasticity — thus only paying for compute power that they need. The team no longer needs dedicated resources devoted to maintaining and patching the underlying physical infrastructure.

The cloud also provides development teams a resilient architecture with multiple availability zones, security features built into each service, consistent tools for logging and monitoring, pay-as-you-go services, and low-cost experimentation for accelerated delivery.

More often than not, the absolute cost of cloud will amount to less than the cost of buying, supporting, maintaining, and designing the on-premises infrastructure needed for your application to run — with minimal fuss.

By leveraging cloud we can move faster and with the minimal upfront capital investment needed. Overall, the economics of the cloud will actively work in your favor when developing and deploying your business services.

There will always be a couple of niche examples where the cost of cloud is prohibitively more expensive than traditional infrastructure, and a few situations where you end up forgetting that you have left some incredibly expensive test boxes running over the weekend.

[Dropbox saved almost $75 million over two years by building its own tech infrastructure
After making the decision to roll its own infrastructure and reduce its dependence on Amazon Web Services, Dropbox…www.geekwire.com][5][][6]

However, these cases remain few and far between. Not to mention that Dropbox initially started out life on AWS — and it was only after they had reached a critical mass that they decided to migrate off the platform. Even now, they are overflowing into the cloud and retain 40% of their infrastructure on AWS and GCP.

The idea of comparing cloud services to traditional infrastructure-based of a single “cost” metric is incredibly naive — it blatantly disregards some of the major advantages the cloud offers development teams and your business.

In the rare cases when cloud services result in a greater absolute cost than your more traditional infrastructure offering — it still represents a better value in terms of developer productivity, speed, and innovation.

![](https://cdn-images-1.medium.com/max/1600/1*IlrOdfYiujggbsYynTzzEQ.png)

Customers don’t give a shit about your data centers

 _I’m very interested in hearing your own experiences and feedback related to the true cost of developing in cloud! Please drop a comment below, on Twitter at _  [_@_  _Elliot_F_][7]  _, or connect with me directly on _  [_LinkedIn_][8]  _._

--------------------------------------------------------------------------------

via: https://read.acloud.guru/the-true-cost-of-cloud-a-comparison-of-two-development-teams-edc77d3dc6dc

作者：[Elliot Forbes][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://read.acloud.guru/@elliot_f?source=post_header_lockup
[1]:https://info.acloud.guru/faas-and-furious?utm_campaign=FaaS%20and%20Furious
[2]:https://read.acloud.guru/building-an-imgur-clone-part-2-image-rekognition-and-a-dynamodb-backend-abc9af300123
[3]:https://read.acloud.guru/customers-dont-give-a-shit-about-your-devops-pipeline-51a2342cc0f5
[4]:https://read.acloud.guru/building-an-imgur-clone-part-2-image-rekognition-and-a-dynamodb-backend-abc9af300123
[5]:https://www.geekwire.com/2018/dropbox-saved-almost-75-million-two-years-building-tech-infrastructure/
[6]:https://www.geekwire.com/2018/dropbox-saved-almost-75-million-two-years-building-tech-infrastructure/
[7]:https://twitter.com/Elliot_F
[8]:https://www.linkedin.com/in/elliotforbes/
