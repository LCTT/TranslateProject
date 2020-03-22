[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How technical debt is risking your security)
[#]: via: (https://opensource.com/article/20/3/remove-security-debt)
[#]: author: (Sam Bocetta https://opensource.com/users/sambocetta)

How technical debt is risking your security
======
A few security fixes now will help lighten the load of future developers
using your software.
![A lock on the side of a building][1]

Everyone knows they shouldn't take shortcuts, especially in their work, and yet everyone does. Sometimes it doesn't matter, but when it comes to code development, though, it definitely does.

As any experienced programmer knows, building your code the quick and dirty way soon leads to problems down the line. These issues might not be disastrous, but they incur a small penalty every time you want to develop your code further.

This is the basic idea behind [technical debt][2], a term first coined by well-known programmer Ward Cunningham. Technical debt is a metaphor that explains the long-term burden developers and software teams incur when taking shortcuts, and has become a popular way to think about the extra effort that we have to do in future development because of the quick and dirty design choice.

"Security Debt" is an extension of this idea, and in this article, we'll take a look at what the term means, why it is a problem, and what you can do about it.

### What is security debt?

To get an idea of how security debt works, we have to consider the software development lifecycle. Today, it's very rare for developers to start with a blank page, even for a new piece of software. At the very least, most programmers will start a new project with open source code copied from online repositories.

They will then adapt and change this code to make their project. While they are doing this, there will be many points where they notice a security vulnerability. Something as simple as an error establishing a database connection can be an indication that systems are not playing well together, and that someone has taken a fast and dirty approach.

Then they have two options: they can either take an in-depth look at the code they are working with, and fix the issue at a fundamental level, or they can quickly paste extra code over the top that gets around the problem in a quick, inefficient way.

Given the demands of today's development environment, most developers choose the second route, and we can't blame them. The problem is that the next person who looks at the code is going to have to spend longer working out how it operates.

Time, as we all know, is money. Because of this, each time software needs to be changed, there will be a small cost to make it secure due to previous developers taking shortcuts. This is security debt.

### How security debt threatens your software

There was a time when security debt was not a huge problem, at least not in the open source community. A decade ago, open source components had lifetimes measured in years and were freely available to everyone.

This meant that security issues in legacy code got fixed. Today, the increased speed of the development lifecycle and the increasingly censored internet means that developers can no longer trust third party code to the degree they used to.

This has led to a considerable increase in security debt for developers using open source components. Veracode's latest [State of Software Security (SOSS)][3] report found that security issues in open source software take about a month longer to be fixed than those in software that is sourced internally. Insourced software recorded the highest fix rates, but even software sourced from external contractors gets fixed faster, by about two weeks, than open source software.

The ultimate outcome of this – and one that the term "security debt" captures very well – is that most companies currently face security vulnerabilities throughout their entire software stack, and these are accumulating faster than they are fixed. In other words, developers have maxed out their security debt credit card, and are drowning in the debt they've incurred. This is particularly concerning when you consider that total household debt [reached nearly $14 trillion][4] in the United States alone in 2019.

### How to avoid security debt

Avoiding a build-up of security debt requires that developers take a different approach to security than the one that is prevalent in the industry at the moment. Proven methods such as zero-knowledge cloud encryption, VPNs to promote online anonymity, and network intrusion prevention software are great, but they may also not be enough.

In fact, there might have been some developers who were scratching their heads during our definition of security debt above: how many of us think about the next poor soul who will have to check our code for security flaws?

Changing that way of thinking is key to preventing a build-up of security debt. Developers should take the time to thoroughly [check their software for security vulnerabilities][5], not just during development, but after the release as well. Fix any errors now, rather than waiting for security holes to build up.

If that instruction sounds familiar, then well done. A continuity approach to software development is a critical component of [layering security through DevOps][6], and one of the pillars of the emerging discipline of DevSecOps. Along with [chaos engineering][7], these approaches seek to integrate security into development, testing, and assessment processes, and thereby prevent a build-up of security debt.

Just like a credit card, the key to avoiding security debt getting out of control is to avoid the temptation to take shortcuts in the first place. That's easier said than done, of course, but one of the key lessons from recent data breaches is that legacy systems that many developers assume are secure are just as full of shortcuts as recently written code.

### Measure twice, cut once

Since [security by default hasn't arrived yet][8], we must all try and do things properly in the future. Taking the fast, dirty approach might mean that you get to leave the office early, but ultimately that decision will come back to bite you.

If you finish early anyway, well done: you can use the time to read [our best articles on security][9] and check whether your code is as secure as you think it is.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/remove-security-debt

作者：[Sam Bocetta][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sambocetta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA (A lock on the side of a building)
[2]: https://opensource.com/article/17/10/why-i-love-technical-debt
[3]: https://www.veracode.com/state-of-software-security-report
[4]: https://thetokenist.io/financial-statistics/
[5]: https://opensource.com/article/17/6/3-security-musts-software-developers
[6]: https://opensource.com/article/19/9/layered-security-devops
[7]: https://www.infoq.com/articles/chaos-engineering-security-networking/
[8]: https://opensource.com/article/20/1/confidential-computing
[9]: https://opensource.com/article/19/12/security-resources
