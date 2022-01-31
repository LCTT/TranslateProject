[#]: subject: "Popular Nintendo Video Game Emulator ‘Cemu’ Plans to Go Open-Source with Linux Support"
[#]: via: "https://news.itsfoss.com/cemu-nintendo-linux/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14193-1.html"

流行的任天堂电子游戏模拟器 Cemu 计划开源并支持 Linux
======

> 这的确是个好消息！

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/nintendo-cemu-linux.jpg?w=1200&ssl=1)

如果你喜欢玩复古游戏，你可能已经接触过复古游戏机模拟器。顺便说一句，所谓“<ruby>模拟器<rt>Emulator</rt></ruby>”（仿真器）主要是指允许主机系统运行为另一系统设计的游戏的软件或硬件。

最近，Cemu 成功引起了开源社区的注意力。它是众多复古电子游戏模拟器之一，可以让你玩为任天堂 Wii U 定制的游戏。然而，到目前为止，它在一个主要方面与大多数模拟器不同，即它是闭源的，但这即将改变。

### Cemu 简介

[Cemu][1] 是一个流行的基于软件的复古电子游戏模拟器，专门模拟任天堂 Wii U 游戏，它是这类模拟器中第一个。它利用了 OpenGL 和 Vulkan 来运行游戏。

多年来，它已经有了显著的进展，现在可以 [玩整个 Wii U 库中的 51% 的游戏][2]。这包括《马里奥卡丁车 8》和《塞尔达传说：荒野之息》等热门游戏。

虽然它早在 2015 年就发布了，但 Cemu 只能运行在 Windows 上。不过，开发者发布的新路线图指出，Cemu 应该很快就会移植到 Linux 上了。

而且，最令人关注的是，Cemu 将走向开源！

### 通往开源和 Linux 之路

路线图总共包括了由开发人员计划的八个里程碑。其中包括计划开发一个 Linux 移植版并向社区提供代码。

谈到 Cemu 的开源问题，开发者计划在 2022 年完成这一工作。所以，你不应该对此寄予厚望。

迁移到 Linux 涉及到将源代码从 C 语言改写成 C++ 语言，并从 Visual Studio 迁移到 cmake。

以下是开发者对将 Cemu 引入 Linux 的看法：

> 我们最终想提供一个原生的 Linux 版本。这一直是一个正在进行的副计划，尽管由于优先级较低和依赖于其他任务而进展相对缓慢，但现在已经完成了大约 70% 的工作。

开发人员还提到，移植过程伴随着其他工作，如软件 H264 解码器和 cubeb 后端。由于主要的工作已经完成，可以说 Cemu 很快就会出现在 Linux 上。

### 其他计划

开发人员已经考虑将 LLVM 作为 CPU JIT 后端，用于将 PowerPC（Wii U 的主机架构）转换为 ARM 等 X86 架构。

他们还刚刚开始着手开发一个新的着色器反编译器，以减少着色器编译时间和卡顿。

你可以参考 [官方路线图][3] 了解更多细节。

### 总结

这对渴望做出贡献并使 Cemu 变得更好的复古游戏爱好者来说绝对是一份大礼。

Cemu 最终将加入许多流行的、开源的任天堂游戏机模拟器的行列，如 Citra、Dolphin 和 Yuzu。

你对 Cemu 的开源有什么看法？复古游戏模拟器应该是闭源的还是开源的？

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/cemu-nintendo-linux/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: https://cemu.info
[2]: https://compat.cemu.info/
[3]: https://wiki.cemu.info/wiki/Roadmap
