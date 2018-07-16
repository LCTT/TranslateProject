Ledger-复式记账的一个功能强大的命令行工具
==================================

无论你是一个电脑极客还是普通用户，记录账户开销总是必不可少的。虽然在Linux上有很多基于GUI的记账工具（比如 - [GNUCash][1]）受到大家欢迎，但是工作在命令行的记账工具是很多用户难以想象的。在本文中，我们将讨论一个功能强大的命令行记账工具-**Ledger**。

![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-main.png)

###Ledger - 复式记账工具

Ledger是复式记账的一个功能强大的命令行工具。对于那些不了解“复式（Double-Entry）”的用户，它这意味着每笔交易都必须有一个源。站在一个外行的角度来看，这意味着，每做成一笔账户信贷，一个账户必须有一个借记卡。所以，Ledger跟踪资金运转并且帮助你了解你的开支。

Ledger没有自己的数据库，它依赖于通过用户维护一个开支表（一个简单的文本文件）。不过开支表有一种Ledger能够理解的特殊格式。

例如，下图是我准备的一个简单的开支表：

![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-11.png)

几个值得注意的要点：  

* 分类之下的所有行是tab缩进（例如 - Shopping，Leisure或EMI）。
* 同样，所有的开支金额也是tab缩进（包括：$）。
* 作为复式记账工具，制定信用卡和借记卡是很重要的，否则Ledger将会报错。 

###简短教程

当你准备好了费用表，参照下图来了解怎样检查总体费用。  

![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-2.png)

所以，通过**-f 选项**你可以看到，你可以指定你的开支表的名称并且balance是Ledger的一个命令，它能够处理明确显示的总付款记录。另外，借记卡支付显示为红色，支出显示为白色。

正如前面所讨论的，Ledger要求用户输入正确的借方贷方详细信息。下面是一个当费用表中提到了错误账户对应关系时的示例： 

![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-3.png)

我只是把鞋子的购物费用从$50改到$60，但是没改变付款价格。正如你看到的，Ledger显示了“**Transaction does not balance**“错误。

除了balance命令，你可以用**register**命令去显示所有条目对应的报表查询。

例如：  

![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-4.png)

所以，你可以从上面示例中看到 - **register**命令是用来shopping报表查询，所有有关这一类的交易都在输出中显示。

这只是冰山一角，Ledger提供很多其他选项值得一试（包括：report generation）。更多内容访问[手册页][2]。

**优点**

* 强大且功能丰富的记账工具
* 便于使用
* 彩色输出

**缺点**

* 开支文件需要分别维护
* 有一定的学习曲线

###下载/安装

下面是一些有关Ledger命令行工具的重要链接：  

* [主页][3]
* [下载][4]
* [文档][5]
* [一个在LWN上的详细综述][6]

Ubuntu用户可以通过Ubuntu软件中心下载和安装这个工具。这篇文章使用的版本是3.0。

###总结

Ledger是一个智能小巧的命令行实用程序用来管理你的开支。你可以用它来管理日常以及复杂的业务账户。虽然它有一定的学习曲线，但是它拥有各种功能，在学习使用Ledger中投入一点努力是值得的。


via: <http://mylinuxbook.com/ledger-command-line-accounting-tool-2/>

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[Caroline]:http://linux.cn/space/14763

[1]:http://www.gnucash.org/
[2]:http://www.ledger-cli.org/3.0/doc/ledger.1.html
[3]:http://www.ledger-cli.org/
[4]:http://www.ledger-cli.org/download.html
[5]:http://www.ledger-cli.org/2.6/ledger.pdf
[6]:http://lwn.net/Articles/501681/