A new Mindcraft moment?
=======================

Credit:Jonathan Corbet

It is not often that Linux kernel development attracts the attention of a mainstream newspaper like The Washington Post; lengthy features on the kernel community's approach to security are even more uncommon. So when just such a feature hit the net, it attracted a lot of attention. This article has gotten mixed reactions, with many seeing it as a direct attack on Linux. The motivations behind the article are hard to know, but history suggests that we may look back on it as having given us a much-needed push in a direction we should have been going for some time.

Think back, a moment, to the dim and distant past — April 1999, to be specific. An analyst company named Mindcraft issued a report showing that Windows NT greatly outperformed Red Hat Linux 5.2 and Apache for web-server workloads. The outcry from the Linux community, including from a very young LWN, was swift and strong. The report was a piece of Microsoft-funded FUD trying to cut off an emerging threat to its world-domination plans. The Linux system had been deliberately configured for poor performance. The hardware chosen was not well supported by Linux at the time. And so on.

Once people calmed down a bit, though, one other fact came clear: the Mindcraft folks, whatever their motivations, had a point. Linux did, indeed, have performance problems that were reasonably well understood even at the time. The community then did what it does best: we sat down and fixed the problems. The scheduler got exclusive wakeups, for example, to put an end to thethundering-herd problem in the acceptance of connection requests. Numerous other little problems were fixed. Within a year or so, the kernel's performance on this kind of workload had improved considerably.

The Mindcraft report, in other words, was a much-needed kick in the rear that got the community to deal with issues that had been neglected until then.

The Washington Post article seems clearly slanted toward a negative view of the Linux kernel and its contributors. It freely mixes kernel problems with other issues (the AshleyMadison.com breakin, for example) that were not kernel vulnerabilities at all. The fact that vendors seem to have little interest in getting security fixes to their customers is danced around like a huge elephant in the room. There are rumors of dark forces that drove the article in the hopes of taking Linux down a notch. All of this could well be true, but it should not be allowed to overshadow the simple fact that the article has a valid point.

We do a reasonable job of finding and fixing bugs. Problems, whether they are security-related or not, are patched quickly, and the stable-update mechanism makes those patches available to kernel users. Compared to a lot of programs out there (free and proprietary alike), the kernel is quite well supported. But pointing at our ability to fix bugs is missing a crucial point: fixing security bugs is, in the end, a game of whack-a-mole. There will always be more moles, some of which we will not know about (and will thus be unable to whack) for a long time after they are discovered and exploited by attackers. These bugs leave our users vulnerable, even if the commercial side of Linux did a perfect job of getting fixes to users — which it decidedly does not.

The point that developers concerned about security have been trying to make for a while is that fixing bugs is not enough. We must instead realize that we will never fix them all and focus on making bugs harder to exploit. That means restricting access to information about the kernel, making it impossible for the kernel to execute code in user-space memory, instrumenting the kernel to detect integer overflows, and all the other things laid out in Kees Cook's Kernel Summit talk at the end of October. Many of these techniques are well understood and have been adopted by other operating systems; others will require innovation on our part. But, if we want to adequately defend our users from attackers, these changes need to be made.

Why hasn't the kernel adopted these technologies already? The Washington Post article puts the blame firmly on the development community, and on Linus Torvalds in particular. The culture of the kernel community prioritizes performance and functionality over security and is unwilling to make compromises if they are needed to improve the security of the kernel. There is some truth to this claim; the good news is that attitudes appear to be shifting as the scope of the problem becomes clear. Kees's talk was well received, and it clearly got developers thinking and talking about the issues.

The point that has been missed is that we do not just have a case of Linus fending off useful security patches. There simply are not many such patches circulating in the kernel community. In particular, the few developers who are working in this area have never made a serious attempt to get that work integrated upstream. Getting any large, intrusive patch set merged requires working with the kernel community, making the case for the changes, splitting the changes into reviewable pieces, dealing with review comments, and so on. It can be tiresome and frustrating, but it's how the kernel works, and it clearly results in a more generally useful, more maintainable kernel in the long run.

Almost nobody is doing that work to get new security technologies into the kernel. One might cite a "chilling effect" from the hostile reaction such patches can receive, but that is an inadequate answer: developers have managed to merge many changes over the years despite a difficult initial reaction. Few security developers are even trying.

Why aren't they trying? One fairly obvious answer is that almost nobody is being paid to try. Almost all of the work going into the kernel is done by paid developers and has been for many years. The areas that companies see fit to support get a lot of work and are well advanced in the kernel. The areas that companies think are not their problem are rather less so. The difficulties in getting support for realtime development are a clear case in point. Other areas, such as documentation, tend to languish as well. Security is clearly one of those areas. There are a lot of reasons why Linux lags behind in defensive security technologies, but one of the key ones is that the companies making money on Linux have not prioritized the development and integration of those technologies.

There are signs that things might be changing a bit. More developers are showing interest in security-related issues, though commercial support for their work is still less than it should be. The reaction against security-related changes might be less knee-jerk negative than it used to be. Efforts like the Kernel Self Protection Project are starting to work on integrating existing security technologies into the kernel.

We have a long way to go, but, with some support and the right mindset, a lot of progress can be made in a short time. The kernel community can do amazing things when it sets its mind to it. With luck, the Washington Post article will help to provide the needed impetus for that sort of setting of mind. History suggests that we will eventually see this moment as a turning point, when we were finally embarrassed into doing work that has clearly needed doing for a while. Linux should not have a substandard security story for much longer.

---------------------------

via: https://lwn.net/Articles/663474/

作者：Jonathan Corbet

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)


本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
