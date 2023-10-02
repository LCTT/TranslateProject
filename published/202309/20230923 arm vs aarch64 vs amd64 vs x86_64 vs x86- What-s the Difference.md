[#]: subject: "arm vs aarch64 vs amd64 vs x86_64 vs x86: What's the Difference?"
[#]: via: "https://itsfoss.com/arm-aarch64-x86_64/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16224-1.html"

arm vs AArch64 vs amd64 vs x86_64 vs x86：有什么区别？
======

![][0]

> 当涉及到 CPU 的时候，有许多术语：AArch64、x86_64、amd64、arm 等等。了解它们是什么以及它们之间的区别。

当你查看数据表或软件下载页面时是否被 `ARM`、`AArch64`、`x86_64`、`i386` 等术语混淆？这些被称为 CPU 架构，我会帮你深入了解这个计算话题。

以下的表将为你总结每个字符串所代表的意义：

CPU 架构 | 描述
---|---
**`x86_64`** /`x86`/`amd64` | 64 位 AMD/英特尔 CPU 的别称
**`AArch64`** /`arm64`/`ARMv8`/`ARMv9` | 64 位 ARM CPU 的别称
**`i386`** | 32 位 AMD/英特尔 CPU
**`AArch32`** /`arm`/`ARMv1` 到 `ARMv7` | 32 位 ARM CPU 的别称
**`rv64gc`** /`rv64g` | 64 位 RISC-V CPU 的别称
**`ppc64le`** | 64 位 PowerPC CPU，**小端字节序存储**

从左到右是使用该术语来描述 CPU 架构超过其右侧其他可选用术语的偏好。

从左到右是使用该术语描述 CPU 架构的优先级，使用左侧的而不是其右侧的其他可供选择的术语。

如果你像我一样是个极客，并想要更深入地解释，请继续阅读！

### 概述：CPU 架构

通常来说，我之前列出的术语是描述 CPU 架构的。但严格讲，它们被计算机工程师视为 CPU 的 <ruby>指令集架构<rt>Instruction Set Architecture</rt></ruby>（ISA）。

CPU 的指令集架构定义了 CPU 如何解析二进制代码中的 1 和 0。

这些 CPU 的 ISA 有几个主要的类别：

  * x86（AMD/英特尔）
  * ARM
  * RISC-V
  * PowerPC（IBM 仍在使用）

当然，还有更多种类的 CPU ISA，比如 MIPS、SPARC、DEC Alpha 等等。但我列出的这些至今仍然被广泛使用（以某种形式）。

上述列出的 ISA 主要根据 _内存总线的宽度_ 分为至少两个子集。内存总线的宽度指的是 CPU 和 RAM 一次能传输的位数。内存总线有很多种宽度，但最常见的是 32 位和 64 位。

> 💡 32 位的 CPU ISA 要么是已经过时的历史产物，被留下来要么只是为了支持旧的系统，要么只运用在微控制器中。可以说，**所有新的硬件都已经是 64 位的了**，特别是那些面向消费者的硬件。

### x86（AMD/英特尔）

x86 CPU 的指令集架构主要源于英特尔，因为英特尔是最初搭配 8085 微处理器创建了它。8085 微处理器的内存总线宽度为 16 位。而后来，AMD 加入了这个领域，并且一直紧随英特尔的步伐，直到 AMD 创建出了自己的超集 64 位架构，超过了英特尔。

x86 架构的子集如下：

  * `i386`：如果你拥有的是 2007 年之前的 CPU，那么这可能就是你的 CPU 架构。它是现在使用的 AMD/英特尔的 x86 架构的 32 位“版本”。
  * `x86_64`/`x86`/`amd64`：这三个术语在不同的项目中可能会被交替使用。 但它们都是指 x86 AMD/英特尔架构的 64 位“版本”。无论如何，`x86_64` 这个字符串比 `x86` 和 `amd64` 使用得更广泛（也更受欢迎）。例如，FreeBSD 项目称 64 位的 x86 架构为 `amd64`，而 Linux 和 macOS 则称之为 `x86_64`。

> 💡 由于 AMD 在创造 64 位 ISA 上超越了英特尔，所以一些项目（比如 FreeBSD）把 x86 的 64 位版本称为 `amd64`。**但更被广泛接受的术语还是 x86_64**。

对于 CPU ISA，“x86” 这个字符串是一种特殊的情况。你要知道，在从 32 位的 x86（`i386`）到 64 位的 x86（`x86_64`）的过渡过程中，CPU 制造商确保了 CPU 能够运行 32 位 _和_ 64 位指令。所以，有时你可能会看到 `x86` 也被用来意指“这款产品只能运行在 64 位的计算机上，但如果该计算机能运行 32 位指令，那么你也可以在它上面运行 32 位的用户软件”。

这种 x86 的模糊性——也就是诸如能同时运行 32 位代码的 64 位处理器——其主要用于和存在于运行在 64 位处理器上的，但是允许用户运行 32 位软件的操作系统，Windows 就通过这种被称作“兼容模式”的特性运用了这种方式。

汇总一下，由 AMD 和 英特尔 设计的 CPU 有两种架构：32 位的（`i386`）和 64 位的（`x86_84`）。

#### 其它的英特尔

`x86_64` ISA 实际上有几个子集。这些子集都是 64 位，但它们新添加了诸如 SIMD（<ruby>单指令多数据<rt>Single Instruction Multiple Data</rt></ruby>）指令等功能。

  * `x86_64-v1`：这是大多数人都熟知的基础 `x86_64` ISA。当人们谈论 `x86_64` 时，他们通常指的就是 `x86_64-v1` ISA。
  * `x86_64-v2`：此版本新增了更多如 SSE3（<ruby>流式 SIMD 扩展版本 3<rt>Streaming SIMD Extensions 3</rt></ruby>）之类的指令扩展。
  * `x86_64-v3`：除了基础指令外，还新增了像 AVX（<ruby>高级矢量扩展<rt>Advance Vector eXtensions</rt></ruby>）和 AVX2 等指令。这些指令可以**使用高达 256 位宽的 CPU 寄存器**！如果你能够有效利用它们，就能大规模并行处理计算任务。
  * `x86_64-v4`：这个版本在 `x86_64-v3` ISA 的基础上，迭代了更多的 SIMD 指令扩展，比如 AVX256 和 AVX512。其中，AVX512 可以**使用高达 512 位宽的 CPU 寄存器**！

### ARM

ARM 不仅是一家为 CPU ISA 制定规范的公司，它也设计并授权给其他厂商使用其 CPU 内核，甚至允许其他公司使用 ARM CPU ISA 设计自己的 CPU 内核。（最后那句话听起来就像是个 SQL 查询似的！）

你可能因为如树莓派这类的 <ruby>单板计算机<rt>Single Board Computer</rt></ruby>）（SBC）听说过 ARM。但其实 ARM 的 CPU 还广泛应用于手机中。最近，苹果从使用 `x86_64` 处理器转向了在其笔记本和台式机产品中使用自家设计的 ARM 处理器。

就像任一种 CPU 架构一样，ARM 基于内存总线宽度也有两个子集。

官方认定的 32 位和 64 位 ARM 架构的名称分别是 `AArch32` 和 `AArch64`。这里的 `AArch` 字符串代表 “<ruby>Arm 架构<rt>Arm Architecture</rt></ruby>”。这些是 CPU 执行指令时可切换的**模式**。

实际符合 ARM 的 CPU ISA 的指令规范被命名为 `ARMvX`，其中 `X` 是规范版本的代表数字。目前为止，已经有九个主要的规范版本。规范 `ARMv1` 到 `ARMv7` 定义了适用于 32 位 CPU 的架构，而 `ARMv8` 和 `ARMv9` 是适用于 64 位 ARM CPU 的规范。（[更多信息在此][1]）

> 💡 每个 ARM CPU 规范又有进一步的子规范。例如 ARMv8，我们有 ARMv8-R、ARMv8-A、ARMv8.1-A、ARMv8.2-A、ARMv8.3-A、ARMv8.4-A、ARMv8.5-A、ARMv8.6-A、ARMv8.7-A、ARMv8.8-A 和 ARMv8.9-A。 其中 -A 表示“应用核心”，-R 表示“实时核心”。

你可能会觉得困惑，为什么在 `AArch64` 正式被 ARM 认定为 64 位 ARM 架构后，有些人仍然称其为 `arm64`。原因主要有两点：

  1. `arm64` 这个名称在 ARM 决定采用 `AArch64` 之前就已经广为人知了。（ARM 的一些官方文档也将 64 位的 ARM 架构称为 `arm64`…… 😬）
  2. [Linus Torvalds 对 `AArch64` 这个名称表示不满。][2] 因此，Linux 的代码库主要将 `AArch64` 称为 `arm64`。然而，当你在系统中运行 `uname -m` 时，输出仍然是 `aarch64`。

因此，对于 32 位 ARM CPU，你应该寻找 `AArch32` 这个字符串，但有时也可能是 `arm` 或 `armv7`。相似的，对于 64 位 ARM CPU，你应该找 `AArch64` 这个字符串，但有时也可能会是 `arm64`、`ARMv8` 或 `ARMv9`。

### RISC-V

RISC-V 是 CPU 指令集架构（ISA）的一个开源规范。**但这并不意味着 CPU 自身是开源的！**这有点像以太网的情况。以太网规范是开源的，但你需付费购买网线、路由器和交换器。同样，RISC-V CPU 也要花钱购买。 :)

尽管如此，这并没有阻止人们创建并在开源许可下提供免费获取（**设计上的获取**，并非物理核心/SoC）的 RISC-V 核心。[这是其中的一项尝试][3]。

> 💡 总结一下：如果你在寻找运行于 RISC-V 消费级 CPU 上的软件，你应该寻找 “**rv64gc**” 这一字符串。这是许多 Linux 发行版所公认的。

像所有 CPU 架构一样，RISC-V 拥有 32 位和 64 位 CPU 架构。但由于 RISC-V 是非常新的描述 CPU ISA 的方式，大部分主流消费端或客户端的 CPU 核心一般都是 64 位的。大部分 32 位的设计都是微控制器，用于非常具体的用例。

它们的区别在于 CPU 的扩展。被称为 RISC-V CPU 的最低要求即实现“<ruby>基本整数指令集<rt>Base Integer Instruction Set</rt></ruby>”（`rv64i`）。

下表列出了一些扩展及其描述：

扩展名称 | 描述
---|---
`rv64i` | 64 位基本整数指令集（**必须的**）
`m` | 乘法和除法指令
`a` | 原子指令
`f` | 单精度浮点指令
`d` | 双精度浮点指令
`g` | 别名；一组运行**通用**操作系统所需的扩展集（包括 `imafd`）
`c` | 压缩指令

在 `rv64i` 这一字符串中，`rv` 表示 RISC-V，`64` 指的是 64 位 CPU 架构，而 `i` 指的是**强制性的**基本整数指令集扩展。 `rv64i` 之所以是一体的，因为即使 `i` 被认为是一种“扩展”，**但它是必须的**。

约定俗成的，扩展名称按上述特定顺序排列。因此，`rv64g` 展开为 `rv64imafd`，而不是 `rv64adfim`。

> 💡 还有其他一些像 Zicsr 和 Zifencei 这样的扩展，它们位于 `d` 和 `g` 扩展之间，但我故意不列出，以避免令你感到害怕。
>
> 因此，严格说来，（在写这篇文章的时候）`rv64g` 实际上是 `rv64imafdZicsrZifencei`。__恶魔般的笑声__

### PowerPC

PowerPC 曾是苹果、IBM 以及，摩托罗拉早期合作时代的一种流行 CPU 架构。在苹果转向英特尔的 x86 架构之前，它一直被应用于苹果的全部消费品产品线。

最初，PowerPC 采取的是大端字节序的内存排序。后来随着 64 位架构的引入，增加了使用小端字节排序的选项。这么做的目的是为了与英特尔的内存排序保持兼容（以防止软件错误），因为英特尔自始至终都一直采用的是小端字节序。有关字节序的更多内容，我可以唠叨很久，不过你可以通过阅读 [这篇 Mozilla 的文档][4] 来了解更多。

由于字节序在此也起到了一定的作用，PowerPC 共有三种架构：

  * `powerpc`：表示 32 位的 PowerPC 架构。
  * `ppc64`：表示拥有**大端字节序内存排序**的 64 位 PowerPC 架构。
  * `ppc64le`：表示拥有**小端字节序内存排序**的 64 位 PowerPC 架构。

目前，**`ppc64le` 是被广泛使用的架构**。

### 结论

市面上有各种各样的 CPU 架构。对于每一种架构，都有 32 位和 64 位的子集。在现有的 CPU 中，我们可以找到 x86、ARM、RISC-V 和 PowerPC 等架构。

其中，x86 是最广泛和易于获取的 CPU 架构，因为英特尔和 AMD 都采取了这种架构。此外，ARM 提供的产品几乎在手机和易于获取的单板计算机中被独占使用。

RISC-V 正在努力使硬件更广泛地被使用。我就有一款带有 RISC-V CPU 的单板计算机。 ;)

而 PowerPC 主要用于服务器，至少当前如此。

*（题图：MJ/634ac7ea-b344-443a-b041-3bb3b31a956f）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/arm-aarch64-x86_64/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/ARM_architecture_family#Cores
[2]: https://lore.kernel.org/lkml/CA+55aFxL6uEre-c=JrhPfts=7BGmhb2Js1c2ZGkTH8F=+rEWDg@mail.gmail.com/
[3]: https://github.com/openhwgroup
[4]: https://developer.mozilla.org/en-US/docs/Glossary/Endianness
[0]: https://img.linux.net.cn/data/attachment/album/202309/25/092727ilaax5z7dexxhxop.jpg