[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Command Line Heroes: Season 1: OS Wars)
[#]: via: (https://www.redhat.com/en/command-line-heroes/season-1/os-wars-part-2-rise-of-linux)
[#]: author: (redhat https://www.redhat.com)

代码英雄: 第一季: 操作系统大战(第二部分 Linux 崛起)
======
Saron Yitbarek: 这玩意开着的吗? 让我们进一段史诗般的星球大战的开幕吧, 开始了.

配音: [00:00:30] 第二集:Linux®的崛起。微软帝国控制着90%的桌面用户。操作系统的全面标准化似乎是板上钉钉的事了。然而，互联网的出现将战争的焦点从桌面转向了企业，在该领域，所有商业组织都争相构建自己的服务器。与此同时，一个不太可能的英雄出现在开源反叛组织中。固执，戴着眼镜的Linus Torvalds免费发布了他的Linux系统。微软打了个趔趄-并且开始重组。

Saron Yitbarek: [00:01:00] 哦，我们书呆子就是喜欢那样。上一次我们讲到哪了?苹果和微软互相攻伐，试图在一场争夺桌面用户的战争中占据主导地位。在第一集的结尾，我们看到微软获得了大部分的市场份额。很快，由于互联网的兴起以及随之而来的开发者大军,整个市场都经历了一场地震。互联网将战场从在家庭和办公室中的个人电脑用户转移到拥有数百台服务器的大型商业客户中。

[00:01:30] 这意味着巨量资源的迁移。突然间，所有相关企业不仅被迫为服务器空间和网站建设付费，而且还必须集成软件来进行资源跟踪和数据库监控等工作。你需要很多开发人员来帮助你。至少那时候大家都是这么做的。

在操作系统之战的第二部分，我们将看到优先级的巨大转变，以及像Linus Torvalds和Richard Stallman这样的开源叛逆者是如何成功地在微软和整个软件行业的核心地带引起恐惧的。

[00:02:00] 我是 Saron Yitbarek,您现在收听的是代码英雄，一款红帽公司原创的播客节目. 每一集,我们都会给您带来“从码开始”改变技术的人的故事.

[00:02:30] 好。假设你是1991年的微软。你自我感觉良好，对吧?满怀信心。确定全球主导的地位感觉不错。你已经掌握了与其他企业合作的艺术，但是仍然将大部分开发人员、程序员和系统管理员排除在联盟之外，而他们才是真正的步兵。这是出现了个叫Linus Torvalds的芬兰极客。他和他的开源程序员团队正在开始发布Linux，其操作系统内核是由他们一起编写出来的。

[00:03:00] 坦白地说，如果你是微软公司，你并不会太在意Linux，甚至是一般意义上的开源运动，但是最终，Linux的规模变得如此之大，以至于微软不可能不注意到。Linux第一个版本出现在1991年，当时大概有10000行代码。十年后，变成了300万行代码。如果你想知道，今天则是2000万行代码。

[00:03:30] 让我们停留在90年代初一会儿。那是Linux还没有成为我们现在所知道的庞然大物。只是这个奇怪的病毒式的操作系统正在这个星球上蔓延，全世界的极客和黑客都爱上了它。那时候我还太年轻，但依然希望加入他们。在那个时候，发现Linux就如同进入了一个秘密社会一样。程序员与朋友分享Linux CD集，就像其他人分享地下音乐混音带一样。

Developer Tristram Oaten [00:03:40] 讲讲了你16岁时第一次接触Linux的故事吧。

Tristram Oaten: [00:04:00] 我和我的家人去了Red Sea上的Hurghada潜水度假。那是一个美丽的地方，强烈推荐。第一天，我喝了自来水。也许，我妈妈跟我说过不要这么做。我整个星期都病得很厉害，没有离开旅馆房间。当时我只带了一台新安装了Slackware Linux的笔记本电脑，我听说过这玩意并且正在尝试使用它。这台笔记本上没有额外的应用程序，只有8张cd。出于必要，整个星期我所做的就是去了解这个外星一般的系统。我阅读手册，摆弄着终端。我记得当时我甚至我不知道一个点(表示当前目录)和两个点(表示前一个目录)之间的区别。

[00:04:30] 我一点头绪都没有。犯过很多错误，但慢慢地，在这种强迫的孤独中，我突破了障碍，开始理解并明白命令行到底是怎么回事。假期结束时，我没有看过金字塔、尼罗河等任何埃及遗址，但我解锁了现代世界的一个奇迹。我解锁了Linux，接下来的事大家都知道了。

Saron Yitbarek: 你可以从很多人那里听到关于这个故事的不同说法。访问Linux命令行是一种革命性的体验。

David Cantrell: 它给了我源代码. 我当时的感觉是, "太神奇了."

Saron Yitbarek: 我们正在参加一个名为Flock to Fedora的2017年Linux开发者大会。

David Cantrell: ... 非常有吸引力。我觉得我对这个系统有了更多的控制力，它越来越吸引我。我想，从那时起，1995年我第一次编译Linux内核时，我就迷上了它。

Saron Yitbarek: 开发者 David Cantrell 与 Joe Brockmire.

Joe Brockmeier: 我寻遍了便宜软件最终找到一套四张CD的 Slackware Linux. 它看起来来非常令人兴奋而且很有趣，所以我把它带回家，安装在第二台电脑上，开始摆弄它，并为两件事情感到兴奋。一个是，我运行的不是Windows，另一个我Linux的开源特性。

Saron Yitbarek: [00:06:00] 某种程度上来说，对命令行的访问总是存在的。在开源真正开始流行还要早几十年前，人们(至少在开发人员中是这样)总是希望能够做到完全控制。让我们回到操作系统大战之前的那个时代，在苹果和微软他们的GUI而战之前。那时也有代码英雄。保罗·琼斯(Paul Jones)教授(在线图书馆ibiblio.org负责人)在那个古老的时代，就是一名开发人员。

Paul Jones: [00:07:00] 从本质上讲，互联网在那个时候比较少是客户端-服务器架构的，而是更多是点对点架构的。讲真，当我们说，某种VAX到VAX，某科学工作站，科学工作站。这并不意味着没有客户端与服务端的关系以及没有应用程序,但这的确意味着,最初的设计是思考如何实现点对点,它与IBM一直在做的东西相对立. IBM给你的只有哑终端,这种终端只能让你管理用户界面,却无法让你像真正的终端一样为所欲为。

Saron Yitbarek: As popular as GUI was becoming among casual users, there was always a pull in the opposite direction for the engineers and developers. Before Linux in the 1970s and 80s, that resistance was there, with EMAX and GNU . W ith Stallman's free software foundation, certain folks were always begging for access to the command line, but it was Linux in the 1990s that delivered like no other.

[00:07:30] The early lovers of Linux and other open source software were pioneers. I'm standing on their shoulders. We all are.

You're listening to Command Line Heroes, an original podcast from Red Hat. This is part two of the OS wars: Rise of Linux.

Steven Vaughan-Nichols: By 1998, things have changed.

Saron Yitbarek: Steven Vaughan-Nichols is a contributing editor at zdnet.com, and he's been writing for decades about the business side of technology. He describes how Linux slowly became more and more popular until the number of volunteer contributors was way larger than the number of Microsoft developers working on Windows. Linux never really went after Microsoft's desktop customers, though, and maybe that's why Microsoft ignored them at first. Where Linux did shine was in the server room. When businesses went online, each one required a unique programming solution for their needs.

[00:08:30] Windows NT comes out in 1993 and it's competing with other server operating systems, but lots of developers are thinking, "Why am I going to buy an AIX box or a large windows box when I could set up a cheap Linux-based system with Apache?" Point is, Linux code started seeping into just about everything online.

Steven Vaughan-Nichols: [00:09:00] Microsoft realizes that Linux, quite to their surprise, is actually beginning to get some of the business, not so much on the desktop, but on business servers. As a result of that, they start a campaign, what we like to call FUD — fear, uncertainty and doubt — saying, "Oh this Linux stuff, it's really not that good. It's not very reliable. You can't trust it with anything."

Saron Yitbarek: [00:09:30] That soft propaganda style attack goes on for a while. Microsoft wasn't the only one getting nervous about Linux, either. It was really a whole industry versus that weird new guy. For example, anyone with a stake in UNIX was likely to see Linux as a usurper. Famously, the SCO Group, which had produced a version of UNIX, waged lawsuits for over a decade to try and stop the spread of Linux. SCO ultimately failed and went bankrupt. Meanwhile, Microsoft kept searching for their opening. They were a company that needed to make a move. It just wasn't clear what that move was going to be.

Steven Vaughan-Nichols: [00:10:30] What will make Microsoft really concerned about it is the next year, in 2000, IBM will announce that they will invest a billion dollars in Linux in 2001. Now, IBM is not really in the PC business anymore. They're not out yet, but they're going in that direction, but what they are doing is they see Linux as being the future of servers and mainframe computers, which, spoiler alert, IBM was correct. Linux is going to dominate the server world.

Saron Yitbarek: This was no longer just about a bunch of hackers loving their Jedi-like control of the command line. This was about the money side working in Linux's favor in a major way. John "Mad Dog" Hall, the executive director of Linux International, has a story that explains why that was. We reached him by phone.

John Hall: [00:11:30] A friend of mine named Dirk Holden [00:10:56] was a German systems administrator at Deutsche Bank in Germany, and he also worked in the graphics projects for the early days of the X Windows system for PCs. I visited him one day at the bank, and I said, "Dirk, you have 3,000 servers here at the bank and you use Linux. Why don't you use Microsoft NT?" He looked at me and he said, "Yes, I have 3,000 servers , and if I used Microsoft Windows NT, I would need 2,999 systems administrators." He says, "With Linux, I only need four." That was the perfect answer.

Saron Yitbarek: [00:12:00] The thing programmers are getting obsessed with also happens to be deeply attractive to big business. Some businesses were wary. The FUD was having an effect. They heard open source and thought, "Open. That doesn't sound solid. It's going to be chaotic, full of bugs," but as that bank manager pointed out, money has a funny way of convincing people to get over their hangups. Even little businesses, all of which needed websites, were coming on board. The cost of working with a cheap Linux system over some expensive proprietary option, there was really no comparison. If you were a shop hiring a pro to build your website, you wanted them to use Linux.

[00:12:30] Fast forward a few years. Linux runs everybody's website. Linux has conquered the server world, and then, along comes the smartphone. Apple and their iPhones take a sizeable share of the market, of course, and Microsoft hoped to get in on that, except, surprise, Linux was there, too, ready and raring to go.

Author and journalist James Allworth.

James Allworth: [00:13:00] There was certainly room for a second player, and that could well have been Microsoft, but for the fact of Android, which was fundamentally based on Linux, and because Android, famously acquired by Google, and now running a majority of the world's smartphones, Google built it on top of that. They were able to start with a very sophisticated operating system and a cost basis of zero. They managed to pull it off, and it ended up locking Microsoft out of the next generation of devices, by and large, at least from an operating system perspective.

Saron Yitbarek: [00:13:30] The ground was breaking up, big time, and Microsoft was in danger of falling into the cracks. John Gossman is the chief architect on the Azure team at Microsoft. He remembers the confusion that gripped the company at that time.

John Gossman: [00:14:00] Like a lot of companies, Microsoft was very concerned about IP pollution. They thought that if you let developers use open source they would likely just copy and paste bits of code into some product and then some sort of a viral license might take effect that ... They were also very confused, I think, it was just culturally, a lot of companies, Microsoft included, were confused on the difference between what open source development meant and what the business model was. There was this idea that open source meant that all your software was free and people were never going to pay anything.

Saron Yitbarek: [00:14:30] Anybody invested in the old, proprietary model of software is going to feel threatened by what's happening here. When you threaten an enormous company like Microsoft, yeah, you can bet they're going to react. It makes sense they were pushing all that FUD — fear, uncertainty and doubt. At the time, an “ us versus them ” attitude was pretty much how business worked. If they'd been any other company, though, they might have kept that old grudge, that old thinking, but then, in 2013, everything changes.

[00:15:00] Microsoft's cloud computing service, Azure, goes online and, shockingly, it offers Linux virtual machines from day one. Steve Ballmer, the CEO who called Linux a cancer, he's out, and a new forward - thinking CEO, Satya Nadella, has been brought in.

John Gossman: Satya has a different attitude. He's another generation. He's a generation younger than Paul and Bill and Steve were, and had a different perspective on open source.

Saron Yitbarek: John Gossman, again, from Microsoft's Azure team.

John Gossman: [00:16:00] We added Linux support into Azure about four years ago, and that was for very pragmatic reasons. If you go to any enterprise customer, you will find that they are not trying to decide whether to use Windows or to use Linux or to use .net or to use Java TM . They made all those decisions a long time ago — about 15 years or so ago, there was some of this argument. Now, every company that I have ever seen has a mix of Linux and Java and Windows and .net and SQL Server and Oracle and MySQL — proprietary source code - based products and open source code products.

If you're going to operate a cloud and you're going to allow and enable those companies to run their businesses on the cloud, you simply cannot tell them, "You can use this software but you can't use this software."

Saron Yitbarek: [00:16:30] That's exactly the philosophy that Satya Nadella adopted. In the fall of 2014, he gets up on stage and he wants to get across one big, fat point. Microsoft loves Linux. He goes on to say that 20 % of Azure is already Linux and that Microsoft will always have first - class support for Linux distros. There's not even a whiff of that old antagonism toward open source.

To drive the point home, there's literally a giant sign behind them that reads, "Microsoft hearts Linux." Aww. For some of us, that turnaround was a bit of a shock, but really, it shouldn't have been. Here's Steven Levy, a tech journalist and author.

Steven Levy: [00:17:30] When you're playing a football game and the turf becomes really slick, maybe you switch to a different kind of footwear in order to play on that turf. That's what they were doing. They can't deny reality and there are smart people there so they had to realize that this is the way the world is and put aside what they said earlier, even though they might be a little embarrassed at their earlier statements, but it would be crazy to let their statements about how horrible open source was earlier, affect their smart decisions now.

Saron Yitbarek: [00:18:00] Microsoft swallowed its pride in a big way. You might remember that Apple, after years of splendid isolation, finally shifted toward a partnership with Microsoft. Now it was Microsoft's turn to do a 180. After years of battling the open source approach, they were reinventing themselves. It was change or perish. Steven Vaughan-Nichols.

Steven Vaughan-Nichols: [00:18:30] Even a company the size of Microsoft simply can't compete with the thousands of open source developers working on all these other major projects , including Linux. They were very loath e to do so for a long time. The former Microsoft CEO, Steve Ballmer, hated Linux with a passion. Because of its GPL license, it was a cancer, but once Ballmer was finally shown the door, the new Microsoft leadership said, "This is like trying to order the tide to stop coming in. The tide is going to keep coming in. We should work with Linux, not against it."

Saron Yitbarek: [00:19:00] Really, one of the big wins in the history of online tech is the way Microsoft was able to make this pivot, when they finally decided to. Of course, older, hardcore Linux supporters were pretty skeptical when Microsoft showed up at the open source table. They weren't sure if they could embrace these guys, but, as Vaughan-Nichols points out, today's Microsoft simply is not your mom and dad's Microsoft.

Steven Vaughan-Nichols : [00:19:30] Microsoft 2017 is not Steve Ballmer's Microsoft, nor is it Bill Gates' Microsoft. It's an entirely different company with a very different approach and, again, once you start using open source, it's not like you can really pull back. Open source has devoured the entire technology world. People who have never heard of Linux as such, don't know it, but every time they're on Facebook , they're running Linux. Every time you do a Google search , you're running Linux.

[00:20:00] Every time you do anything with your Android phone , you're running Linux again. It literally is everywhere, and Microsoft can't stop that, and thinking that Microsoft can somehow take it all over, I think is naïve.

Saron Yitbarek: [00:20:30] Open source supporters might have been worrying about Microsoft coming in like a wolf in the flock, but the truth is, the very nature of open source software protects it from total domination. No single company can own Linux and control it in any specific way. Greg Kroah-Hartman is a fellow at the Linux Foundation.

Greg Kroah-Hartman: Every company and every individual contributes to Linux in a selfish manner. They're doing so because they want to solve a problem that they have, be it hardware isn't working , or they want to add a new feature to do something else , or want to take it in a direction that they'll build that they can use for their product. That's great, because then everybody benefits from that because they're releasing the code back, so that everybody can use it. It's because of that selfishness that all companies and all people have, everybody benefits.

Saron Yitbarek: [00:21:30] Microsoft has realized that in the coming cloud wars, fighting Linux would be like going to war with, well, a cloud. Linux and open source aren't the enemy, they're the atmosphere. Today, Microsoft has joined the Linux Foundation as a platinum member. They became the number one contributor to open source on GitHub. In September, 2017, they even joined the Open Source Initiative. These days, Microsoft releases a lot of its code under open licenses. Microsoft's John Gossman describes what happened when they open sourced .net. At first, they didn't really think they'd get much back.

John Gossman: [00:22:00] We didn't count on contributions from the community, and yet, three years in, over 50 per cent of the contributions to the .net framework libraries, now, are coming from outside of Microsoft. This includes big pieces of code. Samsung has contributed ARM support to .net. Intel and ARM and a couple other chip people have contributed code generation specific for their processors to the .net framework, as well as a surprising number of fixes, performance improvements , and stuff — from just individual contributors to the community.

Saron Yitbarek: Up until a few years ago, the Microsoft we have today, this open Microsoft, would have been unthinkable.

[00:23:00] I'm Saron Yitbarek, and this is Command Line Heroes. Okay, we've seen titanic battles for the love of millions of desktop users. We've seen open source software creep up behind the proprietary titans, and nab huge market share. We've seen fleets of command line heroes transform the programming landscape into the one handed down to people like me and you. Today, big business is absorbing open source software, and through it all, everybody is still borrowing from everybody.

[00:23:30] In the tech wild west, it's always been that way. Apple gets inspired by Xerox, Microsoft gets inspired by Apple, Linux gets inspired by UNIX. Evolve, borrow, constantly grow. In David and Goliath terms, open source software is no longer a David, but, you know what? It's not even Goliath, either. Open source has transcended. It's become the battlefield that others fight on. As the open source approach becomes inevitable, new wars, wars that are fought in the cloud, wars that are fought on the open source battlefield, are ramping up.

Here's author Steven Levy.

Steven Levy: [00:24:00] Basically, right now, we have four or five companies, if you count Microsoft, that in various ways are fighting to be the platform for all we do, for artificial intelligence, say. You see wars between intelligent assistants, and guess what? Apple has an intelligent assistant, Siri. Microsoft has one, Cortana. Google has the Google Assistant. Samsung has an intelligent assistant. Amazon has one, Alexa. We see these battles shifting to different areas, there. Maybe, you could say, the hottest one is would be, whose AI platform is going to control all the stuff in our lives there, and those five companies are all competing for that.

Saron Yitbarek: If you're looking for another rebel that's going to sneak up behind Facebook or Google or Amazon and blindside them the way Linux blindsided Microsoft, you might be looking a long time, because as author James Allworth points out, being a true rebel is only getting harder and harder.

James Allworth: [00:25:30] Scale's always been an advantage but the nature of scale advantages are almost ... Whereas, I think previously they were more linear in nature, now it's more exponential in nature, and so, once you start to get out in front with something like this , it becomes harder and harder for a new player to come in and catch up. I think this is true of the internet era in general, whether it's scale like that or the importance and advantages that data bestow on an organization in terms of its ability to compete. Once you get out in front, you attract more customers, and then that gives you more data and that enables you to do an even better job, and then, why on earth would you want to go with the number two player, because they're so far behind? I think it's going to be no different in cloud.

Saron Yitbarek: [00:26:00] This story began with singular heroes like Steve Jobs and Bill Gates, but the progress of technology has taken on a crowdsourced, organic feel. I think it's telling that our open source hero, Linus Torvalds, didn't even have a real plan when he first invented the Linux kernel. He was a brilliant , young developer for sure, but he was also like a single drop of water at the very front of a tidal wave. The revolution was inevitable. It's been estimated that for a proprietary company to create a Linux distribution in their old - fashioned , proprietary way, it would cost them well over $ 10 billion. That points to the power of open source.

[00:26:30] In the end, it's not something that a proprietary model is going to compete with. Successful companies have to remain open. That's the big, ultimate lesson in all this. Something else to keep in mind: W hen we're wired together, our capacity to grow and build on what we've already accomplished becomes limitless. As big as these companies get, we don't have to sit around waiting for them to give us something better. Think about the new developer who learns to code for the sheer joy of creating, the mom who decides that if nobody's going to build what she needs, then she'll build it herself.

Wherever tomorrow's great programmers come from, they're always going to have the capacity to build the next big thing, so long as there's access to the command line.

[00:27:30] That's it for our two - part tale on the OS wars that shaped our digital lives. The struggle for dominance moved from the desktop to the server room, and ultimately into the cloud. Old enemies became unlikely allies, and a crowdsourced future left everything open . Listen, I know, there are a hundred other heroes we didn't have space for in this history trip, so drop us a line. Share your story. Redhat.com/commandlineheroes. I'm listening.

We're spending the rest of the season learning what today's heroes are creating, and what battles they're going through to bring their creations to life. Come back for more tales — from the epic front lines of programming. We drop a new episode every two weeks. In a couple weeks' time, we bring you episode three: the Agile Revolution.

[00:28:00] Command Line Heroes is an original podcast from Red Hat. To get new episodes delivered automatically for free, make sure to subscribe to the show. Just search for “ Command Line Heroes ” in Apple p odcast s , Spotify, Google Play, and pretty much everywhere else you can find podcasts. Then, hit “ subscribe ” so you will be the first to know when new episodes are available.

I'm Saron Yitbarek. Thanks for listening. Keep on coding.

--------------------------------------------------------------------------------

via: https://www.redhat.com/en/command-line-heroes/season-1/os-wars-part-2-rise-of-linux

作者：[redhat][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.redhat.com
[b]: https://github.com/lujun9972
