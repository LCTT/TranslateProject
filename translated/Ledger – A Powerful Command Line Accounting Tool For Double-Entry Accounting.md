Ledger - 复式记账的一个功能强大的命令行工具
=====

无论你是电脑极客或普通用户，管理账户开销总是必须的。虽然在Linux上有很多受欢迎的基于GUI的记账工具可用（比如 - [GNUCash][1]），工作在命令行的记账工具是很多用户很难想象的。这篇文章中，我们将讨论一个强大的命令行记账工具 - **Ledger**。

![](https://github-camo.global.ssl.fastly.net/b8a47fab9cc5ca0362153f59631225231edb0ea1/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f6c65646765722d6d61696e2e706e67)

**Ledger - 复式记账工具**

Ledger是复式记账的一个功能强大的命令行工具。对于那些新术语“复式（Double-Entry）”，这意味着每笔交易都必须有一个源。在一个外行人的角度来看，这意味着，每做成一笔账户信贷，一个账户必须有一个借记卡。所以，Ledger跟踪资金运转并且帮助你了解你的开支。

Ledger没有自己的数据库，它依赖于通过用户维护一个开支表（一个简单的文本文件）。尽管开支表是一个特殊的格式，但是Ledger明白。

例如，这是我准备的一个简单的开支表：

![](https://github-camo.global.ssl.fastly.net/6dee19502f56eb2f6d5e6eebff2c31372cb6d08f/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f6c65646765722d31312e706e67)

几个值得注意的要点：  

* 分类之下的所有行是tab缩进（例如 - Shopping，Leisure或EMI）。
* 同样的，所有的开支金额也是tab缩进（包括：$）。
* 复式记账工具重要的是要指定信用卡和借记卡。否则Ledger将出错。 

**简短教程**

一旦开支表准备好了，你该如何检查总体费用：  

![](https://github-camo.global.ssl.fastly.net/e0d7b4573b08c548aeac803e7d12c643553954a4/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f6c65646765722d322e706e67)

所以，通过**-f 选项**你可以看到，你可以指定你的开支表的名称并且balance是Ledger的一个命令，处理总付款记录是明确显示的。另外，借记卡支付是用红色显示，支出用白色显示。

正如前面所讨论的，Ledger要求用户输入正确的借方贷方详细信息。这里举个错误的例子，当错误的借方贷方关联在开支表中被提到：  

![](https://github-camo.global.ssl.fastly.net/0c4aea5945a961930e114ee9a9cf58767dea6faa/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f6c65646765722d332e706e67)

我只是把鞋子的购物费用从$50改到$60，但是没改变付款价格。正如你看到的，Ledger显示了“**Transaction does not balance**“错误。

除了balance命令，你可以用**register**命令去显示所有条目对应的报表查询。

例如：  

![](https://github-camo.global.ssl.fastly.net/89e9a7f7ad85434c2b4f3a272e8d27471766a760/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f6c65646765722d342e706e67)

所以，你可以在这个例子上看到 - **register**命令用shopping报表查询在输出中显示了这个分类的所有交易记录所叙述的。

这只是冰山一角，Ledger提供很多其他选项值得一试（包括：report generation）。更多内容访问[手册页][2]。

**优点**

* 强大且功能丰富的记账工具
* 便于使用
* 彩色输出

**缺点**

* 开支文件需要分别维护
* 有学习曲线

**下载/安装**

这有一些叙述Ledger命令行工具的重要链接：  

* [主页][3]
* [下载][4]
* [文档][5]
* [一个在LWN上的详细综述][6]

via: <http://mylinuxbook.com/ledger-command-line-accounting-tool-2/>

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.gnucash.org/
[2]:http://www.ledger-cli.org/3.0/doc/ledger.1.html
[3]:http://www.ledger-cli.org/
[4]:http://www.ledger-cli.org/download.html
[5]:http://www.ledger-cli.org/2.6/ledger.pdf
[6]:http://lwn.net/Articles/501681/
