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

Some stories are so epic, with such high stakes , that in my head, it's like that crawling text at the start of a Star Wars movie. You know, like-

Voice Actor:

Episode One, The OS Wars.

Saron Yitbarek:

Yeah, like that.

Voice Actor:

[00:00:30]

It is a period of mounting tensions. The empires of Bill Gates and Steve Jobs careen toward an inevitable battle over proprietary software. Gates has formed a powerful alliance with IBM, while Jobs refuses to license his hardware or operating system. Their battle for dominance threatens to engulf the galaxy in an OS war. Meanwhile, in distant lands, and unbeknownst to the emperors, open source rebels have begun to gather.

Saron Yitbarek:

[00:01:00]

Okay. Maybe that's a bit dramatic, but when we're talking about the OS wars of the 1980s, '90s, and 2000s, it's hard to overstate things. There really was an epic battle for dominance. Steve Jobs and Bill Gates really did hold the fate of billions in their hands. Control the operating system, and you control how the vast majority of people use computers, how we communicate with each other, how we source information. I could go on, but you know all this. Control the OS, and you would be an emperor.

[00:01:30]

[00:02:00]

I'm Saron Yitbarek [00:01:24], and you're listening to Command Line Heroes, an original podcast from Red Hat. What is a Command Line Hero, you ask? Well, if you would rather make something than just use it, if you believe developers have the power to build a better future, if you want a world where we all get a say in how our technologies shape our lives, then you, my friend, are a command line hero. In this series, we bring you stories from the developers among us who are transforming tech from the command line up. And who am I to be guiding you on this trek? Who is Saron Yitbarek? Well, actually I'm guessing I'm a lot like you. I'm a developer for starters, and everything I do depends on open source software. It's my world. The stories we tell on this podcast are a way for me to get above the daily grind of my work, and see that big picture. I hope it does the same thing for you , too.

[00:02:30]

[00:03:00]

What I wanted to know right off the bat was, where did open source technology even come from? I mean, I know a fair bit about Linus Torvalds and the glories of L inux ® , as I'm sure you do , too, but really, there was life before open source, right? And if I want to truly appreciate the latest and greatest of things like DevOps and containers, and on and on, well, I feel like I owe it to all those earlier developers to know where this stuff came from. So, let's take a short break from worrying about memory leaks and buffer overflows. Our journey begins with the OS wars, the epic battle for control of the desktop. It was like nothing the world had ever seen, and I'll tell you why. First, in the age of computing, you've got exponentially scaling advantages for the big fish ; and second, there's never been such a battle for control on ground that's constantly shifting. Bill Gates and Steve Jobs? They don't know it yet, but by the time this story is halfway done, everything they're fighting for is going to change, evolve, and even ascend into the cloud.

[00:03:30]

[00:04:00]

Okay, it's the fall of 1983. I was negative six years old. Ronald Reagan was president, and the U . S . and the Soviet Union are threatening to drag the planet into nuclear war. Over at the Civic Center in Honolulu, it's the annual Apple sales conference. An exclusive bunch of Apple employees are waiting for Steve Jobs to get onstage. He's this super bright-eyed 28-year-old, and he's looking pretty confident. In a very serious voice, Jobs speaks into the mic and says that he's invited three industry experts to have a panel discussion on software. But the next thing that happens is not what you'd expect. Super cheesy '80s music fills the room. A bunch of multi-colored tube lights light up the stage, and then an announcer voice says-

Voice Actor:

And now, ladies and gentlemen, the Macintosh software dating game.

Saron Yitbarek:

[00:04:30]

[00:05:00]

Jobs has this big grin on his face as he reveals that the three CEOs on stage have to take turns wooing him. It's essentially an '80s version of The Bachelor, but for tech love. Two of the software bigwigs say their bit, and then it's over to contestant number three. Is that? Yup. A fresh - faced Bill Gates with large square glasses that cover half his face. He proclaims that during 1984, half of Microsoft's revenue is going to come from Macintosh software. The audience loves it, and gives him a big round of applause. What they don't know is that one month after this event, Bill Gates will announce his plans to release Windows 1.0. You'd never guess Jobs is flirting with someone who'd end up as Apple's biggest rival. But Microsoft and Apple are about to live through the worst marriage in tech history. They're going to betray each other, they're going to try and destroy each other, and they're going to be deeply, painfully bound to each other.

James Allworth:

[00:05:30]

I guess philosophically, one was more idealistic and focused on the user experience above all else, and was an integrated organization, whereas Microsoft much more pragmatic, a modular focus-

Saron Yitbarek:

That's James Allworth. He's a prolific tech writer who worked inside the corporate team of Apple Retail. Notice that definition of Apple he gives. An integrated organization. That sense of a company beholden only to itself. A company that doesn't want to rely on others. That's key.

James Allworth:

[00:06:00]

Apple was the integrated player, and it wanted to focus on a delightful user experience, and that meant that it wanted to control the entire stack and everything that was delivered, from the hardware to the operating system, to even some of the applications that ran on top of the operating system. That always served it well in periods where new innovations, important innovations, were coming to market where you needed to be across both hardware and software, and where being able to change the hardware based on what you wanted to do and what t was new in software was an advantage. For example-

[00:06:30]

Saron Yitbarek:

[00:07:00]

A lot of people loved that integration, and became die hard Apple fans. Plenty of others stuck with Microsoft. Back to that sales conference in Honolulu. At that very same event, Jobs gave his audience a sneak peek at the Superbowl ad he was about to release. You might have seen it for yourself. Think George Orwell's 1984. In this cold and gray world, mindless automatons are shuffling along under a dictator's projected gaze. They represent IBM users. Then, beautiful, athletic Anya Major, representing Apple, comes running through the hall in full color. She hurls her sledgehammer at Big Brother's screen, smashing it to bits. Big Brother's spell is broken, and a booming voice tells us that Apple is about to introduce the Macintosh.

Voice Actor:

And you'll see why 1984 will not be like 1984.

Saron Yitbarek:

[00:07:30]

And yeah, looking back at that commercial, the idea that Apple was a freedom fighter working to set the masses free is a bit much. But the thing hit a nerve. Ken Segal worked at the advertising firm that made the commercial for Apple. He was Steve Jobs' advertising guy for more than a decade in the early days.

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
