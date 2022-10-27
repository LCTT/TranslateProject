[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13082-1.html)
[#]: subject: (The importance of consistency in your Python code)
[#]: via: (https://opensource.com/article/19/12/zen-python-consistency)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Python 代码一致性的重要性
======

> 本文是 Python 之禅特殊系列的一部分，重点是第十二、十三和十四原则：模糊性和明确性的作用。

![](https://img.linux.net.cn/data/attachment/album/202102/03/231758po1lcicxmxyjxlba.jpg)

最小惊喜原则是设计用户界面时的一个 [准则][2]。它是说，当用户执行某项操作时，程序执行的事情应该使用户尽量少地感到意外。这和孩子们喜欢一遍又一遍地读同一本书的原因是一样的：没有什么比能够预测并让预测成真更让人欣慰的了。

在开发 [ABC 语言][3]（Python 的灵感来源）的过程中，一个重要的见解是，编程设计是用户界面，需要使用与 UI 设计者相同的工具来设计。值得庆幸的是，从那以后，越来越多的语言采用了 UI 设计中的<ruby>可承受性<rt>affordance</rt></ruby>和<ruby>人体工程学<rt>ergonomics</rt></ruby>的概念，即使它们的应用并不严格。

这就引出了 [Python 之禅][4] 中的三个原则。

### <ruby>面对歧义，要拒绝猜测的诱惑<rt>In the face of ambiguity, refuse the temptation to guess</rt></ruby>

`1 + "1"` 的结果应该是什么? `"11"` 和 `2` 都是猜测。这种表达方式是*歧义的*：无论如何做都会让一些人感到惊讶。

一些语言选择猜测。在 JavaScript 中，结果为 `"11"`。在 Perl 中，结果为 `2`。在 C 语言中，结果自然是空字符串。面对歧义，JavaScript、Perl 和 C 都在猜测。

在 Python 中，这会引发 `TypeError`：这不是能忽略的错误。捕获 `TypeError` 是非典型的：它通常将终止程序或至少终止当前任务（例如，在大多数 Web 框架中，它将终止对当前请求的处理）。 

Python 拒绝猜测 `1 + "1"` 的含义。程序员必须以明确的意图编写代码：`1 + int("1")`，即 `2`；或者 `str(1) + "1"`，即 `"11"`；或 `"1"[1:]`，这将是一个空字符串。通过拒绝猜测，Python 使程序更具可预测性。

### <ruby>尽量找一种，最好是唯一一种明显的解决方案<rt>There should be one—and preferably only one—obvious way to do it</rt></ruby>

预测也会出现偏差。给定一个任务，你能预知要实现该任务的代码吗？当然，不可能完美地预测。毕竟，编程是一项具有创造性的任务。

但是，不必有意提供多种冗余方式来实现同一目标。从某种意义上说，某些解决方案或许 “更好” 或 “更 <ruby>Python 化<rt>Pythonic</rt></ruby>”。

对 Python 美学欣赏部分是因为，可以就哪种解决方案更好进行健康的辩论。甚至可以持不同观点而继续编程。甚至为使其达成一致，接受不同意的观点也是可以的。但在这一切之下，必须有一种这样的认识，即正确的解决方案终将会出现。我们必须希望，通过商定实现目标的最佳方法，而最终达成真正的一致。

### <ruby>虽然这种方式一开始可能并不明显（除非你是荷兰人）<rt>Although that way may not be obvious at first (unless you're Dutch)</rt></ruby>

这是一个重要的警告：首先，实现任务的最佳方法往往*不*明显。观念在不断发展。Python 也在进化。逐块读取文件的最好方法，可能要等到 Python 3.8 时使用 [walrus 运算符][5]（`:=`）。

逐块读取文件这样常见的任务，在 Python 存在近 *30年* 的历史中并没有 “唯一的最佳方法”。

当我在 1998 年从 Python 1.5.2 开始使用 Python 时，没有一种逐行读取文件的最佳方法。多年来，知道字典中是否有某个键的最佳方法是使用关键字 `.haskey`，直到 `in` 操作符出现才发生改变。

只是要意识到找到实现目标的一种（也是唯一一种）方法可能需要 30 年的时间来尝试其它方法，Python 才可以不断寻找这些方法。这种历史观认为，为了做一件事用上 30 年是可以接受的，但对于美国这个存在仅 200 多年的国家来说，人们常常会感到不习惯。

从 Python 之禅的这一部分来看，荷兰人，无论是 Python 的创造者 [Guido van Rossum][6] 还是著名的计算机科学家 [Edsger W. Dijkstra][7]，他们的世界观是不同的。要理解这一部分，某种程度的欧洲人对时间的感受是必不可少的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-consistency

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

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
