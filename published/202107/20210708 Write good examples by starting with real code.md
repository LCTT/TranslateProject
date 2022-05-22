[#]: subject: "Write good examples by starting with real code"
[#]: via: "https://jvns.ca/blog/2021/07/08/writing-great-examples/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "zepoch"
[#]: reviewer: "turbokernel"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13595-1.html"

从实际代码开始编写好的示例
======

![](https://img.linux.net.cn/data/attachment/album/202107/18/231616z1hhcerhrk3wzwkr.jpg)

当编写程序时，我花费了大量时间在编写好的示例上。我从未见过有人写过关于如何写出好的示例，所以我就写了一下如何写出一份好的示例。

基础思路就是从你写的真实代码开始，然后删除不相关的细节，使其成为一个独立的例子，而不是无中生有地想出一些例子。

我将会谈论两种示例：基于真实案例的示例和奇怪的示例

### 好的示例是真实的

为了说明为什么好的案例应该是真实的，我们就先讨论一个不真实的案例。假设我们在试图解释 Python 的 lambda 函数（这只是我想到的第一个概念）。你可以举一个例子，使用 `map` 和 lambda 来让一组数字变为原先的两倍。

```
numbers = [1, 2, 3, 4]
squares = map(lambda x: x * x, numbers)
```

我觉得这个示例不是真实的，有如下两方面的原因：

  * 将一组数字作平方运算不是在真实的程序中完成的事，除非是欧拉项目或某种东西（更多的可能是针对列表的操作）
  * `map` 在 Python 中并不常用，即便是做这个我也更愿意写 `[x*x for x in numbers]` 

一个更加真实的 Python lambdas 的示例是使用 `sort` 函数，就像这样：

```
children = [{"name": "ashwin", "age": 12}, {"name": "radhika", "age": 3}]
sorted_children = sorted(children, key=lambda x: x['age'])
```

但是这个示例是被精心设计的（为什么我们需要对这些孩子按照年龄进行排序呢？）。所以我们如何来做一个真实的示例呢？

### 如何让你的示例真实起来：看你所写实际代码

我认为最简单的来生成一个例子的方法就是，不是凭空出现一个例子（就像我用那个`儿童`的例子），而只是从真正的代码开始！

举一个例子吧，如果我要用 `sort.+key` 来编写一串 Python 代码，我会发现很多我按某个标准对列表进行排序的真实例子，例如：

  * `tasks.sort(key=lambda task: task['completed_time'])`
  * `emails = reversed(sorted(emails, key=lambda x:x['receivedAt']))`
  * `sorted_keysizes = sorted(scores.keys(), key=scores.get)`
  * `shows = sorted(dates[date], key=lambda x: x['time']['performanceTime'])`

在这里很容易看到一个规律——这些基本是按时间排序的！因此，你可以明白如何将按时间排序的某些对象（电子邮件、事件等）的简单实例轻松地放在一起。

### 现实的例子有助于“布道”你试图解释的概念

当我试图去解释一个想法（就好比 Python Lambdas）的时候，我通常也会试图说服读者，说这是值得学习的想法。Python lambdas 是如此的有用！当我去试图说服某个人 lambdas 是很好用的时候，让他想象一下 lambdas 如何帮助他们完成一项他们将要去做的任务或是以及一项他们以前做过的任务，对说服他会很有帮助。

### 从真实代码中提炼出示例可能需要很长时间

我给出如何使用 `lambda` 和 `sort` 函数的解释例子是十分简单的，它并不需要花费我很长时间来想出来，但是将真实的代码提炼出为一个独立的示例则是会需要花费很长的时间！

举个例子，我想在这篇文章中融入一些奇怪的 CSS 行为的例子来说明创造一个奇怪的案例是十分有趣的。我花费了两个小时来解决我这周遇到的一个实际的问题，确保我理解 CSS 的实际情况，并将其变成一个小示例。

最后，它“仅仅”用了 [五行 HTML 和一点点的 CSS][1] 来说明了这个问题，看起来并不想是我花费了好多小时写出来的。但是最初它却是几百行的 JS/CSS/JavaScript，它需要花费很长时间来将所有的代码化为核心的很少的代码。

但我认为花点时间把示例讲得非常简单明了是值得的——如果有成百上千的人在读你的示例，你就节省了他们这么多时间！

### 就这么多了！

我觉得还有更多关于示例可以去讲的——几种不同类型的有用示例，例如：

  * 可以更多的改变人的思维而不是直接提供使用的惊喜读者的示例代码
  * 易于复制粘贴以用作初始化的示例

也许有一天我还会再写一些呢？ :)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/07/08/writing-great-examples/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[zepoch](https://github.com/zepoch)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://codepen.io/wizardzines/pen/0eda7725a46c919dcfdd3fa80aff3d41
