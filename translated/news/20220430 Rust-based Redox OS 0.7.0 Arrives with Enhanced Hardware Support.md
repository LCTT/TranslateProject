[#]: subject: "Rust-based Redox OS 0.7.0 Arrives with Enhanced Hardware Support"
[#]: via: "https://news.itsfoss.com/redox-os-0-7-0-release/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

基于 Rust 的 Redox OS 0.7.0 发布：增强硬件支持
======
Unix 风格的 Redox OS 0.7.0 发布了，它此次带来了几项改进，聚焦于在最广泛的硬件上启动。

![Redox OS][1]

每年的这个时候，我们都会继续观察报道 Ubuntu 和基于它的发行版的新版本，但是今天不一样。

今天，我们要介绍的主角是 Redox OS，它专注于稳定性和安全性。我们 [早在 2016 年就报道过一篇文章][2]，那时它还处于开发早期阶段（如果你感兴趣的话）。

它大致上是基于 Unix 的，但却是一个完整的操作系统。此外，它完全使用 Rust 从零开始编写。Rust 是一个流行的手动管理内存的编程语言。

Redox OS 的另一个主要特点是它采用了微内核设计方法。这意味着与 Linux 单片机内核相比，它的体积和使用的基本功能都比较少。

### 版本更新介绍

新发布的 [Redox OS][3] 侧重于操作系统的最基础部分，并且旨在扩展硬件支持。让我们来看看这个版本带来了什么更新吧！

#### 改进的文件系统

Redox 附带一个名为 RedoxFS 的自定义文件系统，这个文件系统也与 Linux 兼容。

RedoxFS 目前是一个 Copy-on-Write 文件系统，当硬件加速可用时，支持使用 AES（高级加密标准）进行透明加密。

#### 重写的引导程序

引导程序已经被完全修改，现在 UEFI 和 BIOS 版本共用了相同的代码。

此外，操作系统也共享相同的驱动代码以提高安全性。这意味着文件系统可以被引导程序解锁，以对内核和 initfs 进行加密和哈希。

#### 微内核的更新

微内核已经经历了几次修复和更新，以提高性能并带来更好的硬件支持。

例如，它增加了对 ARM（arch64）和未来编译器的支持。

内核强制对所有系统路径进行 UTF-8 编码，并使用了 acpid —— 用于电源管理的守护程序。

由于 initfs 被移到了一个单独的文件中，打包也得到了提升。

#### 其他特性

Redox OS 更新了 rustc（Rust 编译器）和 reibc（基于 Rust 的 C 库），以提高软件支持、性能和移植性。

你也可以阅读 [官方博文][4] 或其 [GitLab 页面][5] 以了解更多关于该版本的信息。

### 结语

需要注意的是，Redox OS 可能不是大多数人的替代品。然而，随着开发者（Jeremy Soller）为未来计划的一系列改进，它可以成为一个有希望的替代品。

开发者还计划定期发布新版本。因此，我们可以期待 Redox OS 在不久的将来会为我们带来什么。

你听说过 Redox OS 吗？你对它有什么看法呢？欢迎在评论区分享你的观点！

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/redox-os-0-7-0-release/

作者：[Rishabh Moharir][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/04/redox-os-0-7-0.jpg
[2]: https://itsfoss.com/redox-os-an-operating-system-written-in-rust/
[3]: https://www.redox-os.org/
[4]: https://www.redox-os.org/news/release-0.7.0/
[5]: https://gitlab.redox-os.org/redox-os/redox
