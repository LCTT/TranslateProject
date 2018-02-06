Translating by qhwdw
Which Linux Kernel Version Is ‘Stable’?
============================================================


![Linux kernel ](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/apple1.jpg?itok=PGRxOQz_ "Linux kernel")
Konstantin Ryabitsev explains which Linux kernel versions are considered "stable" and how to choose what's right for you.[Creative Commons Zero][1]

Almost every time Linus Torvalds releases [a new mainline Linux kernel][4], there's inevitable confusion about which kernel is the "stable" one now. Is it the brand new X.Y one, or the previous X.Y-1.Z one? Is the brand new kernel too new? Should you stick to the previous release?

The [kernel.org][5] page doesn't really help clear up this confusion. Currently, right at the top of the page. we see that 4.15 is the latest stable kernel -- but then in the table below, 4.14.16 is listed as "stable," and 4.15 as "mainline." Frustrating, eh?

Unfortunately, there are no easy answers. We use the word "stable" for two different things here: as the name of the Git tree where the release originated, and as indicator of whether the kernel should be considered “stable” as in “production-ready.”

Due to the distributed nature of Git, Linux development happens in a number of [various forked repositories][6]. All bug fixes and new features are first collected and prepared by subsystem maintainers and then submitted to Linus Torvalds for inclusion into [his own Linux tree][7], which is considered the “master” Git repository. We call this the “mainline” Linux tree.

### Release Candidates

Before each new kernel version is released, it goes through several “release candidate” cycles, which are used by developers to test and polish all the cool new features. Based on the feedback he receives during this cycle, Linus decides whether the final version is ready to go yet or not. Usually, there are 7 weekly pre-releases, but that number routinely goes up to -rc8, and sometimes even up to -rc9 and above. When Linus is convinced that the new kernel is ready to go, he makes the final release, and we call this release “stable” to indicate that it’s not a “release candidate.”

### Bug Fixes

As any kind of complex software written by imperfect human beings, each new version of the Linux kernel contains bugs, and those bugs require fixing. The rule for bug fixes in the Linux Kernel is very straightforward: all fixes must first go into Linus’s tree. Once the bug is fixed in the mainline repository, it may then be applied to previously released kernels that are still maintained by the Kernel development community. All fixes backported to stable releases must meet a [set of important criteria][8] before they are considered -- and one of them is that they “must already exist in Linus’s tree.” There is a [separate Git repository][9] used for the purpose of maintaining backported bug fixes, and it is called the “stable” tree -- because it is used to track previously released stable kernels. It is maintained and curated by Greg Kroah-Hartman.

### Latest Stable Kernel

So, whenever you visit kernel.org looking for the latest stable kernel, you should use the version that is in the Big Yellow Button that says “Latest Stable Kernel.”

![sWnmAYf0BgxjGdAHshK61CE9GdQQCPBkmSF9MG8s](https://lh6.googleusercontent.com/sWnmAYf0BgxjGdAHshK61CE9GdQQCPBkmSF9MG8sYqZsmL6e0h8AiyJwqtWYC-MoxWpRWHpdIEpKji0hJ5xxeYshK9QkbTfubFb2TFaMeFNmtJ5ypQNt8lAHC2zniEEe8O4v7MZh)

Ah, but now you may wonder -- if both 4.15 and 4.14.16 are stable, then which one is more stable? Some people avoid using ".0" releases of kernel because they think a particular version is not stable enough until there is at least a ".1". It's hard to either prove or disprove this, and there are pro and con arguments for both, so it's pretty much up to you to decide which you prefer.

On the one hand, anything that goes into a stable tree release must first be accepted into the mainline kernel and then backported. This means that mainline kernels will always have fresher bug fixes than what is released in the stable tree, and therefore you should always use mainline “.0” releases if you want fewest “known bugs.”

On the other hand, mainline is where all the cool new features are added -- and new features bring with them an unknown quantity of “new bugs” that are not in the older stable releases. Whether new, unknown bugs are more worrisome than older, known, but yet unfixed bugs -- well, that is entirely your call. However, it is worth pointing out that many bug fixes are only thoroughly tested against mainline kernels. When patches are backported into older kernels, chances are they will work just fine, but there are fewer integration tests performed against older stable releases. More often than not, it is assumed that "previous stable" is close enough to current mainline that things will likely "just work." And they usually do, of course, but this yet again shows how hard it is to say "which kernel is actually more stable."

So, basically, there is no quantitative or qualitative metric we can use to definitively say which kernel is more stable -- 4.15 or 4.14.16\. The most we can do is to unhelpfully state that they are "differently stable.”

 _Learn more about Linux through the free ["Introduction to Linux" ][3]course from The Linux Foundation and edX._

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/2/which-linux-kernel-version-stable

作者：[KONSTANTIN RYABITSEV ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/apple1jpg
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[4]:https://www.linux.com/blog/intro-to-linux/2018/1/linux-kernel-415-unusual-release-cycle
[5]:https://www.kernel.org/
[6]:https://git.kernel.org/pub/scm/linux/kernel/git/
[7]:https://git.kernel.org/torvalds/c/v4.15
[8]:https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
[9]:https://git.kernel.org/stable/linux-stable/c/v4.14.16
