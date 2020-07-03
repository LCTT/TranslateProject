[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Ex-Solus Dev is Now Creating a Truly Modern Linux Distribution Called Serpent Linux)
[#]: via: (https://itsfoss.com/serpent-os-announcement/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Ex-Solus Dev is Now Creating a Truly Modern Linux Distribution Called Serpent Linux
======

[Ikey Doherty][1], the developer who once created the independent Linux distribution Solus has announced his new project: Serpent OS.

[Serpent OS][2] is a Linux distribution that DOES NOT want to be categorized as “lightweight, user-friendly, privacy-focused Linux desktop distribution”.

Instead, Serpent OS has “different goals from the mainstream offering”. How? Read on.

### Serpent OS: The making of a “truly modern” Linux distribution

![][3]

Serpent takes distro-first, compatibility-later approach. This lets them take some really bold decisions.

Ikey says that it this project will not tolerate for negative actors holding Linux back. For example, NVIDIA’s lack of support for accelerated Wayland support on their GPUs will not be tolerated and NVIDIA proprietary drivers will be blacklisted from the distribution.

Here’s a proposed plan for the Serpent Linux project (taken from [their website][4]):

  * No more usrbin split
  * 100% clang-built throughout (including kernel)
  * musl as libc, relying on compiler optimisations instead of inline asm
  * libc++ instead of libstdc++
  * LLVM’s binutils variants (lld, as, etc.)
  * Mixed source/binary distribution
  * Moving away from x86_64-generic baseline to newer CPUs, including Intel and AMD specific optimisations
  * Capability based subscriptions in package manager (Hardware/ user choice / etc)
  * `UEFI` only. No more legacy boot.
  * Completely open source, down to the bootstrap / rebuild scripts
  * Seriously optimised for serious workloads.
  * Third party applications reliant on containers only. No compat-hacks
  * Wayland-only. X11 compatibility via containers will be investigated
  * Fully stateless with management tools and upstreaming of patches



Ikey boldly claims that Serpent Linux is not Serpent GNU/Linux because it is not going to be dependent on a GNU toolchain or runtime.

The development for Serpent OS project starts by the end of July. There is no definite timeline of the final stable release.

### Too high claims? But Ikey has done it in the past

You may doubt if Serpent OS will see the light of the day and if it would be able to keep all the promises it made.

But Ikey Doherty has done it in the past. If I remember correctly, he first created SolusOS based on Debian. He discontinued the [Debian-based SolusOS][5] in 2013 before it even reached the beta stage.

He then went out to create [evolve OS][6] from scratch instead of using another distribution as base. Due to some naming copyright issues, the project name was changed to Solus (yes, the same old name). [Ikey quit the Solus projec][7][t][7] [in 2018][7] and other devs now handle the project.

Solus is an independent Linux distribution that gave us the beautiful Budgie desktop environment.

Ikey has done it in the past (with the help of other developers, of course). He should be able to pull this one off as well.

**Yay or Nay?**

What do you think of this Serpent Linux? Do you think it is time for developers to take a bold stand and develop the operating system with the future in the mind rather than holding on to the past? Do share your views.

--------------------------------------------------------------------------------

via: https://itsfoss.com/serpent-os-announcement/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ikey-doherty-serpent-interview/
[2]: https://www.serpentos.com/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/serpent-linux.png?ssl=1
[4]: https://www.serpentos.com/about/
[5]: https://distrowatch.com/table.php?distribution=solusos
[6]: https://itsfoss.com/beta-evolve-os-released/
[7]: https://itsfoss.com/ikey-leaves-solus/
