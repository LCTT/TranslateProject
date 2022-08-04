[#]: subject: "Linux Kernel 6.0 is Likely the Next Version Upgrade With Initial Rust Code"
[#]: via: "https://news.itsfoss.com/linux-kernel-6-0-reveal/"
[#]: author: "Anuj Sharma https://news.itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 6.0 is Likely the Next Version Upgrade With Initial Rust Code
======
Linux Kernel’s next upgrade is going to be 6.0, instead of Linux 5.20. That’s what Linus Torvalds is going with. Sounds good!

![linux kernel][1]

You might be aware of the fact that Linus Torvalds used an Apple MacBook hardware to release [Linux Kernel 5.19][2].

But, the news wasn’t limited to one interesting observation.

Linus Torvalds also mentioned at the end of the [release announcement][3] that he might call the next version upgrade of Linux Kernel as 6.0.

### Linux Version Numbers Decoded: Why 6.0?

So, why the change in version numbers for an upgrade?

To understand the versioning scheme, let us take an example of **Linux Kernel 5.18.5** (that’s what I’m running on my system).

If you want to check the Linux Kernel version on your system, simply head to the terminal and type in:

```
uname -r
```

* The first number ‘5’ represents the major version
* The second number, ’18’ represents the series of minor updates.
* The third number, ’15,’ represents the patch version

The Linux Kernel usually follows the [Semantic Versioning][4] (A versioning system used in open source software).

However, when it comes to major upgrades, the developers seem to avoid numbers that seem too big.

So, instead of going with Linux Kernel 5.20, it will just be Linux Kernel 6.0 (or Linux 6.0). There’s no hard rule on this, only when Linus Torvalds gets worried with the number, we have a shorter version number.

Linus Torvalds mentioned the same for changing the version number in the mailing list:

> I’ll likely call it 6.0 since I’m starting to worry about getting confused by big numbers again.

### New Features Coming to Linux 6.0

If you are curious, here are some features that might be a part of the Linux Kernel 6.0 release:

* Inclusion of Rust code (early phase)
* Real-time Kernel building support
* New Hardware support
* Usual Improvements to various Filesystems
* Scheduler changes

Most of the anticipated feature additions are likely to be technical changes, so you may not have enough to get excited about as an end-user.

But, it should be huge if the initial Rust code arrives with the next Linux Kernel upgrade.

*So, what do you think about the upcoming Linux Kernel 6.0? Do you wish to see Rust kernel code land?*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-6-0-reveal/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/08/linux-kernel-6-0.jpg
[2]: https://news.itsfoss.com/linux-kernel-5-19-release/
[3]: https://lore.kernel.org/all/CAHk-=wgrz5BBk=rCz7W28Fj_o02s0Xi0OEQ3H1uQgOdFvHgx0w@mail.gmail.com/
[4]: https://semver.org/
