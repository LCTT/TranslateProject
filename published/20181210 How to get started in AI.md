[#]: collector: (lujun9972)
[#]: translator: (qhwdw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10356-1.html)
[#]: subject: (How to get started in AI)
[#]: via: (https://opensource.com/article/18/12/how-get-started-ai)
[#]: author: (Gordon Haff https://opensource.com/users/ghaff)

学习人工智能如何入门
======

> 在你开始从事人工智能之前，你需要先了解人类的智能。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain-think-ai-intelligence-ccby.png?itok=C-gK01E_)

我曾经问过别人、也被别人问过关于学习人工智能（AI）最好的方式是什么？我应该去阅读什么书？我应该去看什么视频？后面我将讲到这些，但是，考虑到人工智能涉及很多领域，我把这个问题分开来讲可能更好理解。

学习人工智能很重要的一点是区别开研究方面和应用方面。Google 的 Cassie Kozyrkov 在近日于伦敦举行的 O'Reilly 人工智能会议的一个演讲中 [描述了这个区别][1]，并且这是一个很好的演讲。

人工智能研究在本质上是学术性的，在你能够获得人工智能的某些细节之前，需要大量的跨各类学科的数学知识。这部分的人工智能关注于算法和驱动人工智能发展的工具。比如，什么样的神经网络结构能够改善视觉识别的结果？我们如何使无监督学习成为更有用的方法？我们能否找到一个更好的方法，去理解深度学习流水线是如何得出答案的？

另一方面，人工智能应用更多是关于使用现有工具去获取有用的结果。开源在这里发挥了一个重要的作用，那就是免费提供了易于使用的、各种语言的软件。公有云提供商也致力于提供大量的机器学习、模型、以及数据集，这使得人工智能的入门比其它的要简单的多。

在这个问题上我想补充一点，那就是人工智能的从业者不应该将他们的工具视为神秘地输出答案的黑匣子。至少，他们应该去了解不同技术、模型、和数据采集方法的限制和潜在偏差。只是不需要去深入研究他们工具链中每个部分的理论基础。

虽然在日常工作中人工智能可能并不那么重要，但理解人工智能的大量的背景知识还是很有用的。人工智能已经超越了神经网络上深度学习的狭窄范围，目前神经网络上的强化学习和监督学习已经取得重要成就。例如，人工智能经常被视为是增强（而不是替代）人类判断和决策的一种方法。但是在机器和人类之间交换信息还有其自身的缺陷。

有了这些背景知识，下面是的一些研究领域和资源，你可能发现会很有用。

### 研究人工智能

在很多方面，用于人工智能研究的一个资源清单，可以反映出本科（甚至是研究生）的计算机科学项目都是专注于人工智能。最主要的区别是，你起草的教学大纲比起传统的大纲更关注于跨学科。

你的计算机科学和数学背景知识决定了你的起点。

如果你的计算机科学和数据背景知识很差或已经荒芜了，但你还希望能够深入了解人工智能的基本原理，那么从一些数学课程开始将会让你受益。MOOC 上像非盈利的 [edX][2] 平台和 [Coursera][3] 上都有许多可供你选择的课程（这两个平台都对认证收费，但 edX 上所有的课程，对旁听者是全免费的）。

典型的基础课程包括：

- [MIT 的微积分课程][22]，从微分开始学习
- [线性代数][23] （德克萨斯大学）
- 概率与统计，比如 MIT 的 [概率 —— 不确定性与数据科学][24]

从一个研究的角度去深入人工智能，你可能需要深入所有的这些数据领域，甚至更多。但是上面的内容应该让您在深入研究机器学习和AI之前大致了解可能是最重要的研究分支。

除了 MOOC 之外，像 [MIT OpenCourseWare][4] 这样的资源也提供了大量的数学和计算机科学课程的大纲和各种支持材料。

有了这些基础，你就可以学习更专业的人工智能课程了。吴恩达从他在斯坦福大学时教的 “AI MOOC” 就是整个在线课程领域中最早流行起来的课程之一。今天，他的 [神经网络和深度学习][5] 也是 Coursera 深度学习专业的一部分。在 edX 上也有相关的一些项目，比如，哥伦比亚大学提供的一个 [人工智能 MicroMasters][6]。

除了课程之外，也可以在网上找到各种范例和其它学习材料。这些包括：

  * [神经网络和深度学习][7]
  * MIT 出版的 Ian Goodfellow、Yoshua Bengio、Aaron Courville 的《[深度学习][8]》

### 应用人工智能

人工智能应用更关注于使用可用的工具，而不是去构建新工具。对一些底层的数学，尤其是统计学的了解仍然是非常有用的 —— 甚至可以说是必需的 —— 但对这些知识的了解程度不像研究人工智能的要求那么高。

在这里编程是核心技能。虽然可以使用不同的编程语言去做，但是一些库和工具集 —— 比如 Python 的 [PyTorch][9]，依赖于 Python，所以这是一个应该掌握的好技能。尤其是，如果你有某种程度上的编程背景，MIT 的 [计算机科学入门和使用 Python 编程][10]，它是基于 MIT 的 6.001 在校课程，是一个非常好的启蒙课程。如果你编程零基础，来自密歇根大学的 Charles Severance 的 [人人学编程（Python 使用入门）][11] 是个很好的开端，它不会像 MIT 的课程那样，把你一下子扔进代码的汪洋大海。

[R 编程语言][12] 也是一个应该增加到你的技能库中的很有用的技能。虽然它在机器学习（ML）中使用的很少，但它在其它数据科学任务中很常见，并且经常与人工智能/机器学习和数据科学的应用实践结合在一起。例如，与组织和清理数据相关的许多任务同样适用于您最终使用的任何分析技术。像哈佛的 [数据科学认证][13] 这样的一个 MOOC 系列就是一整套课程的一个例子，这些课程介绍了如何去很好地处理数据。

如果你从事人工智能方面的工作，那么你很可能会遇到的另一个开源软件库就是 [TensorFlow][14]。它最初是由 Google 人工智能团队中的 Google 大脑团队的研发工程师开发的。[Google 提供了许多教程][15] 让你通过高级 Keras API 去开始使用 TensorFlow。你既可以在 Google 云上也可以在本地运行 TensorFlow。

通常，大的公有云提供商都提供在线数据集和易于使用的机器学习服务。但是，在你开始去 “玩” 数据集和应用之前，你需要考虑清楚，一旦开始选定一个提供商，你将被它们 “锁定” 的程度。

你的探索学习项目所需的数据集可以从许多不同的源获得。除了公有云提供商之外，[Kaggle][16] 是另一个受欢迎的源，总体来看，它也是一个比较好的学习源。以数字形式提供的政府数据也越来越多了。美国联邦政府的 [Data.gov][17] 声称它提供超过 300,000 个数据集。各州和地方政府也发布从餐馆健康评级到狗的名字的所有数据。

### 研究和应用人工智能兼而有之

最后我想说明的一点是，人工智能不仅是与数学、编程、数据有关的一个宽泛主题。人工智能作为一个综合体涉及到了许多其它的领域，包括心理学、语言学、博弈论、运筹学和控制系统。确实，现在有一些人工智能研究者担心，由于处理能力和大数据的结合，使得该领域过于关注最近才变得强大和有趣的少数几个技术。在了解人类如何学习和推理方面，许多长期存在的问题仍未解决。不管怎样，对这些广泛存在的问题有一个了解，将更好地让你在更广泛的背景中评估人工智能。

我比较喜欢的其中一个示例是杜克大学的 [人类和自治实验室][18]。这个实验室的工作涉及人机协同所面临的各种挑战，比如，如果自动化设备失效，自动驾驶仪如何设计才能让那些[“洋红色的孩子“][19] 快速取得控制。有一个基础的大脑科学课程，比如 MIT 的 [心理学导论][20]，它提供了关于人类智能和机器智能之间关系的一些很有用的内容。另一个类似的课程是，MIT 电子工程与计算机科学系已故教授 Marvin Minsky 的 [心灵的社会][21]。

关于学习人工智能，假如说有一个最重要的挑战，那它不是原材料和工具不易获得，因为它们有如此之多。我的目标并不是给你一个全面的指导，相反，而是指出了你可以去学习的不同路径，以及为你提供一些可能的起点。祝你学习愉快！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/how-get-started-ai

作者：[Gordon Haff][a]
选题：[lujun9972][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ghaff
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/watch?v=RLtI7r3QUyY
[2]: https://www.edx.org/
[3]: https://www.coursera.org/
[4]: https://ocw.mit.edu/index.htm
[5]: https://www.coursera.org/learn/neural-networks-deep-learning
[6]: https://www.edx.org/micromasters/columbiax-artificial-intelligence
[7]: http://neuralnetworksanddeeplearning.com/
[8]: http://www.deeplearningbook.org/
[9]: https://pytorch.org/
[10]: https://www.edx.org/course/introduction-to-computer-science-and-programming-using-python
[11]: https://www.coursera.org/learn/python
[12]: https://www.r-project.org/about.html
[13]: https://www.edx.org/professional-certificate/harvardx-data-science
[14]: https://www.tensorflow.org/
[15]: https://www.tensorflow.org/tutorials/
[16]: https://www.kaggle.com/
[17]: https://www.data.gov/
[18]: https://hal.pratt.duke.edu/
[19]: https://99percentinvisible.org/episode/children-of-the-magenta-automation-paradox-pt-1/
[20]: https://ocw.mit.edu/courses/brain-and-cognitive-sciences/9-00sc-introduction-to-psychology-fall-2011/
[21]: https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-868j-the-society-of-mind-fall-2011/
[22]: https://www.edx.org/course/calculus-1a-differentiation
[23]: https://www.edx.org/course/linear-algebra-foundations-to-frontiers
[24]: https://courses.edx.org/courses/course-v1:MITx+6.431x+3T2018/course/
