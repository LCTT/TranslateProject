What is an SRE and how does it relate to DevOps?
======
The SRE role is common in large enterprises, but smaller businesses need it, too. 

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/toolbox-learn-draw-container-yearbook.png?itok=xDbwz1pP)

Even though the site reliability engineer (SRE) role has become prevalent in recent years, many people—even in the software industry—don't know what it is or does. This article aims to clear that up by explaining what an SRE is, how it relates to DevOps, and how an SRE works when your entire engineering organization can fit in a coffee shop.

### What is site reliability engineering?

[Site Reliability Engineering: How Google Runs Production Systems][1], written by a group of Google engineers, is considered the definitive book on site reliability engineering. Google vice president of engineering Ben Treynor Sloss [coined the term][2] back in the early 2000s. He defined it as: "It's what happens when you ask a software engineer to design an operations function."

Sysadmins have been writing code for a long time, but for many of those years, a team of sysadmins managed many machines manually. Back then, "many" may have been dozens or hundreds, but when you scale to thousands or hundreds of thousands of hosts, you simply can't continue to throw people at the problem. When the number of machines gets that large, the obvious solution is to use code to manage hosts (and the software that runs on them).

Also, until fairly recently, the operations team was completely separate from the developers. The skillsets for each job were considered completely different. The SRE role tries to bring both jobs together.

Before we dig deeper into what makes an SRE and how SREs work with the development team, we need to understand how site reliability engineering works within the DevOps paradigm.

### Site reliability engineering and DevOps

At its core, site reliability engineering is an implementation of the DevOps paradigm. There seems to be a wide array of ways to [define DevOps][3]. The traditional model, where the development ("devs") and operations ("ops") teams were separated, led to the team that writes the code not being responsible for how it works when customers start using it. The development team would "throw the code over the wall" to the operations team to install and support.

This situation can lead to a significant amount of dysfunction. The goals of the dev and ops teams are constantly at odds—a developer wants customers to use the "latest and greatest" piece of code, but the operations team wants a steady system with as little change as possible. Their premise is that any change can introduce instability, while a system with no changes should continue to behave in the same manner. (Noting that minimizing change on the software side is not the only factor in preventing instability is important. For example, if your web application stays exactly the same, but the number of customers grows by 10x, your application may break in many different ways.)

The premise of DevOps is that by merging these two distinct jobs into one, you eliminate contention. If the "dev" wants to deploy new code all the time, they have to deal with any fallout the new code creates. As Amazon's [Werner Vogels said][4], "you build it, you run it" (in production). But developers already have a lot to worry about. They are continually pushed to develop new features for their employer's products. Asking them to understand the infrastructure, including how to deploy, configure, and monitor their service, may be asking a little too much from them. This is where an SRE steps in.

When a web application is developed, there are often many people that contribute. There are user interface designers, graphic designers, frontend engineers, backend engineers, and a whole host of other specialties (depending on the technologies used). Requirements include how the code gets managed (e.g., deployed, configured, monitored)—which are the SRE's areas of specialty. But, just as an engineer developing a nice look and feel for an application benefits from knowledge of the backend-engineer's job (e.g., how data is fetched from a database), the SRE understands how the deployment system works and how to adapt it to the specific needs of that particular codebase or project.

So, an SRE is not just "an ops person who codes." Rather, the SRE is another member of the development team with a different set of skills particularly around deployment, configuration management, monitoring, metrics, etc. But, just as an engineer developing a nice look and feel for an application must know how data is fetched from a data store, an SRE is not singly responsible for these areas. The entire team works together to deliver a product that can be easily updated, managed, and monitored.

The need for an SRE naturally comes about when a team is implementing DevOps but realizes they are asking too much of the developers and need a specialist for what the ops team used to handle.

### How the SRE works at a startup

This is great when there are hundreds of employees (let alone when you are the size of Google or Facebook). Large companies have SRE teams that are split up and embedded into each development team. But a startup doesn't have those economies of scale, and engineers often wear many hats. So, where does the "SRE hat" sit in a small company? One approach is to fully adopt DevOps and have the developers be responsible for the typical tasks an SRE would perform at a larger company. On the other side of the spectrum, you hire specialists — a.k.a., SREs.

The most obvious advantage of trying to put the SRE hat on a developer's head is it scales well as your team grows. Also, the developer will understand all the quirks of the application. But many startups use a wide variety of SaaS products to power their infrastructure. The most obvious is the infrastructure platform itself. Then you add in metrics systems, site monitoring, log analysis, containers, and more. While these technologies solve some problems, they create an additional complexity cost. The developer would need to understand all those technologies and services in addition to the core technologies (e.g., languages) the application uses. In the end, keeping on top of all of that technology can be overwhelming.

The other option is to hire a specialist to handle the SRE job. Their responsibility would be to focus on deployment, configuration, monitoring, and metrics, freeing up the developer's time to write the application. The disadvantage is that the SRE would have to split their time between multiple, different applications (i.e., the SRE needs to support the breadth of applications throughout engineering). This likely means they may not have the time to gain any depth of knowledge of any of the applications; however, they would be in a position to see how all the different pieces fit together. This "30,000-foot view" can help prioritize the weak spots to fix in the system as a whole.

There is one key piece of information I am ignoring: your other engineers. They may have a deep desire to understand how deployment works and how to use the metrics system to the best of their ability. Also, hiring an SRE is not an easy task. You are looking for a mix of sysadmin skills and software engineering skills. (I am specific about software engineers, vs. just "being able to code," because software engineering involves more than just writing code [e.g., writing good tests or documentation].)

Therefore, in some cases, it may make more sense for the "SRE hat" to live on a developer's head. If so, keep an eye on the amount of complexity in both the code and the infrastructure (SaaS or internal). At some point, the complexity on either end will likely push toward more specialization.

### Conclusion

An SRE team is one of the most efficient ways to implement the DevOps paradigm in a startup. I have seen a couple of different approaches, but I believe that hiring a dedicated SRE (pretty early) at your startup will free up time for the developers to focus on their specific challenges. The SRE can focus on improving the tools (and processes) that make the developers more productive. Also, an SRE will focus on making sure your customers have a product that is reliable and secure.

Craig Sebenik will present [SRE (and DevOps) at a Startup][5] at [LISA18][6], October 29-31 in Nashville, Tennessee.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/sre-startup

作者：[Craig Sebenik][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/craig5
[b]: https://github.com/lujun9972
[1]: http://shop.oreilly.com/product/0636920041528.do
[2]: https://landing.google.com/sre/interview/ben-treynor.html
[3]: https://opensource.com/resources/devops
[4]: https://queue.acm.org/detail.cfm?id=1142065
[5]: https://www.usenix.org/conference/lisa18/presentation/sebenik
[6]: https://www.usenix.org/conference/lisa18
