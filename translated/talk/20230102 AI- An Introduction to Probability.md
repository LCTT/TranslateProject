[#]: subject: "AI: An Introduction to Probability"
[#]: via: "https://www.opensourceforu.com/2023/01/ai-an-introduction-to-probability/"
[#]: author: "Deepu Benson https://www.opensourceforu.com/author/deepu-benson/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "toknow-gh"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

人工智能教程（四）：概率论入门
======

<https://www.opensourceforu.com/wp-content/uploads/2022/09/Tensorflow-robot.jpg>

在本系列的[上一篇文章](https://linux.cn/article-16436-1.html)中，我们进一步讨论了矩阵和线性代数，并学习了用 JupyterLab 来运行 Python 代码。在本系列的第四篇文章中，我们将开始学习 TensorFlow，这是一个非常强大的人工智能和机器学习库。我们也会简要介绍一些其它有用的库。稍后，我们将讨论概率、理论以及代码。和往常一样，我们先讨论一些能拓宽我们对人工智能的理解的话题。

到目前为止，我们只是从技术方面讨论人工智能。随着越来越多的人工智能产品投入使用，现在是时候分析人工智能的社会影响了。想象一个找工作的场景，如果你的求职申请由人来处理，在申请被拒绝时，你可以从他们那里得到反馈，比如被拒的理由。如果你的求职申请由人工智能程序处理，当你的申请被拒绝时，你不能要求该人工智能软件系统提供反馈。在这种情况下，你不能确定你的申请被拒绝是否确实是仅基于事实的决定。这明确地告诉我们，从长远来看，我们需要的不仅仅是魔法般的结果，还需要人工智能具有<ruby>责任<rt>accountability</rt></ruby>和<ruby>保证<rt>guarantee</rt></ruby>。（LCTT 译注：责任主要指确保系统的决策过程是透明的、可解释的，并且对系统的行为负责。保证是指对于系统性能指标和行为的一种承诺或者预期。）目前有很多试图回答这些问题的研究。

人工智能的应用也会引发许多道德和伦理上的问题。我们不必等到强人工智能（也被称为<ruby>通用人工智能<rt>artificial general intelligence</rt></ruby>）出现才研究它的社会影响。我们可以通过思想实验来探究人工智能的影响。想象你在一个雨夜你驾车高速行驶在道路上，突然你眼前有人横穿马路，你的反应是什么？如果你突然刹车或转向，你自己的生命将处于极大的危险之中。但如果你不这样做，过马路的人恐怕凶多吉少。因为我们人类具有自我牺牲的特质，在决策的瞬间，即使是最自私的人也可能决定救行人。但我们如何教会人工智能系统模仿这种行为呢？毕竟从纯粹的逻辑来看，自我牺牲是一个非常糟糕的选择。

同样的场景下，如果汽车是由人工智能软件在驾驶会发生什么呢？既然你是汽车的主人，那么人工智能软件理应把你的安全放在首位，它甚至全不顾其他乘客的安全。很容易看出，如果世界上所有的汽车都由这样的软件控制的话将导致彻底的混乱。现在，如果进一步假设乘坐自动驾驶汽车的乘客身患绝症。那么对于一个数学机器来说，为了行人牺牲乘客是合乎逻辑的。但对于我们这些有血有肉的人却不见得如此。 你可以花点时间思考一下其它场景，比较逻机器和热血的人类都会做出什么样的决策。

有很多书籍和文章在讨论人工智能全面运作后的政治、社会和伦理方面的问题。但对于我们这些普通人和计算机工程师来说，读所有的书都是不必要的。然而，由于人工智能的社会相关性如此重要，我们也不能轻易搁置这个问题。为了了解人工智能的社会政治方面，我建议你通过几部电影来理解人工智能（强人工智能）如何影响我们所有人。斯坦利·库布里克的杰作《2001 太空漫游》是第一部描绘超级智能生物如何俯视我们人类的电影。这部电影中人工智能认为人类是世界最大的威胁，并决定毁灭人类。事实上，有相当多的电影都在探索这种情节。由伟大的艺术大师史蒂文·斯皮尔伯格亲自执导的《人工智能》，探讨了人工智能机器如何与人类互动。另一部名为《机械姬》的电影详细阐述了这一思路，讲述了具有人工智能的机器。在我看来这些都是了解人工智能的影响必看的电影。

最后一点，如果马路上的汽车使用来自制造商的不同的自动驾驶规则和人工智能将导致彻底的混乱。

### TensorFlow 入门

TensorFlow 是由 Google Brain 团队开发的一个免费的开源库，使用 Apache 2.0 许可证。TensorFlow 是开发人工智能和机器学习程序的重量级的库。除了 Python 之外，TensorFlow 还提供 C++、Java、JavaScript 等编程语言的接口。在我们进一步讨论之前，有必要解释一下<ruby>张量<rt>tensor</rt></ruby>是什么。如果你熟悉物理学，张量这个词对你来说可能并不陌生。但如果你不知道张量是什么也不用担心，现阶段把它看作多维数组就行了。当然，这是一种过度简化的理解。TensorFlow 可以处理 NumPy 多维数组。

首先，我们要在 JupyterLab 中安装 TensorFlow。TensorFlow 有 GPU 版本和 CPU 版本两种安装类型可以选择。这主要取决于你的系统是否有合适的 GPU。GPU 是一种利用并行处理来加快图像处理速度的电路。它被广泛用在游戏和设计领域，在开发人工智能和机器学习程序时也是必不可少的硬件。但一个不太好的消息是 TensorFlow 只兼容 NVIDIA 的 GPU。此外，你需要在系统中安装一个称为 CUDA（compute unified device architecture）的并行计算平台。如果你的系统满足这些要求，那么在 JupyterLab 上执行命令 `pip install tensorflow-gpu` 来安装 GPU 版本的 TensorFlow。如果你系统的 GPU 配置无法满足要求，当你尝试使用 TensorFlow 时，会得到如下错误消息：“CUDA_ERROR_NO_DEVICE: no CUDA-capable device is detected”。此时使用 `pip uninstall tensorflow-gpu` 卸载 GPU 版本的 TensorFlow。然后执行命令 `pip install tensorflow` 安装 CPU 版本的 TensorFlow。现在 TensorFlow 就准备就绪了。请注意，目前我们将讨论限制在 CPU 和 TensorFlow 上。

![图 1：第一个使用 TensorFlow 的 Python 脚本][1]

现在，让我们运行第一个由 TensorFlow 驱动的 Python 代码。图 1 显示了一个简单的 Python 脚本及其在 JupyterLab 上执行时的输出。前两行代码将库 NumPy 和 TensorFlow 导入到 Python 脚本中。顺便一提，如果你想在 Jupyter Notebook 单元中显示行号，单击菜单 “View>Show Line Numbers”。第 3 行使用NumPy 创建了一个名为 `arr` 的数组，其中包含三个元素。第 4 行代码将数组 `arr` 的每个元素乘 3，将结果存储在一个名为 `ten` 的变量中。第 5 行和第 6 行分别打印变量 `arr` 和 `ten` 的类型。从代码的输出中可以看到，`arr` 和 `ten` 的类型是不同的。第 7 行打印变量 `ten` 的值。注意，`ten` 的形状与数组 `arr` 的形状是相同的。 数据类型 `int64` 在本例中用于表示整数。这使得本例中 NumPy 和 TensorFlow 数据类型之间的无缝转换成为可能。

TensorFlow 支持很多操作和运算。随着处理的数据量的增加，这些操作会变得越来越复杂。TensorFlow 支持常见的算术运算，比如乘法、减法、除法、幂运算、模运算等。如果参与运算的是列表或元组，TensorFlow 会逐元素执行该操作。

![图 2：TensorFlow 中的逐元素操作][2]

TensorFlow 还支持逻辑运算、关系运算和位运算。这里的操作也是按元素执行的。图 2 显示了执行这些按元素操作的 Python 脚本。第 1 行代码从列表创建一个张量，并将其存储在变量 `t1` 中。TensorFlow 的函数 `constant()` 用于从 Python 对象（如列表、元组等）创建张量。类似地，第 2 行创建了另一个张量 `t2`。第 3 行和第 4 行都是执行逐元素求幂并打印输出。从图 2 中可以清楚地看出，该求幂的结果是相同的。第 5 行代码比较张量 `t1` 和 `t2` 的元素并打印结果。输出中的 `[True True False]` 分别是对应 3>2、4>3 和 2>6 的结果。第 6 行的输出与之类似。

图 3 展示了 TensorFlow 处理矩阵的例子。第 1 行和第 3 行分别构造两个矩阵 `x` 和 `y`，第 2 行和第 4 行分别打印矩阵 `x` 和 `y`的形状。代码的输出显示`x` 的形状为`(3,3)`，`y` 的形状为`(3，)`。从本系列前面介绍的矩阵知识，我们知道这两个矩阵是不能相乘的。

![图 3：TensorFlow 矩阵乘法][3]

因此，在第 5 行中将矩阵 `y` 增加了一个维度。在第 6 行，再次打印矩阵 `y` 的形状，输出结果为 `(3,1)`。现在矩阵 `x` 和 `y` 可以相乘了。第 7 行中，将矩阵相乘并打印输出。注意，类似的操作也可以在张量上执行，即使张量的维数很高，TensorFlow 也可以很好地扩展。在本系列的后续文章中，我们将更多地了解 TensorFlow 支持的数据类型和其他复杂操作。

既然介绍了 TensorFlow，我想我也应该提一下 Keras。它为 TensorFlow 提供 Python 接口。在后续的文章中，我们将专门介绍 Keras。

我们如何利用非 NVIDIA GPU 的能力呢？有许多功能强大的软件包可以做到这一点。比如 PyOpenCL，一个在 Python 中编写并行程序的框架。它让我们可以使用 OpenCL（开放计算语言，open computing language）。OpenCL 可以与 AMD、Arm、NVIDIA 等厂商的 GPU 进行交互。当然还有其他选择，比如 Numba。它是一种JIT 编译器，可用在代码执行期间将 Python 代码编译为机器码。如果 GPU 可用，Numba 允许代码使用的 GPU 能力。图 4 是展示了使用 Numba 的 Python 代码。
我们可以看到函数 `fun()` 具有允许并行化的特征。从图 4 中可以看到，代码在不使用和使用 Numba 的情况下的答案是相同的。但是我们可以看到所花费的执行时间是不同的。当使用 Numba 并行化代码时，只花费了不到一半的时间。此外随着问题规模的增加，并行化和非并行化版本所花费的时间之间的差距也将增加。

![图 4：使用 Numba 进行并行化][4]

### SymPy 入门

SymPy 是一个用于符号计算的 Python 库。通过图 5 中的例子，让我们试着理解什么是符号计算。它使用 SymPy 提供的函数 `Integral()`来求积分。图 5 也显示了这个符号计算的输出。注意，SciPy 提供的 `integrate()` 函数返回数值计算结果，而 SymPy 的 `Integral()` 函数能提供精确的符号结果表达式。人工智能和机器学习程序开发中会用到一些统计学操作，SymPy 在执行这些操作时非常有用。

![图 5：符号计算的例子][5]

在本系列的下一篇文章中，我们将讨论 Theano。Theano 是一个 Python 库和优化编译器，用于计算数学表达式。

### 概率论入门

现在是概率论出场的时候了，它是人工智能和机器学习的另一个重要话题。对概率论的详细讨论超出了本系列的范围。我强烈建议在继续阅读之前，先通过维基百科上关于“概率”、“贝叶斯定理”和“标准差”的文章了解一些重要的术语和概念，如概率、独立事件、互斥事件、条件概率、贝叶斯定理、均值、标准差等。学习完这些后，你将能够轻松理解后面关于概率的讨论。

我们从概率分布开始讲起。根据维基百科的说法，“概率分布是一个数学函数，它能给出一个实验中不同可能结果发生的概率”。现在，让我们试着理解什么是概率分布函数。最著名的概率分布函数是正态分布，通常也称为高斯分布（以伟大的数学家高斯的名字命名）。正态分布函数的图像是一条钟形曲线。图 6 是一个钟形曲线的例子。钟形曲线的确切形状取决于均值和标准差。让我们试着通过分析一种自然现象来理解钟形曲线。从网上可以查到，中国男性的平均身高约为1.7米。在我们周围的到多数男性的身高都非常接近这个数字。你看到一个身高低于1.4米或高于2米的男人的可能性很小。如果记录 100 万人的身高，然后以横轴为身高，纵轴为该身高的人数，绘制统计结果，你会发现绘制出的图像近似为钟形曲线，其中只有一些轻微的倾斜和弯曲。因此，正态分布很容易地捕捉到自然现象的概率特征。

![图 6：钟形曲线（图像来源：维基百科）][6]

现在，我们来看一个使用正态分布的例子。图 7 的代码中我们使用 NumPy 的正态分布的函数 `normal()`，然后使用 Matplotlib 进行绘图。从第 3 行我们可以看到样本大小为 1000。第 4 行绘制一个包含 1000 个<ruby>桶<rt>bin</rt></ruby>的直方图。但是图 7 的钟形曲线与图 6 中看到的钟形曲线相差很大。究其原因是我们的样本数量只有 1000。样本量应该足够大才能获得更清晰的图像。将第 3 行代码替换为 `sample = normal(size=100000000)`，行并再次执行程序。图 8 显示了一条更好的钟形曲线。这一次，我们的样本大小为 100,000,000，钟形曲线与图 6 所示非常相似。正态分布和钟形曲线只是开始。在下一篇文章中，我们将讨论可以概括其他事件和自然现象的概率分布函数。下一次，我们还将更正式地讨论这个主题。

![图 7：绘制钟形曲线][7]

本篇的内容就到此结束了。在下一篇文章中，我们将继续探索概率和统计中的一些概念。我们还将安装和使用 Anaconda，这是一个用于科学计算的 Python 发行版，对于开发人工智能、机器学习和数据科学程序特别有用。如前所述，我们还将熟悉另一个名为 Theano 的 Python 库，它在人工智能和机器学习领域被大量使用。

![图 8：更好的钟形曲线][8]

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2023/01/ai-an-introduction-to-probability/

作者：[Deepu Benson][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/deepu-benson/
[b]: https://github.com/lujun9972
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/09/Figure-1-Our-first-Python-script-using-TensorFlow.png
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/09/Figure-2-Element-wise-operation-in-TensorFlow-1-590x234.png
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/09/Figure-3-Matrix-multiplication-with-TensorFlow-590x347.png
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/09/Figure-4-Parallelization-with-Numba-590x523.png
[5]: https://www.opensourceforu.com/wp-content/uploads/2022/09/Figure-5-An-example-for-symbolic-calculation-590x233.png
[6]: https://www.opensourceforu.com/wp-content/uploads/2022/09/Figure-6-A-bell-Curve-Courtesy-Wikipedia-1-590x295.png
[7]: https://www.opensourceforu.com/wp-content/uploads/2022/09/Figure-7-Plotting-a-bell-curve.png
[8]: https://www.opensourceforu.com/wp-content/uploads/2022/09/Figure-8-A-better-bell-curve-2-590x344.png
