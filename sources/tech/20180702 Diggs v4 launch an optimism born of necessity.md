Digg's v4 launch: an optimism born of necessity.
============================================================

![](https://lethain.com/static/blog/heroes/digg-v4.jpg)

Digg was having a rough year. Our CEO left the day before I joined. Senior engineers ghosted out the door, dampening productivity and pulling their remaining friends. Fraudulent voting rings circumvented our algorithms, selling access to our front page, and threatening our lives over modifications to prevent their abuse. Our provisioning tools for developer environments broke and no one knew how to fix them, so we reassigned new hires the zombie VMs of recently departed coworkers.

But today wasn't about any of that. Today was reserved for the reversal of the biggest problem that had haunted Digg for the last two years. We were launching a complete rewrite of Digg. We were committed to launching today. We were agreed against further postponing the launch. We were pretty sure the new version, version four, wasn't ready.

The day started. We were naive. Our education lay in wait.

If you'd been fortunate enough to be invited into our cavernous, converted warehouse of an office and felt the buzz, you'd probably guess a celebration was underway. The rewrite from Digg v3.5 to Digg v4 had marched haphazardly forward for nearly two years, and promised to move us from a monolithic community-driven news aggregator to an infinitely personalized aggregator driven by blending your social graph, top influencers, and the global zeitgeist of news.

If our product requirements had continued to flux well into the preceding week, the path to Digg v4 had been clearly established several years earlier, when Digg had been devastated by [Google's Panda algorithm update][3]. As that search update took a leisurely month to soak into effect, our fortunes reversed like we'd spat on the gods: we fell from our first--and only--profitable month, and kept falling until our monthly traffic was severed in half. One month, a company culminating a five year path to profitability, the next a company in freefall and about to fundraise from a position of weakness.

Launching v4 was our chance to return to our rightful place among the giants of the internet, and the cavernous office, known by employees as "Murder Church", had been lovingly rearranged for the day. In the middle of the room, an immense wooden table had been positioned to serve as the "war room." It was framed by a ring of couches, where others would stand by to assist. Waiters in black tie attire walked the room with trays of sushi, exquisite small bites and chilled champagne. A bar had been erected, serving drinks of all shapes. Folks slipped upstairs to catch a few games of ping pong.

The problems started slowly.

At one point, an ebullient engineer had declared the entire rewrite could run on two servers and, our minimalist QA environment being much larger to the contrary, we got remarkably close to launching with two servers as our most accurate estimate. The week before launch, the capacity planning project was shifted to Rich and I. We put on a brave farce of installing JMeter and generated as much performance data as we could against the complex, dense and rapidly shifting sands that comprised the rewrite. It was not the least confident I've ever been in my work, I can remember writing a book report on the bus to school about a book I never read in fourth grade, but it is possible we were launching without much sense of whether this was going to work.

We had the suspicion it wouldn't matter much anyway, because we weren't going to be able to order and install new hardware in our datacenters before the launch. Capacity would suffice because it was all we had.

Around 10:00 AM, someone asked when we were going to start the switch, and Mike chimed in helpfully, "We've already started reprovisioning the v3 servers." We had so little capacity that we had decided to reimage all our existing servers and then reprovision them in the new software stack. This was clever from the perspective of reducing our costs, but the optimism it entailed was tinged with madness.

As the flames of rebirth swallowed the previous infrastructure, something curious happened, or perhaps didn't happen. The new site didn't really come up. The operations team rushed out a maintenance page and we collected ourselves around our handsome wooden table, expensive chairs and gnawing sense of dread. This was  _not_  going well. We didn't have a rollback plan. The random self-selection of engineers at the table decided our only possible option was to continue rolling forward, and we did. An hour later, the old infrastructure was entirely gone, replaced by the Digg version four.

Servers reprovisioning, maintenance page cajoling visitors, the office took on a "last days of rome" atmosphere. The champagne and open bar flowed, the ping pong table was fully occupied, and the rest of the company looked on, unsure how to help, and coming to terms that Digg's final hail mary had been fumbled. The framed Forbes cover in the lobby firmly a legacy, and assuredly not a harbinger.

The day stretched on, and folks began to leave, but for the engineers swarming the central table, there was much left to do. We had successfully provisioned the new site, but it was still staggering under load, with most pages failing to load. The primary bottleneck was our Cassandra cluster. Rich and I broke off to a conference room and expanded our use of memcache as a write-through-cache shielding Cassandra; a few hours later much of the site started to load for logged out users.

Logged in users, though, were still seeing error pages when they came to the sit. The culprit was the rewrite's crown jewel, called MyNews, which provided social context on which of your friends had interacted with each article, and merged all that activity together into a personalized news feed. Well, that is what was supposed to happen, anyway, at this point what it actually did was throw tasteful "startup blue" error pages.

As the day ended, we changed the default page for users from MyNews to TopNews, the global view which was still loading, which made it possible for users to log in and use the site. The MyNews page would still error out, but it was enough for us to go home, tipsy and defeated, survivors of our relaunch celebration.

Folks trickled into the office early the next day, and we regrouped. MyNews was thoroughly broken, the site was breaking like clockwork every four hours, and behind those core issues, dozens of smaller problems were cropping up as well. We'd learned we could fix the periodic breakage by restarting every single process, we hadn't been able to isolate which ones were the source, so we decided to focus on MyNews first.

Once again, Rich and I sequestered ourselves in a conference room, this time with the goal of rewriting our MyNews implementation from scratch. The current version wrote into Cassandra, and its load was crushing the clusters, breaking the social functionality, and degrading all other functionality around it. We decided to rewrite to store the data in Redis, but there was too much data to store in any server, so we would need to rollout a new implementation, a new sharding strategy, and the tooling to manage that tooling.

And we did!

Over the next two days, we implemented a sharded Redis cluster and migrated over to it successfully. It had some bugs--for the Digg's remaining life, I would clandestinely delete large quantities of data from the MyNews cluster because we couldn't afford to size it correctly to store the necessary data and we couldn't agree what to do about it, so each time I ended up deleting the excess data in secret to keep the site running--but it worked, and our prized rewrite flew out the starting gate to begin limping down the track.

It really was limping though, requiring manual restarts of every process each four hours. It took a month to track this bug down, and by the end only three people were left trying. I became so engrossed in understanding the problem, working with Jorge and Mike on the Operations team, that I don't even know if anyone else came into the office that following month. Not understanding this breakage became an affront, and as most folks dropped off--presumably to start applying for jobs because they had a lick of sense--I was possessed by the obsession to fix it.

And we did!

Our API server was a Python Tornado service, that made API calls into our Python backend tier, known as Bobtail (the frontend was Bobcat), and one of the most frequently accessed endpoint was used to retrieve user by their name or id. Because it supported retrieval by either name or id, it set default values for both parameters as empty lists. This is a super reasonable thing to do! However, Python only initializes default parameters when the function is first evaluated, which means that the same list is used for every call to the function. As a result, if you mutate those values, the mutations span across invocations.

In this case, user ids and names were appended to the default lists each time it was called. Over hours, those lists began to retrieve tens of thousands of users on each request, overwhelming even the memcache clusters. This took so long to catch because we returned the values as a dictionary, and the dictionary always included the necessary values, it just happened to also include tens of thousands of extraneous values too, so it never failed in an obvious way. The bug's impact was amplified because we assumed users wouldn't pass in duplicate ids, and would cheerfully retrieve the same id repeatedly for a single request.

We rolled out that final critical fix, and Digg V4 was fully launched. A week later our final CEO would join. A month later we'd have our third round of layoffs. A year later we would sell the company. But for that moment, we'd won.

I was about to hit my six month anniversary.

* * *

Digg V4 is sometimes referenced as an example of a catastrophic launch, with an implied lesson that we shouldn't have launched it. At one point, I used to agree, but these days I think we made the right decision to launch. Our traffic was significantly down, we were losing a bunch of money each month, we had recently raised money and knew we couldn't easily raise more. If we'd had the choice between launching something great and something awful, we'd have preferred to launch something great, but instead we had the choice of taking one last swing or turning in our bat quietly.

I'm glad we took the last swing; proud we survived the rough launch.

On the other hand, I'm still shocked that we were so reckless in the launch itself. I remember the meeting where we decided to go ahead with the launch, with Mike vigorously protesting. To the best of my recollection, I remained silent. I hope that I grew from the experience, because even now uncertain how such a talented group put on such a display of fuckery.

--------------------------------------------------------------------------------

作者简介：

Hi. I grew up in North Carolina, studied CS at Centre College in Kentucky, spent a year in Japan on the JET Program, and have been living in San Francisco since 2009 or so.

Since coming out here, I've gotten to work at some great companies, and some of them were even good when I worked there! Starting with Yahoo! BOSS, Digg, SocialCode, Uber and now Stripe.

A long time ago, I also cofounded a really misguided iOS gaming startup with Luke Hatcher. We made thousands of dollars over six months, and spent the next six years trying to figure out how to stop paying taxes. It was a bit of a missed opportunity.

The very first iteration of Irrational Exuberance was created the summer after I graduated from college, and I've been publishing to it off and on since. Early on there was a heavy focus on Django, Python and Japan; lately it's more about infrastructure, architecture and engineering management.

It's hard to predict what it'll look like in the future.

-----------------------------

via: https://lethain.com/digg-v4/

作者：[Will Larson.][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://lethain.com/about/
[1]:https://lethain.com/tags/stories/
[2]:https://lethain.com/tags/digg/
[3]:https://moz.com/learn/seo/google-panda
