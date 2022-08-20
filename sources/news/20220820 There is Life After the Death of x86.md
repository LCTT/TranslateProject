[#]: subject: "There is Life After the Death of x86"
[#]: via: "https://news.itsfoss.com/box86-creator-ptitseb/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

There is Life After the Death of x86
======
Discussing X86 emulation on ARM devices with the creator of Box86 and Box64 projects, Ptitseb.

![There is Life After the Death of x86][1]

[Box86][2] and [Box64][3] are two pieces of software that allow apps made for X86 to run on ARM devices like the Raspberry Pi. It also aims to be both simple to use and able to run on low-end devices.

Above all else, it is a completely open-source project, meaning that it has the full support of the community behind it.

However, one man is at the forefront of this effort, and I had the pleasure to have a chat with him about what Box86 and Box64 are, their origins, and what the future holds for the project.

Here is what we discussed.

### Interview with Box86 and Box64’s main developer: Ptitseb

I hope the questions and their responses make for good reading and give you a deeper understanding of X86 emulation and ARM devices in general.

**Q. What were your main reasons to create Box86 and Box64?**

**Ptitseb:**My main goal was to create an x86 emulator that ran on low-spec hardware. I’m quite active within the Open Pandora community [a small single-core ARM computer from 2012] and wanted to create a usable emulator for it. Put simply, I wanted a small and fast emulator for my Open Pandora

**Q. What is your target audience with Box86 and Box64? Is it meant to only be used by hardcore Linux enthusiasts, or just the average Linux user?**

**Ptitseb:** Aside from speed, one of my other goals with Box86 and Box64 is to have something that is usable by everyone. I designed Box86 to be as non-intrusive as possible; you install it, and then it just works. For now, I only provide source code, so as long it is not pre-compiled, it isn’t for everyone as it still needs to be compiled from source (even if it is relatively simple to do so).

For now, it’s for experienced users, but the end goal is to allow everyone to use it easily.

**Q. How are Box64 and Box86 different from previous attempts at running X86 applications using QEMU?**

**Ptitseb:** As I said before, my goals were to have something that was fast and easy to use. As a result, I have made quite a few choices that the QEMU team hasn’t taken. For example, the main goal of QEMU is to be as precise and as close to the real hardware as possible. My goal is not that. Instead, I want something that is fast, even if I have to do some approximation to do so.

I guess that the biggest difference between Box86/Box64 and QEMU is that I want Box86 to be as close to the actual hardware as possible and not as close to the emulated hardware (as would be found in QEMU). For example, X86 CPUs use 80 bit data, which ARM CPUs just can’t handle. While I could emulate this, it would significantly reduce speed, so I instead just use double 64-bit data. And it works! Even if it doesn’t work 100% of the time, for games, who cares!

In simple terms, with this approximation, I get much more speed, at the expense of precision.

**Q. Linux runs on an incredibly large number of devices. Because of this diverse target, I’m assuming not all hardware will work. Therefore, what kind of hardware is currently supported?**

**Ptitseb:**For Box86 to run, the computer needs to be little endian. This is a hard requirement, as Box86 translates code, not memory. Aside from that, there isn’t much stopping Box86 and Box64 from running, apart from a few more things.

Obviously, for Box86 to run, you need a 32-bit OS, and for Box64 a 64-bit OS, which is another hard requirement. Finally, if you want to use Dynarec, which significantly increases speed, you must be using ARM, not testing on an X86 PC.

**Q. With the release of the Steam Deck, Valve has promised vastly improved compatibility with Windows games thanks to the Proton compatibility layer. Once the new Proton version is released, do you think it will be possible to run those games with Box64?**

**Ptitseb:**I honestly don’t know, I still need to start working on that. It is definitely a goal that I want to work towards, mostly because it would just be nice to have! However, before I can get that working, I have a few other things that need to be finished first. For example, steam doesn’t work particularly well yet, so that will need to be improved before I can start working on Proton.

So yes, it is an objective, but it still will be a while before it works well.

**Q. I’m sure that you are aware of Apple’s Rosetta 2 translation layer. How do Box64 and Box86 compare to it?**

**Ptitseb:**It’s difficult to say, as I still haven’t done much analysis of Rosetta 2. My understanding is that Rosetta uses an offline code converter, which neither Box86 nor Box64 have. Unlike Rosetta, Box64 doesn’t keep translated code, instead doing everything in the runtime.

Other than that, Apple is always going to do translation better than Box64, as they have control over the full OS. After all, I can’t just change Linux to fit Box64, it needs to be the other way round.

**Q. What future plans do you have for Box64?**

**Ptitseb:**I’m currently thinking of a new Box piece of software, Box32, because why stop at two emulators when I can do three? Box32 will be a 64-bit emulator that runs 32-bit software. I can see, especially on ARM, that the 32-bit hardware is being phased out now, and as such Box86 will soon become obsolete because we won’t have any hardware to run it on.

But this one will be tricky because the wrapping will have to be much smarter than the implementations in Box86 and Box64. This is a huge amount of work, so I am still trying to find a good solution that doesn’t require too much work on the conversion phase while still having something fast and usable. However, that’s a future project, just because of the sheer size of it.

**Q. Looking at your GitHub profile, it appears that you have previously put a lot of work into porting individual games to the Open Pandora. Is Box86 an extension of that, or it is it a completely different project with different aims?**

Yes, I guess it is an extension of that in some ways. On the Pandora, I port a lot of stuff, and to help make the process easier, I forked [GLshim][4], creating Gl4ES. This provides automatic translation from OpenGL to GLES2, making porting much faster.

After that, I made Box86, which was yet another step towards making porting easier. Now, even if I don’t have the sources, I can still port things to the Open Pandora.

So yes, it some kind of extension to the porting and getting software available for hardware that it would otherwise not be available for.

**Q. How does GL4ES fit into the picture? Is it necessary to play most games?**

It really depends on the hardware. Some hardware doesn’t have a full OpenGL driver (or at least supported by Mesa), so you will need GL4ES to play games on hardware like this because full PC games don’t care about GLES.

If the hardware is supported by Mesa, like the Raspberry Pi 4, or the RK3399 SoC with Panfrost, it should be fine without it; you won’t need Gl4ES.

So if Mesa doesn’t support the hardware or the hardware doesn’t support OpenGL, you will need GL4ES to run games.

**Q. Finally, is there anything you would like to tell the community?**

Well, I see that Intel, AMD, and the X86 world as a whole is dying. We saw back in 2020 that Apple really shook the world with the M1, and suddenly we saw that X86 is not the only thing that could be powerful enough for desktop computers.

Now we are seeing alternative architectures like RISC-V that are emerging, and ARM is starting to appear in desktop computers too. So, X86 is not the only way to have a powerful PC for gaming and general use, and Box86 and Box64 are really just trying to help that movement.

After all, there is a life after the death of X86.

### Closing Thoughts

With all the incredible work that Ptitseb has done, it was truly an incredibly interesting experience to gain a deeper insight into the workings of a project like Box86. The mention of a possible Box32 version was also very exciting to hear about, and I hope you are excited too.

If you want to learn more about Box64, I’d highly suggest reading our release article on it.

[Box64 Emulator Released for Arm64 Linux][5]

With that, do you use Box86 or Box64? What are your thoughts on the future of those projects? Please feel free to let us know in the comments below.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/box86-creator-ptitseb/

作者：[Jacob Crume][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/08/box64-arm.jpg
[2]: https://github.com/ptitseb/box86
[3]: https://github.com/ptitseb/box64
[4]: https://github.com/lunixbochs/glshim
[5]: https://news.itsfoss.com/box64-emulator-released/
