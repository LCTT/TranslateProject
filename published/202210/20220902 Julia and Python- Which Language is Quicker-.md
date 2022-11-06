[#]: subject: "Julia and Python: Which Language is Quicker?"
[#]: via: "https://www.opensourceforu.com/2022/09/julia-and-python-which-language-is-quicker/"
[#]: author: "B Thangaraju https://www.opensourceforu.com/author/b-thangaraju/"
[#]: collector: "lkxed"
[#]: translator: "Return7g"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15096-1.html"

Julia 和 Python，哪一个更快？
======

![](https://img.linux.net.cn/data/attachment/album/202210/02/122529vdztvds1ttqez1ts.jpg)

Julia 是一门高度抽象的动态编程语言。虽然它是一门能够开发所有程序的通用语言，但它有几个特点，非常适用于科学计算和数值计算。Python 在 1990 年初作为一种简单的面向对象的程序语言出现，如今已经有了显著的发展。本文将从它们在神经网络和机器学习的性能表现上进行讨论。

Julia 的架构以动态语言中的<ruby>参数多态性<rt>parametric polymorphism</rt></ruby>和<ruby>多重派发<rt>multiple dispatch</rt></ruby>的编程范式为主要特色。它允许使用或不使用<ruby>消息传递接口<rt>message passing interface</rt></ruby>（MPI）或内置的 “OpenMP 式” 线程进行并发、并行和分布式计算，以及直接调用 C 和 FORTRAN 库而无需额外的代码。Julia 使用 <ruby>即时<rt>just-in-time</rt></ruby>（JIT）编译器，Julia 社区将其称为 “<ruby>即时预编译<rt>just-ahead-of-time</rt></ruby>（JAOT）”，因为它在运行之前默认将所有代码编译为机器码。

与 Python 不同，Julia 是专为统计学和机器学习而设计的。Julia 可以快速的完成线性代数的运算，但 Python 很慢。这是因为 Python 从来都不是为了适应机器学习用到的矩阵和方程而设计的。Python 本身并不差，特别是 Numpy，但在没有使用包的情况下，Julia 更像是为数学量身定制的。相比 Python，Julia 的运算符更像 R，这是一个显著的优势。大部分的线性代数运算可以用更少的时间和精力去完成。

众所周知，近年来 Python 在机器学习和数据科学领域占据主导地位。因为在 Python 中我们可以使用各种各样的第三方库来帮助我们编写机器学习的代码。虽然 Python 有这么多优势，但仍有一个主要的缺点——它是一门解释性语言，速度非常慢。现在是数据时代，数据越多我们处理它的时间就越长，这也是 Julia 出现的理由。

到目前为止，有关 Julia 的研究工作都集中在高性能或者 Julia 的科学计算能力等主题上。但在这里，我们将讨论 Julia 不仅能够有效地处理复杂的科学计算，还能够处理基于商业的问题，以及像 Python 一样处理机器学习和神经网络。

### 实验目标与实验设计

Julia 像 Python 一样简洁，但却像 C 一样是一门编译语言。首先我们来测试 Julia 要比 Python 快多少。为此，我们先在一些简单的程序上测试它们，然后来到我们实验的重点，测试它们的机器学习和深度学习能力。

Julia 和 Python 都提供了许多库和开源的基准测试工具。为了在 Julia 中进行基准测试和计算时间，我们使用了 `CPUTime` 和 `time` 库；对于 Python，我们同样使用了 `time` 模块。

### 矩阵乘法

一开始我们尝试了简单的算术运算，但由于这些运算不会产生太大的时间差异，我们决定比较矩阵乘法的时间差异。我们创建了两个 `(10 * 10)` 的随机浮点数矩阵，并对它们施以点积。众所周知，Python 有一个 `Numpy` 库，常被用于计算矩阵和向量。而 Julia 也有一个 `LinearAlgebra` 库，常用于计算矩阵和向量。因此我们分别比较了各自使用和不使用库的矩阵乘法的耗时。本文用到的所有源码已经放在了 [GitHub 存储库][1]。下面给出了用 Julia 编写的 10×10 矩阵乘法程序：

```
@time LinearAlgebra.mul!(c,x,y)
 
function MM()
x = rand(Float64,(10,10))
y = rand(Float64,(10,10))
c = zeros(10,10)
 
for i in range(1,10)
for j in range(1,10)
for k in range(1,10)
c[i,j] += x[i,k]*y[k,j]
end
end
end
end
@time MM
 
0.000001 seconds
MM (generic function with 1 method)
```

Julia 使用库耗时 0.000017 秒，使用循环耗时 0.000001 秒。

使用 Python 编写相同的矩阵乘法程序如下。 从结果可以发现，与不使用库相比，使用库的程序花费的时间更少：

```
import numpy as np
import time as t
x = np.random.rand(10,10)
y = np.random.rand(10,10)
start = t.time()
z = np.dot(x, y)
print(“Time = “,t.time()-start)
Time = 0.001316070556640625
 
import random
import time as t
l = 0
h= 10
cols = 10
rows= 10
 
choices = list (map(float, range(l,h)))
x = [random.choices (choices , k=cols) for _ in range(rows)]
y = [random.choices (choices , k=cols) for _ in range(rows)]
 
result = [([0]*cols) for i in range (rows)]
 
start = t.time()
 
for i in range(len(x)):
for j in range(len(y[0])):
for k in range(len(result)):
result[i][j] += x[i][k] * y[k][j]
 
print(result)
print(“Time = “, t.time()-start)
 
Time = 0.0015912055969238281
```

Python 使用库耗时 0.0013 秒，使用循环耗时 0.0015 秒。

### 线性搜索

我们进行的下一个实验是对十万个随机生成的数字进行线性搜索。这里使用了两种方法，一种是使用 `for` 循环，另一种是使用运算符。我们使用 1 到 1000 的整数执行了 1000 次搜索，正如你在下面的输出中看到的那样，我们还打印了我们在数据集中找到了多少个整数。下面给出了使用循环和使用 `IN` 运算符的时间。这里我们使用了 CPU 3 次运行时间的中位数。

使用 Julia 编写的程序和运行结果如下：

（LCTT 译注：此处原文缺失 Julia 代码）

使用 Python 编写的程序和运行结果如下：

```
import numpy as np
import time as t
x = np.random.rand(10,10)
y = np.random.rand(10,10)
start = t.time()
z = np.dot(x, y)
print(“Time = “,t.time()-start)
Time = 0.001316070556640625
 
import random
import time as t
l = 0
h= 10
cols = 10
rows= 10
 
choices = list (map(float, range(l,h)))
x = [random.choices (choices , k=cols) for _ in range(rows)]
y = [random.choices (choices , k=cols) for _ in range(rows)]
 
result = [([0]*cols) for i in range (rows)]
 
start = t.time()
 
for i in range(len(x)):
for j in range(len(y[0])):
for k in range(len(result)):
result[i][j] += x[i][k] * y[k][j]
 
print(result)
print(“Time = “, t.time()-start)
 
Time = 0.0015912055969238281
```

```
FOR_SEARCH:
Elapsed CPU time: 16.420260511 seconds
matches: 550
Elapsed CPU time: 16.140975079 seconds
matches: 550
Elapsed CPU time: 16.49639576 seconds
matches: 550

IN:
Elapsed CPU time: 6.446583343 seconds
matches: 550
Elapsed CPU time: 6.216615487 seconds
matches: 550
Elapsed CPU time: 6.296716556 seconds
matches: 550
```

从以上结果来看，在 Julia 中使用循环和运算符并不会产生显著的时间差异。但是在 Python 中循环几乎比运算符 IN 多花了三倍的时间。有趣的是，在这两种情况下，Julia 都比 Python 快得多。

### 线性回归

下一个实验是测试机器学习算法。我们选择了以一种最常见和最简单的机器学习算法，使用简单数据集的线性回归。我们使用了一个包含 237 条数据的数据集 “Head Brain”，数据集的两列分别为 “HeadSize” 和 “BrainWeight”。接下来，我们使用 “head size” 数据去计算 “brain weight”。在 Python 和 Julia 中我们都没有使用第三方库，而是从零实现了线性回归算法。

Julia：

```
GC.gc()
@CPUtime begin
linear_reg()
end
elapsed CPU time: 0.000718 seconds
```

Python：

```
gc.collect()
start = process_time()
linear_reg()
end = process_time()

print(end-start)
elapsed time: 0.007180344000000005
```

上面给出了 Julia 和 Python 所花费的时间。

### 逻辑回归

接下来，我们使用两种语言的库对最常见的机器学习算法（即逻辑回归）进行了实验。对于 Python 我们使用最常见的库 `sklearn`；对于 Julia，我们使用 `GLM` 库。我们在这里用到的数据集是有关银行客户的信息，其中包含 10,000 个数据条目。目标变量是一个二元变量，区分消费者是否继续使用银行账户。

下面给出了 Julia 进行逻辑回归所花费的时间：

```
@time log_rec()
0.027746 seconds (3.32 k allocations: 10.947 MiB)
```

下面给出了 Python 进行逻辑回归所花费的时间：

```
gc.collect()
start = process_time()
LogReg()
end = process_time()
print(end-start)

Accuracy : 0.8068
0.34901400000000005
```

### 神经网络

在各种程序和数据集上测试这两种语言后，我们在神经网络上使用 MNIST 数据集继续测试它们。该数据集包含从零到九的手绘数字的灰度图像。每张图像为 28×28 像素。每个像素值表示该像素的亮度或暗度，该值是包含 0 到 255 之间的整数。该数据还包含一个标签列，该列表示在相关图像中绘制的数字。

![Figure 1: Example of MNIST data set][2]

图 1 是 MNIST 数据集的示例。
 
对两种语言我们都建立了一个简单的神经网络来测试它们耗费的时间。神经网络的结构如下：

```
Input ---> Hidden layer ---> Output
```

该神经网络包含了一个输入层、隐层还有输出层。为了避免神经网络的复杂度过高，我们对数据集没有进行任何的预处理工作。在 Julia 和 Python 中我们都进行了40次训练并比较它们的时间差异。

![Figure 2: Julia takes 5.76 seconds in a neural network][3]

在 Julia 中，`Flux` 库通常被用于建立神经网络；在 Python 中我们常使用 `Keras` 库。图 2 展示了 Julia 在神经网络上的耗时。图 3 展示了 Python 的神经网络经过了若干次训练的耗时。

![Figure 3: Python takes 110.3 seconds in a neural network][4]

这个结果展示了 Julia 和 Python 在处理神经网络时存在巨大的时间差异。

表 1 总结了此次实验的测试结果并计算了 Julia 和 Python 时间差异的百分比。

| 实验 | Julia（秒） | Python（秒） | 时间差（%） | 
| :- | :- | :- | :- |
| 矩阵乘法（不使用库） | 0.000001 | 0.0015 | 99.9 | 
| 矩阵乘法（使用库） | 0.000017 | 0.0013 | 98.69 | 
| 线性搜索（使用循环） | 0.42 | 16.4 | 97.43 | 
| 线性搜索（使用 IN 操作符） | 0.43 | 6.2 | 93.06 | 
| 线性回归 | 0.000718 | 0.00718 | 90 | 
| 逻辑回归 | 0.025 | 0.34901 | 92.83 | 
| 神经网络 | 5.76 | 110.3 | 94.77 |

我们进行的所有实验都表明，随着程序复杂性以及数据集大小的增加，Julia 和 Python 之间的执行时间差异也会增加。由这个结果我们可以推断，Julia 是一门更适合机器学习和神经网络的编程语言。


--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/julia-and-python-which-language-is-quicker/

作者：[B Thangaraju][a]
选题：[lkxed][b]
译者：[Return7g](https://github.com/Return7g)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/b-thangaraju/
[b]: https://github.com/lkxed
[1]: https://github.com/mr-nerdster/Julia_Research.gitsee
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/07/Figure-1-Example-of-MNIST-data-set.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/07/Figure-2-Julia-takes-5.76-seconds-in-a-neural-network.jpg
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/07/Figure-3-Python-takes-110.3-seconds-in-a-neural-network.jpg
