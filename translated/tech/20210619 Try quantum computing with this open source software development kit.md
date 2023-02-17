[#]: subject: (Try quantum computing with this open source software development kit)
[#]: via: (https://opensource.com/article/21/6/qiskit)
[#]: author: (Gordon Haff https://opensource.com/users/ghaff)
[#]: collector: (lujun9972)
[#]: translator: (cool-summer-021)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

借助开源软件开发包尝试量子计算编程
======
Qiskit 是一个开源 SDK，借助它可以免费访问量子模拟器和硬件资源。

![Tips and gears turning][1]

经典计算机是基于二进制数的，二进制数有0和1两种形式。这并不是由于二进制逻辑系统比有更多基本状态的系统（甚至包括模拟计算机）有内在优势。但是，对电路元件的开关操作很容易实现，而且借助先进的半导体技术，可以制造出体积小且价格低廉的计算机。

但它们并非没有局限性。经典计算机求解某些问题的效率并不高，主要是那些时间或内存成本随着问题的规模(`n`)呈指数级增长的问题。我们把这种问题称为' O(2n) '[大写O表示法][2]。

很多现代加密方法还是基于这种特征的。把两个大素数相乘，耗费的成本低，但进行反向操作就非常耗时。所以只要使用的数字足够大，对它分解质因数就非常困难。

### 进入量子世界

量子计算的基础数学和力学知识不在本文的探讨范围内。然而，还是有一些基础知识需要预先说明。

量子计算机以[量子比特][3]代替了二进制比特——量子比特是体现量子属性的可控计算单元。构成量子比特的既不是超导元件，也不是自然界中存在的量子实物（例如电子）。量子比特可以以叠加状态存在，叠加态是0和1以某种方式组合起来的特俗状态。你可能听说过，量子比特既为 1 又为 0，这种说法并不准确。真实情况是，如果进行测量，量子比特的状态会坍缩为0 或 1。在数学上，量子比特未测量的状态可以看作[布洛赫球面][4]上的一个点。

尽管对习惯使用经典计算机的任何人来说，叠加态是一个全新的概念，量子比特本身并没有什么趣味性。量子计算的第二个概念是“干涉”。真正的量子计算机本质上是统计性质的。量子算法对干涉图案进行编码，增加了可以测量编码方案的状态的概率。

叠加和干涉的概念虽然新颖，但在物理世界中也有对应的现象。量子力学中的“纠缠”虽然没有，但它是实现指数级加速的关键。借助量子纠缠，对一个微观粒子的测量可以影响后续对其他被纠缠的粒子的测量结果——即使是那些物理上没有关联的粒子。

### 量子计算能做什么？

就所含量子比特数（几十个到几百个）而言，如今的量子计算机体积是非常小的。因此，虽然人们不断开发新的算法，但比同级别经典计算机运行得快的硬件还未问世。

但是在很多领域，量子计算机能带来很大好处。例如，它能提供较好的方法来模拟自然界的量子系统，例如分子，其复杂程度超过了经典计算机的建模能力。量子计算也跟线性代数有关，它是机器学习和很多其他优化问题的基础。所以，认为量子计算适合它们的观点是合理的。

在量子算法相对于普通算法的优势方面，[Shor 算法][5] 是经常被提及的例子，它在较早时候就用于分解质因数。由 MIT 的数学家 Peter Shor 于1994 年发明的量子计算机目前还不能在较大的问题上运行算法。但它已经被证明可以在 `O(n3)` 时间内完成工作，而不像经典算法那样需要指数级的时间。

### 从使用 Qiskit 开始

你可能在想：“我身边没有量子计算机，但我很想尝试一下。能做到吗？”

我们来了解一下名称为 [Qiskit][6] 的开源项目（Apache 2.0 认证）。它是一个软件开发包，用于访问量子计算模拟器和 IBM 量子实验室的实际硬件。你需要注册，才能获得 API 密钥。

当然，如果要深入研究Qiskit，需要很多其他方面的知识，线性代数只是其中一部分，这些都远远超出了本文的范围。如果你需要深入学习，网上有很多免费资源，其中也不乏完整的教科书。然而，尝试一下也是直截了当的，只需要一些Python和Jupyter notebook的基础知识即可。

为了增加趣味性，我们全程使用 [Qiskit 文本编辑器][8] 写一个 "Hello, World!" 程序：

首先，安装文本编辑器的相关工具和部件：


```
`pip install git+https://github.com/qiskit-community/qiskit-textbook.git#subdirectory=qiskit-textbook-src`
```

下一步，进行软件包的导入：


```
from qiskit import QuantumCircuit, assemble, Aer
from math import pi, sqrt
from qiskit.visualization import plot_bloch_multivector, plot_histogram
```

Aer 是本地模拟器。Qiskit 包括四个组件：**Aer**，基础组件 **Terra**，用于实际的量子系统上的错误处理的 **Ignis**，以及用于算法开发的 **Aqua**。


```
# Let's do an X-gate on a |0&gt; qubit
qc = QuantumCircuit(1)
qc.x(0)
qc.draw()
```

虽然底层数学原理还涉及到矩阵乘法，量子计算机中 **X-gate** 也可以认为类似于经典计算机中的 **Not gate**。

现在，运行并测量它。结果跟你预期的一样，因为量子比特的初始状态是 `|0>`，接着反转，然后被测量。（使用 `|0>` 和 `|1>` 与经典计算机中的比特区分开来）


```
# Let's see the result
svsim = Aer.get_backend('statevector_simulator')
qobj = assemble(qc)
state = svsim.run(qobj).result().get_statevector()
plot_bloch_multivector(state)
```

![Bloch sphere showing the expected result][9]

布洛赫球体显示了预期的运行结果。

### 结论

在某些方面，你可以把量子计算看作一种用于经典计算机的、独特的协同处理器，跟 GPU 和FPGA 一样。不同的是，在可预见的未来，量子计算机可以被用户像网络资源一样访问到。另一个差异是，它们的工作有本质的不同，所以不像很多其他你熟悉的加速器那样。因此，人们对算法开发如此感兴趣，并投入大量资源来研究量子在何时何地的性能最好。了解一下这些东西也无妨。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/qiskit

作者：[Gordon Haff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ghaff
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
[2]: https://en.wikipedia.org/wiki/Big_O_notation
[3]: https://en.wikipedia.org/wiki/Qubit
[4]: https://en.wikipedia.org/wiki/Bloch_sphere
[5]: https://en.wikipedia.org/wiki/Shor%27s_algorithm
[6]: https://qiskit.org/
[7]: https://qiskit.org/learn
[8]: https://qiskit.org/textbook/preface.html
[9]: https://opensource.com/sites/default/files/uploads/bloch-sphere.png (Bloch sphere showing the expected result)
[10]: https://creativecommons.org/licenses/by-sa/4.0/
