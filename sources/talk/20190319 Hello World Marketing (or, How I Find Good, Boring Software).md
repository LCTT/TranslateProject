[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Hello World Marketing (or, How I Find Good, Boring Software))
[#]: via: (https://theartofmachinery.com/2019/03/19/hello_world_marketing.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Hello World Marketing (or, How I Find Good, Boring Software)
======

Back in 2001 Joel Spolsky wrote his classic essay [“Good Software Takes Ten Years. Get Used To it”][1]. Nothing much has changed since then: software is still taking around a decade of development to get good, and the industry is still getting used to that fact. Unfortunately, the industry has investors who want to see hockey stick growth rates on software that’s a year old or less. The result is an antipattern I like to call “Hello World Marketing”. Once you start to notice it, you see it everywhere, and it’s a huge red flag when choosing software tools.


Of course, by “Hello World”, I’m referring to the programmer’s traditional first program: the one that just displays the message “Hello World”. The aim isn’t to make a useful program; it’s to make a minimal starting point.

Hello World Marketing is about doing the same thing, but pretending that it’s useful. You’re supposed to be distracted into admiring how neatly a tool solves trivial problems, and forget about features you’ll need in real applications. HWM emphasises what can be done in the first five minutes, and downplays what you might need after several months. HWMed software is optimised for looking good in demos, and sounding exciting in blog posts and presentations.

For a good example, see Nemil Dalal’s [great series of articles about the early marketing for MongoDB][2]. Notice the heavy use of hackathons, and that a lot of the marketing was about how “SQL looks like COBOL”. Now, I can criticise SQL, too, but if `SELECT` and `WHERE` are serious problems for an application, there are already hundreds of solutions like [SQLAlchemy][3] and [LINQ][4] — solutions that don’t compromise on more advanced features of traditional databases. On the other hand, if you were wondering about those advanced features, you could read vomity-worthy, hand-wavey pieces like “[Living in the post-transactional database future][5]”.

### How I Find Good, Boring Software

Obviously, one way to avoid HWM is to stick to software that’s much more than ten years old, and has a good reputation. But sometimes that’s not possible because the tools for a problem only came out during the last decade. Also, sometimes newer tools really do bring new benefits.

However, it’s much harder to rely on reputation for newer software because “good reputation” often just means “popular”, which often just means “current fad”. Thankfully, there’s a simple and effective trick to avoid being dazzled by hype: just look elsewhere. Instead of looking at the marketing for the core features, look at the things that are usually forgotten. Here are the kinds of things I look at:

#### Backups and Disaster Recovery

Backup support is both super important and regularly an afterthought.

The minimum viable product is full data dump/import functionality, but longer term it’s nice to have things like incremental backups. Some vendors will try to tell you to just copy the data files from disk, but this isn’t guaranteed to give you a consistent snapshot if the software is running live.

There’s no point backing up data if you can’t restore it, and restoration is the difficult part. Yet many people never test the restoration (until they actually need it). About five years ago I was working with a team that had started using a new, cutting-edge, big-data database. The database looked pretty good, but I suggested we do an end-to-end test of the backup support. We loaded a cluster with one of the multi-terabyte datasets we had, did a backup, wiped the data in the cluster and then tried to restore it. Turns out we were the first people to actually try to restore a dataset of that size — the backup “worked”, but the restoration caused the cluster to crash and burn. We filed a bug report with the original database developers and they fixed it.

Backup processes that work on small test datasets but fail on large production datasets is a recurring theme. I always recommend testing on production-sized datasets, and testing again as production data grows.

For batch jobs, a related concept is restartability. If you’re copying large amounts of data from one place to another, and the job gets interrupted in the middle, what happens? Can you keep going from the middle? Alternatively, can you safely retry by starting from the beginning?

#### Configuration

A lot of HWMed software can only be configured using a GUI or web UI because that’s what’s obvious and looks good in demos and docs. For one thing, this usually means there’s no good way to back up or restore the configuration. So if a team of people use a shared instance over a year or so, forget about trying to restore it if (or when) it breaks. It’s also much more work to keep multiple deployments consistent (e.g., for dev, testing and prod environments) using separate GUIs. In practice, it just doesn’t happen.

I prefer a well-commented config file for software I deploy, if nothing else because it can be checked into source control, and I know I can reproduce the deployment using nothing but what’s checked into source control. If something is configured using a UI, I look for a config export/import function. Even then, that feature is often an afterthought, and often imcomplete, so it’s worth testing if it’s possible to deploy the software without ever needing to manually tweak something in the UI.

There seems to be a recent trend for software to be configured using a REST API instead. Honestly, this is the worst of both config files and GUI-based config, and most of the time people end up using [hacky ways to put the config into a file instead][6].

#### Upgrades

Life would be much easier if everything were static; software upgrade support makes everything more complicated. It’s also not usually shown in demos, so the first upgrade often ends the honeymoon with shiny, new software.

For HA distributed systems, you’ll need support for graceful shutdown and a certain amount of forward _and_ backwards compatibility (because you’ll have multiple versions running during upgrades). It’s a common mistake to forget about downgrade support.

Distributed systems are simpler when components have independent replicas that don’t communicate with each other. Anything with clustering (or, worse, consensus algorithms) is often extra tricky to upgrade, and worth testing.

Things that support horizontal scaling don’t necessarily support rescaling without downtime. This is especially true whenever sharding is involved because live resharding isn’t trivial.

Here’s a story from a certain popular container app platform. Demos showed how easy it was to launch an app on the platform, and then showed how easy it was to scale it to multiple replicas. What they didn’t show was the upgrade process: When you pushed a new version of your app, the first thing the platform did was _shut down all running instances of it_. Then it would upload the code to a build server and start building it — meaning downtime for however long the build took, plus the time needed to roll out the new version (if it worked). This problem has been fixed in newer releases of the platform.

#### Security

Even if software has no built-in access control, all-or-nothing access control is easy to implement (e.g., using a reverse proxy with HTTP basic auth). The harder problem is fine-grained access control. Sometimes you don’t care, but in some environments it makes a big difference to what features you can even use.

Some immature software has a quick-and-dirty implementation of user-based access control, typically with a GUI for user management. For everything except the core business tool, this isn’t very useful. For human users, every project I’ve worked on has either been with a small team that just shared a single username/password, or with a large team that wanted integration with OpenID Connect, or LDAP, or whatever centralised single-sign-on (SSO) system was used by the organisation. No one wants to manually manage credentials for every tool, every time someone joins or leaves. Similarly, credentials for applications or other non-human users are better generated using an automatable approach — like a config file or API.

Immature implementations of access control are often missing anything like user groups, but managing permissions at the user level is a time waster. Some SSO integrations only integrate users, not groups, which is a “so close yet so far” when it comes to avoiding permissions busywork.

#### Others

I talked about ignoring the hype, but there’s one good signal you can get from the marketing: whether the software is branded as “enterprise” software. Enterprise software is normally bought by someone other than the end user, so it’s usually pleasant to buy but horrible to use. The only exceptions I know of are enterprise versions of normal consumer software, and enterprise software that the buyer will also have to use. Be warned: even if a company sells enterprise software alongside consumer software, there’s no guarantee that they’re just different versions of the same product. Often they’ll be developed by separate teams with different priorities.

A lot of the stuff in this post can be checked just by skimming through the documentation. If a tool stores data, but the documentation doesn’t mention backups, there probably isn’t any backup suppport. Even if there is and it’s just not documented, that’s not exactly a good sign either. So, sure, documentation quality is worth evaluating by itself. On the other hand, sometimes the documentation is better than the product, so I never trust a tool until I’ve actually tried it out.

When I first saw Python, I knew that it was a terrible programming language because of the way it used whitespace indentation. Yeah, that was stupid. Later on I learned that 1) the syntax wasn’t a big deal, especially when I’m already indenting C-like languages in the same way, and 2) a lot of practical problems can be solved just by gluing libraries together with a few dozen lines of Python, and that was really useful. We often have strong opinions about syntax that are just prejudice. Syntax can matter, but it’s less important than how the tool integrates with the rest of the system.

### Weighing Pros and Cons

You never need to do deep analysis to detect the most overhyped products. Just check a few of these things and they’ll fail spectacularly.

Even with software that looks solid, I still like to do more tests before entrusting a serious project with it. That’s not because I’m looking for excuses to nitpick and use my favourite tool instead. New tools often really do bring new benefits. But it’s much better to understand the pros and cons of new software, and to use it because the pros outweigh the cons, not because of how slick the Hello World demo is.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2019/03/19/hello_world_marketing.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://www.joelonsoftware.com/2001/07/21/good-software-takes-ten-years-get-used-to-it/
[2]: https://www.nemil.com/mongo/
[3]: https://www.sqlalchemy.org/
[4]: https://msdn.microsoft.com/en-us/library/bb308959.aspx
[5]: https://www.mongodb.com/post/36151042528/post-transactional-future
[6]: /2017/07/15/use_terraform_with_vault.html
