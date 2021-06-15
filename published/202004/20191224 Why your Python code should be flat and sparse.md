[#]: collector: (lujun9972)
[#]: translator: (caiichenr)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12087-1.html)
[#]: subject: (Why your Python code should be flat and sparse)
[#]: via: (https://opensource.com/article/19/12/zen-python-flat-sparse)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

为何你的 Python 代码应是扁平与稀疏的
======

> 本文是 Python 之禅特别系列的第三篇，此篇着眼于其中第五与第六条原则：扁平与稀疏。

![](https://img.linux.net.cn/data/attachment/album/202004/08/191645uiniiy56keig95gi.jpg)

[Python 之禅][2] 之所以得名，正是由于它那简明扼要的规则被设计出的意图在于让读者进行深入地思考，而绝不单是为编程提供一份易于遵守的指南。

读后不去三思其意，断然难以体会 Python 之禅的妙处。倘若 Python 之禅仅仅罗列出一组清晰的法则，那法则之间的矛盾是一种缺憾，然而作为引导读者沉思最优方案沉思的工具，矛盾却是绝佳的。

### <ruby>扁平胜过嵌套<rt>Flat is better than nested</rt></ruby>

迫于对缩进的强硬要求，Python 对“扁平化”的需求显然远超它者。其余编程语言为了缓解对缩进的需求，通常会在嵌套结构里加入一种“作弊”的手段。为了理解这一点，不妨一同来看看 JavaScript。

JavaScript 本质上是异步的，这意味着程序员用 JavaScript 写的代码会用到大量的回调函数。

```
a(function(resultsFromA) {
  b(resultsFromA, function(resultsfromB) {
    c(resultsFromC, function(resultsFromC) {
      console.log(resultsFromC)
   }
  }
}
```

忽略这段代码的具体内容，只去观察这段代码的形状与缩进带来一个最右边的点的方式。这种独特的“箭头”图形在我们扫看代码时格外扎眼，这种写法也因此被视作不可取，甚至得到了“回调地狱”的绰号。不过，在  JavaScript 中，这种反映嵌套关系的缩进可以通过“作弊”来回避。

```
a(function(resultsFromA) {
b(resultsFromA,
  function(resultsfromB) {
c(resultsFromC,
  function(resultsFromC) {
    console.log(resultsFromC)
}}}
```

Python 并没有提供这种作弊手段：每一级嵌套在代码中都如实的对应着一层缩进。因此，Python 深层的嵌套关系在*视觉*上也一定是深层嵌套的。这使得“回调地狱”的问题对于 Python 而言要比在 JavaScript 中严重得多：嵌套的回调函数必定带来缩进，而绝无使用花括号来“作弊”的可能。

这项挑战与 Python 之禅的指导原则相结合后，在我参与的库中催生出了一个优雅的解决方案。我们在 [Twisted][3] 框架里提出了 deferred 抽象，日后 JavaScript 中流行的 promise 抽象亦是受其启发而生。正是由于 Python 对整洁代码的坚守，方能推动 Python 开发者去发掘新的、强力的抽象。

```
future_value = future_result()
future_value.addCallback(a)
future_value.addCallback(b)
future_value.addCallback(c)
```

（现代 JavaScript 程序员也许会觉得这段代码十分眼熟：promise 着实受到了 Twisted 里 deferred 抽象的深远影响。）

### <ruby>稀疏胜过密集<rt>Sparse is better than dense</rt></ruby>

最易降低代码密集程度的方法是引入嵌套。这种习惯也正是有关稀疏的原则要随着前一条提出的原因：在竭尽所能地减少嵌套之后，我们往往会遗留下*密集的*代码或数据结构。此处的密集，是指塞进过量信息的小段代码，它们会导致错误发生后的解析变得困难。

这种密集性唯有通过创造性的思考方可改善，此外别无捷径。Python 之禅并不为我们提供简单的解决方案，它只会指明改善代码的方向，而非提供“如何”去做的向导。

起身走走，泡个热水澡，抑或是闻闻花香。盘坐冥思，直至灵感袭来。当你终于得到启发，便是动身写代码之时。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-flat-sparse

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[caiichenr](https://github.com/caiichenr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://www.python.org/dev/peps/pep-0020/
[3]: https://twistedmatrix.com/trac/
