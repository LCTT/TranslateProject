# Why DevOps is the end of security as we know it

![](https://techbeacon.com/sites/default/files/styles/article_hero_image/public/field/image/rugged-devops-end-of-security.jpg?itok=Gp1xxSMK)

Security can be a hard sell. It’s difficult to convince development teams to spend their limited cycles patching security holes with line-of-business managers pressuring them to release applications as quickly as possible. But given that 84 percent of all cyberattacks happen on the application layer, organizations can’t afford for their dev teams not to include security.

The rise of DevOps presents a dilemma for many security leads. “It’s a threat to security,” [Josh Corman, former CTO at Sonatype][2], “and it’s an opportunity for security to get better.” Corman is a staunch advocate of [integrating security and DevOps practices to create “Rugged DevOps.”][3]  _Business Insights_  talked with Corman about the values security and DevOps share, and how those shared values help make organizations less vulnerable to outages and exploits.

What Is the True State of Security in DevOps?[Get Report][1]

### How are security and DevOps practices mutually beneficial?

**Josh Corman: **A primary example is the tendency for DevOps teams to instrument everything that can be measured. Security is always looking for more intelligence and telemetry. You can take a lot of what DevOps teams are measuring and enter that info into your log management or your SIEM [security information and event management system].

An OODA loop [observe, orient, decide, act] is predicated on having enough pervasive eyes and ears to notice whispers and echoes. DevOps gives you pervasive instrumentation.

### Are there other cultural attitudes that they share?

**JC:** “Be mean to your code” is a shared value. For example, the software tool Chaos Monkey written by Netflix was a watershed moment for DevOps teams. Created to test the resiliency and recoverability of Amazon Web Services, Chaos Monkey made the Netflix teams stronger and more prepared for outages.

So there’s now this notion that our systems need to be tested and, as such, James Wickett and I and others decided to make an evil, weaponized Chaos Monkey, which is where the GAUNTLT project came from. It’s basically a barrage of security tests that can be used within DevOps cycle times and by DevOps tool chains. It’s also very DevOps-friendly with APIs.

### Where else do enterprise security and DevOps values intersect?

**JC:** Both teams believe complexity is the enemy of all things. For example, [security people and Rugged DevOps folks][4] can actually say, “Look, we’re using 11 logging frameworks in our project—maybe we don’t need that many, and maybe that attack surface and complexity could hurt us, or hurt the quality or availability of the product.”

Complexity tends to be the enemy of lots of things. Typically you don’t have a hard time convincing DevOps teams to use better building materials in architectural levels: use the most recent, least vulnerable versions, and use fewer of them.

### What do you mean by “better building materials”?

**JC:** I’m the custodian of the largest open-source repository in the world, so I see who’s using which versions, which vulnerabilities are in them, when they don’t take a fix for a vulnerability, and for how long. Certain logging frameworks, for example, fix none of their bugs, ever. Some of them fix most of their security bugs within 90 days. People are getting breached over and over because they’re using a framework that has zero security hygiene.

Beyond that, even if you don’t know the quality of your logging frameworks, having 11 different frameworks makes for a very clunky, buggy deliverable, with lots of extra work and complexity. Your exposure to vulnerabilities is much greater. How much development time do you want to be spending fixing lots of little defects, as opposed to creating the next big disruptive thing?

One of the keys to [Rugged DevOps is software supply chain management][5], which incorporates three principles: Use fewer and better suppliers; use the highest-quality parts from those suppliers; and track which parts went where, so that you can have a prompt and agile response when something goes wrong.

### So change management is also important.

**JC:** Yes, that’s another shared value. What I’ve found is that when a company wants to perform security tests such as anomaly detection or net-flow analysis, they need to know what “normal” looks like. A lot of the basic things that trip people up have to do with inventory and patch management.

I saw in the  _Verizon Data Breach Investigations Report_  that 97 percent of last year’s successfully exploited vulnerabilities tracked to just ten CVEs [common vulnerabilities and exposures], and of those 10, eight have been fixed for over a decade. So, shame on us for talking about advanced espionage. We’re not doing basic patching. Now, I’m not saying that if you fix those ten CVEs, you’ll have no successful exploits, but they account for the lion’s share of how people are actually failing.

The nice thing about [DevOps automation tools ][6]is that they’ve become an accidental change management database. It’s a single version of the truth of who pushed which change where, and when. That’s a huge win, because often the factors that have the greatest impact on security are out of your control. You inherit the downstream consequences of the choices made by the CIO and the CTO. As IT becomes more rigorous and repeatable through automation, you lessen the chance for human error and allow more traceability on which change happened where.

### What would you say is the most important shared value?

**JC:** DevOps involves processes and toolchains, but I think the defining attribute is culture, specifically empathy. DevOps works because dev and ops teams understand each other better and can make more informed decisions. Rather than solving problems in silos, they’re solving for the stream of activity and the goal. If you show DevOps teams how security can make them better, then as a reciprocation they tend to ask, “Well, are there any choices we make that would make your life easier?” Because often they don’t know that the choice they’ve made to do X, Y, or Z made it impossible to include security.

For security teams, one of the ways to drive value is to be helpful before we ask for help, and provide qualitative and quantitative value before we tell DevOps teams what to do. You’ve got to earn the trust of DevOps teams and earn the right to play, and then it will be reciprocated. It often happens a lot faster than you think.

--------------------------------------------------------------------------------

via: https://techbeacon.com/why-devops-end-security-we-know-it

作者：[Mike Barton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/intent/follow?original_referer=https%3A%2F%2Ftechbeacon.com%2Fwhy-devops-end-security-we-know-it%3Fimm_mid%3D0ee8c5%26cmp%3Dem-webops-na-na-newsltr_20170310&ref_src=twsrc%5Etfw&region=follow_link&screen_name=mikebarton&tw_p=followbutton
[1]:https://techbeacon.com/resources/application-security-devops-true-state?utm_source=tb&utm_medium=article&utm_campaign=inline-cta
[2]:https://twitter.com/joshcorman
[3]:https://techbeacon.com/want-rugged-devops-team-your-release-security-engineers
[4]:https://techbeacon.com/rugged-devops-rsa-6-takeaways-security-ops-pros
[5]:https://techbeacon.com/josh-corman-security-devops-how-shared-team-values-can-reduce-threats
[6]:https://techbeacon.com/devops-automation-best-practices-how-much-too-much
