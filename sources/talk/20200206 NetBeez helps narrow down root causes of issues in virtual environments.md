[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (NetBeez helps narrow down root causes of issues in virtual environments)
[#]: via: (https://www.networkworld.com/article/3519869/netbeez-helps-narrow-down-root-causes-of-issues-in-virtual-environments.html)
[#]: author: (Linda Musthaler https://www.networkworld.com/author/Linda-Musthaler/)

NetBeez helps narrow down root causes of issues in virtual environments
======
Troubleshooting issues in a sea of virtual hosts can be a challenge. One enterprise with a 99% virtual environment has found a tool that monitors the VMs and helps reduce troubleshooting time.
Thinkstock

Ryan Riffle is the network manager for an insurance firm with just under 2,000 employees. The company operates a primary data center, plus another for disaster recovery, to serve two major offices in the south-central US and smaller branches around the country. Three years ago, the company installed a software-defined network based on VMware NSX technology, and now more than 99% of the network operates in a virtual environment.

The flexibility of the software-defined network provides a lot of benefits. Riffle says the company was able to improve its security posture with micro-segmentation for business applications at the virtual layer. (The company does not allow use of its name for the appearance of endorsing any product or vendor.) What’s more, there is no longer a need to have physical third-party appliances that had to be managed differently from the virtual server environment. They were able to remove physical devices, including a hardware firewall, routers and load balancers.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

At the same time, the virtual nature of the network adds a lot of complexity and, in some cases, has become a hindrance to visibility into issues on the network. Identifying and verifying technical issues in such a large virtual environment can be daunting, and traditional network monitoring tools are of little help.

“Troubleshooting problems when something doesn’t work as expected can get pretty complicated for us,” says Riffle. “If we had a traditional network with physical routers, switches and firewalls, we could use traditional tools to do our monitoring and conduct our tests, but those tools don’t work in our virtual environment. We had to find a different way to figure out the root cause of issues.”

He cites occasions where segments of their virtual network would have random issues, such as drops due to some software bug or other issues where they just couldn’t resolve them with the tools they had. They couldn’t isolate it down to figure out exactly what the problem was, especially if the issue wasn’t consistent. “Sometimes proving a cause is difficult,” says Riffle. “We’d get a report that something lost communication, and we’d see an entry in the logs that might indicate it was a network issue, but we couldn’t really prove it.” This meant they couldn’t rule things out as the cause and they spent a lot of time trying to second-guess what was really happening.

Riffle recalls having issues with their Skype for Business environment. “We operate customer call centers, so Skype is a critical application for us,” he says. “We would see occasional drops and didn’t know if it was related to the network or the application or something else. It was a frustrating situation for us, and worse, it affected our customers, so we had to get it resolved quickly.”

Riffle saw a demonstration of [NetBeez][2] at a networking conference and thought it could help. NetBeez is a distributed network monitoring solution that observes the network from the end user perspective. Other monitoring tools can stop short of understanding what an end user is seeing or experiencing, especially in remote or branch locations. NetBeez fills this gap with the ability to proactively monitor wired, wireless and virtual networks. Riffle decided to put the NetBeez virtual agents to the test on the company’s network and it helped them resolve the Skype issue rather quickly.

[][3]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][3]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

“We put a NetBeez agent in a segment that is our external DMZ with a public IP address. We could easily just put the agent out there to be able to directly test from that network,” he said. “This helped us rule out the firewall and anything network related because we could see the network was functioning just fine when the occasional call drops were occurring. The problem had to be something else, and it turned out to be a Windows patch on the Skype server. NetBeez helped us get down to the problem a lot quicker versus setting up manual tests.”

### Virtual agents are versatile

The virtual agent is a good fit for the NSX environment. Riffle says they can put a virtual agent on a cluster in a segment where they’re seeing some issues. “During host firmware network interface upgrades, we occasionally experience issues that can impact the VMs that are running inside NSX. Quite often the software-defined networking problems are tied to a host. Maybe it has some routing issue because there’s a lot of redirection that’s involved. We can VMotion that agent from one host to another to see if the problem can be replicated,” according to Riffle. “Netbeez has given us the ability to isolate down to the host level and virtual-network level to be able to do real time network tests for both availability and performance.”

He says the virtual agents fit easily into the VMware environment. “The agent is an OVA file that we just drop in where we need it. There’s some minor setup but the process is pretty quick,” says Riffle.

The biggest benefit is that his company now has faster time to resolution for issues that pop up in the virtual environment, often before users are aware of them. “NetBeez sends an alert when a problem is detected in the environment, so we can proactively address it before it becomes a large business impact. For example, we might have a host issue and we’re able to migrate the VMs off it before business applications are adversely impacted,” says Riffle.

NetBeez has become an important tool in the toolbox for this company’s complex virtual network. According to Riffle, “NetBeez helps us identify underlying issues and, importantly, we can rule out things that could be contributing to a problem. That helps us narrow down our focus when we’re troubleshooting and saves us a lot of time.”

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3519869/netbeez-helps-narrow-down-root-causes-of-issues-in-virtual-environments.html

作者：[Linda Musthaler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Linda-Musthaler/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://netbeez.net/
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
