Why DevSecOps matters to IT leaders
======

![](https://enterprisersproject.com/sites/default/files/styles/620x350/public/images/TEP_SecurityTraining1_620x414_1014.png?itok=zqxqJGDG)

If [DevOps][1] is ultimately about building better software, that means better-secured software, too.

Enter the term "DevSecOps." Like any IT term, DevSecOps - a descendant of the better-established DevOps - could be susceptible to hype and misappropriation. But the term has real meaning for IT leaders who've embraced a culture of DevOps and the practices and tools that help deliver on its promise.

Speaking of which: What does "DevSecOps" mean?

"DevSecOps is a portmanteau of development, security, and operations," says Robert Reeves, CTO and co-founder at [Datical][2]. "It reminds us that security is just as important to our applications as creating them and deploying them to production."

**[ Want DevOps advice from other CIOs? See our comprehensive resource, [DevOps: The IT Leader's Guide][3]. ]**

One easy way to explain DevSecOps to non-technical people: It bakes security into the development process intentionally and earlier.

"Security teams have historically been isolated from development teams - and each team has developed deep expertise in different areas of IT," [Red Hat][4] security strategist Kirsten Newcomer [told us][5] recently. "It doesn't need to be this way. Enterprises that care deeply about security and also care deeply about their ability to quickly deliver business value through software are finding ways to move security left in their application development lifecycles. They're adopting DevSecOps by integrating security practices, tooling, and automation throughout the CI/CD pipeline."

"To do this well, they're integrating their teams - security professionals are embedded with application development teams from inception (design) through to production deployment," she says. "Both sides are seeing the value - each team expands their skill sets and knowledge base, making them more valuable technologists. DevOps done right - or DevSecOps - improves IT security."

IT teams are tasked with delivering services faster and more frequently than ever before. DevOps can be a great enabler of this, in part because it can remove some of the traditional friction between development and operations teams that commonly surfaced when Ops was left out of the process until deployment time and Dev tossed its code over an invisible wall, never to manage it again, much less have any infrastructure responsibility. That kind of siloed approach causes problems, to put it mildly, in the digital age. According to Reeves, the same holds true if security exists in a silo.

"We have adopted DevOps because it's proven to improve our IT performance by removing the barriers between development and operations," Reeves says. "Much like we shouldn't wait until the end of the deployment cycle to involve operations, we shouldn't wait until the end to involve security."

### Why DevSecOps is here to stay

It may be tempting to see DevSecOps as just another buzzword, but for security-conscious IT leaders, it's a substantive term: Security must be a first-class citizen in the software development pipeline, not something that gets bolted on as a final step before a deploy, or worse, as a team that gets scrambled only after an actual incident occurs.

"DevSecOps is not just a buzzword - it is the current and future state of IT for multiple reasons," says George Gerchow, VP of security and compliance at [Sumo Logic][6]. "The most important benefit is the ability to bake security into development and operational processes to provide guardrails - not barriers - to achieve agility and innovation."

Moreover, the appearance of the DevSecOps on the scene might be another sign that DevOps itself is maturing and digging deep roots inside IT.

"The culture of DevOps in the enterprise is here to stay, and that means that developers are delivering features and updates to the production environment at an increasingly higher velocity, especially as the self-organizing teams become more comfortable with both collaboration and measurement of results," says Mike Kail, CTO and co-founder at [CYBRIC][7].

Teams and companies that have kept their old security practices in place while embracing DevOps are likely experiencing an increasing amount of pain managing security risks as they continue to deploy faster and more frequently.

"The current, manual testing approaches of security continue to fall further and further behind."

"The current, manual testing approaches of security continue to fall further and further behind, and leveraging both automation and collaboration to shift security testing left into the software development life cycle, thus driving the culture of DevSecOps, is the only way for IT leaders to increase overall resiliency and delivery security assurance," Kail says.

Shifting security testing left (earlier) benefits developers, too: Rather than finding out about a glaring hole in their code right before a new or updated service is set to deploy, they can identify and resolve potential issues during much earlier stages of development - often with little or no intervention from security personnel.

"Done right, DevSecOps can ingrain security into the development lifecycle, empowering developers to more quickly and easily secure their applications without security disruptions," says Brian Wilson, chief information security officer at [SAS][8].

Wilson points to static (SAST) and source composition analysis (SCA) tools, integrated into a team's continuous delivery pipelines, as useful technologies that help make this possible by giving developers feedback about potential issues in their own code as well as vulnerabilities in third-party dependencies.

"As a result, developers can proactively and iteratively mitigate appsec issues and rerun security scans without the need to involve security personnel," Wilson says. He notes, too, that DevSecOps can also help the Dev team streamline updates and patching.

DevSecOps doesn't mean you no longer need security pros, just as DevOps doesn't mean you no longer need infrastructure experts; it just helps reduce the likelihood of flaws finding their way into production, or from slowing down deployments because they're caught late in the pipeline.

"We're here if they have questions or need help, but having given developers the tools they need to secure their apps, we're less likely to find a showstopper issue during a penetration test," Wilson says.

### DevSecOps meets Meltdown

Sumo Logic's Gerchow shares a timely example of the DevSecOps culture in action: When the recent [Meltdown and Spectre][9] news hit, the team's DevSecOps approach enabled a rapid response to mitigate its risks without any noticeable disruption to internal or external customers, which Gerchow said was particularly important for the cloud-native, highly regulated company.

The first step: Gerchow's small security team, which he notes also has development skills, was able to work with one of its main cloud vendors via Slack to ensure its infrastructure was completely patched within 24 hours.

"My team then began OS-level fixes immediately with zero downtime to end users without having to open tickets and requests with engineering that would have meant waiting on a long change management process. All the changes were accounted for via automated Jira tickets opened via Slack and monitored through our logs and analytics solution," Gerchow explains.

In essence, it sounds a whole lot like the culture of DevOps, matched with the right mix of people, processes, and tools, but it explicitly includes security as part of that culture and mix.

"In traditional environments, it would have taken weeks or months to do this with downtime because all three development, operations, and security functions were siloed," Gerchow says. "With a DevSecOps process and mindset, end users get a seamless experience with easy communication and same-day fixes."


--------------------------------------------------------------------------------

via: https://enterprisersproject.com/article/2018/1/why-devsecops-matters-it-leaders

作者：[Kevin Casey][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://enterprisersproject.com/user/kevin-casey
[1]:https://enterprisersproject.com/tags/devops
[2]:https://www.datical.com/
[3]:https://enterprisersproject.com/devops?sc_cid=70160000000h0aXAAQ
[4]:https://www.redhat.com/en?intcmp=701f2000000tjyaAAA
[5]:https://enterprisersproject.com/article/2017/10/what-s-next-devops-5-trends-watch
[6]:https://www.sumologic.com/
[7]:https://www.cybric.io/
[8]:https://www.sas.com/en_us/home.html
[9]:https://www.redhat.com/en/blog/what-are-meltdown-and-spectre-heres-what-you-need-know?intcmp=701f2000000tjyaAAA
