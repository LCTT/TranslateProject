[#]: subject: "Math is fun with this Linux graphing calculator"
[#]: via: "https://opensource.com/article/22/2/kalgebra-linux-calculator"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14343-1.html"

这个 Linux 图形计算器让数学很有趣
======

> 就像你在高中时最喜欢的图形计算器一样，KAlgebra 是科学计算器的同时还有 2D 绘图仪等功能。

![](https://img.linux.net.cn/data/attachment/album/202203/10/094459uyvi79oza97iwwkp.jpg)

如果你在高中时期一直盯着 TI-80 系列计算器，但后来就在也没动过它，那么你有时可能会渴望重温那些激动人心的代数和微积分岁月。Linux KDE 项目中的某个人一定也有这种感觉，因为有个 KDE 框架库 Analitza 提供了相关的语法和小部件，使你能够使用 K 系列应用（如图形计算器 KAlgebra）执行高级数学函数。

### 在 Linux 上安装 KAlgebra

在 Linux 上，你可以从软件仓库安装 KAlgebra。例如，在 Fedora、Mageia 和类似设备上：

```
$ sudo dnf install kalgebra
```

在 Elementary、Linux Mint 和其他基于 Debian 的发行版上：

```
$ sudo apt install kalgebra
```

或者，你可以 [以 flatpak 安装它][2]。

### Linux 计算器

KAlgebra 与学校中使用的许多著名图形计算器一样，既是科学计算器又是 2D 绘图仪。但与我曾经使用过的任何图形计算器不同，它也是一个 3D 绘图仪。但在进入 3D 空间之前，先从一些基本语法开始。

在 KAlgebra 中表示方程时，你必须对数学符号进行一些小的翻译，因为它们通常是手写的，需要了解它们在计算机上的表示方式。例如，要将华氏度转换为摄氏度，公式为：(5÷9) × (n-32)，其中 n 是华氏度。这通常是方程和数学函数的表达方式：它们使用 ÷ 和 × 之类的特殊符号以及 n 之类的变量，然后它们确定哪个变量代表什么样的值。你不一定知道每个特殊数学符号的含义，但只要你知道特殊符号具有特定含义，那么你就可以查找它。在温度转换示例中，符号很常见，因此你可能已经知道 ÷ 表示除法，× 表示乘法。

在 KAlgebra 中，与大多数编程语言一样，除法由正斜杠表示，乘法由星号表示，因此转换 70 华氏度的等式为 `(5/9)*(70-32)`。

KAlgebra 中还有用于常见数学运算的特殊功能，当你在 KAlgebra 中输入任何字母时，工具提示会为可用的函数提供潜在的自动补全功能。在 KAlgerbra 中编写温度转换方程的另一种方法是使用     `times` 函数：`times(5/9, 70-32)`。

当你完成数学问题时，已确定的变量会列在计算器的右栏中，包括 `ans` 值，该值会根据已完成方程的答案进行更新。那么理论上，你应该能够反转转换并从 `ans` 得出华氏温度。

![Temperature conversion in KAlgebra][3]

### 图形计算器

数字很有趣，但当它们被用来绘制形状时，它们才真正变得有趣。图形上二维空间的可视化是所有学科发展的一项重要技能，其中最重要的是计算机编程。

要在图形上画一条线，你必须设置一个水平值（x 轴）或一个垂直值（y 轴），或者两者都设置。在常见的数学符号中，一条有效的直线方程就是 `x=5`。这会在图形的 0 原点上方 5 点处生成一条水平直线。然而，在 KAlgebra 中，你必须明确表示你只想用符号 `x->5` 来设置 x 值。

![A line in KAlgebra][5]

除此之外，绘图与其他地方一样简单。你可以编写复杂的方程式，并且可以使用特殊函数，例如 `sin`。

![Sin wave and an s-curve][6]

### Linux 上的 3D 图

当你进入 3D 图形选项卡时，你可能已经很好地理解了 KAlgebra 的语法，并且也超出了我的数学知识。我从电子学和合成中学到了关于笛卡尔图的所有知识，所以我对 3D 图最有趣的事情是将正弦波可视化为 3D 对象：

![Sine waves in space][7]

3D 图表和 2D 图表（除了一维）之间的区别在于 3D 图表中只能有一个图，因此请明智地选择方程式。

### 数学可以有趣吗？

事实证明，是的，数学可以很有趣，答案就是一个很好的图形计算器。当我一直在通过数学课来弥补过去一些相当糟糕的数学成绩时，我想要是能使用计算器就好了。我发现 KAlgebra 是一个非常有用的工具，不仅可以解决任意问题，还可以理解方程的语法，以及函数的目的。无论你的数学成绩如何，请拿出你的 KAlgebra 计算器，运行一些数字。这真是非常有趣。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/kalgebra-linux-calculator

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/kalgebra-header.jpg?itok=BVm5kMq2 
[2]: https://opensource.com/article/21/11/install-flatpak-linux
[3]: https://opensource.com/sites/default/files/kalgebra-temperature_0.jpg (Temperature conversion in KAlgebra)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/kalgebra-line-x.jpg (A line in KAlgebra)
[6]: https://opensource.com/sites/default/files/kalgebra-sin.jpg (Sin wave and an s-curve)
[7]: https://opensource.com/sites/default/files/kalgebra-sin-3d.jpg (Sine waves in space)
