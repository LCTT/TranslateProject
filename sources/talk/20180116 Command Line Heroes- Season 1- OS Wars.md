[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Command Line Heroes: Season 1: OS Wars)
[#]: via: (https://www.redhat.com/en/command-line-heroes/season-1/os-wars-part-2-rise-of-linux)
[#]: author: (redhat https://www.redhat.com)

Command Line Heroes: Season 1: OS Wars
======
Saron Yitbarek: Is this thing on? Cue the epic Star Wars crawl, and, action.

Voice Actor: [00:00:30] Episode Two: Rise of Linux ® . The empire of Microsoft controls 90 % of desktop users . C omplete standardization of operating systems seems assured. However, the advent of the internet swerves the focus of the war from the desktop toward enterprise, where all businesses scramble to claim a server of their own. Meanwhile, an unlikely hero arises from amongst the band of open source rebels . Linus Torvalds, head strong, bespectacled, releases his Linux system free of charge. Microsoft reels — and regroups.

Saron Yitbarek: [00:01:00] Oh, the nerd in me just loves that. So, where were we? Last time, Apple and Microsoft were trading blows, trying to dominate in a war over desktop users. By the end of e pisode o ne, we saw Microsoft claiming most of the prize. Soon, the entire landscape went through a seismic upheaval. That's all because of the rise of the internet and the army of developers that rose with it. The internet moves the battlefield from PC users in their home offices to giant business clients with hundreds of servers.

[00:01:30] This is a huge resource shift. Not only does every company out there wanting to remain relevant suddenly have to pay for server space and get a website built — they also have to integrate software to track resources, monitor databases, et cetera, et cetera. You're going to need a lot of developers to help you with that. At least, back then you did.

In p art t wo of the OS wars, we'll see how that enormous shift in priorities , and the work of a few open source rebels like Linus Torvalds and Richard Stallman , managed to strike fear in the heart of Microsoft, and an entire software industry.

[00:02:00] I'm Saron Yitbarek and you're listening to Command Line Heroes, an original podcast from Red Hat. In each episode, we're bringing you stories about the people who transform technology from the command line up.

[00:02:30] Okay. Imagine for a second that you're Microsoft in 1991. You're feeling pretty good, right? Pretty confident. Assured global domination feels nice. You've mastered the art of partnering with other businesses, but you're still pretty much cutting out the developers, programmers, and sys admins that are the real foot soldiers out there. There is this Finnish geek named Linus Torvalds. He and his team of open source programmers are starting to put out versions of Linux, this OS kernel that they're duct taping together.

[00:03:00] If you're Microsoft, frankly, you're not too concerned about Linux or even about open source in general, but eventually, the sheer size of Linux gets so big that it becomes impossible for Microsoft not to notice. The first version comes out in 1991 and it's got maybe 10,000 lines of code. A decade later, there will be three million lines of code. In case you're wondering, today it's at 20 million.

[00:03:30] For a moment, let's stay in the early 90s. Linux hasn't yet become the behemoth we know now. It's just this strangely viral OS that's creeping across the planet, and the geeks and hackers of the world are falling in love with it. I was too young in those early days, but I sort of wish I'd been there. At that time, discovering Linux was like gaining access to a secret society. Programmers would share the Linux CD set with friends the same way other people would share mixtapes of underground music.

Developer Tristram Oaten [00:03:40] tells the story of how he first encountered Linux when he was 16 years old.

Tristram Oaten: [00:04:00] We went on a scuba diving holiday, my family and I, to Hurghada, which is on the Red Sea. Beautiful place, highly recommend it. The first day, I drank the tap water. Probably, my mom told me not to. I was really sick the whole week — didn't leave the hotel room. All I had with me was a laptop with a fresh install of Slackware Linux, this thing that I'd heard about and was giving it a try. There were no extra apps, just what came on the eight CDs. By necessity, all I had to do this whole week was to get to grips with this alien system. I read man pages, played around with the terminal. I remember not knowing the difference between a single dot, meaning the current directory, and two dots, meaning the previous directory.

[00:04:30] I had no clue. I must have made so many mistakes, but slowly, over the course of this forcible solitude, I broke through this barrier and started to understand and figure out what this command line thing was all about. By the end of the holiday, I hadn't seen the pyramids, the Nile, or any Egyptian sites, but I had unlocked one of the wonders of the modern world. I'd unlocked Linux, and the rest is history.

Saron Yitbarek: You can hear some variation on that story from a lot of people. Getting access to that Linux command line was a transformative experience.

David Cantrell: This thing gave me the source code. I was like, "That's amazing."

Saron Yitbarek: We're at a 2017 Linux developers conference called Flock to Fedora.

David Cantrell: ... very appealing. I felt like I had more control over the system and it just drew me in more and more. From there, I guess, after my first Linux kernel compile in 1995, I was hooked, so, yeah.

Saron Yitbarek: Developers David Cantrell and Joe Brockmire.

Joe Brockmeier: I was going through the cheap software and found a four - CD set of Slackware Linux. It sounded really exciting and interesting so I took it home, installed it on a second computer, started playing with it, and really got excited about two things. One was, I was excited not to be running Windows, and I was excited by the open source nature of Linux.

Saron Yitbarek: [00:06:00] That access to the command line was, in some ways, always there. Decades before open source really took off, there was always a desire to have complete control, at least among developers. Go way back to a time before the OS wars, before Apple and Microsoft were fighting over their GUIs. There were command line heroes then, too. Professor Paul Jones is the director of the online library ibiblio.org. He worked as a developer during those early days.

Paul Jones: [00:07:00] The internet, by its nature, at that time, was less client server, totally, and more peer to peer. We're talking about, really, some sort of VAX to VAX, some sort of scientific workstation, the scientific workstation. That doesn't mean that client and server relationships and applications weren't there, but it does mean that the original design was to think of how to do peer - to - peer things, the opposite of what IBM had been doing, in which they had dumb terminals that had only enough intelligence to manage the user interface, but not enough intelligence to actually let you do anything in the terminal that would expose anything to it.

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
