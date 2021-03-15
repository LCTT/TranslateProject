[#]: subject: (An Introduction to WebAssembly)
[#]: via: (https://www.linux.com/news/an-introduction-to-webassembly/)
[#]: author: (Marco Fioretti https://training.linuxfoundation.org/announcements/an-introduction-to-webassembly/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13197-1.html)

WebAssembly 介绍
======

![](https://img.linux.net.cn/data/attachment/album/202103/12/222938jww882da88oqzays.jpg)

### 到底什么是 WebAssembly？

[WebAssembly][1]，也叫 Wasm，是一种为 Web 优化的代码格式和 API（应用编程接口），它可以大大提高网站的性能和能力。WebAssembly 的 1.0 版本于 2017 年发布，并于 2019 年成为 W3C 官方标准。

该标准得到了所有主流浏览器供应商的积极支持，原因显而易见：官方列出的 [“浏览器内部”用例][2] 中提到了，其中包括视频编辑、3D 游戏、虚拟和增强现实、p2p 服务和科学模拟。除了让浏览器的功能比JavaScript 强大得多，该标准甚至可以延长网站的寿命：例如，正是 WebAssembly 为 [互联网档案馆的 Flash 动画和游戏][3] 提供了持续的支持。

不过，WebAssembly 并不只用于浏览器，目前它还被用于移动和基于边缘环境的 Cloudflare Workers 等产品中。

### WebAssembly 如何工作？

.wasm 格式的文件包含低级二进制指令（字节码），可由使用通用栈的虚拟机以“接近 CPU 原生速度”执行。这些代码被打包成模块（可以被浏览器直接执行的对象），每个模块可以被一个网页多次实例化。模块内部定义的函数被列在一个专用数组中，或称为<ruby>表<rt>Table</rt></ruby>，相应的数据被包含在另一个结构中，称为 <ruby>缓存数组<rt>arraybuffer</rt></ruby>。开发者可以通过 Javascript `WebAssembly.memory()` 的调用，为 .wasm 代码显式分配内存。

.wasm 格式也有纯文本版本，它可以大大简化学习和调试。然而，WebAssembly 并不是真的要供人直接使用。从技术上讲，.wasm 只是一个与浏览器兼容的**编译目标**：一种用高级编程语言编写的软件编译器可以自动翻译的代码格式。

这种选择正是使开发人员能够使用数十亿人熟悉的语言（C/C++、Python、Go、Rust 等）直接为用户界面进行编程的方式，但以前浏览器无法对其进行有效利用。更妙的是，至少在理论上程序员可以利用它们，无需直接查看 WebAssembly 代码，也无需担心物理 CPU 实际运行他们的代码（因为目标是一个**虚拟**机）。

### 但是我们已经有了 JavaScript，我们真的需要 WebAssembly 吗？

是的，有几个原因。首先，作为二进制指令，.wasm 文件比同等功能的 JavaScript 文件小得多，下载速度也快得多。最重要的是，Javascript 文件必须在浏览器将其转换为其内部虚拟机可用的字节码之前进行完全解析和验证。

而 .wasm 文件则可以一次性验证和编译，从而使“流式编译”成为可能：浏览器在开始**下载它们**的那一刻就可以开始编译和执行它们，就像串流电影一样。

这就是说，并不是所有可以想到的 WebAssembly 应用都肯定会比由专业程序员手动优化的等效 JavaScript 应用更快或更小。例如，如果一些 .wasm 需要包含 JavaScript 不需要的库，这种情况可能会发生。

### WebAssembly 是否会让 JavaScript 过时？

一句话：不会。暂时不会，至少在浏览器内不会。WebAssembly 模块仍然需要 JavaScript，因为在设计上它们不能访问文档对象模型 （DOM）—— [主要用于修改网页的 API][4]。此外，.wasm 代码不能进行系统调用或读取浏览器的内存。WebAssembly 只能在沙箱中运行，一般来说，它能与外界的交互甚至比 JavaScript 更少，而且只能通过 JavaScript 接口进行。

因此，至少在不久的将来 .wasm 模块将只是通过 JavaScript 提供那些如果用 JavaScript 语言编写会消耗更多带宽、内存或 CPU 时间的部分。

### Web 浏览器如何运行 WebAssembly？

一般来说，浏览器至少需要两块来处理动态应用：运行应用代码的虚拟机（VM），以及可以同时修改浏览器行为和网页显示的 API。

现代浏览器内部的虚拟机通过以下方式同时支持 JavaScript 和 WebAssembly：

  1. 浏览器下载一个用 HTML 标记语言编写的网页，然后进行渲染
  2. 如果该 HTML 调用 JavaScript 代码，浏览器的虚拟机就会执行该代码。但是...
  3. 如果 JavaScript 代码中包含了 WebAssembly 模块的实例，那么就按照上面的描述获取该实例，然后根据需要通过 JavaScript 的 WebAssembly API 来使用该实例
  4. 当 WebAssembly 代码产生的东西将修改 DOM（即“宿主”网页）的结构，JavaScript 代码就会接收到，并继续进行实际的修改。

### 我如何才能创建可用的 WebAssembly 代码？

越来越多的编程语言社区支持直接编译到 Wasm，我们建议从 webassembly.org 的 [入门指南][5] 开始，这取决于你使用什么语言。请注意，并不是所有的编程语言都有相同水平的 Wasm 支持，因此你的工作量可能会有所不同。 

我们计划在未来几个月内发布一系列文章，提供更多关于 WebAssembly 的信息。要自己开始使用它，你可以报名参加 Linux 基金会的免费 [WebAssembly 介绍][6]在线培训课程。

这篇[WebAssembly 介绍][7]首次发布在 [Linux Foundation – Training][8]。

--------------------------------------------------------------------------------

via: https://www.linux.com/news/an-introduction-to-webassembly/

作者：[Dan Brown][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://training.linuxfoundation.org/announcements/an-introduction-to-webassembly/
[b]: https://github.com/lujun9972
[1]: https://webassembly.org/
[2]: https://webassembly.org/docs/use-cases/
[3]: https://blog.archive.org/2020/11/19/flash-animations-live-forever-at-the-internet-archive/
[4]: https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction
[5]: https://webassembly.org/getting-started/developers-guide/
[6]: https://training.linuxfoundation.org/training/introduction-to-webassembly-lfd133/
[7]: https://training.linuxfoundation.org/announcements/an-introduction-to-webassembly/
[8]: https://training.linuxfoundation.org/
