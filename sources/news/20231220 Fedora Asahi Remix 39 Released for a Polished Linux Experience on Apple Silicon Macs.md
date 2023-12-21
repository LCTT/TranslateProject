[#]: subject: "Fedora Asahi Remix 39 Released for a Polished Linux Experience on Apple Silicon Macs"
[#]: via: "https://news.itsfoss.com/fedora-asahi-remix-39-release/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Asahi Remix 39 Released for a Polished Linux Experience on Apple Silicon Macs
======
The flagship distro for Apple Silicon Macs has arrived.
This year just keeps on giving, in the form of new distro releases, I mean.

Earlier this year, Asahi Linux and Fedora teamed up to [bring the complete Linux experience to Apple Silicon][1]. We hadn't heard much from them since the announcement; until now, that is.

We now have the result of the collaboration between the [Fedora Asahi SIG][2], and the [Asahi Linux project][3]. It has arrived in the form of the **Fedora Asahi Remix 39** release.

So, join me as I take you through this unique Linux distro.

**Suggested Read** 📖

![][4]

### Fedora Asahi Remix 39: What to Expect?

![][5]

**Fedora Asahi Remix 39 is an alternative to macOS for Apple Silicon-equipped Mac devices** based on the [Fedora 39 release][6]. It aims to provide a tailored experience for Mac users with considerable platform and device support.

With the current release, there are varying degrees of support for the **MacBook Air** , **MacBook Pro** , **Mac Mini** , **Mac Studio** , and **iMac.**

The **key highlights** of this release include:

  * **A Wayland Only Approach**
  * **Two Desktop Environments**
  * **OpenGL Implementation**
  * **Fully Integrated DSP Solution**



![][7]

#### A Wayland Only Approach

This has been a trend among distro developers for 2023, and Fedora Asahi Remix is no different. It comes with a complete integration of the [Wayland][8] environment, which is slowly becoming the mainstream choice for many popular distros.

There is also **support for HiDPI displays** , and future plans include introducing support for display notches and HDR.

📋

Users of X11 apps need not worry, as Fedora Asahi Remix features [XWayland][9].

#### Two Desktop Environments

![An image of Plasma 5.27 for reference.][10]

Fedora Asahi Remix 39 comes equipped with two desktop environments (DE), the flagship is [KDE Plasma 5.27][11], which looks rather neat in my opinion.

The experience on this has been tweaked in such a way that you don't feel unfamiliar, and can take advantage of the features of your Mac device.

![An image of GNOME 45 for reference.][12]

For those who don't prefer Plasma, there is also the option of switching to [GNOME 45][13], it also has full support for Wayland, and provides **a similar experience to macOS**.

The installer also sees some work, Fedora Asahi Remix 39 features **a custom version of the Calamares installer** that allows you to quickly set up the system.

#### OpenGL Implementation

Fedora Asahi Remix claims to be the world's first and only [certified][14] **conformant OpenGL ES 3.1 implementation for Apple Silicon.** What this means for you as the end user is that **apps and games will run/render properly** without causing much fuss.

There is also **non-conformant support for OpenGL 3.3** , and their plans also indicate future introduction of OpenGL 4.x and Vulkan support.

#### Fully Integrated DSP Solution

To complete the whole package is their [DSP][15] solution for Fedora Asahi Remix that lets you **take advantage of high-quality audio** without the need to set it up manually.

They have also included their in-house bass boosting tech called “[Bankstown][16]” and an Amp implementation called “[Smart Amp][17]”, to output improved loudness and dynamic range from your speaker.

### 📥 Get Fedora Asahi Remix 39

Before you go about installing, ensure that you have **at least macOS 13.5 or macOS 14.2 installed,** as **Fedora Asahi Remix requires macOS to be installed**.

Then, run the following command to get the latest release:

```

    curl https://fedora-asahi-remix.org/install | sh

```

You can also get the latest build from the [official website][18], or you could visit the Asahi Linux [website][19] for the same.

[Fedora Asahi Remix 39][19]

There are **two other variants on offer** , one is **a minimal image** that allows you to fine tune your Fedora Asahi Remix experience, the other is **a server image** meant for setting up servers.

The [official documentation][20] is a must-read if you are looking for further instructions. If that doesn't help, then you could always ask [the community][21] for help.

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-asahi-remix-39-release/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/fedora-asahi-remix-apple/
[2]: https://fedoraproject.org/wiki/SIGs/Asahi
[3]: https://asahilinux.org/
[4]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[5]: https://news.itsfoss.com/content/images/2023/12/Fedora_Asahi_Remix_39.jpg
[6]: https://news.itsfoss.com/fedora-39-release/
[7]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[8]: https://wayland.freedesktop.org/
[9]: https://wayland.freedesktop.org/xserver.html
[10]: https://news.itsfoss.com/content/images/2023/12/kde-plasma-52-27-1.jpg
[11]: https://news.itsfoss.com/kde-plasma-5-27-release/
[12]: https://news.itsfoss.com/content/images/2023/12/gnome-45-home.jpg
[13]: https://news.itsfoss.com/gnome-45-release/
[14]: https://www.khronos.org/conformance/adopters/conformant-products/opengles#submission_1007
[15]: https://en.wikipedia.org/wiki/Digital_signal_processing
[16]: https://github.com/chadmed/bankstown
[17]: https://github.com/AsahiLinux/speakersafetyd
[18]: https://fedora-asahi-remix.org/builds.html
[19]: https://asahilinux.org/fedora/
[20]: https://docs.fedoraproject.org/en-US/fedora-asahi-remix/
[21]: https://discussion.fedoraproject.org/c/neighbors/asahi/
