[#]: subject: "Google Unveils The New Open Source KataOS"
[#]: via: "https://www.opensourceforu.com/2022/10/google-unveils-the-new-open-source-kataos/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Google Unveils The New Open Source KataOS
======

![google][1]

_The future of embedded hardware is being built with the help of Google’s brand-new open source operating system, which puts security first._

Google announced the release of the “KataOS” operating system last week. The goal of this new operating system, which is entirely built in Rust, is to develop software security and safeguard user data in embedded systems by employing ML applications. Rust’s ability to get rid of entire classes of flaws is a good place to start when developing KataOS a secure operating system.

Google has also disclosed its collaboration with Antmicro on the Renode simulator and associated frameworks for testing the current work. Because it is illogical for programmes to circumvent the hardware security measures built into the kernel and because the system components themselves are verifiably secure, Google says that KataOS offers a platform that preserves user privacy and is verifiably safe.

In an effort to create a safe, embedded platform for intelligent systems, Google has open-sourced a number of its hardware and software platform components as part of Project Sparrow. Visit the project’s page on [GitHub][2].

The secured hardware design contains the root of trust constructed with OpenTitan on a RISC-V architecture, with KataOS serving as the software component. But for the time being, they’re aiming for a 64-bit ARM platform that runs QEMU in simulation.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/10/google-unveils-the-new-open-source-kataos/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/10/google-696x509.jpg
[2]: https://github.com/AmbiML/sparrow-manifest
