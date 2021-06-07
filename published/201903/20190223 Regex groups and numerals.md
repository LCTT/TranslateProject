[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10594-1.html)
[#]: subject: (Regex groups and numerals)
[#]: via: (https://leancrew.com/all-this/2019/02/regex-groups-and-numerals/)
[#]: author: (Dr.Drang https://leancrew.com)

正则表达式的分组和数字
======

大约一周前，我在编辑一个程序时想要更改一些变量名。我之前认为这将是一个简单的正则表达式查找/替换。只是这没有我想象的那么简单。

变量名为 `a10`、`v10` 和 `x10`，我想分别将它们改为 `a30`、`v30`  和 `x30`。我想到使用 BBEdit 的查找窗口并输入：

![Mistaken BBEdit replacement pattern][2]

我不能简单地 `30` 替换为 `10`，因为代码中有一些与变量无关的数字 `10`。我认为我很聪明，所以我不想写三个非正则表达式替换，`a10`、`v10` 和 `x10`，每个一个。但是我却没有注意到替换模式中的蓝色。如果我这样做了，我会看到 BBEdit 将我的替换模式解释为“匹配组 13，后面跟着 `0`，而不是”匹配组 1，后面跟着 `30`，后者是我想要的。由于匹配组 13 是空白的，因此所有变量名都会被替换为 `0`。

你看，BBEdit 可以在搜索模式中匹配多达 99 个分组，严格来说，我们应该在替换模式中引用它们时使用两位数字。但在大多数情况下，我们可以使用 `\1` 到 `\9` 而不是 `\01` 到 `\09`，因为这没有歧义。换句话说，如果我尝试将 `a10`、`v10` 和 `x10` 更改为 `az`、`vz` 和 `xz`，那么使用 `\1z`的替换模式就可以了。因为后面的 `z` 意味着不会误解释该模式中 `\1`。

因此，在撤消替换后，我将模式更改为这样：

![Two-digit BBEdit replacement pattern][3]

它可以正常工作。

还有另一个选择：命名组。这是使用 `var` 作为模式名称：

![Named BBEdit replacement pattern][4]

我从来都没有使用过命名组，无论正则表达式是在文本编辑器还是在脚本中。我的总体感觉是，如果模式复杂到我必须使用变量来跟踪所有组，那么我应该停下来并将问题分解为更小的部分。

顺便说一下，你可能已经听说 BBEdit 正在庆祝它诞生[25周年][5]。当一个有良好文档的应用有如此长的历史时，手册的积累能让人愉快地回到过去的日子。当我在 BBEdit 手册中查找命名组的表示法时，我遇到了这个说明：

![BBEdit regex manual excerpt][6]

BBEdit 目前的版本是 12.5。第一次出现于 2001 年的 V6.5。但手册希望确保长期客户（我记得是在 V4 的时候第一次购买）不会因行为变化而感到困惑，即使这些变化几乎发生在二十年前。

--------------------------------------------------------------------------------

via: https://leancrew.com/all-this/2019/02/regex-groups-and-numerals/

作者：[Dr.Drang][a]
选题：[lujun9972][b]
译者：[s](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://leancrew.com
[b]: https://github.com/lujun9972
[1]: https://leancrew.com/all-this/2019/02/automation-evolution/
[2]: https://leancrew.com/all-this/images2019/20190223-Mistaken%20BBEdit%20replacement%20pattern.png (Mistaken BBEdit replacement pattern)
[3]: https://leancrew.com/all-this/images2019/20190223-Two-digit%20BBEdit%20replacement%20pattern.png (Two-digit BBEdit replacement pattern)
[4]: https://leancrew.com/all-this/images2019/20190223-Named%20BBEdit%20replacement%20pattern.png (Named BBEdit replacement pattern)
[5]: https://merch.barebones.com/
[6]: https://leancrew.com/all-this/images2019/20190223-BBEdit%20regex%20manual%20excerpt.png (BBEdit regex manual excerpt)
