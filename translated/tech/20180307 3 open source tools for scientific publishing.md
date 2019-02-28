3款用于学术发表的开源工具
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_science.png?itok=WDKARWGV)
有一个行业在采用数字或者开源工具方面已落后其它行业，那就是竞争与利润并存的学术出版业。根据 Stephen Buranyi 去年在 [The Guardian][1] 发表的一份图表，这个估值超过190亿英镑（260亿美元）的行业至今在其选择、发表甚至分享最重要的科学研究的系统方面，仍受限于印刷媒介的诸多限制。全新的数字时代科技展现了一个能够加速探索、推动科学合作性而不是竞争性以及将投入重新从基础建设导向有益社会的研究的巨大的机遇。

非盈利性的 [eLife 倡议][2] 是由研究的资金赞助方建立，旨在通过使用数字或者开源技术来走出上述僵局。除了为生活中科学和生物医疗方面的重大成就出版开放式获取的杂志，eLife 已将自己变成了一个在研究交流方面的创新实验窗口——而大部分的实验都是基于开源精神的。

参与开源出版项目给予我们加速接触、采用科学技术，提升用户体验的机会。我们认为这种机会对于推动学术出版行业是重要的。大而化之地说，开源产品的用户体验经常是有待开发的，而有时候这种情况会阻止其他人去使用它。作为我们在 OSS 开发中投入的一部分，为了鼓励更多用户使用这些产品，我们十分注重用户体验。

我们所有的代码都是开源的并且我们也积极鼓励开源社区参与进我们的项目中。这对我们来说意味着更快的迭代、更多的实验、更大的透明度，同时也拓宽了我们工作的外延。

我们现在参与的项目，例如 Libero （之前称作 [eLife Continuum][3]）和 [可复制文档栈][4] 的开发以及我们最近和 [Hypothesis][5] 的合作，展示了 OSS 是如何在校队、发表以及新发现的沟通方面带来正面影响的。

### Libero

Libero 是面向发布者的服务及应用套餐，它包括一个后生产出版系统、整套前端用户界面、Libero 的棱镜阅读器、一个开放式的API以及一个搜索推荐引擎。

去年我们采取了用户导向的途径重新设计了 Libero 的前端，做出了一个使用户较少地分心并更多地集中注意在研究文章上的站点。我们和 eLife 社区成员测试并迭代了站点所有的核心功能以确保给所有人最好的阅读体验。网站的新 API 也给可供机器阅读的内容提供了更简单的访问途径，其中包括文字挖掘、机器学习以及在线应用开发。我们网站上的内容以及引领新设计的样式都是开源的，以鼓励 eLife 和其它想要使用它的发布者后续的开发。

### 可复制文档栈

在与 [Substance][6] 和 [Stencila][7] 的合作下，eLife 也参与了一个项目来创建可复制的文档栈（RDS）——一个开放式的创作、编纂以及在线出版可复制的计算型手稿的工具栈。

今天越来越多的研究员能够通过 [R、Markdown][8] 和 [Python][9] 等语言记录他们的计算型实验。这些可以作为实验记录的重要部分，但是尽管它们可以通过最终的研究文章独立地分享，传统出版流程经常将它们视为次级内容。为了发表论文，使用这些语言的研究员除了将他们的计算结果用图片的形式“扁平化”提交外别无他法。但是这导致了许多实验价值和代码和计算数据可重复利用性的流失。诸如 [Jupyter][10] 的电子笔记本解决方案确实可以使研究员以一种可重复利用、可执行的简单形式发布，但是这种方案仍然独立于整个手稿发布过程之外，而不是集成在其中。

[可复制文档栈][11] 项目着眼于通过开发、发布一个能够把代码和数据集成在文档自身的产品雏形来突出这些挑战并阐述一个端对端的从创作到出版的完整科技。它将最终允许用户以一种包含嵌入代码块和计算结果（统计结果、图表或图片）的形式提交他们的手稿并在出版过程中保留这些可视、可执行的部分。那时发布者就可以将这些作为发布的在线文章的整体所保存。

### 用 Hypothesis 进行开放式注解

最近，我们与 [Hypothesis][12] 合作引进了开放式注解，使得我们网站的用户们可以写评语、高亮文章重要部分以及与在线阅读的群体互动。

通过这样的合作，开源的 Hypothesis 软件被定制得更具有现代化的特性如单次登录验证、用户界面定制选项，给予了发布者在他们自己网站上更多的控制。这些提升正引导着关于发表的学术内容高质量的讨论。

这个工具可以无缝集成进发布者的网站，学术发表平台 [PubFactory][13] 和内容解决方案供应商 [Ingenta][14] 已经利用了它优化后的特性集。[HighWire][15] 和 [Silverchair][16] 也为他们的发布者提供了实施这套方案的机会。

 ### 其它产业和开源软件

过段时间，我们希望看到更多的发布者采用 Hypothesis、Libero 以及其它开源软件去帮助他们促进重要科学研究的发现以及循环利用。但是 eLife 所能利用的因这些软件和其它 OSS 科技带来的创新机会在其他产业也很普遍。

数据科学的世界离不开高质量、强支持的开源软件和围绕它们形成的社区；[TensorFlow][17] 就是这样一个好例子。感谢 OSS 以及其社区，AI 的所有领域和机器学习相比于计算机的其它领域有了迅速的提升和发展。与之类似的是 Linux 云端网页主机、Docker 容器、Github上最流行的开源项目之一的 Kubernetes 使用的爆炸性增长。

所有的这些科技使得不同团体能够四两拨千斤并集中在创新而不是造轮子上。最后，那才是 OSS 真正的好处：它使得我们从互相的失败中学习，在互相的成功中成长。

我们总是在寻找与研究和科技界面方面最好的人才和想法交流的机会。你可以在 [eLife Labs][18] 上或者联系 [innovation@elifesciences.org][19] 找到更多这种交流的信息。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/scientific-publishing-software

作者：[Paul Shanno][a]
译者：[tomjlw](https://github.com/tomjlw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pshannon
[1]:https://www.theguardian.com/science/2017/jun/27/profitable-business-scientific-publishing-bad-for-science
[2]:https://elifesciences.org/about
[3]:https://elifesciences.org/inside-elife/33e4127f/elife-introduces-continuum-a-new-open-source-tool-for-publishing
[4]:https://elifesciences.org/for-the-press/e6038800/elife-supports-development-of-open-technology-stack-for-publishing-reproducible-manuscripts-online
[5]:https://elifesciences.org/for-the-press/81d42f7d/elife-enhances-open-annotation-with-hypothesis-to-promote-scientific-discussion-online
[6]:https://github.com/substance
[7]:https://github.com/stencila/stencila
[8]:https://rmarkdown.rstudio.com/
[9]:https://www.python.org/
[10]:http://jupyter.org/
[11]:https://elifesciences.org/labs/7dbeb390/reproducible-document-stack-supporting-the-next-generation-research-article
[12]:https://github.com/hypothesis
[13]:http://www.pubfactory.com/
[14]:http://www.ingenta.com/
[15]:https://github.com/highwire
[16]:https://www.silverchair.com/community/silverchair-universe/hypothesis/
[17]:https://www.tensorflow.org/
[18]:https://elifesciences.org/labs
[19]:mailto:innovation@elifesciences.org
