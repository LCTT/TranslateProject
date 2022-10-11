[#]: subject: "Some ways to get better at debugging"
[#]: via: "https://jvns.ca/blog/2022/08/30/a-way-to-categorize-debugging-skills/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lkxed"
[#]: translator: "aftermath0703"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14991-1.html"

提高调试能力的一些方法
======

![](https://img.linux.net.cn/data/attachment/album/202209/01/222854m78u44otl68yxbyu.jpg)

你们好！我一直在编写一本关于调试的杂志（这是 [目录的初稿][1]）。

作为其中的一部分，我认为阅读一些关于调试的学术论文可能会很有趣，上周 [Greg Wilson][2] 给我发了一些关于调试学术研究的论文。

其中一篇论文（《[建立一个调试教学的框架[付费墙]][3]》）对我们有效调试所需的不同种类的知识/技能进行了分类，我非常喜欢。它来自另一篇关于故障排除的更一般性的论文：《[学会排错：一个新的基于理论的设计架构][4]》。

我认为这个分类对于思考如何更好地进行调试是一个非常有用的结构，所以我把论文中的五个类别重新规划为你可以采取的行动，以提高调试的效率。

以下是这些行动：

#### 1、学习代码库

要调试一些代码，你需要了解你正在使用的代码库。

这似乎有点显而易见（当然，不了解代码的工作原理，你就无法调试代码！）

这种学习随着时间的推移会很自然地发生，而且实际上调试也是 *学习* 一个新的代码库如何工作的最好方法之一——
看到一些代码是如何崩溃的，有助于你了解它是如何工作的。

该论文将此称为“系统知识”。

#### 2、学习系统

论文中提到，你需要了解编程语言，但我认为不止于此 —— 为了修复 bug，往往你需要学习很多更广泛的环境，而不仅仅是语言。

举个例子，如果你是后端 Web 开发者，你可能需要的一些“系统”知识包括：

* HTTP 缓存如何工作
* CORS
* 数据库事务是如何工作的

我发现我经常需要更有意识地去学习像这样的系统性的东西 —— 我需要真正花时间去查找和阅读它们。

该论文将此称为“领域知识”。

#### 3、学习你的工具

现在有很多工具，例如：

* 调试器（GDB 等）
* 浏览器开发工具
* <ruby>剖析器<rt>profiler</rt></ruby>
* `strace` / `ltrace`
* `tcpdump` / `wireshark`
* 核心转储
* 甚至像错误信息这样的基本东西（如何正确阅读它们）

我在这个博客上写了很多关于调试工具的文章，并且肯定学习这些工具给我带来了巨大的变化。

该论文将此称为“处理性知识”。

#### 4、学习策略

这是最模糊的一类，在如何高效调试的过程中，我们都有很多策略和启发式方法。比如说：

* 写一个单元测试
* 写一个小的独立程序来重现这个错误
* 找到一个能工作的版本的代码，看看有什么变化
* 打印出无数的东西
* 增加额外的日志记录
* 休息一下
* 向朋友解释这个错误，然后在中途发现问题所在
* 查看 GitHub 上的问题，看看是否有匹配的问题

在写这本杂志的时候，我一直在思考这个类别，但我想让这篇文章简短，所以我不会在这里多说。

该论文将此称为“战略知识”。

#### 5、获得经验

最后一个类别是“经验”。这篇论文对此有一个非常有趣的评论：

> 他们的研究结果并没有显示出新手和专家所采用的策略有什么明显的区别。专家只是形成了更多正确的假设，并且在寻找故障方面更有效率。作者怀疑这个结果是由于新手和专家之间的编程经验不同造成的。

这真的引起了我的共鸣 —— 我遇到过很多第一次遇到时非常令人沮丧和困难的 bug，而在第五次、第十次或第二十次时就非常简单了。

对我来说，这也是最直接的知识类别之一 —— 你需要做的就是调查一百万个 bug，反正这就是我们作为程序员的全部生活 : ) 。这需要很长的时间，但我觉得它发生得很自然。

本文将此称为“经验知识”。

#### 就这样吧！

我打算把这篇文章写得很短，我只是非常喜欢这个分类，想把它分享出来。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/08/30/a-way-to-categorize-debugging-skills/

作者：[Julia Evans][a]
选题：[lkxed][b]
译者：[aftermath0703](https://github.com/aftermath0703)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lkxed
[1]: https://twitter.com/b0rk/status/1562480240240525314?s=20&t=BwKd6i0mVCTaCud2HDEUBA
[2]: https://third-bit.com/
[3]: https://dl.acm.org/doi/abs/10.1145/3286960.3286970
[4]: https://www.researchgate.net/profile/Woei-Hung/publication/225547853_Learning_to_Troubleshoot_A_New_Theory-Based_Design_Architecture/links/556f471c08aec226830a74e7/Learning-to-Troubleshoot-A-New-Theory-Based-Design-Architecture.pdf
