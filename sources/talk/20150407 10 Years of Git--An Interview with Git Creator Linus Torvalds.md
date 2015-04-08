Git的十年：采访Git的创造者Linus Torvalds 
================================================================================
> Linus Torvalds解释了他为什么会创造Git
> 
> ![](http://www.linuxveda.com/wp-content/uploads/2014/10/Linus_Torvalds.jpg)
> 
> 感谢Linus的Git，如今GitHub已经是全世界最大的代码托管网站，它拥有九百万用户和超过两千一百一十万个代码库。
> 
> 来自Swapnil Bhartiya -
> 
> Git将会在本月庆祝它的十周年庆。这是Linus Torvalds除了Sub Surface和Linux之外全世界范围内的另外一个庆祝会。 [Linux基金会的Jennifer Cloer采访了这位Linux之父][2] 并且给我们带来了Git背后的许多故事。
> 
> 当Cloer问及Linus为什么会创造Git时，他是这么回答的：
> 
> “我其实根本没想过要做源代码控制管理系统，我感觉在计算机世界里那是一件很没劲的事情（数据库可能是例外 ;^），我要很讨厌富有激情的软件配置管理。”
> 
> 接着他拿他一开始使用的BitKeeper调侃了起来：
> 
> “BK有很多很棒的功能，它拥有代码库的本地拷贝，分布式合并也是一个好做法。”
> 
> 但是他并不满意：
> 
> “I had performance requirements that were not even remotely satisfied by what was available, and I also worried about integrity of the code and the whole workflow, so I ended up just deciding to write my own.”
> 
> And the rest is history. Today GitHub is the world’s biggest  code hoster in the world with over 9 million users and over 21.1 million repositories.
> 
> via:http://www.linuxveda.com/2015/04/06/linus-torvalds-explains-why-he-created-git/

![](http://www.linux.com/images/stories/714/Linus-Torvalds-LinuxCon-Europe-2014.jpg)

Ten years ago this week, the Linux kernel community faced a daunting challenge: They could no longer use their revision control system BitKeeper and no other Software Configuration Management (SCMs) met their needs for a distributed system. Linus Torvalds, the creator of Linux, took the challenge into his own hands and disappeared over the weekend to emerge the following week with Git. Today Git is used for thousands of projects and has ushered in a new level of social coding among programmers.

To celebrate this milestone, we asked Linus to share the behind-the-scenes story of Git and tell us what he thinks of the project and its impact on software development. You'll find his comments in the story below. We'll follow this Q&A with a week of Git in which we profile a different project each day that is using the revision control system. Look for the stories behind KVM, Qt, Drupal, Puppet and Wine, among others. 

### Why did you create Git? ###

**Torvalds**: I really never wanted to do source control management at all and felt that it was just about the least interesting thing in the computing world (with the possible exception of databases ;^), and I hated all SCM's with a passion. But then BitKeeper came along and really changed the way I viewed source control. BK got most things right and having a local copy of the repository and distributed merging was a big deal. The big thing about distributed source control is that it makes one of the main issues with SCM's go away - the politics around "who can make changes." BK showed that you can avoid that by just giving everybody their own source repository. But BK had its own problems, too; there were a few technical choices that caused problems (renames were painful), but the biggest downside was the fact that since it wasn't open source, there was a lot of people who didn't want to use it. So while we ended up having several core maintainers use BK - it was free to use for open source projects - it never got ubiquitous. So it helped kernel development, but there were still pain points.

That then came to a head when Tridge (Andrew Tridgell) started reverse-engineering the (fairly simply) BK protocol, which was against the usage rules for BK. I spent a few weeks (months? It felt that way) trying to mediate between Tridge and Larry McVoy, but in the end it clearly wasn't working. So at some point I decided that I can't continue using BK, but that I really didn't want to go back to the bad old pre-BK days. Sadly, at the time, while there were some other SCM's that kind of tried to get the whole distributed thing, none of them did it remotely well.  I had performance requirements that were not even remotely satisfied by what was available, and I also worried about integrity of the code and the whole workflow, so I ended up just deciding to write my own.

### How did you approach it? Did you stay up all weekend to write it or was it just during regular hours? ###

**Torvalds**: Heh. You can actually see how it all took shape in the git source code repository, except for the very first day or so. It took about a day to get to be "self-hosting" so that I could start committing things into git using git itself, so the first day or so is hidden, but everything else is there. The work was clearly mostly during the day, but there's a few midnight entries and a couple of 2 a.m. ones. The most interesting part is how quickly it took shape ; the very first commit in the git tree is not a lot of code, but it already did the basics - enough to commit itself. The trick wasn't really so much the coding but coming up with how it organizes the data.

So I'd like to stress that while it really came together in just about ten days or so (at which point I did my first *kernel* commit using git), it wasn't like it was some kind of mad dash of coding. The actual amount of that early code is actually fairly small, it all depended on getting the basic ideas right. And that I had been mulling over for a while before the whole project started. I'd seen the problems others had. I'd seen what I wanted to avoid doing. 

### Has it lived up to your expectations? How is it working today in your estimation? Are there any limitations? ###

**Torvalds**: I'm very happy with git. It works remarkably well for the kernel and is still meeting all my expectations. What I find interesting is how it took over so many other projects, too. Surprisingly quickly, in the end. There is a lot of inertia in switching source control systems;  just look at how long CVS and even RCS have stayed around, but at some point git just took over.

### Why do you think it's been so widely adopted? ###

**Torvalds**: I think that many others had been frustrated by all the same issues that made me hate SCM's, and while there have been many projects that tried to fix one or two small corner cases that drove people wild, there really hadn't been anything like git that really ended up taking on the big problems head on. Even when people don't realize how important that "distributed" part was (and a lot of people were fighting it), once they figure out that it allows those easy and reliable backups, and allows people to make their own private test repositories without having to worry about the politics of having write access to some central repository, they'll never go back.

### Does Git last forever, or do you foresee another revision control system in another 10 years? Will you be the one to write it?  ###

**Torvalds**: I'm not going to be the one writing it, no. And maybe we'll see something new in ten years, but I guarantee that it will be pretty "git-like." It's not like git got everything right, but it got all the really basic issues right in a way that no other SCM had ever done before.

No false modesty ;)

### Why does Git work so well for Linux? ###

**Torvalds**: Well, it was obviously designed for our workflow, so that is part of it. I've already mentioned the whole "distributed" part many times, but it bears repeating. But it was also designed to be efficient enough for a biggish project like Linux, and it was designed to do things that people considered "hard" before git - because those are the things *I* do every day.

Just to pick an example: the concept of "merging" was generally considered to be something really quite painful and hard in most SCM's. You'd plan your merges, because they were big deals. That's not acceptable to me, since I commonly do tens of merges a day when in the merge window, and even then, the biggest overhead shouldn't be the merge itself, it should be testing the result. The "git" part of the merge is just a couple of seconds, it should take me much longer just to write the merge explanation message.

So git was basically designed and written for my requirements, and it shows.

### People have said that Git is only for super smart people. Even Andrew Morton said Git is "expressly designed to make you feel less intelligent than you thought you were." What's your response to this? ###

**Torvalds**: So I think it used to be true but isn't any more. There is a few reasons people feel that way, but I think only one of them remains. The one that remains is fairly simple: "you can do things so many ways."

You can do a lot of things with git, and many of the rules of what you *should* do are not so much technical limitations but are about what works well when working together with other people. So git is a very powerful set of tools, and that can not only be overwhelming at first, it also means that you can often do the same (or similar) things different ways, and they all "work." Generally, the best way to learn git is probably to first only do very basic things and not even look at some of the things you can do until you are familiar and confident about the basics.

There's a few historical reasons for why git was considered complicated. One of them is that it was complicated. The people who started using git very early on in order to work on the kernel really had to learn a very rough set of scripts to make everything work. All the effort had been on making the core technology work and very little on making it easy or obvious. So git (deservedly) had a reputation for requiring you to know exactly what you did early on. But that was mainly true for the first 6 months or a year.

The other big reason people thought git was hard is that git is very different. There are people who used things like CVS for a decade or two, and git is not CVS. Not even close. The concepts are different. The commands are different. Git never even really tried to look like CVS, quite the reverse. And if you've used a CVS-like system for a long time, that makes git appear complicated and needlessly different. People were put off by the odd revision numbers. Why is a git revision not "1.3.1" with nice incrementing numbers like it was in CVS? Why is it that odd scary 40-character HEX number?

But git wasn't "needlessly different." The differences are required. It's just that it made some people really think it was more complicated than it is, because they came from a very different background. The "CVS background" thing is going away. By now there are probably lots of programmers out there who have never used CVS in their lives and would find the CVS way of doing things very confusing, because they learned git first.

### Do you think the rate of Linux kernel development would have been able to grow at its current rate without Git? Why or why not? ###

**Torvalds**: Well, "without git," sure. But it would have required that somebody else wrote something git-equivalent: a distributed SCM that is as efficient as git is. We definitely needed something *like* git.

### What's your latest opinion of GitHub? ###

**Torvalds**: Github is an excellent hosting service; I have nothing against it at all. Now, the complaints I've had is that GitHub as a development platform - making commits, pull requests, keeping track of issues etc - doesn't work very well at all. It's not even close, not for something like the kernel. It's much too limited.

That's partly because of how the kernel is developed, but part of it was that the GitHub interfaces were actively encouraging bad behavior. Commits done on GitHub had bad commit messages etc, because the web interfaces at GitHub were actively encouraging bad behavior. They did fix some of that, so it probably works better, but it will never be appropriate for something like the Linux kernel.

### What is the most interesting use you've seen for Git and/or GitHub? ###

**Torvalds**: I'm just happy that it made it so easy to start a new project. Project hosting used to be painful, and with git and GitHub it's just so trivial to do a random small project. It doesn't matter what the project is; what matters is that you can do it.

### Do you have side projects up your sleeve today? Any more brilliant software projects that will dominate software development for years to come? ###

**Torvalds**: Nothing planned. But I'll let you know if that changes.

Atlassian is also helping to celebrate the anniversary of Git. Click on the image below to [take a walk down memory lane][1]. 

![](http://www.linux.com/images/stories/714/AtlassianGit10year.jpg)

--------------------------------------------------------------------------------

via: http://www.linux.com/news/featured-blogs/185-jennifer-cloer/821541-10-years-of-git-an-interview-with-git-creator-linus-torvalds

作者：[Jennifer Cloer][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/714/catid/185-jennifer-cloer
[1]:https://www.atlassian.com/git/articles/10-years-of-git/
[2]:http://www.linux.com/news/featured-blogs/185-jennifer-cloer/821541-10-years-of-git-an-interview-with-git-creator-linus-torvalds
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]:
