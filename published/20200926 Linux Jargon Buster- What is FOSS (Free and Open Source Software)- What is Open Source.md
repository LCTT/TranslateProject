[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12748-1.html)
[#]: subject: (Linux Jargon Buster: What is FOSS \(Free and Open Source Software\)? What is Open Source?)
[#]: via: (https://itsfoss.com/what-is-foss/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux 黑话解释：什么是 FOSS（自由和开源软件）？什么是开源？
======

![][7]

什么是 FOSS？

在过去，我曾多次被问到这个问题，现在是时候解释一下什么是 Linux 和软件世界中的 FOSS 了。

这个区别很重要，因为 FOSS 是一个通用的词汇，它可以根据上下文的不同而有不同的含义。在这里，我讨论的是软件中的 FOSS 原则。

### 什么是 FOSS？

FOSS 是指<ruby>自由和开放源码软件<rt>Free and Open Source Software</rt></ruby>。这并不意味着软件是免费的。它意味着软件的源代码是开放的，任何人都可以自由使用、研究和修改代码。这个原则允许人们像一个社区一样为软件的开发和改进做出贡献。

#### FOSS 的起源

在上世纪 60、70 年代，计算机以硬件为主，硬件价格昂贵。它们主要由大学的学者或实验室的研究人员使用。以前有限的软件都是免费的，或者是带有它们的源代码，用户可以根据自己的需要修改源代码。

在上世纪 70 年代末和 80 年代初，制造商为了不让自己的软件在竞争对手的计算机上运行，停止了分发源代码。

这种限制性的许可导致了那些习惯和喜欢修改软件的人的不便和不喜。上世纪 80 年代中期，Richard Stallman 发起了<ruby>自由软件运动<rt>Free Software Movement</rt></ruby>。

[Stallman 指明了一个软件要成为 FOSS 的四个基本自由][1]。

![自由软件自由][2]

为了便于理解，我将它们重新表述：

  * 任何用户应能为任何目的运行软件。
  * 用户应能自由查看软件的源代码，如有需要，应允许用户修改代码。
  * 用户应能自由地将软件的副本分发给他人。
  * 如果用户修改了代码，她/他应该可以自由地将修改后的代码发布给他人。修改后的代码必须开放源代码。

如果有兴趣，我建议阅读这篇关于 [FOSS 的历史][3]的文章。

### FOSS 中的 “Free” 并不意味着免费

![][4]

你可能已经注意到了，自由和开源软件中的 “Free” 并不意味着它是免费的，它意味着运行、修改和分发软件的“自由”。

人们经常错误地认为，FOSS 或开源软件不能有价格标签。这是不正确的。

大多数 FOSS 都是免费提供的，原因有很多：

  * 源代码已经向公众开放，所以一些开发者认为没有必要在下载软件时贴上价格标签。
  * 有些项目是由一些志愿者免费提供的。因此，主要的开发者认为对这么多人免费贡献的东西收费是不道德的。
  * 有些项目是由较大的企业或非营利组织支持和/或开发的，这些组织会雇佣开发人员在他们的开源项目上工作。
  * 有些开发者创建开源项目是出于兴趣，或者出于他们对用代码为世界做贡献的热情。对他们来说，下载量、贡献和感谢的话比金钱更重要。

为了避免强调 “免费”，有些人使用了 FLOSS 这个词（LCTT 译注：有时候也写作 F/LOSS）。FLOSS 是<ruby>自由和开源软件<rt>Free/Libre Open Source Software</rt></ruby>的缩写。单词 Libre（意为自由）与 gartuit/gratis（免费）不同。

> “Free” 是言论自由的自由，而不是免费啤酒的免费。

### FOSS 项目如何赚钱？

开源项目不赚钱是一个神话。红帽是第一个达到 10 亿美元大关的开源公司。[IBM 以 340 亿美元收购了红帽][5]。这样的例子有很多。

许多开源项目，特别是企业领域的项目，都会提供收费的支持和面向企业的功能。这是红帽、SUSE Linux 和更多此类项目的主要商业模式。

一些开源项目，如 Discourse、WordPress 等，则提供其软件的托管实例，并收取一定的费用。

许多开源项目，特别是桌面应用程序，依靠捐赠。VLC、GIMP、Inkscape 等这类开源软件就属于这一类。有[资助开源项目的方法][6]，但通常，你会在项目网站上找到捐赠链接。

利用开源软件赚钱可能很难，但也不是完全不可能。

### 但我不是程序员，我为什么要关心一个软件是否开源？

这是一个合理的问题。你不是一个软件开发者，只是一个普通的计算机用户。即使软件的源代码是可用的，你也不会理解程序的工作原理。

这很好。你不会明白，但有必要技能的人就会明白，这才是最重要的。

你可以这样想。也许你不会理解一份复杂的法律文件。但如果你有看文件的自由，并保留一份副本，你就可以咨询某个人，他可以检查文件中的法律陷阱。

换句话说，开源软件具有透明度。

### FOSS 与开源之间的区别是什么？

你会经常遇到 FOSS 和<ruby>开源<rt>Open Source</rt></ruby>的术语。它们经常被互换使用。

它们是同一件事吗？这很难用“是”和“不是”来回答。

你看，FOSS 中的“Free”一词让很多人感到困惑，因为人们错误地认为它是免费的。企业高管、高层和决策者往往会关注自由和开源中的“免费”。由于他们是商业人士，专注于为他们的公司赚钱，“自由”一词在采用 FOSS 原则时起到了威慑作用。

这就是为什么在上世纪 90 年代中期创立了一个名为<ruby>[开源促进会][8]<rt>Open Source Initiative</rt></ruby>的新组织。他们从自由和开放源码软件中去掉了“自由”一词，并创建了自己的[开放源码的定义][9]，以及自己的一套许可证。

“<ruby>开源<rt>Open Source</rt></ruby>”一词在软件行业特别流行。高管们对开源更加适应。开源软件的采用迅速增长，我相信 “免费”一词的删除确实起到了作用。

### 有问题吗？

这正如我在[什么是 Linux 发行版][10]一文中所解释的那样，FOSS/开源的概念在 Linux 的发展和普及中起到了很大的作用。

我试图在这篇黑话解释文章中用更简单的语言解释 FOSS 和开源的概念，而试图避免在细节或技术精度上做过多的阐述。

我希望你现在对这个话题有了更好的理解。如果你有问题或建议，欢迎留言并继续讨论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/what-is-foss/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/philosophy/free-sw.html
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/foss-freedoms.jpg?resize=800%2C671&ssl=1
[3]: https://itsfoss.com/history-of-foss/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/think-free-speech-not-free-beer.jpg?resize=800%2C800&ssl=1
[5]: https://itsfoss.com/ibm-red-hat-acquisition/
[6]: https://itsfoss.com/open-source-funding-platforms/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/what-is-foss.png?resize=800%2C450&ssl=1
[8]: https://opensource.org/
[9]: https://opensource.org/osd
[10]: https://itsfoss.com/what-is-linux-distribution/
