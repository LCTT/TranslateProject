Meltdown and Spectre Linux Kernel Status
============================================================


By now, everyone knows that something “big” just got announced regarding computer security. Heck, when the [Daily Mail does a report on it][1] , you know something is bad…

Anyway, I’m not going to go into the details about the problems being reported, other than to point you at the wonderfully written [Project Zero paper on the issues involved here][2]. They should just give out the 2018 [Pwnie][3] award right now, it’s that amazingly good.

If you do want technical details for how we are resolving those issues in the kernel, see the always awesome [lwn.net writeup for the details][4].

Also, here’s a good summary of [lots of other postings][5] that includes announcements from various vendors.

As for how this was all handled by the companies involved, well this could be described as a textbook example of how  _NOT_  to interact with the Linux kernel community properly. The people and companies involved know what happened, and I’m sure it will all come out eventually, but right now we need to focus on fixing the issues involved, and not pointing blame, no matter how much we want to.

### What you can do right now

If your Linux systems are running a normal Linux distribution, go update your kernel. They should all have the updates in them already. And then keep updating them over the next few weeks, we are still working out lots of corner case bugs given that the testing involved here is complex given the huge variety of systems and workloads this affects. If your distro does not have kernel updates, then I strongly suggest changing distros right now.

However there are lots of systems out there that are not running “normal” Linux distributions for various reasons (rumor has it that it is way more than the “traditional” corporate distros). They rely on the LTS kernel updates, or the normal stable kernel updates, or they are in-house franken-kernels. For those people here’s the status of what is going on regarding all of this mess in the upstream kernels you can use.

### Meltdown – x86

Right now, Linus’s kernel tree contains all of the fixes we currently know about to handle the Meltdown vulnerability for the x86 architecture. Go enable the CONFIG_PAGE_TABLE_ISOLATION kernel build option, and rebuild and reboot and all should be fine.

However, Linus’s tree is currently at 4.15-rc6 + some outstanding patches. 4.15-rc7 should be out tomorrow, with those outstanding patches to resolve some issues, but most people do not run a -rc kernel in a “normal” environment.

Because of this, the x86 kernel developers have done a wonderful job in their development of the page table isolation code, so much so that the backport to the latest stable kernel, 4.14, has been almost trivial for me to do. This means that the latest 4.14 release (4.14.12 at this moment in time), is what you should be running. 4.14.13 will be out in a few more days, with some additional fixes in it that are needed for some systems that have boot-time problems with 4.14.12 (it’s an obvious problem, if it does not boot, just add the patches now queued up.)

I would personally like to thank Andy Lutomirski, Thomas Gleixner, Ingo Molnar, Borislav Petkov, Dave Hansen, Peter Zijlstra, Josh Poimboeuf, Juergen Gross, and Linus Torvalds for all of the work they have done in getting these fixes developed and merged upstream in a form that was so easy for me to consume to allow the stable releases to work properly. Without that effort, I don’t even want to think about what would have happened.

For the older long term stable (LTS) kernels, I have leaned heavily on the wonderful work of Hugh Dickins, Dave Hansen, Jiri Kosina and Borislav Petkov to bring the same functionality to the 4.4 and 4.9 stable kernel trees. I had also had immense help from Guenter Roeck, Kees Cook, Jamie Iles, and many others in tracking down nasty bugs and missing patches. I want to also call out David Woodhouse, Eduardo Valentin, Laura Abbott, and Rik van Riel for their help with the backporting and integration as well, their help was essential in numerous tricky places.

These LTS kernels also have the CONFIG_PAGE_TABLE_ISOLATION build option that should be enabled to get complete protection.

As this backport is very different from the mainline version that is in 4.14 and 4.15, there are different bugs happening, right now we know of some VDSO issues that are getting worked on, and some odd virtual machine setups are reporting strange errors, but those are the minority at the moment, and should not stop you from upgrading at all right now. If you do run into problems with these releases, please let us know on the stable kernel mailing list.

If you rely on any other kernel tree other than 4.4, 4.9, or 4.14 right now, and you do not have a distribution supporting you, you are out of luck. The lack of patches to resolve the Meltdown problem is so minor compared to the hundreds of other known exploits and bugs that your kernel version currently contains. You need to worry about that more than anything else at this moment, and get your systems up to date first.

Also, go yell at the people who forced you to run an obsoleted and insecure kernel version, they are the ones that need to learn that doing so is a totally reckless act.

### Meltdown – ARM64

Right now the ARM64 set of patches for the Meltdown issue are not merged into Linus’s tree. They are [staged and ready to be merged][6] into 4.16-rc1 once 4.15 is released in a few weeks. Because these patches are not in a released kernel from Linus yet, I can not backport them into the stable kernel releases (hey, we have [rules][7] for a reason…)

Due to them not being in a released kernel, if you rely on ARM64 for your systems (i.e. Android), I point you at the [Android Common Kernel tree][8] All of the ARM64 fixes have been merged into the [3.18,][9] [4.4,][10] and [4.9 branches][11] as of this point in time.

I would strongly recommend just tracking those branches as more fixes get added over time due to testing and things catch up with what gets merged into the upstream kernel releases over time, especially as I do not know when these patches will land in the stable and LTS kernel releases at this point in time.

For the 4.4 and 4.9 LTS kernels, odds are these patches will never get merged into them, due to the large number of prerequisite patches required. All of those prerequisite patches have been long merged and tested in the android-common kernels, so I think it is a better idea to just rely on those kernel branches instead of the LTS release for ARM systems at this point in time.

Also note, I merge all of the LTS kernel updates into those branches usually within a day or so of being released, so you should be following those branches no matter what, to ensure your ARM systems are up to date and secure.

### Spectre

Now things get “interesting”…

Again, if you are running a distro kernel, you  _might_  be covered as some of the distros have merged various patches into them that they claim mitigate most of the problems here. I suggest updating and testing for yourself to see if you are worried about this attack vector

For upstream, well, the status is there is no fixes merged into any upstream tree for these types of issues yet. There are numerous patches floating around on the different mailing lists that are proposing solutions for how to resolve them, but they are under heavy development, some of the patch series do not even build or apply to any known trees, the series conflict with each other, and it’s a general mess.

This is due to the fact that the Spectre issues were the last to be addressed by the kernel developers. All of us were working on the Meltdown issue, and we had no real information on exactly what the Spectre problem was at all, and what patches were floating around were in even worse shape than what have been publicly posted.

Because of all of this, it is going to take us in the kernel community a few weeks to resolve these issues and get them merged upstream. The fixes are coming in to various subsystems all over the kernel, and will be collected and released in the stable kernel updates as they are merged, so again, you are best off just staying up to date with either your distribution’s kernel releases, or the LTS and stable kernel releases.

It’s not the best news, I know, but it’s reality. If it’s any consolation, it does not seem that any other operating system has full solutions for these issues either, the whole industry is in the same boat right now, and we just need to wait and let the developers solve the problem as quickly as they can.

The proposed solutions are not trivial, but some of them are amazingly good. The [Retpoline][12] post from Paul Turner is an example of some of the new concepts being created to help resolve these issues. This is going to be an area of lots of research over the next years to come up with ways to mitigate the potential problems involved in hardware that wants to try to predict the future before it happens.

### Other arches

Right now, I have not seen patches for any other architectures than x86 and arm64\. There are rumors of patches floating around in some of the enterprise distributions for some of the other processor types, and hopefully they will surface in the weeks to come to get merged properly upstream. I have no idea when that will happen, if you are dependant on a specific architecture, I suggest asking on the arch-specific mailing list about this to get a straight answer.

### Conclusion

Again, update your kernels, don’t delay, and don’t stop. The updates to resolve these problems will be continuing to come for a long period of time. Also, there are still lots of other bugs and security issues being resolved in the stable and LTS kernel releases that are totally independent of these types of issues, so keeping up to date is always a good idea.

Right now, there are a lot of very overworked, grumpy, sleepless, and just generally pissed off kernel developers working as hard as they can to resolve these issues that they themselves did not cause at all. Please be considerate of their situation right now. They need all the love and support and free supply of their favorite beverage that we can provide them to ensure that we all end up with fixed systems as soon as possible.

--------------------------------------------------------------------------------

via: http://kroah.com/log/blog/2018/01/06/meltdown-status/

作者：[Greg Kroah-Hartman ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://kroah.com
[1]:http://www.dailymail.co.uk/sciencetech/article-5238789/Intel-says-security-updates-fix-Meltdown-Spectre.html
[2]:https://googleprojectzero.blogspot.fr/2018/01/reading-privileged-memory-with-side.html
[3]:https://pwnies.com/
[4]:https://lwn.net/Articles/743265/
[5]:https://lwn.net/Articles/742999/
[6]:https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=kpti
[7]:https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
[8]:https://android.googlesource.com/kernel/common/
[9]:https://android.googlesource.com/kernel/common/+/android-3.18
[10]:https://android.googlesource.com/kernel/common/+/android-4.4
[11]:https://android.googlesource.com/kernel/common/+/android-4.9
[12]:https://support.google.com/faqs/answer/7625886
