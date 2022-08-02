[#]: subject: "Linus Torvalds Uses Apple MacBook Hardware to Release Linux Kernel 5.19"
[#]: via: "https://news.itsfoss.com/linux-kernel-5-19-release/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linus Torvalds Uses Apple MacBook Hardware to Release Linux Kernel 5.19
======
Linux Kernel 5.19 is introducing support for a new CPU architecture, along with improvements for next-gen components from Intel and AMD.

![linux kernel][1]

Three months after the [last kernel release][2], Linux Kernel 5.19 is finally here. This exciting release brings plenty of improvements to every aspect of the kernel and opens up opportunities with new hardware.

The most interesting part is that the Linux creator Linus Torvalds used an Apple MacBook, the Arm version, to announce this release.

Don’t get your pitchfork out just yet. Torvalds used [Asahi Linux][3], a project dedicated to adding Linux support to Apple’s Arm-based Silicon Macbooks.

> On a personal note, the most interesting part here is that I did the release (and am writing this) on an arm64 laptop. It’s something I’ve been waiting for for a *loong* time, and it’s finally reality, thanks to the Asahi team. We’ve had arm64 hardware around running Linux for a long time, but none of it has  really been usable as a development platform until now.

That’s interesting. And this is the [third time][4] Torvalds used Apple hardware for Linux development.

### Linux Kernel 5.19: What’s New?

As with all previous releases, Linux Kernel 5.19 has a lot of technical changes. However, there are only a few major ones that will have a direct impact on users, so we will focus on those here.

If you are interested in all the low-level code changes, you can refer to the official changelog.

#### LoongArch CPU Architecture Support

Over the past few years, it has been interesting to see Chinese chip manufacturers attempt to catch up to Intel and AMD. One way they have tried to do this is by creating their architectures, which are generally compatible with existing architectures.

One of the more successful of these companies is **Loongson**. However, due to their new architecture, the software support for these CPUs was pretty limited.

Starting with this release, these CPUs have initial support (it won’t work for booting) and will likely soon have packages ported to them.

We should see more progress on this with Linux Kernel 5.20.

#### 32-bit RISC-V Apps on 64-bit RISC-V

As has been the case for the recent releases, Linux Kernel 5.19 greatly improves support for the open-source RISC-V architecture. This time, this comes in the form of allowing 32-bit RISC-V apps to run on 64-bit RISC-V systems.

Very few 32-bit RISC-V CPUs can run Linux, meaning very few Linux packages are designed for them. And those packages already have 64-bit counterparts.

Even if its usefulness is limited, it is good to see RISC-V being treated as a first-class architecture and getting more improvements to bring it closer to mainstream feasibility.

#### Improved Arc Alchemist Support

It’s no surprise that Intel’s initial Arc Alchemist GPU launch is a disaster so far, Linux Kernel 5.19 is the first release where you could assume these GPUs are usable on Linux.

This release finally brings compute support to the Linux kernel. It is somewhat surprising this code was not merged earlier, but at least the support exists now.

The other major Arc improvement is significantly better power management. This comes in the form of a small tweak in Linux’s PCIe subsystem that treats the Arc GPUs as unlimited, enabling PCI Express Active State Power Management in far more configurations.

In essence, this change means that the GPU can now be put into an extremely low power mode when not in use, yielding some significant power savings.

#### Improved ARM SoC Support

This release brings support to several new ARM SoCs. This time around, 7 new SoCs have been added to the list, specifically:

* Renesas RZ/G2UL (R9A07G043)
* Renesas RZ/V2M (R9A09G011)
* Renesas R-Car V4H (R8A779G0)
* Broadcom BCM47622
* Corstone1000
* Mediatek MT8195 (Kompanio 1200)
* NXP i.MXRT1050

In addition, Apple’s M1 chip also gained some improved support. This comes from a new driver for the on-chip NVMe controller. Now, users wanting to be able of NVMe storage on their Apple Silicon Macs are able to do so, thanks to the contribution by the Asahi Linux project.

#### Significantly Reduced Boot Times For Azure VMs

Azure users, you are in for a good improvement. Thanks to a contribution by Microsoft, Azure VMs using multiple GPUs can have as many as 3 minutes shaved off their boot times!

To achieve this, Microsoft changed their PCI Hyper-V driver to avoid setting “PCI_COMMAND_MEMORY”, which stops the driver sending/receiving heaps of unnecessary data from each GPU, saving around 14 seconds of boot time per GPU.

### Other Changes

In addition to the ones I mentioned above, Linux Kernel 5.19 also includes

* Raspberry Pi Sense Hat joystick driver
* Various BTRFS improvements
* New Intel IFS driver
* Intel Raptor Lake P graphics support.
* Alder lake improvements.
* Initial support for AMD RDNA3 graphics.
* Performance optimizations as reported by [Phoronix][5].

Overall, these changes make up for a pretty decent release. Although there aren’t any major changes, Linux Kernel 5.19 continues to build on the great work of the past few Linux releases.

### How to Install Linux Kernel 5.19?

If you are using Arch Linux or Fedora, you can easily upgrade shortly. But, if you are using other Linux distributions (Pop!_OS can be an exception to some extent), you may not receive an upgrade.

So, if you are feeling adventurous (and know what you are doing), you can find the newer kernel listed on [Linux Kernel Archives][6]. You can download the [tarball][7] to test it out.

However, we recommend waiting for your Linux distribution to push an update if you do not want to take any chances. It is best to stick to what’s being offered for your Linux distribution by default.

[Linux Kernel Archives][8]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-5-19-release/

作者：[Jacob Crume][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/07/linux-kernel-5-19-released.jpg
[2]: https://news.itsfoss.com/linux-kernel-5-18-release/
[3]: https://news.itsfoss.com/asahi-linux-alpha/
[4]: https://lore.kernel.org/lkml/CAHk-=wgrz5BBk=rCz7W28Fj_o02s0Xi0OEQ3H1uQgOdFvHgx0w@mail.gmail.com/T/#u
[5]: https://www.phoronix.com/news/Linux-5.19-Features
[6]: https://www.kernel.org/
[7]: https://git.kernel.org/torvalds/t/linux-5.19.tar.gz
[8]: https://www.kernel.org/
