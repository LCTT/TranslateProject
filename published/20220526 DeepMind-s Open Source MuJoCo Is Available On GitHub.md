[#]: subject: "DeepMind’s Open Source MuJoCo Is Available On GitHub"
[#]: via: "https://www.opensourceforu.com/2022/05/deepminds-open-source-mujoco-is-available-on-github/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14650-1.html"

DeepMind 的开源物理引擎 MuJoCo 已在 GitHub 发布
======

![deepmind1][1]

DeepMind 是 Alphabet 的子公司和 AI 研究实验室，在 2021 年 10 月，它收购了用于机器人研发的 MuJoCo 物理引擎，并承诺该模拟器将作为免费、开源、社区驱动的项目进行维护。现在，DeepMind 声称开源计划已完成，它的整个代码库 [可在 GitHub 上获得][2]。

MuJoCo 是 “Multi-Joint Dynamics with Contact” 的缩写，它是一个物理引擎，旨在帮助机器人、生物力学、图形和动画等领域的研究和开发（也包括其他需要快速准确模拟的领域）。MuJoCo 可用于帮助机器学习应用实现基于模型的计算，例如<ruby>控制综合<rt>control synthesis</rt></ruby>、<ruby>状态估计<rt>state estimation</rt></ruby>、<ruby>系统识别<rt>system identification</rt></ruby>、<ruby>机制设计<rt>mechanism design</rt></ruby>、通过<ruby>逆动力学<rt>inverse dynamics</rt></ruby>来进行数据分析，以及<ruby>并行采样<rt>parallel sampling</rt></ruby>。它也可以用作标准模拟器，例如用于游戏和交互式虚拟环境。（LCTT 译注：这段话中涉及到不少专业词汇，鉴于译者水平有限，若有谬误，请在评论中指出，同时也欢迎在评论中科普，一起学习～）

根据 DeepMind 的说法，以下是 MuJoCo 适合协作的一些功能：

* 能够模拟复杂机制的综合模拟器
* 可读、高性能、可移植的代码
* 易于扩展的代码库
* 丰富的文档，包括面向用户的和代码注释 —— 我们希望学术界和 OSS 社区的同事能够使用这个平台并为代码库做出贡献，从而改善所有人的研究

DeepMind 还说：

> “作为没有动态内存分配的 C 库，MuJoCo 非常快。不幸的是，原始物理速度一直受到 Python 包装器的阻碍：全局解释器锁（GIL）和非编译代码的存在，使得批处理、多线程操作无法执行。在下面的路线图中，我们将解决这个问题。”

（LCTT 译注： 这里补充了原文没有提及的路线图和基准测试结果。）

路线图：

* 通过批处理、多线程模拟释放 MuJoCo 的速度潜力
* 通过改进内部内存管理支持更大的场景
* 新的增量编译器，带来更好的模型可组合性
* 通过 Unity 集成支持更好的渲染
* 对物理导数的原生支持，包括解析和有限差分

> “目前，我们想分享两个常见模型的基准测试结果。注意，这个结果是在运行 Windows 10 的标准 AMD Ryzen 9 5950X 机器上获得的。”

![基准测试结果][3]

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/deepminds-open-source-mujoco-is-available-on-github/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/deepmind1.jpg
[2]: https://github.com/deepmind/mujoco
[3]: https://assets-global.website-files.com/621e749a546b7592125f38ed/628b971675cb60d74f5fa189_2A54E864-FE90-49E4-8E58-FE40298303E2.jpeg
