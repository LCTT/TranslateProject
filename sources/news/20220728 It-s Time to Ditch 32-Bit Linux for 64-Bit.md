[#]: subject: "It’s Time to Ditch 32-Bit Linux for 64-Bit"
[#]: via: "https://news.itsfoss.com/64-bit-linux/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

It’s Time to Ditch 32-Bit Linux for 64-Bit
======

We have plenty of [Linux distributions tailored for 32-bit systems][1].

So, why do I want to discourage using 32-bit and upgrade to 64-bit Linux instead?

There are a couple of reasons, and one of the biggest reasons came to the spotlight this week.

### 32-Bit: Ancient Hardware for E-Waste?

Of course, Linux distros allow you to re-use older hardware, unlike any other operating system.

You get the possibility to convert a system to a [media server][2], a storage server, and whatnot.

Here, I’m not giving you the idea to contribute more e-waste. It is always good to utilize your hardware as long as possible without replacing them.

However, the reasons not to use 32-bit systems may be more compelling than ever. The key highlight would be in terms of security and maintenance.

### Improved Security With 64-bit Linux

Spectre vulnerability made the buzz in 2018 as a dangerous security issue for processors. While it was fixed for Intel and AMD processors, it was not a pretty situation.

Unfortunately, a new exploit, **Retbleed**, a variant of Spectre, is here affecting Intel and AMD chips.

You can see it in action in the video below shared by the researchers who discovered it:

![][3]

So, naturally, we need appropriate measures to address a fix for this new security vulnerability.

**Here comes the shocker**: 64-bit Linux kernels have received a fix for it to protect the necessary Intel/AMD processors in question. But, Linux 32-bit kernels remain vulnerable to Retbleed, as reported by [Phoronix][4].

Pawan Gupta (Intel) responded to the concerns in the [kernel mailing list][5] by mentioning:

> Intel is not aware of production environments that use 32-bit mode on Skylake-gen CPUs. So this should not be a concern.

Also, it is rare to see any efforts for 32-bit maintenance. So, it should not come as a surprise.

Hence, if you use your system for any tasks that a security issue can disrupt, you should steer clear of 32-bit kernels.

Of course, exceptions can include that you have an entirely offline setup. So, it would be up to you, but it is not recommended.

### Don’t Care About Security?

Even if you do not have a problem with not getting critical security fixes like Retbleed, there will be more trouble with 32-bit systems in 2022.

Software maintainers aeventually giveup on tools and Linux distribution updates to work well with 32-bit systems.

So, you may not be left with actively maintained programs for your 32-bit Linux system very soon.

Hence, it would be a good idea to make the switch (and upgrade) now.

_Do you still use 32-bit Linux? What do you think about it? Share your thoughts in the comments below._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/64-bit-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/32-bit-linux-distributions/
[2]: https://itsfoss.com/best-linux-media-server/
[3]: https://i.ytimg.com/vi/dmSPvJxPm80/hqdefault.jpg
[4]: https://www.phoronix.com/news/Linux-x86-Retbleed
[5]: https://lore.kernel.org/lkml/20220715221901.xm3c4w4idqt67uja@desk/
