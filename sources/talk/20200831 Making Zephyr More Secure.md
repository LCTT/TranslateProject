[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Making Zephyr More Secure)
[#]: via: (https://www.linux.com/audience/developers/making-zephyr-more-secure/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

Making Zephyr More Secure
======

Zephyr is gaining momentum where more and more companies are embracing this open source project for their embedded devices. However, security is becoming a huge concern for these connected devices. The NCC Group recently conducted an evaluation and security assessment of the project to help harden it against attacks. In the interview, Kate Stewart, Senior Director of Strategic Programs at Linux Foundation talk about the assessment and the evolution of the project.

Here is a quick transcript of the interview:

**Swapnil Bhartiya: The NCC group recently evaluated Linux for security. Can you talk about what was the outcome of that evaluation?**
Kate Stewart: We’re very thankful for the NCC group for the work that they did and helping us to get Zephyr hardened further. In some senses when it had first hit us, it was like, “Okay, they’re taking us seriously now. Awesome.” And the reason they’re doing this is that their customers are asking for it. They’ve got people who are very interested in Zephyr so they decided to invest the time doing the research to see what they could find. And the fact that we’re good enough to critique now is a nice positive for the project, no question.

Up till this point, we’d had been getting some vulnerabilities that researchers had noticed in certain areas and had to tell us about. We’d issued CVEs so we had a process down, but suddenly being hit with the whole bulk of those like that was like, “Okay, time to up our game guys.” And so, what we’ve done is we found out we didn’t have a good way of letting people who have products with Zephyr based on them know about our vulnerabilities. And what we wanted to be able to do is make it clear that if people have products and they have them out in the market and that they want to know if there’s a vulnerability. We just added a new webpage so they know how to register, and they can let us know to contact them.

The challenge of embedded is you don’t quite know where the software is. We’ve got a lot of people downloading Zephyr, we got a lot of people using Zephyr. We’re seeing people upstreaming things all the time, but we don’t know where the products are, it’s all word of mouth to a large extent. There’re no tracers or anything else, you don’t want to do that in an embedded space on IoT; battery life is important. And so, it’s pretty key for figuring out how do we let people who want to be notified know.

We’d registered as a CNA with Mitre several years ago now and we can assign CVE numbers in the project. But what we didn’t have was a good way of reaching out to people beyond our membership under embargo so that we can give them time to remediate any issues that we’re fixing. By changing our policies, it’s gone from a 60-day embargo window to a 90-day embargo window. In the first 30 days, we’re working internally to get the team to fix the issues and then we’ve got a 60-day window for our people who do products to basically remediate in the field if necessary. So, getting ourselves useful for product makers was one of the big focuses this year.

**Swapnil Bhartiya: Since Zephyr’s LTS release was made last year, can you talk about the new releases, especially from the security perspective because I think the latest version is 2.3.0?**
Kate Stewart: Yeah, 2.3.0 and then we also have 1.14.2. and 1.14 is our LTS-1 as we say. And we’ve put an update out to it with the security fixes and a long-term stable like the Linux kernel has security fixes and bug fixes backported into it so that people can build products on it and keep it active over time without as much change in the interfaces and everything else that we’re doing in the mainline development tree and what we’ve just done with the 2.3.

2.3 has a lot of new features in it and we’ve got all these vulnerabilities remediated. There’s a lot more coming up down the road, so the community right now is working. We’ve adopted new set of coding guidelines for the project and we will be working on that so we can get ourselves ready for going after safety certifications next year. So there’s a lot of code in motion right now, but there’s a lot of new features being added every day. It’s great.

**Swapnil Bhartiya: I also want to talk a bit about the community side of it. Can you talk about how the community is growing new use cases?**
Kate Stewart: We’ve just added two new members into Zephyr. We’ve got Teenage Engineering has just joined us and Laird Connectivity has just joined us and it’s really cool to start seeing these products coming out. There are some rather interesting technologies and products that are showing up and so I’m really looking forward to being able to have blog posts about them.

Laird Connectivity is basically a small device running Zephyr that you can use for monitoring distance without recording other information. So, in days of COVID, we need to start figuring out technology assists to help us keep the risk down. Laird Connectivity has devices for that.

So we’re seeing a lot of innovation happening very quickly in Zephyr and that’s really Zephyr’s strength is it’s got a very solid code base and lets people add their innovation on top.

**Swapnil Bhartiya: What role do you think Zephyr going to play in the post-COVID-19 world?**
Kate Stewart: Well, I think they offer us interesting opportunities. Some of the technologies that are being looked at for monitoring for instance – we have distance monitoring, contact tracing and things like that. We can either do it very manually or we can start to take advantage of the technology infrastructures to do so. But people may not want to have a device effectively monitoring them all the time. They may just want to know exactly, position-wise, where they are. So that’s potentially some degree of control over what’s being sent into the tracing and tracking.

These sorts of technologies I think will be helping us improve things over time. I think there’s a lot of knowledge that we’re getting out of these and ways we can optimize the information and the RTOS and the sensors are discrete functionality and are improving how do we look at things.

**Swapnil Bhartiya: There are so many people who are using Zephyr but since it is open source we not even aware of them. How do you ensure that whether someone is an official member of the project or not if they are running Zephyr their devices are secure?**
Kate Stewart: We do a lot of testing with Zephyr, there’s a tremendous amount of test infrastructure. There’s the whole regression infrastructure. We work to various thresholds of quality levels and we’ve got a lot of expertise and have publicly documented all of our best practices. A security team is a top-notch group of people. I’m really so proud to be able to work with them. They do a really good job of caring about the issues as well as finding them, debugging them and making sure anything that comes up gets solved. So in that sense, there’s a lot of really great people working on Zephyr and it makes it a really fun community to work with, no question. In fact, it’s growing fast actually.

**Swapnil Bhartiya: Kate, thank you so much for taking your time out and talking to me today about these projects.**
--------------------------------------------------------------------------------

via: https://www.linux.com/audience/developers/making-zephyr-more-secure/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
