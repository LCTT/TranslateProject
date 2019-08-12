[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Get Linux Kernel 5.0 in Ubuntu 18.04 LTS)
[#]: via: (https://itsfoss.com/ubuntu-hwe-kernel/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Get Linux Kernel 5.0 in Ubuntu 18.04 LTS
======

_**The recently released Ubuntu 18.04.3 includes Linux Kernel 5.0 among several new features and improvements but you won’t get it by default. This tutorial demonstrates how to get Linux Kernel 5 in Ubuntu 18.04 LTS.**_

[Subscribe to It’s FOSS YouTube Channel for More Videos][1]

The [third point release of Ubuntu 18.04 is here][2] and it brings new stable versions of GNOME component, livepatch desktop integration and kernel 5.0.

But wait! What is a point release? Let me explain it to you first.

### Ubuntu LTS point release

Ubuntu 18.04 was released in April 2018 and since it’s a long term support (LTS) release, it will be supported till 2023. There have been a number of bug fixes, security updates and software upgrades since then. If you download Ubuntu 18.04 today, you’ll have to install all those updates as one of the first [things to do after installing Ubuntu 18.04][3].

That, of course, is not an ideal situation. This is why Ubuntu provides these “point releases”. A point release consists of all the feature and security updates along with the bug fixes that has been added since the initial release of the LTS version. If you download Ubuntu today, you’ll get Ubuntu 18.04.3 instead of Ubuntu 18.04. This saves the trouble of downloading and installing hundreds of updates on a newly installed Ubuntu system.

Okay! So now you know the concept of point release. How do you upgrade to these point releases? The answer is simple. Just [update your Ubuntu system][4] like you normally do and you’ll be already on the latest point release.

You can [check Ubuntu version][5] to see which point release you are using. I did a check and since I was on Ubuntu 18.04.3, I assumed that I would have gotten Linux kernel 5 as well. When I [check the Linux kernel version][6], it was still the base kernel 4.15.

![Ubuntu Version And Linux Kernel Version Check][7]

Why is that? If Ubuntu 18.04.3 has Linux kernel 5.0 then why does it still have Linux Kernel 4.15? It’s because you have to manually ask for installing the new kernel in Ubuntu LTS by opting for LTS Enablement Stack popularly known as HWE.

[][8]

Suggested read  Canonical Announces Ubuntu Edge!

### Get Linux Kernel 5.0 in Ubuntu 18.04 with Hardware Enablement Stack

By default, Ubuntu LTS release stay on the same Linux kernel they were released with. The [hardware enablement stack][9] (HWE) provides newer kernel and xorg support for existing Ubuntu LTS release.

Things have been changed recently. If you downloaded Ubuntu 18.04.2 or newer desktop version, HWE is enabled for you and you’ll get the new kernel along with the regular updates by default.

For server versions and people who downloaded 18.04 and 18.04.1, you’ll have to install the HWE kernel. Once you do that, you’ll get the newer kernel releases provided by Ubuntu to the LTS version.

To install HWE kernel in Ubuntu desktop along with newer xorg, you can use this command in the terminal:

```
sudo apt install --install-recommends linux-generic-hwe-18.04 xserver-xorg-hwe-18.04
```

If you are using Ubuntu Server edition, you won’t have the xorg option. So just install the HWE kernel in Ubutnu server:

```
sudo apt-get install --install-recommends linux-generic-hwe-18.04
```

Once you finish installing the HWE kernel, restart your system. Now you should have the newer Linux kernel.

**Are you getting kernel 5.0 in Ubuntu 18.04?**

Do note that HWE is enabled for people who downloaded and installed Ubuntu 18.04.2. So these users will get Kernel 5.0 without any trouble.

Should you go by the trouble of enabling HWE kernel in Ubuntu? It’s entirely up to you. [Linux Kernel 5.0][10] has several performance improvement and better hardware support. You’ll get the benefit of the new kernel.

What do you think? Will you install kernel 5.0 or will you rather stay on the kernel 4.15?

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-hwe-kernel/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/channel/UCEU9D6KIShdLeTRyH3IdSvw
[2]: https://ubuntu.com/blog/enhanced-livepatch-desktop-integration-available-with-ubuntu-18-04-3-lts
[3]: https://itsfoss.com/things-to-do-after-installing-ubuntu-18-04/
[4]: https://itsfoss.com/update-ubuntu/
[5]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[6]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/ubuntu-version-and-kernel-version-check.png?resize=800%2C300&ssl=1
[8]: https://itsfoss.com/canonical-announces-ubuntu-edge/
[9]: https://wiki.ubuntu.com/Kernel/LTSEnablementStack
[10]: https://itsfoss.com/linux-kernel-5/
