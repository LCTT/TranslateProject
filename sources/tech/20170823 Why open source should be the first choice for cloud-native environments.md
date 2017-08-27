Why open source should be the first choice for cloud-native environments
============================================================

### For the same reasons Linux beat out proprietary software, open source should be the first choice for cloud-native environments.


![Why open source should be the first choice for cloud-native environments](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-globe.png?itok=_drXt4Tn "Why open source should be the first choice for cloud-native environments")
Image by : 

[Jason Baker][6]. [CC BY-SA 4.0][7]. Source: [Cloud][8], [Globe][9]. Both [CC0][10].

Let's take a trip back in time to the 1990s, when proprietary software reigned, but open source was starting to come into its own. What caused this switch, and more importantly, what can we learn from it today as we shift into cloud-native environments?

### An infrastructure history lesson

I'll begin with a highly opinionated, open source view of infrastructure's history over the past 30 years. In the 1990s, Linux was merely a blip on most organizations' radar, if they knew anything about it. You had early buy-in from companies that quickly saw the benefits of Linux, mostly as a cheap replacement for proprietary Unix, but the standard way of deploying a server was with a proprietary form of Unix or—increasingly—by using Microsoft Windows NT.

The proprietary nature of this tooling provided a fertile ecosystem for even more proprietary software. Software was boxed up to be sold in stores. Even open source got in on the packaging game; you could buy Linux on the shelf instead of tying up your internet connection downloading it from free sources. Going to the store or working with your software vendor was just how you got software.

### [ubuntu_box.png][1]

![Ubuntu box packaging on a Best Buy shelf](https://opensource.com/sites/default/files/u128651/ubuntu_box.png "Ubuntu box packaging on a Best Buy shelf")

Ubuntu box packaging on a Best Buy shelf

Where I think things changed was with the rise of the LAMP stack (Linux, Apache, MySQL, and PHP/Perl/Python).

Where I think things changed was with the rise of the LAMP stack (Linux, Apache, MySQL, and PHP/Perl/Python).The LAMP stack is a major success story. It was stable, scalable, and relatively user-friendly. At the same time, I started seeing dissatisfaction with proprietary solutions. Once customers had this taste of open source in the LAMP stack, they changed what they expected from software, including:

*   reluctance to be locked in by a vendor,

*   concern over security,

*   desire to fix bugs themselves, and

*   recognition that innovation is stifled when software is developed in isolation.

On the technical side, we also saw a massive change in how organizations use software. Suddenly, downtime for a website was unacceptable. There was a move to a greater reliance on scaling and automation. In the past decade especially, we've seen a move from the traditional "pet" model of infrastructure to a "cattle" model, where servers can be swapped out and replaced, rather than kept and named. Companies work with massive amounts of data, causing a greater focus on data retention and the speed of processing and returning that data to users.

Open source, with open communities and increasing investment from major companies, provided the foundation to satisfy this change in how we started using software. Systems administrators' job descriptions began requiring skill with Linux and familiarity with open source technologies and methodologies. Through the open sourcing of things like Chef cookbooks and Puppet modules, administrators could share the configuration of their tooling. No longer were we individually configuring and tuning MySQL in silos; we created a system for handling

Open source is ubiquitous today, and so is the tooling surrounding it.the basic parts so we could focus on the more interesting engineering work that brought specific value to our employers.

Open source is ubiquitous today, and so is the tooling surrounding it. Companies once hostile to the idea are not only embracing open source through interoperability programs and outreach, but also by releasing their own open source software projects and building communities around it.

### [microsoft_linux_stick.png][2]

![A "Microsoft Linux" USB stick](https://opensource.com/sites/default/files/u128651/microsoft_linux_stick.png "A "Microsoft Linux" USB stick")

A "Microsoft 
![heart](https://opensource.com/sites/all/libraries/ckeditor/plugins/smiley/images/heart.png "heart")
 Linux" USB stick

### Turning to the cloud

Today, we're living in a world of DevOps and clouds. We've reaped the rewards of the innovation that open source movements brought. There's a sharp rise in what Tim O'Reilly called "[inner-sourcing][11]," where open source software development practices are adopted inside of companies. We're sharing deployment configurations for cloud platforms. Tools like Terraform are even allowing us to write and share how we deploy to specific platforms.

Today, we're living in a world of DevOps and clouds.But what about these platforms themselves?

> "Most people just consume the cloud without thinking ... many users are sinking cost into infrastructure that is not theirs, and they are giving up data and information about themselves without thinking."
> —Edward Snowden, OpenStack Summit, May 9, 2017

It's time to put more thought into our knee-jerk reaction to move or expand to the cloud.

As Snowden highlighted, now we risk of losing control of the data that we maintain for our users and customers. Security aside, if we look back at our list of reasons for switching to open source, high among them were also concerns about vendor lock-in and the inability to drive innovation or even fix bugs.

Before you lock yourself and/or your company into a proprietary platform, consider the following questions:

*   Is the service I'm using adhering to open standards, or am I locked in?

*   What is my recourse if the service vendor goes out of business or is bought by a competitor?

*   Does the vendor have a history of communicating clearly and honestly with its customers about downtime, security, etc.?

*   Does the vendor respond to bugs and feature requests, even from smaller customers?

*   Will the vendor use our data in a way that I'm not comfortable with (or worse, isn't allowed by our own customer agreements)?

*   Does the vendor have a plan to handle long-term, escalating costs of growth, particularly if initial costs are low?

You may go through this questionnaire, discuss each of the points, and still decide to use a proprietary solution. That's fine; companies do it all the time. However, if you're like me and would rather find a more open solution while still benefiting from the cloud, you do have options.

### Beyond the proprietary cloud

As you look beyond proprietary cloud solutions, your first option to go open source is by investing in a cloud provider whose core runs on open source software. [OpenStack][12] is the industry leader, with more than 100 participating organizations and thousands of contributors in its seven-year history (including me for a time). The OpenStack project has proven that interfacing with multiple OpenStack-based clouds is not only possible, but relatively trivial. The APIs are similar between cloud companies, so you're not necessarily locked in to a specific OpenStack vendor. As an open source project, you can still influence the features, bug requests, and direction of the infrastructure.

The second option is to continue to use proprietary clouds at a basic level, but within an open source container orchestration system. Whether you select [DC/OS][13] (built on [Apache Mesos][14]), [Kubernetes][15], or [Docker in swarm mode][16], these platforms allow you to treat the virtual machines served up by proprietary cloud systems as independent Linux machines and install your platform on top of that. All you need is Linux—and don't get immediately locked into the cloud-specific tooling or platforms. Decisions can be made on a case-by-case basis about whether to use specific proprietary backends, but if you do, try to keep an eye toward the future should a move be required.

With either option, you also have the choice to depart from the cloud entirely. You can deploy your own OpenStack cloud or move your container platform in-house to your own data center.

### Making a moonshot

To conclude, I'd like to talk a bit about open source project infrastructures. Back in March, participants from various open source projects convened at the [Southern California Linux Expo][17] to talk about running open source infrastructures for their projects. (For more, read my [summary of this event][18].) I see the work these projects are doing as the final step in the open sourcing of infrastructure. Beyond the basic sharing that we're doing now, I believe companies and organizations can make far more of their infrastructures open source without giving up the "secret sauce" that distinguishes them from competitors.

The open source projects that have open sourced their infrastructures have proven the value of allowing multiple companies and organizations to submit educated bug reports, and even patches and features, to their infrastructure. Suddenly you can invite part-time contributors. Your customers can derive confidence by knowing what your infrastructure looks like "under the hood."

Want more evidence? Visit [Open Source Infrastructure][19]'s website to learn more about the projects making their infrastructures open source (and the extensive amount of infrastructure they've released).

 _Learn more in Elizabeth K. Joseph's talk, [The Open Sourcing of Infrastructure][4], at FOSSCON August 26th in Philadelphia._

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/8/open-sourcing-infrastructure

作者：[ Elizabeth K. Joseph][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pleia2
[1]:https://opensource.com/file/366596
[2]:https://opensource.com/file/366591
[3]:https://opensource.com/article/17/8/open-sourcing-infrastructure?rate=PdT-huv5y5HFZVMHOoRoo_qd95RG70y4DARqU5pzgkU
[4]:https://fosscon.us/node/12637
[5]:https://opensource.com/user/25923/feed
[6]:https://opensource.com/users/jason-baker
[7]:https://creativecommons.org/licenses/by-sa/4.0/
[8]:https://pixabay.com/en/clouds-sky-cloud-dark-clouds-1473311/
[9]:https://pixabay.com/en/globe-planet-earth-world-1015311/
[10]:https://creativecommons.org/publicdomain/zero/1.0/
[11]:https://opensource.com/life/16/11/create-internal-innersource-community
[12]:https://www.openstack.org/
[13]:https://dcos.io/
[14]:http://mesos.apache.org/
[15]:https://kubernetes.io/
[16]:https://docs.docker.com/engine/swarm/
[17]:https://www.socallinuxexpo.org/
[18]:https://opensource.com/article/17/3/growth-open-source-project-infrastructures
[19]:https://opensourceinfra.org/
[20]:https://opensource.com/users/pleia2
[21]:https://opensource.com/users/pleia2
