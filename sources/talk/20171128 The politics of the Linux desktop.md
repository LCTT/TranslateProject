The politics of the Linux desktop
============================================================

### If you're working in open source, why would you use anything but Linux as your main desktop?

 
![The politics of the Linux desktop](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_networks.png?itok=XasNXxKs "The politics of the Linux desktop")
Image by : opensource.com

At some point in 1997 or 1998—history does not record exactly when—I made the leap from Windows to the Linux desktop. I went through quite a few distributions, from Red Hat to SUSE to Slackware, then Debian, Debian Experimental, and (for a long time thereafter) Ubuntu. When I accepted a role at Red Hat, I moved to Fedora, and migrated both my kids (then 9 and 11) to Fedora as well.

More Linux resources

*   [What is Linux?][1]

*   [What are Linux containers?][2]

*   [Download Now: Linux commands cheat sheet][3]

*   [Advanced Linux commands cheat sheet][4]

*   [Our latest Linux articles][5]

For a few years, I kept Windows as a dual-boot option, and then realised that, if I was going to commit to Linux, then I ought to go for it properly. In losing Windows, I didn't miss much; there were a few games that I couldn't play, but it was around the time that the Civilization franchise was embracing Linux, so that kept me happy.

The move to Linux wasn't plain sailing, by any stretch of the imagination. If you wanted to use fairly new hardware in the early days, you had to first ensure that there were  _any_  drivers for Linux, then learn how to compile and install them. If they were not quite my friends, **lsmod** and **modprobe** became at least close companions. I taught myself to compile a kernel and tweak the options to make use of (sometimes disastrous) new, "EXPERIMENTAL" features as they came out. Early on, I learned the lesson that you should always keep at least one kernel in your [LILO][12] list that you were  _sure_  booted fully. I cursed NVidia and grew horrified by SCSI. I flirted with early journalling filesystem options and tried to work out whether the different preempt parameters made any noticeable difference to my user experience or not. I began to accept that printers would never print—and then they started to. I discovered that the Bluetooth stack suddenly started to connect to things.

Over the years, using Linux moved from being an uphill struggle to something that just worked. I moved my mother-in-law and then my father over to Linux so I could help administer their machines. And then I moved them off Linux so they could no longer ask me to help administer their machines.

Over the years, using Linux moved from being an uphill struggle to something that just worked.It wasn't just at home, either: I decided that I would use Linux as my desktop for work, as well. I even made it a condition of employment for at least one role. Linux desktop support in the workplace caused different sets of problems. The first was the "well, you're on your own: we're not going to support you" email from IT support. VPNs were touch and go, but in the end, usually go.

The biggest hurdle was Microsoft Office, until I discovered [CrossOver][13], which I bought with my own money, and which allowed me to run company-issued copies of Word, PowerPoint, and the rest on my Linux desktop. Fonts were sometimes a problem, and one company I worked for required Microsoft Lync. For this, and for a few other applications, I would sometimes have to run a Windows virtual machine (VM) on my Linux desktop.  Was this a cop out?  Well, a little bit: but I've always tried to restrict my usage of this approach to the bare minimum.

### But why?

"Why?" colleagues would ask. "Why do you bother? Why not just run Windows?"

"Because I enjoy pain," was usually my initial answer, and then the more honest, "because of the principle of the thing."

So this is it: I believe in open source. We have a number of very, very good desktop-compatible distributions these days, and most of the time they just work. If you use well-known or supported hardware, they're likely to "just work" pretty much as well as the two obvious alternatives, Windows or Mac. And they just work because many people have put much time into using them, testing them, and improving them. So it's not a case of why wouldn't I use Windows or Mac, but why would I ever consider  _not_  using Linux? If, as I do, you believe in open source, and particularly if you work within the open source community or are employed by an open source organisation, I struggle to see why you would even consider not using Linux.

So it's not a case of why wouldn't I use Windows or Mac, but why would I ever consider not using Linux?I've spoken to people about this (of course I have), and here are the most common reasons—or excuses—I've heard.

1.  I'm more productive on Windows/Mac.

2.  I can't use app X on Linux, and I need it for my job.

3.  I can't game on Linux.

4.  It's what our customers use, so why we would alienate them?

5.  "Open" means choice, and I prefer a proprietary desktop, so I use that.

Interestingly, I don't hear "Linux isn't good enough" much anymore, because it's manifestly untrue, and I can show that my own experience—and that of many colleagues—belies that.

### Rebuttals

If you believe in open source, then I contest that you should take the time to learn how to use a Linux desktop and the associated applications.Let's go through those answers and rebut them.

1.  **I'm more productive on Windows/Mac.** I'm sure you are. Anyone is more productive when they're using a platform or a system they're used to. If you believe in open source, then I contest that you should take the time to learn how to use a Linux desktop and the associated applications. If you're working for an open source organisation, they'll probably help you along, and you're unlikely to find you're much less productive in the long term. And, you know what? If you are less productive in the long term, then get in touch with the maintainers of the apps that are causing you to be less productive and help improve them. You don't have to be a coder. You could submit bug reports, suggest improvements, write documentation, or just test the most recent versions of the software. And then you're helping yourself and the rest of the community. Welcome to open source.

1.  **I can't use app X on Linux, and I need it for my job.** This may be true. But it's probably less true than you think. The people most often saying this with conviction are audio, video, or graphics experts. It was certainly the case for many years that Linux lagged behind in those areas, but have a look and see what the other options are. And try them, even if they're not perfect, and see how you can improve them. Alternatively, use a VM for that particular app.

1.  **I can't game on Linux.** Well, you probably can, but not all the games that you enjoy. This, to be clear, shouldn't really be an excuse not to use Linux for most of what you do. It might be a reason to keep a dual-boot system or to do what I did (after much soul-searching) and buy a games console (because Elite Dangerous really  _doesn't_  work on Linux, more's the pity). It should also be an excuse to lobby for your favourite games to be ported to Linux.

1.  **It's what our customers use, so why would we alienate them?** I don't get this one. Does Microsoft ban visitors with Macs from their buildings? Does Apple ban Windows users? Does Google allow non-Android phones through their doors? You don't kowtow to the majority when you're the little guy or gal; if you're working in open source, surely you should be proud of that. You're not going to alienate your customer—you're really not.

1.  **"Open" means choice, and I prefer a proprietary desktop, so I use that.**Being open certainly does mean you have a choice. You made that choice by working in open source. For many, including me, that's a moral and philosophical choice. Saying you embrace open source, but rejecting it in practice seems mealy mouthed, even insulting. Using openness to justify your choice is the wrong approach. Saying "I prefer a proprietary desktop, and company policy allows me to do so" is better. I don't agree with your decision, but at least you're not using the principle of openness to justify it.

Is using open source easy? Not always. But it's getting easier. I think that we should stand up for what we believe in, and if you're reading [Opensource.com][14], then you probably believe in open source. And that, I believe, means that you should run Linux as your main desktop.

 _Note: I welcome comments, and would love to hear different points of view. I would ask that comments don't just list application X or application Y as not working on Linux. I concede that not all apps do. I'm more interested in justifications that I haven't covered above, or (perceived) flaws in my argument. Oh, and support for it, of course._ 


### About the author

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/2017-05-10_0129.jpg?itok=Uh-eKFhx)][15] 
 
 Mike Bursell - I've been in and around Open Source since around 1997, and have been running (GNU) Linux as my main desktop at home and work since then: [not always easy][7]...  I'm a security bod and architect, and am currently employed as Chief Security Architect for Red Hat.  I have a blog - "[Alice, Eve & Bob][8]" - where I write (sometimes rather parenthetically) about security.  I live in the UK and... [more about Mike Bursell][9][More about me][10]

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/politics-linux-desktop

作者：[Mike Bursell ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mikecamel
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/article/17/11/politics-linux-desktop?rate=do69ixoNzK0yg3jzFk0bc6ZOBsIUcqTYv6FwqaVvzUA
[7]:https://opensource.com/article/17/11/politics-linux-desktop
[8]:https://aliceevebob.com/
[9]:https://opensource.com/users/mikecamel
[10]:https://opensource.com/users/mikecamel
[11]:https://opensource.com/user/105961/feed
[12]:https://en.wikipedia.org/wiki/LILO_(boot_loader)
[13]:https://en.wikipedia.org/wiki/CrossOver_(software)
[14]:https://opensource.com/
[15]:https://opensource.com/users/mikecamel
[16]:https://opensource.com/users/mikecamel
[17]:https://opensource.com/users/mikecamel
[18]:https://opensource.com/article/17/11/politics-linux-desktop#comments
[19]:https://opensource.com/tags/linux
