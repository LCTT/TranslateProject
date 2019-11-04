[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why you don't have to be afraid of Kubernetes)
[#]: via: (https://opensource.com/article/19/10/kubernetes-complex-business-problem)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux)

Why you don't have to be afraid of Kubernetes
======
Kubernetes is absolutely the simplest, easiest way to meet the needs of
complex web applications.
![Digital creative of a browser on the internet][1]

It was fun to work at a large web property in the late 1990s and early 2000s. My experience takes me back to American Greetings Interactive, where on Valentine's Day, we had one of the top 10 sites on the internet (measured by web traffic). We delivered e-cards for [AmericanGreetings.com][2], [BlueMountain.com][3], and others, as well as providing e-cards for partners like MSN and AOL. Veterans of the organization fondly remember epic stories of doing great battle with other e-card sites like Hallmark. As an aside, I also ran large web properties for Holly Hobbie, Care Bears, and Strawberry Shortcake.

I remember like it was yesterday the first time we had a real problem. Normally, we had about 200Mbps of traffic coming in our front doors (routers, firewalls, and load balancers). But, suddenly, out of nowhere, the Multi Router Traffic Grapher (MRTG) graphs spiked to 2Gbps in a few minutes. I was running around, scrambling like crazy. I understood our entire technology stack, from the routers, switches, firewalls, and load balancers, to the Linux/Apache web servers, to our Python stack (a meta version of FastCGI), and the Network File System (NFS) servers. I knew where all of the config files were, I had access to all of the admin interfaces, and I was a seasoned, battle-hardened sysadmin with years of experience troubleshooting complex problems.

But, I couldn't figure out what was happening...

Five minutes feels like an eternity when you are frantically typing commands across a thousand Linux servers. I knew the site was going to go down any second because it's fairly easy to overwhelm a thousand-node cluster when it's divided up and compartmentalized into smaller clusters.

I quickly _ran_ over to my boss's desk and explained the situation. He barely looked up from his email, which frustrated me. He glanced up, smiled, and said, "Yeah, marketing probably ran an ad campaign. This happens sometimes." He told me to set a special flag in the application that would offload traffic to Akamai. I ran back to my desk, set the flag on a thousand web servers, and within minutes, the site was back to normal. Disaster averted.

I could share 50 more stories similar to this one, but the curious part of your mind is probably asking, "Where this is going?"

The point is, we had a business problem. Technical problems become business problems when they stop you from being able to do business. Stated another way, you can't handle customer transactions if your website isn't accessible.

So, what does all of this have to do with Kubernetes? Everything. The world has changed. Back in the late 1990s and early 2000s, only large web properties had large, web-scale problems. Now, with microservices and digital transformation, every business has a large, web-scale problem—likely multiple large, web-scale problems.

Your business needs to be able to manage a complex web-scale property with many different, often sophisticated services built by many different people. Your web properties need to handle traffic dynamically, and they need to be secure. These properties need to be API-driven at all layers, from the infrastructure to the application layer.

### Enter Kubernetes

Kubernetes isn't complex; your business problems are. When you want to run applications in production, there is a minimum level of complexity required to meet the performance (scaling, jitter, etc.) and security requirements. Things like high availability (HA), capacity requirements (N+1, N+2, N+100), and eventually consistent data technologies become a requirement. These are production requirements for every company that has digitally transformed, not just the large web properties like Google, Facebook, and Twitter.

In the old world, I lived at American Greetings, every time we onboarded a new service, it looked something like this. All of this was handled by the web operations team, and none of it was offloaded to other teams using ticket systems, etc. This was DevOps before there was DevOps:

  1. Configure DNS (often internal service layers and external public-facing)
  2. Configure load balancers (often internal services and public-facing)
  3. Configure shared access to files (large NFS servers, clustered file systems, etc.)
  4. Configure clustering software (databases, service layers, etc.)
  5. Configure webserver cluster (could be 10 or 50 servers)



Most of this was automated with configuration management, but configuration was still complex because every one of these systems and services had different configuration files with completely different formats. We investigated tools like [Augeas][4] to simplify this but determined that it was an anti-pattern to try and normalize a bunch of different configuration files with a translator.

Today with Kubernetes, onboarding a new service essentially looks like:

  1. Configure Kubernetes YAML/JSON.
  2. Submit it to the Kubernetes API (**kubectl create -f service.yaml**).



Kubernetes vastly simplifies onboarding and management of services. The service owner, be it a sysadmin, developer, or architect, can create a YAML/JSON file in the Kubernetes format. With Kubernetes, every system and every user speaks the same language. All users can commit these files in the same Git repository, enabling GitOps.

Moreover, deprecating and removing a service is possible. Historically, it was terrifying to remove DNS entries, load-balancer entries, web-server configurations, etc. because you would almost certainly break something. With Kubernetes, everything is namespaced, so an entire service can be removed with a single command. You can be much more confident that removing your service won't break the infrastructure environment, although you still need to make sure other applications don't use it (a downside with microservices and function-as-a-service [FaaS]).

### Building, managing, and using Kubernetes

Too many people focus on building and managing Kubernetes instead of using it (see [_Kubernetes is a_ _dump truck_][5]).

Building a simple Kubernetes environment on a single node isn't markedly more complex than installing a LAMP stack, yet we endlessly debate the build-versus-buy question. It's not Kubernetes that's hard; it's running applications at scale with high availability. Building a complex, highly available Kubernetes cluster is hard because building any cluster at this scale is hard. It takes planning and a lot of software. Building a simple dump truck isn't that complex, but building one that can carry [10 tons of dirt and handle pretty well at 200mph][6] is complex.

Managing Kubernetes can be complex because managing large, web-scale clusters can be complex. Sometimes it makes sense to manage this infrastructure; sometimes it doesn't. Since Kubernetes is a community-driven, open source project, it gives the industry the ability to manage it in many different ways. Vendors can sell hosted versions, while users can decide to manage it themselves if they need to. (But you should question whether you actually need to.)

Using Kubernetes is the easiest way to run a large-scale web property that has ever been invented. Kubernetes is democratizing the ability to run a set of large, complex web services—like Linux did with Web 1.0.

Since time and money is a zero-sum game, I recommend focusing on using Kubernetes. Spend your very limited time and money on [mastering Kubernetes primitives][7] or the best way to handle [liveness and readiness probes][8] (another example demonstrating that large, complex services are hard). Don't focus on building and managing Kubernetes. A lot of vendors can help you with that.

### Conclusion

I remember troubleshooting countless problems like the one I described at the beginning of this article—NFS in the Linux kernel at that time, our homegrown CFEngine, redirect problems that only surfaced on certain web servers, etc. There was no way a developer could help me troubleshoot any of these problems. In fact, there was no way a developer could even get into the system and help as a second set of eyes unless they had the skills of a senior sysadmin. There was no console with graphics or "observability"—observability was in my brain and the brains of the other sysadmins. Today, with Kubernetes, Prometheus, Grafana, and others, that's all changed.

The point is:

  1. The world is different. All web applications are now large, distributed systems. As complex as AmericanGreetings.com was back in the day, the scaling and HA requirements of that site are now expected for every website.
  2. Running large, distributed systems is hard. Period. This is the business requirement, not Kubernetes. Using a simpler orchestrator isn't the answer.



Kubernetes is absolutely the simplest, easiest way to meet the needs of complex web applications. This is the world we live in and where Kubernetes excels. You can debate whether you should build or manage Kubernetes yourself. There are plenty of vendors that can help you with building and managing it, but it's pretty difficult to deny that it's the easiest way to run complex web applications at scale.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/kubernetes-complex-business-problem

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: http://AmericanGreetings.com
[3]: http://BlueMountain.com
[4]: http://augeas.net/
[5]: https://opensource.com/article/19/6/kubernetes-dump-truck
[6]: http://crunchtools.com/kubernetes-10-ton-dump-truck-handles-pretty-well-200-mph/
[7]: https://opensource.com/article/19/6/kubernetes-basics
[8]: https://srcco.de/posts/kubernetes-liveness-probes-are-dangerous.html
