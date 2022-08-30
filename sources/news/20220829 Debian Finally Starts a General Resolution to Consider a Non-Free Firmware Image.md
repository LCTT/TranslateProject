[#]: subject: "Debian Finally Starts a General Resolution to Consider a Non-Free Firmware Image"
[#]: via: "https://news.itsfoss.com/debian-non-free/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Debian Finally Starts a General Resolution to Consider a Non-Free Firmware Image
======
Debian's finally considering the inclusion of non-free firmware with a general resolution. So, what's it going to be?

![Debian Finally Starts a General Resolution to Consider a Non-Free Firmware Image][1]

Debian is one of the most loved Linux distributions for its approach to stability and a balance between new features.

But, it does not come with any non-free firmware.

And, that is becoming an issue for users who want to use Debian on newer hardware.

Most of the latest devices and configurations need non-free firmware to make things work, which includes Wi-Fi, graphics, and more.

To address that, **Steve McIntyre**, a Debian developer and a former Debian project leader, has been actively discussing the issue for a while. At the**DebConf 22 conference**, Steve recently talked about fixing the firmware mess to highlight this better to users and developers, as spotted by [Geeker’s Digest][2].**As an update to the discussion** among the community: it looks like Debian has started a general resolution to let its stakeholders vote what to do with non-free firmware.

### Debian's General Resolution Proposals

There are **three proposals** with the general resolution.

* Proposal A: Debian will include non-free firmware packages on official media installer images. The included firmware will be enabled by default where it detects the requirement. However, it will also include ways for users to disable this at boot.
* Proposal B: Include non-free firmware packages as official media images, but as a separate offering alongside the files with no non-free firmware.
* Proposal C: Make distribution media containing packages from non-free section and make it available for download alongside the free media by informing the user what they are downloading.

These are some interesting proposals. I think Proposal A would be convenient for all, while giving advanced users the chance to disable non-free firmware.

You can learn more about the general resolution in the [official page][3].

💬 **What do you think?**

### Including Non-Free Firmware in Official Releases

As for the current situation, you can find an unofficial Debian image with non-free firmware.

However, not every user is aware of it, and even if it is promoted on Debian’s download page, **“unofficial**” term is not something a user will prefer over the recommended image.

Furthermore, it is counter-intuitive to expect users to install non-free firmware when they can choose any Ubuntu-based distribution or Ubuntu as an alternative.

Not just limited to these issues, Steve mentioned a few other problems with it in his [blog][4] that include:

* Maintaining separate non-free images is time-consuming.
* The official images are not preferred by many users because of the lack of non-free firmware.

*So, what do you think Debian's general resolution get vote for? A separate media image? Or include it with the official image?*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/debian-non-free/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/wordpress/2022/07/debian-non-free-firmware.jpg
[2]: https://www.geekersdigest.com/debian-on-the-verge-to-include-non-free-firmware-in-official-releases/
[3]: https://www.debian.org/vote/2022/vote_003#timeline
[4]: https://blog.einval.com/2022/04/19#firmware-what-do-we-do
