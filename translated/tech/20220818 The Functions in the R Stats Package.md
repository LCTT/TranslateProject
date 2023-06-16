[#]: subject: "The Functions in the R Stats Package"
[#]: via: "https://www.opensourceforu.com/2022/08/the-functions-in-the-r-stats-package/"
[#]: author: "Shakthi Kannan https://www.opensourceforu.com/author/shakthi-kannan/"
[#]: collector: "lkxed"
[#]: translator: "tanloong"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

R 语言 stats 包中的函数
======
我们已经学习了 R 语言的基础知识，包括其语法以及语法所对应的语义，现在准备使用 R 向统计学领域进发。本文是 R 系列的第十一篇文章，我们将学习如何使用 R 语言 stats 包中提供的统计函数。

与此系列之前的文章一样，我们将使用安装在 Parabola GNU/Linux-libre (x86-64) 上的 R 4.1.2 版本来运行文中的代码。

```
$ R --version
R version 4.1.2 (2021-11-01) -- "Bird Hippie"
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see https://www.gnu.org/licenses/
```

### mean 函数

在 R 中 *mean* 函数用来计算算术平均值。该函数接受一个 R 对象 `x` 作为参数，以及一个 `trim` 选项来在计算均值之前剔除任意比例的数据 (LCTT 译注：比如对于一个含有 7 个元素的向量 `x`，设置 `trim` 为 0.2 表示分别去掉 `x` 中最大和最小的前 20% (即 1.4 个) 的元素，所去掉的元素的个数会向下取整，所以最终会去掉 1 个最大值和 1 个最小值；`trim` 取值范围为 $[0, 0.5]$，默认为 0)。<ruby>逻辑参数<rt>logical argument</rt></ruby> (`TRUE` 或 `FALSE`) `na.rm` 可以设置是否忽略空值 (`NA`)。该函数的语法如下：

```
mean(x, trim = 0, na.rm = FALSE, ...)
```

该函数支持数值、逻辑值、日期和 <ruby>时间区间<rt>time intervals</rt></ruby>。下面是使用 `mean` 函数的一些例子：

```
> mean(c(1, 2, 3))
2

> mean(c(1:5, 10, 20))
6.428571

> mean(c(FALSE, TRUE, FALSE))
0.3333333

> mean(c(TRUE, TRUE, TRUE))
1
```

我们使用 UCI 机器学习库提供的一个采集自葡萄牙银行机构的“银行营销数据集”作为样本数据。该数据可用于公共研究，包含 4 个 csv 文件，我们使用 `read.csv()` 函数导入其中的 *bank.csv* 文件。

```
> bank <- read.csv(file="bank.csv", sep=";")

> bank[1:3,]
  age        job marital education default balance housing loan  contact day
1  30 unemployed married   primary      no    1787      no   no cellular  19
2  33   services married secondary      no    4789     yes  yes cellular  11
3  35 management  single  tertiary      no    1350     yes   no cellular  16
  month duration campaign pdays previous poutcome  y
1   oct       79        1    -1        0  unknown no
2   may      220        1   339        4  failure no
3   apr      185        1   330        1  failure no
```

下面是计算 age 列均值的示例：

```
> mean(bank$age)
41.1701
```

### median 函数

R 语言 stats 包中的 *median* 函数用来计算样本的中位数。该函数接受一个数值向量 `x`，以及一个逻辑值 `na.rm` 用来设置在计算中位数之前是否去除 `NA` 值。该函数的语法如下：

```
median(x, na.rm = FALSE, ...)
```

下面是使用该函数的两个例子：

```
> median(3:5)
4
> median(c(3:5, 50, 150))
[1] 5
```

现在我们可以计算银行数据中 age 列的中位数：

```
> median(bank$age)
39
```

### pair 函数

*pair* 函数用来合并两个向量，接受向量 `x` 和向量 `y` 两个参数。`x` 和 `y` 的长度必须相等。

```
Pair(x, y)
```

该函数返回一个 `Pair` 类的列数为 2 的矩阵，示例如下：

```
> Pair(c(1,2,3), c(4,5,6))
     x y
[1,] 1 4
[2,] 2 5
[3,] 3 6
attr(,"class")
[1] "Pair"
```

该函数常用于像 T 检验和 Wilcox 检验等的 <ruby>配对检验<rt>paired test</rt></ruby>。

### dist 函数

*dist* 函数用来计算数据矩阵中各行之间的距离矩阵，接受以下参数：

| 参数 | 描述 |
| :- | :- |
| x | 数值矩阵 |
| method | 距离测量方法 |
| diag | 若为 TRUE，则打印距离矩阵的对角线 |
| upper | 若为 TRUE，则打印距离矩阵的上三角 |
| p | 闵可夫斯基距离的幂次 (见下文 LCTT 译注) |

该函数提供的距离测量方法包括：<ruby>欧式距离<rt>euclidean</rt></ruby>、<ruby>最大距离<rt>maximum</rt></ruby>、<ruby>曼哈顿距离<rt>manhattan</rt></ruby>、<ruby>堪培拉距离<rt>canberra</rt></ruby>、<ruby>二进制距离<rt>binary</rt></ruby> 和 <ruby>闵可夫斯基距离<rt>minkowski</rt></ruby>，默认为欧式距离 (LCTT 译注：
**欧式距离**指两点之间线段的长度，比如二维空间中 A 点 $(x_1, y_1)$ 和 B 点 $(x_2, y_2)$ 的欧式距离是 $\sqrt{(x_1 - x_2)^2 + (y_1 - y_2)^2}$；**最大距离**指 n 维向量空间中两点在各维度上的距离的最大值，比如 A 点 $(3, 6, 8, 9)$ 和 B 点 $(1, 8, 9, 10)$ 之间的最大距离是 $max(|3 - 1|, |6 - 8|, |8 - 9|, |9 - 10|)$，等于 2；**曼哈顿距离**指 n 维向量空间中两点在各维度上的距离之和，比如二维空间中 A 点 $(x_1, y_1)$ 和 B 点 $(x_2, y_2)$ 之间的曼哈顿距离是 $|x_1 - x_2| + |y_1 - y_2|$；**堪培拉距离**的公式是 $\sum_{i=1}^{n}\frac{|V1_i - V2_i|}{|V1_i| + |V2_i|}$；**二进制距离**首先将两个向量中的各元素看作其二进制形式，然后剔除在两个向量中对应值均为 0 的维度，最后计算在剩下的维度上两个向量间的对应值不相同的比例，比如 $V1 = (1, 3, 0, 5, 0)$ 和 $V2 = (11, 13, 0, 15, 10)$ 的二进制形式分别是 $(1, 1, 0, 1, 0)$ 和 $(1, 1, 0, 1, 1)$，其中第 3 个维度的对应值均为 0，剔除该维度之后为 $(1, 1, 1, 0)$ 和 $(1, 1, 1, 1)$，在剩余的 4 个维度中只有最后一个维度在两个向量之间的值不同，最终结果为 0.25；**闵可夫斯基距离**是欧式距离和曼哈顿距离的推广，公式是 $\sqrt[p]{\sum_{i=1}^{n}{|V1_i - V2_i|^p}}$，当 $p=1$ 时相当于曼哈顿距离，当 $p=2$ 时相当于欧式距离。)。下面是使用欧式距离计算 age 列距离矩阵的示例：

```
> dist(bank$age, method="euclidean", diag=FALSE, upper=FALSE, p=2)
      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
2     3
3     5  2
4     0  3  5
5    29 26 24 29
6     5  2  0  5 24
7     6  3  1  6 23  1
8     9  6  4  9 20  4  3
9    11  8  6 11 18  6  5  2
10   13 10  8 13 16  8  7  4  2
11    9  6  4  9 20  4  3  0  2  4
12   13 10  8 13 16  8  7  4  2  0  4
13    6  3  1  6 23  1  0  3  5  7  3  7
14   10 13 15 10 39 15 16 19 21 23 19 23 16
15    1  2  4  1 28  4  5  8 10 12  8 12  5 11
16   10  7  5 10 19  5  4  1  1  3  1  3  4 20  9
17   26 23 21 26  3 21 20 17 15 13 17 13 20 36 25 16
18    7  4  2  7 22  2  1  2  4  6  2  6  1 17  6  3 19
19    5  8 10  5 34 10 11 14 16 18 14 18 11  5  6 15 31 12
20    1  2  4  1 28  4  5  8 10 12  8 12  5 11  0  9 25  6  6
21    8  5  3  8 21  3  2  1  3  5  1  5  2 18  7  2 18  1 13  7
22   12  9  7 12 17  7  6  3  1  1  3  1  6 22 11  2 14  5 17 11  4
23   14 11  9 14 15  9  8  5  3  1  5  1  8 24 13  4 12  7 19 13  6  2
     26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
...
```

改用二进制距离的计算结果如下：

```
> dist(bank$age, method="binary", diag=FALSE, upper=FALSE, p=2)
     1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28
2    0
3    0 0
4    0 0 0
5    0 0 0 0
6    0 0 0 0 0
7    0 0 0 0 0 0
8    0 0 0 0 0 0 0
9    0 0 0 0 0 0 0 0
10   0 0 0 0 0 0 0 0 0
11   0 0 0 0 0 0 0 0 0  0
12   0 0 0 0 0 0 0 0 0  0  0
13   0 0 0 0 0 0 0 0 0  0  0  0
14   0 0 0 0 0 0 0 0 0  0  0  0  0
15   0 0 0 0 0 0 0 0 0  0  0  0  0  0
16   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0
17   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0
18   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0  0
19   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0  0  0
20   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0  0  0  0
21   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0  0  0  0  0
22   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0  0  0  0  0  0
23   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0  0  0  0  0  0  0
     29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53
```

### quantile 函数

*quantile* 函数用于计算数值向量 `x` 的分位数及其对应的概率。当设置 `na.rm` 为 `TRUE` 时，该函数将忽略向量中的 `NA` 和 `NaN` 值。概率 0 对应最小观测值，概率 1 对应最大观测值。该函数的语法如下:

```
quantile(x, ...)
```

*quantile* 函数接受以下参数：

| 参数 | 描述 |
| :- | :- |
| x | 数值向量 |
| probs | 概率向量，取值为 $[0, 1]$ (LCTT 译注：默认为 `(0, 0.25, 0.5, 0.75, 1)`)|
| na.rm | 若为 TRUE，忽略向量中的 NA 和 NaN 值 |
| names | 若为 TRUE，在结果中包含命名属性 |
| type | 整数类型，用于选择任意一个九种分位数算法 (LCTT 译注：默认为 7)|
| digits | 小数精度 |
| … | 传递给其他方法的额外参数 |

*rnorm* 函数可用于生成正态分布的随机数。它可以接受要生成的观测值的数量 n，一个均值向量以及一个标准差向量。下面是一个计算 `rnorm` 函数生成的随机数的四分位数的示例：

```
> quantile(x <- rnorm(100))
    0%          25%          50%          75%         100%
-1.978171612 -0.746829079 -0.009440368  0.698271134  1.897942805
```

下面是生成银行年龄数据对应概率下的分位数的示例：

```
> quantile(bank$age, probs = c(0.1, 0.5, 1, 2, 5, 10, 50)/100)
0.1% 0.5%   1%   2%   5%  10%  50%
20.0 22.6 24.0 25.0 27.0 29.0 39.0
```

### IQR 函数

*IQR* 函数用于计算向量中数值的 <ruby>四分位距<rt>interquartile range</rt></ruby>。其语法如下：

```
IQR(x, na.rm = FALSE, type = 7)
```

参数 `type` 指定了一个整数以选择分位数算法，该算法在 [Hyndman and Fan (1996)][c] 中进行了讨论。下面是计算银行年龄四分位距的示例：

```
> IQR(bank$age, na.rm = FALSE, type=7)
16
```

### sd 函数

*sd* 函数用来计算一组数值中的标准差。该函数接受一个 <ruby>数值向量<rt>numeric vector</rt></ruby> `x` 和一个逻辑值 `na.rm`。`na.rm` 用来设置在计算时是否忽略缺失值。该函数的语法如下：

```
sd(x, na.rm = FALSE)
```

对于长度为 0 或 1 的向量，该函数返回 `NA`。下面是两个例子：

```
> sd(1:10)
3.02765

> sd(1)
NA
```

下面是计算 age 列标准差的示例：

```
> sd(bank$age)
10.57621
```

R 语言 stats 包中还有很多其他函数，鼓励你自行探索。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/the-functions-in-the-r-stats-package/

作者：[Shakthi Kannan][a]
选题：[lkxed][b]
译者：[tanloong](https://github.com/tanloong)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/shakthi-kannan/
[b]: https://github.com/lkxed
[c]: https://www.amherst.edu/media/view/129116/.../Sample+Quantiles.pdf
