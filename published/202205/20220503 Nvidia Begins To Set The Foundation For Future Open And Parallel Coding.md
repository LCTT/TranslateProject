[#]: subject: "Nvidia Begins To Set The Foundation For Future Open And Parallel Coding"
[#]: via: "https://www.opensourceforu.com/2022/05/nvidia-begins-to-set-the-foundation-for-future-open-and-parallel-coding/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "zxcv545"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14565-1.html"

英伟达开始着手为未来的开放和并行编程建立基础
======

![](https://img.linux.net.cn/data/attachment/album/202205/09/080227sdxqcd3rxooc3cq3.jpg)

随着图形处理器在计算机里变得越来越常见，英伟达正在扩大与标准和开源社区的合作，以便于包括先前仅限于该公司开发工具的下游技术。虽然人们在 C++ 和 Fortran 等语言上投入了大量精力，但这些语言被认为在高度并行的计算机上执行代码落后于原生实现的编程语言。

英伟达结合了开放和专有库的 CUDA 并行编程框架影响了许多正在开放和主流化的技术。在 2007 年，CUDA 作为一个为程序员开发基于 GPU 的系统的一系列编程工具和框架而推出。然而，随着 GPU 利用率在更多应用程序和领域中的增长，CUDA 理念发生了转变。

英伟达因其在 GPU 上的主导地位而广为人知，但 CUDA 是这家以 1 万亿市值为目标的软件和服务供应商重塑品牌的核心。英伟达的长期目标是成为一个全栈提供商，专注于自动驾驶、量子计算、医疗保健、机器人、网络安全和量子计算等特定领域。

英伟达已经在特定领域创建了专用的 CUDA 库，以及企业可以使用的硬件和服务。其 CEO 黄仁勋在最近的 GPU 技术大会上宣布的 “AI 工厂” 概念，最能体现全栈战略。客户可以将应用程序放入英伟达的大型数据中心，从而获得针对特定行业或应用程序需求量身定制的定制 AI 模型。

英伟达可以通过两种方式从 AI 工厂原则中受益：利用 GPU 容量或利用特定领域的 CUDA 库。在英伟达 GPU 上，程序员可以使用 OpenCL 等开源并行编程框架。另一方面，CUDA 将为那些愿意投资的人提供额外的最后一英里增长，因为其已调整为与英伟达的 GPU 密切运作。

虽然并行编程在高性能计算中很常见常见，但英伟达的目标是让其成为主流计算的标准。该公司正在协助实现一流工具的标准化，无论品牌、加速器类型或并行编程框架是什么，都可以编写可跨硬件平台移植的并行代码。

一方面，英伟达是 C++ 小组的成员，该小组正在为跨硬件同时执行可移植代码奠定基础。上下文可以是主要执行 IO 的 CPU 线程，也可以是执行高要求计算的 CPU 或 GPU 线程。英伟达特别致力于为 C++ 程序员提供异步和并行的标准语言和基础设施。

第一项工作侧重于内存模型，该模型已合并到 C++ 11 中，但当并行性和并发性变得更加普遍时，必须对其进行更新。C++ 11 的内存模型强调跨多核 CPU 的并发执行，但它缺乏并行编程钩子。C++ 17 标准为更高级别的并行特性奠定了基础，但真正的可移植性必须等待未来的标准。C++ 20 是当前标准，而 C++ 23 即将推出。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/nvidia-begins-to-set-the-foundation-for-future-open-and-parallel-coding/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[zxcv545](https://github.com/zxcv545)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Nvidia_logo_angled_shutterstock.jpg
