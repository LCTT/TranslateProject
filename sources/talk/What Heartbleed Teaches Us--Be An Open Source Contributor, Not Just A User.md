What Heartbleed Teaches Us: Be An Open Source Contributor, Not Just A User
================================================================================
![](http://readwrite.com/files/styles/1400_0/public/fields/heart-shaped-hole-heartbleed.jpg)

> If your company depends on open-source software like OpenSSL, it's time to be proactive.

The open-source community has officially donned its Heartbleed hairshirt.

ComputerWorld's Richi Jennings [slammed][1] "another horrible, horrible open source FAIL." (Trolling for page views much?) ZDNet's Steven J. Vaughan-Nichols, not prone to anti-open source histrionics, still [manages to call][2] Heartbleed "Open source's worst hour." Finally, ZDNet's Chris Duckett pragmatically [pleads][3] for "corporate funding to avoid Heartbleed repeat."

While a nice start, corporate funding isn't ultimately the answer to Heartbleed. You are.

Companies that want to avoid open source failings should move from being mere users of open-source software and contribute instead.

### Contributors Ride First Class ###

Contributors get to help steer particular projects. They get to act, rather than be acted upon. Most companies lack the resources to get involved in every open-source project that they use, but every company can invest in those projects that truly matter to them. And the more they invest, the greater their benefits.

Open source is the gift that keeps on giving—particularly to those who give back.

My MongoDB colleague [Adam Comerford makes this point][4] persuasively: If you look at the [timeline][5] of who knew about Heartbleed first, those who learned of it first (like Google) had a considerable advantage. As Comerford argues, these companies "had a significant advantage" as "[t]hey were able to take the necessary steps to protect their systems while the bug was largely unknown." 

Given the advantages of knowing early about problems like Heartbleed, Comerford asks, "How do I make sure that I am on the early notification list for such issues?"

If you're dependent on proprietary software, you have one answer: Pay the vendor lots of money and hope it responds appropriately. But if you're using open-source software, the options expand: "Either have a significant number of employees contributing to [the open-source project], or...have employees that know the main contributors well (and let’s face it, most of them will be contributing to other OSS projects—geeks and nerds gossip just like everyone else)."

The benefits don't stop there, as Comerford avers:

> There are many benefits to this – besides getting early notification of issues, you would have an expert on hand to answer those screaming for updates, to evaluate your exposure and perhaps even fix the issue internally before the public fix is available.  You also get a respected voice in terms of setting the direction of the project, have a way to prioritize key features and more.  Finally, you get the good will of the community, help make the product better for everyone, and become a possible destination for other smart contributors to work.

In other words, get involved. Membership has its privileges, and the primary privilege may well be information.

### Choosing Where To Contribute ###

Again, no company has the resources to effectively contribute to all the projects it uses, which is why Comerford suggests honing in on the critical projects in this way:

> If you start by asking people to list all of the OSS technology that is critical to the business, you will likely end up with a massive list. Now tell them that they are going to have to commit headcount, budget to support every piece of technology on the list (and justify it) – it will likely shrink rapidly.

If you're a chip company like AMD, contributing essential drivers and other code to the Linux kernel is likely mandatory. Contributing to LibreOffice probably is not. Or, if you're betting your future on Hadoop for deep data analytics, you should be contributing to Hadoop, even if you elect to free-ride on the OpenSSL community. And if you're Dish Networks, whose [CIO told the Open Business Conference crowd][6] last week that it's shifting important workloads off relational databases to Apache Kafka, it had better be investing code in Kafka, even if it doesn't contribute to the Apache HTTP server project.

Every company has its priorities, and those priorities should be substantiated with serious commitments to open source. 

This is partly a way to ensure security in those projects. And partly it's a way to influence direction. But also, as Red Hat CEO [Jim Whitehurst declared][7] back in 2008, it's a way to reduce incredibly wasteful IT spending:

> The vast majority of software written today is written in enterprise and not for resale. And the vast majority of that is never actually used. The waste in IT software development is extraordinary....Ultimately, for open source to provide value to all of our customers worldwide, we need to get our customers not only as users of open source products but truly engaged in open source and taking part in the development community.

Comerford insists, "If I am using open source software that is critical to my business, I should be employing people that actively contribute to that software, that are known to the core developers, if not core developers themselves." This is the key to making the most of open-source software: Contribute to it, don't just use it.

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/05/14/heartbleed-open-source-contribution-users

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://blogs.computerworld.com/encryption/23767/heartbleed-openssl-open-source-fail
[2]:http://www.zdnet.com/heartbleed-open-sources-worst-hour-7000028420/
[3]:http://www.zdnet.com/openssl-needs-corporate-funding-to-avoid-heartbleed-repeat-7000028385/
[4]:http://comerford.cc/wordpress/2014/04/15/my-conclusion-heartbleed-timeline/
[5]:http://www.smh.com.au/it-pro/security-it/heartbleed-disclosure-timeline-who-knew-what-and-when-20140415-zqurk.html
[6]:http://blogs.wsj.com/cio/2014/05/06/dish-looks-to-open-source-software-after-database-failure/
[7]:http://www.cnet.com/news/red-hat-solve-enterprise-waste-through-open-source/