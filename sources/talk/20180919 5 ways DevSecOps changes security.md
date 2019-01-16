 translating by hopefully2333 

5 ways DevSecOps changes security
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum)

There’s been an ongoing kerfuffle over whether we need to expand [DevOps][1] to explicitly bring in security. After all, the thinking goes, [DevOps][2] has always been something of a shorthand for a broad set of new practices, using new tools (often open source) and built on more collaborative cultures. Why not [DevBizOps][3] for better aligning with business needs? Or DevChatOps to emphasize better and faster communications?

However, [as John Willis wrote earlier this year][4] on his coming around to the [DevSecOps][5] terminology, “Hopefully, someday we will have a world where we no longer have to use the word DevSecOps and security will be an inherent part of all service delivery discussions. Until that day, and at this point, my general conclusion is that it’s just three new characters. More importantly, the name really differentiates the problem statement in a world where we as an industry are not doing a great job on information security.”

So why aren’t we doing a great job on [information security][6], and what does it mean to do a great job in a DevSecOps context?

We’ve arguably never done a great job of information security in spite of (or maybe because of) the vast industry of complex point products addressing narrow problems. But we also arguably did a good enough job during the era when defending against threats focused on securing the perimeter, network connections were limited, and most users were employees using company-provided devices.

Those circumstances haven’t accurately described most organizations’ reality for a number of years now. But the current era, which brings in not only DevSecOps but new application architectural patterns, development practices, and an increasing number of threats, defines a stark new normal that requires a faster pace of change. It’s not so much that DevSecOps in isolation changes security, but that infosec circa 2018 requires new approaches.

Consider these five areas.

### Automation

Lots of automation is a hallmark of DevOps generally. It’s partly about speed. If you’re going to move fast (and not break things), you need to have repeatable processes that execute without a lot of human intervention. Indeed, automation is one of the best entry points for DevOps, even in organizations that are still mostly working on monolithic legacy apps. Automating routine processes associated with configurations or testing with easy-to-use tools such as [Ansible][7] is a common quick hit for starting down the path to DevOps.

DevSecOps is no different. Security today is a continuous process rather than a discrete checkpoint in the application lifecycle, or even a weekly or monthly check. When vulnerabilities are found and fixes issued by a vendor, it’s important they be applied quickly given that exploits taking advantage of those vulnerabilities will be out soon.

### "Shift left"

Traditional security is often viewed as a gatekeeper at the end of the development process. Check all the boxes and your app goes into production. Otherwise, try again. Security teams have a reputation for saying no a lot.

Therefore, the thinking goes, why not move security earlier (left in a typical left-to-right drawing of a development pipeline)? Security may still say no, but the consequences of rework in early-stage development are a lot less than they are when the app is complete and ready to ship.

I don’t like the “shift left” term, though. It implies that security is still a one-time event that’s just been moved earlier. Security needs to be a largely automated process everywhere in the application lifecycle, from the supply chain to the development and test process all the way through deployment.

### Manage dependencies

One of the big changes we see with modern app development is that you often don’t write most of the code. Using open source libraries and frameworks is one obvious case in point. But you may also just use external services from public cloud providers or other sources. In many cases, this external code and services will dwarf what you write yourself.

As a result, DevSecOps needs to include a serious focus on your [software supply chain][8]. Are you getting your software from trusted sources? Is it up to date? Is it integrated into the security processes that you use for your own code? What policies do you have in place for which code and APIs you can use? Is commercial support available for the components that you are using for your own production code?

No set of answers are going to be appropriate in all cases. They may be different for a proof-of-concept versus an at-scale production workload. But, as has been the case in manufacturing for a long time (and DevSecOps has many analogs in how manufacturing has evolved), the integrity of the supply chain is critical.

### Visibility

I’ve talked a lot about the need for automation throughout all the stages of the application lifecycle. That makes the assumption that we can see what’s going on in each of those stages.

Effective DevSecOps requires effective instrumentation so that automation knows what to do. This instrumentation falls into a number of categories. There are long-term and high-level metrics that help tell us if the overall DevSecOps process is working well. There are critical alerts that require immediate human intervention (the security scanning system is down!). There are alerts, such as for a failed scan, that require remediation. And there are logs of the many parameters we capture for later analysis (what’s changing over time? What caused that failure?).

### Services vs. monoliths

While DevSecOps practices can be applied across many types of application architectures, they’re most effective with small and loosely coupled components that can be updated and reused without potentially forcing changes elsewhere in the app. In their purest form, these components can be [microservices][9] or functions, but the general principles apply wherever you have loosely coupled services communicating over a network.

This pattern does introduce some new security challenges. The interactions between components can be complex and the total attack surface can be larger because there are now more entry points to the application across the network.

On the other hand, this type of architecture also means that automated security and monitoring also has more granular visibility into the application components because they’re no longer buried deep within a monolithic application.

Don’t get too wrapped up in the DevSecOps term, but take it as a reminder that security is evolving because the way that we write and deploy applications is evolving.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/devsecops-changes-security

作者：[Gordon Haff][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ghaff
[1]: https://opensource.com/resources/devops
[2]: https://opensource.com/tags/devops
[3]: https://opensource.com/article/18/5/steps-apply-devops-culture-beyond-it
[4]: https://www.devsecopsdays.com/articles/its-just-a-name
[5]: https://opensource.com/article/18/4/devsecops
[6]: https://opensource.com/article/18/6/where-cycle-security-devops
[7]: https://opensource.com/tags/ansible
[8]: https://opensource.com/article/17/1/be-open-source-supply-chain
[9]: https://opensource.com/tags/microservices
