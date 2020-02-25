[#]: collector: (lujun9972)
[#]: translator: (zhangxiangping)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11927-1.html)
[#]: subject: (12 open source tools for natural language processing)
[#]: via: (https://opensource.com/article/19/3/natural-language-processing-tools)
[#]: author: (Dan Barker https://opensource.com/users/barkerd427)

12 种自然语言处理的开源工具
======

> 让我们看看可以用在你自己的 NLP 应用中的十几个工具吧。

![](https://img.linux.net.cn/data/attachment/album/202002/25/103230j77i7zx8uyymj7y3.jpg)

在过去的几年里，自然语言处理（NLP）推动了聊天机器人、语音助手、文本预测等这些渗透到我们的日常生活中的语音或文本应用程技术的发展。目前有着各种各样开源的 NLP 工具，所以我决定调查一下当前开源的 NLP 工具来帮助你制定开发下一个基于语音或文本的应用程序的计划。

尽管我并不熟悉所有工具，但我将从我所熟悉的编程语言出发来介绍这些工具（对于我不熟悉的语言，我无法找到大量的工具）。也就是说，出于各种原因，我排除了三种我熟悉的语言之外的工具。

R 语言可能是没有被包含在内的最重要的语言，因为我发现的大多数库都有一年多没有更新了。这并不一定意味着它们没有得到很好的维护，但我认为它们应该得到更多的更新，以便和同一领域的其他工具竞争。我还选择了最有可能用在生产场景中的语言和工具（而不是在学术界和研究中使用），而我主要是使用 R 作为研究和发现工具。

我也惊讶地发现 Scala 的很多库都没有更新了。我上次使用 Scala 已经过去了两年了，当时它非常流行。但是大多数库从那个时候就再没有更新过，或者只有少数一些有更新。

最后，我排除了 C++。 这主要是因为我上次使用 C++ 编写程序已经有很多年了，而我所工作的组织还没有将 C++ 用于 NLP 或任何数据科学方面的工作。

### Python 工具

#### 自然语言工具包（NLTK）

毋庸置疑，[自然语言工具包（NLTK）][2]是我调研过的所有工具中功能最完善的一个。它几乎实现了自然语言处理中多数功能组件，比如分类、令牌化、词干化、标注、分词和语义推理。每一个都有多种不同的实现方式，所以你可以选择具体的算法和方式。同时，它也支持不同的语言。然而，它以字符串的形式表示所有的数据，对于一些简单的数据结构来说可能很方便，但是如果要使用一些高级的功能来说就可能有点困难。它的使用文档有点复杂，但也有很多其他人编写的使用文档，比如[这本很棒的书][3]。和其他的工具比起来，这个工具库的运行速度有点慢。但总的来说，这个工具包非常不错，可以用于需要具体算法组合的实验、探索和实际应用当中。

#### SpaCy

[SpaCy][4] 可能是 NLTK 的主要竞争者。在大多数情况下都比 NLTK 的速度更快，但是 SpaCy 的每个自然语言处理的功能组件只有一个实现。SpaCy 把所有的东西都表示为一个对象而不是字符串，从而简化了应用构建接口。这也方便它与多种框架和数据科学工具的集成，使得你更容易理解你的文本数据。然而，SpaCy 不像 NLTK 那样支持多种语言。它确实接口简单，具有简化的选项集和完备的文档，以及用于语言处理和分析各种组件的多种神经网络模型。总的来说，对于需要在生产中表现出色且不需要特定算法的新应用程序，这是一个很不错的工具。

#### TextBlob

[TextBlob][5] 是 NLTK 的一个扩展库。你可以通过 TextBlob 用一种更简单的方式来使用 NLTK 的功能，TextBlob 也包括了 Pattern 库中的功能。如果你刚刚开始学习，这将会是一个不错的工具，可以用于对性能要求不太高的生产环境的应用。总体来说，TextBlob 适用于任何场景，但是对小型项目尤佳。

#### Textacy

这个工具是我用过的名字最好听的。先重读“ex”再带出“cy”，多读“[Textacy][6]”几次试试。它不仅仅是名字读起来好，同时它本身也是一个很不错的工具。它使用 SpaCy 作为它自然语言处理核心功能，但它在处理过程的前后做了很多工作。如果你想要使用 SpaCy，那么最好使用 Textacy，从而不用去编写额外的附加代码就可以处理不同种类的数据。

#### PyTorch-NLP

[PyTorch-NLP][7] 才出现短短的一年，但它已经有一个庞大的社区了。它适用于快速原型开发。当出现了最新的研究，或大公司或者研究人员推出了完成新奇的处理任务的其他工具时，比如图像转换，它就会被更新。总体来说，PyTorch 的目标用户是研究人员，但它也能用于原型开发，或使用最先进算法的初始生产载荷中。基于此基础上的创建的库也是值得研究的。

### Node.js 工具

#### Retext

[Retext][8] 是 [Unified 集合][9]的一部分。Unified 是一个接口，能够集成不同的工具和插件以便它们能够高效的工作。Retext 是 Unified 工具中使用的三种语法之一，另外的两个分别是用于 Markdown 的 Remark 和用于 HTML 的 Rehype。这是一个非常有趣的想法，我很高兴看到这个社区的发展。Retext 没有涉及很多的底层技术，更多的是使用插件去完成你在 NLP 任务中想要做的事情。拼写检查、字形修复、情绪检测和增强可读性都可以用简单的插件来完成。总体来说，如果你不想了解底层处理技术又想完成你的任务的话，这个工具和社区是一个不错的选择。

#### Compromise

[Compromise][10] 显然不是最复杂的工具，如果你正在找拥有最先进的算法和最完备的系统的话，它可能不适合你。然而，如果你想要一个性能好、功能广泛、还能在客户端运行的工具的话，Compromise 值得一试。总体来说，它的名字（“折中”）是准确的，因为作者更关注更具体功能的小软件包，而在功能性和准确性上有所折中，这些小软件包得益于用户对使用环境的理解。

#### Natural

[Natural][11] 包含了常规自然语言处理库所具有的大多数功能。它主要是处理英文文本，但也包括一些其它语言，它的社区也欢迎支持其它的语言。它能够进行令牌化、词干化、分类、语音处理、词频-逆文档频率计算（TF-IDF）、WordNet、字符相似度计算和一些变换。它和 NLTK 有的一比，因为它想要把所有东西都包含在一个包里头，但它更易于使用，而且不一定专注于研究。总的来说，这是一个非常完整的库，目前仍在活跃开发中，但可能需要对底层实现有更多的了解才能完全发挥效力。

#### Nlp.js

[Nlp.js][12] 建立在其他几个 NLP 库之上，包括 Franc 和 Brain.js。它为许多 NLP 组件提供了一个很好的接口，比如分类、情感分析、词干化、命名实体识别和自然语言生成。它也支持一些其它语言，在你处理英语之外的语言时能提供一些帮助。总之，它是一个不错的通用工具，并且提供了调用其他工具的简化接口。在你需要更强大或更灵活的工具之前，这个工具可能会在你的应用程序中用上很长一段时间。

### Java 工具

#### OpenNLP

[OpenNLP][13] 是由 Apache 基金会管理的，所以它可以很方便地集成到其他 Apache 项目中，比如 Apache Flink、Apache NiFi 和 Apache Spark。这是一个通用的 NLP 工具，包含了所有 NLP 组件中的通用功能，可以通过命令行或者以包的形式导入到应用中来使用它。它也支持很多种语言。OpenNLP 是一个很高效的工具，包含了很多特性，如果你用 Java 开发生产环境产品的话，它是个很好的选择。

#### Stanford CoreNLP

[Stanford CoreNLP][14] 是一个工具集，提供了统计 NLP、深度学习 NLP 和基于规则的 NLP 功能。这个工具也有许多其他编程语言的版本，所以可以脱离 Java 来使用。它是由高水平的研究机构创建的一个高效的工具，但在生产环境中可能不是最好的。此工具采用双许可证，具有可以用于商业目的的特定许可证。总之，在研究和实验中它是一个很棒的工具，但在生产系统中可能会带来一些额外的成本。比起 Java 版本来说，读者可能对它的 Python 版本更感兴趣。同样，在 Coursera 上最好的机器学习课程之一是斯坦福教授提供的，[点此][15]访问其他不错的资源。

#### CogCompNLP

[CogCompNLP][16] 由伊利诺斯大学开发的一个工具，它也有一个相似功能的 Python 版本。它可以用于处理文本，包括本地处理和远程处理，能够极大地缓解你本地设备的压力。它提供了很多处理功能，比如令牌化、词性标注、断句、命名实体标注、词型还原、依存分析和语义角色标注。它是一个很好的研究工具，你可以自己探索它的不同功能。我不确定它是否适合生产环境，但如果你使用 Java 的话，它值得一试。

* * *

你最喜欢的开源 NLP 工具和库是什么？请在评论区分享文中没有提到的工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/natural-language-processing-tools

作者：[Dan Barker][a]
选题：[lujun9972][b]
译者：[zxp](https://github.com/zhangxiangping)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/barkerd427
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_communication_team.png?itok=CYfZ_gE7 (Chat bubbles)
[2]: http://www.nltk.org/
[3]: http://www.nltk.org/book_1ed/
[4]: https://spacy.io/
[5]: https://textblob.readthedocs.io/en/dev/
[6]: https://readthedocs.org/projects/textacy/
[7]: https://pytorchnlp.readthedocs.io/en/latest/
[8]: https://www.npmjs.com/package/retext
[9]: https://unified.js.org/
[10]: https://www.npmjs.com/package/compromise
[11]: https://www.npmjs.com/package/natural
[12]: https://www.npmjs.com/package/node-nlp
[13]: https://opennlp.apache.org/
[14]: https://stanfordnlp.github.io/CoreNLP/
[15]: https://opensource.com/article/19/2/learn-data-science-ai
[16]: https://github.com/CogComp/cogcomp-nlp
