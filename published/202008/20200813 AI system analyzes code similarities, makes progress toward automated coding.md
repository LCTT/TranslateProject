[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12569-1.html)
[#]: subject: (AI system analyzes code similarities, makes progress toward automated coding)
[#]: via: (https://www.networkworld.com/article/3570389/ai-system-analyzes-code-similarities-makes-progress-toward-automated-coding.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

AI 系统向自动化编码迈进
======

> 来自 Intel、MIT 和佐治亚理工学院的研究人员正在研究一个 AI 引擎，它可以分析代码的相似性，以确定代码的实际作用，为自动化软件编写奠定了基础。

![](https://img.linux.net.cn/data/attachment/album/202008/31/231333fklk447gw4w4b4vk.jpg)

随着人工智能（AI）的快速发展，我们是否会进入计算机智能到足以编写自己的代码并和人类一起完成工作？新的研究表明，我们可能正在接近这个里程碑。

来自 MIT 和佐治亚理工学院的研究人员与 Intel 合作开发了一个人工智能引擎，被称为机器推断代码相似性（MISIM），它旨在分析软件代码并确定它与其他代码的相似性。最有趣的是，该系统有学习代码的潜力，然后利用这种智能来改变软件的编写方式。最终，人们可以解释希望程序做什么，然后机器编程（MP）系统可以拿出一个已经编写完的应用。

Intel 首席科学家兼机器编程研究总监/创始人 Justin Gottschlich 在该公司的[新闻稿][2]中说：“当完全实现时，MP 能让每个人都能以任何最适合自己的方式 —— 无论是代码、自然语言还是其他东西 —— 来表达自己的意图以创建软件。这是一个大胆的目标，虽然还有很多工作要做，但 MISIM 是朝着这个目标迈出的坚实一步。”

### 它是如何工作的

Intel 解释说，神经网络“根据它们被设计执行的作业”给代码片段打出相似度分数。例如，两个代码样本可能看起来完全不同，但由于它们执行相同的功能，因此被评为相同。然后，该算法可以确定哪个代码片段更有效率。

例如，代码相似性系统的原始版本被用于抄袭检测。然而，有了 MISIM，该算法会查看代码块，并试图根据上下文确定这些代码段是否具有相似的特征，或者是否有相似的目标。然后，它可以提供性能方面的改进，例如说，总体效率的改进。

MISIM 的关键是创造者的意图，它标志着向基于意图的编程的进步，它可以使软件的设计基于非程序员创造者想要实现的目标。通过基于意图的编程，算法会借助于一个开源代码池，而不是依靠传统的、手工的方法，编译一系列类似于步骤的编程指令，逐行告诉计算机如何做某件事。

Intel 解释说：“MISIM 与现有代码相似性系统的核心区别在于其新颖的上下文感知语义结构 （CASS），其目的是将代码的实际作用提炼出来。与其他现有的方法不同，CASS 可以根据特定的上下文进行配置，使其能够捕捉到更高层次的代码描述信息。CASS 可以更具体地洞察代码的作用，而不是它是如何做的。”

这是在没有编译器（编程中的一个阶段，将人类可读代码转换为计算机程序）的情况下完成的。方便的是，可以执行部分片段，只是为了看看那段代码中会发生什么。另外，该系统摆脱了软件开发中一些比较繁琐的部分，比如逐行查找错误。更多细节可以在该小组的论文（[PDF][3]）中找到。

Intel 表示，该团队的 MISIM 系统比之前的代码相似性系统识别相似代码的准确率高 40 倍。

一个 Redditor，Heres_your_sign [对 MISIM 报道][4]的评论中有趣地指出，幸好计算机不写需求。这位 Redditor 认为，那是自找麻烦。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3570389/ai-system-analyzes-code-similarities-makes-progress-toward-automated-coding.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[2]: https://newsroom.intel.com/news/intel-mit-georgia-tech-machine-programming-code-similarity-system/#gs.d8qd40
[3]: https://arxiv.org/pdf/2006.05265.pdf
[4]: https://www.reddit.com/r/technology/comments/i2dxed/this_ai_could_bring_us_computers_that_can_write/
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
