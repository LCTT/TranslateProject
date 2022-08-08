[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14792-1.html)
[#]: subject: (Djinn: A Code Generator and Templating Language Inspired by Jinja2)
[#]: via: (https://theartofmachinery.com/2021/01/01/djinn.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Djinn：一个受 Jinja2 启发的代码生成器和模板语言
======

![](https://img.linux.net.cn/data/attachment/album/202207/04/101711nq2we7z7x7wz2z7e.jpg)

代码生成器是非常有用的工具。我有时使用 [jinja2][1] 的命令行版本来生成高度冗余的配置文件和其他文本文件，但它在转换数据方面功能有限。显然，Jinja2 的作者有不同的想法，而我想要类似于 <ruby>列表推导<rt>list comprehensions</rt></ruby> 或 D 语言的 <ruby>可组合范围<rt>composable range</rt></ruby> 算法之类的东西。

我决定制作一个类似于 Jinja2 的工具，但让我可以通过使用范围算法转换数据来生成复杂的文件。这个想法非常简单：一个直接用 D 语言代码重写的模板语言。因为它 _就是_ D 语言，它可以支持 D 语言所能做的一切。我想要一个独立的代码生成器，但是由于 [D 语言的 `mixin` 特性][2]，同样的模板语言可以作为嵌入式模板语言工作（例如，Web 应用程序中的 HTML）。有关该技巧的更多信息，请参阅 [这篇关于在编译时使用 mixins 将 Brainfuck 转换为 D 和机器代码的文章][3]。

像往常一样，[源码在 GitLab 上][4]。[这篇文章中的例子也可以在这里找到][5]。

### Hello world 示例

这是一个演示这个想法的例子：

```
Hello [= retro("dlrow") ]!
[: enum one = 1; :]
1 + 1 = [= one + one ]
```

`[= some_expression ]` 类似于 Jinja2 中的 `{{ some_expression }}`，它在输出中呈现一个值。`[: some_statement; :]` 类似于 `{% some_statement %}` ，用于执行完整的代码语句。我更改了语法，因为 D 也大量使用花括号，并且将两者混合使模板难以阅读（还有一些特殊的非 D 指令，比如 `include`，它们被包裹在 `[<` 和 `>]` 中）。 

如果你将上面的内容保存到一个名为 `hello.txt.dj` 的文件中并运行 `djinn` 命令行工具，你会得到一个名为 `hello.txt` 的文件，其中包含你可能猜到的内容：

```
Hello world!
1 + 1 = 2
```

如果你使用过 Jinja2，你可能想知道第二行发生了什么。Djinn 有一个简化格式化和空格处理的特殊规则：如果源代码行包含 `[:` 语句或 `[<` 指令但不包含任何非空格输出，则整行都会被忽略输出。空行则仍会原样呈现。

### 生成数据

好的，现在来讲一些更实用的东西：生成 CSV 数据。

```
x,f(x)
[: import std.mathspecial;
foreach (x; iota(-1.0, 1.0, 0.1)) :]
[= "%0.1f,%g", x, normalDistribution(x) ]
```

一个 `[=` 和 `]` 对可以包含多个用逗号分隔的表达式。如果第一个表达式是一个由双引号包裹的字符串，则会被解释为 [格式化字符串][6]。下面是输出结果：

```
x,f(x)
-1.0,0.158655
-0.9,0.18406
-0.8,0.211855
-0.7,0.241964
-0.6,0.274253
-0.5,0.308538
-0.4,0.344578
-0.3,0.382089
-0.2,0.42074
-0.1,0.460172
0.0,0.5
0.1,0.539828
0.2,0.57926
0.3,0.617911
0.4,0.655422
0.5,0.691462
0.6,0.725747
0.7,0.758036
0.8,0.788145
0.9,0.81594
```

### 制作图片

这个例子展示了一个图片的生成过程。[经典的 Netpbm 图像库定义了一堆图像格式][7]，其中一些是基于文本的。例如，这是一个 3 x 3 向量的图像：

```
P2 # PGM 格式标识
3 3 # 宽和高
7 # 代表纯白色的值（0 代表黑色）
7 0 7
0 0 0
7 0 7
```

你可以将上述文本保存到名为 `cross.pgm` 之类的文件中，很多图像工具都知道如何解析它。下面是一些 Djinn 代码，它以相同的格式生成 [Mandelbrot 集][8] 分形：

```
[:
import std.complex;
enum W = 640;
enum H = 480;
enum kMaxIter = 20;
ubyte mb(uint x, uint y)
{
    const c = complex(3.0 * (x - W / 1.5) / W, 2.0 * (y - H / 2.0) / H);
    auto z = complex(0.0);
    ubyte ret = kMaxIter;
    while (abs(z) <= 2 && --ret) z = z * z + c;
    return ret;
}
:]
P2
[= W ] [= H ]
[= kMaxIter ]
[: foreach (y; 0..H) :]
[= "%(%s %)", iota(W).map!(x => mb(x, y)) ]
```

生成的文件大约为 800 kB，但它可以很好地被压缩为 PNG：

```
$ # 使用 GraphicsMagick 进行转换
$ gm convert mandelbrot.pgm mandelbrot.png
```

结果如下：

![][9]

### 解决谜题

这里有一个谜题：

![][10]

一个 5 行 5 列的网格需要用 1 到 5 的数字填充，每个数字在每一行中限使用一次，在每列中限使用一次（即，制作一个 5 行 5 列的<ruby>拉丁方格<rt>Latin square</rt></ruby>）。相邻单元格中的数字还必须满足所有 `>` 大于号表示的不等式。

[几个月前我使用了 <ruby>线性规划<rt>linear programming</rt></ruby>（LP）][11]。线性规划问题是具有线性约束的连续变量系统。这次我将使用<ruby>混合整数线性规划<rt>mixed integer linear programming</rt></ruby>（MILP），它通过允许整数约束变量来归纳 LP。事实证明，这足以成为 NP 完备的，而 MILP 恰好可以很好地模拟这个谜题。

在上一篇文章中，我使用 Julia 库 JuMP 来帮助解决这个问题。这次我将使用 [CPLEX：基于文本的格式][12]，它受到多个 LP 和 MILP 求解器的支持（如果需要，可以通过现成的工具轻松转换为其他格式）。这是上一篇文章中 CPLEX 格式的 LP：

```
Minimize
  obj: v
Subject To
  ptotal: pr + pp + ps = 1
  rock: 4 ps - 5 pp - v <= 0
  paper: 5 pr - 8 ps - v <= 0
  scissors: 8 pp - 4 pr - v <= 0
Bounds
  0 <= pr <= 1
  0 <= pp <= 1
  0 <= ps <= 1
End
```

CPLEX 格式易于阅读，但复杂度高的问题需要大量变量和约束来建模，这使得手工编码既痛苦又容易出错。有一些特定领域的语言，例如 [ZIMPL][13]，用于以高级方式描述 MILP 和 LP。对于许多问题来说，它们非常酷，但最终它们不如具有良好库（如 JuMP）支持的通用语言或使用 D 语言的代码生成器那样富有表现力。

我将使用两组变量来模拟这个谜题：`v_{r,c}` 和 `i_{r,c,v}`。`v_{r,c}` 将保存 r 行 c 列单元格的值（从 1 到 5）。`i_{r,c,v}` 是一个二进制指示器，如果 r 行 c 列的单元格的值是 v，则该指示器值为 1，否则为 0。这两组变量是网格的冗余表示，但第一种表示更容易对不等式约束进行建模，而第二种表示更容易对唯一性约束进行建模。我只需要添加一些额外的约束来强制这两个表示是一致的。但首先，让我们从每个单元格必须只有一个值的基本约束开始。从数学上讲，这意味着给定行和列的所有指示器都必须为 0，但只有一个值为 1 的例外。这可以通过以下等式强制约束：

```
[i_{r,c,1} + i_{r,c,2} + i_{r,c,3} + i_{r,c,4} + i_{r,c,5} = 1]
```

可以使用以下 Djinn 代码生成对所有行和列的 CPLEX 约束：

```
\ 单元格只有一个值
[:
foreach (r; iota(N))
foreach (c; iota(N))
:]
    [= "%-(%s + %)", vs.map!(v => ivar(r, c, v)) ] = 1
[::]
```

`ivar()` 是一个辅助函数，它为我们提供变量名为 `i` 的字符串标识符，而 `vs` 存储从 1 到 5 的数字以方便使用。行和列内唯一性的约束完全相同，但在 `i` 的其他两个维度上迭代。

为了使变量组 `i` 与变量组 `v` 保持一致，我们需要如下约束（请记住，变量组 `i` 中只有一个元素的值是非零的）：

```
[i_{r,c,1} + 2i_{r,c,2} + 3i_{r,c,3} + 4i_{r,c,4} + 5i_{r,c,5} = v_{r,c}]
```

CPLEX 要求所有变量都位于左侧，因此 Djinn 代码如下所示：

```
\ 连接变量组 i 和变量组 v
[:
foreach (r; iota(N))
foreach (c; iota(N))
:]
    [= "%-(%s + %)", vs.map!(v => text(v, ' ', ivar(r, c, v))) ] - [= vvar(r,c) ] = 0
[::]
```

不等符号相邻的和左下角值为为 4 单元格的约束写起来都很简单。剩下的便是将指示器变量声明为二进制，并为变量组 `v` 设置边界。加上变量的边界，总共有 150 个变量和 111 个约束 [你可以在仓库中看到完整的代码][14]。

[GNU 线性规划工具集][15] 有一个命令行工具可以解决这个 CPLEX MILP。不幸的是，它的输出是一个包含了所有内容的体积很大的转储，所以我使用 awk 命令来提取需要的内容：

```
$ time glpsol --lp inequality.lp -o /dev/stdout | awk '/v[0-9][0-9]/ { print $2, $4 }' | sort
v00 1
v01 3
v02 2
v03 5
v04 4
v10 2
v11 5
v12 4
v13 1
v14 3
v20 3
v21 1
v22 5
v23 4
v24 2
v30 5
v31 4
v32 3
v33 2
v34 1
v40 4
v41 2
v42 1
v43 3
v44 5

real    0m0.114s
user    0m0.106s
sys     0m0.005s
```

这是在原始网格中写出的解决方案：

![][16]

这些例子只是用来玩的，但我相信你已经明白了。顺便说一下，Djinn 代码仓库的 `README.md` 文件本身是使用 Djinn 模板生成的。

正如我所说，Djinn 也可以用作嵌入在 D 语言代码中的编译期模板语言。我最初只是想要一个代码生成器，得益于 D 语言的元编程功能，这算是一个额外获得的功能。

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2021/01/01/djinn.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://jinja2docs.readthedocs.io/en/stable/
[2]: https://dlang.org/articles/mixin.html
[3]: https://theartofmachinery.com/2017/12/31/compile_time_brainfuck.html
[4]: https://gitlab.com/sarneaud/djinn
[5]: https://gitlab.com/sarneaud/djinn/-/tree/v0.1.0/examples
[6]: https://dlang.org/phobos/std_format.html#format-string
[7]: http://netpbm.sourceforge.net/doc/#formats
[8]: https://en.wikipedia.org/wiki/Mandelbrot_set
[9]: https://theartofmachinery.com/images/djinn/mandelbrot.png
[10]: https://theartofmachinery.com/images/djinn/inequality.svg
[11]: https://theartofmachinery.com/2020/05/21/glico_weighted_rock_paper_scissors.html
[12]: http://lpsolve.sourceforge.net/5.0/CPLEX-format.htm
[13]: https://zimpl.zib.de/
[14]: https://gitlab.com/sarneaud/djinn/-/tree/v0.1.0/examples/inequality.lp.dj
[15]: https://www.gnu.org/software/glpk/
[16]: https://theartofmachinery.com/images/djinn/inequality_solution.svg
