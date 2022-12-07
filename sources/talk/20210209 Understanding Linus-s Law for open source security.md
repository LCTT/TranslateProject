[#]: collector: (lujun9972)
[#]: translator: (CanYellow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Understanding Linus's Law for open source security)
[#]: via: (https://opensource.com/article/21/2/open-source-security)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Understanding Linus's Law for open source security
======
Linus's Law is that given enough eyeballs, all bugs are shallow. How
does this apply to open source software security?
![Hand putting a Linux file folder into a drawer][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. This article discusses Linux's influence on the security of open source software.

An often-praised virtue of open source software is that its code can be reviewed (or "audited," as security professionals like to say) by anyone and everyone. However, if you actually ask many open source users when the last time they reviewed code was, you might get answers ranging from a blank stare to an embarrassed murmur. And besides, there are some really big open source applications out there, so it can be difficult to review every single line of code effectively.

Extrapolating from these slightly uncomfortable truths, you have to wonder: When nobody looks at the code, does it really matter whether it's open or not?

### Should you trust open source?

We tend to make a trite assumption in hobbyist computing that open source is "more secure" than anything else. We don't often talk about what that means, what the basis of comparison is ("more" secure than what?), or how the conclusion has even been reached. It's a dangerous statement to make because it implies that as long as you call something _open source_, it automatically and magically inherits enhanced security. That's not what open source is about, and in fact, it's what open source security is very much against.

You should never assume an application is secure unless you have personally audited and understood its code. Once you have done this, you can assign _ultimate trust_ to that application. Ultimate trust isn't a thing you do on a computer; it's something you do in your own mind: You trust software because you choose to believe that it is secure, at least until someone finds a way to exploit that software.

You're the only person who can place ultimate trust in that code, so every user who wants that luxury must audit the code for themselves. Taking someone else's word for it doesn't count!

So until you have audited and understood a codebase for yourself, the maximum trust level you can give to an application is a spectrum ranging from approximately, _not trustworthy at all_ to _pretty trustworthy_. There's no cheat sheet for this. It's a personal choice you must make for yourself. If you've heard from people you strongly trust that an application is secure, then you might trust that software more than you trust something for which you've gotten no trusted recommendations.

Because you cannot audit proprietary (non-open source) code, you can never assign it _ultimate trust_.

### Linus's Law

The reality is, not everyone is a programmer, and not everyone who is a programmer has the time to dedicate to reviewing hundreds and hundreds of lines of code. So if you're not going to audit code yourself, then you must choose to trust (to some degree) the people who _do_ audit code.

So exactly who does audit code, anyway?

Linus's Law asserts that _given enough eyeballs, all bugs are shallow_, but we don't really know how many eyeballs are "enough." However, don't underestimate the number. Software is very often reviewed by more people than you might imagine. The original developer or developers obviously know the code that they've written. However, open source is often a group effort, so the longer code is open, the more software developers end up seeing it. A developer must review major portions of a project's code because they must learn a codebase to write new features for it.

Open source packagers also get involved with many projects in order to make them available to a Linux distribution. Sometimes an application can be packaged with almost no familiarity with the code, but often a packager gets familiar with a project's code, both because they don't want to sign off on software they don't trust and because they may have to make modifications to get it to compile correctly. Bug reporters and triagers also sometimes get familiar with a codebase as they try to solve anomalies ranging from quirks to major crashes. Of course, some bug reporters inadvertently reveal code vulnerabilities not by reviewing it themselves but by bringing attention to something that obviously doesn't work as intended. Sysadmins frequently get intimately familiar with the code of an important software their users rely upon. Finally, there are security researchers who dig into code exclusively to uncover potential exploits.

### Trust and transparency

Some people assume that because major software is composed of hundreds of thousands of lines of code, it's basically impossible to audit. Don't be fooled by how much code it takes to make an application run. You don't actually have to read millions of lines. Code is highly structured, and exploitable flaws are rarely just a single line hidden among the millions of lines; there are usually whole functions involved.

There are exceptions, of course. Sometimes a serious vulnerability is enabled with just one system call or by linking to one flawed library. Luckily, those kinds of errors are relatively easy to notice, thanks to the active role of security researchers and vulnerability databases.

Some people point to bug trackers, such as the [Common Vulnerabilities and Exposures (CVE)][2] website, and deduce that it's actually as plain as day that open source isn't secure. After all, hundreds of security risks are filed against lots of open source projects, out in the open for everyone to see. Don't let that fool you, though. Just because you don't get to see the flaws in closed software doesn't mean those flaws don't exist. In fact, we know that they do because exploits are filed against them, too. The difference is that _all_ exploits against open source applications are available for developers (and users) to see so those flaws can be mitigated. That's part of the system that boosts trust in open source, and it's wholly missing from proprietary software.

There may never be "enough" eyeballs on any code, but the stronger and more diverse the community around the code, the better chance there is to uncover and fix weaknesses.

### Trust and people

In open source, the probability that many developers, each working on the same project, have noticed something _not secure_ but have all remained equally silent about that flaw is considered to be low because humans rarely mutually agree to conspire in this way. We've seen how disjointed human behavior can be recently with COVID-19 mitigation:

  * We've all identified a flaw (a virus).
  * We know how to prevent it from spreading (stay home).
  * Yet the virus continues to spread because one or more people deviate from the mitigation plan.



The same is true for bugs in software. If there's a flaw, someone noticing it will bring it to light (provided, of course, that someone sees it).

However, with proprietary software, there can be a high probability that many developers working on a project may notice something not secure but remain equally silent because the proprietary model relies on paychecks. If a developer speaks out against a flaw, then that developer may at best hurt the software's reputation, thereby decreasing sales, or at worst, may be fired from their job. Developers being paid to work on software in secret do not tend to talk about its flaws. If you've ever worked as a developer, you've probably signed an NDA, and you've been lectured on the importance of trade secrets, and so on. Proprietary software encourages, and more often enforces, silence even in the face of serious flaws.

### Trust and software

Don't trust software you haven't audited.

If you must trust software you haven't audited, then choose to trust code that's exposed to many developers who independently are likely to speak up about a vulnerability.

Open source isn't inherently more secure than proprietary software, but the systems in place to fix it are far better planned, implemented, and staffed.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/open-source-security

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://cve.mitre.org
