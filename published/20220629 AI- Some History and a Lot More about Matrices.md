[#]: subject: "AI: Some History and a Lot More about Matrices"
[#]: via: "https://www.opensourceforu.com/2022/06/ai-some-history-and-a-lot-more-about-matrices/"
[#]: author: "Deepu Benson https://www.opensourceforu.com/author/deepu-benson/"
[#]: collector: "lkxed"
[#]: translator: "toknow-gh"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16399-1.html"

人工智能教程（二）：人工智能的历史以及再探矩阵
======

![][0]

*在本系列的 [第一篇文章](https://linux.cn/article-16326-1.html) 中，我们讨论了人工智能、机器学习、深度学习、数据科学等领域的关联和区别。我们还就整个系列将使用的编程语言、工具等做出了一些艰难的选择。最后，我们还介绍了一点矩阵的知识。在本文中，我们将深入地讨论人工智能的核心——矩阵。不过在此之前，我们先来了解一下人工智能的历史。*

我们为什么需要了解人工智能的历史呢？历史上曾出现过多次人工智能热潮，但在很多情况下，对人工智能潜力的巨大期望都未能达成。了解人工智能的历史，有助于让我们看清这次人工智浪潮是会创造奇迹，抑或只是另一个即将破灭的泡沫。

我们对人工智能的最寻起源于何时呢？是在发明数字计算机之后吗？还是更早呢？我相信对一个无所不知的存在的追求可以追溯到文明之初。比如古希腊神话中的 <ruby>德尔菲<rt>Delphi</rt></ruby> 就是这样一位能回答任何问题的先知。从远古时代起，对于超越人类智慧的创造性机器的探索同样吸引着我们 。历史上有过几次制造国际象棋机器的失败的尝试。其中就有臭名昭著的<ruby>机械特克<rt>Mechanical Turk</rt></ruby>，它并不是真正的机器人，而是由一位藏在内部的棋手操控的。<ruby>约翰·纳皮尔<rt>John Napier</rt></ruby> 发明的对数、<ruby>布莱斯·帕斯卡<rt>Blaise Pascal</rt></ruby> 的计算器、<ruby>查尔斯·巴贝奇<rt>Charles Babbage</rt></ruby> 的差分机等，这些都是人工智能研究的前身。回顾人类历史，你会发现更多真实或虚构的时刻，人们想要获得超越人脑的智能。如果不考虑以上这些历史成就，对真正人工智能的探索起始于数字计算机的发明。

那么，人工智能发展至今有哪些里程碑呢？前面已经提到，数字计算机的发明是人工智能研究历程中最重要的事件。与可扩展性依赖于功率需求的机电设备不同，数字设备受益于技术进步，比如从真空管到晶体管到集成电路再到如今的超大规模集成技术。

人工智能发展的另一个里程碑是 <ruby>阿兰·图灵<rt>Alan Turing</rt></ruby> 首次对人工智能的理论分析。他提出的 <ruby>图灵测试<rt>Turing test</rt></ruby> 是最早的人工智能测试方法之一。现在图灵测试可能已经不太适用了，但它是定义人工智能的最初尝试之一。图灵测试可以简单描述如下：假设有一台能够与人类对话的机器，如果它能在对话中让人无法分辨它是人还是机器，那么就可以认为这台机器具有智能。如今的聊天机器人非常强大，使我们很容易看出图灵测试无法识别出真正的人工智能。但在 20 世纪 50 年代初，这确实为理解人工智能提供了一个理论框架。

20 世纪 50 年代末，<ruby>约翰·麦卡锡<rt>John McCarthy</rt></ruby> 发明了 Lisp 编程语言。它是最早的高级编程语言之一。在此之前，计算机编程用的是机器语言和汇编语言（众所周知地难用）。有了强大的机器和编程语言，计算机科学家中的乐观主义和梦想家顺理成章地开始用它们来创造人工智能。20 世纪 60 年代初，对人工智能机器的期望达到了顶峰。当然计算机科学领域取得了很大发展，但人工智能的奇迹发生了吗？很遗憾，并没有。20 世纪 60 年代见证了第一次人工智能热潮的兴起和破灭。然而计算机科学以无与伦比的速度继续发展着。

到了 70 年代和 80 年代，算法在这一时期发挥了主要作用。在这段时间，许多新的高效算法被提出。20 世纪 60 年代末<ruby>高德纳·克努特<rt>Donald Knuth</rt></ruby>（我强烈建议你了解一下他，在计算机科学界，他相当于数学界的高斯或欧拉）著名的《<ruby>计算机程序设计艺术<rt>The Art of Computer Programming</rt></ruby>》第一卷的出版标志着算法时代的开始。在这些年中，开发了许多通用算法和图算法。此外，基于人工神经网络的编程也在此时兴起。尽管早在 20 世纪 40 年代，<ruby>沃伦·S.·麦卡洛克<rt>Warren S. McCulloch</rt></ruby>和<ruby>沃尔特·皮茨<rt>Walter Pitts</rt></ruby> 就率先提出了人工神经网络，但直到几十年后它才成为主流技术。今天，深度学习几乎完全是基于人工神经网络的。算法领域的这种发展导致了 20 世纪 80 年代人工智能研究的复苏。然而，这一次，通信和算力的限制阻碍了人工智能的发展，使其未能达到人们野心勃勃的预期。然后是 90 年代、千禧年，直到今天。又一次，我们对人工智能的积极影响充满了热情和希望。

我你们可以看到，在数字时代，人工智能至少有两次前景光明的机会。但这两次人工智能都没有达到它的预期。现在的人工智能浪潮也与此类似吗？当然这个问题很难回答。但我个人认为，这一次人工智能将产生巨大的影响（LCTT 译注：本文发表于 2022 年 6 月，半年后，ChatGTP 才推出）。是什么让我做出这样的预测呢？第一，现在的高性能计算设备价格低廉且容易获得。在 20 世纪 60 年代或 80 年代，只有几台如此强大的计算设备，而现在我们有数百万甚至数十亿台这样的机器。第二，现在有大量数据可用来训练人工智能和机器学习程序。想象一下，90 年代从事数字图像处理的人工智能工程师，能有多少数字图像来训练算法呢？也许是几千或者几万张吧。现在单单数据科学平台 Kaggle（谷歌的子公司）就拥有超过 1 万个数据集。互联网上每天产生的大量数据使训练算法变得容易得多。第三，高速的互联网连接使得与大型机构协作变得更加容易。21 世纪的头 10 年，计算机科学家之间的合作还很困难。如今互联网的速度已经使谷歌 Colab、Kaggle、Project jupiter 等人工智能项目的协作成为现实。由于这三个因素，我相信这一次人工智能将永远存在，并会出现许多优秀的应用。

### 更多矩阵的知识

![图 1：矩阵 A、B、C、D][2]

在大致了解了人工智能的历史后，现在是时候回到矩阵与向量这一主题上了。在上一篇文章中，我已经对它们做了简要介绍。这一次，我们将更深入矩阵的世界。首先看图 1 和 图 2，其中显示了从 A 到 H 共 8 个矩阵。为什么人工智能和机器学习教程中需要这么多矩阵呢？首先，正如前一篇文章中提到的，矩阵是线性代数的核心，而线性代数即使不是机器学习的大脑，也是机器学习的核心。其次，在接下来的讨论中，它们每一个都有特定的用途。

![图 2：矩阵 E、F、G、H][3]

让我们看看矩阵是如何表示的，以及如何获取它们的详细信息。图 3 展示了怎么用 NumPy 表示矩阵 A。虽然矩阵和数组并不完全等价，但实践中我们经常将它们作为同义词来使用。

![图 3：用 NumPy 表示矩阵 A][4]

我强烈建议你仔细学习如何使用 NumPy 的 `array` 函数创建矩阵。虽然 NumPy 也提供了 `matrix` 函数来创建二维数组和矩阵。但是它将在未来被废弃，所以不再建议使用了。在图 3 还显示了矩阵 A 的一些详细信息。`A.size` 告诉我们数组中元素的个数。在我们的例子中，它是 9。代码 `A.nidm` 表示数组的 <ruby>维数<rt>dimension</rt></ruby>。很容易看出矩阵 A 是二维的。`A.shape` 表示矩阵 A 的<ruby>阶数<rt>order</rt></ruby>，矩阵的阶数是矩阵的行数和列数。虽然我不会进一步解释，但使用 NumPy 库时需要注意矩阵的大小、维度和阶数。图 4 显示了为什么应该仔细识别矩阵的大小、维数和阶数。定义数组时的微小差异可能导致其大小、维数和阶数的不同。因此，程序员在定义矩阵时应该格外注意这些细节。

![图 4：数组的大小、维数和阶数][5]

现在我们来做一些基本的矩阵运算。图 5 显示了如何将矩阵 A 和 B 相加。NumPy 提供了两种方法将矩阵相加，`add` 函数和 `+` 运算符。请注意，只有阶数相同的矩阵才能相加。例如，两个 4 × 3 矩阵可以相加，而一个 3 × 4 矩阵和一个 2 × 3 矩阵不能相加。然而，由于编程不同于数学，NumPy 在实际上并不遵循这一规则。图 5 还展示了将矩阵 A 和 D 相加。记住，这种矩阵加法在数学上是非法的。一种叫做 <ruby>广播<rt>broadcasting </rt></ruby> 的机制决定了不同阶数的矩阵应该如何相加。我们现在不会讨论广播的细节，但如果你熟悉 C 或 C++，可以暂时将其理解为变量的类型转换。因此，如果你想确保执行正真数学意义上的矩阵加法，需要保证以下测试为真:

![图 5：矩阵相加][6]

```
A.shape == B.shape
```

广播机制也不是万能的，如果你尝试把矩阵 D 和 H 相加，会产生一个运算错误。

当然除了矩阵加法外还有其它矩阵运算。图 6 展示了矩阵减法和矩阵乘法。它们同样有两种形式，矩阵减法可以由 `subtract` 函数或减法运算符 `-` 来实现，矩阵乘法可以由 `matmul` 函数或矩阵乘法运算符 `@` 来实现。图 6 还展示了 <ruby>逐元素乘法<rt>element-wise multiplication</rt></ruby> 运算符 `*` 的使用。请注意，只有 NumPy 的 `matmul` 函数和 `@` 运算符执行的是数学意义上的矩阵乘法。在处理矩阵时要小心使用 `*` 运算符。

![图 6：更多矩阵运算][7]

对于一个 m x n 阶和一个 p x q 阶的矩阵，当且仅当 n 等于 p 时它们才可以相乘，相乘的结果是一个 m x q 阶矩的阵。图 7 显示了更多矩阵相乘的示例。注意 `E@A` 是可行的，而 `A@E` 会导致错误。请仔细阅读对比 `D@G` 和 `G@D` 的示例。使用 `shape` 属性，确定这 8 个矩阵中哪些可以相乘。虽然根据严格的数学定义，矩阵是二维的，但我们将要处理更高维的数组。作为例子，下面的代码创建一个名为 T 的三维数组。

![图 7：更多矩阵乘法的例子][8]

```
T = np.array([[[11,22], [33,44]], [[55,66], [77,88]]])
```

### Pandas

到目前为止，我们都是通过键盘输入矩阵的。如果我们需要从文件或数据集中读取大型矩阵并处理，那该怎么办呢？这时我们就要用到另一个强大的 Python 库了——Pandas。我们以读取一个小的 CSV （<ruby>逗号分隔值<rt>comma-separated value</rt></ruby>）文件为例。图 8 展示了如何读取 `cricket.csv` 文件，并将其中的前三行打印到终端上。在本系列的后续文章中将会介绍 Pandas 的更多特性。

![图 8：用 Pandas 读取 CSV 文件][9]

### 矩阵的秩

矩阵的 <ruby>秩<rt>Rank</rt></ruby> 是由它的行（列）张成的向量空间的维数。如果你还记得大学线性代数的内容的话，你一定对维数、向量空间和张成还有印象，那么你也应该能理解矩阵的秩的含义了。但如果你不熟悉这些术语，那么可以简单地将矩阵的秩理解为矩阵中包含的信息量。当然，这又是一种未来方便理解而过度简化的说法。图 9 显示了如何用 NumPy 求矩阵的秩。矩阵 A 的秩为 3，因为它的任何一行都不能从其它行中得到。矩阵 B 的秩为 1，因为第二行和第三行可以由第一行分别乘以 2 和 3 得到。矩阵 C 只有一个非零行，因此秩为 1。同样的，其它矩阵的秩也不难理解。矩阵的秩与我们的主题关系密切，我们会在后续文章中再提到它。

![图 9：求矩阵的秩][10]

本次的内容就到此结束了。在下一篇文章中，我们将扩充工具库，以便它们可用于开发人工智能和机器学习程序。我们还将更详细地讨论 <ruby>神经网络<rt>neural network</rt></ruby>、<ruby>监督学习<rt>supervised learning</rt></ruby>、<ruby>无监督学习<rt>unsupervised learning</rt></ruby> 等术语。此外，从下一篇文章开始，我们将使用 JupyterLab 代替 Linux 终端。

*（题图：MJ/ce77d714-3651-44e4-96b0-ffbf7ae4269c）*

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/ai-some-history-and-a-lot-more-about-matrices/

作者：[Deepu Benson][a]
选题：[lkxed][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/deepu-benson/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/06/AI-Some-History-and-a-Lot-More-about-Matrices-1.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-1-Matrices-A-B-C-and-D.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-2-Matrices-E-F-G-and-H.jpg
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-3-Matrix-A-with-NumPy-350x167.jpg
[5]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-4-Size-dimension-and-shape-of-an-array-350x292.jpg
[6]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-5-Matrix-addition-350x314.jpg
[7]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-6-More-matrix-operations-1-350x375.jpg
[8]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-7-More-examples-of-matrix-multiplication-590x293.jpg
[9]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-8-Reading-a-CSV-file-with-Pandas-350x123.jpg
[10]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-9-Finding-the-rank-of-a-matrix-350x366.jpg
[0]: https://img.linux.net.cn/data/attachment/album/202311/20/150356w8cvn62a82uvgc8a.png