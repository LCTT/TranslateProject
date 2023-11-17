[#]: subject: "Open Source Definition for AI Models Need a Change"
[#]: via: "https://news.itsfoss.com/open-source-definition-ai/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16344-1.html"

AI 模型的开源定义需要改变
======

![][0]

> 你认为开源许可证应当进行演变吗？

2023 年，我们以**人工智能（AI）崭露头角**开始了新的一年，同时也见证了众多公司全力以赴投身于 AI。

比如说 **Mozilla**，它在 2023 年初制定了 [开源 AI 计划][1]，以开发各种 AI 驱动的解决方案。而 **HuggingChat** 也成为了第一个推出 ChatGPT [开源替代品][2] 的组织。

即便是 Meta，他们也不例外。他们自家的 <ruby>大型语言模型<rt>Large Language Model</rt></ruby>（LLM）[Llama 2][3] 项目在这一年都颇受关注，几个月前他们甚至推出了一款新的 [ChatGPT 竞争对手][4]。

然而，也有很多人开始 [提出质疑][5]，主张 **Meta 的 Llama 2 模型并不像人们期望的那样开放**，查看它的开源许可证似乎更是印证了这个观点。

该许可证 **不允许拥有超过 7 亿日活跃用户的服务使用 Llama 2**，同样的，**它也不能被用于训练其他的语言模型**。

这也就意味着 Meta 对于 Llama 2 的许可证 **未能满足** <ruby>开源倡议组织<rt>Open Source Initiative</rt></ruby>（OSI）的 <ruby>[开源定义][6]<rt>Open Source Definition</rt></ruby>（OSD）所列出的 **全部要求**。

人们可以争辩，像 [EleutherAI][7] 和 [Falcon 40B][8] 这样的机构就做出了很好的示范，展示了如何适当地处理 AI 的开源许可。

然而，Meta 对此的看法却截然不同。

### 开源许可需要进化

在与 [The Verge][10] 的交谈中，Meta 人工智能研究副总裁 [Joëlle Pineau][11] 为他们的立场进行了辩解。

她说，我们 **需要在信息共享的益处和可能对 Meta 商业造成的潜在成本之间寻找平衡**。

这种对开源的态度让他们的研究人员能够更加专注地处理 AI 项目。她还补充说：

> 开放的方式从内部改变了我们的科研方法，它促使我们不发布任何不安全的东西，并在一开始就负起责任。

Joëlle 希望他们的生成型 AI 模型能够和他们过去的 [PyTorch][12] 项目一样受到热捧。

但是，**问题在于现有的许可证机制**。她又补充说，这些许可证并不是设计来处理那些需要利用大量多源数据的软件。

这反过来**为开发者和用户提供了有限责任**，以及，**对版权侵犯的有限赔偿**（解释为：保护）。

此外，她还指出：

> AI 模型与软件不同，涉及的风险更大，因此我认为我们应该对当前用户许可证进行改变，以更好地适应 AI 模型。
>
> 但我并不是一名律师，所以我在此问题上听从他们的意见。

我赞同她的观点，我们需要更新现有的许可方案，使之更好地适应 AI 模型，以及其他相关事务。

显而易见，**OSI 正在努力进行此事**。OSI 的执行董事 [Stefano Maffulli][13] 向 The Verge 透露，他们了解到 **当前的 OSI 批准的许可证无法满足人工智能模型的需求**。

他们正在商讨如何与 AI 开发者合作，以提供一个 “**透明、无许可但安全**” 的模型访问。

他还补充说：

> 我们肯定需要重新思考许可证的方式，以解决 AI 模型中版权和授权的真正限制，同时仍遵循开源社区的一些原则。

无论未来如何，显然，**开源标准必须推动其演化，以适应新的以及即将出现的技术** ，而此类问题不仅仅局限于 AI。

对于未来几年开源许可的变革，我充满期待。

💬 对于你来说呢？你认为对于陈旧的开源标准，我们需要进行什么样的改变？

*（题图：MJ/e8bae5f6-606b-47db-aaea-c992c0bd143e）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/open-source-definition-ai/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/mozilla-open-source-ai/
[2]: https://news.itsfoss.com/huggingchat-chatgpt/
[3]: https://ai.meta.com/llama/
[4]: https://news.itsfoss.com/meta-open-source-chatgpt/
[5]: https://www.wired.com/story/the-myth-of-open-source-ai/
[6]: https://opensource.org/osd/
[7]: https://www.eleuther.ai/
[8]: https://www.tii.ae/news/uaes-technology-innovation-institute-launches-open-source-falcon-40b-large-language-model
[9]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[10]: https://www.theverge.com/2023/10/30/23935587/meta-generative-ai-models-open-source
[11]: https://en.wikipedia.org/wiki/Jo%C3%ABlle_Pineau
[12]: https://pytorch.org/
[13]: https://twitter.com/smaffulli
[0]: https://img.linux.net.cn/data/attachment/album/202311/02/215953yyz45l5l3v4fzqyv.jpg