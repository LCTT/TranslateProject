[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12506-1.html)
[#]: subject: (Do math in the Linux shell with GNU bc)
[#]: via: (https://opensource.com/article/20/7/bc-math)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 GNU bc 在 Linux Shell 中进行数学运算
======

> 在 shell 中使用 bc 更好地做算数，它是一种用于高级计算的数学语言。

![](https://img.linux.net.cn/data/attachment/album/202008/11/105133c86k08rf028jjd6a.jpg)

大多数 [POSIX][2] 系统带有 [GNU bc][3]，这是一种任意精度的数字处理语言。它的语法类似于 C，但是它也支持交互式执行语句和处理来自标准输入（`stdin`）的数据。因此，它通常是以下问题的答案：“我如何在 Linux shell 中进行数学运算？”这种回应方式在网上很常见：

```
$ echo "1+1" | bc
2
```

尽管这是完全正确的，但很少有用户认为，与更直观的方式相比，它很优雅，例如：

```
$ 1+1  # 这不能工作
2
```

交互模式要容易一些：

```
$ bc
1+1
2
quit
$
```

但是交互模式并不总是适合简单计算想要的直观工作流，比如直接输入你想要的计算。因此我推荐 Bluebat 的[纯 Bash 计算器][4]。

`bc` 实际上提供了一种用于高级计算的数学语言。

### 含高级函数的 mathlib

`bc` 本身提供了基本的数学函数。你可以在交互式模式下测试它们：

```
$ bc
3^2
9
(3^2)*(9)/3
27
```

使用 `--mathlib` 选项获取高级函数，包括正弦、余弦、正切等。在交互式模式下，你可以测试其中一些。下面是 90 度的余弦：

```
c(90)
-.44807361612917015236
```

9 的正弦：

```
s(9)
.41211848524175656975
```

### 创建你自己的 bc 函数

你还可以在 `bc` 中创建自己的函数。函数定义以 `define` 关键字开始，并用大括号括起来。下面是一个输入到交互式会话中的简单函数，它返回给它的任意数字：

```
$ bc
define echo(n) {
  return (n);
}
```

在同一个交互式会话中，测试一下：

```
echo(2)
2
echo(-2)
-2
```

### bc 中的 if 语句

`bc` 语言还有各种控制语句，其中最简单的是 `if`/`else`。语法乍一看可能很熟悉，但在如何处理大括号方面有些不同。请注意，`if` 语句的 `else` 子句包含在大括号中，而 `then` 子句不是，但两者都用分号终止。下面是一个返回数字 `n` 的绝对值的函数：

```
define abso(n) {
  if ( n > 0 ) return (n);
  { return (-n); }
}
```

在同一个交互式会话中，测试一下：

```
abso(-5)
5
abso(5)
5
```

### 将数据导入 bc

使用交互式会话对于快速计算和实验是可以容忍的，但在退出时会丢失数据，并且在出错时很难编辑。幸运的是，`bc` 可以从外部文件加载变量和函数。

下面是一个包含两个变量（`sol` 和 `foo`）的文件，以及一个用于查找绝对值的自定义 `abso` 函数：

```
sol=299792458

foo=42

define abso(n) {
  if ( n > 0 ) return (n);
  { return (-n); }
}
```

将它保存到名为 `bcvars.bc` 的文件中，以便导入 `bc` 交互式会话：

```
$ bc bcvars.bc
foo
42
sol
299792458
abso(-23)
23
```

### 使用 bc 助力你的数学

`bc` 语言相对简单，前提是你知道足够的数学知识来构造任何你想完成的方程。虽然 `bc` 默认提供了有用的基本函数，并允许你创建自己的函数，但你可以通过站在巨人的肩膀上来减少工作量。加载了用于数学基础知识和特定任务（例如，计算复利）的新函数的文件可从 [GNU bc 页][5]获得，同时也可获得 `bc` [完整文档][6]。

如果你有兴趣在 shell 里更好地处理数学，试试 `bc` 。它不会使你成为数学天才，但它可能会让过程更简单。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/bc-math

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/math_money_financial_calculator_colors.jpg?itok=_yEVTST1 (old school calculator)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://www.gnu.org/software/bc/
[4]: https://raw.githubusercontent.com/bluebat/.bash/master/bashbc.sh
[5]: http://phodd.net/gnu-bc/
[6]: https://www.gnu.org/software/bc/manual/html_mono/bc.html
