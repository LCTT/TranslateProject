[#]: subject: "Raspberry Pi 4 Support is Coming to Fedora Linux"
[#]: via: "https://news.itsfoss.com/fedora-raspberry-pi-4/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Raspberry Pi 4 Support is Coming to Fedora Linux
======
Fedora Linux 37 to introduce the official support for Raspberry Pi 4, thanks to several improvements in the upstream.

![fedora raspberry pi][1]

Fedora Linux is well-suited for desktops with its workstation edition. And, if you want it for a server or IoT requirements, you also have the Fedora ARM project.

It also supports Raspberry Pi boards, except for the recent Raspberry Pi 4 (released back in 2019).

Now, with a proposed change spotted by [Phoronix][2], it looks like Fedora Linux 37 might be the version adding official support for Raspberry Pi 4.

### It’s Not Official Yet…

As of now, enabling support for Raspberry Pi 4 is just a proposed change.

Fedora Linux usually has its list of proposed changes visible to the public to receive community feedback and let others track them.

So, the official support in Fedora Linux 37 will only be implemented if it is approved by the Fedora Engineering Steering Committee.

But, **what was the hold-up?**

The lack of accelerated graphics and a few missing features did not make it convenient to add support for it.

Now, with upstream work on newer Linux Kernel and Mesa on bringing graphics acceleration for Raspberry Pi 4, it lets them enable the support for it.

The proposed change document mentions:

> Upstream now supports accelerated graphics using the V3D GPU for both OpenGL-ES and Vulkan. There’s also enhancement to wired networking with support for PTPv2 on the CM4/4B.

Additionally, not just introducing support for Raspberry Pi 4, some of the proposed changes also involve improvements to the Raspberry Pi 3 series and the Zero 2 W.

So, it should be an interesting change if it happens as one would expect.

Note that the support for Wi-Fi on Raspberry Pi 400 is not a part of this process but testing for audio support will be a part of this change.

You can read all the details in the [proposed document][3].

What do you think about the support for Raspberry Pi 4 on Fedora Linux 37? Share your thoughts in the comments down below.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-raspberry-pi-4/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/07/fedora-coming-to-raspberry-pi.jpg
[2]: https://www.phoronix.com/scan.php?page=news_item&px=Fedora-37-Raspberry-Pi-4
[3]: https://fedoraproject.org/wiki/Changes/RaspberryPi4
