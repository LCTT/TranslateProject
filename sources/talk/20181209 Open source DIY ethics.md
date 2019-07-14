[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open source DIY ethics)
[#]: via: (https://arp242.net/weblog/diy.html)
[#]: author: (Martin Tournoij https://arp242.net/)

Open source DIY ethics
======

I moved to New Zealand last week, and as a proper Dutch person one of the first things I did after arriving was getting a bicycle.

I was recommended [a great place][1] where they collect old bikes and provide people with the parts and tools to fix up the bikes. Want a bike? Choose one, fix it, and it’s yours. There are helpful and knowledgable volunteers who will gladly help you and explain how things work, but in the end you’ll have to fix your own bike; they’re not going to do it for you.

I like this DIY attitude; I built my own fixie (which I unfortunately couldn’t bring) years ago and had been maintaining it myself ever since, but there are many different aspects I never touched on (different brake systems, gears, etc.) and fixing my bike with some help and explanation was a useful experience which taught me a thing or two that I’ll be sure to use in the future.

My attitude to open source projects tends to be similar: I’ll gladly assist you or explain things, but you will have to do the work. This is especially true when it comes to feature requests or very specific scenarios.

Open source software is fundamentally a [DIY ethic][2] for many – though not all – people who participate in it. It certainly is for me. I just fix stuff I want myself. Since I take some amount of pride in my work and want things to work well for others I’ll also gladly fix most bugs that are reported, but sometimes people will post an enhancement or feature request and just expect me to implement it. It’s sometimes even combined with a “but project X does it!”-comment. Well, feck off and use project X then (I don’t actually say this, just think it).

I’ve seen more than a few people get frustrated by this attitude especially — though hardly exclusively — in the OpenBSD and suckless communities ([recent example that prompted this post][3]), partly because it’s not infrequently communicated in a somewhat unhelpful fashion (the OpenBSD saying is “shut up and hack”), but also because some people seem to misunderstand what it means to be a maintainer of an open source project. Open source software isn’t a service I provide to the world; it’s something I DIY’d myself and make available to the world because why not?

Some open source software is supported by companies. Only about [14% of the contributions to the Linux kernel are not affiliated with a company][4]. I don’t think this matters: these are companies who are DIY-ing as well.

Are there people who contribute to open source for other reasons? Sure. Some do because they really believe in [Free Software][5], or because they like programming as a hobby. But those are not the majority.

Not all contributions that aren’t code are useless. Sometimes someone will have a great idea for an enhancement or feature that I hadn’t thought of myself and this can be a very valuable contribution. But those types of constructive contributions are usually easy to recognize: they consist of more than just a single paragraph, are respectful, show a clear understanding of what the project is supposed to do, if they don’t understand a certain aspect they’ll ask instead of bombastically claiming that it’s “broken”, and perhaps most importantly, they show a willingness to constructively contribute, rather than just trying to tell you how to run your project.

This attitude isn’t limited to open source; to quote Neil Gaiman when talking about A Song of Ice and Fire fans demanding George R.R. Martin work harder on the next instalment of the series: “[George R.R. Martin is not your bitch][6]”.

I can’t help George with his next book, but I can help with software projects, which is really neat. Not everyone is a computer programmer, but the vast majority of projects I’ve worked on are used exclusively by programmers.

In the two months that it took me to finish this post (cleaning up drafts always takes forever) there have been a number of incidents in various communities that touched upon a mismatch in expectations between open source authors/maintainers and the users. “It’s not fun anymore, you get nothing from maintaining a popular package”, to quote one maintainer, or “I’m frustrated because I can’t handle the volume of emails” to quote another.

The situation would be vastly improved if more people start seeing and treating open source more like the DIY that it is and assume responsibility for that bug you’ve encountered or enhancement you want, rather than offloading all responsibility to the maintainer. This won’t fix everything, but it’s a good start. Note that plenty of people — including myself — already do this.

Both authors and users will benefit; authors will be frustrated less with “entitled” users, and users will be frustrated less by “rude” authors, and in the end the software will work better as users will be more willing to spend some time fixing stuff themselves, rather than just expecting other people to do it for them.


--------------------------------------------------------------------------------

via: https://arp242.net/weblog/diy.html

作者：[Martin Tournoij][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://arp242.net/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/TheCrookedSpoke
[2]: https://en.wikipedia.org/wiki/DIY_ethic
[3]: https://www.reddit.com/r/suckless/comments/9mhwg8/why_does_sts_latency_suck_so_bad/e7fu9sj/
[4]: https://www.linux.com/publications/linux-kernel-development-how-fast-it-going-who-doing-it-what-they-are-doing-and-who-0
[5]: https://www.gnu.org/philosophy/free-sw.html
[6]: http://journal.neilgaiman.com/2009/05/entitlement-issues.html
[7]: mailto:martin@arp242.net
[8]: https://github.com/Carpetsmoker/arp242.net/issues/new
