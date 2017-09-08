translating---geekpi

Creating better disaster recovery plans
============================================================

Five questions for Tanya Reilly: How service interdependencies make recovery harder and why it’s a good idea to deliberately and preemptively manage dependencies.

[Register for the O'Reilly Velocity Conference][5] to join Tanya Reilly and other industry experts. Use code ORM20 to save 20% on your conference pass (Gold, Silver, and Bronze passes).

I recently asked Tanya Reilly, Site Reliability Engineer at Google, to share her thoughts on how to make better disaster recovery plans. Tanya is presenting a session titled  [_Have you tried turning it off and turning it on again?_][9]  at the O’Reilly Velocity Conference, taking place Oct. 1-4 in New York.

### 1\. What are the most common mistakes people make when planning their backup systems strategy?

The classic line is "you don't need a backup strategy, you need a restore strategy." If you have backups, but you haven't tested restoring them, you don't really have backups. Testing doesn't just mean knowing you can get the data back; it means knowing how to put it back into the database, how to handle incremental changes, how to reinstall the whole thing if you need to. It means being sure that your recovery path doesn't rely on some system that could be lost at the same time as the data.

But testing restores is tedious. It's the sort of thing that people will cut corners on if they're busy. It's worth taking the time to make it as simple and painless and automated as possible; never rely on human willpower for anything! At the same time, you have to be sure that the people involved know what to do, so it's good to plan regular wide-scale disaster tests. Recovery exercises are a great way to find out that the documentation for the process is missing or out of date, or that you don't have enough resources (disk, network, etc.) to transfer and reinsert the data.

### 2\. What are the most common challenges in creating a disaster recovery (DR) plan?

I think a lot of DR is an afterthought: "We have this great system, and our business relies on it ... I guess we should do DR for it?" And by that point, the system is extremely complex, full of interdependencies and hard to duplicate.

The first time something is installed, it's often hand-crafted by a human who is tweaking things and getting it right, and sometimes that's the version that sticks around. When you build the  _second_  one, it's hard to be sure it's exactly the same. Even in sites with serious config management, you can leave something out, or let it get out of date.

Encrypted backups aren't much use if you've lost access to the decryption key, for example. And any parts that are only used in a disaster may have bit-rotted since you last checked in on them. The only way to be sure you've covered everything is to fail over in earnest. Plan your disaster for a time when you're ready for it!

It's better if you can design the system so that the disaster recovery modes are part of normal operation. If your service is designed from the start to be replicated, adding more replicas is a regular operation and probably automated. There are no new pathways; it's just a capacity problem. But there can still be some forgotten components of the system that only run in one or two places. An occasional scheduled fake disaster is good for shaking those out.

By the way, those forgotten components could include information that's only in one person's brain, so if you find yourself saying, "We can't do our DR failover test until X is back from vacation," then that person is a dangerous single point of failure.

Parts of the system that are only used in disasters need the most testing, or they'll fail you when you need them. The fewer of those you have, the safer you are and the less toilsome testing you have to do.

### 3\. Why do service interdependencies make recovery harder after a disaster?

If you've got just one binary, then recovering it is relatively easy: you start that binary back up. But we increasingly break out common functionality into separate services. Microservices mean we have more flexibility and less reinvention of wheels: if we need a backend to do something and one already exists, great, we can just use that. But someone needs to keep a big picture of what depends on what, because it can get very tangled very fast.

#### MANAGE, GROW, AND EVOLVE YOUR SYSTEMS


You may know what backends you use directly, but you might not notice when new ones are added into libraries you use. You might depend on something that also indirectly depends on you. After an outage, you can end up with a deadlock: two systems that each can't start until the other is running and providing some functionality. It's a hard situation to recover from!

You can even end up with things that indirectly depend on themselves—for example, a device that you need to configure to bring up the network, but you can't get to it while the network is down. Often people have thought about these circular dependencies in advance and have some sort of fallback plan, but those are inherently the road less traveled: they're only intended to be used in extreme cases, and they follow a different path through your systems or processes or code. This means they're more likely to have a bug that won't be uncovered until you really, really need them to work.

### 4\. You advise people to start deliberately managing their dependencies long before they think they need to in order to ward off potentially catastrophic system failure. Why is this important and what’s your advice for doing it effectively?

Managing your dependencies is essential for being sure you can recover from a disaster. It makes operating the systems easier too. If your dependencies aren't reliable, you can't be reliable, so you need to know what they are.

It's possible to start managing dependencies after they've become chaotic, but it's much, much easier if you start early. You can set policies on the use of various services—for example, you must be this high in the stack to depend on this set of systems. You can introduce a culture of thinking about dependencies by making it a regular part of design document review. But bear in mind that lists of dependencies will quickly become stale; it's best if you have programmatic dependency discovery, and even dependency enforcement. [My Velocity talk][10] covers more about how we do that.

The other advantage of starting early is that you can split up your services into vertical "strata," where the functionality in each stratum must be able to come completely online before the next one begins. So, for example, you could say that the network has to be able to completely start up without using any other services. Then, say, your storage systems should depend on nothing but the network, the application backends should only depend on network and storage, and so on. Different strata will make sense for different architectures.

If you plan this in advance, it's much easier for new services to choose dependencies. Each one should only depend on services lower in the stack. You can still end up with cycles—things in the same stratum depending on each other—but they're more tightly contained and easier to deal with on a case-by-case basis.

### 5\. What other parts of the program for Velocity NY are of interest to you?

I've got my whole Tuesday and Wednesday schedule completely worked out! As you might have gathered, I care a lot about making huge interdependent systems manageable, so I'm looking forward to hearing [Carin Meier's thoughts on managing system complexity][11], [Sarah Wells on microservices][12] and [Baron Schwartz on observability][13]. I'm fascinated to hear [Jon Moore's story][14] on how Comcast went from yearly release cycles to releasing daily. And as an ex-sysadmin, I'm looking forward to hearing [where Bryan Liles sees that role going][15].

--------------------------------------------------------------------------------

作者简介：

Nikki McDonald

Nikki McDonald is a content director at O'Reilly Media, Inc. She lives in Ann Arbor, Michigan.

Tanya Reilly

Tanya Reilly has been a Systems Administrator and Site Reliability Engineer at Google since 2005, working on low-level infrastructure like distributed locking, load balancing, and bootstrapping. Before Google, she was a Systems Administrator at eircom.net, Ireland’s largest ISP, and before that she was the entire IT Department for a small software house.

----------------------------

via: https://www.oreilly.com/ideas/creating-better-disaster-recovery-plans

作者：[ Nikki McDonald][a],[Tanya Reilly][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.oreilly.com/people/nikki-mcdonald
[b]:https://www.oreilly.com/people/5c97a-tanya-reilly
[1]:https://pixabay.com/en/crane-baukran-load-crane-crane-arm-2436704/
[2]:https://conferences.oreilly.com/velocity/vl-ny?intcmp=il-webops-confreg-reg-vlny17_new_site_right_rail_cta
[3]:https://www.oreilly.com/people/nikki-mcdonald
[4]:https://www.oreilly.com/people/5c97a-tanya-reilly
[5]:https://conferences.oreilly.com/velocity/vl-ny?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_text_cta
[6]:https://www.oreilly.com/ideas/creating-better-disaster-recovery-plans
[7]:https://conferences.oreilly.com/velocity/vl-ny?intcmp=il-webops-confreg-reg-vlny17_new_site_right_rail_cta
[8]:https://conferences.oreilly.com/velocity/vl-ny?intcmp=il-webops-confreg-reg-vlny17_new_site_right_rail_cta
[9]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/61400?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
[10]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/61400?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
[11]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/62779?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
[12]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/61597?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
[13]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/61630?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
[14]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/62733?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
[15]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/62893?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
