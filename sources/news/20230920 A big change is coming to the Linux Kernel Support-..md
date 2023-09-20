[#]: subject: "A big change is coming to the Linux Kernel Support…."
[#]: via: "https://news.itsfoss.com/linux-kernel-support/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A big change is coming to the Linux Kernel Support….
======
While this is a significant change on paper, how can it affect the
users? Thoughts?
The [Open Source Summit Europe][1] edition has kicked off, and we are starting to see some interesting news surrounding Linux and open-source software in general.

One such news is regarding how [Long-term Support][2] (LTS) Linux kernel versions will be handled going forward.

Let's take a look at the upcoming changes.

**What's happening:** At the summit, Jonathan Corbett, Linux developer and executive editor at [LWN][3] disclosed that **the LTS period for the Linux kernel is being brought down to two years, from the previous six years period**.

Seeing that currently there are **six LTS Linux Kernels** , 4.14, 4.19, 5.4, 5.10, 5.15, and 6.1.

In the future, after 4.14, when the next two in line exit LTS status, **they will not be replaced with other kernel versions**.

📋

You can refer to [The Linux Kernel Archives][4] for knowing the projected end-of-life of the current LTS Linux kernels.

**Why Now:** One of the reasons Jonathan mentions is the fact that **not many people use older versions of the Linux kernel** , so there's not much point in maintaining those.

And, I do agree with that. However, there will be some out there who won't be happy with this move.

But, there's **a bigger problem at hand** that has pushed this decision forward, and that is the **matter of Linux code maintainers being burnt out**.

You see, checking/improving the code for an LTS release is a major task that can take up a lot of time and effort to get it done right, and this is where the problem lies.

According to Jonathan, there are **two distinct obstacles that maintainers face** , one is that **many** **maintainers are not paid to maintain the Linux kernel**.

The second one is the **use of the '[Fuzzing][5]' technique to find bugs**, which is helpful, but at times can also uncover numerous minor bugs that will require the maintainers' attention.

You see how this can easily burn out a maintainer? 🙁

When asked; **How can maintainers get help?** , Jonathan suggested that they speak with their employers for getting them paid for their Linux kernel maintainer work.

He also added that:

> Companies must realize they need to give back to Linux if they want to continue to reap its benefits.

So, wrapping up.

This move will lessen the burden on the maintainers, however systems that rely on older Linux kernels may have to bear the brunt of not getting essential patches.

While it may or may not affect a big chunk of users, it could be inconvenient for some organizations.

_💬 What do you think? Share your thoughts in the comments below._

**Via:[ZDNET][6]**

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-support/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://events.linuxfoundation.org/open-source-summit-europe/
[2]: https://itsfoss.com/long-term-support-lts/
[3]: https://lwn.net/
[4]: https://news.itsfoss.com/linux-kernel-support/The%20Linux%20Kernel%20Archives
[5]: https://en.wikipedia.org/wiki/Fuzzing
[6]: https://www.zdnet.com/article/long-term-support-for-linux-kernel-to-be-cut-as-maintainence-remains-under-strain/
