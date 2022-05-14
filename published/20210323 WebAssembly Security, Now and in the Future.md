[#]: subject: (WebAssembly Security, Now and in the Future)
[#]: via: (https://www.linux.com/news/webassembly-security-now-and-in-the-future/)
[#]: author: (Dan Brown https://training.linuxfoundation.org/announcements/webassembly-security-now-and-in-the-future/)
[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14592-1.html)

WebAssembly 安全的现在和未来
======

![](https://img.linux.net.cn/data/attachment/album/202205/14/144316bb8kbwjephjyb427.jpg)

### 简介

正如我们 [最近解释的][1]，WebAssembly 是一种用于以任何语言编写的二进制格式的软件，旨在最终无需更改就能在任意平台运行。WebAssembly 的第一个应用是在 Web 浏览器中，以使网站更快、更具交互性。WebAssembly 有计划推向 Web 之外，从各种服务器到物联网（IoT），其创造了很多机会，但也存在很多安全问题。这篇文章是对这些问题和 WebAssembly 安全模型的一篇介绍性概述。

### WebAssembly 跟 JavaScript 很像

在 Web 浏览器内部，WebAssembly 模块由执行 JavaScript 代码的同一 <ruby>虚拟机<rt>VM</rt></ruby> 管理。因此，WebAssembly 和 JavaScript 一样，造成的危害也是相同的，只是效率更高，更不易被察觉。由于 JavaScript 是纯文本，运行前需要浏览器编译，而 WebAssembly 是一种可立即运行的二进制格式，运行速度更快，也更难被扫描出（即使使用杀毒软件）其中的恶意指令。

WebAssembly 的这种 “代码混淆” 效果已经被用来弹出不请自来的广告，或打开假的 “技术支持” 窗口，要求提供敏感数据。另一个把戏则是自动将浏览器重定向到包含真正危险的恶意软件的 “落地” 页。

最后，就像 JavaScript 一样，WebAssembly 可能被用来 “窃取” 处理能力而不是数据。2019 年，[对 150 个不同的 WASM 模块的分析][2] 发现，其中约 _32%_ 被用于加密货币挖掘。

### WebAssembly 沙盒和接口

WebAssembly 代码在一个由虚拟机（而不是操作系统）管理的 [沙盒][3] 中封闭运行。这使它无法看到主机，也无法直接与主机交互。对系统资源（文件、硬件或互联网连接）的访问只能通过该虚拟机提供的 <ruby>WebAssembly 系统接口<rt>WebAssembly System Interface</rt></ruby>（WASI） 进行。

WASI 不同于大多数其他应用程序编程接口（API），它具有独特的安全特性，真正推动了 WASM 在传统服务器和<ruby>边缘<rt>Edge</rt></ruby>计算场景中的采用，这将是下一篇文章的主题。在这里，可以说，当从 Web 迁移到其他环境时，它的安全影响会有很大的不同。现代 Web 浏览器是极其复杂的软件，但它是建立在数十年的经验和数十亿人的日常测试之上的。与浏览器相比，服务器或物联网（IoT）设备几乎是未知领域。这些平台的虚拟机将需要扩展 WASI，因此，肯定会带来新的安全挑战。

### WebAssembly 中的内存和代码管理

与普通的编译程序相比，WebAssembly 应用程序对内存的访问非常受限，对它们自己也是如此。WebAssembly 代码不能直接访问尚未调用的函数或变量，不能跳转到任意地址，也不能将内存中的数据作为字节码指令执行。

在浏览器内部，WASM 模块只能获得一个连续字节的全局数组（<ruby>线性内存<rt>linear memory</rt></ruby>）进行操作。WebAssembly 可以直接读写该区域中的任意位置，或者请求增加其大小，但仅此而已。这个<ruby>线性内存<rt>linear memory</rt></ruby>也与包含其实际代码、执行堆栈、当然还有运行 WebAssembly 的虚拟机的区域分离。对于浏览器来说，所有这些数据结构都是普通的 JavaScript 对象，使用标准过程与所有其他对象隔离。

### 结果还好，但不完美

所有这些限制使得 WebAssembly 模块很难做出不当行为，但也并非不可能。

沙盒化的内存使 WebAssembly 几乎不可能接触到 __外部__ 的东西，也使操作系统更难防止 __内部__ 发生不好的事情。传统的内存监测机制，比如 <ruby>[堆栈金丝雀][4]<rt>Stack Canaries</rt></ruby> 能注意到是否有代码试图扰乱它不应该接触的对象，[但在这里没用][5]。

事实上，WebAssembly 只能访问自己的<ruby>线性内存<rt>linear memory</rt></ruby>，但可以直接访问，这也可能为攻击者的行为 _提供便利_。有了这些约束和对模块源代码的访问，就更容易猜测覆盖哪些内存位置可能造成最大的破坏。破坏局部变量似乎也是 [可能的][6]，因为它们停留在<ruby>线性内存<rt>linear memory</rt></ruby>中的无监督堆栈中。

2020 年的一篇关于 [WebAssembly 的二进制安全性][5] 的论文指出，WebAssembly 代码仍然可以在设定的常量内存中覆盖字符串文字。同一篇论文描述了在三个不同的平台（浏览器、Node.JS 上的服务端应用程序，和独立 WebAssembly 虚拟机的应用程序）上，WebAssembly 可能比编译为原生二进制文件时更不安全的其他方式。建议进一步阅读此主题。

通常，认为 WebAssembly 只能破坏其自身沙盒中的内容的想法可能会产生误导。WebAssembly 模块为调用它们的 JavaScript 代码做繁重的工作，每次都会交换变量。如果模块在这些变量中的任意一处写入不安全的调用 WebAssembly 的 JavaScript 代码，就 _会_ 导致崩溃或数据泄露。

### 未来的方向

WebAssembly 的两个新出现的特性：[并发][7] 和内部垃圾收集，肯定会影响其安全性（如何影响以及影响多少，现在下结论还为时过早）。

并发允许多个 WebAssembly 模块在同一个虚拟机中并行。目前，只有通过 JavaScript [web workers][8] 才能实现这一点，但更好的机制正在开发中。安全方面，他们可能会带来 [以前不需要的大量的代码][9]，也就是更多出错的方法。

为了提高性能和安全性，我们需要一个 [本地的垃圾收集器][10]，但最重要的是，要在经过良好测试的浏览器的 Java 虚拟机之外使用 WebAssembly，因为这些虚拟机无论如何都会在自己内部收集所有的垃圾。当然，甚至这个新代码也可能成为漏洞和攻击的另一个入口。

往好处想，使 WebAssembly 比现在更安全的通用策略也是存在的。再次引用 [这篇文章][5]，这些策略包括：编译器改进、栈/堆和常量数据的 _分离_ 的线性存储机制，以及避免使用 **不安全的语言**（如 C）编译 WebAssembly 模块代码。

*本文 [WebAssembly 安全的现在和未来][11] 首次发表在 [Linux 基金会 - 培训][12]。*

--------------------------------------------------------------------------------

via: https://www.linux.com/news/webassembly-security-now-and-in-the-future/

作者：[Dan Brown][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://training.linuxfoundation.org/announcements/webassembly-security-now-and-in-the-future/
[b]: https://github.com/lujun9972
[1]: https://training.linuxfoundation.org/announcements/an-introduction-to-webassembly/
[2]: https://www.sec.cs.tu-bs.de/pubs/2019a-dimva.pdf
[3]: https://webassembly.org/docs/security/
[4]: https://ctf101.org/binary-exploitation/stack-canaries/
[5]: https://www.usenix.org/system/files/sec20-lehmann.pdf
[6]: https://spectrum.ieee.org/tech-talk/telecom/security/more-worries-over-the-security-of-web-assembly
[7]: https://github.com/WebAssembly/threads
[8]: https://en.wikipedia.org/wiki/Web_worker
[9]: https://googleprojectzero.blogspot.com/2018/08/the-problems-and-promise-of-webassembly.html
[10]: https://github.com/WebAssembly/gc/blob/master/proposals/gc/Overview.md
[11]: https://training.linuxfoundation.org/announcements/webassembly-security-now-and-in-the-future/
[12]: https://training.linuxfoundation.org/
