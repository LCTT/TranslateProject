[#]: subject: "Popular Nintendo Video Game Emulator ‘Cemu’ Plans to Go Open-Source with Linux Support"
[#]: via: "https://news.itsfoss.com/cemu-nintendo-linux/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Popular Nintendo Video Game Emulator ‘Cemu’ Plans to Go Open-Source with Linux Support
======

If you’re into retro gaming, you may have come across retro console emulators. For those unaware, they are basically software or hardware that allow the host system to run games designed for another system.

Lately, Cemu has managed to grab the attention of the open-source community. It is one of the many retro console emulators out there that lets you play games tailored for Nintendo Wii U. However, as of now, it distinguishes itself from most of them in one major aspect, its closed-source nature, but that’s about to change.

### What is Cemu?

[Cemu][1] is a popular software-based retro console emulator that specifically emulates Nintendo Wii U games and is the first one to do so. It makes use of both OpenGL and Vulkan to run the games.

It has improved significantly over the years and can now [play around 51% of the entire Wii U library][2]. This list includes popular titles like Mario Kart 8 and The Legend of Zelda: Breath of the Wild.

Although released back in 2015, Cemu is only available on Windows. But, a new roadmap published by the developers states that Cemu should arrive on Linux soon.

And, as a cherry on top, Cemu will be going open-source!

### The Way to Open-Source and Linux

The roadmap includes a total of eight milestones planned by the devs. Among them are plans to develop a Linux port and make the code available to the community.

Talking about Cemu going open-source, the devs have plans to do this by 2022. So, you should not keep your hopes high for anything to arrive soon enough.

Moving to Linux involves rewriting the source code from C to C++ and migrating from Visual Studio to cmake.

Here’s what the devs had to say about bringing Cemu to Linux:

> We eventually want to offer a native Linux version. This has been an ongoing side-project, albeit progressing relatively slowly due to somewhat low-priority nature and being dependent on other tasks. About 70% of the work has been done at this point. 

The devs have also mentioned that the porting process is accompanied by other duties like the software H264 decoder and cubeb backend. Since a major of work has been completed, it’s safe to say Cemu will be coming to Linux very soon.

### Other Plans

The devs have considered implementing LLVM as CPU JIT backend for translating PowerPC (Wii U’s host architecture) to x86 architectures like ARM.

They have also just begun working on a new shader decompiler to reduce shader compilation time and stuttering.

You can refer to the [official roadmap][3] for more details.

### Wrapping Up

This is definitely a massive gift to retro gaming enthusiasts eager to contribute and make Cemu better.

Cemu will finally join the likes of many popular and open-source Nintendo console emulators like Citra, Dolphin, and Yuzu.

_What do you think of Cemu going open-source? Should retro game emulators be closed-source or open-source?_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/cemu-nintendo-linux/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: https://cemu.info
[2]: https://compat.cemu.info/
[3]: https://wiki.cemu.info/wiki/Roadmap
