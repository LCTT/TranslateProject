
排名前 15 的开源人工智能工具
====

人工智能（artificial intelligence, AI）是科技研究中最热门的方向之一。像 IBM、谷歌、微软、Facebook 和 亚马逊等公司都在研发上投入大量的资金、或者收购那些在机器学习、神经网络、自然语言和图像处理等领域取得了进展的初创公司。考虑到人们对此感兴趣的程度，我们将不会惊讶于斯坦福的专家在[人工智能报告][1]中得出的结论：“越来越强大的人工智能应用，可能会对我们的社会和经济产生深远的积极影响，这将出现在从现在到2030年的时间段里。”

在最近的一篇[文章][2]中，我们概述了45个十分有趣或有前途的人工智能项目。在本文中，我们将聚焦于开源的人工智能工具，详细的了解下最著名的15个开源人工智能项目。

![](http://www.datamation.com/imagesvr_ce/5668/00AI.jpg)

开源人工智能

以下这些开源人工智能应用都处于人工智能研究的最前沿。

![](http://www.datamation.com/imagesvr_ce/8922/01Caffe.JPG)

### 1. Caffe

它是由[贾扬清][3]在加州大学伯克利分校的读博时创造的，Caffe 是一个基于表达体系结构和可扩展代码的深度学习框架。使它声名鹊起的是它的速度，这让它受到研究人员和企业用户的欢迎。根据其网站所言，它可以在一天之内处理 6000 万多个图像而只用一个 NVIDIA K40 GPU。它是由伯克利视野和学习中心（BVLC）管理的，并且由 NVIDIA 和亚马逊等公司资助来支持它的发展。

![](http://www.datamation.com/imagesvr_ce/1232/02CNTK.JPG)

### 2. CNTK

计算网络工具包（Computational Network Toolkit）的缩写，CNIK 是一个微软的开源人工智能工具。不论是在单个 CPU、单个 GPU、多个 GPU 或是拥有多个 GPUs 的多台机器上它都有优异的表现。微软主要用它做语音识别的研究，但是它在机器翻译、图像识别、图像字幕、文本处理、语言理解和语言建模方面都有着良好的应用。

![](http://www.datamation.com/imagesvr_ce/2901/03Deeplearning4j.JPG)

### 3. Deeplearning4j

Deeplearning4j 是一个 java 虚拟机（JVM）的开源深度学习库。它运行在分布式环境并且集成在 Hadoop 和 Apache Spark 中。这使它可以配置深度神经网络，并且它与 Java、Scala 和 其他 JVM 语言兼容。

这个项目是由一个叫做 Skymind 的商业公司管理的，它为这个项目提供支持、培训和一个企业的发行版。

![](http://www.datamation.com/imagesvr_ce/7269/04DMLT.JPG)

### 4. Distributed Machine Learning Toolkit（分布式机器学习工具）

和 CNTK 一样，分布式机器学习工具（Distributed Machine Learning Toolkit, DMTK）是微软的开源人工智能工具。作为设计用于大数据的应用程序，它的目标是更快的训练人工智能系统。它包括三个主要组件：DMTK 框架、LightLDA 主题模型算法和分布式(多义)字嵌入算法。为了证明它的速度，微软声称在一个 8 集群的机器上，他能够 “用 100 万个主题和 1000 万个单词的词汇表（总共 10 万亿参数）训练一个主题模型，在一个文档中收集 1000 亿个符号，”。这一成绩是别的工具无法比拟的。

![](http://www.datamation.com/imagesvr_ce/2890/05H2O.JPG)

### 5. H20

相比起科研，H2O 更注重将 AI 服务于企业用户，因此 H2O 有着大量的公司客户，比如第一资本金融公司、思科、Nielsen Catalina、PayPal 和泛美都是他的用户。它声称任何人都可以利用机器学习和预测分析的力量来解决业务难题。它可以用于预测建模、风险和欺诈分析、保险分析、广告技术、医疗保健和客户情报。

它有两种开源版本：标准版 H2O 和 Sparking Water 版，他被集成在 Apache Spark 中。也有付费的企业用户支持。

![](http://www.datamation.com/imagesvr_ce/1127/06Mahout.JPG)

### 6. Mahout

它是 Apache 基金项目，是一个开源机器学习框架。根据它的网站所言，它有着三个主要的特性：一个构建可扩展算法的编程环境、像 Spark 和 H2O 一样的预制算法工具和一个叫 Samsara 的矢量数学实验环境。使用 Mahout 的公司有 Adobe、埃森哲咨询公司、Foursquare、英特尔、领英、Twitter、雅虎和其他许多公司。其网站列了出第三方的专业支持。

![](http://www.datamation.com/imagesvr_ce/4038/07MLlib.JPG)

### 7. MLlib

由于其速度，Apache Spark 成为一个最流行的大数据处理工具。MLlib 是 Spark 的可扩展机器学习库。它集成了 Hadoop 并可以与 NumPy 和 R 进行交互操作。它包括了许多机器学习算法如分类、回归、决策树、推荐、集群、主题建模、功能转换、模型评价、ML管道架构、ML持续、生存分析、频繁项集和序列模式挖掘、分布式线性代数和统计。

![](http://www.datamation.com/imagesvr_ce/839/08NuPIC.JPG)

### 8. NuPIC

由 Numenta 公司管理的 NuPIC 是一个基于分层暂时记忆（Hierarchical Temporal Memory, HTM）理论的开源人工智能项目。从本质上讲，HTM 试图创建一个计算机系统来模仿人类大脑皮层。他们的目标是创造一个 “在许多认知任务上接近或者超越人类认知能力” 的机器。

除了开源许可，Numenta 还提供 NuPic 的商业许可协议，并且它还提供技术专利的许可证。

![](http://www.datamation.com/imagesvr_ce/99/09OpenNN.JPG)

### 9. OpenNN

作为一个为开发者和科研人员设计的具有高级理解力的人工智能，OpenNN 是一个实现神经网络算法的 c++ 编程库。它的关键特性包括深度的架构和快速的性能。其网站上可以查到丰富的文档，包括一个解释了神经网络的基本知识的入门教程。OpenNN 的付费支持由一家从事预测分析的西班牙公司 Artelnics 提供。

![](http://www.datamation.com/imagesvr_ce/4168/10OpenCyc.JPG)

### 10. OpenCyc

由 Cycorp 公司开发的 OpenCyc 提供了对 Cyc 知识库的访问和常识推理引擎。它拥有超过 239,000 个条目，大约 2,093,000 个三元组和大约 69,000 owl：一种类似于链接到外部语义库的命名空间。它在富领域模型、语义数据集成、文本理解、特殊领域的专家系统和游戏 AI 中有着良好的应用。该公司还提供另外两个版本的 Cyc：一个免费的用于科研但是不开源和一个提供给企业的但是需要付费。

![](http://www.datamation.com/imagesvr_ce/9761/11Oryx2.JPG)

### 11. Oryx 2

构建在 Apache Spark 和 Kafka 之上的 Oryx 2 是一个专门针对大规模机器学习的应用程序开发框架。它采用一个独特的三层 λ 架构。开发者可以使用 Orys 2 创建新的应用程序，另外它还拥有一些预先构建的应用程序可以用于常见的大数据任务比如协同过滤、分类、回归和聚类。大数据工具供应商 Cloudera 创造了最初的 Oryx 1 项目并且一直积极参与持续发展。

![](http://www.datamation.com/imagesvr_ce/7423/12.%20PredictionIO.JPG)

### 12. PredictionIO

今年的二月， Salesforce 买下 PredictionIO，接着在七月，他将该平台和商标贡献给 Apache 基金会，Apache 基金会将其列为孵育计划。所以当 Salesforce 利用 PredictionIO 技术来发展他的机器学习性能，工作将会同步出现在开源版本中。它可以帮助用户创建有机器学习功能的预测引擎，这可用于部署能够实时动态查询的Web服务。

![](http://www.datamation.com/imagesvr_ce/6886/13SystemML.JPG)

### 13. SystemML

首先由 IBM 开发 SystemML 现在是一个 Apache 大数据项目。它提供了一个高度可伸缩的平台，可以实现高等数学运算，并且他的算法用 R 或类似 python 的语法写成。企业已经在使用它来跟踪汽车维修客户服务、规划机场交通和连接社会媒体数据与银行客户。他可以在 Spark 或 Hadoop 上运行。

![](http://www.datamation.com/imagesvr_ce/5742/14TensorFlow.JPG)

### 14. TensorFlow

TensorFlow 是一个谷歌的开源人工智能工具。它提供了一个使用数据流图进行数值计算的库。它可以运行在多种不同的有着单或多 CPUs 和 GPUs 的系统，甚至可以在移动设备上运行。它拥有深厚的灵活性、真正的可移植性、自动微分功能并且支持 Python 和 c++。它的网站拥有十分详细的教程列表来帮助开发者和研究人员沉浸于使用或扩展他的功能。

![](http://www.datamation.com/imagesvr_ce/9018/15Torch.JPG)

### 15. Torch

Torch 将自己描述为：“一个优先使用 GPUs 的拥有机器学习算法广泛支持的科学计算框架”，他的特点是灵活性和速度。此外，它可以很容易的运用机器学习、计算机视觉、信号处理、并行处理、图像、视频、音频和网络的包。他依赖一个叫做 LuaJIT 的脚本语言，而 LuaJIT 是基于 Lua 的。



--------------------------------------------------------------------------------

via: http://www.datamation.com/open-source/slideshows/15-top-open-source-artificial-intelligence-tools.html

作者：[Cynthia Harvey][a]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.datamation.com/author/Cynthia-Harvey-6460.html
[1]: https://ai100.stanford.edu/sites/default/files/ai_100_report_0906fnlc_single.pdf
[2]: http://www.datamation.com/applications/artificial-intelligence-software-45-ai-projects-to-watch-1.html
[3]: http://daggerfs.com/
