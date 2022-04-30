[#]: subject: "Rust-based Redox OS 0.7.0 Arrives with Enhanced Hardware Support"
[#]: via: "https://news.itsfoss.com/redox-os-0-7-0-release/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Rust-based Redox OS 0.7.0 Arrives with Enhanced Hardware Support
======

While we continue to observe new releases of Ubuntu and Ubuntu-based distros at this time of the year, here’s something for a change.

The one we’re highlighting here is—Redox OS, which focuses on stability and security. We [already covered an article back in 2016][1] during its early stages of development (if you are curious).

Basically, it is Unix-based but a complete operating system. Moreover, it is entirely written from scratch using Rust—a popular memory-conscious programming language.

The other major characteristic of Redox OS is that it adopts a microkernel design approach. This means a smaller size and use of basic functionalities when compared to the Linux monolithic kernel.

### Redox OS 0.7.0: What’s New?

The new release of [Redox OS][2] focuses on the very base of the OS and aims to extend hardware support. Let’s take a look at what this release brings.

#### Improved Filesystem

Redox includes a custom file system called RedoxFS which is also compatible with Linux.

RedoxFS is now a Copy-on-Write filesystem and supports transparent encryption using AES (Advanced Encryption Standard) when hardware acceleration is available.

#### Rewritten Bootloader

The bootloader has been completely revised such that the UEFI and BIOS versions now use a common code.

Additionally, the OS also shares the same driver code to improve security. This implies that the filesystem can be unlocked by the bootloader to encrypt and hash the kernel and initfs.

#### Updates to the Microkernel

The microkernel has undergone several fixes, changes, and alterations to improve performance and bring better hardware support.

For instance, support for ARM (aarch64) and future compilers have been added.

The kernel forces UTF-8 encoding to all system paths and makes use of acpid – the daemon used for power management.

Packaging has also been improved since initfs is moved to a separate file.

#### Other Features

Redox OS includes an updated version of rustc – the Rust compiler – and relibc, the Rust-based C library, to improve software support, performance, and porting.

You can also read the [official blog post][3] or its [GitLab page][4] to know more about the release.

### Closing Thoughts

It is important to note that Redox OS may not be a replacement for most, however, with the set of improvements planned for the future by the developer (_Jeremy Soller_), it can be a promising alternative.

The developer also plans to come up with regular releases. So, it should be exciting to see what Redox OS has to offer in the near future.

_Did you know about Redox OS? What do you think about it?_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/redox-os-0-7-0-release/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/redox-os-an-operating-system-written-in-rust/
[2]: https://www.redox-os.org/
[3]: https://www.redox-os.org/news/release-0.7.0/
[4]: https://gitlab.redox-os.org/redox-os/redox
