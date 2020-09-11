[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What's the right amount of swap space for a modern Linux system?)
[#]: via: (https://opensource.com/article/19/2/swap-space-poll)
[#]: author: (David Both https://opensource.com/users/dboth)

What's the right amount of swap space for a modern Linux system?
======
Complete our survey and voice your opinion on how much swap space to allocate.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0)

Swap space is one of those things that everyone seems to have an idea about, and I am no exception. All my sysadmin friends have their opinions, and most distributions make recommendations too.

Many years ago, the rule of thumb for the amount of swap space that should be allocated was 2X the amount of RAM installed in the computer. Of course that was when a typical computer's RAM was measured in KB or MB. So if a computer had 64KB of RAM, a swap partition of 128KB would be an optimum size.

This took into account the fact that RAM memory sizes were typically quite small, and allocating more than 2X RAM for swap space did not improve performance. With more than twice RAM for swap, most systems spent more time thrashing than performing useful work.

RAM memory has become quite inexpensive and many computers now have RAM in the tens of gigabytes. Most of my newer computers have at least 4GB or 8GB of RAM, two have 32GB, and my main workstation has 64GB. When dealing with computers with huge amounts of RAM, the limiting performance factor for swap space is far lower than the 2X multiplier. As a consequence, recommended swap space is considered a function of system memory workload, not system memory.

Table 1 provides the Fedora Project's recommended size for a swap partition, depending on the amount of RAM in your system and whether you want enough memory for your system to hibernate. To allow for hibernation, you need to edit the swap space in the custom partitioning stage. The "recommended" swap partition size is established automatically during a default installation, but I usually find it's either too large or too small for my needs.

The [Fedora 28 Installation Guide][1] defines current thinking about swap space allocation. Note that other versions of Fedora and other Linux distributions may differ slightly, but this is the same table Red Hat Enterprise Linux uses for its recommendations. These recommendations have not changed since Fedora 19.

| Amount of RAM installed in system | Recommended swap space | Recommended swap space with hibernation |
| --------------------------------- | ---------------------- | --------------------------------------- |
| ≤ 2GB                            | 2X RAM                 | 3X RAM                                  |
| 2GB – 8GB                         | = RAM                  | 2X RAM                                  |
| 8GB – 64GB                        | 4G to 0.5X RAM         | 1.5X RAM                                |
| >64GB                             | Minimum 4GB            | Hibernation not recommended             |

Table 1: Recommended system swap space in Fedora 28's documentation.

Table 2 contains my recommendations based on my experiences in multiple environments over the years.
| Amount of RAM installed in system | Recommended swap space |
| --------------------------------- | ---------------------- |
| ≤ 2GB                            | 2X RAM                 |
| 2GB – 8GB                         | = RAM                  |
| > 8GB                             | 8GB                    |

Table 2: My recommended system swap space.

It's possible that neither of these tables will work for your environment, but they will give you a place to start. The main consideration is that as the amount of RAM increases, adding more swap space simply leads to thrashing well before the swap space comes close to being filled. If you have too little virtual memory, you should add more RAM, if possible, rather than more swap space.

In order to test the Fedora (and RHEL) swap space recommendations, I used its recommendation of **0.5*RAM** on my two largest systems (the ones with 32GB and 64GB of RAM). Even when running four or five VMs, multiple documents in LibreOffice, Thunderbird, the Chrome web browser, several terminal emulator sessions, the Xfe file manager, and a number of other background applications, the only time I see any use of swap is during backups I have scheduled for every morning at about 2am. Even then, swap usage is no more than 16MB—yes megabytes. These results are for my system with my loads and do not necessarily apply to your real-world environment.

I recently had a conversation about swap space with some of the other Community Moderators here at [Opensource.com][2], and Chris Short, one of my friends in that illustrious and talented group, pointed me to an old [article][3] where he recommended using 1GB for swap space. This article was written in 2003, and he told me later that he now recommends zero swap space.

So, we wondered, what you think? What do you recommend or use on your systems for swap space?

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/swap-space-poll

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://docs.fedoraproject.org/en-US/fedora/f28/install-guide/
[2]: http://Opensource.com
[3]: https://chrisshort.net/moving-to-linux-partitioning/
