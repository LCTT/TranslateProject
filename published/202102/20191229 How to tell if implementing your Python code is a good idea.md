[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13116-1.html)
[#]: subject: (How to tell if implementing your Python code is a good idea)
[#]: via: (https://opensource.com/article/19/12/zen-python-implementation)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

如何判断你的 Python 代码实现是否合适？
======

> 这是 Python 之禅特别系列的一部分，重点介绍第十七和十八条原则：困难和容易。

![](https://img.linux.net.cn/data/attachment/album/202102/14/120518rjkwvjs76p9d1911.jpg)

一门语言并不是抽象存在的。每一个语言功能都必须用代码来实现。承诺一些功能是很容易的，但实现起来就会很麻烦。复杂的实现意味着更多潜在的 bug，甚至更糟糕的是，会带来日复一日的维护负担。

对于这个难题，[Python 之禅][2] 中有答案。

### <ruby>如果一个实现难以解释，那就是个坏思路<rt>If the implementation is hard to explain, it's a bad idea</rt></ruby>

编程语言最重要的是可预测性。有时我们用抽象的编程模型来解释某个结构的语义，而这些模型与实现并不完全对应。然而，最好的释义就是*解释该实现*。

如果该实现很难解释，那就意味着这条路行不通。

### <ruby>如果一个实现易于解释，那它可能是一个好思路<rt>If the implementation is easy to explain, it may be a good idea</rt></ruby>

仅仅因为某事容易，并不意味着它值得。然而，一旦解释清楚，判断它是否是一个好思路就容易得多。

这也是为什么这个原则的后半部分故意含糊其辞的原因：没有什么可以肯定一定是好的，但总是可以讨论一下。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-implementation

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/devops_confusion_wall_questions.png?itok=zLS7K2JG (Brick wall between two people, a developer and an operations manager)
[2]: https://www.python.org/dev/peps/pep-0020/
