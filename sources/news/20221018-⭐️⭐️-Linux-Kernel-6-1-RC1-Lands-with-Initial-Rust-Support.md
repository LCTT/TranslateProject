[#]: subject: "Linux Kernel 6.1 RC1 Lands with Initial Rust Support"
[#]: via: "https://www.debugpoint.com/linux-kernel-6-1-rc1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 6.1 RC1 Lands with Initial Rust Support
======

**Linus Torvalds releases Linux Kernel 6.1 RC1 for everyone to test. And bringing the much-awaited Rust support.**

![Kernel 6.1 arrives with initial Rust structure][1]

Following the [Linux Kernel 6.0 release][2], the merge window is now closed for Kernel 6.1. And it’s time to test those new features.

While releasing, Linus mentioned that this release is fairly small compared to the prior ones. However, some of the major long-pending items eventually merged into this. However, he is not really happy with the late pull requests in the traditional two-weeks merge window.

> This isn’t actually shaping up to be a particularly large release: we “only” have 11.5k non-merge commits during this merge window, compared to 13.5k last time around. So not exactly tiny, but smaller than the last few releases. At least in number of commits.> That said, we’ve got a few core things that have been brewing for a long time, most notably the multi-gen LRU VM series, and the initial Rust scaffolding (no actual real Rust code in the kernel yet, but the infrastructure is there).[Linus][3]

Let’s take a look at what arrives in Kernel 6.1.

### Linux Kernel 6.1: What’s New (RC1)

#### Rust infra and key items

The most important change in the Linux Kernel 6.1 is introducing the [initial Rust framework code][4]. A whopping 12k lines of code brings only the basic infrastructure for Rust. With this base, new drivers, subsystems, and kernel modules are expected to land in Kernel via Rust programming language.

The primary support includes the following four areas:

- Kernel internals
- Rust build rules and scripts
- Rust crates and bindings for minimal possible build
- Documentation and Rust samples

Secondly, the highly anticipated MGLUR (Multi-gen least recently used) algorithm lands in this version. Google engineers primarily developed this work and are already out in the wild for Android and Chrome OS. Hence it’s merged in 6.1, hoping to be enabled by default in the coming days. This algorithm expects to perform better than LRU algo in high-pressure memory situations.

If you want to learn more about MGLUR, visit [this page][5] and check out the LPC 2022 conference presentation in the video below.

![LPC 2022 - Kernel Memory Management MC][6]

#### Graphics and Processors

AMD processors are [now armed with][7] Cache to Cache and memory reporting for better control and diagnosis. Also coming in this Kernel LbrExtV2 support (Last Branch Record Extension v2 functionality) for Zen 4 processors will improve overall performance.

Intel’s Meteor Lake family of processors get [Thunderbolt support][8].

Intel brings [additional work][9] for its DG2/Alchemist discrete graphics support for consumer graphics cards. The support is currently experimental since it is still maturing in the Kernel.

Furthermore, LoongArch CPU support arrived with [more updates][10] which started in [Kernel 5.19][11]. This version brings EFI-boot support, performance events and kdump handling, and cache operations for TLB. This Chiese CPU support will continue for a couple of kernel releases until it is fully supported by the mainline kernel.

Also, this version gets a feature where Kernel now [prints the CPU core][12] when there is a segmentation fault error, which is a generic fault. This may benefit multi-core CPU situations and single-cores as well.

More work [continues to arrive][13] on the graphics card space for Intel’s Meteor Lake, which is planned to be released in the second half of 2023. Elsewhere AMD gets similar codes for RDNA2 and RDNA3 GPUs.

#### File system

The btrfs filesystem [gets continuous performance improvements][14] in all kernel releases. Kernel 6.1 introduces async buffer writes with more than 2x throughput improvement in file operations.

Good ol’ ext4 seems to have some [minor improvements][15] and bug fixes.

Also, the XFS file system and F2FS (Flash-friendly file system) get [minor updates][16] and bug fixes.

#### Other updates

PinePhone keyboard driver arrives that supports the keypad and its functionalities. PinePhone keyboard runs entirely open-source firmware. It is primarily used as an external keyboard for PinePhones.

In addition, a considerable number of [Wi-Fi vulnerabilities][17] in Kernel are fixed in 6.1. While these are mainlined in 6.1, also these are backported in the past supported Kernel versions at the moment. These are the CVEs that got fixed.

- CVE-2022-41674
- CVE-2022-42719
- CVE-2022-42720
- CVE-2022-42721
- CVE-2022-42722

IBM folks bring its _ibm-panel_ keyboard [support][18] for server interfaces.

A handful of sound driver updates arrive in Linux Kernel 6.1, including AMD, Apple M1 and M2, Mediatek and others.

### Download

You can download the source tree from the following [page][19]:

**6.1-rc1**

[tarball][20]

[patch][21]

[view diff][22]

[browse][23]

If you are running benchmarks, testing new hardware and finding issues, report to the Kernel mailing list.

Finally, the Linux Kernel 6.1 is expected to be released by December 2022. Hence, Ubuntu 23.04 & Fedora 38 may get this version by Q2-2022.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/linux-kernel-6-1-rc1/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/10/kernel61rc1head-1024x576.jpg
[2]: https://www.debugpoint.com/linux-kernel-6-0/
[3]: https://lore.kernel.org/lkml/CAHk-=wj6y5fipM2A5kEuOO9qm5PBzUY=-m9viEahhtxT09KR_g@mail.gmail.com/T/#u
[4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8aebac82933ff1a7c8eede18cab11e1115e2062b
[5]: https://docs.kernel.org/mm/multigen_lru.html
[6]: https://www.youtube.com/embed/VRw3oaRsV9g?feature=oembed
[7]: https://lore.kernel.org/lkml/20221007203153.228388-1-acme@kernel.org/
[8]: https://lore.kernel.org/lkml/Y0BVmJb6dpD8jrFF@kroah.com/T/#u
[9]: https://lists.freedesktop.org/archives/intel-gfx/2022-August/303966.html
[10]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=95b8b5953a315081eadbadf49200e57d7e05aae7
[11]: https://www.debugpoint.com/linux-kernel-5-19/
[12]: https://github.com/torvalds/linux/commit/0db7058e8e23e6bbab1b4747ecabd1784c34f50b
[13]: https://lore.kernel.org/dri-devel/CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com/
[14]: https://lore.kernel.org/lkml/cover.1664798047.git.dsterba@suse.com/
[15]: https://lore.kernel.org/lkml/Yz0B+L+vHKIARzKj@mit.edu/
[16]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60bb8154d1d77042a5d43d335a68fdb202302cbe
[17]: https://seclists.org/oss-sec/2022/q4/20
[18]: https://lore.kernel.org/lkml/Y0O%2FKXxdj2gc4Sw+@google.com/
[19]: https://www.kernel.org/
[20]: https://git.kernel.org/torvalds/t/linux-6.1-rc1.tar.gz
[21]: https://git.kernel.org/torvalds/p/v6.1-rc1/v6.0
[22]: https://git.kernel.org/torvalds/ds/v6.1-rc1/v6.0
[23]: https://git.kernel.org/torvalds/h/v6.1-rc1
