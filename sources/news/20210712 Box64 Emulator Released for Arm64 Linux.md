[#]: subject: (Box64 Emulator Released for Arm64 Linux)
[#]: via: (https://news.itsfoss.com/box64-emulator-released/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Box64 Emulator Released for Arm64 Linux
======

[Box86][1], the popular x86 emulator, has just received a huge upgrade. This comes in the form of [Box64][2], the ARM64 equivalent.

If you did not know, Box64_86 lets you run 64-bit or 32-bit Linux programs on ARM systems. In other words, it makes it possible for you to access desktop Linux programs on your Raspberry Pi or [Raspberry Pi alternatives][3].

Fortunately, now we have Box86 and Box64 to the rescue no matter what type of ARM system you’ve got.

### What is Box64?

![][4]

You may have heard about Apple’s Rosetta 2, a translation layer that allows apps designed for older Macs to run on the new M1-powered Macs. Box64 is something similar that allows apps designed for x86 to run on ARM Linux devices.

It manages to do this all while being 100% open-source, free, and surprisingly fast, thanks to its Dynarec module. This improves speed by re-compiling the program for ARM, meaning that it runs the same as any other ARM-supported app.

However, even if Box64 is unable to recompile the app, it can still run it using on-the-fly emulation, with impressive results here too.

Many Raspberry Pi users will be familiar with Box86, a similar program that has been around for about a year now. The biggest difference is that Box86 is only compatible with Arm32, while Box64 is only compatible with Arm64.

So that’s Box64, the awesome compatibility layer that allows users to run x86_64 apps on your ARM-based PCs.

### Wrapping Up

If you were to ask me what I think about Box64, I would say it’s an absolute game changer. Between the incredible performance and massive potential, this compatibility layer is sure to play a huge role in the future ARM-based Linux PCs.

Check out its [GitHub page][5] if you are curious to know how it works, and how you can get started with it.

With that, I’ll leave you now to dive into and test for yourself.

_What do you think of Box64? Let me know down in the comments below!_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/box64-emulator-released/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: http://github.com/ptitseb/box86
[2]: http://github.com/ptitseb/box64
[3]: https://itsfoss.com/raspberry-pi-alternatives/
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjIxOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://github.com/ptitseb/box64
