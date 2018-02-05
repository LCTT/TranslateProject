在 GitHub 上对编程语言与软件质量的一个大规模研究
============================================================


![A Large-Scale Study of Programming Languages, illustration](https://cacm.acm.org/system/assets/0002/8759/092117_Getty_Large-Scale-Study1.large.jpg?1506007488&1506007487 "A Large-Scale Study of Programming Languages, illustration")

编程语言对软件质量的影响是什么？这个问题在很长一段时间内成为一个引起了大量辩论的主题。在这项研究中，我们从 GitHub 上收集了大量的数据（728 个项目，6300 万行源代码，29000 位作者，150 万个提交，17 种编程语言），尝试在这个问题上提供一些实证。这个还算比较大的样本数量允许我们去使用一个混合的方法，结合多种可视化的回归模型和文本分析，去研究语言特性的影响，比如，在软件质量上，静态与动态类型和允许混淆与不允许混淆的类型。通过从不同的方法作三角测量研究（译者注：一种测量研究的方法），并且去控制引起混淆的因素，比如，团队大小、项目大小、和项目历史，我们的报告显示，语言设计确实有很大的影响，但是，在软件质量方面，语言的影响是非常有限的。最明显的似乎是，不允许混淆的类型比允许混淆的类型要稍微好一些，并且，在函数式语言中，静态类型也比动态类型好一些。值得注意的是，这些由语言设计所引起的轻微影响，绝大多数是由过程因素所主导的，比如，项目大小，团队大小，和提交数量。但是，我们警告读者，即便是这些不起眼的轻微影响，也是由其它的无形的过程因素所造成的，例如，对某些函数类型、以及不允许类型混淆的静态语言的偏爱。

[Back to Top][46]

### 1 序言

在给定的编程语言是否是“适合这个工作的正确工具”的讨论期间，紧接着又发生了多种辩论。虽然一些辩论出现了带有宗教般狂热的色彩，但是大部分人都一致认为，编程语言的选择能够对编码过程和由此生成的结果都有影响。

主张强静态类型的人，倾向于认为静态方法能够在早期捕获到缺陷；他们认为，一点点的预防胜过大量的矫正。动态类型拥护者主张，保守的静态类型检查，无论怎样都是非常浪费开发者资源的，并且，最好是依赖强动态类型检查来捕获错误类型。然而，这些辩论，大多数都是“纸上谈兵”，只靠“传说中”的证据去支持。

这些“传说”也许并不是没有道理的；考虑到影响软件工程结果的大量其它因素，获取这种经验性的证据支持是一项极具挑战性的任务，比如，代码质量，语言特征，以及应用领域。比如软件质量，考虑到它有大量的众所周知的影响因素，比如，代码数量，[6][1] 团队大小，[2][2]和年龄/熟练程度[9][3]。

受控实验是检验语言选择在面对如此令人气馁的混淆影响时的一种方法，然而，由于成本的原因，这种研究通常会引入一种它们自己的混淆，也就是说，限制了范围。在这种研究中，完整的任务是必须要受限制的，并且不能去模拟 _真实的世界_ 中的开发。这里有几个最近的这种大学本科生使用的研究，或者，通过一个实验因素去比较静态或动态类型的语言。[7][4]，[12][5]，[15][6]

幸运的是，现在我们可以基于大量的真实世界中的软件项目去研究这些问题。GitHub 包含了多种语言的大量的项目，并且在大小、年龄、和开发者数量上有很大的差别。每个项目的仓库都提供一个详细的记录，包含贡献历史、项目大小、作者身份、以及缺陷修复。然后，我们使用多种工具去研究语言特性对缺陷发生的影响。对我们的研究方法的最佳描述应该是“混合方法”，或者是三角测量法 [5][7]；我们使用文本分析、聚簇、和可视化去证实和支持量化回归研究的结果。这个以经验为根据的方法，帮助我们去了解编程语言对软件质量的具体影响，因为，他们是被开发者非正式使用的。

[Back to Top][47]

### 2 方法

我们的方法是软件工程中典型的大范围观察研究法。我们首先大量的使用自动化方法，从几种数据源采集数据。然后使用预构建的统计分析模型对数据进行过滤和清洗。过滤器的选择是由一系列的因素共同驱动的，这些因素包括我们研究的问题的本质、数据质量和认为最适合这项统计分析研究的数据。尤其是，GitHub 包含了由大量的编程语言所写的非常多的项目。对于这项研究，我们花费大量的精力专注于收集那些用大多数的主流编程语言写的流行的项目的数据。我们选择合适的方法来评估计数数据上的影响因素。

![*](http://dl.acm.org/images/bullet.gif)
 **2.1 数据收集**

我们选择了 GitHub 上的排名前 19 的编程语言。剔除了 CSS、Shell script、和 Vim script，因为它们不是通用的编程语言。我们包含了 `Typescript`，它是 `JavaScript` 的超集。然后，对每个被研究的编程语言，我们检索出以它为主要编程语言的前 50 个项目。我们总共分析了 17 种不同的语言，共计 850 个项目。

我们的编程语言和项目的数据是从 _GitHub Archive_ 中提取的，这是一个记录所有活跃的公共 GitHub 项目的数据库。它记录了 18 种不同的 GitHub 事件，包括新提交（new commits）、fork 事件、PR(pull request)、开发者信息、和以每小时为基础的所有开源 GitHub 项目的问题跟踪（issue tracking）。打包后的数据上传到 Google BigQuery 提供的交互式数据分析接口上。

**识别编程语言排名榜单** 我们基于它们的主要编程语言分类合计项目。然后，我们选择大多数的项目进行进一步分析，如 [表 1][48] 所示。一个项目可能使用多种编程语言；将它确定成单一的编程语言是很困难的。Github 包保存的信息是从 GitHub Linguist 上采集的，它使用项目仓库中源文件的扩展名来确定项目的发布语言是什么。源文件中使用数量最多的编程语言被确定为这个项目的 _主要编程语言_。

 [![t1.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t1.jpg)][49]
**表 1 每个编程语言排名前三的项目**

**检索流行的项目** 对于每个选定的编程语言，我们先根据项目所使用的主要编程语言来选出项目，然后根据每个项目的相关 _星（stars）_ 的数量排出项目的流行度。 _星_ 的数量表示了在这个项目上有多少感兴趣的人在表达自己的意见，并且它是流行度的一个合适的代表指标。因此，在 C 语言中排名前三的项目是 _linux、git、php-src_ ；而对于 C++，它们则是 _node-webkit、phantomjs、mongo_ ；对于 `Java`，它们则是 _storm、elasticsearch、ActionBarSherlock_ 。每个编程语言，我们总共选了 50 个项目。

为确保每个项目有足够长的开发历史，我们剔除了少于 28 个提交的项目（28 是每个候选项目的第一个四分位值数）。这样我们还剩下 728 个项目。[表 1][50] 展示了每个编程语言的前三个项目。

**检索项目演进历史** 对于 728 个项目中的每一个项目，我们下载了它们的非合并提交、提交记录、作者数据、作者使用的 _git_ 名字。我们从每个文件的添加和删除的行数中计算代码改动和每个提交的修改文件数量。我们以每个提交中修改的文件的扩展名所代表的编程语言，来检索出所使用的编程语言（一个提交可能有多个编程语言标签）。对于每个提交，我们通过它的提交日期减去这个项目的第一个提交的日期，来计算它的 _commit age_ 。我们也计算其它的项目相关的统计数据，包括项目的最大 commit age 和开发者总数，用于我们的回归分析模型的控制变量，它在第三节中会讨论到。我们通过在提交记录中搜索与错误相关的关键字，比如，"error"、"bug"、"fix"、"issue"、"mistake"、"incorrect"、"fault"、"defect"、"flaw"，来识别 bug 修复提交。这一点与以前的研究类似。[18][8]

[表 2][51] 汇总了我们的数据集。因为一个项目可能使用多个编程语言，表的第二列展示了使用某种编程语言的项目的总数量。我们进一步排除了该编程语言的项目中少于 20 个提交的那些编程语言。因为 20 是每个编程语言的每个项目的提交总数的第一个四分位值。例如，我们在 C 语言中共找到 220 项目的提交数量多于 20 个。这确保了每个“编程语言 – 项目”对有足够的活跃度。

 [![t2.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t2.jpg)][52]
**表 2 研究主题**

总而言之，我们研究了最近 18 年以来，用了 17 种编程语言开发的，总共 728 个项目。总共包括了 29,000 个不同的开发者，157 万个提交，和 564,625 个 bug 修复提交。

![*](http://dl.acm.org/images/bullet.gif)
 **2.2 语言分类**

我们基于影响语言质量的几种编程语言特性定义了语言类别，[7][9]，[8][10]，[12][11]，如 [表 3][53] 所示。 _编程范式_ 表示项目是否是以命令方式、脚本方式、或者函数语言所写的。在本文的下面部分，我们分别使用 _命令_ 和 _脚本_ 这两个术语去代表命令方式和脚本方式。

 [![t3.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t3.jpg)][54]
**表 3. 语言分类的不同类型**

 _类型检查_  代表静态或者动态类型。在静态类型语言中，在编译时进行类型检查，并且变量名是绑定到一个值和一个类型的。另外，（包含变量的）表达式是根据运行时，它们可能产生的值所符合的类型来分类的。在动态类型语言中，类型检查发生在运行时。因此，在动态类型语言中，它可能出现在同一个程序中，一个变量名可能会绑定到不同类型的对象上的情形。

 _隐式类型转换_ 允许一个类型为 T1 的操作数，作为另一个不同的类型 T2 来访问，而无需进行显式的类型转换。这样的隐式类型转换在一些情况下可能会带来类型混淆，尤其是当它表示一个明确的 T1 类型的操作数时，把它再作为另一个不同的 T2 类型的情况下。因为，并不是所有的隐式类型转换都会立即出现问题，通过我们识别出的允许进行隐式类型转换的所有编程语言中，可能发生隐式类型转换混淆的例子来展示我们的定义。例如，在像 `Perl、 JavaScript、CoffeeScript` 这样的编程语言中，一个字符和一个数字相加是允许的（比如，"5" + 2 结果是 "52"）。但是在 `Php` 中，相同的操作，结果是 7。像这种操作在一些编程语言中是不允许的，比如 `Java` 和 `Python`，因为，它们不允许隐式转换。在强数据类型的 C 和 C++ 中，这种操作的结果是不可预料的，例如，`int x；float y；y=3.5；x=y`；是合法的 C 代码，并且对于 x 和 y 其结果是不同的值，具体是哪一个值，取决于含义，这可能在后面会产生问题。[a][12] 在 `Objective-C` 中数据类型 _id_ 是一个通用对象指针，它可以被用于任何数据类型的对象，而不管分类是什么。[b][13] 像这种通用数据类型提供了很好的灵活性，它可能导致隐式的类型转换，并且也会出现不可预料的结果。[c][14] 因此，我们根据它的编译器是否 _允许_  或者  _不允许_  如上所述的隐式类型转换，对编程语言进行分类；而不允许隐式类型转换的编程语言，会显式检测类型混淆，并报告类型不匹配的错误。

不允许隐式类型转换的编程语言，使用一个类型判断算法，比如，Hindley[10][15] 和 Milner[17][16]，或者，在运行时上使用一个动态类型检查器，可以在一个编译器（比如，使用 `Java`）中判断静态类型的结果。相比之下，一个类型混淆可能会悄无声息地发生，因为，它可能因为没有检测到，也可能是没有报告出来。无论是哪种方式，允许隐式类型转换在提供了灵活性的同时，最终也可能会出现很难确定原因的错误。为了简单起见，我们将用 _implicit_ 代表允许隐式类型转换的编程语言，而不允许隐式类型转换的语言，我们用 _explicit_ 代表。

 _内存分类_  表示是否要求开发者去管理内存。尽管 `Objective-C` 遵循了一个混合模式，我们仍将它在不托管的分类中来对待，因为，我们在它的代码库中观察到很多的内存错误，在第 3 节的 RQ4 中会讨论到。

请注意，我们之所以使用这种方式对编程语言来分类和研究，是因为，这种方式在一个“真实的世界”中被大量的开发人员非正式使用。例如，`TypeScript` 被有意地分到静态编程语言的分类中，它不允许隐式类型转换。然而，在实践中，我们注意到，开发者经常（有 50% 可变化，并且跨 `TypeScript` - 在我们的数据集中使用的项目）使用 `any` 类型，一个笼统的联合类型，并且，因此在实践中，`TypeScript` 允许动态地、隐式类型转换。为减少混淆，我们从我们的编程语言分类和相关的模型中排除了 `TypeScript`（查看 [表 3][55] 和 [7][56]）。

![*](http://dl.acm.org/images/bullet.gif)
 **2.3 识别项目领域**

我们基于编程语言的特性和功能，使用一个自动和手动的混合技术，将研究的项目分类到不同的领域。在 GitHub 上，项目使用 `project descriptions` 和 README 文件来描述它们的特性。我们使用文档主题生成模型（Latent Dirichlet Allocation，缩写为：LDA）[3][17] 去分析这些文本。提供一组文档给它，LDA 将生成不同的关键字，然后来识别可能的主题。对于每个文档，LDA 也估算每个主题分配的文档的概率。

我们检测到 30 个不同的领域，换句话说，就是主题，并且评估了每个项目从属于每个领域的概率。因为，这些自动检测的领域包含了几个具体项目的关键字，例如，facebook，很难去界定它的底层的常用功能。为了给每个领域分配一个有意义的名字，我们手动检查了识别到的、独立于项目名字的 30 个领域、领域识别关键字。我们手动重命名了所有的 30 个自动检测的领域，并且找出了以下六个领域的大多数的项目：应用程序、数据库、代码分析、中间件、库、和框架。我们也找出了不符合以上任何一个领域的一些项目，因此，我们把这个领域笼统地标记为 _其它_ 。随后，我们研究组的另一名成员检查和确认了这种项目领域分类的方式。[表 4][57] 汇总了这个过程识别到的领域结果。

 [![t4.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t4.jpg)][58]
**表 4 领域特征**

![*](http://dl.acm.org/images/bullet.gif)
 **2.4 bugs 分类**

尽管修复软件 bugs 时，开发者经常会在提交日志中留下关于这个 bugs 的原始的重要信息；例如，为什么会产生 bugs，以及怎么去修复 bugs。我们利用很多信息去分类 bugs，与 Tan 的 _et al_ 类似 [13][18]，[24][19]。

首先，我们基于 bugs 的 _原因_ 和 _影响_ 进行分类。_ 原因 _ 进一步分解为不相关的错误子类：算法方面的、并发方面的、内存方面的、普通编程错误、和未知的。bug 的 _影响_  也分成四个不相关的子类：安全、性能、失败、和其它的未知类。因此，每个 bug 修复提交也包含原因和影响的类型。[表 5][59] 展示了描述的每个 bug 分类。这个类别分别在两个阶段中被执行：

 [![t5.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg)][60]
**表 5 bugs 分类和在整个数据集中的描述**

**(1) 关键字搜索** 我们随机选择了 10% 的 bug 修复信息，并且使用一个关键字基于搜索技术去对它们进行自动化分类，作为可能的 bug 类型。我们对这两种类型（原因和影响），单独使用这个注释。我们选择了一个限定的关键字和习惯用语集，如 [表 5][61] 所展示的。像这种限定的关键字和习惯用语集可以帮我们降低误报。

**(2) 监督分类** 我们使用前面步骤中的有注释的 bug 修复日志作为训练数据，为监督学习分类技术，通过测试数据来矫正，去对剩余的 bug 修复信息进行分类。我们首先转换每个 bug 修复信息为一个词袋（译者注：bag-of-words，一种信息检索模型）。然后，删除在所有的 bug 修复信息中仅出现过一次的词。这样减少了具体项目的关键字。我们也使用标准的自然语言处理技术来解决这个问题。最终，我们使用支持向量机（译者注：Support Vector Machine，缩写为 SVM，在机器学习领域中，一种有监督的学习算法）去对测试数据进行分类。

为精确评估 bug 分类器，我们手动注释了 180 个随机选择的 bug 修复，平均分布在所有的分类中。然后，我们比较手动注释的数据集在自动分类器中的结果。最终处理后的，表现出的精确度是可接受的，性能方面的精确度最低，是 70%，并发错误方面的精确度最高，是 100%，平均是 84%。再次运行，精确度从低到高是 69% 到 91%，平均精确度还是 84%。

我们的 bug 分类的结果展示在 [表 5][62] 中。大多数缺陷的原因都与普通编程错误相关。这个结果并不意外，因为，在这个分类中涉及了大量的编程错误，比如，类型错误、输入错误、编写错误、等等。我们的技术并不能将在任何（原因或影响）分类中占比为 1.4% 的 bug 修复信息再次进行分类；我们将它归类为 Unknown。

![*](http://dl.acm.org/images/bullet.gif)
 **2.5 统计方法**

我们使用回归模型对软件项目相关的其它因素中的有缺陷的提交数量进行了建模。所有的模型使用 _负二项回归（译者注：negative binomial regression，缩写为NBR，一种回归分析模型)_ 去对项目属性计数进行建模，比如，提交数量。NBR 是一个广义的线性模型，用于对非负整数进行响应建模。[4][20]

在我们的模型中，我们对每个项目的编程语言，控制几个可能影响最终结果的因素。因此，在我们的回归分析中，每个（语言、项目）对是一个行，并且可以视为来自流行的开源项目中的样本。我们依据变量计数进行对象转换，以使变量保持稳定，并且提升了模型的适用度。[4][21] 我们通过使用 AIC 和 Vuong 对非嵌套模型的测试比较来验证它们。

去检查那些过度的多重共线性（译者注：多重共线性是指，在线性回归模型中解释变量之间由于存在精确相关关系或高度相关关系而使模型估计失真或难以估计准确。）并不是一个问题，我们在所有的模型中使用一个保守的最大值 5，去计算每个依赖的变量的膨胀因子的方差。[4][22] 我们通过对每个模型的残差和杠杆图进行视觉检查来移除高杠杆点，找出库克距离（译者注：一个统计学术语，用于诊断回归分析中是否存在异常数据）的分离值和最大值。

我们利用 _效果_ ，或者 _差异_ ，编码到我们的研究中，以提高编程语言回归系数的表现。[4][23] 加权的效果代码允许我们将每种编程语言与所有编程语言的效果进行比较，同时弥补了跨项目使用编程语言的不均匀性。[23][24] 去测试两种变量因素之间的联系，我们使用一个独立的卡方检验（译者注：Chi-square，一种统计学上的假设检验方法）测试。[14][25] 在证实一个依赖之后，我们使用 Cramer 的 V，它是与一个 _r_  ×  _c_ 等价的正常数据的 phi（φ）系数，去建立一个效果数据。

[Back to Top][63]

### 3 结果

我们从简单明了的问题开始，它非常直接地解决了人们坚信的一些核心问题，即：

**RQ1. 一些编程语言相比其它语言来说更易于出现缺陷吗？**

我们使用了回归分析模型，去比较每个编程语言对所有编程语言缺陷数量平均值的影响，以及对缺陷修复提交的影响（查看 [表 6][64]）。

 [![t6.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t6.jpg)][65]
**表 6. 一些语言的缺陷要少于其它语言**

我们包括了一些变量，作为对明确影响反应的控制。项目年龄（Project age）也包括在内，因为，越老的项目生成的缺陷修复数量越大。提交数量也会对项目反应有轻微的影响。另外，从事该项目的开发人员的数量和项目的原始大小，都会随着项目的活跃而增长。

上述模型中估算系数的大小和符号（译者注：指“+”或者“-”）与结果的预测因子有关。初始的四种变量是控制变量，并且，我们对这些变量对最终结果的影响不感兴趣，只是说它们都是积极的和有意义的。语言变量是指示变量，是每个项目的变化因子，该因子将每种编程语言与所有项目的编程语言的加权平均值进行比较。编程语言系数可以大体上分为三类。第一类是，那些在统计学上无关紧要的系数，并且在建模过程中这些系数不能从 0 中区分出来。这些编程语言的表现与平均值相似，或者它们也可能有更大的方差。剩余的系数是非常明显的，要么是正的，要么是负的。对于那些正的系数，我们猜测可能与这个编程语言有大量的缺陷修复相关。这些语言包括 `C、C++、Objective-C、Php`、以及 `Python`。所有的有一个负的系数的编程语言，比如 `Clojure、Haskell、Ruby`、和 `Scala`，暗示这些语言的缺陷修复提交可能小于平均值。

应该注意的是，虽然，从统计学的角度观察到编程语言与缺陷之间有明显的联系，但是，大家不要过高估计编程语言对于缺陷的影响，因为，这种影响效应是非常小的。异常分析的结果显示，这种影响小于总异常的 1%。

 [![ut1.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/ut1.jpg)][66]

我们可以这样去理解模型的系数，它代表一个预测因子在所有其它预测因子保持不变的情况下，这个预测因子一个单位（unit）的变化，所反应出的预期的响应的对数变化；换句话说，对于一个系数 _β<sub style="border: 0px; outline: 0px; font-size: smaller; vertical-align: sub; background: transparent;">i</sub>_ ，在 _β<sub style="border: 0px; outline: 0px; font-size: smaller; vertical-align: sub; background: transparent;">i</sub>_ 中一个单位的变化，产生一个预期的 e _βi_ 响应的变化。对于可变因子，这个预期的变化是与所有编程语言的平均值进行比较。因此，如果对于一定数量的提交，用一个处于平均值的编程语言开发的特定项目有四个缺陷提交，那么，如果选择使用 `C++` 来开发，意味着我们预计应该有一个额外的（译者注：相对于平均值 4，多 1 个）缺陷提交，因为 e0.18 × 4 = 4.79。对于相同的项目，如果选择使用 `Haskell` 来开发，意味着我们预计应该少一个（译者注：同上，相对于平均值 4）缺陷提交。因为， _e_ −0.26 × 4 = 3.08。预测的精确度取决于剩余的其它因子都保持不变，除了那些微不足道的项目之外，所有的这些都是一个极具挑战性的命题。所有观察性研究都面临类似的局限性；我们将在第 5 节中详细解决这些事情。

**结论 1：** _一些编程语言相比其它编程语言有更高的缺陷相关度，不过，影响非常小。_

在这篇文章的剩余部分，我们在基本结论的基础上详细阐述，通过考虑不同种类的应用程序、缺陷、和编程语言，可以进一步深入了解编程语言和缺陷倾向之间的关系。

软件 bugs 通常落进两种宽泛的分类中：（1） _特定领域的 bug_ ：特定于项目功能，并且不依赖于底层编程语言。（2） _普通 bug_ ：大多数的普通 bug 是天生的，并且与项目功能无关，比如，输入错误，并发错误、等等。

因此，在一个项目中，应用程序领域和编程语言相互作用可能会影响缺陷的数量，这一结论被认为是合理的。因为一些编程语言被认为在一些任务上相比其它语言表现更突出，例如，`C` 对于低级别的（底层）工作，或者，`Java` 对于用户应用程序，对于编程语言的一个不合适的选择，可能会带来更多的缺陷。为研究这种情况，我们将理想化地忽略领域特定的 bugs，因为，普通 bugs 更依赖于编程语言的特性。但是，因为一个领域特定的 bugs 也可能出现在一个普通的编程错误中，这两者是很难区分的。一个可能的变通办法是在控制领域的同时去研究编程语言。从统计的角度来看，虽然，使用 17 种编程语言跨 7 个领域，在给定的样本数量中，理解大量的术语将是一个极大的挑战。

鉴于这种情况，我们首先考虑在一个项目中测试领域和编程语言使用之间的依赖关系，独立使用一个卡方检验（Chi-square）测试。在 119 个单元中，是 46，也就是说是 39%，它在我们设定的保守值 5 以上，它太高了。这个数字不能超过 20%，应该低于 5。[14][26] 我们在这里包含了完整有值 [d][27]；但是，通过 Cramer 的 V 测试的值是 0.191，是低相关度的，表明任何编程语言和领域之间的相关度是非常小的，并且，在回归模型中包含领域并不会产生有意义的结果。

去解决这种情况的一个选择是，去移除编程语言，或者混合领域，但是，我们现有的数据没有进行完全挑选。或者，我们混合编程语言；这个选择导致一个相关但略有不同的问题。

**RQ2. 哪些编程语言特性与缺陷相关？**

我们聚合它们为编程语言类别，而不是考虑单独的编程语言，正如在第 2.2 节所描述的那样，然后去分析与缺陷的关系。总体上说，这些属性中的每一个都将编程语言按照在上下文中经常讨论的错误、用户辩论驱动、或者按以前工作主题来划分的。因此，单独的属性是高度相关的，我们创建了六个模型因子，将所有的单独因子综合到我们的研究中。然后，我们对六个不同的因子对缺陷数量的影响进行建模，同时控制我们在 _RQ1_ 节中使用的模型中的相同的基本协变量（译者注：协变量是指在实验中不能被人为操纵的独立变量）。

关于使用的编程语言（在前面的 [表 6][67]中），我们使用跨所有语言类的平均反应来比较编程语言 _类_ 。这个模型在 [表 7][68] 中表达了出来。很明显，`Script-Dynamic-Explicit-Managed` 类有最小的量级系数。这个系数是微不足道的，换句话说，对这个系数的 Z 校验（z-test，译者注：统计学上的一种平均值差异校验的方法） 并不能把它从 0 中区分出来。鉴于标准错误的量级，我们可以假设，在这个类别中的编程语言的行为是非常接近于所有编程语言行为的平均值。我们可以通过使用 `Proc-Static-Implicit-Unmanaged` 作为基本级并用于处理，或者使用基本级来虚假编码比较每个语言类，来证明这一点。在这种情况下，`Script-Dynamic-Explicit-Managed` 是明显不同于 _p_  = 0.00044 的。注意，虽然我们在这是选择了不同的编码方法，影响了系数和 Z 值，这个方法和所有其它的方面都是一样的。当我们改变了编码，我们调整系数去反应我们希望生成的对比。[4][28] 将其它类的编程语言与总体平均数进行比较，`Proc-Static-Implicit-Unmanaged` 类编程语言更容易引起缺陷。这意味着与其它过程类编程语言相比，隐式类型转换或者内存托管会导致更多的缺陷倾向。

 [![t7.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t7.jpg)][69]
**表 7. 函数式语言与缺陷的关联度和其它类语言相比要低，而过程类语言则大于或接近于平均值。**

在脚本类编程语言中，我们观察到类似于允许与不允许隐式类型转换的编程语言之间的关系，它们提供的一些证据表明，隐式类型转换（与显示类型转换相比）才是导致这种差异的原因，而不是内存托管。鉴于各种因素之间的相关性，我们并不能得出这个结论。但是，当它们与平均值进行比较时，作为一个组，那些不允许隐式类型转换的编程语言出现错误的倾向更低一些，而那些出现错误倾向更高的编程语言，出现错误的机率则相对更高。在函数式编程语言中静态和动态类型之间的差异也很明显。

函数式语言作为一个组展示了与平均值的很明显的差异。静态类型语言的系数要小很多，但是函数式语言类都有同样的标准错误。函数式静态编程语言出现错误的倾向要小于函数式动态编程语言，这是一个强有力的证据，尽管如此，Z 校验仅仅是检验系数是否能从 0 中区分出来。为了强化这个推论，我们使用处理编码，重新编码了上面的模型，并且观察到，`Functional-Static-Explicit-Managed` 编程语言类的错误倾向是明显小于 `Functional-Dynamic-Explicit-Managed` 编程语言类的 _p_  = 0.034。

 [![ut2.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/ut2.jpg)][70]

与编程语言和缺陷一样，编程语言类与缺陷之间关系的影响是非常小的。解释类编程语言的这种差异也是相似的，虽然很小，解释类编程语言的这种差异小于 1%。

我们现在重新回到应用领域这个问题。应用领域是否与语言类相互影响？怎么选择？例如，一个函数化编程语言，对特定的领域有一定的优势？与上面一样，对于这些因素和项目领域之间的关系做一个卡方检验，它的值是 99.05， _df_  = 30， _p_  = 2.622e–09，我们拒绝无意义假设，Cramer 的 V 产生的值是 0.133，表示一个弱关联。因此，虽然领域和编程语言之间有一些关联，但在这里应用领域和编程语言类之间仅仅是一个非常弱的关联。

**结论 2：**  _在编程语言类与缺陷之间有一个很小但是很明显的关系。函数式语言与过程式或者脚本式语言相比，缺陷要少。_

这个结论有些不太令人满意的地方，因为，我们并没有一个强有力的证据去证明，在一个项目中编程语言、或者语言类和应用领域之间的关联性。一个替代方法是，基于全部的编程语言和应用领域，忽略项目和缺陷总数，而去查看相同的数据。因为，这样不再产生不相关的样本，我们没有从统计学的角度去尝试分析它，而是使用一个描述式的、基于可视化的方法。

我们定义了 _缺陷倾向_ 作为 bug 修复提交与每语言每领域总提交的比率。[图 1][71] 使用了一个热力图展示了应用领域与编程语言之间的相互作用，从亮到暗表示缺陷倾向在增加。我们研究了哪些编程语言因素影响了跨多种语言写的项目的缺陷修复提交。它引出了下面的研究问题：

 [![f1.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/f1.jpg)][72]
**图 1. 编程语言的缺陷倾向与应用领域之间的相互作用。对于一个给定的领域（列底部），热力图中的每个格子表示了一个编程语言的缺陷倾向（行头部）。“整体”列表示一个编程语言基于所有领域的缺陷倾向。用白色十字线标记的格子代表一个 null 值，换句话说，就是在那个格子里没有符合的提交。**

**RQ3. 编程语言的错误倾向是否取决于应用领域？**

为了回答这个问题，我们首先在我们的回归模型中，以高杠杆点过滤掉认为是异常的项目，这种方法在这里是必要的，尽管这是一个非统计学的方法，一些关系可能影响可视化。例如，我们找到一个简单的项目，Google 的 v8，一个 `JavaScript` 项目，负责中间件中的所有错误。这对我们来说是一个惊喜，因为 `JavaScript` 通常不用于中间件。这个模式一直在其它应用领域中不停地重复着，因此，我们过滤出的项目的缺陷度都低于 10% 和高于 90%。这个结果在 [图 1][73] 中。

我们看到在这个热力图中仅有一个很小的差异，正如在 RQ1 节中看到的那样，这个结果仅表示编程语言固有的错误倾向。为验证这个推论，我们测量了编程语言对每个应用领域和对全部应用领域的缺陷倾向。对于除了数据库以外的全部领域，关联性都是正向的，并且 p 值是有意义的（<0.01）。因此，关于缺陷倾向，在每个领域的语言排序与全部领域的语言排序是基本相同的。

 [![ut3.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/ut3.jpg)][74]

**结论 3:**  _应用领域和编程语言缺陷倾向之间总体上没有联系_

我们证明了不同的语言产生了大量的缺陷，并且，这个关系不仅与特定的语言相关，也适用于一般的语言类；然而，我们发现，项目类型并不能在一定程度上协调这种关系。现在，我们转变我们的注意力到反应分类上，我想去了解，编程语言与特定种类的缺陷之间有什么联系，以及这种关系怎么与我们观察到的更普通的关系去比较。我们将缺陷分为不同的类别，如 [表 5][75] 所描述的那样，然后提出以下的问题：

**RQ4. 编程语言与 bug 分类之间有什么关系？**

我们使用了一个类似于 RQ3 中所用的方法，去了解编程语言与 bug 分类之间的关系。首先，我们研究了 bug 分类和编程语言类之间的关系。一个热力图（[图 2][76]）展示了在编程语言类和 bug 类型之上的总缺陷数。去理解 bug 分类和语言之间的相互作用，我们对每个类别使用一个 NBR 回归模型。对于每个模型，我们使用了与 RQ1 中相同的控制因素，以及使用加权效应编码后的语言，去预测缺陷修复提交。

 [![f2.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/f2.jpg)][77]
**图 2. bug 类别与编程语言类之间的关系。每个格子表示每语言类（行头部）每 bug 类别（列底部）的 bug 修复提交占全部 bug 修复提交的百分比。这个值是按列规范化的。**

结果和编程语言的方差分析值展示在 [表 8][78] 中。每个模型的整体异常是非常小的，并且对于特定的缺陷类型，通过语言所展示的比例在大多数类别中的量级是类似的。我们解释这种关系为，编程语言对于特定的 bug 类别的影响要大于总体的影响。尽管我们结论概括了全部的类别，但是，在接下来的一节中，我们对 [表 5][79] 中反应出来的 bug 数较多的 bug 类别做进一步研究。

 [![t8.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg)][80]
**表 8. 虽然编程语言对缺陷的影响因缺陷类别而不同，但是，编程语言对特定的类别的影响要大于一般的类别。**

**编程错误** 普通的编程错误占所有 bug 修复提交的 88.53% 左右，并且在所有的编程语言类中都有。因此，回归分析给出了一个与 RQ1 中类似的结论（查看 [表 6][81]）。所有的编程语言都会导致这种编程错误，比如，处理错误、定义错误、输入错误、等等。

**内存错误** 内存错误占所有 bug 修复提交的 5.44%。热力图 [图 2][82] 证明了在 `Proc-Static-Implicit-Unmanaged` 类和内存错误之间存在着非常紧密的联系。非托管内存的编程语言出现内存 bug，这是预料之中的。[表 8][83] 也证明了这一点，例如，C、C++、和 `Objective-C` 引发了很多的内存错误。在托管内存的语言中 `Java` 引发了更多的内存错误，尽管它少于非托管的编程语言。虽然 `Java` 自己做内存回收，但是，它出现内存泄露一点也不奇怪，因为对象引用经常阻止内存回收。[11][29] 在我们的数据中，`Java` 的所有内存错误中，28.89% 是内存泄漏造成的。就数量而言，编程语言中内存缺陷相比其它类别的 _原因_ 造成的影响要大很多。

**并发错误** 在总的 bug 修复提交中，并发错误相关的修复提交占 1.99%。热力图显示，`Proc-Static-Implicit-Unmanaged` 是主要的错误类型。在这种错误中，C 和 C++ 分别占 19.15% 和 7.89%，并且它们分布在各个项目中。

 [![ut4.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/ut4.jpg)][84]

属于 `Static-Strong-Managed` 语言类的编程语言都被证实处于热力图中的暗区中，普通的静态语言相比其它语言产生更多的并发错误。在动态语言中，仅仅有 `Erlang` 更多的并发错误倾向，或许与使用这种语言开发的并发应用程序非常多有关系。同样地，在 [表 8][85] 中的负的系数表明，用诸如 `Ruby` 和 `Php` 这样的动态编程语言写的项目，并发错误要少一些。请注意，某些语言，如 `JavaScript、CoffeeScript`、和 `TypeScript` 是不支持并发的，在传统的惯例中，虽然 `Php` 具有有限的并发支持（取决于它的实现）。这些语言在我们的数据中引入了虚假的 0（zeros），因此，在 [表 8][86] 中这些语言的并发模型的系数，不能像其它的语言那样去解释。因为存在这些虚假的 0，所以在这个模型中所有语言的平均数非常小，它可能影响系数的大小，因此，她们给 w.r.t. 一个平均数，但是，这并不影响他们之间的相对关系，因为我们只关注它们的相对关系。

一个基于 bug 修复消息中高频词的文本分析表明，大多数的并发错误发生在一个条件争用、死锁、或者不正确的同步，正如上面表中所示。遍历所有语言，条件争用是并发错误出现最多的原因，例如，在 `Go` 中占 92%。在 `Go` 中条件争用错误的改进，或许是因为使用了一个争用检测工具帮助开发者去定位争用。同步错误主要与消息传递接口（MPI）或者共享内存操作（SHM）相关。`Erlang` 和 `Go` 对线程间通讯使用 MPI[e][30]，这就是为什么这两种语言没有发生任何 SHM 相关的错误的原因，比如共享锁、互斥锁、等等。相比之下，为线程间通讯使用早期的 SHM 技术的语言写的项目，就可能存在锁相关的错误。

**安全和其它冲突（impact）错误** 在所有的 bug 修复提交中，与冲突错误相关的提交占了 7.33% 左右。其中，`Erlang、C++、Python` 与安全相关的错误要高于平均值（[表 8][87]）。`Clojure` 项目相关的安全错误较少（[图 2][88]）。从热力图上我们也可以看出来，`静态` 语言一般更易于发生失败和性能错误，紧随其后的是 `Functional-Dynamic-Explicit-Managed` 语言，比如 `Erlang`。对异常结果的分析表明，编程语言与冲突失败密切相关。虽然安全错误在这个类别中是弱相关的，与残差相比，解释类语言的差异仍然比较大。

**结论 4：**  _缺陷类型与编程语言强相关；一些缺陷类型比如内存错误和并发错误也取决于早期的语言（所使用的技术）。对于特定类别，编程语言所引起的错误比整体更多。_

[Back to Top][89]

### 4. 相关工作

在编程语言比较之前做的工作分为以下三类：

**(1)  _受控实验_**  对于一个给定的任务，开发者使用不同的语言进行编程时受到监视。研究然后比较结果，比如，开发成果和代码质量。Hanenberg[7][31]通过开发一个解析程序，对 27 h 监视了 48 位程序员，去比较了静态与动态类型。他发现这两者在代码质量方面没有显著的差异，但是，基于动态类型的语言花费了更短的开发时间。他们的研究是在一个实验室中，使用本科学生，设置了定制的语言和 IDE 来进行的。我们的研究正好相反，是一个实际的流行软件应用的研究。虽然我们只能够通过使用回归模型间接（和 _事后_ ）控制混杂因素，我们的优势是样本数量大，并且更真实、使用更广泛的软件。我们发现在相同的条件下，静态化类型的语言比动态化类型的语言更少出现错误倾向，并且不允许隐式类型转换的语言要好于允许隐式类型转换的语言，其对结果的影响是非常小的。这是合理的，因为样本量非常大，所以这种非常小的影响在这个研究中可以看得到。

Harrison et al.[8][32] 比较了 C++ 与 `SML`，一个是过程化编程语言，一个是函数化编程语言，在总的错误数量上没有找到显著的差异，不过 `SML` 相比 C++ 有更高的缺陷密集度。`SML` 在我们的数据中并没有体现出来，不过，认为函数式编程语言相比过程化编程语言更少出现缺陷。另一个重点工作是比较跨不同语言的开发工作。[12][33]，[20][34] 不过，他们并不分析编程语言的缺陷倾向。

**(2)  _调查_**  Meyerovich 和 Rabkin[16][35] 调查了开发者对编程语言的观点，去研究为什么一些编程语言比其它的语言更流行。他们的报告指出，非编程语言的因素影响非常大：先前的编程语言技能、可用的开源工具、以及现有的老式系统。我们的研究也证明，可利用的外部工具也影响软件质量；例如，在 `Go` 中的并发 bug（请查看 RQ4 节内容）。

**(3)  _对软件仓库的挖掘_**  Bhattacharya 和 Neamtiu[1][36] 研究了用 C 和 C++ 开发的四个项目，并且发现在 C++ 中开发的组件一般比在 C 中开发的组件更可靠。我们发现 C 和 C++ 的错误倾向要高于全部编程语言的平均值。但是，对于某些 bug 类型，像并发错误，C 的缺陷倾向要高于 C++（请查看第 3 节中的 RQ4）。

[Back to Top][90]

### 5. 有效的风险

我们认为，我们的报告的结论几乎没有风险。首先，在识别 bug 修复提交方面，我们依赖的关键字是开发者经常用于表示 bug 修复的关键字。我们的选择是经过认真考虑的。在一个持续的开发过程中，我们去捕获那些开发者一直面对的问题，而不是他们报告的 bug。不过，这种选择存在过高估计的风险。我们对领域分类是为了去解释缺陷的倾向，而且，我们研究组中另外的成员验证过分类。此外，我们花费精力去对 bug 修复提交进行分类，也可能有被最初选择的关键字所污染的风险。每个项目在提交日志的描述上也不相同。为了缓解这些风险，我们像 2.4 节中描述的那样，利用手工注释评估了我们的类别。

我们判断文件所属的编程语言是基于文件的扩展名。如果使用不同的编程语言写的文件使用了我们研究的通用的编程语言文件的扩展名，这种情况下也容易出现错误倾向。为减少这种错误，我们使用一个随机样本文件集手工验证了我们的语言分类。

根据我们的数据集所显示的情形，2.2 节中的解释类编程语言，我们依据编程语言属性的主要用途作了一些假设。例如，我们将 `Objective-C` 分到非托管内存类型中，而不是混合类型。同样，我们将 `Scala` 注释为函数式编程语言，将 C# 作为过程化的编程语言，虽然，它们在设计的选择上两者都支持[19][37]，[21][38]。在这项研究工作中，我们没有从过程化编程语言中分离出面向对象的编程语言（OOP），因为，它们没有清晰的区别，主要差异在于编程类型。我们将 C++ 分到允许隐式类型转换的类别中是因为，某些类型的内存区域可以通过使用指针操作被进行不同的处理 [22][39]，并且我们注意到大多数 C++ 编译器可以在编译时检测类型错误。

最后，我们将缺陷修复提交关联到编程语言属性上，它们可以反应出报告的风格或者其它开发者的属性。可用的外部工具或者库（library）也可以影响一个相关的编程语言的 bug 数量。

[Back to Top][91]

### 6. 总结

我们对编程语言和使用进行了大规模的研究，因为它涉及到软件质量。我们使用的 Github 上的数据，具有很高的复杂性和多个维度上的差异的特性。我们的样本数量允许我们对编程语言效果以及在控制一些混杂因素的情况下，对编程语言、应用领域和缺陷类型之间的相互作用，进行一个混合方法的研究。研究数据显示，函数式语言是好于过程化语言的；不允许隐式类型转换的语言是好于允许隐式类型转换的语言的；静态类型的语言是好于动态类型的语言的；内存托管的语言是好于非托管的语言的。进一步讲，编程语言的缺陷倾向与软件应用领域并没有关联。另外，每个编程语言更多是与特定的 bug 类别有关联，而不是与全部 bug。

另一方面，即便是很大规模的数据集，它们被多种方法同时进行分割后，也变得很小且不全面。因此，随着依赖的变量越来越多，很难去回答某个变量所产生的影响有多大这种问题，尤其是在变量之间相互作用的情况下。因此，我们无法去量化编程语言在使用中的特定的效果。其它的方法，比如调查，可能对此有帮助。我们将在以后的工作中来解决这些挑战。

[Back to Top][92]

### 致谢

这个材料是在美国国家科学基金会（NSF）以及美国空军科学研究办公室（AFOSR）的授权和支持下完成的。授权号 1445079, 1247280, 1414172，1446683，FA955-11-1-0246。

[Back to Top][93]

### 参考资料

1\. Bhattacharya, P., Neamtiu, I. Assessing programming language impact on development and maintenance: A study on C and C++. In  _Proceedings of the 33rd International Conference on Software Engineering, ICSE'11_  (New York, NY USA, 2011). ACM, 171–180.

2\. Bird, C., Nagappan, N., Murphy, B., Gall, H., Devanbu, P. Don't touch my code! Examining the effects of ownership on software quality. In  _Proceedings of the 19th ACM SIGSOFT Symposium and the 13th European Conference on Foundations of Software Engineering_  (2011). ACM, 4–14.

3\. Blei, D.M. Probabilistic topic models.  _Commun. ACM 55_ , 4 (2012), 77–84.

4\. Cohen, J.  _Applied Multiple Regression/Correlation Analysis for the Behavioral Sciences._ Lawrence Erlbaum, 2003.

5\. Easterbrook, S., Singer, J., Storey, M.-A., Damian, D. Selecting empirical methods for software engineering research. In  _Guide to Advanced Empirical Software Engineering_  (2008). Springer, 285–311.

6\. El Emam, K., Benlarbi, S., Goel, N., Rai, S.N. The confounding effect of class size on the validity of object-oriented metrics.  _IEEE Trans. Softw. Eng. 27_ , 7 (2001), 630–650.

7\. Hanenberg, S. An experiment about static and dynamic type systems: Doubts about the positive impact of static type systems on development time. In  _Proceedings of the ACM International Conference on Object Oriented Programming Systems Languages and Applications, OOPSLA'10_  (New York, NY, USA, 2010). ACM, 22–35.

8\. Harrison, R., Smaraweera, L., Dobie, M., Lewis, P. Comparing programming paradigms: An evaluation of functional and object-oriented programs.  _Softw. Eng. J. 11_ , 4 (1996), 247–254.

9\. Harter, D.E., Krishnan, M.S., Slaughter, S.A. Effects of process maturity on quality, cycle time, and effort in software product development.  _Manage. Sci. 46_  4 (2000), 451–466.

10\. Hindley, R. The principal type-scheme of an object in combinatory logic.  _Trans. Am. Math. Soc._  (1969), 29–60.

11\. Jump, M., McKinley, K.S. Cork: Dynamic memory leak detection for garbage-collected languages. In  _ACM SIGPLAN Notices_ , Volume 42 (2007). ACM, 31–38.

12\. Kleinschmager, S., Hanenberg, S., Robbes, R., Tanter, É., Stefik, A. Do static type systems improve the maintainability of software systems? An empirical study. In  _2012 IEEE 20th International Conference on Program Comprehension (ICPC)_  (2012). IEEE, 153–162.

13\. Li, Z., Tan, L., Wang, X., Lu, S., Zhou, Y., Zhai, C. Have things changed now? An empirical study of bug characteristics in modern open source software. In  _ASID'06: Proceedings of the 1st Workshop on Architectural and System Support for Improving Software Dependability_  (October 2006).

14\. Marques De Sá, J.P.  _Applied Statistics Using SPSS, Statistica and Matlab_ , 2003.

15\. Mayer, C., Hanenberg, S., Robbes, R., Tanter, É., Stefik, A. An empirical study of the influence of static type systems on the usability of undocumented software. In  _ACM SIGPLAN Notices_ , Volume 47 (2012). ACM, 683–702.

16\. Meyerovich, L.A., Rabkin, A.S. Empirical analysis of programming language adoption. In  _Proceedings of the 2013 ACM SIGPLAN International Conference on Object Oriented Programming Systems Languages & Applications_  (2013). ACM, 1–18.

17\. Milner, R. A theory of type polymorphism in programming.  _J. Comput. Syst. Sci. 17_ , 3 (1978), 348–375.

18\. Mockus, A., Votta, L.G. Identifying reasons for software changes using historic databases. In  _ICSM'00\. Proceedings of the International Conference on Software Maintenance_  (2000). IEEE Computer Society, 120.

19\. Odersky, M., Spoon, L., Venners, B.  _Programming in Scala._  Artima Inc, 2008.

20\. Pankratius, V., Schmidt, F., Garretón, G. Combining functional and imperative programming for multicore software: An empirical study evaluating scala and java. In  _Proceedings of the 2012 International Conference on Software Engineering_  (2012). IEEE Press, 123–133.

21\. Petricek, T., Skeet, J.  _Real World Functional Programming: With Examples in F# and C#._ Manning Publications Co., 2009.

22\. Pierce, B.C.  _Types and Programming Languages._  MIT Press, 2002.

23\. Posnett, D., Bird, C., Dévanbu, P. An empirical study on the influence of pattern roles on change-proneness.  _Emp. Softw. Eng. 16_ , 3 (2011), 396–423.

24\. Tan, L., Liu, C., Li, Z., Wang, X., Zhou, Y., Zhai, C. Bug characteristics in open source software.  _Emp. Softw. Eng._  (2013).

--------------------------------------------------------------------------------

via: https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007

作者：[ Baishakhi Ray][a], [Daryl Posnett][b], [Premkumar Devanbu][c], [Vladimir Filkov ][d]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://delivery.acm.org/10.1145/3130000/3126905/mailto:rayb@virginia.edu
[b]:http://delivery.acm.org/10.1145/3130000/3126905/mailto:dpposnett@ucdavis.edu
[c]:http://delivery.acm.org/10.1145/3130000/3126905/mailto:devanbu@cs.ucdavis.edu
[d]:http://delivery.acm.org/10.1145/3130000/3126905/mailto:filkov@cs.ucdavis.edu
[1]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R6
[2]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R2
[3]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R9
[4]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R7
[5]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R12
[6]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R15
[7]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R5
[8]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R18
[9]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R7
[10]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R8
[11]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R12
[12]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#FNA
[13]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#FNB
[14]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#FNC
[15]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R10
[16]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R17
[17]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R3
[18]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R13
[19]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R24
[20]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R4
[21]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R4
[22]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R4
[23]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R4
[24]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R23
[25]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R14
[26]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R14
[27]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#FND
[28]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R4
[29]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R11
[30]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#FNE
[31]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R7
[32]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R8
[33]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R12
[34]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R20
[35]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R16
[36]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R1
[37]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R19
[38]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R21
[39]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R22
[40]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#comments
[41]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#
[42]:https://cacm.acm.org/about-communications/mobile-apps/
[43]:http://dl.acm.org/citation.cfm?id=3144574.3126905&coll=portal&dl=ACM
[44]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/pdf
[45]:http://dl.acm.org/ft_gateway.cfm?id=3126905&ftid=1909469&dwn=1
[46]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[47]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[48]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t1.jpg
[49]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t1.jpg
[50]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t1.jpg
[51]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t2.jpg
[52]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t2.jpg
[53]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t3.jpg
[54]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t3.jpg
[55]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t3.jpg
[56]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t7.jpg
[57]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t4.jpg
[58]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t4.jpg
[59]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg
[60]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg
[61]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg
[62]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg
[63]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[64]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t6.jpg
[65]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t6.jpg
[66]:http://deliveryimages.acm.org/10.1145/3130000/3126905/ut1.jpg
[67]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t6.jpg
[68]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t7.jpg
[69]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t7.jpg
[70]:http://deliveryimages.acm.org/10.1145/3130000/3126905/ut2.jpg
[71]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f1.jpg
[72]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f1.jpg
[73]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f1.jpg
[74]:http://deliveryimages.acm.org/10.1145/3130000/3126905/ut3.jpg
[75]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg
[76]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f2.jpg
[77]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f2.jpg
[78]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg
[79]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg
[80]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg
[81]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t6.jpg
[82]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f2.jpg
[83]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg
[84]:http://deliveryimages.acm.org/10.1145/3130000/3126905/ut4.jpg
[85]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg
[86]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg
[87]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg
[88]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f2.jpg
[89]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[90]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[91]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[92]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[93]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop


