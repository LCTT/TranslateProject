Interviews: Linus Torvalds Answers Your Question
================================================================================
Last Thursday you had a chance to [ask Linus Torvalds][1] about programming, hardware, and all things Linux. You can read his answers to those questions below. If you'd like to see what he had to say the last time we sat down with him, [you can do so here][2]. 

**Productivity**
by DoofusOfDeath

> You've somehow managed to originate two insanely useful pieces of software: Linux, and Git. Do you think there's anything in your work habits, your approach to choosing projects, etc., that have helped you achieve that level of productivity? Or is it just the traditional combination of talent, effort, and luck? 

**Linus**: I'm sure it's pretty much always that "talent, effort and luck". I'll leave it to others to debate how much of each...

I'd love to point out some magical work habit that makes it all happen, but I doubt there really is any. Especially as the work habits I had wrt the kernel and Git have been so different.

With Git, I think it was a lot about coming at a problem with fresh eyes (not having ever really bought into the traditional SCM mindset), and really trying to think about the issues, and spending a fair amount of time thinking about what the real problems were and what I wanted the design to be. And then the initial self-hosting code took about a day to write (ok, that was "self-hosting" in only the weakest sense, but still).

And with Linux, obviously, things were very different - the big designs came from the outside, and it took half a year to host itself, and it hadn't even started out as a kernel to begin with. Clearly not a lot of thinking ahead and planning involved ;). So very different circumstances indeed.

What both the kernel and Git have, and what I think is really important (and I guess that counts as a "work habit"), is a maintainer that stuck to it, and was responsive, responsible and sane. Too many projects falter because they don't have people that stick with them, or have people who have an agenda that doesn't match reality or the user expectations.

But it's very important to point out that for Git, that maintainer was not me. Junio Hamano really should get pretty much all the credit for Git. Credit where credit is due. I'll take credit for the initial implementation and design of Git - it may not be perfect, but ten years on it still is very solid and very clearly the same basic design. But I'll take even _more_ credit for recognizing that Junio had his head screwed on right, and was the person to drive the project. And all the rest of the credit goes to him.

Of course, that kind of segues into something else the kernel and Git do have in common: while I still maintain the kernel, I did end up finding a lot of smart people to maintain all the different parts of it. So while one important work habit is that "stick to it" persistence that you need to really take a project from a not-quite-usable prototype to something bigger and better, another important work-habit is probably to also "let go" and not try to own and control the project too much. Let other people really help you - guide the process but don't get in their way.

**init system**
by lorinc

> There wasn't a decent unix-like kernel, you wrote one which ultimately became the most used. There wasn't a decent version control software, you wrote one which ultimately became the most love. Do you think we already have a decent init system, or do you have plan to write one that will ultimately settle the world on that hot topic? 

**Linus**: You can say the word "systemd", It's not a four-letter word. Seven letters. Count them.

I have to say, I don't really get the hatred of systemd. I think it improves a lot on the state of init, and no, I don't see myself getting into that whole area.

Yeah, it may have a few odd corners here and there, and I'm sure you'll find things to despise. That happens in every project. I'm not a huge fan of the binary logging, for example. But that's just an example. I much prefer systemd's infrastructure for starting services over traditional init, and I think that's a much bigger design decision.

Yeah, I've had some personality issues with some of the maintainers, but that's about how you handle bug reports and accept blame (or not) for when things go wrong. If people thought that meant that I dislike systemd, I will have to disappoint you guys.

**Can Valve change the Linux gaming market?**
by Anonymous Coward

> Do you think Valve is capable of making Linux a primary choice for gamers? 

**Linus**: "Primary"? Probably not where it's even aiming. I think consoles (and all those handheld and various mobile platforms that "real gamers" seem to dismiss as toys) are likely much more primary, and will stay so.

I think Valve wants to make sure they can control their own future, and Linux and ValveOS is probably partly to explore a more "console-like" Valve experience (ie the whole "get a box set up for a single main purpose", as opposed to a more PC-like experience), and partly as a "second source" against Microsoft, who is a competitor in the console area. Keeping your infrastructure suppliers honest by making sure you have alternatives sounds like a good strategy, and particularly so when those suppliers may be competing with you directly elsewhere.

So I don't think the aim is really "primary". "Solid alternative" is I think the aim. Of course, let's see where it goes after that.

But I really have not been involved. People like Greg and the actual graphics driver guys have been in much more direct contact with Valve. I think it's great to see gaming on Linux, but at the same time, I'm personally not really much of a gamer.

**The future of RT-Linux?**
by nurhussein

> According to Thomas Gleixner, [the future of the realtime patchset to Linux is in doubt][2], as it is difficult to secure funding from interested parties on this functionality even though it is both useful and important: What are your thoughts on this, and what do you think we need to do to get more support behind the RT patchset, especially considering Linux's increasing use in embedded systems where realtime functionality is undoubtedly useful. 

**Linus**: So I think this is one of those things where the markets decide how important rtLinux ends up being, and I suspect there are more than enough companies who end up wanting and using rtLinux that the project isn't really going anywhere. The complaints by Thomas were - I think - a wake-up call to the companies who end up wanting the extended hard realtime patches.

So I suspect there are companies and groups like OSADL that end up funding and helping with rtLinux, and that it isn't going away.

**Rigor and developments**
by hcs_$reboot

> The most complex program running on a machine is arguably its OS, especially the kernel. Linux (kernel) reached the top level in terms of performance, reliability and versatility. You have been criticized quite a few times for some virulent mails addressed to developers. Do you think Linux would be where it is without managing the project with an iron fist? To go further, do you think some other main OSS project would benefit from a more rigorous management approach? 

**Linus**: One of the nice things about open source is how it allows people to really concentrate on what they are good at, and it has been a huge advantage for Linux that we've had people who are interested in the marketing side and selling Linux, as well as the legal side etc.

And that is all in addition, of course, to the original "we're motivated by the technology" people like me. And even within that "we're motivated by technology" group, you most certainly don't need to find _everything_ interesting, you can find the area you are passionate about and really care about and want to work on.

That's _fundamentally_ how open source works.

Now, if somebody is passionate about some "good management" thing, go wild, and try to get involved, and try to manage things. It's not what _I_ am interested in, but hey, the proof is in the pudding - anybody who thinks they have a new rigorous management approach that they think will help some part of the process, go wild.

Now, I personally suspect that it wouldn't work - not only are tech people an ornery lot to begin with (that whole "herding cats" thing), just look at all the crazy arguments on the internet. And ask yourself what actually holds an open source project like the kernel together? I think you need to be very oriented towards the purely technical solutions, simply because then you have tangible and real issues you can discuss (and argue about) with fairly clear-cut hard answers. It's the only thing people can really agree on in the big picture.

So the Linux approach to "management" has been to put technology first. That's rigorous enough for me. But as mentioned, it's a free-for-all. Anybody can come in and try to do better. Really.

And btw, it's worth noting that there are obviously specific smaller development teams where other management models work fine. Most of the individual developers are parts of teams inside particular companies, and within the confines of that company, there may well be a very strict rigorous management model. Similarly, within the confines of a particular productization effort there may be particular goals and models for that particular team that transcend that general "technical issues" thing.

Just to give a concrete example, the "development kernel" tree that I maintain works fundamentally differently and with very different rules from the "stable tree" that Greg does, which in turn is maintained very differently from what a distribution team within a Linux company does inside its maintenance kernel team.

So there's certainly room for different approaches to managing those very different groups. But do I think you can "rigorously manage" people on the internet? No.

**Functional languages?**
by EmeraldBot

> While historically you've been a C and Assembly guy (and the odd shell scripting and such), what do you think of functional languages such as Lisp, Closure, Haskell, etc? Do you see any advantages to them, or do you view them as frivolous and impractical? If you decide to do so, thanks for taking the time to answer my question! You're a legend at what you do, and I think it's awesome that the significantly less interesting me can ask you a question like this. 

**Linus**: I may be a fan of C (with a certain fondness for assembly, just because it's so close to the machine), but that's very much about a certain context. I work at a level where those languages make sense. I certainly don't think that tools like Haskell etc are "frivolous and impractical" in general, although on a kernel level (or in a source control management system) I suspect they kind of are.

Many moons ago I worked on sparse (the C parser and analyzer), and one of my coworkers was a Haskell fan, and did incredible example transformations in very simple (well, to him) code - stuff that is just nasty to write in C because it's pretty high-level, there's tons of memory management, and you're really talking about implementing fairly abstract and high-level rules with pattern matching etc.

So I'm definitely not a functional language kind of guy - it's not how I learnt programming, and it really isn't very relevant to what I do, and I wouldn't recognize Haskell code if it bit me in the ass and called me names. But no, I wouldn't call them frivolous.

**Critical software to the use of Linux**
by TWX

> Mr. Torvalds, For many uses of Linux such as on the desktop, other software beyond the kernel and the base GNU tools are required. What other projects would you like to see given priority, and what would you like to see implemented or improved? Admittedly I thought most about X-Windows when asking this question; but I don't doubt that other daemons or systems can be just as important to the user experience. Thank you for your efforts all these years. 

**Linus**: Hey, I don't really have any particular project I would want to champion, largely because we all have so different requirements on the desktop. There's just no single thing that stands out as being hugely more important than others to me.

What I do wish particularly desktop developers cared about is "consistency of experience". And by that I don't mean some kind of enforced visual consistency between different applications to make things "look coherent". No, I'm just talking about the pain and uncertainty users go through with upgrades, and understanding that while your project may be the most important project to *you* (because it's what you do), to your users, your project is likely just a fairly small and irrelevant part of their experience, and it's not very central at all, and they've learnt the quirks about that thing they don't even care about, and you really shouldn't break their expectations. Because it turns out that that is how you really make people hate their desktop.

This is not at all Linux-specific, of course - just look at the less than enthusiastic reception that other operating system redesigns have received. But I really wish that we hadn't had *both* of the major Linux desktop environments have to learn this (well, I hope they learnt) the hard way, and both of them ending up blaming their users rather than themselves.

**"anykernel"-style portable drivers?**
by staalmannen

> What do you think about the "anykernel" concept (invented by another Finn btw) used in NetBSD? Basically, they have modularized the code so that a driver can be built either in a monolithic kernel or for user space without source code changes ( rumpkernel.org ). The drivers are highly portable and used in Genode os (L4 type kernels), minix etc... Would this be possible or desirable for Linux? Apparently there is one attempt called "libos"... 

**Linus**: So I have bad experiences with "portable" drivers. Writing drivers to some common environment tends to force some ridiculously nasty impedance matching abstractions that just get in the way and make things really hard to read and modify. It gets particularly nasty when everybody ends up having complicated - and differently so - driver subsystems to handle a lot of commonalities for a certain class of drivers (say a network driver, or a USB driver), and the different operating systems really have very different approaches and locking rules etc.

I haven't seen anykernel drivers, but from past experience my reaction to "portable device drivers" is to run away, screaming like little girl. As they say in Swedish "Bränt barn luktar illa".

**Processor Architecture**
by swv3752

> Several years ago, you were employed by Transmeta designing the Crusoe processor. I understand you are quite knowledgeable about cpu architecture. What are your thoughts on the Current Intel and AMD x86 CPUs particularly in comparison with ARM and IBM's Power8 CPUs? Where do you see the advantages of each one? 

**Linus**: I'm no CPU architect, I just play one on TV.

But yes, I've been close to the CPU both as part of my kernel work, and as part of a processor company, and working at that level for a long time just means that you end up having fairly strong opinions. One of the things that my experiences at Transmeta convinced me of, for example, was that there's definitely very much a limit to what software should care about. I loved working at Transmeta, I loved the whole startup company environment, I loved working with really smart people, but in the end I ended up absolutely *not* loving to work with overly simple hardware (I also didn't love the whole IPO process, and what that did to the company culture, but that's a different thing).

Because there's only so much that software can do to compensate.

Something similar happened with my kernel work on the alpha architecture, which also started out as being an overly simplified implementation in the name of being small and supposedly running really fast. While I really started out liking the alpha architecture for being so clean, I ended up detesting how fragile the architecture implementations were (and by the time that got fixed in the 21264, I had given up on alpha).

So I've come to absolutely detest CPU's that need a lot of compiler smarts or special tuning to go fast. Life is too short to waste on in-order CPU's, or on hardware designers who think software should take care of the pieces that they find to be too complicated to handle themselves, and as a result just left undone. "Weak memory ordering" is just another example.

Thankfully, most of the industry these days seems to agree. Yes, there are still in-order cores, but nobody tries to make excuses for them any more: they are for the truly cheap and low-end market.

I tend to really like the modern Intel cores in particular, which tend to take that "let's not be stupid" really to heart. With the kernel being so threaded, I end up caring a lot about things like memory ordering etc, and the Intel big-core CPU's tend to be in a class of their own there. As a software person who cares about performance and looks at instruction profiles etc, it's just so *nice* to see that the CPU doesn't have some crazy glass jaw where you have to be very careful.

**GPU kernels**
by maraist

> Is there any inspiration that a GPU based kernel / scheduler has for you? How might Linux be improved to better take advantage of GPU-type batch execution models. Given that you worked transmeta and JIT compiled host-targeted runtimes. GPUs 1,000-thread schedulers seem like the next great paradigm for the exact type of machines that Linux does best on.

**Linus**: I don't think we'll see the kernel ever treat GPU threads the way we treat CPU threads. Not with the current model of GPU's (and that model doesn't really seem to be changing all that much any more).

Yes, GPU's are getting much better, and now generally have virtual memory and the ability to preempt execution, and you could run an OS on them. But the scheduling latencies are pretty high, and the threads are not really "independent" (ie they tend to share a lot of state - like the virtual address space and a large shared register set), so GPU "threads" don't tend to work like CPU threads. You'd schedule them all-or-nothing, so if you were to switch processes, you'd treat the GPU as one entity where you switch all the threads at once.

So it really wouldn't look like a thousand threads to the kernel. The GPU would still be scheduled as one single entity (or maybe a couple of entities depending on how the GPU is partitioned). The fact that that single entity works by doing a lot of things in massive parallelism is kind of immaterial for the kernel that doesn't end up seeing that parallelism as separate threads.

**alleged danger of Artificial Intelligence**
by peter303

> Some computer experts like Marvin Minsky, Larry Page, Ray Kuzweil think A.I. will be a great gift to Mankind. Others like Bill Joy and Elon Musk are fearful of potential danger. Where do you stand, Linus?

**Linus**: I just don't see the thing to be fearful of.

We'll get AI, and it will almost certainly be through something very much like recurrent neural networks. And the thing is, since that kind of AI will need training, it won't be "reliable" in the traditional computer sense. It's not the old rule-based prolog days, when people thought they'd *understand* what the actual decisions were in an AI.

And that all makes it very interesting, of course, but it also makes it hard to productize. Which will very much limit where you'll actually find those neural networks, and what kinds of network sizes and inputs and outputs they'll have.

So I'd expect just more of (and much fancier) rather targeted AI, rather than anything human-like at all. Language recognition, pattern recognition, things like that. I just don't see the situation where you suddenly have some existential crisis because your dishwasher is starting to discuss Sartre with you.

The whole "Singularity" kind of event? Yeah, it's science fiction, and not very good SciFi at that, in my opinion. Unending exponential growth? What drugs are those people on? I mean, really..

It's like Moore's law - yeah, it's very impressive when something can (almost) be plotted on an exponential curve for a long time. Very impressive indeed when it's over many decades. But it's _still_ just the beginning of the "S curve". Anybody who thinks any different is just deluding themselves. There are no unending exponentials.

**Is the kernel basically a finished project?**
by NaCh0

> Aside from adding drivers and refactoring algorithms when performance limits are discovered, is there anything left for the kernel? Maybe it's a failure of tech journalism but we never hear about the next big thing in kernel land anymore.

**Linus**: I don't think there's much of a "next big thing" in the kernel.

I wouldn't say that there is nothing but drivers (and architectures are kind of "CPU drivers) and improving scalability left, because I'm constantly amazed by how many new things people figure out are still good ideas. But they tend to still be pretty incremental improvements. An OS kernel doesn't look *that* radically different from what it was 40 years ago, and that's fine. I think radical new ideas are often overrated, and the thing that really matters in the end is that plodding detail work. That's how technology evolves.

And judging by how our kernel releases are going, there's no end in sight for that "plodding detail work". And it's still as interesting as it ever was.

--------------------------------------------------------------------------------

via: http://linux.slashdot.org/story/15/06/30/0058243/interviews-linus-torvalds-answers-your-question

作者：[samzenpus][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:samzenpus@slashdot.org
[1]:http://interviews.slashdot.org/story/15/06/24/1718247/interview-ask-linus-torvalds-a-question
[2]:http://meta.slashdot.org/story/12/10/11/0030249/linus-torvalds-answers-your-questions
[3]:https://lwn.net/Articles/604695/
