[#]: subject: "What is the Release Schedule for Linux Kernel? How Long a Linux Kernel is Supported?"
[#]: via: "https://itsfoss.com/linux-kernel-release-support/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is the Release Schedule for Linux Kernel? How Long a Linux Kernel is Supported?
======

Linux kernel is complicated. And I am not even talking about the code.

The code itself is complicated but you do not need to bother with that. I am talking about the release schedule of a Linux kernel.

How often a new kernel version is released in a year? How long a kernel is supported? There are LTS (Long Term Support) kernels. How long the LTS Linux kernels are supported?

The thing is that while these questions may seem simple, the answer is not.

There is no one answer to these questions and it needs some explaining to do and that’s what I am going to do in this article.

### Linux kernel release schedule: is there any?

![][1]

The short answer is that a new kernel version is release every two to three months. The long answer is that it’s not a hard and fast rule.

What it means is that you’ll often see a new kernel version release every two to three months. That’s what the kernel maintainer team targets but there is no set deadline that the new version has to be released exactly 8 weeks from the previous release.

A new kernel version is released (often) by Linus Torvalds when it is ready. This typically happens every 2 to 3 months. The release is declared ‘stable’ and is usually numbered in the format of X.Y.

But this is not the end of X.Y development. The stable release gets further smaller releases to accommodate bug fixes. These small releases add one more point to the stable kernel to make it like X.Y.Z.

While X.Y is (often) released by Linux creator Linus Torvalds, the responsibility to maintain the stable X.Y kernel, merge bug fixes and release X.Y.Z versions is handled by a kernel developer.

### How long a kernel version is supported?

![][2]

Like the release, there is no fixed dates and schedule for how long a kernel version will be supported.

A regular stable kernel release is usually supported for two and a half months to three months, depending on the release of the next stable kernel release.

For example, stable kernel 5.14 would reach [end of life][3] a couple of weeks after the release of stable kernel 5.15. The end of support is announced by the maintainer of that particular stable kernel version in the Linux kernel mailing list. Users and contributors are asked to switch to the newly released stable version.

This is applicable to the normal stable kernel versions only. There are LTS (long term support) kernel versions as well and they are supported for a much longer period than just 3 months.

### The LTS Kernel: How long is it supported?

There is no set release schedule for LTS kernel as well. Usually, there is one LTS kernel release every year, usually the last release of the year and it is supported for at least two years. But again, there is no set rules here as well.

The maintainer of a LTS kernel may agree to maintain a certain LTS kernel for longer than the usual period of two years. The agreement is done based on the necessity and the players involved.

This often happens for the Android projects. Since two years is not long enough for the manufacturers to bring support for their hardware and software features, you’ll often find some LTS kernels to be supported for six years.

![Linux LTS kernel planned support dates][4]

You can find this information [available on Linux Kernel website][5].

### Your distribution may not follow the usual Linux kernel releases

If you check your Linux kernel version, you may find that [your distribution uses an old kernel][6]. It could also be possible that the kernel offered by the distribution has reached end of life as per the kernel website.

Don’t panic. Your distribution takes care of patching the kernel for bug fixes and vulnerabilities. Unless you are really using an obscure Linux distribution, you can trust your distro to keep it safe and sound.

You are free to [install the latest Linux kernel in Ubuntu][7] or whichever distribution you use if you have good enough reasons such as support for newer hardware.

If you want more details, I have e[xplained why your distribution uses an outdated Linux kernel here][6].

![][8]

### No straight forward answers

As you can see, there are no straight forwards answers to the Linux kernel release schedule questions. Everything is tentative.

The good thing, in my opinion, is that if you use a regular Linux distribution, you don’t need to bother a lot about the release or end of life of Linux kernel versions. That is something handled by your distribution.

I hope you have a little bit better idea on the Linux kernel release cycle or perhaps I confused you more than ever. In either case, let me know your views in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-kernel-release-support/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/torvalds-kernel-release.webp?resize=800%2C450&ssl=1
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/kernel-release.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/end-of-life-ubuntu/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/linux-lts-kernel-end-of-life.png?resize=785%2C302&ssl=1
[5]: https://www.kernel.org/category/releases.html
[6]: https://itsfoss.com/why-distros-use-old-kernel/
[7]: https://itsfoss.com/upgrade-linux-kernel-ubuntu/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/Keep_Calm_and_Trust_Your_Distribution.png?resize=800%2C400&ssl=1
