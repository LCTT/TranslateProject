[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The importance of consistency in your Python code)
[#]: via: (https://opensource.com/article/19/12/zen-python-consistency)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Python 代码前后一致的重要性
======
本部分是有关 Python 之禅的特殊系列，聚焦在第 12,13,14 规范：角色的二义和明确。
![两台动画电脑挥舞着手臂打招呼，一台手臂脱落][1]

设计用户界面的规范是 [准则][2]。它说，当用户执行一个操作时，程序应该做最不会让用户感到惊讶的事情。这和孩子们喜欢一遍又一遍地读同一本书的原因是一样的:没有什么比能够预测并让预测成真更让人欣慰的了。

在[ABC 语言][3] (Python 的灵感来源)的发展过程中，一个重要的见解是，编程设计是用户界面，需要 UI 设计者使用相同工具来设计。值得庆幸的是，从那以后，越来越多的语言采用了 UI 设计中的可视化和人体工程学概念，即使它们的应用并不严格。

这就引出了 [Python 之禅][4] 中的三个规范。

### 当存在多种可能，不要尝试去猜测。

**1 + "1"**的结果应该是什么? **“11”** 和 **2** 都是猜测。这个表达是 _ambiguous_：没有任何事情可以做，这至少对某些人来说并不令人惊讶。

一些语言选择猜测。在 JavaScript 中，结果为 **“11”**。在 Perl 中，结果为 ** 2 **。在 C 语言中，结果自然是空字符串。面对歧义，JavaScript，Perl 和 C 都在猜测。

在 Python 中，这会引发 **TypeError**：不是非静音的错误。捕获 **TypeError** 是非典型的：它通常将终止程序或至少终止当前任务（例如，在大多数Web框架中，它将终止对当前请求的处理）。 

Python 拒绝猜测 **1 + "1"**的含义。程序员被迫以明确的意图编写代码：**1 + int("1")**，即 **2**；或者 **str(1) + "1"**，即 **"11"**;或 **"1"[1:]**，这将是一个空字符串。通过拒绝猜测，Python 使程序更具可预测性。

### 尽量找一种，最好是唯一一种明显的解决方案。

断言也会出现偏差。给定一个任务，你能预知要实现该任务的代码吗？当然，不可能完美地预测。毕竟，编程是一项具有创造性的任务。

但是，不必有意提供多种冗余方式来实现同一目标。从某种意义上说，感觉某些解决方案或许 “更好” 或 “更 Python”。

对 Python 美学原则的欣赏部分是关于哪种更好的解决方案的代码健壮性讨论是非常棒的。甚至可以持不同观点保持原有编程风格。为使其达到一致，不赞同甚至也是可以的。但在这一切之下，最终，必须有一种变得容易的正确的解决方案。我们希望，通过商定实现目标的最佳方法，最终达成真正的一致。

### 虽然这并不容易，因为你不是 Python 之父。

这是一个重要的警告：首先，实现任务的最佳方法通常 _not_ 明显。观念在不断发展。 _Python_ 正在进化。读取文件数据块的最佳方法可能要等到 Python3.8 并且使用 [walrus 运算符][5]。

读取文件数据块这样常见任务在 Python 已有近 _30 years(30年)_ 的历史中并没有 “唯一的最佳方法”。

1998年当我从 Python 1.5.2 开始使用 Python 时，没有一种最佳的逐行读取文件的方法。多年来，知道在字典中使用关键字 **.haskey** 是最佳的方法，直到  **in** 操作符出现才发生改变。

只是要意识到，找到一种（也是唯一一种）实现目标的方法可能需要 30 年的时间来尝试，Python 可以继续寻找这些方法。历史观点认为，为了做一件事 30 年是可以接受的，但对于美国人民来说，当国家已经存在了 200 多年时，常常会感到陌生。

根据 Python 禅 的这一部分，无论是 Python 的创造者 [Guido van Rossum][6] 这个荷兰人，还是著名的计算机科学家 [Edsger W. Dijkstra][7]，都有不同的世界观。一定程度上欧洲人对时间的重视是欣赏它的必要条件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-consistency

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_other11x_cc.png?itok=I_kCDYj0 (Two animated computers waving one missing an arm)
[2]: https://www.uxpassion.com/blog/the-principle-of-least-surprise/
[3]: https://en.wikipedia.org/wiki/ABC_(programming_language)
[4]: https://www.python.org/dev/peps/pep-0020/
[5]: https://www.python.org/dev/peps/pep-0572/#abstract
[6]: https://en.wikipedia.org/wiki/Guido_van_Rossum
[7]: http://en.wikipedia.org/wiki/Edsger_W._Dijkstra
