[#]: subject: "Meta’s AI Model That Helps Overcome Language Barrier Is Now Open-Source"
[#]: via: "https://news.itsfoss.com/meta-open-source-ai-model/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lkxed"
[#]: translator: "fenglyulin"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14812-1.html"

Meta 开源了语言翻译 AI 模型
======

> Meta 的 “<ruby>不落下任何语言<rt>No Language Left Behind</rt></ruby>” 是一个宏大的开源项目，旨在以最高准确度翻译语言。

![meta][1]

Meta（前身是 Facebook）在开源世界做出了不小的贡献。Meta 除了专注于<ruby>元宇宙<rt>Metaverse</rt></ruby>和其社交媒体平台外，还致力于各种研究和创新工作，比如 React（一个 JaveScript 库）。

现在，Meta 的研究人员决定开源一个叫 “<ruby>不落下任何语言<rt>No Language Left Behind</rt></ruby>” 项目。

（LCTT 校注：这个直译项目名称不够好听，我来抛砖引玉，似可称做“无人独语”，读者有什么建议吗？）

### Meta 试图不落下任何语言

![200 languages within a single AI model: A breakthrough in high-quality machine translation][2]

目前，虽然世界上有大约 7000 个在使用中的语言，但大多数在线的内容都是以少数的流行语言来提供的，比如英语。这让许多不懂这些语言的人处于不利的地位。

虽然现存的许多翻译工具，但语法错误会让错误变得难以阅读和理解。另外，如果你想把内容翻译为一个不流行的语言（特别是非洲和亚洲的一些语言），翻译体验不会很好。

因此，Meta 正在开发有最高质量的翻译工具，可以帮助解决这一全球性的问题。

NLLB-200（<ruby>不落下任何语言<rt>No Language Left Behind</rt></ruby>） 是一个人工智能翻译模型，其可以翻译 200 多种语言。该模型在每种语言中的翻译结果是通过一个名为 FLORES-200 复杂数据集来确定和评估的。

正如 Meta 所说，NLLB 的翻译结果比以前的人工智能研究方法好 40% 。对于一些最不常见的语言，其翻译准确率甚至超过 70%。了不起的工作！

为了帮助开发项目和提高模型的翻译质量，Meta 向所有感兴趣的研究人员开放了源代码，包括 NLLB-200 模型、FLORES-200 数据库、模型训练和重建训练数据库的代码。
 
你可以在 [GitHub][3] 上找到源代码，并且可以在该项目的 [博客][4] 上了解它的更多信息。

### 对社会事业的鼓励

Meta 宣布向从事<ruby>联合国可持续发展目标<rt>UN Sustainable Development Goals</rt></ruby>任何领域工作和翻译非洲语言的非营利组织和研究人员提供高达 20 万美元的捐赠，也鼓励其他学术领域如语言学和机器翻译的研究人员申请。

### 项目的影响

尽管 Meta 主要打算在其数字平台上，特别是在“元宇宙”上使用 NLLB，但 NLLB 也有可能在其他领域产生巨大影响。

许多用户可以用他们的母语轻松地访问和阅读在线资源。项目开源后，社区应该能够帮助实现这个目标。

*你对 Meta 的这个项目有什么看法？*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/meta-open-source-ai-model/

作者：[Rishabh Moharir][a]
选题：[lkxed][b]
译者：[fenglyulin](https://github.com/fenglyulin)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/07/meta-makes-ai-language-model-opensource.jpg
[2]: https://youtu.be/uCxSPPiwrNE
[3]: https://github.com/facebookresearch/fairseq/tree/nllb
[4]: https://ai.facebook.com/blog/nllb-200-high-quality-machine-translation/
