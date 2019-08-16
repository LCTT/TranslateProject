[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Command Line Heroes: Season 1: OS Wars)
[#]: via: (https://www.redhat.com/en/command-line-heroes/season-1/os-wars-part-1)
[#]: author: (redhat https://www.redhat.com)

Command Line Heroes: Season 1: OS Wars
======
Saron Yitbarek:

有些故事如史诗般,惊险万分, 在我脑海中似乎出现了星球大战电影开头的爬行文字. 你知道的, 就像-

Voice Actor:

第一集, 操作系统大战.

Saron Yitbarek:

是的, 就像那样子.

Voice Actor:

[00:00:30]

当前形势比较紧张. Bill Gates 与 Steve Jobs 的帝国发起了一场无可避免的专有软件之战. Gates 与 IBM 结成了强大的联盟, 而 Jobs 拒绝对它的硬件和操作系统开放授权. 他们争夺统治地位的争斗在一场操作系统战争中席卷了整个银河系。与此同时, 帝王所不知道的是, 在偏远之地, 开源的反叛者们开始集聚.

Saron Yitbarek:

[00:01:00]

好吧. 这也许有点戏剧性, 但当我们谈论80年代，90年代和00年代的操作系统之争时, 这也不算言过其实. 确实曾经发生过一场史诗级的通知之战. Steve Jobs 和 Bill Gates 确实掌握着数十亿美元的命运. 掌控了操作系统, 你就掌握了绝大多数人使用计算机的方式, 我们互相通讯的方式, 我们获取信息的方式. 我可以一直罗列下去, 不过你知道我的意思. 掌握了操作系统, 你就是帝王.

[00:01:30]

我是 Saron Yitbarek, 你现在收听的是代码英雄, 一款红帽公司原创的博客节目. 你问，什么是代码英雄? 嗯, 如果你创造而不仅仅是使用, 如果你相信开发者拥有构建美好未来的能力, 如果你希望拥有一个大家都有权利表达科技如何塑造生活的世界, 那么你, 我的朋友, 就是代码英雄. 在本系列节目中, 我们将为你带来那些"白码起家(原文是from the command line up,应该是改编自from the ground up)"改变技术的程序员故事. 那么我是谁，凭什么指导你踏上这段艰苦的旅程? Saron Yitbarek是哪根葱? 嗯, 事实上我觉得我跟你差不多. 我是一名面向初学者的开发人员, 我做的任何事都依赖于开源软件. 这是我的世界. 通过在博客中讲故事,我可以跳出无聊的日常工作,看清大局. 希望它对你也一样有用.

[00:02:00]


[00:02:30]

[00:03:00]

我迫不及待地想直到，开源技术从何而来? 我的意思时, 我对 Linus Torvalds 和 Linux ® 的荣耀有一些了解, 我相信你也一样, 但是说真的, 开源并不是一开始就有的对吗? 如果我像发至内心的感激最新最棒的技术，比如 DevOps 和 containers 之类的, 我感觉我对那些早期的开发者有所亏欠，我有必要了解这些东西来自何处. 所以, 让我们暂时先不用担心内存泄露和缓冲溢出. 我们的旅程从操作系统之战开始, 这是一场波澜壮阔的桌面控制之战. 这场战争亘古未有，因为. 首先, 在计算机时代, 大公司拥有指数级的规模优势; 其次, 从未有过这么一场控制争夺战是如此变化多端. Bill Gates 和 Steve Jobs? 他们也不知道结果会如何, 但是到目前为止，这个故事进行到一半的时候, 他们所争夺的所有东西都将发声改变, 进化，最终上升到云端.

[00:03:30]

[00:04:00]

好的, 让我们回到1983年的秋季. 还有六年我才出生. 那时候的总统还是 Ronald Reagan, 美国和苏联扬言要把星球拖入核战争中. 在 Honolulu 的公民中心正在举办一年一度的苹果公司销售会议. 一群苹果公司的员工正在等待 Steve Jobs 上台. 他 28 岁，热情洋溢, 看起来非常自信. Jobs 很严肃地对着麦克风说他邀请了三个行业专家来软件进行了一次小组讨论. 然而随后发生的事情你肯定想不到. 超级俗气的80年代音乐响彻整个房间. 一堆多彩灯管照亮了舞台, 然后一个播音员的声音响起-

Voice Actor:

女士们，先生们, 现在是 Macintosh 软件的约会游戏.

Saron Yitbarek:

[00:04:30]

[00:05:00]

Jobs 的脸上露出一个大大的笑容，台上有三个CEO都需要轮流向他示好. 这基本上就是80年代科技界的钻石王老五. 两个软件大佬讲完话后, 然后就轮到第三个人讲话了. 仅此而已不是吗? 是得. 新面孔 Bill Gates 带着一个大大的方框眼镜遮住了半个脸. 他宣称在 1984 年, 微软的一半收入将来至于 Macintosh 软件. 他的这番话引来了观众热情的掌声. 但是他们不知道的是,在一个月后, Bill Gates 将会宣布发布 Windows 1.0 的计划. 你永远也猜不到 Jobs 正在跟未来苹果最大的敌人打情骂俏. 但微软和苹果即将经历科技史上最糟糕的婚礼. 他们会彼此背叛, 相互毁灭, 但又深深地、痛苦地捆绑在一起.

James Allworth:

[00:05:30]

我猜从哲学上来讲, 一个更理想化，注重用户体验高于一切, 是一个集成的组织, 而微软则更务实，更模块化-

Saron Yitbarek:

这是James Allworth。他是一位多产的科技作家，曾在苹果零售团队工作。注意他给出的苹果的定义。一个集成的组织。那种只对自己负责的公司。一个不想依赖别人的公司。这是关键。

James Allworth:

[00:06:00]

苹果是一家集成的公司,它专注于愉悦的用户体验,这意味着它希望控制整技术栈以及交付的一切内容,从硬件到操作系统,甚至运行在操作系统上的应用程序。
当新的创新,重要的创新刚刚进入市场,而你需要横跨软硬件,并且能够根据自己意愿和软件的革新来改变硬件时，这是一个优势。例如-,

[00:06:30]

Saron Yitbarek:

[00:07:00]
很多人喜欢这种整合的模式，并因此成为了苹果的铁杆粉丝。还有很多人则选择了微软。回到 Honolulu 的销售会议上。在同一场活动中，乔布斯向观众展示了他即将发布的超级碗广告。你可能已经亲眼见过这则广告了。想想 George Orwell 的1984。在这个冰冷、灰暗的世界里，在独裁者投射的目光下，没有头脑的机器人正在缓慢移动。这些机器人代表着IBM的用户们。然后，代表苹果公司的美丽而健壮的Anya Major 穿着鲜艳的衣服跑过大厅。她向着老大哥的屏幕猛地透出大锤,将它砸成一片一片的. 老大哥的咒语解除了,一个低沉的声音响起，苹果公司要开始介绍 Macintosh 了。

Voice Actor:

这就是为什么现实中的1984跟小说1984不一样了.

Saron Yitbarek:

[00:07:30]

是的，现在回顾这则广告，认为苹果是一个致力于解放大众的自由斗士的想法有点过分了。但这件事触动了我的神经。Ken Segal 曾在为苹果制作这则广告的广告公司工作过。在早期，他为 Steve Jobs 做了十多年的广告。

Ken Segal:

[00:08:00]

Well, the 1984 commercial came with a lot of risk. In fact, it was so risky that Apple didn't want to run it when they saw it. You've probably heard stories that Steve liked it, but the Apple board did not like it. In fact, they were so outraged that so much money had been spent on such a thing that they wanted to fire the ad agency. Steve was the one sticking up for the agency.

Saron Yitbarek:

Jobs, as usual, knew a good mythology when he saw one.

Ken Segal:

That commercial struck such a chord within the company, within the industry, that it became this thing for Apple. Whether or not people were buying computers that day, it had a sort of an aura that stayed around for years and years and years, and helped define the character of the company. We're the rebels. We're the guys with the sledgehammer.

[00:08:30]

Saron Yitbarek:

So in their battle for the hearts and minds of literally billions of potential consumers, the emperors of Apple and Microsoft were learning to frame themselves as redeemers. As singular heroes. As lifestyle choices. But Bill Gates knew something that Apple had trouble understanding. This idea that in a wired world, nobody, not even an emperor, can really go it alone.

[00:09:00]

[00:09:30]

June 25th, 1985. Gates sends a memo to Apple's then CEO John Scully. This was during the wilderness years. Jobs had just been excommunicated, and wouldn't return to Apple until 1996. Maybe it was because Jobs was out that Gates felt confident enough to write what he wrote. In the memo, he encourages Apple to license their OS to clone makers. I want to read a bit from the end of the memo, just to give you a sense of how perceptive it was. Gates writes, "It is now impossible for Apple to create a standard out of their innovative technology without support from other personal computer manufacturers. Apple must open the Macintosh architecture to have the independent support required to gain momentum and establish a standard." In other words, no more operating in a silo, you guys. You've got to be willing to partner with others. You have to work with developers.

[00:10:00]

[00:10:30]

You see this philosophy years later, when Microsoft CEO Steve Ballmer gets up on stage to give a keynote and he starts shouting, "Developers, developers, developers, developers, developers, developers. Developers, developers, developers, developers, developers, developers, developers, developers." You get the idea. Microsoft likes developers. Now, they're not about to share source code with them, but they do want to build this whole ecosystem of partners. And when Bill Gates suggests that Apple do the same, as you might have guessed, the idea is tossed out the window. Apple had drawn a line in the sand, and five months after they trashed Gates' memo, Microsoft released Windows 1.0. The war was on.

Developers, developers, developers, developers, developers, developers, developers, developers, developers, developers, developers, developers, developers, developers, developers, developers, developers, developers.

[00:11:00]

You're listening to Command Line Heroes, an original podcast from Red Hat. In this inaugural episode, we go back in time to relive the epic story of the OS wars, and we're going to find out, how did a war between tech giants clear the way for the open source world we all live in today?

[00:11:30]

Okay, a little backstory. Forgive me if you've heard this one, but it's a classic. It's 1979, and Steve Jobs drives up to the Xerox Park research center in Palo Alto. The engineers there have been developing this whole fleet of elements for what they call a graphical user interface. Maybe you've heard of it. They've got menus, they've got scroll bars, they've got buttons and folders and overlapping windows. It was a beautiful new vision of what a computer interface could look like. And nobody had any of this stuff. Author and journalist Steven Levy talks about its potential.

Steven Levy:

[00:12:00]

There was a lot of excitement about this new interface that was going to be much friendlier than what we had before, which used what was called the command line, where there was really no interaction between you and the computer in the way you'd interact with something in real life. The mouse and the graphics on the computer gave you a way to do that, to point to something just like you'd point to something in real life. It made it a lot easier. You didn't have to memorize all these codes.

Saron Yitbarek:

[00:12:30]

[00:13:00]

Except, the Xerox executives did not get that they were sitting on top of a platinum mine. The engineers were more aware than the execs. Typical. So those engineers were, yeah, a little stressed out that they were instructed to show Jobs how everything worked. But the executives were calling the shots. Jobs felt, quote, "The product genius that brought them to that monopolistic position gets rotted out by people running these companies that have no conception of a good product versus a bad product." That's sort of harsh, but hey, Jobs walked out of that meeting with a truckload of ideas that Xerox executives had missed. Pretty much everything he needed to revolutionize the desktop computing experience. Apple releases the Lisa in 1983, and then the Mac in 1984. These devices are made by the ideas swiped from Xerox.

[00:13:30]

What's interesting to me is Jobs' reaction to the claim that he stole the GUI. He's pretty philosophical about it. He quotes Picasso, saying, "Good artists copy, great artists steal." He tells one reporter, "We have always been shameless about stealing great ideas." Great artists steal. Okay. I mean, we're not talking about stealing in a hard sense. Nobody's obtaining proprietary source code and blatantly incorporating it into their operating system. This is softer, more like idea borrowing. And that's much more difficult to control, as Jobs himself was about to learn. Legendary software wizard, and true command line hero, Andy Hertzfeld, was an original member of the Macintosh development team.

[00:14:00]

Andy Hertzfeld:

[00:14:30]

[00:15:00]

Yeah, Microsoft was our first software partner with the Macintosh. At the time, we didn't really consider them a competitor. They were the very first company outside of Apple that we gave Macintosh prototypes to. I talked with the technical lead at Microsoft usually once a week. They were the first outside party trying out the software that we wrote. They gave us very important feedback, and in general I would say the relationship was pretty good. But I also noticed in my conversations with the technical lead, he started asking questions that he didn't really need to know about how the system was implemented, and I got the idea that they were trying to copy the Macintosh. I t old Steve Jobs about it pretty early on, but it really came to a head in the fall of 1983. We discovered that they actually, without telling us ahead of time, they announced Windows at the COMDEX in November 1983 and Steve Jobs hit the roof. He really considered that a betrayal.

Saron Yitbarek:

[00:15:30]

[00:16:00]

As newer versions of Windows were released, it became pretty clear that Microsoft had lifted from Apple all the ideas that Apple had lifted from Xerox. Jobs was apoplectic. His Picasso line about how great artists steal. Yeah. That goes out the window. Though maybe Gates was using it now. Reportedly, when Jobs screamed at Gates that he'd stolen from them, Gates responded, "Well Steve, I think it's more like we both had this rich neighbor named Xerox, and I broke into his house to steal the TV set, and found out that you'd already stolen it." Apple ends up suing Microsoft for stealing the look and feel of their GUI. The case goes on for years, but in 1993, a judge from the 9th Circuit Court of Appeals finally sides with Microsoft. Judge Vaughn Walker declares that look and feel are not covered by copyright. This is super important. That decision prevented Apple from creating a monopoly with the interface that would dominate desktop computing. Soon enough, Apple's brief lead had vanished. Here's Steven Levy's take.

Steven Levy:

[00:16:30]

[00:17:00]

They lost the lead not because of intellectual property theft on Microsoft's part, but because they were unable to consolidate their advantage in having a better operating system during the 1980s. They overcharged for their computers, quite frankly. So Microsoft had been developing Windows, starting with the mid-1980s, but it wasn't until Windows 3 in 1990, I believe, where they really came across with a version that was ready for prime time. Ready for masses of people to use. At that point is where Microsoft was able to migrate huge numbers of people, hundreds of millions, over to the graphical interface in a way that Apple had not been able to do. Even though they had a really good operating system, they used it since 1984.

Saron Yitbarek:

[00:17:30]

[00:18:00]

Microsoft now dominated the OS battlefield. They held 90% of the market, and standardized their OS across a whole variety of PCs. The future of the OS looked like it'd be controlled by Microsoft. And then? Well, at the 1997 Macworld Expo in Boston, you have an almost bankrupt Apple. A more humble Steve Jobs gets on stage, and starts talking about the importance of partnerships, and one in particular, he says, has become very, very meaningful. Their new partnership with Microsoft. Steve Jobs is calling for a détente, a ceasefire. Microsoft could have their enormous market share. If we didn't know better, we might think we were entering a period of peace in the kingdom. But when stakes are this high, it's never that simple. Just as Apple and Microsoft were finally retreating to their corners, pretty bruised from decades of fighting, along came a 21-year-old Finnish computer science student who, almost by accident, changed absolutely everything.

I'm Saron Yitbarek, and this is Command Line Heroes.

[00:18:30]

While certain tech giants were busy bashing each other over proprietary software, there were new champions of free and open source software popping up like mushrooms. One of these champions was Richard Stallman. You're probably familiar with his work. He wanted free software and a free society. That's free as in free speech, not free as in free beer. Back in the '80s, Stallman saw that there was no viable alternative to pricey, proprietary OSs, like UNIX . So, he decided to make his own. Stallman's Free Software Foundation developed GNU, which stood for GNU's not UNIX , of course. It'd be an OS like UNIX, but free of all UNIX code, and free for users to share.

[00:19:00]

[00:19:30]

Just to give you a sense of how important that idea of free software was in the 1980s, the companies that owned the UNIX code at different points, AT&T Bell Laboratories and then UNIX System Laboratories, they threatened lawsuits on anyone making their own OS after looking at UNIX source code. These guys were next - level proprietary. All those programmers were, in the words of the two companies, "mentally contaminated," because they'd seen UNIX code. In a famous court case between UNIX System Laboratories and Berkeley Software Design, it was argued that any functionally similar system, even though it didn't use the UNIX code itself, was a bre a ch of copyright. Paul Jones was a developer at that time. He's now the director of the digital library ibiblio.org.

Paul Jones:

[00:20:00]

Anyone who has seen any of the code is mentally contaminated was their argument. That would have made almost anyone who had worked on a computer operating system that involved UNIX , in any computer science department, was mentally contaminated. So in one year at USENIX, we all got little white bar pin s with red letters that say mentally contaminated, and we all wear those around to our own great pleasure, to show that we were sticking it to Bell because we were mentally contaminated.

[00:20:30]

Saron Yitbarek:

[00:21:00]

The whole world was getting mentally contaminated. Staying pure, keeping things nice and proprietary, that old philosophy was getting less and less realistic. It was into this contaminated reality that one of history's biggest command line heroes was born, a boy in Finland named Linus Torvalds. If this is Star Wars, then Linus Torvalds is our Luke Skywalker. He was a mild-mannered grad student at the University of Helsinki. Talented, but lacking in grand visions. The classic reluctant hero. And, like any young hero, he was also frustrated. He wanted to incorporate the 386 processor into his new PC's functions. He wasn't impressed by the MS-DOS running on his IBM clone, and he couldn't afford the $5,000 price tag on the UNIX software that would have given him some programming freedom. The solution, which Torvalds crafted on MINIX in the spring of 1991, was an OS kernel called Linux. The kernel of an OS of his very own.

[00:21:30]

Steven Vaughan-Nichols:

Linus Torvalds really just wanted to have something to play with.

Saron Yitbarek:

Steven Vaughan-Nichols is a contributing editor at ZDNet.com, and he's been writing about the business of technology since there was a business of technology.

Steven Vaughan-Nichols:

[00:22:00]

[00:22:30]

There were a couple of operating systems like it at the time. The main one that he was concerned about was called MINIX. That was an operating system that was meant for students to learn how to build operating systems. Linus looked at that, and thought that it was interesting, but he wanted to build his own. So it really started as a do-it-yourself project at Helsinki. That's how it all started, is just basically a big kid playing around and learning how to do things. But what was different in his case is that he was both bright enough and persistent enough, and also friendly enough to get all these other people working on it, and then he started seeing the project through. 27 years later, it is much, much bigger than he ever dreamed it would be.

Saron Yitbarek:

[00:23:00]

By the fall of 1991, Torvalds releases 10,000 lines of code, and people around the world start offering comments, then tweaks, additions, edits. That might seem totally normal to you as a developer today, but remember, at that time, open collaboration like that was a moral affront to the whole proprietary system that Microsoft, Apple, and IBM had done so well by. Then that openness gets enshrined. Torvalds places Linux under the GNU general public license. The license that had kept Stallman's GNU system free was now going to keep Linux free , too. The importance of that move to incorporate GPL, basically preserving the freedom and openness of the software forever, cannot be overstated. Vaughan-Nichols explains.

[00:23:30]

Steven Vaughan-Nichols:

In fact, by the license that it's under, which is called GPL version 2, you have to share the code if you're going to try to sell it or present it to the world, so that if you make an improvement, it's not enough just to give someone the improvement. You actually have to share with them the nuts and bolts of all those changes. Then they are adapted into Linux if they're good enough.

Saron Yitbarek:

[00:24:00]

That public approach proved massively attractive. Eric Raymond, one of the early evangelists of the movement wrote in his famous essay that, "Corporations like Microsoft and Apple have been trying to build software cathedrals, while Linux and its kind were offering a great babbling bazaar of different agendas and approaches. The bazaar was a lot more fun than the cathedral."

Stormy Peters:

I think at the time, what attracted people is that they were going to be in control of their own world.

Saron Yitbarek:

Stormy Peters is an industry analyst, and an advocate for free and open source software.

[00:24:30]

Stormy Peters:

[00:25:00]

When open source software first came out, the OS was all proprietary. You couldn't even add a printer without going through proprietary software. You couldn't add a headset. You couldn't develop a small hardware device of your own, and make it work with your laptop. You couldn't even put in a DVD and copy it, because you couldn't change the software. Even if you owned the DVD, you couldn't copy it. You had no control over this hardware/software system that you'd bought. You couldn't create anything new and bigger and better out of it. That's why an open source operating system was so important at the beginning. We needed an open source collaborative environment where we could build bigger and better things.

Saron Yitbarek:

[00:25:30]

Mind you, Linux isn't a purely egalitarian utopia. Linus Torvalds doesn't approve everything that goes into the kernel, but he does preside over its changes. He's installed a dozen or so people below him to manage different parts of the kernel. They, in turn, trust people under themselves, and so on, in a pyramid of trust. Changes might come from anywhere, but they're all judged and curated.

[00:26:00]

It is amazing, though, to think how humble, and kind of random, Linus' DIY project was to begin with. He didn't have a clue he was the Luke Skywalker figure in all this. He was just 21, and had been programming half his life. But this was the first time the silo opened up, and people started giving him feedback. Dozens, then hundreds, and thousands of contributors. With crowdsourcing like that, it doesn't take long before Linux starts growing. Really growing. It even finally gets noticed by Microsoft. Their CEO, Steve Ballmer, called Linux, and I quote, "A cancer that attaches itself in an intellectual property sense to everything it touches." Steven Levy describes where Ballmer was coming from.

Steven Levy:

[00:26:30]

Once Microsoft really solidified its monopoly, and indeed it was judged in federal court as a monopoly, anything that could be a threat to that, they reacted very strongly to. So of course, the idea that free software would be emerging, when they were charging for software, they saw as a cancer. They tried to come up with an intellectual property theory about why this was going to be bad for consumers.

Saron Yitbarek:

[00:27:00]

Linux was spreading, and Microsoft was worried. By 2006, Linux would become the second most widely used operating system after Windows, with about 5,000 developers working on it worldwide. Five thousand. Remember that memo that Bill Gates sent to Apple, the one where he's lecturing them about the importance of partnering with other people? Turns out, open source would take that idea of partnerships to a whole new level, in a way Bill Gates would have never foreseen.

[00:27:30]

[00:28:00]

We've been talking about these huge battles for the OS, but so far, the unsung heroes, the developers, haven't fully made it onto the battlefield. That changes next time, on Command Line Heroes. In episode two, part two of the OS wars, it's the rise of Linux. Businesses wake up, and realize the importance of developers. These open source rebels grow stronger, and the battlefield shifts from the desktop to the server room. There's corporate espionage, new heroes, and the unlikeliest change of heart in tech history. It all comes to a head in the concluding half of the OS wars.

[00:28:30]

To get new episodes of Command Line Heroes delivered automatically for free, make sure you hit subscribe on Apple podcasts, Spotify, Google Play, or however you get your podcasts. Over the rest of the season, we're visiting the latest battlefields, the up-for-grab territories where the next generation of Command Line Heroes are making their mark. For more info, check us out at redhat.com/commandlineheroes. I'm Saron Yitbarek. Until next time, keep on coding.


--------------------------------------------------------------------------------

via: https://www.redhat.com/en/command-line-heroes/season-1/os-wars-part-1

作者：[redhat][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.redhat.com
[b]: https://github.com/lujun9972
