向 Linus Torvalds 学习让编出的代码具有 “good taste”
========

在[最近关于 Linus Torvalds 的一个采访中][1]，这位 Linux 的创始人，在采访过程中大约 14:20 的时候，提及了关于代码的 “good taste”。good taste？采访者请他展示更多的细节，于是，Linus Torvalds 展示了一张提前准备好的插图。

他展示的是一个代码片段。但这段代码并没有 “good taste”。这是一个具有 “poor taste” 的代码片段，把它作为例子，以提供一些初步的比较。

![Poor Taste Code Example](https://d262ilb51hltx0.cloudfront.net/max/1200/1*X2VgEA_IkLvsCS-X4iPY7g.png)

这是一个用 C 写的函数，作用是删除链表中的一个对象，它包含有 10 行代码。

他把注意力集中在底部的 `if` 语句。正是这个 `if` 语句受到他的批判。

我暂停了这段视频，开始研究幻灯片。我发现我最近有写过和这很像的代码。Linus 不就是在说我的代码品味很差吗？我放下自傲，继续观看视频。

随后， Linus 向观众解释，正如我们所知道的，当从链表中删除一个对象时，需要考虑两种可能的情况。当所需删除的对象位于链表的表头时，删除过程和位于链表中间的情况不同。这就是这个 `if` 语句具有 “poor taste” 的原因。

但既然他承认考虑这两种不同的情况是必要的，那为什么像上面那样写如此糟糕呢？

接下来，他又向观众展示了第二张幻灯片。这个幻灯片展示的是实现同样功能的一个函数，但这段代码具有 “goog taste”　。

![Good Taste Code Example](https://d262ilb51hltx0.cloudfront.net/max/1200/1*GHFLYFB3vDQeakMyUGPglw.png)

原先的 10 行代码现在减少为 4 行。

但代码的行数并不重要，关键是 `if` 语句，它不见了，因为不再需要了。代码已经被重构，所以，不用管对象在列表中的位置，都可以运用同样的操作把它删除。

Linus 解释了一下新的代码，它消除了边缘情况，就是这样。然后采访转入了下一个话题。

我琢磨了一会这段代码。 Linus 是对的，的确，第二个函数更好。如果这是一个确定代码具有 “good taste” 还是 “bad taste” 的测试，那么很遗憾，我失败了。我从未想到过有可能能够去除条件语句。我写过不止一次这样的 `if` 语句，因为我经常使用链表。

这个例子的意义，不仅仅是教给了我们一个从链表中删除对象的更好方法，而是启发了我们去思考自己写的代码。你通过程序实现的一个简单算法，可能还有改进的空间，只是你从来没有考虑过。

以这种方式，我回去审查最近正在做的项目的代码。也许是一个巧合，刚好也是用 C 写的。

我尽最大的能力去审查代码，“good taste” 的一个基本要求是关于边缘情况的消除方法，通常我们会使用条件语句来消除边缘情况。你的测试使用的条件语句越少，你的代码就会有更好的 “taste” 。

下面，我将分享一个通过审查代码进行了改进的一个特殊例子。

这是一个关于初始化网格边缘的算法。

下面所写的是一个用来初始化网格边缘的算法，网格 grid 以一个二维数组表示：grid[行][列] 。

再次说明，这段代码的目的只是用来初始化位于 grid 边缘的点的值，所以，只需要给最上方一行、最下方一行、最左边一列以及最右边一列赋值即可。

为了完成这件事，我通过循环遍历 grid 中的每一个点，然后使用条件语句来测试该点是否位于边缘。代码看起来就是下面这样：

```Tr
for (r = 0; r < GRID_SIZE; ++r) {
    for (c = 0; c < GRID_SIZE; ++c) {
        // Top Edge
        if (r == 0)
            grid[r][c] = 0;
        // Left Edge
        if (c == 0)
            grid[r][c] = 0;
        // Right Edge
        if (c == GRID_SIZE - 1)
            grid[r][c] = 0;
        // Bottom Edge
        if (r == GRID_SIZE - 1)
            grid[r][c] = 0;
    }
}
```

虽然这样做是对的，但回过头来看，这个结构存在一些问题。

1.  复杂性 — 在双层循环里面使用 4 个条件语句似乎过于复杂。
2.  高效性 — 假设 `GRID_SIZE` 的值为 64，那么这个循环需要执行 4096 次，但需要进行赋值的只有位于边缘的 256 个点。

用 Linus 的眼光来看，将会认为这段代码没有 “good taste” 。

所以，我对上面的问题进行了一下思考。经过一番思考，我把复杂度减少为包含四个条件语句的单层 `for` 循环。虽然只是稍微改进了一下复杂性，但在性能上也有了极大的提高，因为它只是沿着边缘的点进行了 256 次循环。

```
for (i = 0; i < GRID_SIZE * 4; ++i) {
    // Top Edge
    if (i < GRID_SIZE)
        grid[0][i] = 0;
    // Right Edge
    else if (i < GRID_SIZE * 2)
        grid[i - GRID_SIZE][GRID_SIZE - 1] = 0;
    // Left Edge
    else if (i < GRID_SIZE * 3)
        grid[i - (GRID_SIZE * 2)][0] = 0;
    // Bottom Edge
    else
        grid[GRID_SIZE - 1][i - (GRID_SIZE * 3)] = 0;
}
```

的确是一个很大的提高。但是它看起来很丑，并不是易于阅读理解的代码。基于这一点，我并不满意。

我继续思考，是否可以进一步改进呢？事实上，答案是 YES！最后，我想出了一个非常简单且优雅的算法，老实说，我不敢相信我会花了那么长时间才发现这个算法。

下面是这段代码的最后版本。它只有一层 `for` 循环并且没有条件语句。另外。循环只执行了 64 次迭代，极大的改善了复杂性和高效性。

```
for (i = 0; i < GRID_SIZE; ++i) {
    // Top Edge
    grid[0][i] = 0;

    // Bottom Edge
    grid[GRID_SIZE - 1][i] = 0;
    // Left Edge
    grid[i][0] = 0;
    // Right Edge
    grid[i][GRID_SIZE - 1] = 0;
}
```

这段代码通过每次循环迭代来初始化四条边缘上的点。它并不复杂，而且非常高效，易于阅读。和原始的版本，甚至是第二个版本相比，都有天壤之别。

至此，我已经非常满意了。

那么，我是一个有 “good taste” 的开发者么？

我觉得我是，但是这并不是因为我上面提供的这个例子，也不是因为我在这篇文章中没有提到的其它代码……而是因为具有 “good taste” 的编码工作远非一段代码所能代表。Linus 自己也说他所提供的这段代码不足以表达他的观点。

我明白 Linus 的意思，也明白那些具有 “good taste” 的程序员虽各有不同，但是他们都是会将他们之前开发的代码花费时间重构的人。他们明确界定了所开发的组件的边界，以及是如何与其它组件之间的交互。他们试着确保每一样工作都完美、优雅。

其结果就是类似于 Linus 的 “good taste” 的例子，或者像我的例子一样，不过是千千万万个 “good taste”。

你会让你的下个项目也具有这种 “good taste” 吗？

--------------------------------------------------------------------------------

via: https://medium.com/@bartobri/applying-the-linus-tarvolds-good-taste-coding-requirement-99749f37684a

作者：[Brian Barto][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@bartobri?source=post_header_lockup
[1]:https://www.ted.com/talks/linus_torvalds_the_mind_behind_linux
