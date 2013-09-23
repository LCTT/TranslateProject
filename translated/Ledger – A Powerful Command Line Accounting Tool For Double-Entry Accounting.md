Ledger – A Powerful Command Line Accounting Tool For Double-Entry Accounting
Ledger-一个命令行下的强大的复式记账的会计工具
==========
Whether you are a computer geek or a normal user, keeping account of expenses is always essential. While there are many popular GUI based accounting tools available for Linux (For example – [GNUCash][1]), working on a command line accounting tool is hard to imagine for most of the users. In this article, we will discuss a powerful command line accounting tool – **Ledger**.
不管你是一个电脑极客或者一个常规的用户，保持消费的会计帐总是很有用。由于在linux环境下有很多基于GUI（图形化用户界面）的会计工具（如GNUCash）,所以对于大多数用户来说在命令行会计工具上工作就显得无法想想了。在本文中，我们会讨论一个强大的命令行会计工具----Ledger

![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-main.png)

**Ledger – Double-Entry Accounting Tool**
Ledger _一个复式记账工具

Ledger is a powerful command line tool for double-entry accounting. For those who are new to the term “Double-Entry”, it means that for every transaction there has to be a source. In a layman’s terms, this means, for every credit made into an account, there has to be a debit from an account. So, ledger keeps track of the movement of money and helps you understand your expenses.
Ledger是一个强大的命令行式的复式记账工具，对于那些对“复式记账”感到新鲜的用户来说，其意味着对于没一次交易都必须有一个源。按照外行来说，这表明对于会计分录中的每一笔贷方都必须有一个借方与之对应。所以，ledger保持对现金流向的跟踪来帮助你了解你的开销。
Ledger does not have a database of its own, it relies on an expense sheet (a simple text file) maintained by the user. Though there is a particular format of the expense sheet that ledger understands.
Ledger自己没有数据库，而是依赖于一个用户自己维护的开支单（一个简单的文本文件），而这个开支单有一个特定的格式以便ledger进行理解。
For example, here is a sample expense sheet that I prepared :
例如，我准备了一个如下的开支单样例：
![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-11.png)

A couple of points worth noting :
有几点值得注意的是：
- All the lines under a category (For example – Shopping, Leisure or EMI) are tab indented
- Similarly, all the expense figures (including $) are also tab indented
- Being Double-Entry accounting tool, it is important to specify both credit and debit. Ledger will give error otherwise.
1.同一个类下的所有行都用tab键缩进（如Shopping,Leisure或EMI）
2.类似地，所有的消费金额（包括$）也用tab进行缩进
3.作为一个复式记账工具，指定借方和贷方是非常重要的，否则Ledger会报错。
**A brief Tutorial**
一个简单的入门教程
Once the expense sheet is ready, here is how you can check the overall expenses :
一旦你的开支单准备好之后，可以通过下面的方式来察看你所有的开销：
![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-2.png)

So you can see that through **-f option**, you can specify your expense sheet name and **balance** is a ledger command that processes total payment records which are displayed categorically. Also, the debit payments are shown in RED while expenditure is shown in WHITE.
可以看到，通过采用 **-f option**的方式，你可以指定你的开支单文件和一个ledger命令“balance”来处理所有显示的分类中的付款记录。同样，借方付款采用红色字体颜色，贷方开销采用白色字体颜色进行显示。

As discussed earlier, ledger requires user to enter correct debit-credit details. Here is an example of error when incorrect debit-credit relationship was mentioned in the expense sheet :
如上所述，ledger需要用户自己正确地输入借方和贷方的明细，如果开支单中的借方和贷方之间的关系不正确的话，会出现以下的错误。
![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-3.png)

I just changed the shopping expense for shoes from $50 to $60 but did not change the payment figure. As you can see that ledger displayed error “**Transaction does not balance**“.
我只是简单地将买鞋子的购物开销从$50改为$60，但是没有改变付款项，如你所见，ledger显示出了一个“交易不平衡”的错误。
Apart from balance, you can use **register** command to display all the entries corresponding to a report-query.
除了资产平衡之外，你也可以使用**register**命令来显示一个报表查询对应的所有实体。
For example :
例如：
![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-4.png)

So, you can see that in the example above -  **register** command was used with report-query shopping and all the transaction related to this category were displayed in output.
所以，通过上面的例子你可以看到，**register**命令是与购物报表查询一起使用，这样所有与该类相关的交易都被输出进行展示。
This was just a tip of an iceberg, ledger provides many other options (including report generation) that are worth trying. Visit the [man page][2] for more.
以上这些仅仅是冰山一角，ledger提供了许多其他的值得尝试的选项（包括生成报表），可以通过访问[man ledger]来获取更多的信息。
**Pros**
总的来说，ledger的优点在于：
1.一个强大的特征丰富的会计分录工具
2.使用简单
3.着色输出
- A powerful and feature rich accounting tool
- Easy to use
- Coloured output.
不足之处在于：
1.开支单文件需要单独地进行维护
2.有一些学习曲线
**Cons**

- Expense file needs to be maintained separately
- Has a bit of learning curve

**Download/Install**
下载和安装：
Here are some of the important links related to ledger command line tool :
这里有一些与ledger命令行工具相关的重要链接。
- [Home Page][3]
- [Download][4]
- [Documentation][5]
- [A detailed review on LWN][6]


via: http://mylinuxbook.com/ledger-command-line-accounting-tool-2/

本文由 [theo][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.gnucash.org/
[2]:http://www.ledger-cli.org/3.0/doc/ledger.1.html
[3]:http://www.ledger-cli.org/
[4]:http://www.ledger-cli.org/download.html
[5]:http://www.ledger-cli.org/2.6/ledger.pdf
[6]:http://lwn.net/Articles/501681/
