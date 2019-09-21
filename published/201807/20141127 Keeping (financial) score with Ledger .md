使用 Ledger 记录（财务）情况
======

自 2005 年搬到加拿大以来，我使用 [Ledger CLI][1] 来跟踪我的财务状况。我喜欢纯文本的方式，它支持虚拟信封意味着我可以同时将我的银行帐户余额和我的虚拟分配到不同的目录下。以下是我们如何使用这些虚拟信封分别管理我们的财务状况。

每个月，我都有一个条目将我生活开支分配到不同的目录中，包括家庭开支的分配。W- 不要求太多， 所以我要谨慎地处理这两者之间的差别和我自己的生活费用。我们处理它的方式是我支付固定金额，这是贷记我支付的杂货。由于我们的杂货总额通常低于我预算的家庭开支，因此任何差异都会留在标签上。我过去常常给他写支票，但最近我只是支付偶尔额外的大笔费用。

这是个示例信封分配：

```
2014.10.01 * Budget
 [Envelopes:Living]
 [Envelopes:Household] $500
 ;; More lines go here
```

这是设置的信封规则之一。它鼓励我正确地分类支出。所有支出都从我的 “Play” 信封中取出。

```
= /^Expenses/
 (Envelopes:Play) -1.0
```

这个为家庭支出报销 “Play” 信封，将金额从 “Household” 信封转移到 “Play” 信封。

```
= /^Expenses:House$/
 (Envelopes:Play) 1.0
 (Envelopes:Household) -1.0
```

我有一套定期的支出来模拟我的预算中的家庭开支。例如，这是 10 月份的。

```
2014.10.1 * House
 Expenses:House
 Assets:Household $-500
```

这是杂货交易的形式：

```
2014.09.28 * No Frills
 Assets:Household:Groceries $70.45
 Liabilities:MBNA:September $-70.45

```

接着 `ledger bal Assets:Household` 就会告诉我是否欠他钱（负余额）。如果我支付大笔费用（例如：机票、通管道），那么正常家庭开支预算会逐渐减少余额。

我从 W- 那找到了一个为我的信用卡交易添加一个月标签的技巧，他还使用 Ledger 跟踪他的交易。它允许我再次检查条目的余额，看看前一个条目是否已被正确清除。

这个资产分类使用有点奇怪，但它在精神上对我有用。

使用 Ledger 以这种方式跟踪它可以让我跟踪我们的杂货费用以及我实际支付费用和我预算费用之间的差额。如果我最终支出超出预期，我可以从更多可自由支配的信封中移动虚拟货币，因此我的预算始终保持平衡。

Ledger 是一个强大的工具。相当极客，但也许更多的工作流描述可能会帮助那些正在搞清楚它的人！

--------------------------------------------------------------------------------

via: http://sachachua.com/blog/2014/11/keeping-financial-score-ledger/

作者：[Sacha Chua][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://sachachua.com
[1]:http://www.ledger-cli.org/
[2]:http://sachachua.com/blog/category/finance/
[3]:http://sachachua.com/blog/tag/ledger/
[4]:http://pages.sachachua.com/sharing/blog.html?url=http://sachachua.com/blog/2014/11/keeping-financial-score-ledger/
[5]:http://sachachua.com/blog/2014/11/keeping-financial-score-ledger/#comments
