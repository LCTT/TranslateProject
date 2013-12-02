Are Open Source Developers Too Demanding?
================================================================================
**Open source invites participation, including criticism. But do developers sometimes take it too far?**

![](http://readwrite.com/files/opencola_wikipedia.jpg)

Developers can be a fickle bunch. Gifted with mountains of free, open-source code of ever-improving quality, some developers can’t help but complain that there’s not more, and even more free, software. But the problem often isn't the code itself, but poorly calibrated expectations and scanty training.

### What? Me Pay? ###

One sometimes unrealistic expectation is that software should be free. All of it.

So, for example, we have [one young developer berating nginx][1] for building “admittedly amazing software” but then having the audacity to charge for it. 

No, really. Those nginx people are trying to make money by writing software that people want. Can you believe the gall?

Actually, his problem is more nuanced than this. Despite electing not to use Apache httpd, the Hip Young Startup blog author complains that nginx "took a feature that Apache httpd has had literally forever and put it behind a pay wall." It's unclear why he doesn't just use Apache to solve his problem, given that he also says "the performance difference between nginx and httpd in this scenario is negligible."

Or maybe he could fix nginx himself, given that, by his own admission, it's "trivial" to make the changes himself to get around nginx's attempts to sustain product development by charging for some features. The problem, as he acknowledges, is that he "shouldn’t have to do any of this [crap]."

In other words, the world (or nginx) owes this developer a living. Who knew?

Let's be clear: one of the ways open source succeeds is by dramatically lowering the bar to adoption. Charging money, even a negligible fee, can hinder that adoption. But getting uppity about the primary developer of an open-source project charging money for value? As programmer Brendan Loudermilk ([@bloudermilk][2]) [tells][3] the Hip Young Startup blogger, "You could always pay for and support the software that serves as a core dependency of your app."

Imagine that.

### Documentation? Of Course I Didn’t Read The Documentation! ###

Then there are the countless others who take to Hacker News to complain about software they often don’t understand, quite often because they haven’t bothered to read the documentation. I completely get that great software should be approachable, and great products, generally, should be somewhat self-explanatory.

But much of the best open-source software can be complex to run, at least, at scale. If the software isn't working for someone, it's not obvious that the software is the problem. Vlad Mihalcea, founder of the Struts open-source framework, nails this, [arguing][4] that “if there is someone to blame, it’s usually us” as much of the available open-source software tends to be high-quality code.

What it isn’t, he goes on to argue, is a free lunch in terms of a learning curve. Any software, whether open source or proprietary, requires some investment in learning how to be productive with it. As he notes of Hibernate and other open-source technologies, “If you want to employ them [successfully], be prepared to learn a lot. There is no other way.”

This won’t resonate with the hacker crowd whose first instinct is to complain when software doesn’t work the way they want, even if it wasn’t designed to do what they want it to do. But it’s true, all the same.

### Healthcare.gov Vs. Gov.UK ###

Just look at the Healthcare.gov debacle for proof. Recently NoSQL database vendor MarkLogic has been [taking bullets][5] over its alleged role in Healthcare.gov’s many technical problems. [Some have gone so far as to argue][6] that NoSQL databases, in general, are faulty because of the Healthcare.gov debacle.

This is stupid.

MarkLogic is a fine database. While not perfect, it’s silly to blame Healthcare.gov’s problems on this legacy database. Code isn’t the primary problem.

As [I’ve argued][7], Healthcare.gov’s problems aren’t really about code, but instead about process. For proof, look no further than Healthcare.gov’s British peer, Gov.UK, [which credits NoSQL technologies][8] as a significant reasons for its success.

The difference isn’t in the code the two websites used, but rather their respective approaches: Gov.UK is iterative, agile. Healthcare.gov is top-down, waterfall.

### A Poor Craftsman Blames Her Tools ###

Open source invites criticism by laying bare its strengths and weaknesses in a way proprietary software never did. Developers today have a level of accessibility to the code they use that previous generations of developers lacked, with a megaphone (the Internet) that allows them to broadcast complaints about that code.

But let’s not lose sight of just how blessed we are to have this code, or forget our obligation to apply it appropriately in order to be successful. In other words, read the documentation before you complain that open-source software doesn’t “work.” More often than not, it works just fine, but not for the ill-conceived purpose you have in mind.

--------------------------------------------------------------------------------

via: http://readwrite.com/2013/11/26/are-open-source-developers-too-demanding#awesm=~ooy2qPfuR2PvIx

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://readwrite.com/2013/11/26/%E2%80%9Chttp://www.hipyoungstartup.com/2013/11/we-should-ditch-nginx/%E2%80%9C
[2]:https://twitter.com/bloudermilk
[3]:http://www.hipyoungstartup.com/2013/11/we-should-ditch-nginx/#comment-17
[4]:http://readwrite.com/2013/11/26/%E2%80%9Chttp://java.dzone.com/articles/why-i-never-blame-open-source%E2%80%9D
[5]:http://gigaom.com/2013/11/25/how-the-use-of-a-nosql-database-played-a-role-in-the-healthcare-gov-snafu/
[6]:http://developers.slashdot.org/story/13/11/24/1437203/nyt-healthcaregov-project-chaos-due-partly-to-unorthodox-database-choice
[7]:http://readwrite.com/2013/11/04/sorry-open-source-isnt-the-panacea-for-healthcaregov#awesm=~oojDQ8fiVXrjGP
[8]:http://digital.cabinetoffice.gov.uk/colophon-beta/