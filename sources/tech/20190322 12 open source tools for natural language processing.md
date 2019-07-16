[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (12 open source tools for natural language processing)
[#]: via: (https://opensource.com/article/19/3/natural-language-processing-tools)
[#]: author: (Dan Barker  https://opensource.com/users/barkerd427)

12 open source tools for natural language processing
======

Take a look at a dozen options for your next NLP application.

![Chat bubbles][1]

Natural language processing (NLP), the technology that powers all the chatbots, voice assistants, predictive text, and other speech/text applications that permeate our lives, has evolved significantly in the last few years. There are a wide variety of open source NLP tools out there, so I decided to survey the landscape to help you plan your next voice- or text-based application.

For this review, I focused on tools that use languages I'm familiar with, even though I'm not familiar with all the tools. (I didn't find a great selection of tools in the languages I'm not familiar with anyway.) That said, I excluded tools in three languages I am familiar with, for various reasons.

The most obvious language I didn't include might be R, but most of the libraries I found hadn't been updated in over a year. That doesn't always mean they aren't being maintained well, but I think they should be getting updates more often to compete with other tools in the same space. I also chose languages and tools that are most likely to be used in production scenarios (rather than academia and research), and I have mostly used R as a research and discovery tool.

I was also surprised to see that the Scala libraries are fairly stagnant. It has been a couple of years since I last used Scala, when it was pretty popular. Most of the libraries haven't been updated since that time—or they've only had a few updates.

Finally, I excluded C++. This is mostly because it's been many years since I last wrote in C++, and the organizations I've worked in have not used C++ for NLP or any data science work.

### Python tools

#### Natural Language Toolkit (NLTK)

It would be easy to argue that [Natural Language Toolkit (NLTK)][2] is the most full-featured tool of the ones I surveyed. It implements pretty much any component of NLP you would need, like classification, tokenization, stemming, tagging, parsing, and semantic reasoning. And there's often more than one implementation for each, so you can choose the exact algorithm or methodology you'd like to use. It also supports many languages. However, it represents all data in the form of strings, which is fine for simple constructs but makes it hard to use some advanced functionality. The documentation is also quite dense, but there is a lot of it, as well as [a great book][3]. The library is also a bit slow compared to other tools. Overall, this is a great toolkit for experimentation, exploration, and applications that need a particular combination of algorithms.

#### SpaCy

[SpaCy][4] is probably the main competitor to NLTK. It is faster in most cases, but it only has a single implementation for each NLP component. Also, it represents everything as an object rather than a string, which simplifies the interface for building applications. This also helps it integrate with many other frameworks and data science tools, so you can do more once you have a better understanding of your text data. However, SpaCy doesn't support as many languages as NLTK. It does have a simple interface with a simplified set of choices and great documentation, as well as multiple neural models for various components of language processing and analysis. Overall, this is a great tool for new applications that need to be performant in production and don't require a specific algorithm.

#### TextBlob

[TextBlob][5] is kind of an extension of NLTK. You can access many of NLTK's functions in a simplified manner through TextBlob, and TextBlob also includes functionality from the Pattern library. If you're just starting out, this might be a good tool to use while learning, and it can be used in production for applications that don't need to be overly performant. Overall, TextBlob is used all over the place and is great for smaller projects.

#### Textacy

This tool may have the best name of any library I've ever used. Say "[Textacy][6]" a few times while emphasizing the "ex" and drawing out the "cy." Not only is it great to say, but it's also a great tool. It uses SpaCy for its core NLP functionality, but it handles a lot of the work before and after the processing. If you were planning to use SpaCy, you might as well use Textacy so you can easily bring in many types of data without having to write extra helper code.

#### PyTorch-NLP

[PyTorch-NLP][7] has been out for just a little over a year, but it has already gained a tremendous community. It is a great tool for rapid prototyping. It's also updated often with the latest research, and top companies and researchers have released many other tools to do all sorts of amazing processing, like image transformations. Overall, PyTorch is targeted at researchers, but it can also be used for prototypes and initial production workloads with the most advanced algorithms available. The libraries being created on top of it might also be worth looking into.

### Node tools

#### Retext

[Retext][8] is part of the [unified collective][9]. Unified is an interface that allows multiple tools and plugins to integrate and work together effectively. Retext is one of three syntaxes used by the unified tool; the others are Remark for markdown and Rehype for HTML. This is a very interesting idea, and I'm excited to see this community grow. Retext doesn't expose a lot of its underlying techniques, but instead uses plugins to achieve the results you might be aiming for with NLP. It's easy to do things like checking spelling, fixing typography, detecting sentiment, or making sure text is readable with simple plugins. Overall, this is an excellent tool and community if you just need to get something done without having to understand everything in the underlying process.

#### Compromise

[Compromise][10] certainly isn't the most sophisticated tool. If you're looking for the most advanced algorithms or the most complete system, this probably isn't the right tool for you. However, if you want a performant tool that has a wide breadth of features and can function on the client side, you should take a look at Compromise. Overall, its name is accurate in that the creators compromised on functionality and accuracy by focusing on a small package with much more specific functionality that benefits from the user understanding more of the context surrounding the usage.

#### Natural

[Natural][11] includes most functions you might expect in a general NLP library. It is mostly focused on English, but some other languages have been contributed, and the community is open to additional contributions. It supports tokenizing, stemming, classification, phonetics, term frequency–inverse document frequency, WordNet, string similarity, and some inflections. It might be most comparable to NLTK, in that it tries to include everything in one package, but it is easier to use and isn't necessarily focused around research. Overall, this is a pretty full library, but it is still in active development and may require additional knowledge of underlying implementations to be fully effective.

#### Nlp.js

[Nlp.js][12] is built on top of several other NLP libraries, including Franc and Brain.js. It provides a nice interface into many components of NLP, like classification, sentiment analysis, stemming, named entity recognition, and natural language generation. It also supports quite a few languages, which is helpful if you plan to work in something other than English. Overall, this is a great general tool with a simplified interface into several other great tools. This will likely take you a long way in your applications before you need something more powerful or more flexible.

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
译者：[译者ID](https://github.com/译者ID)
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
