[#]: subject: "Quadratic algorithms are slow (and hashmaps are fast)"
[#]: via: "https://jvns.ca/blog/2021/09/10/hashmaps-make-things-fast/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13786-1.html"

浅谈慢速的二次算法与快速的 hashmap 
======

![](https://img.linux.net.cn/data/attachment/album/202109/15/094524s7dlcq74ksqazyyc.jpg)

大家好！昨天我与一位朋友聊天，他正在准备编程面试，并试图学习一些算法基础知识。

我们聊到了<ruby>二次时间<rt>quadratic-time</rt></ruby>与<ruby>线性时间<rt>linear-time</rt></ruby>算法的话题，我认为在这里写这篇文章会很有趣，因为避免二次时间算法不仅在面试中很重要——有时在现实生活中了解一下也是很好的！后面我会快速解释一下什么是“二次时间算法” :) 

以下是我们将要讨论的 3 件事：

  1. 二次时间函数比线性时间函数慢得非常非常多
  2. 有时可以通过使用 hashmap 把二次算法变成线性算法
  3. 这是因为 hashmap 查找非常快（即时查询！）

我会尽量避免使用数学术语，重点关注真实的代码示例以及它们到底有多快/多慢。

### 目标问题：取两个列表的交集

我们来讨论一个简单的面试式问题：获取 2 个数字列表的交集。 例如，`intersect([1,2,3], [2,4,5])` 应该返回 `[2]`。

这个问题也是有些现实应用的——你可以假设有一个真实程序，其需求正是取两个 ID 列表的交集。

### “显而易见”的解决方案：

我们来写一些获取 2 个列表交集的代码。下面是一个实现此需求的程序，命名为 `quadratic.py`。

```
import sys

# 实际运行的代码
def intersection(list1, list2):
    result = []
    for x in list1:
        for y in list2:
            if x == y:
                result.append(y)
    return result

# 一些样板，便于我们从命令行运行程序，处理不同大小的列表
def run(n):
    # 定义两个有 n+1 个元素的列表
    list1 = list(range(3, n)) + [2]
    list2 = list(range(n+1, 2*n)) + [2]
    # 取其交集并输出结果
    print(list(intersection(list1, list2)))

# 使用第一个命令行参数作为输入，运行程序
run(int(sys.argv[1]))
```

程序名为 `quadratic.py`（LCTT 译注：“quadratic”意为“二次方的”）的原因是：如果 `list1` 和 `list2` 的大小为 `n`，那么内层循环（`if x == y`）会运行 `n^2` 次。在数学中，像 `x^2` 这样的函数就称为“二次”函数。

### `quadratic.py` 有多慢？

用一些不同长度的列表来运行这个程序，两个列表的交集总是相同的：`[2]`。

```
$ time python3 quadratic.py 10
[2]

real    0m0.037s
$ time python3 quadratic.py 100
[2]

real    0m0.053s
$ time python3 quadratic.py 1000
[2]

real    0m0.051s
$ time python3 quadratic.py 10000 # 10,000
[2]

real    0m1.661s
```

到目前为止，一切都还不错——程序仍然只花费不到 2 秒的时间。

然后运行该程序处理两个包含 100,000 个元素的列表，我不得不等待了很长时间。结果如下：

```
$ time python3 quadratic.py 100000 # 100,000
[2]

real    2m41.059s
```

这可以说相当慢了！总共花费了 160 秒，几乎是在 10,000 个元素上运行时（1.6 秒）的 100 倍。所以我们可以看到，在某个点之后，每次我们将列表扩大 10 倍，程序运行的时间就会增加大约 100 倍。

我没有尝试在 1,000,000 个元素上运行这个程序，因为我知道它会花费又 100 倍的时间——可能大约需要 3 个小时。我没时间这样做！

你现在大概明白了为什么二次时间算法会成为一个问题——即使是这个非常简单的程序也会很快变得非常缓慢。

### 快速版：`linear.py`

好，接下来我们编写一个快速版的程序。我先给你看看程序的样子，然后再分析。

```
import sys

# 实际执行的算法
def intersection(list1, list2):
    set1 = set(list1) # this is a hash set
    result = []
    for y in list2:
        if y in set1:
            result.append(y)
    return result

# 一些样板，便于我们从命令行运行程序，处理不同大小的列表
def run(n):
    # 定义两个有 n+1 个元素的列表
    list1 = range(3, n) + [2]
    list2 = range(n+1, 2*n) + [2]
    # 输出交集结果
    print(intersection(list1, list2))

run(int(sys.argv[1]))
```

（这不是最惯用的 Python 使用方式，但我想在尽量避免使用太多 Python 思想的前提下编写代码，以便不了解 Python 的人能够更容易理解）

这里我们做了两件与慢速版程序不同的事：

  1. 将 `list1` 转换成名为 `set1` 的 set 集合
  2. 只使用一个 for 循环而不是两个

### 看看 `linear.py` 程序有多快

在讨论 _为什么_ 这个程序快之前，我们先在一些大型列表上运行该程序，以此证明它确实是很快的。此处演示该程序依次在大小为 10 到 10,000,000 的列表上运行的过程。（请记住，我们上一个的程序在 100,000 个元素上运行时开始变得非常非常慢）

```
$ time python3 linear.py 100
[2]

real    0m0.056s
$ time python3 linear.py 1000
[2]

real    0m0.036s
$ time python3 linear.py 10000 # 10,000
[2]

real    0m0.028s
$ time python3 linear.py 100000 # 100,000
[2]

real    0m0.048s <-- quadratic.py took 2 minutes in this case! we're doing it in 0.04 seconds now!!! so fast!
$ time python3 linear.py 1000000 # 1,000,000
[2]

real    0m0.178s
$ time python3 linear.py 10000000 # 10,000,000
[2]

real    0m1.560s
```

### 在极大型列表上运行 `linear.py`

如果我们试着在一个非常非常大的列表（100 亿 / 10,000,000,000 个元素）上运行它，那么实际上会遇到另一个问题：它足够 _快_ 了（该列表仅比花费 4.2 秒的列表大 100 倍，因此我们大概应该能在不超过 420 秒的时间内完成），但我的计算机没有足够的内存来存储列表的所有元素，因此程序在运行结束之前崩溃了。

```
$ time python3 linear.py 10000000000
Traceback (most recent call last):
  File "/home/bork/work/homepage/linear.py", line 18, in <module>
    run(int(sys.argv[1]))
  File "/home/bork/work/homepage/linear.py", line 13, in run
    list1 = [1] * n + [2]
MemoryError

real    0m0.090s
user    0m0.034s
sys 0m0.018s
```

不过本文不讨论内存使用，所以我们可以忽略这个问题。

### 那么，为什么 `linear.py` 很快呢？

现在我将试着解释为什么 `linear.py` 很快。

再看一下我们的代码:

```
def intersection(list1, list2):
    set1 = set(list1) # this is a hash set
    result = []
    for y in list2:
        if y in set1:
            result.append(y)
    return result
```

假设 `list1` 和 `list2` 都是大约 10,000,000 个不同元素的列表，这样的元素数量可以说是很大了！

那么为什么它还能够运行得如此之快呢？因为 hashmap！！！

### hashmap 查找是即时的（“常数级时间”）

我们看一下快速版程序中的 `if` 语句：

```
if y in set1:
    result.append(y)
```

你可能会认为如果 `set1` 包含 1000 万个元素，那么这个查找——`if y in set1` 会比 `set1` 包含 1000 个元素时慢。但事实并非如此！无论 `set1` 有多大，所需时间基本是相同的（超级快）。

这是因为 `set1` 是一个哈希集合，它是一种只有键没有值的 hashmap（hashtable）结构。

我不准备在本文中解释 _为什么_ hashmap 查找是即时的，但是神奇的 Vaidehi Joshi 的 [basecs][1] 系列中有关于 [hash table][2] 和 [hash 函数][3] 的解释，其中讨论了 hashmap 即时查找的原因。

### 不经意的二次方：现实中的二次算法！

二次时间算法真的很慢，我们看到的的这个问题实际上在现实中也会遇到——Nelson Elhage 有一个很棒的博客，名为 [不经意的二次方][4]，其中有关于不经意以二次时间算法运行代码导致性能问题的故事。

### 二次时间算法可能会“偷袭”你

关于二次时间算法的奇怪之处在于，当你在少量元素（如 1000）上运行它们时，它看起来并没有那么糟糕！没那么慢！但是如果你给它 1,000,000 个元素，它真的会花费几个小时去运行。

所以我认为它还是值得深入了解的，这样你就可以避免无意中使用二次时间算法，特别是当有一种简单的方法来编写线性时间算法（例如使用 hashmap）时。

### 总是让我感到一丝神奇的 hashmap

hashmap 当然不是魔法（你可以学习一下为什么 hashmap 查找是即时的！真的很酷！），但它总是让人 _感觉_ 有点神奇，每次我在程序中使用 hashmap 来加速，都会使我感到开心 :)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/09/10/hashmaps-make-things-fast/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://medium.com/basecs
[2]: https://medium.com/basecs/taking-hash-tables-off-the-shelf-139cbf4752f0
[3]: https://medium.com/basecs/hashing-out-hash-functions-ea5dd8beb4dd
[4]: https://accidentallyquadratic.tumblr.com/
