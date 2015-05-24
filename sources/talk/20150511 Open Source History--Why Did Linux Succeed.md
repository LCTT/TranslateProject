[translating by KayGuoWhu]
Open Source History: Why Did Linux Succeed?
================================================================================
> Why did Linux, the Unix-like operating system kernel started by Linus Torvalds in 1991 that became central to the open source world, succeed where so many similar projects, including GNU HURD and the BSDs, fail?

![](http://thevarguy.com/site-files/thevarguy.com/files/imagecache/medium_img/uploads/2015/05/linux.jpg)

One of the most puzzling questions about the history of free and open source is this: Why did Linux succeed so spectacularly, whereas similar attempts to build a free or open source, Unix-like operating system kernel met with considerably less success? I don't know the answer to that question. But I have rounded up some theories, which I'd like to lay out here.

First, though, let me make clear what I mean when I write that Linux was a great success. I am defining it in opposition primarily to the variety of other Unix-like operating system kernels, some of them open and some not, that proliferated around the time Linux was born. [GNU][1] HURD, the free-as-in-freedom kernel whose development began in [May 1991][2], is one of them. Others include Unices that most people today have never heard of, such as various derivatives of the Unix variant developed at the University of California at Berkeley, BSD; Xenix, Microsoft's take on Unix; academic Unix clones including Minix; and the original Unix developed under the auspices of AT&T, which was vitally important in academic and commercial computing circles during earlier decades, but virtually disappeared from the scene by the 1990s.

#### Related ####

- [Open Source History: Tracing the Origins of Hacker Culture and the Hacker Ethic][3]
- [Unix and Personal Computers: Reinterpreting the Origins of Linux][4]

I'd also like to make clear that I'm writing here about kernels, not complete operating systems. To a great extent, the Linux kernel owes its success to the GNU project as a whole, which produced the crucial tools, including compilers, a debugger and a BASH shell implementation, that are necessary to build a Unix-like operating system. But GNU developers never created a viable version of the the HURD kernel (although they are [still trying][5]). Instead, Linux ended up as the kernel that glued the rest of the GNU pieces together, even though that had never been in the GNU plans.

So it's worth asking why Linux, a kernel launched by Linus Torvalds, an obscure programmer in Finland, in 1991—the same year as HURD—endured and thrived within a niche where so many other Unix-like kernels, many of which enjoyed strong commercial backing and association with the leading Unix hackers of the day, failed to take off. To that end, here are a few theories pertaining to that question that I've come across as I've researched the history of the free and open source software worlds, along with the respective strengths and weaknesses of these various explanations.

### Linux Adopted a Decentralized Development Approach ###

This is the argument that comes out of Eric S. Raymond's essay, "[The Cathedral and the Bazaar][6]," and related works, which make the case that software develops best when a large number of contributors collaborate continuously within a relatively decentralized organizational structure. That was generally true of Linux, in contrast to, for instance, GNU HURD, which took a more centrally directed approach to code development—and, as a result, "had been evidently failing" to build a complete operating system for a decade, in Raymond's view.

To an extent, this explanation makes sense, but it has some significant flaws. For one, Torvalds arguably assumed a more authoritative role in directing Linux code development—deciding which contributions to include and reject—than Raymond and others have wanted to recognize. For another, this reasoning does not explain why GNU succeeded in producing so much software besides a working kernel. If only decentralized development works well in the free/open source software world, then all of GNU's programming efforts should have been a bust—which they most certainly were not.

### Linux is Pragmatic; GNU is Ideological ###

Personally, I find this explanation—which supposes that Linux grew so rapidly because its founder was a pragmatist who initially wrote the kernel just to be able to run a tailored Unix OS on his computer at home, not as part of a crusade to change the world through free software, as the GNU project aimed to do—the most compelling.

Still, it has some weaknesses that make it less than completely satisfying. In particular, while Torvalds himself adopted pragmatic principles, not all members of the community that coalesced around his project, then or today, have done the same. Yet, Linux has succeeded all the same.

Moreover, if pragmatism was the key to Linux's endurance, then why, again, was GNU successful in building so many other tools besides a kernel? If having strong political beliefs about software prevents you from pursuing successful projects, GNU should have been an outright failure, not an endeavor that produced a number of software packages that remain foundational to the IT world today.

Last but not least, many of the other Unix variants of the late 1980s and early 1990s, especially several BSD off-shoots, were the products of pragmatism. Their developers aimed to build Unix variants that could be more freely shared than those restricted by expensive commercial licenses, but they were not deeply ideological about programming or sharing code. Neither was Torvalds, and it is therefore difficult to explain Linux's success, and the failure of other Unix projects, in terms of ideological zeal.

### Operating System Design ###

There are technical differences between Linux and some other Unix variants that are important to keep in mind when considering the success of Linux. Richard Stallman, the founder of the GNU project, pointed to these in explaining, in an email to me, why HURD development had lagged: "It is true that the GNU Hurd is not a practical success. Part of the reason is that its basic design made it somewhat of a research project. (I chose that design thinking it was a shortcut to get a working kernel in a hurry.)"

Linux is also different from other Unix variants in the sense that Torvalds wrote all of the Linux code himself. Having a Unix of his own, free of other people's code, was one of his stated intentions when he [first announced Linux][7] in August 1991. This characteristic sets Linux apart from most of the other Unix variants that existed at that time, which derived their code bases from either AT&T Unix or Berkeley's BSD.

I'm not a computer scientist, so I'm not qualified to decide whether the Linux code was simply superior to that of the other Unices, explaining why Linux succeeded. But that's an argument someone might make—although it does not account for the disparity in culture and personnel between Linux and other Unix kernels, which, to me, seem more important than code in understanding Linux's success.

### The "Community" Put Its Support Behind Linux ###

Stallman also wrote that "mainly the reason" for Linux's success was that "Torvalds made Linux free software, and since then more of the community's effort has gone into Linux than into the Hurd." That's not exactly a complete explanation for Linux's trajectory, since it does not account for why the community of free software developers followed Torvalds instead of HURD or another Unix. But it nonetheless highlights this shift as a large part of how Linux prevailed.

A fuller account of the free software community's decision to endorse Linux would have to explain why developers did so even though, at first, Linux was a very obscure project—much more so, by any measure, than some of the other attempts at the time to create a freer Unix, such as NET BSD and 386/BSD—as well as one whose affinity with the goals of the free software movement was not at first clear. Originally, Torvalds released Linux under a license that simply prevented its commercial use. It was considerably later that he switched to the GNU General Public License, which protects the openness of source code.

So, those are the explanations I've found for Linux's success as an open source operating system kernel—a success which, to be sure, has been measured in some respects (desktop Linux never became what its proponents hoped, for instance). But Linux has also become foundational to the computing world in ways that no other Unix-like OS has. Maybe Apple OS X and iOS, which derive from BSD, come close, but they don't play such a central role as Linux in powering the Internet, among other things.

Have other ideas on why Linux became what it did, or why its counterparts in the Unix world have now almost all sunk into obscurity? (I know: BSD variants still have a following today, and some commercial Unices remain important enough for [Red Hat][8] (RHT) to be [courting their users][9]. But none of these Unix holdouts have conquered everything from Web servers to smartphones in the way Linux has.) I'd be delighted to hear them.

--------------------------------------------------------------------------------

via: http://thevarguy.com/open-source-application-software-companies/050415/open-source-history-why-did-linux-succeed

作者：[hristopher Tozzi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://thevarguy.com/author/christopher-tozzi
[1]:http://gnu.org/
[2]:http://www.gnu.org/software/hurd/history/hurd-announce
[3]:http://thevarguy.com/open-source-application-software-companies/042915/open-source-history-tracing-origins-hacker-culture-and-ha
[4]:http://thevarguy.com/open-source-application-software-companies/042715/unix-and-personal-computers-reinterpreting-origins-linux
[5]:http://thevarguy.com/open-source-application-software-companies/042015/30-years-hurd-lives-gnu-updates-open-source-
[6]:http://www.catb.org/esr/writings/cathedral-bazaar/cathedral-bazaar/
[7]:https://groups.google.com/forum/#!topic/comp.os.minix/dlNtH7RRrGA[1-25]
[8]:http://www.redhat.com/
[9]:http://thevarguy.com/open-source-application-software-companies/032614/red-hat-grants-certification-award-unix-linux-migration-a