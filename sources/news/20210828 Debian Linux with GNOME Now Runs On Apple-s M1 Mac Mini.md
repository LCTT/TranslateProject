[#]: subject: "Debian Linux with GNOME Now Runs On Apple’s M1 Mac Mini"
[#]: via: "https://news.itsfoss.com/debian-linux-with-gnome-now-runs-on-apples-m1-mac-mini/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Debian Linux with GNOME Now Runs On Apple’s M1 Mac Mini
======

Back in January, we got [our first glimpse at the M1 running desktop Linux][1] thanks to the team at [Corellium][2]. While that was a great achievement, it did have a lot of drawbacks, such as no access to the internal storage and no GPU driver.

Now, [Asahi Linux][3] has just reached a major milestone in terms of getting the M1 usable as a desktop Linux computer: A working GNOME desktop. Unlike the previous achievement by Correllium, this breakthrough utilises a new GPU driver and double-buffering.

Read on for a dive into what this means and how it impacts the status of Linux on the M1.

### Gnome On The M1

![][4]

Alyssa Rosenweig, who has been working on reverse-engineering the M1’s GPU for more than 7 months, recently posted a tweet showing Gnome desktop running on “bare-metal” M1 hardware.

> LLVMPipe, my shoddy display controller, and hours of [@svenpeter42][5]'s patience presents….
>
> GNOME Shell on the Apple M1, bare metal.
>
> No, it's not GPU accelerated. Yes, I'm sending this tweet from it. [pic.twitter.com/P4YuPEnbvp][6]
>
> — Alyssa Rosenzweig (@alyssarzg) [August 22, 2021][7]

In the screenshot attached in the tweet, she revealed that she is using [Debian 11][8] with Gnome 3.38.4 and a pre-release version of Linux 5.14. Later, she went on to say that this was running on the mainline kernel, with just three modifications. These were:

  * Pin controller patches (Corellium and Joey Gouly)
  * PCIe patches (Marc Zyngier and Mark Kettenis)
  * Work in progress display driver (myself)



Honestly, I am quite amazed that this is running with so few modifications, especially when considering the closed nature of the M1. It really is incredible.

### How This Is Different To The January Demo

Back in January, Corellium showed off Ubuntu running on the M1. Unlike that demo, Asahi’s implementation uses double buffering, where the display uses different on and off-screen framebuffers.

In an interview with [The Review][9], she said, “The older demos rely on Apple’s bootloader allocating a framebuffer and configuring the display hardware to use it. This ‘single buffering’ setup is prone to graphics artefacts like tearing,”

She later went on to say, “Tearing is reduced with ‘double buffering’, where the display driver allocates separate on-screen and off-screen framebuffers. The on-screen buffer is displayed while the off-screen buffer is rendered to. Each frame, the roles are swapped, presenting the rendered frame instantly.”

The result of all this double buffering is a much smoother experience, with far less artefacting compared to January’s demo. This is quite incredible when you consider that Apple guards framebuffers behind a proprietary IOMMU (Input-output memory management unit), for which a driver was written and merged into the mainline kernel by Sven Peter, another member of Asahi.

Overall, this progress is absolutely incredible and really shows the dedication and skill of the Asahi team. Between the new IOMMU and display drivers, it appears that Asahi Linux will soon be ready for the end-consumer. Now we just have to wait to see how the M1X will impact this project…

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/debian-linux-with-gnome-now-runs-on-apples-m1-mac-mini/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/linux-apple-m1/
[2]: https://w.corellium.com/
[3]: https://asahilinux.org/
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://twitter.com/svenpeter42?ref_src=twsrc%5Etfw
[6]: https://t.co/P4YuPEnbvp
[7]: https://twitter.com/alyssarzg/status/1429579145827127296?ref_src=twsrc%5Etfw
[8]: https://news.itsfoss.com/debian-11-feature/
[9]: https://www.theregister.com/2021/08/23/gnome_asahi_linux/
