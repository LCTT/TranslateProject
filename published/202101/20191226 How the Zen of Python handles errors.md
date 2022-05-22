[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13058-1.html)
[#]: subject: (How the Zen of Python handles errors)
[#]: via: (https://opensource.com/article/19/12/zen-python-errors)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Python 处理错误的原则
======

> 这是 Python 之禅特别系列的一部分，重点是第十和第十一条原则：沉默的错误（或不沉默）。

![](https://img.linux.net.cn/data/attachment/album/202101/27/223251q261j2ndoccajc16.jpg)

处理“异常情况”是编程中争论最多的问题之一。这可能是因为风险很大：处理不当的错误值甚至可以使庞大的系统瘫痪。由于“异常情况”从本质上来说，是测试不足的，但发生的频率却令人不快，因此，是否正确处理它们往往可以将一个噩梦般的系统与一个“可以工作”的系统区分开来。

从 Java 的 `checked` 异常，到 Erlang 的故障隔离，再到 Haskell 的 `Maybe`，不同的语言对错误处理的态度截然不同。

这两条 [Python 之禅][2]是 Python 对这个话题的冥思。

### <ruby>错误绝不应该悄悄传递...<rt>Errors should never pass silently…</rt></ruby>

当 Python 之禅在 Tim Peters 眼里闪烁而出之前，在维基百科被俗称为“维基”之前，第一个维基网站 [C2][3] 就已经存在了，它是一个编程指南的宝库。这些原则大多来自于 [Smalltalk][4] 编程社区。Smalltalk 的思想影响了许多面向对象的语言，包括 Python。

C2 维基定义了<ruby>武士原则<rt>Samurai Principle</rt></ruby>：“胜利归来，要么不归。”用 Python 人的术语来说，它鼓励摒弃<ruby>哨兵值<rt>sentinel value</rt></ruby>，比如用返回 `None` 或 `-1` 来表示无法完成任务，而是采用引发异常的方式。一个 `None` 是无声的：它看起来像一个值，可以放在一个变量中，然后到处传递。有时，它甚至是一个*有效*的返回值。

这里的原则是，如果一个函数不能完成它的契约，它应该“高调失败”：引发一个异常。所引发的异常永远不会看起来像是一个可能的值。它将跳过 `returned_value = call_to_function(parameter)` 行，并上升到调用栈中，可能使程序崩溃。

崩溃的调试是很直接的：有一个堆栈跟踪来指示问题以及调用堆栈。崩溃可能意味着程序的必要条件没有满足，需要人为干预。它可能意味着程序的逻辑有问题。无论是哪种情况，高调失败都比一个隐藏的、“缺失”的值要好。用 `None` 来感染程序的有效数据，直到它被用在某个地方，就如你可能已经知道的，错误信息会说 “**None 没有方法进行拆分**”。

### <ruby>除非显式消除<rt>Unless explicitly silenced</rt></ruby>

有时需要显式地捕获异常。我们可能会预见到文件中的某些行格式错误，并希望以特殊的方式来处理它们，也许可以把它们放在一个“需要人来看看的行”的文件中，而不是让整个程序崩溃。

Python 允许我们用 `except` 来捕获异常。这意味着错误可以被*显式*消除。这种明确性意味着 `except` 行在代码审查中是可见的。质疑为什么应该在这里显式消除异常并从异常中恢复，是有意义的。自问一下我们是否捕获了太多或太少的异常也是有意义的。

因为这些全都是明确的，所以有人可以阅读代码并了解哪些异常是可以恢复的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-errors

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk (a checklist for a team)
[2]: https://www.python.org/dev/peps/pep-0020/
[3]: https://wiki.c2.com/
[4]: https://en.wikipedia.org/wiki/Smalltalk
