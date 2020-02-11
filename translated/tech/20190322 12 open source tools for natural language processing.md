[#]: collector: (lujun9972)
[#]: translator: (zxp)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (12 open source tools for natural language processing)
[#]: via: (https://opensource.com/article/19/3/natural-language-processing-tools)
[#]: author: (Dan Barker  https://opensource.com/users/barkerd427)

12种自然语言处理的开源工具
======

看看可以用在你自己NLP应用中的十几个工具吧。

![Chat bubbles][1]

Natural language processing (NLP), the technology that powers all the chatbots, voice assistants, predictive text, and other speech/text applications that permeate our lives, has evolved significantly in the last few years. There are a wide variety of open source NLP tools out there, so I decided to survey the landscape to help you plan your next voice- or text-based application.

For this review, I focused on tools that use languages I'm familiar with, even though I'm not familiar with all the tools. (I didn't find a great selection of tools in the languages I'm not familiar with anyway.) That said, I excluded tools in three languages I am familiar with, for various reasons.

The most obvious language I didn't include might be R, but most of the libraries I found hadn't been updated in over a year. That doesn't always mean they aren't being maintained well, but I think they should be getting updates more often to compete with other tools in the same space. I also chose languages and tools that are most likely to be used in production scenarios (rather than academia and research), and I have mostly used R as a research and discovery tool.

I was also surprised to see that the Scala libraries are fairly stagnant. It has been a couple of years since I last used Scala, when it was pretty popular. Most of the libraries haven't been updated since that time—or they've only had a few updates.

Finally, I excluded C++. This is mostly because it's been many years since I last wrote in C++, and the organizations I've worked in have not used C++ for NLP or any data science work.

### Python tools
### Python工具
#### Natural Language Toolkit (NLTK)

[Natural Language Toolkit (NLTK)][2]是我调研的所有工具中功能最完善的一个。它完美地实现了自然语言处理中多数功能组件，比如分类，令牌化，词干化，标注，分词和语义推理。每一种方法都有多种不同的实现方式，所以你可以选择具体的算法和方式去使用它。同时，它也支持不同语言。然而，它将所有的数据都表示为字符串的形式，对于一些简单的数据结构来说可能很方便，但是如果要使用一些高级的功能来说就可能有点困难。它的使用文档有点复杂，但也有很多其他人编写的使用文档，比如[a great book][3]。和其他的工具比起来，这个工具库的运行速度有点慢。但总的来说，这个工具包非常不错，可以用于需要具体算法组合的实验，探索和实际应用当中。

#### SpaCy

[SpaCy][4]是NLTK的主要竞争者。在大多数情况下都比NLTK的速度更快，但是SpaCy对自然语言处理的功能组件只有单一实现。SpaCy把所有的东西都表示为一个对象而不是字符串，这样就能够为构建应用简化接口。这也方便它能够集成多种框架和数据科学的工具，使得你更容易理解你的文本数据。然而，SpaCy不像NLTK那样支持多种语言。它对每个接口都有一些简单的选项和文档，包括用于语言处理和分析各种组件的多种神经网络模型。总的来说，如果创造一个新的应用的生产过程中不需要使用特定的算法的话，这是一个很不错的工具。

#### TextBlob

[TextBlob][5]是NLTK的一个扩展库。你可以通过TextBlob用一种更简单的方式来使用NLTK的功能，TextBlob也包括了Pattern库中的功能。如果你刚刚开始学习，这将会是一个不错的工具可以用于生产对性能要求不太高的应用。TextBlob适用于任何场景，但是对小型项目会更加合适。

#### Textacy

这个工具是我用过的名字最好听的。读"[Textacy][6]" 时先发出"ex"再发出"cy"。它不仅仅是名字好，同时它本身也是一个很不错的工具。它使用SpaCy作为它自然语言处理核心功能，但它在处理过程的前后做了很多工作。如果你想要使用SpaCy，你可以先使用Textacy，从而不用去多写额外的附加代码你就可以处理不同种类的数据。

#### PyTorch-NLP

[PyTorch-NLP][7]才出现短短的一年，但它已经有一个庞大的社区了。它适用于快速原型开发。当公司或者研究人员推出很多其他工具去完成新奇的处理任务，比如图像转换，它就会被更新。PyTorch的目标用户是研究人员，但它也能用于原型开发，或在最开始的生产任务中使用最好的算法。基于此基础上的创建的库也是值得研究的。

### Node tools

#### Retext

[Retext][8]是[unified collective][9]的一部分。Unified是一个接口，能够集成不同的工具和插件以便他们能够高效的工作。Retext是unified工具集三个中的一个，另外的两个分别是用于markdown编辑的Remark和用于HTML处理的Rehype。这是一个非常有趣的想法，我很高兴看到这个社区的发展。Retext没有暴露过多的底层技术，更多的是使用插件去完成你在NLP任务中想要做的事情。拼写检查，固定排版，情绪检测和可读性分析都可以用简单的插件来完成。如果你不想了解底层处理技术又想完成你的任务的话，这个工具和社区是一个不错的选择。

#### Compromise

如果你在找拥有最高级的功能和最复杂的系统的工具的话，[Compromise][10]不是你的选择。 然而，如果你想要一个性能好，应用广泛，还能在客户端运行的工具的话，Compromise值得一试。实际上，它的名字是准确的，因为作者更关注更具体功能的小软件包，而在功能性和准确性上做出了牺牲，这些功能得益于用户对使用环境的理解。

#### Natural

[Natural][11]包含了一般自然语言处理库所具有的大多数功能。它主要是处理英文文本，但也包括一些其他语言，它的社区也支持额外的语言。它能够进行令牌化，词干化，分类，语音处理，词频-逆文档频率计算(TF-IDF)，WordNet，字符相似度计算和一些变换。它和NLTK有的一比，因为它想要把所有东西都包含在一个包里头，使用方便但是可能不太适合专注的研究。总的来说，这是一个不错的功能齐全的库，目前仍在开发但可能需要对底层实现有更多的了解才能完更有效。

#### Nlp.js

[Nlp.js][12]是在其他几个NLP库上开发的，包括Franc和Brain.js。
 is built on top of several other NLP libraries, including Franc and Brain.js. It provides a nice interface into many components of NLP, like classification, sentiment analysis, stemming, named entity recognition, and natural language generation. It also supports quite a few languages, which is helpful if you plan to work in something other than English. Overall, this is a great general tool with a simplified interface into several other great tools. This will likely take you a long way in your applications before you need something more powerful or more flexible.

### Java tools

#### OpenNLP

[OpenNLP][13] is hosted by the Apache Foundation, so it's easy to integrate it into other Apache projects, like Apache Flink, Apache NiFi, and Apache Spark. It is a general NLP tool that covers all the common processing components of NLP, and it can be used from the command line or within an application as a library. It also has wide support for multiple languages. Overall, OpenNLP is a powerful tool with a lot of features and ready for production workloads if you're using Java.

#### StanfordNLP

[Stanford CoreNLP][14] is a set of tools that provides statistical NLP, deep learning NLP, and rule-based NLP functionality. Many other programming language bindings have been created so this tool can be used outside of Java. It is a very powerful tool created by an elite research institution, but it may not be the best thing for production workloads. This tool is dual-licensed with a special license for commercial purposes. Overall, this is a great tool for research and experimentation, but it may incur additional costs in a production system. The Python implementation might also interest many readers more than the Java version. Also, one of the best Machine Learning courses is taught by a Stanford professor on Coursera. [Check it out][15] along with other great resources.

#### CogCompNLP

[CogCompNLP][16], developed by the University of Illinois, also has a Python library with similar functionality. It can be used to process text, either locally or on remote systems, which can remove a tremendous burden from your local device. It provides processing functions such as tokenization, part-of-speech tagging, chunking, named-entity tagging, lemmatization, dependency and constituency parsing, and semantic role labeling. Overall, this is a great tool for research, and it has a lot of components that you can explore. I'm not sure it's great for production workloads, but it's worth trying if you plan to use Java.

* * *

What are your favorite open source tools and libraries for NLP? Please share in the comments—especially if there's one I didn't include.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/natural-language-processing-tools

作者：[Dan Barker (Community Moderator)][a]
选题：[lujun9972][b]
译者：[zxp](https://github.com/zhangxiangping)
校对：[校对者ID](https://github.com/校对者ID)

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
