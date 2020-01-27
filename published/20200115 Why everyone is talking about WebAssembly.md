[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11823-1.html)
[#]: subject: (Why everyone is talking about WebAssembly)
[#]: via: (https://opensource.com/article/20/1/webassembly)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

为什么每个人都在谈论 WebAssembly
======

> 了解有关在 Web 浏览器中运行任何代码的最新方法的更多信息。

![](https://img.linux.net.cn/data/attachment/album/202001/27/125343ch0hxdfbzibrihfn.jpg)

如果你还没有听说过 [WebAssembly][2]，那么你很快就会知道。这是业界最保密的秘密之一，但它无处不在。所有主流的浏览器都支持它，并且它也将在服务器端使用。它很快，它能用于游戏编程。这是主要的国际网络标准组织万维网联盟（W3C）的一个开放标准。

你可能会说：“哇，这听起来像是我应该学习编程的东西！”你可能是对的，但也是错的。你不需要用 WebAssembly 编程。让我们花一些时间来学习这种通常被缩写为“Wasm”的技术。

### 它从哪里来？

大约十年前，人们越来越认识到，广泛使用的 JavaScript 不够快速，无法满足许多目的。JavaScript 无疑是成功和方便的。它可以在任何浏览器中运行，并启用了今天我们认为理所当然的动态网页类型。但这是一种高级语言，在设计时并没有考虑到计算密集型工作负载。

然而，尽管负责主流 web 浏览器的工程师们对性能问题的看法大体一致，但他们对如何解决这个问题却意见不一。出现了两个阵营，谷歌开始了它的<ruby>原生客户端<rt>Native Client</rt></ruby>项目，后来又推出了<ruby>可移植原生客户端<rt>Portable Native Client</rt></ruby>变体，着重于允许用 C/C++ 编写的游戏和其它软件在 Chrome 的一个安全隔间中运行。与此同时，Mozilla 赢得了微软对 asm.js 的支持。该方法更新了浏览器，因此它可以非常快速地运行 JavaScript 指令的低级子集（有另一个项目可以将 C/C++ 代码转换为这些指令）。

由于这两个阵营都没有得到广泛采用，各方在 2015 年同意围绕一种称为 WebAssembly 的新标准，以 asm.js 所采用的基本方法为基础，联合起来。[如 CNET 的 Stephen Shankland 当时所写][3]，“在当今的 Web 上，浏览器的 JavaScript 将这些指令转换为机器代码。但是，通过 WebAssembly，程序员可以在此过程的早期阶段完成很多工作，从而生成介于两种状态之间的程序。这使浏览器摆脱了创建机器代码的繁琐工作，但也实现了 Web 的承诺 —— 该软件将在具有浏览器的任何设备上运行，而无需考虑基础硬件的细节。”

在 2017 年，Mozilla 宣布了它的最小可行的产品（MVP），并使其脱离预览版阶段。到该年年底，所有主流的浏览器都采用了它。[2019 年 12 月][4]，WebAssembly 工作组发布了三个 W3C 推荐的 WebAssembly 规范。

WebAssembly 定义了一种可执行程序的可移植二进制代码格式、相应的文本汇编语言以及用于促进此类程序与其宿主环境之间的交互接口。WebAssembly 代码在低级虚拟机中运行，这个可运行于许多微处理器之上的虚拟机可模仿这些处理器的功能。通过即时（JIT）编译或解释，WebAssembly 引擎可以以近乎原生平台编译代码的速度执行。

### 为什么现在感兴趣？

当然，最近对 WebAssembly 感兴趣的部分原因是最初希望在浏览器中运行更多计算密集型代码。尤其是笔记本电脑用户，越来越多的时间都花在浏览器上（或者，对于 Chromebook 用户来说，基本上是所有时间）。这种趋势已经迫切需要消除在浏览器中运行各种应用程序的障碍。这些障碍之一通常是性能的某些方面，这正是 WebAssembly 及其前身最初旨在解决的问题。

但是，WebAssembly 并不仅仅适用于浏览器。在 2019 年，[Mozilla 宣布了一个名为 WASI][5]（<ruby>WebAssembly 系统接口<rt>WebAssembly System Interface</rt></ruby>）的项目，以标准化 WebAssembly 代码如何与浏览器上下文之外的操作系统进行交互。通过将浏览器对 WebAssembly 和 WASI 的支持结合在一起，编译后的二进制文件将能够以接近原生的速度，跨不同的设备和操作系统在浏览器内外运行。

WebAssembly 的低开销立即使它可以在浏览器之外使用，但这无疑是赌注；显然，还有其它不会引入性能瓶颈的运行应用程序的方法。为什么要专门使用 WebAssembly？

一个重要的原因是它的可移植性。如今，像 C++ 和 Rust 这样的广泛使用的编译语言可能是与 WebAssembly 关联最紧密的语言。但是，[各种各样的其他语言][6]可以编译为 WebAssembly 或拥有它们的 WebAssembly 虚拟机。此外，尽管 WebAssembly 为其执行环境[假定了某些先决条件][7]，但它被设计为在各种操作系统和指令集体系结构上有效执行。因此，WebAssembly 代码可以使用多种语言编写，并可以在多种操作系统和处理器类型上运行。

另一个 WebAssembly 优势源于这样一个事实：代码在虚拟机中运行。因此，每个 WebAssembly 模块都在沙盒环境中执行，并使用故障隔离技术将其与宿主机运行时环境分开。这意味着，对于其它部分而言，应用程序独立于其宿主机环境的其余部分执行，如果不调用适当的 API，就无法摆脱沙箱。

### WebAssembly 现状

这一切在实践中意味着什么？

如今在运作中的 WebAssembly 的一个例子是 [Enarx][8]。

Enarx 是一个提供硬件独立性的项目，可使用<ruby>受信任的执行环境<rt>Trusted Execution Environments</rt></ruby>（TEE）保护应用程序的安全。Enarx 使你可以安全地将编译为 WebAssembly 的应用程序始终交付到云服务商，并远程执行它。正如 Red Hat 安全工程师 [Nathaniel McCallum 指出的那样][9]：“我们这样做的方式是，我们将你的应用程序作为输入，并使用远程硬件执行认证过程。我们使用加密技术验证了远程硬件实际上是它声称的硬件。最终的结果不仅是我们对硬件的信任度提高了；它也是一个会话密钥，我们可以使用它将加密的代码和数据传递到我们刚刚要求加密验证的环境中。”

另一个例子是 OPA，<ruby>开放策略代理<rt>Open Policy Agent</rt></ruby>，它[发布][10]于 2019 年 11 月，你可以[编译][11]他们的策略定义语言 Rego 为 WebAssembly。Rego 允许你编写逻辑来搜索和组合来自不同来源的 JSON/YAML 数据，以询问诸如“是否允许使用此 API？”之类的问题。

OPA 已被用于支持策略的软件，包括但不限于 Kubernetes。使用 OPA 之类的工具来简化策略[被认为是在各种不同环境中正确保护 Kubernetes 部署的重要步骤][12]。WebAssembly 的可移植性和内置的安全功能非常适合这些工具。

我们的最后一个例子是 [Unity][13]。还记得我们在文章开头提到过 WebAssembly 可用于游戏吗？好吧，跨平台游戏引擎 Unity 是 WebAssembly 的较早采用者，它提供了在浏览器中运行的 Wasm 的首个演示品，并且自 2018 年 8 月以来，[已将 WebAssembly][14]用作 Unity WebGL 构建目标的输出目标。

这些只是 WebAssembly 已经开始产生影响的几种方式。你可以在 <https://webassembly.org/> 上查找更多信息并了解 Wasm 的所有最新信息。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/webassembly

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://opensource.com/article/19/8/webassembly-speed-code-reuse
[3]: https://www.cnet.com/news/the-secret-alliance-that-could-give-the-web-a-massive-speed-boost/
[4]: https://www.w3.org/blog/news/archives/8123
[5]: https://hacks.mozilla.org/2019/03/standardizing-wasi-a-webassembly-system-interface/
[6]: https://github.com/appcypher/awesome-wasm-langs
[7]: https://webassembly.org/docs/portability/
[8]: https://enarx.io
[9]: https://enterprisersproject.com/article/2019/9/application-security-4-facts-confidential-computing-consortium
[10]: https://blog.openpolicyagent.org/tagged/webassembly
[11]: https://github.com/open-policy-agent/opa/tree/master/wasm
[12]: https://enterprisersproject.com/article/2019/11/kubernetes-reality-check-3-takeaways-kubecon
[13]: https://opensource.com/article/20/1/www.unity.com
[14]: https://blogs.unity3d.com/2018/08/15/webassembly-is-here/
