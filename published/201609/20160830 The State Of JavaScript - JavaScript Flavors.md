JavaScript 现状：方言篇
===========

JavaScript 和其他编程语言有一个很大的不同，它不像单纯的一个语言，而像一个由众多方言组成大家族。

从 2009 年 CoffeeScript 出现开始，近几年出现了大量基于 JavaScript 语言，或者叫方言，例如 ES6、TypeScript、Elm 等等。它们都有自己的优势，且都可以被完美编译成标准 JavaScript。

所以，继上周的前端框架篇，今天带来 JavaScript 现状之方言篇，看一下大家对于 JavaScript 的方言是怎么选择的。

> 声明：下面的部分结论来自部分数据，这是在我想要展示完整数据时找到的最好的办法，这便于我分享我的一些想法。

> 注意：如果你还没有参与[这个调查][3]，现在就来参加吧，可以花十分钟完成调查然后再回来看这篇文章。

### 认知度

首先，我想看一下参与问卷调查的人是否**知道**下面六种语言：

- 经典的 JavaScript: 97%
- ES6: 98%
- CoffeeScript: 99%
- TypeScript: 98%
- Elm: 66%
- ClojureScript: 77%

你可能觉得 100% 的人都应该知道『经典的 JavaScript 』，我想是有人无法抵抗在一个 JavaScript 调查中投『我从来没有听说过 JavaScript 』这个选项的强大诱惑吧……

几乎所有人都知道 ES6、CoffeeScript 和 TypeScript 这三种语言，比较令我惊讶的是 TypeScript 竟然会稍微落后于 ES6 和 CoffeeScript。

另一方面，Elm 和 ClojureScript 得分就要低得多，当然这也有道理，因为它们跟自己的生态环境绑定的比较紧密，也很难在已有的 App 中进行使用。

### 兴趣度

接下来，让我们一起看一下，哪一种方言吸引新开发者的能力更强一些：

![](https://d3ugvbs94d921r.cloudfront.net/57c4dc599973d2525fee820a.png?t=3efc9491eba2ce2)

要注意，该表是统计该语言对从未使用过它们的用户的吸引度，因为只有很少人没有用过经典 JavaScript，所以『经典 JavaScript 』这一列的数值很低。

ES6的数值很有趣：已有很大比例的用户在使用 ES6 了，没有用过的人中的绝大部分（89%）也很想学习它。

TypeScript 和 Elm 的状态差不多：用过的人不多，但感兴趣的比例表现不错，分别是 53% 和 58%。

如果让我预测一下，那我觉得 TypeScript 和 Elm 都很难向普通的 JavaScript 开发者讲明自己的优势。毕竟如果开发者只懂 JavaScript 的话，你很难解释清楚静态类型的好处。

另外，只有很少开发者用过 CoffeeScript，而且很明显几乎没人想去学。我觉得我该写一本 12 卷厚的 CoffeeScript 百科全书了……

### 满意度

现在是最重要的问题的时间了：有多少开发者用过这些语言，有多少人还想继续使用这些方言呢？

![](https://d3ugvbs94d921r.cloudfront.net/57c4e5f79973d29461ee820a.png?t=1061d2ab8fc9838)

虽然经典 JavaScript 拥有最多的用户量，但就满意度来说 ES6 才是大赢家，而且我想现在已经能安全的说，ES6 可以作为开发 JavaScript App 默认的语言。

TypeScript 和 Elm 有相似的高满意度，都在 85% 上下。然后，只有可怜的 17% 的开发者会考虑继续使用 CoffeeScript。

### 快乐度

最后一个问题，我问大家在用现在的方式写 JavaScript 时是否感到快乐：

![](https://d3ugvbs94d921r.cloudfront.net/57c4cd8c9973d2d95bee820a.png?t=f53efb029ea4456)

这个问题的答案和上一个问题的满意度想匹配：平均分达到 3.96 分（1 - 5 分），大家在使用 JavaScript 时候确实是快乐的。

不过很难说高分是因为 JavaScript 最近的一些改进造成的呢，还是发现 JavaScript 可能（仅仅是可能）没有大家认为的那么讨厌。总之，JavaScript 令人满意。

### 总结

如果说上次的赢家是 React 和 Vue，那此次调查的冠军毫无争议是 ES6 了。 ES6 并带来没有开天辟地的变化，但整个社区都还是很认可当前 JavaScript 演进方向的。

我觉得一年之后我们再来一次这样的调查，结果会很有趣。同时也可以关注一下 TypeScript、Elm 还有ClojureScript 有没有继续进步。

个人认为，当前 JavaScript 大家庭百花齐放的现象还只是一个开始，或许几年之后 JavaScript 就会变得非常不同了。

### 结语 & 敬请期待

对于我这样的调查来说数据越多就意味着数据越准确！越多人参加这个调查，那就越能代表整个 JavaScript 社区。

所以，我十分希望你能帮忙分享这个调查问卷：

- [在 Twitter 上][1]
- [在 Facebook 上][2]

另外，如果你想收到我下一个调查结果分析，前往 [调查问卷主页][3] 并留下自己的邮箱吧。

--------------------------------------------------------------------------------

via: https://medium.com/@sachagreif/the-state-of-javascript-javascript-flavors-1e02b0bfefb6

作者：[Sacha Greif][a]
译者：[eriwoon](https://github.com/eriwoon)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://medium.com/@sachagreif
[1]: https://twitter.com/intent/tweet/?text=The%20State%20Of%20JavaScript%3A%20take%20a%20short%20survey%20about%20popular%20JavaScript%20technologies%20http%3A%2F%2Fstateofjs.com%20%23stateofjs
[2]: https://facebook.com/sharer/sharer.php?u=http%3A%2F%2Fstateofjs.com
[3]: http://stateofjs.com/
