[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12131-1.html)
[#]: subject: (How I'm using AI to translate 'wash your hands' in 500 languages)
[#]: via: (https://opensource.com/article/20/4/ai-translation)
[#]: author: (Daniel Whitenack https://opensource.com/users/datadan)

我是如何用 AI 把“请洗手”翻译成 500 种语言的？
======

> 通过使用人类和机器生成的翻译，可以将关键的健康短语翻译成世界各地的当地语言。

![](https://img.linux.net.cn/data/attachment/album/202004/20/184427f1a2t5z61m5xxo1t.jpg)

你可能不知道，目前世界上有 [7117 种语言][2]在使用，不是方言，而是在用的语言! 然而，世界上许多数字媒体只能使用几十种语言，而像谷歌翻译这样的翻译平台只支持 100 种左右的语言。这样的现实意味着，由于缺乏及时获取信息的机会，全世界有数十亿人被边缘化。当前的冠状病毒（COVID-19）大流行已经让人痛苦地意识到了这一点，凸显了将健康相关的短语（如“<ruby>请洗手<rt>wash your hands</rt></ruby>”或“保持距离”等）即时、快速翻译成小众语言的必要性。

为此，我应用了最先进的 AI 技术，用 544 种语言构建出了与“请洗手”相近的短语并进行了统计（我的 GPU 还在运行）。<ruby>多语言无监督和受监督嵌入<rt>Multilingual Unsupervised and Supervised Embeddings</rt></ruby>（MUSE）方法被用来训练这 544 种语言和英语之间的跨语言单词嵌入。然后，这些嵌入方法可以从现有文档中提取出与目标短语相似的短语。

我与 SIL 国际公司的同事们合作完成了这项工作，他们收集了该短语的更多的人工翻译结果。这些人工翻译结果和我的一些机器翻译结果的组合可以在[这个民族语指南页面][3]上搜索到（机器生成的短语用一个小的机器人图标表示），更多的翻译将在生成/收集到的时候加入。

### 利用现有的语料库

SIL 国际公司已经完成了 2000 多种语言的语言工作，目前管理着 1600 多个语言项目。因此，当我解决这个特殊的问题时，我知道我们很可能已经多次将“请洗手”和/或类似的短语翻译成了数百种语言，而这一猜测得到了回报。我很快就从我们的档案库中收集到了超过 900 种语言的文档（主要是完成的贝壳书模板、教材和圣经）。这些文档中的每一份都有一个英文的对应版本，其中必然包括“请洗手”和/或类似“请洗脸”这样的短语。此外，这些文档的质量都很高，并与当地语言社区合作进行了翻译和检查。

这是相当多语言的数据集。然而，有两个问题需要克服。首先，这个数据包含了大多数语言的数千种样本，这与训练机器翻译模型所使用的数百万个样本形成了鲜明对比。其次，即使文档中包含目标语言中的“请洗手”这个短语，我们也不知道这个短语在周围文本中的确切位置。

我们当然可以利用[低资源语言的机器翻译][4]中的一些最新技巧，但是需要花费一些时间来调整自动化方法，以快速适应每种语言对中的翻译模型。此外，我们所针对的许多语言都没有现成的的基线，可以用来比较评估指标（例如 [BLEU 评分][5]）。考虑到对冠状病毒大流行的迫切担忧，我们希望比这更快一点（尽管我们计划在将来再来解决这个问题）。

我选择通过在现有的文档中寻找短语本身或短语的组件（如“请洗”或“你的手”）来尝试构建“请洗手”这个短语。为了找到这些成分，我使用 Facebook Research 的[多语言无监督和受监督嵌入（MUSE）][6]对每个 {英语、目标语言} 对进行了<ruby>跨语言<rt>cross-lingual</rt></ruby>嵌入训练。MUSE 以<ruby>单语言<rt>monolingual</rt></ruby>的单词嵌入作为输入（我使用 [fasttext][7] 来生成这些词），并使用对抗性方法学习了从英语到目标嵌入空间的映射。这个过程的输出是<ruby>跨语言<rt>cross-lingual</rt></ruby>的单词嵌入。

![Using fasttext along with MUSE to perform cross-language embedding][8]

一旦产生了跨语言嵌入，我们就可以开始在目标语言文档中寻找短语组件。结果发现，整个文档中清楚地使用了“请洗脸”这个短语以及单独的“手”、“请洗”等词。对于每一种语言，我都通过 n-gram 搜索我预期该短语会出现的地方（根据其在英语的对应版本中的用法）。使用跨语言嵌入法对 n-gram 进行了矢量化处理，并使用各种距离指标与英语短语的矢量化版本进行了比较。在嵌入空间中，与英文短语“最接近”的 n-gram 被确定为与目标语言匹配。

最后，将与英语对应的成分短语进行组合，生成目标语言中的“请洗手”短语。这种组合方式再次利用了跨语言嵌入，以确保以合适方式组合组件。例如，如果我们在目标语言中匹配“请洗脚”这个短语，就必须将“脚”对应的 n-gram 替换成“手”对应的 n-gram。下面是<ruby>伯利兹·克里奥尔<rt>Belize Kriol</rt></ruby>英语的一个例子：

![][9]

当然，在这个匹配过程中，会做一些假设，这个过程完全有可能不能产生语法上正确的预测。例如，我假设在大多数语言中，“手”的单词和“脚”的单词都是一个<ruby>字元<rt>token</rt></ruby>长的（字元由空格和标点符号隔开）。当然并非总是如此。这可能会造成类似于“和洗和手你”或类似的瑕疵词条。希望我们可以克服其中的一些局限性，并在未来扩展这个系统，但是，现在，我们选择用图形来强化这个想法。

我们将世界卫生组织的洗手说明改编成了一个 PNG 图片模板。然后，我们把我们翻译和生成的短语，用 Bash 和 Go 脚本的组合将其渲染到洗手图像中。这样，在文字和图像中都强调了正确洗手的理念（以防万一我们生成的翻译很尴尬）。

![][10]

### 结果

到目前为止，我已经能够训练出 544 种语言的跨语言嵌入。我使用上述讨论过的方法尝试为所有这些语言构建“请洗手”这个短语。因为我没有许多语言对的对齐数据，所以我使用了同样包含“请洗手”成分的单独的保留文档来帮助验证构造短语中的字元。这让我们对公开发布的翻译版本有了一些信心（至少它们包含了表示“洗”和/或“手”的信息）。此外，我还将该方法与谷歌翻译支持的和/或有可用的人工翻译的语言对进行了比较。以下是来自 [Ethnologue][11] 带有语言统计的翻译样本。

**语言：意大利语 [Ita]**

- 地点：意大利
- 人口： 68,000,000
- 我们的系统： làvati la mani
- 谷歌翻译： Lavati le mani

**语言：保加利亚语 [bul]**

- 地点：保加利亚
- 人口：8,000,000
- 我们的系统：умий ръцете
- 谷歌翻译：Измий си ръцете

**语言： 荷兰语 [nld]**

- 地点：荷兰
- 人口：24,000,000,000
- 我们的系统：wast uw handen
- 谷歌翻译：Was je handen

**语言： Pijin [pis]**

- 地点：所罗门群岛
- 人口： 550,000
- 我们的系统：wasim han
- 谷歌翻译：不支持

**语言：Tikar [tik]**

- 地点：喀麦隆
- 人口：110,000
- 我们的系统：ɓɔsi fyàʼ
- 谷歌翻译：不支持

**语言：Waffa [waj]**

- 地点：巴布亚新几内亚
- 人口：1,300
- 我们的系统：yaakuuvaitana nnikiiyauvaa fini
- 谷歌翻译：不支持

构造的短语类似于参考翻译，或者似乎是“请洗手”的另一种说法。例如，在保加利亚语中，我预测为“умий ръцете”，而谷歌翻译预测为“Измий си ръцете”。 然而，如果我用谷歌翻译回译我的预测，我还是会得到“请洗手”。有一些不确定的地方，我无法与参考译文（例如，所罗门群岛的 Pijin [pis]）或人类注释的跨度进行比较，但我仍然可以验证“洗”（wasim）和“手”（han）分别用在其他必定是谈论洗或手的参考文件中。 大约有 15% 的译文可以用这个方法验证，我希望在收集参考文献字典的过程中能进行更多的验证。

请注意，我最多使用了每种语言中大约 7000 个句子来得到上述译文，即使是意大利语这样的高资源语言也是如此。我也不依赖语言对之间的对齐句子。尽管存在这种数据非常稀缺、无监督的情况，但对于两个系统都支持的语言，我仍然能够获得类似于谷歌翻译的短语。这证明了这种“混合”方法（无监督的单词嵌入+基于规则的匹配）在将短语翻译成数据非常少的语言中的潜在用途。

注意：我绝对不是说这是解决冠状病毒和其他健康相关的信息传播问题的解决方案。这里仍有很多东西需要探索和正式评估，我们正在为此努力。在很多情况下，这种方法无法帮助构建数百种语言的重要信息资料。但是，我认为，我们所有人都应该尝试着为当前危机的相关问题制定创造性的解决方案。也许这只是一个非常大的拼图中的一块。

你可以在[这个民族语言指南][3]上查看经过验证的译文加上人工翻译的完整列表。此外，我们即将以论文的形式对这一系统进行更深入的描述和分析。我们欢迎公众对翻译进行反馈，以帮助系统进行微调，最重要的是，确保将健康信息传递给世界各地的边缘化语言社区。

### 制作自己的洗手海报

我们已经开源了[用于渲染复合的脚本和生成洗手海报的代码][12]。这种方法应该能够处理几乎所有的语言和脚本。你可以在海报中添加你自己的“请洗手”的翻译，以帮助传播，或者根据自己的本地语境进行翻译。请务必在社交媒体上以 #WashYourHands 为标签分享你生成的海报。

### 培养你的 AI 技能

有很多令人兴奋的 AI 问题，可以给世界带来巨大的影响。如果你想用人工智能解决像上面提到的问题，或者你认为你的企业可能需要开始利用人工智能来做其他事情（供应链优化、推荐、客户服务自动化等），那么不要错过今年 5 月的[AI 课堂培训活动][13]。*AI 课堂*是一个沉浸式的、为期三天的虚拟培训活动，适合至少有一定编程经验和数学基础知识的人参加。该培训提供了使用 Python 和开源框架（如 TensorFlow 和 PyTorch）进行现实的 AI 开发的实用基础知识。完成课程后，学员将有信心开始开发和部署自己的 AI 解决方案。

本文经许可转载自 https://datadan.io/blog/wash-your-hands 

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/ai-translation

作者：[Daniel Whitenack][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/datadan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/world_hands_diversity.png?itok=zm4EDxgE (Two diverse hands holding a globe)
[2]: https://www.ethnologue.com/guides/how-many-languages
[3]: https://www.ethnologue.com/guides/health
[4]: https://datadan.io/blog/resources-for-low-resource-machine-translation
[5]: https://en.wikipedia.org/wiki/BLEU
[6]: https://github.com/facebookresearch/MUSE
[7]: https://fasttext.cc/
[8]: https://opensource.com/sites/default/files/uploads/ai-language-translation-wash-your-hands-opensourcedotcom.gif (Using fasttext along with MUSE to perform cross-language embedding)
[9]: https://opensource.com/sites/default/files/uploads/ai-language-translation-wash-your-hands-opensourcedotcom2.gif
[10]: https://opensource.com/sites/default/files/uploads/ai-language-translation-wash-your-hands-opensourcedotcom3.gif
[11]: https://www.ethnologue.com/
[12]: https://github.com/sil-ai/wash-your-hands
[13]: https://datadan.io/
