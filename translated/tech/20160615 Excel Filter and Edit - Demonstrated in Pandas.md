Excel “过滤和编辑” - Pandas中的示范操作
==================================================

![](http://pbpython.com/images/Boolean-Indexing-Example.png)

### 介绍

我听许多人说我[之前的关于pandas处理一般的Excel任务][1]的文章对于帮助新的pandas用户将Excel任务转化成对应的pandas代码是有用的。这边文章将会保持那个传统通过介绍不同的pandas使用Excel的过滤功能作为一个模型进行索引的例子来理解这样的处理。

大多数pandas的新手首先学到的东西就是基本的数据过滤。即使在过去的时间中使用pandas工作持续数月，我最近意识到我没有在我每天的工作中使用的pandas过滤的方法还有另外一个好处。也就是说，你可以在一个给定的列上过滤，但更新另一组列通过使用一个简化的pandas的语法。这和我所说的Excel中的“过滤和编辑”很像。

这篇文章将会介绍一些过滤一个pandas数据帧同时更新各种标准的例子。同时，我将解释关于panda的索引和如何使用索引功能例如 .loc , .ix和 .iloc来简单快速的更新一个基于简单或者是复杂标准的数据子集。

### Excel: “过滤与编辑”

在数据透视表以外，在EXCEL工具的顶部是一过滤器。这个简单的工具允许用户通过不同的数据，文本与格式标准去快速过滤与排序数据。这里是由几个不同的条件过滤数据产生的样本数据的基本截图：

![](http://pbpython.com/images/filter-example.png)
该过滤过程是直观的，即使是最新手的用户，也很容易掌握。我也注意到，人们将使用此功能来选择行的数据，然后根据行的标准更新额外的列。下面的例子显示了我所描述的情形：

![](http://pbpython.com/images/commission-example.png)

在这个例子中，我过滤了Account Number, SKU和Unit Price的数据。接着我手工增加了Commission_Rate这列并且在每个单元格中输入0.01。这种方法的好处是可以很容易理解和管理有联系的复杂数据而不用写长Excel公式或者进入VBA。这种方法的缺点是，它是不可重复的，同时，对于从外面入门的人了解哪些标准被用于任何过滤器可能是困难的。

例如，假设你看相关的截图，如果不看每一列数据，没有明显的方法去知道什么被过滤了。幸运的是，我们可以在pandas中完成相似操作。不奇怪的是，在pandas中使用简单干净的代码来执行“过滤和编辑”模式是简单的。


### 布尔检索

现在，我想通过pandas中一些布尔索引的细节来使你对这个问题有点感觉。
如果你想要去理解pandas的在大部分广泛的[索引和数据选择][3]这是一个重要的概念去理解。这种想法可能看起来有点复杂，对新的pandas用户（可能对经验丰富的用户来说太基础），但我认为重要的是要花一些时间，了解它。如果你掌握了这一概念，用pandas进行数据工作的基本过程将更简单。

pandas支持索引(或者选择数据)通过使用标签，基于数字的位置或者一个布尔值的队列(True/False)。使用一个布尔值的列表来选择一个行被称为布尔索引，将是本文其余部分的重点。

我发现，我的pandas的工作流程往往侧重于使用布尔值的列表选择我的数据。换句话说，当我创建了pandas数据帧，我倾向于保持默认的索引在数据框架。因此，索引本身并不具有真正意义，同时也不是简单的选择数据。



>关键点
> pandas中布尔索引是一个（几个）选择行的数据的强大的和有用的方法。

让我们看一些例子，数据框架帮助澄清布尔指标在pandas中做的是什么。

首先，我们将创建一个非常小的数据帧仅仅从一个Python的列表获得并使用它来展示布尔检索是如何工作的。


```
import pandas as pd
sales = [('account', ['Jones LLC', 'Alpha Co', 'Blue Inc', 'Mega Corp']),
         ('Total Sales', [150, 200, 75, 300]),
         ('Country', ['US', 'UK', 'US', 'US'])]
df = pd.DataFrame.from_items(sales)
```

 |account	|Total Sales	|Country
:--|:--     |:--          |:
0	|Jones LLC	|150	|US
1	|Alpha Co	|200	|UK
2	|Blue Inc	|75	|US
3	|Mega Corp	|300	|US

注意值0-3，是怎么样会自动分配给行？这些都是指数，在这个数据集它们不是特别有意义的，但对pandas是有用的，重要的是要了解如下其他没有描述的使用情况下。

当我们引用布尔索引时，我们只是说，我们可以通过一个真实或错误的值的列表表示我们要查看的每一行。


在这种情况下，如果我们想查看Jones有限责任公司，Blue公司和Mega公司的数据，我们可以看到，True False名单会看起来像这样：

```
indices = [True, False, True, True]
```
它应该是毫不奇怪，你可以通过把这个列表，传入你的数据，你就看到它只会显示帧中我们的值是True的行：

```
df[indices]
```

 |account	|Total Sales	|Country
:--|:--|:--|:--
0	|Jones LLC	|150	|US
2	|Blue Inc	|75	|US
3	|Mega Corp	|300	|US

这里是一个刚刚发生的操作图像:

![](http://pbpython.com/images/Boolean-Indexing-Example.png)

手工的列表创建索引是工作的。但是显然对任何一个超过微不足道的数据集不是可扩展或是很有用的。幸运的是，pandas就可以用一个简单的查询语言，有熟悉用Python创建这些布尔指标应该很容易（或任何语言）。

例如，让我们看看来自美国的所有销售线。如果我们执行的Python表达式基于Country列：


```
df.Country == 'US'
```

```
0     True
1    False
2     True
3     True
Name: Country, dtype: bool
```

这个例子显示了pandas如何将你的Python的传统逻辑，把它应用到一个数据帧并返回一个布尔值列表。那么这个布尔值的列表可以通过帧的数据获取相应的行。

在真正的代码中，你不需要做这两个步骤。简洁的做这事的方法典型的看上去如下：

```
df[df["Country"] == 'US']
```

 |account	|Total Sales	|Country
:--|:--|:--|:--
0	|Jones LLC	|150|	US
2	|Blue Inc	|75	|US
3	|Mega Corp|	300|	US

虽然这个概念很简单，你可以编写非常复杂的逻辑，使用Python的威力过滤数据。


>关键点
>在这个例子中, `df[df.Country == 'US']` 等价于 `df[df["Country"] == 'US']`  ‘.’ 标记法是简洁的但是在你列名有空格时不会工作。


### 选择需要的列

现在，我们已经找到了如何选择行的数据，我们如何控制哪些列显示？在上面的例子中，没有明显的方法去做。Pandas能使用三种基于位置的索引支持这个用法：.loc , iloc , 和 .ix . 。这些功能也允许我们选择除了我们所看到的行挑选列。



在这里有很大的困惑关于什么时候选择使用 .loc , iloc , 或者是 .ix。 快速总结的区别是:

- .loc 用于标签索引
- .iloc 用于基于整数的位置
- .ix 是一个将尝试使用标签的快捷方式 (like .loc ) 但失败后将回落到基于位置的整数 (like .iloc )

因此问题是我该使用哪个?我必须坦诚我有的时候也会被这些搞混.我发现我最常使用 .loc 。主要是因为我的数据不适合于有意义的基于位置的索引(换句话说，我很少发现自己需要使用 .iloc ) 所以我坚持使用 .loc。

公平讲，每一个方法都有自己的位置，在许多情况下都是有用的。特别的一个场景是当处理多指标数据帧时。我不会在这篇文章中讨论那个话题-也许在未来的博文会说。

现在我们已经涵盖了这样一个话题，让我们来展示如何筛选一行的值的数据帧，具体选择要显示的列。

继续我们的例子，如果我们只是想显示对应于我们的指数的帐户名称，该怎么做？使用.loc很简单：


```
df.loc[[True, True, False, True], "account"]
```

```
1     Alpha Co
2     Blue Inc
3    Mega Corp
Name: account, dtype: object
```

如果你想看到多个列，只需通过一个列表：

```
df.loc[[True, True, False, True], ["account", "Country"]]
```

 |	account	|Country
:--|:--|:--
0	|Jones LLC|	US
1	|Alpha Co	|UK
3	|Mega Corp	|US

真正的威力是当你在你的数据上创建更复杂的查询。在这种情况下，让我们展示所有的帐户名称和销售> 200的国家：

```
df.loc[df["Total Sales"] > 200, ["account", "Country"]]
```

|account|	Country
	:--|:--|:--
3	|Mega Corp|	US

这个过程可以被认为有点相当于我们上面讨论过的Excel的过滤器。你已经加入了额外的好处，你也可以限制你检索的列数，而不仅仅是行。


### 编辑列

所有这些都是好的背景，但当你使用一个类似的方法来更新一个或多个列的基础上的行选择这个过程真的是闪光的。


一个简单的例子，让我们增加一个佣金率列到我们的数据：

```
df["rate"] = 0.02
```

 |	account	|Total Sales|	Country	|rate
:--|:--|:--|:--|:--
0	|Jones LLC	|150	|US	|0.02
1	|Alpha Co	|200	|UK	|0.02
2	|Blue Inc	|75	|US	|0.02
3	|Mega Corp	|300	|US	|0.02

让我们说，如果你卖了超过100，你的利率是5%。基本的过程是设置一个布尔索引来选择列，然后将该值赋给利率列：


```
df.loc[df["Total Sales"] > 100, ["rate"]] = .05
```

 |	account	|Total Sales|	Country|	rate
:--|:--|:--|:--|:--
0	|Jones LLC	|150|	US|	0.05
1	|Alpha Co	|200	|UK	|0.05
2|	Blue Inc	|75|	US	|0.02
3	|Mega Corp	|300|	US|	0.05

希望如果你看过这篇文章，这将是有意义的，它会帮助你理解这个语法是如何工作的。现在你有了“过滤和编辑”方法的基本原理。最后一节将更详细的在Excel和pandas显示这个过程。


### 将这些合并在一起

对于最后的例子，我们将创建一个简单的佣金计算器，使用以下规则：

- 所有的佣金计算在交易水平
- 所有销售的基础佣金为2%
- 所有衬衫都将获得2.5%的佣金
- 一个特殊的程序正在进行中，在一个交易中销售的数额>10带得到4%的佣金
- 所有在一个单一的交易鞋类销售> 1000美元有一个特别的奖金为250美元加上一个4.5%的的佣金

为了在Excel做到这一点，使用的过滤器和编辑方法：

- 添加一个2%的佣金列
- 添加一个0美元的奖金列
- 衬衫上的过滤器，并将vale改为2.5%
- 清楚过滤器
- 带和数量的过滤器>10和将值更改为4%
- 清除过滤器
- 鞋类过滤器> 1000美元，并增加佣金和奖金价值分别为4.5%和250美元


我不会显示每一步的屏幕快照，但这里是最后一个过滤器的屏幕快照：

![](http://pbpython.com/images/filter-2.png)

这种方法很简单，可以在很好的操作，但它不具备很好的可重复性，也不能审核。当然还有其他的方法，如在Excel公式或VBA实现这些。然而，这种过滤器和编辑的方法是常见的，是说明性的pandas的逻辑。

现在, 让我们在pandas中运行这个例子.

首先，读入[Excel 文件][4]同时加入默认值2%的利息一列：
```
import pandas as pd
df = pd.read_excel("https://github.com/chris1610/pbpython/blob/master/data/sample-sales-reps.xlsx?raw=true")
df["commission"] = .02
df.head()
```

 |	account number|	customer name|	sales rep|	sku	|category	|quantity	|unit price|	ext price|	date|	commission
:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--
0	|680916	|Mueller and Sons	|Loring Predovic	|GP-14407	| Belt	|19	|88.49	|1681.31	|2015-11-17 05:58:34|	0.02
1	|680916	|Mueller and Sons	|Loring Predovic	|FI-01804|	Shirt	|3|	78.07|	234.21	|2016-02-13 04:04:11	|0.02
2	|530925	|Purdy and Sons|	Teagan O’Keefe	|EO-54210	|Shirt	|19	|30.21	|573.99	|2015-08-11 12:44:38	|0.02
3	|14406|	Harber, Lubowitz and Fahey|	Esequiel Schinner|	NZ-99565|	Shirt|	12|	90.29	|1083.48	|2016-01-23 02:15:50	|0.02
4	|398620|	Brekke Ltd	|Esequiel Schinner	|NZ-99565	|Shirt	|5|	72.64	|363.20	|2015-08-10 07:16:03	|0.02

下一个规则是所有衬衫获得2.5%和带销售>10得到一个4%的利息：

```
df.loc[df["category"] == "Shirt", ["commission"]] = .025
df.loc[(df["category"] == "Belt") & (df["quantity"] >= 10), ["commission"]] = .04
df.head()
```

|	account number	|customer name	|sales rep|	sku	|category	|quantity|	unit price|	ext price	|date	|commission
	:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--
0	|680916|	Mueller and Sons|	Loring Predovic|	GP-14407|	Belt|	19	|88.49|	1681.31	|2015-11-17 05:58:34|	0.040
1	|680916|	Mueller and Sons|	Loring Predovic|	FI-01804|	Shirt	|3	|78.07	|234.21|	2016-02-13 04:04:11	|0.025
2	|530925	|Purdy and Sons	|Teagan O’Keefe|	EO-54210	|Shirt|	19	|30.21	|573.99	|2015-08-11 12:44:38|	0.025
3	|14406|	Harber, Lubowitz and Fahey|	Esequiel Schinner|	NZ-99565|	Shirt|	12|	90.29|	1083.48|	2016-01-23 02:15:50	|0.025
4	|398620|	Brekke Ltd|	Esequiel Schinner|	NZ-99565|	Shirt|	5	|72.64	|363.20|	2015-08-10 07:16:03	|0.025

最后的佣金规则是加上特别的奖金：

```
df["bonus"] = 0
df.loc[(df["category"] == "Shoes") & (df["ext price"] >= 1000 ), ["bonus", "commission"]] = 250, 0.045

# Display a sample of rows that show this bonus
df.ix[3:7]
```

|	account number|	customer name	|sales rep|	sku	|category|	quantity|	unit price|	ext price|	date|	commission|	bonus
	:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--
3|	14406|	Harber, Lubowitz and Fahey|	Esequiel Schinner|	NZ-99565|	Shirt	|12	|90.29|	1083.48	|2016-01-23 02:15:50	|0.025	|0
4|	398620|	Brekke Ltd|	Esequiel Schinner	|NZ-99565|	Shirt|	5|	72.64|	363.20|	2015-08-10 07:16:03|	0.025|	0
5|	282122|	Connelly, Abshire and Von	Beth| Skiles|	GJ-90272|	Shoes|	20|	96.62|	1932.40	|2016-03-17 10:19:05	|0.045	|250
6	|398620	|Brekke Ltd|	Esequiel Schinner	|DU-87462	|Shirt|	10|	67.64	|676.40|	2015-11-25 22:05:36|	0.025|	0
7|	218667|	Jaskolski-O’Hara|	Trish Deckow|	DU-87462|	Shirt	|11|	91.86|	1010.46	|2016-04-24 15:05:58|	0.025|	0

为了做好佣金的计算：

```
#  Calculate the compensation for each row
df["comp"] = df["commission"] * df["ext price"] + df["bonus"]

# Summarize and round the results by sales rep
df.groupby(["sales rep"])["comp"].sum().round(2)
```

```
sales rep
Ansley Cummings       2169.76
Beth Skiles           3028.60
Esequiel Schinner    10451.21
Loring Predovic      10108.60
Shannen Hudson        5275.66
Teagan O'Keefe        7989.52
Trish Deckow          5807.74
Name: comp, dtype: float64
```


如果你有兴趣，一个例子手册被托管在[github][5].

### 总结


感谢阅读文章。 我发现，在学习如何使用pandas的新用户的最大的挑战之一是如何找出如何使用他们的基于Excel的知识，以建立一个等效的pandas为基础的解决方案。在许多情况下,andas的解决方案将是更健壮，更快，更容易审计和更强大的。然而，学习曲线可以花一些时间。我希望这个例子显示了如何解决一个问题，使用的是电子表格的过滤工具将是一个有用的指南，为那些刚刚在这个pandas开始的旅程的。祝你好运!

--------------------------------------------------------------------------------

via: http://pbpython.com/excel-filter-edit.html 

作者：[Chris Moffitt ][a]
译者：[zky001](https://github.com/zky001)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://pbpython.com/author/chris-moffitt.html
[1]: http://pbpython.com/excel-pandas-comp.html
[2]: http://pbpython.com/excel-pandas-comp-2.html
[3]: http://pandas.pydata.org/pandas-docs/stable/indexing.html
[4]: https://github.com/chris1610/pbpython/blob/master/data/sample-sales-reps.xlsx?raw=true
[5]: https://github.com/chris1610/pbpython/blob/master/notebooks/Commissions-Example.ipynb
