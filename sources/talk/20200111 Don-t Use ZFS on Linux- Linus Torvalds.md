[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Don’t Use ZFS on Linux: Linus Torvalds)
[#]: via: (https://itsfoss.com/linus-torvalds-zfs/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Don’t Use ZFS on Linux: Linus Torvalds
======

_“Don’t use ZFS. It’s that simple. It was always more of a buzzword than anything else, I feel, and the licensing issues just make it a non-starter for me.”_

This is what Linus Torvalds [said in a mailing list][1] to once again express his disliking for [ZFS filesystem][2] specially over its licensing.

To avoid unnecessary confusion, this is more intended for Linux distributions, kernel developers and maintainers rather than individual Linux users.

### What’s the licensing issue with ZFS and Linux kernel?

![][3]

ZFS was open sourced around 2003. This would have meant that Linux distributions start supporting ZFS. But that didn’t really happen because of the complexity of [open source licenses][4].

ZFS is open source under [Common Development and Distribution License][5] (CDDL) 1.0 whereas Linux kernel is licensed under the GNU General Public License (GPL) 2.0.

These two open source licenses are not fully compatible with each other. As noted by [PCWorld][6], if ZFS with this license is included in the Linux kernel, this would mean that kernel+ZFS is a derivative work of the (original ZFS-less) Linux kernel.

### Torvalds doesn’t trust Oracle

![][7]

While the whole derivative thing is a matter of debate for legal and licensing experts, Torvalds is skeptical of Oracle. Oracle has a history of suing enterprises for using its code. Remember [Oracle vs Android lawsuit over the use of Java][8]?

> Other people think it can be ok to merge ZFS code into the kernel and that the module interface makes it ok, and that’s their decision. But considering Oracle’s litigious nature, and the questions over licensing, there’s no way I can feel safe in ever doing so.
>
> And I’m not at all interested in some “ZFS shim layer” thing either that some people seem to think would isolate the two projects. That adds no value to our side, and given Oracle’s interface copyright suits (see Java), I don’t think it’s any real licensing win either.

Torvalds doesn’t want Linux kernel to get into legal troubles with Oracle in future and hence he refuses to include ZFS in mainline kernel until Orcale provides a signed letter that a kernel with ZFS will be under GPL license.

> And honestly, there is no way I can merge any of the ZFS efforts until I get an official letter from Oracle that is signed by their main legal counsel or preferably by Larry Ellison himself that says that yes, it’s ok to do so and treat the end result as GPL’d.

He is not stopping other (distributions) from using ZFS. But they are on their own.

> If somebody adds a kernel module like ZFS, they are on their own. I can’t maintain it, and I can not be bound by other peoples kernel changes.

Canonical, Ubuntu’s parent company, has been too keen on ZFS. Their [legal department thinks that including ZFS in kernel doesn’t make it a derivative work][9]. So they took their chances and now they provide an option to [use ZFS on root from Ubuntu 19.10][10].

### Torvalds is also not impressed with ZFS in general

![][11]

While some people drool over ZFS, Linus Torvalds is not that impressed with ZFS. He doesn’t think it’s using ZFS is a good idea specially when it is not actively maintained by Oracle (after they open sourced it)

> The benchmarks I’ve seen do not make ZFS look all that great. And as far as I can tell, it has no real maintenance behind it either any more, so from a long-term stability standpoint, why would you ever want to use it in the first place?

I am no legal expert but if there is even a slightest doubt, I would prefer staying away from ZFS. What do you think of the whole ZFS debate?

--------------------------------------------------------------------------------

via: https://itsfoss.com/linus-torvalds-zfs/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.realworldtech.com/forum/?threadid=189711&curpostid=189841
[2]: https://itsfoss.com/what-is-zfs/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/dont_use_zfs_torvalds.jpg?ssl=1
[4]: https://itsfoss.com/open-source-licenses-explained/
[5]: https://opensource.org/licenses/CDDL-1.0
[6]: https://www.pcworld.com/article/3061924/ubuntu-1604s-support-for-the-zfs-file-system-may-violate-the-general-public-license.html
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/linus-torvalds-zfs-quotes-1.jpg?ssl=1
[8]: https://itsfoss.com/oracle-google-dispute/
[9]: https://ubuntu.com/blog/zfs-licensing-and-linux
[10]: https://itsfoss.com/zfs-ubuntu/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/linus-torvalds-zfs-quotes-2.jpg?ssl=1
