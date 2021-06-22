[#]: subject: (How Real-World Apps Lose Data)
[#]: via: (https://theartofmachinery.com/2021/06/06/how_apps_lose_data.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)
[#]: collector: (lujun9972)
[#]: translator: (PearFL)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How Real-World Apps Lose Data
======

A great thing about modern app development is that there are cloud providers to worry about things like hardware failures or how to set up RAID. Decent cloud providers are extremely unlikely to lose your app’s data, so sometimes I get asked what backups are really for these days. Here are some real-world stories that show exactly what.

### Story #1

This first story is from a data science project: it was basically a big, complex pipeline that took data collected from ongoing research and crunched it in various ways to feed some cutting-edge model. The user-facing application hadn’t been launched yet, but a team of data scientists and developers had been working on building the model and its dataset for several months.

The people working on the project had their own development environments for experimental work. They’d do something like `export ENVIRONMENT=simonsdev` in a terminal, and then all the software running in that terminal would run against that environment instead of the production environment.

The team was under a lot of pressure to get a user-facing app launched so that stakeholders could actually see some results from their several months of investment. One Saturday, an engineer tried to catch up with some work. He finished an experiment he was doing late in the evening, and decided to tidy up and go home. He fired off a cleanup script to delete everything from his development environment, but strangely it took a lot longer than usual. That’s when he realised he’d lost track of which terminal was configured to point to which environment.

### Story #2

Story #2 is from a commercial web and mobile app. The backend had a microservice architecture worked on by a team of engineers. That meant deployments required co-ordination, but things were simplified a bit using a formal release process and automation. New code would get reviewed and merged into master when ready, and every so often a senior developer would tag a release for each microservice, which would then automatically deploy to the staging environment. The releases in the staging environment would periodically get collected together into a meta-release that got signoff from various people (it was a compliance environment) before being automatically deployed to production.

One day a developer was working on a complex feature, and the other developers working on that microservice agreed that the work-in-progress code should be committed to master with the understanding that it shouldn’t be actually released yet. To cut a long story short, not everyone in the team got the message, and the code got into the release pipeline. Worse, the experimental code required a new way to represent user profile data, so it had an ad-hoc data migration that ran on launch into production and corrupted all user profiles.

### Story #3

Story #3 is from another web app. This one had a much simpler architecture: most of the code was in one app, and the data was in a database. However, this app had also been written under a lot of deadline pressure. It turned out that early on in development, when radical database schema changes were common, a feature was added to detect such changes and clean up old data. This was actually useful for early development before launch, and was always meant to be a temporary feature for development environments only. Unfortunately, the code was forgotten about in the rush to build the rest of the app and get to launch. Until, of course, one day it got triggered in the production environment.

### Postmortem

With any outage postmortem, it’s easy to lose sight of the big picture and end up blaming everything on some little detail. A special case of that is finding some mistake someone made and then blaming that person. All of the engineers in these stories were actually good engineers (companies that hire SRE consultants aren’t the ones to cut corners with their permanent hires), so firing them and replacing them wouldn’t have solved any problem. Even if you have 100x developers, that 100x is still finite, so mistakes will happen with enough complexity and pressure. The big-picture solution is back ups, which help you however you lose the data (including from malware, which is a hot topic in the news lately). If you’re not okay with having zero copies of it, don’t have one copy.

Story #1 had a bad end: there were no backups. The project was set back by nearly six months of data collection. By the way, some places only keep a single daily snapshot as a backup, and this story is a good example of how that can go wrong, too: if the data loss happened on Saturday and recovery was attempted on Monday, the one-day backup would only have an empty database from the Sunday.

Story #2 wasn’t fun, but worked out much better. Backups were available, but the data migration was reversible, too. The unfun part was that the release was done just before lunch and the fix had to be coded up while the production site was down. The main reason I’m telling this story is as a reminder that backups aren’t just about catastrophic data loss. Partial data corruption happens, too, and can be extra messy.

Story #3 was so-so. A small amount of data was lost permanently, but most was recovered from the backup. Everyone on the team felt pretty bad about not flagging the now-extremely-obviously-dangerous code. I wasn’t involved in the early development, but I felt bad because the recovery took a lot longer than it should have. With a well-tested recovery process, I think the site should have been back online in under 15mins total. But the recovery didn’t work first time, and I had to debug why not and retry. When a production site is down and it’s on you to get it up again, every 10s feels like an eternity. Thankfully, the stakeholders were much more understanding than some. They were actually relieved that a one-off disaster that could have sunk the company only resulted in minutes of lost data and under an hour of downtime.

It’s extremely common in practice for the backup to “work” but the recovery to fail. Often the recovery works when tested on small datasets, but fails on production-sized datasets. Disaster is most likely to strike when everyone is stressed out, and having the production site down only increases the pressure. It’s a really good idea to test and document the full recovery process while times are good.
--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2021/06/06/how_apps_lose_data.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
