(translating by runningwater)
2015: Open Source Has Won, But It Isn't Finished
================================================================================
> After the wins of 2014, what's next?

At the beginning of a new year, it's traditional to look back over the last 12 months. But as far as this column is concerned, it's easy to summarise what happened then: open source has won. Let's take it from the top:

**Supercomputers**. Linux is so dominant on the Top 500 Supercomputers lists it is almost embarrassing. The [November 2014 figures][1] show that 485 of the top 500 systems were running some form of Linux; Windows runs on just one. Things are even more impressive if you look at the numbers of cores involved. Here, Linux is to be found on 22,851,693 of them, while Windows is on just 30,720; what that means is that not only does Linux dominate, it is particularly strong on the bigger systems.

**Cloud computing**. The Linux Foundation produced an interesting [report][2] last year, which looked at the use of Linux in the cloud by large companies. It found that 75% of them use Linux as their primary platform there, against just 23% that use Windows. It's hard to translate that into market share, since the mix between cloud and non-cloud needs to be factored in; however, given the current popularity of cloud computing, it's safe to say that the use of Linux is high and increasing. Indeed, the same survey found Linux deployments in the cloud have increased from 65% to 79%, while those for Windows have fallen from 45% to 36%. Of course, some may not regard the Linux Foundation as totaly disinterested here, but even allowing for that, and for statistical uncertainties, it's pretty clear which direction things are moving in.

**Web servers**. Open source has dominated this sector for nearly 20 years - an astonishing record. However, more recently there's been some interesting movement in market share: at one point, Microsoft's IIS managed to overtake Apache in terms of the total number of Web servers. But as Netcraft explains in its most recent [analysis][3], there's more than meets the eye here:

> This is the second month in a row where there has been a large drop in the total number of websites, giving this month the lowest count since January. As was the case in November, the loss has been concentrated at just a small number of hosting companies, with the ten largest drops accounting for over 52 million hostnames. The active sites and web facing computers metrics were not affected by the loss, with the sites involved being mostly advertising linkfarms, having very little unique content. The majority of these sites were running on Microsoft IIS, causing it to overtake Apache in the July 2014 survey. However the recent losses have resulted in its market share dropping to 29.8%, leaving it now over 10 percentage points behind Apache.

As that indicates, Microsoft's "surge" was more apparent than real, and largely based on linkfarms with little useful content. Indeed, Netcraft's figures for active sites paints a very different picture: Apache has 50.57% market share, with nginx second on 14.73%; Microsoft IIS limps in with a rather feeble 11.72%. This means that open source has around 65% of the active Web server market - not quite at the supercomputer level, but pretty good.

**Mobile systems**. Here, the march of open source as the foundation of Android continues. Latest figures show that Android accounted for [83.6%][4] of smartphone shipments in the third quarter of 2014, up from 81.4% in the same quarter the previous year. Apple achieved 12.3%, down from 13.4%. As far as tablets are concerned, Android is following a similar trajectory: for the second quarter of 2014, Android notched up around [75% of global tablet sales][5], while Apple was on 25%.

**Embedded systems**. Although it's much harder to quantify the market share of Linux in the important embedded system market, but figures from one 2013 study indicated that around [half of planned embedded systems][6] would use it.

**Internet of Things**. In many ways this is simply another incarnation of embedded systems, with the difference that they are designed to be online, all the time. It's too early to talk of market share, but as I've [discussed][7] recently, AllSeen's open source framework is coming on apace. What's striking by their absence are any credible closed-source rivals; it therefore seems highly likely that the Internet of Things will see supercomputer-like levels of open source adoption.

Of course, this level of success always begs the question: where do we go from here? Given that open source is approaching saturation levels of success in many sectors, surely the only way is down? In answer to that question, I recommend a thought-provoking essay from 2013 written by Christopher Kelty for the Journal of Peer Production, with the intriguing title of "[There is no free software.][8]" Here's how it begins:

> Free software does not exist. This is sad for me, since I wrote a whole book about it. But it was also a point I tried to make in my book. Free software—and its doppelganger open source—is constantly becoming. Its existence is not one of stability, permanence, or persistence through time, and this is part of its power.

In other words, whatever amazing free software 2014 has already brought us, we can be sure that 2015 will be full of yet more of it, as it continues its never-ending evolution.

--------------------------------------------------------------------------------

via: http://www.computerworlduk.com/blogs/open-enterprise/open-source-has-won-3592314/

作者：[lyn Moody][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.computerworlduk.com/author/glyn-moody/
[1]:http://www.top500.org/statistics/list/
[2]:http://www.linuxfoundation.org/publications/linux-foundation/linux-end-user-trends-report-2014
[3]:http://news.netcraft.com/archives/2014/12/18/december-2014-web-server-survey.html
[4]:http://www.cnet.com/news/android-stays-unbeatable-in-smartphone-market-for-now/
[5]:http://timesofindia.indiatimes.com/tech/tech-news/Android-tablet-market-share-hits-70-in-Q2-iPads-slip-to-25-Survey/articleshow/38966512.cms
[6]:http://linuxgizmos.com/embedded-developers-prefer-linux-love-android/
[7]:http://www.computerworlduk.com/blogs/open-enterprise/allseen-3591023/
[8]:http://peerproduction.net/issues/issue-3-free-software-epistemics/debate/there-is-no-free-software/
