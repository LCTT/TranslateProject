一个开源软件许可证合规的经济高效模式
============================================================

> 使用开源的方式有利于你的盈亏底线以及开源生态系统。


![An economically efficient model for open source software license compliance](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW_EvidencedBasedIP_520x292_CS.png?itok=mmhCWuZR "An economically efficient model for open source software license compliance")


“<ruby>合规性工业联合体<rt>The Compliance Industrial Complex</rt></ruby>” 是一个术语，它会唤起那些组织参与精心设计并且花费昂贵流程的以遵守开源许可条款的反乌托邦想象。由于“生活经常模仿艺术”，许多组织采用了这种做法，可惜的是它们剥夺了许多开源模型的好处。本文介绍了一种经济高效的开源软件许可证合规性方法。

开源许可证通常对从第三方授权的代码分发者有三个要求：

1.  提供开源许可证的副本
2.  包括版权声明
3.  对于 copyleft 许可证（如 GPL），将相应的源代码提供给接受者。

_（与任何一般性声明一样，可能会有例外情况，因此始终建议审查许可条款，如有需要，请咨询律师的意见。）_

因为源代码（以及任何相关的文件，例如：许可证、README）通常都包含所有这些信息，所以最简单的遵循方法就是随着二进制/可执行程序一起提供源代码。

替代方案更加困难并且昂贵，因为在大多数情况下，你仍然需要提供开源许可证的副本并保留版权声明。提取这些信息来结合你的二进制/可执行版本并不简单。你需要流程、系统和人员来从源代码和相关文件中复制此信息，并将其插入到单独的文本文件或文档中。

不要低估创建此文件的时间和费用。虽然有工具也许可以自动化部分流程，但这些工具通常需要人力资源（例如工程师、质量经理、发布经理）来准备代码来扫描并对结果进行评估（没有完美的工具，几乎总是需要审查）。你的组织资源有限，将其转移到此活动会增加机会成本。考虑到这笔费用，每个后续版本（主要或次要）的成本将需要进行新的分析和修订。

也有因不选择发布不能被很好识别的源码而导致增加的其他成本。这些根源在于不向开源项目的原始作者和/或维护者发布源代码, 这一活动称为上游化。独自上游化一般不满足大多数开源许可证的要求，这就是为什么这篇文章主张与你的二进制/可执行文件一起发布源代码。然而，上游化和提供源代码以及二进制/可执行文件都能提供额外的经济效益。这是因为你的组织不再需要保留随着每次发布合并开源代码修改而产生的私有分支 - 由于你的内部代码库与社区项目不同，这将是越来越消耗和凌乱的工作。上游化还增强了开源生态系统，它会鼓励社区创新，从中你的组织或许也会得到收益。

那么为什么大量的组织不会为其产品发布源代码来简化其合规性工作？在许多情况下，这是因为他们认为这可能会暴露他们竞争优势的信息。考虑到这些专有产品中的大量代码可能是开源代码的直接副本，以支持诸如 WiFi 或云服务这些当代产品的基础功能，这种信念可能是错误的。

即使对这些开源作品进行了修改来适配其专有产品，这些更改也往往是微不足道的，并包含了很少的新的版权部分或可用来专利的内容。因此，任何组织都应该通过这种方式来查看其代码，因为它可能会发现其代码库中绝大部分是开源的，只有一小部分是真正专有的、与竞争对手区分开来的部分。那么为什么不分发和向上游提交这些没有差别的代码呢？

考虑一下拒绝遵从工业联合体的思维方式, 以降低成本并大大简化合规性。使用开源的方式，并体验发布你的源代码的乐趣，以造福于你的盈亏底线和开源生态系统，从中你将继续收获更多的利益。

------------------------

作者简介

Jeffrey Robert Kaufman - Jeffrey R. Kaufman 是全球领先的开源软件解决方案提供商红帽公司的开源知识产权律师。Jeffrey 还担任着 Thomas Jefferson 法学院的兼职教授。 在加入红帽前，Jeffrey 在高通担任专利法律顾问，为首席科学家办公室提供开源顾问。 Jeffrey 在 RFID、条形码、图像处理和打印技术方面拥有多项专利。[更多关于我][2]

（题图： opensource.com）

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/9/economically-efficient-model

作者：[Jeffrey Robert Kaufman][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jkaufman
[1]:https://opensource.com/article/17/9/economically-efficient-model?rate=0SO3DeFAxtgLdmZxE2ZZQyTRTTbu2OOlksFZSUXmjJk
[2]:https://opensource.com/users/jkaufman
[3]:https://opensource.com/user/74461/feed
[4]:https://opensource.com/users/jkaufman
[5]:https://opensource.com/users/jkaufman
[6]:https://opensource.com/users/jkaufman
[7]:https://opensource.com/tags/law
[8]:https://opensource.com/tags/licensing
[9]:https://opensource.com/participate
