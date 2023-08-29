[#]: subject: "Linux Kernel 6.5 Released With Initial Support for Wi-Fi 7 and USB4"
[#]: via: "https://news.itsfoss.com/linux-kernel-6-5-release/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 6.5 Released With Initial Support for Wi-Fi 7 and USB4
======
The Linux Kernel 6.5 has dropped with nice improvements. Check it out
here.
It's a new Linux kernel release time!

**Linux 6.5 kernel** is here and builds upon the work of the previous Linux 6.4 kernel, along with some notable changes and additions.

Linus Torvalds mentioned that this was a smooth release overall:

> So nothing particularly odd or scary happened this last week, so there is no excuse to delay the 6.5 release.
>
> I still have this nagging feeling that a lot of people are on vacation and that things have been quiet partly due to that. But this release has been going smoothly, so that's probably just me being paranoid. The biggest patches this last week were literally just to our selftests.

**Suggested Read** 📖

## 🆕 Linux Kernel 6.5: What's New?

Users should be aware that this is a non-LTS release. If you want to get your hands on the latest features, this release is for you. Otherwise, upgrading is unnecessary unless it fixes particular issues or improves performance.

Here are the major highlights of the new kernel release:

  * **Out-of-the-box Support for AMD FreeSync Video**
  * **Default P-State "Active" Mode for AMD CPUs**
  * **Initial Support for USB4 v2 & WiFi 7**
  * **ASUS ROG Ally Sound Optimizations**



### Out-of-the-box Support for AMD FreeSync Video

A neat feature re-introduced in this release is the support for AMD FreeSync Video mode enabled by default. It was earlier introduced in the Linux Kernel 5.8 but reverted due to bugs.

When AMD FreeSync mode is enabled, screen-tearing and stuttering in games and videos are heavily reduced by matching the monitor's refresh rate to the framerate of the graphics card.

In technical terms, here's how it was described when it was being released back in Linux 5.8 kernel:

> This patchset enables freesync video mode usecase where the userspace can request a freesync compatible video mode such that switching to this mode does not trigger blanking.

This is quite useful for content creators and gamers alike.

But note that you will need a FreeSync-compatible monitor and graphics card to utilize it.

### Default P-State "Active "Mode for AMD CPUs

Modern AMD CPUs, specifically those built with Zen 2 and above architecture, will now use amd-pstate as the default CPU performance scaling driver. Earlier, the CPU scaling mechanism was managed by CPUFreq by default.

Now, amd-pstate offers three modes: active, passive, and guided autonomous. The "active" mode has been enabled by default in this release and thus replaces the guided autonomous mode used in the previous Linux Kernel 6.4.

It has been found that amd-pstate performs better than CPUFreq, as seen in some [benchmarks][1] by Phoronix.

You can refer to this [commit][2] to learn more.

### ASUS ROG Ally Sound Optimizations

A direct competitor to the vastly famous Steam Deck, ASUS ROG Ally is a Windows handheld gaming computer powered by the AMD Z1 and Z1 Extreme SoCs. It was released back in July of this year.

Linux gamers owning an ASUS ROG Ally should expect to see a patch release for the system's audio device, thanks to this [commit][3].

### Initial Support for USB4 v2 & WiFi 7

Work for the next-generation wireless standard - WiFi 7 - has been in development for quite some time. As a quick fact, WiFi 7 supports the 6Ghz band with a max data rate of 23 Gbps!

Also along this line, development work for the next-generation USB4 standard has begun. USB4 supports an 80 Gbps data transfer rate!

Early support for both has been baked into the Linux 6.5 kernel via this [merge][4] for WiFi and [pull request][5] for WiFi 7.

### 🛠️ Other Changes & Improvements

Here are some more things to be mentioned apart from the major highlights:

  * CPU scaling fixes for Intel P-State
  * Performance improvements for Btrfs and other storage optimizations
  * Rumble support for the latest Xbox controllers
  * Overclocking support for AMD Radeon RX 7000 series graphics cards
  * Various improvements and optimizations for AMD and Intel graphics drivers
  * And as always, more Rust code transitions



The [official release announcement][6] would give you a short log since its last release candidate. And, if you are curious about technical details, refer to the [changelog][7].

## Installing Linux Kernel 6.5

You can easily upgrade to Linux Kernel 6.5 using a rolling-release distro like Arch or Fedora. These distros offer the latest kernel sometime after the release.

On the other hand, folks using Ubuntu and its derivates should expect to see this Linux Kernel release in action via Ubuntu 23.10. You can expect this kernel release sooner using distros like Pop OS and Linux Lite.

But if you want to try it out quickly on an Ubuntu-based system, you can do so by following our guide (at your own risk! 👀)

You can download the tarball for the latest Linux Kernel from its [official website][8] ( _it takes time for it to be available after release_ ).

_💬 Share your thoughts about the latest kernel release in the comments._

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-6-5-release/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: https://www.phoronix.com/review/amd-pstate-epp-ryzen-mobile
[2]: https://lore.kernel.org/lkml/CAJZ5v0iQk8ytZ0953_HCWU6Vr62J9UeC8Z9pirOHAfjpbvcOfg@mail.gmail.com/
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=724418b84e6248cd27599607b7e5fac365b8e3f5
[4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3a8a670eeeaa40d87bd38a587438952741980c18
[5]: https://lore.kernel.org/lkml/ZKKejqr0Db74u8TB@kroah.com/
[6]: https://lore.kernel.org/lkml/CAHk-=wgmKhCrdrOCjp=5v9NO6C=PJ8ZTZcCXj09piHzsZ7qqmw@mail.gmail.com/
[7]: https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.5
[8]: https://www.kernel.org/
