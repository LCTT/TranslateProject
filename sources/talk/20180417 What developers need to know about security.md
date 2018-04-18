What developers need to know about security
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/locks_keys_bridge_paris.png?itok=Bp0dsEc9)

DevOps doesn't mean that everyone needs to be an expert in both development and operations. This is especially true in larger organizations in which roles tend to be more specialized. Rather, DevOps thinking has evolved in a way that makes it more about the separation of concerns. To the degree that operations teams can deploy platforms for developers (whether on-premises or in a public cloud) and get out of the way, that's good news for both teams. Developers get a productive development environment and self-service. Operations can focus on keeping the underlying plumbing running and maintaining the platform.

It's a contract of sorts. Devs expect a stable and functional platform from ops. Ops expects that devs will be able to handle most of the tasks associated with developing apps on their own.

Devs expect a stable and functional platform from ops. Ops expects that devs will be able to handle most of the tasks associated with developing apps on their own.

That said, DevOps is also about better communication, collaboration, and transparency. It works better if it's not about merely a new type of wall between dev and ops. Ops needs to be sensitive to the type of tools developers want and need and the visibility they require, through monitoring and logging, to write better applications. Conversely, developers need some awareness of how the underlying infrastructure can be used most effectively and what can keep operations up at night (literally).

That said, DevOps is also about better communication, collaboration, and transparency. It works better if it's not about merely a new type of wall between dev and ops. Ops needs to be sensitive to the type of tools developers want and need and the visibility they require, through monitoring and logging, to write better applications. Conversely, developers need some awareness of how the underlying infrastructure can be used most effectively and what can keep operations up at night (literally).

The same principle applies more broadly to DevSecOps, a term that serves to explicitly remind us that security needs to be embedded throughout the entire DevOps pipeline from sourcing content to writing apps, building them, testing them, and running them in production. Developers (and operations) don't suddenly need to become security specialists in addition to the other hats they already wear. But they can often benefit from a greater awareness of security best practices (which may be different from what they've become accustomed to) and shifting away from a mindset that views security as some unfortunate obstacle.

Here are a few observations.

The Open Web Application Security Project ([OWASP][1]) [Top 10 list][2] provides a window into the top vulnerabilities in web applications. Many entries on the list will be familiar to web programmers. Cross-site scripting (XSS) and injection flaws are among the most common. What's striking though is that many of the flaws on the original 2007 list are still on 2017's list ([PDF][3]). Whether it's training or tooling that's most at fault, many of the same coding flaws keep popping up.

The situation is exacerbated by new platform technologies. For example, while containers don't necessarily require applications to be written differently, they dovetail with new patterns (such as [microservices][4] ) and can amplify the effects of certain security practices. For example, as my colleague [Dan Walsh][5] [@rhatdan][6] ) writes, "The biggest misconception in computing [is] you need root to run applications. The problem is not so much that devs think they need root. It is that they build this assumption into the services that they build, i.e., the services cannot run without root, making us all less secure."

Was defaulting to root access ever a good practice? Not really. But it was arguably (maybe) a defensible one with applications and systems that were otherwise sufficiently isolated by other means. But with everything connected, no real perimeter, multi-tenant workloads, users with many different levels of access rights—to say nothing of an ever more dangerous threat environment—there's far less leeway for shortcuts.

[Automation][7] should be an integral part of DevOps anyway. That automation needs to include security and compliance testing throughout the process. Where did the code come from? Are third-party technologies, products, or container images involved? Are there known security errata? Are there known common code flaws? Are secrets and personally identifiable information kept isolated? How do we authenticate? Who is authorized to deploy services and applications?

You're not writing your own crypto, are you?

Automate penetration testing where possible. Did I mention automation? It's an essential part of making security continuous rather than a checklist item that's done once in a while.

Does this sound hard? It probably is a bit. At least it may be different. But as a participant in a [DevOpsDays OpenSpaces][8] London said to me: "It's just technical testing. It's not magical or mysterious." He went on to say that it's not even that hard to get involved with security as a way to gain a broader understanding of the whole software lifecycle (which is not a bad skill to have). He also suggested taking part in incident response exercises or [capture the flag exercises][9]. You might even find they're fun.

This article is based on [a talk][10] the author will be giving at [Red Hat Summit 2018][11], which will be held May 8-10 in San Francisco. _[Register by May 7][11] to save US$ 500 off of registration. Use discount code **OPEN18** on the payment page to apply the discount._

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/what-developers-need-know-about-security

作者：[Gordon Haff][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ghaff
[1]:https://www.owasp.org/index.php/Main_Page
[2]:https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project
[3]:https://www.owasp.org/images/7/72/OWASP_Top_10-2017_%28en%29.pdf.pdf
[4]:https://opensource.com/tags/microservices
[5]:https://opensource.com/users/rhatdan
[6]:https://twitter.com/rhatdan
[7]:https://opensource.com/tags/automation
[8]:https://www.devopsdays.org/open-space-format/
[9]:https://dev.to/_theycallmetoni/capture-the-flag-its-a-game-for-hacki-mean-security-professionals
[10]:https://agenda.summit.redhat.com/SessionDetail.aspx?id=154677
[11]:https://www.redhat.com/en/summit/2018
