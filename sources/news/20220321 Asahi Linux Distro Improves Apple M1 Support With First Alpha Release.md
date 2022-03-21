[#]: subject: "Asahi Linux Distro Improves Apple M1 Support With First Alpha Release"
[#]: via: "https://news.itsfoss.com/asahi-linux-alpha/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Asahi Linux Distro Improves Apple M1 Support With First Alpha Release
======

In 2020, Apple unveiled the M1 at the WWDC event. This reveal brought significant performance improvements and better power efficiency, although it did have one major drawback.

This was the software support, as it meant that it was no longer possible to boot a “normal” X86 distro on new Apple Mac devices with an M1 ARM chip. Hence, the Asahi Linux project (based on Arch) was born, with the aim to develop all the drivers and tools necessary to make a working Linux installation on Apple’s ARM-based Macs.

Now, after more than a year of work, the [Asahi Linux project][1] has finally [released][2] its first **Alpha version**, which introduces Linux support for Apple M1 devices.

It is still an alpha release for obvious reasons. But, we will be looking at what you need to know if you ever wanted to run Linux on your Apple M1 machine.

### Supported Devices

Surprisingly, this alpha release already has support for M1, M1 Pro, and M1 Max SoCs (except for the Mac Studio)! Although different devices with these chips do have varying levels of support, a lot of stuff is already working.

Some of the key hardware that works in this release includes:

  * Wi-Fi
  * USB 2.0
  * USB 3.0 on the Mac Mini
  * Built-in display on the MacBook Air and Pro
  * Built-in touchpad and keyboard
  * Ethernet
  * HDMI output on the Mac Mini



The result is a reasonably usable desktop Linux experience, with many of the incredible features of Apple Silicon.

Unfortunately, some key features are still missing, most notably the **CPU deep sleep mode, DisplayPort, Touchbar, Bluetooth, Camera, Thunderbolt, HDMI output on MacBooks, and GPU acceleration**.

This shouldn’t impact desktop use too much but should be kept in mind.

### App Problems

Of course, you should not expect every application to work seamlessly. And, that’s the case with Asahi Linux on Apple M1 hardware. This is limited only to apps that have problems with 16K page registers, although some of these apps are quite popular.

As the base for the most popular web browsers, I was quite surprised to find Chromium on the “known broken list”. While this may be rather off-putting for some users, Firefox does work, so users are still able to access the web.

Other apps confirmed to be broken include:

  * Emacs (will be fixed in next few releases)
  * Anything that use jemalloc (notably Rust)
  * Anything using Libunwind



While not ideal, the software affected is only a small portion of Linux apps, so it shouldn’t be too much of a concern.

### Installing Asahi Linux on Apple M1

![][3]

Although we haven’t focused very much on the working parts of Asahi Linux, it shouldn’t be forgotten that it is a monumental achievement to get something working on a closed platform like the Apple Silicon Macs.

If you want to give Asahi Linux a try, there are a few different variants you can install.

I would recommend installing Asahi Linux with a full desktop environment for most users. This will be best for desktop use, and already contains customizations and optimizations to provide the best user experience.

However, the Asahi Linux team understands that some users want more customization, which is why they provide a minimal version as well. This is simply a basic Arch Linux ARM install, which means that you are free to do whatever you would like with it.

Finally, they also provide a basic UEFI environment for booting other distros and OSs (with appropriate driver support). One interesting use for this is to boot OpenBSD, which one of the developers behind Asahi Linux, Mark Kettenis, is working on porting.

Before you get started, it should be noted that you need that least 53 GB of free space.

Once you have decided on an option, it is extremely easy to get Asahi Linux dual-booted with macOS with the command below.

```

    curl https://alx.sh | sh

```

It should give you all the instructions you need along the way. You should have a working Linux installation on your M1/M1 Pro/M1 Max computer if done correctly!

**Note:** The installation does not replace macOS with Linux. So, you get a dual-boot system at the end. You cannot easily uninstall it using the installer. However, you can simply delete the disk partition created by it.

You can learn more about it in its [official announcement post][2].

[Asahi Linux][4]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/asahi-linux-alpha/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/asahi-linux-announcement/
[2]: https://asahilinux.org/2022/03/asahi-linux-alpha-release/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://asahilinux.org/
