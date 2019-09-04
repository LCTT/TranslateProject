[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A guide to human communication for sysadmins)
[#]: via: (https://opensource.com/article/19/9/communication-sysadmins)
[#]: author: (Maxim Burgerhout https://opensource.com/users/wzzrdhttps://opensource.com/users/rikki-endsley)

A guide to human communication for sysadmins
======
The best way to increase your value to an organization is to get to know
the people around you.
![People work on a computer server with devices][1]

Not too long ago, I spoke at a tech event in the Netherlands to an audience mostly made up of sysadmins. One of my topics was how sysadmins can increase the value they deliver to the organization they work for. I believe that among the most important factors for delivering value is for everyone to know the overall organization's priorities and goals, as well as the priorities and goals of the organization's development teams.

This all sounds obvious, but in many organizations, silos almost completely block the inter-team communication needed to understand each other's priorities. Even in large organizations that pat themselves on the back for having gone full DevOps (or aspire to go full DevOps), knowledge of the priorities and goals of other teams is not ubiquitous. When I asked the couple hundred people in my audience whether they knew their development teams and what drives those teams, very few hands came up.

You could argue that if you claim to have gone full DevOps, yet your people don't know the goals and priorities of the teams they work directly with, you are doing it wrong. And you would probably have a point. But put that aside for a moment. Even in a traditional organization—one that is only beginning its DevOps journey, has implemented some parts of the DevOps philosophy, or implemented DevOps only in certain parts of the organization (I have seen them all)—I would heartily recommend getting to know your co-workers. I would _especially_ recommend getting to know the ones outside your team that work with (or on) the platform that you build and maintain.

Sit down for an hour or so with one of the people that develop applications on your platform or with someone who maintains commercial, off-the-shelf software on it. Have them explain to you how your platform and your services make their lives easier and how they make their lives harder. What could you and your team do to improve that situation?

Talking to each other, learning from each other, debating problems _and_ solutions—especially with people whose immediate goals might initially differ from your own—helps everyone move forward together and build something that benefits an entire community.

We see this happening in open source communities around the world all the time. Broad communities that are built from different companies and different people with (potentially) different or even conflicting goals, work. Successful open source communities are usually diverse, and members communicate to meet a broad range of goals, to find compromises, and to accommodate everyone.

There is an obvious parallel between a broad open source community and working with "neighboring teams" in your organization to make your platform fit their interests and goals better. It's just a matter of taking that first step and starting a conversation with them.

At this point, you may be asking, "But this is what I have my architects or service owners for, right?" Well, yeah, of course, they play a role in this. As do many others. And so do you!

As an example, imagine your organization sets a target for your team to deliver a service within one week of the initial request. If the service is delivered within the week, the service-level agreements (SLAs) are met, and all is good, right? In reality, that is only sometimes true.

Imagine your goal is to automatically (upon a self-service request) deliver a new virtual machine (VM) within a day and with a success rate of at least 95%. Now imagine a development team requests dozens of temporary VMs per day for CI/CD purposes, and 95% of them are delivered correctly. Your goal has been met, your SLA has been achieved—but no one is happy with the situation, because the CI/CD pipeline has broken on multiple occasions due to misconfigured VMs.

**[More to read: [10 ways to have better conversations][2]]**

In this example, the goals and SLAs need to be re-evaluated as soon as possible. But having a regular conversation with your developer teams or application maintainers, even in an organization that is pretty siloed, could make experiences like this much less common (and much easier to solve if they occur). Small annoyances and small problems would be unearthed at an early stage; small improvements would be suggested, and small improvements would be made _before_ large deployments of shadow IT happen.

At the end of the day, nothing beats human-to-human communication. Nothing breaks barriers like knowing which face goes with which name. Nothing makes it easier to talk to people than knowing they want to support you in being successful! So, go and talk to your neighboring teams. Have coffee with them. Go build a broad community in your organization!

P.S. Odds are your developer teams will talk to you about cloud and continuous integration and delivery. Those are topics for a potential future follow-up to this article. Stay tuned!

It takes developers, sales, marketing, and product people to take this open source thing and turn...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/communication-sysadmins

作者：[Maxim Burgerhout][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/wzzrdhttps://opensource.com/users/rikki-endsley
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR (People work on a computer server with devices)
[2]: https://enterprisersproject.com/article/2019/7/leadership-10-tips-better-conversations
