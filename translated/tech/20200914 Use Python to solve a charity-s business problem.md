[#]: collector: "lujun9972"
[#]: translator: "zepoch"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "Use Python to solve a charity's business problem"
[#]: via: "https://opensource.com/article/20/9/solve-problem-python"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"

使用 Python 来解决慈善机构的业务问题
======

比较不同的编程语言如何解决同一个问题是一个很有趣的事情，也很有指导意义。接下来，我们就来讲一讲 Python。
![Python programming language logo with question marks][1]

在我这一系列的[第一篇文章][2]里，我描述了这样子的一个问题，如何将一大批的救助物资分为具有相同价值的物品，并将其分发给社区中的困难住户。我也曾写过用不同的编程语言写一些小程序来解决这样子的小问题以及比较这些程序时如何工作的。

在第一篇文章中，我是使用了 [Groovy][3] 语言来解决问题的。Groovy 在很多方面都与 [Python][4] 很相似，但是在语法上她更像 C 语言和 Java。因此，使用 Python 来创造一个相同的解决方案应该会很有趣且更有意义。

### 使用 Python 的解决方案

使用 Java 时，我会声明一个 utility 类来保存元组数据（新的特征记录器将会很好地解决这个问题）。使用 Groovy 时，我就是用了 maps 中的映射，我也将在 Python 使用相同的映射

使用一个字典来保存从批发商处批发来的货物：


```
packs = [
        {'item':'Rice','brand':'Best Family','units':10,'price':5650,'quantity':1},
        {'item':'Spaghetti','brand':'Best Family','units':1,'price':327,'quantity':10},
        {'item':'Sardines','brand':'Fresh Caught','units':3,'price':2727,'quantity':3},
        {'item':'Chickpeas','brand':'Southern Style','units':2,'price':2600,'quantity':5},
        {'item':'Lentils','brand':'Southern Style','units':2,'price':2378,'quantity':5},
        {'item':'Vegetable oil','brand':'Crafco','units':12,'price':10020,'quantity':1},
        {'item':'UHT milk','brand':'Atlantic','units':6,'price':4560,'quantity':2},
        {'item':'Flour','brand':'Neighbor Mills','units':10,'price':5200,'quantity':1},
        {'item':'Tomato sauce','brand':'Best Family','units':1,'price':190,'quantity':10},
        {'item':'Sugar','brand':'Good Price','units':1,'price':565,'quantity':10},
        {'item':'Tea','brand':'Superior','units':5,'price':2720,'quantity':2},
        {'item':'Coffee','brand':'Colombia Select','units':2,'price':4180,'quantity':5},
        {'item':'Tofu','brand':'Gourmet Choice','units':1,'price':1580,'quantity':10},
        {'item':'Bleach','brand':'Blanchite','units':5,'price':3550,'quantity':2},
        {'item':'Soap','brand':'Sunny Day','units':6,'price':1794,'quantity':2}]
```

大米有一包，每包中有 10 袋大米，意大利面条有十包，每包中有一袋意大利面条。上述代码中，变量 `packs` 被设置为 Python 字典列表。这与Groovy的方法非常相似。关于 Groovy 和 Python 之间的区别，有几点需要注意：

    1. 在 Python 中，无需关键字来定义变量 `packs`，Python 变量初始化时需要设置一个值。
    2. Python 字典中的词键（例如，`item`, `brand`, `units`, `price`, `quantity`）需要引号来表明它们是字符串；Groovy 假定这些是字符串，但也接受引号。
    3. 在 Python 中，符号 `{ ... }` 表明一个字典声明； Groovy 使用与列表相同的方括号，但两种情况下的结构都必须具有键值对。



当然，表中的价格不是以美元计算的。

接下来，打开散装包。 例如，打开大米的单个散装包装，将产出 10 单位大米； 也就是说，产出的单位总数是`单位 * 数量`。 Groovy 脚本使用一个名为 `collectMany` 的方便的函数，该函数可用于展平列表列表。 据我所知，Python 没有类似的东西，所以使用两个列表推导式来产生相同的结果：


```
units = [[{'item':pack['item'],'brand':pack['brand'],
        'price':(pack['price'] / pack['units'])}] *
        (pack['units'] * pack['quantity']) for pack in packs]
units = [x for sublist in units for x in sublist]
```

第一个列表可理解为（分配给单元）构建字典列表列表。 第二个将其“扁平化”为字典列表。 请注意，Python 和 Groovy 都提供了一个 `*` 运算符，它接受左侧的列表和右侧的数字 `N`，并复制列表 `N` 次。

后一步是将这些单位的大米之类的重新包装到 hamper 中以进行分发。 就像在 Groovy 版本中一样，您需要更具体地了解理想的 hamper 值，当您只剩下几个单位时，您最好不要过度限制，即可以做一些随机分配：


```python
valueIdeal = 5000
valueMax = valueIdeal * 1.1
```

很好！ 重新包装包裹。


```python
import random
hamperNumber = 0           # [1]
while len(units) &gt; 0:      # [2]
    hamperNumber += 1
    hamper = []
    value = 0
    canAdd = True              # [2.1]
    while canAdd:              # [2.2]
        u = random.randint(0,len(units)-1)  # [2.2.1]
        canAdd = False                      # [2.2.2]
        o = 0                               # [2.2.3]
        while o &lt; len(units):               # [2.2.4]
            uo = (u + o) % len(units)
            unit = units[uo]
            unitPrice = unit['price']          # [2.2.4.1]
            if len(units) &lt; 3 or not (unit in hamper) and (value + unitPrice) &lt; valueMax:
                                               # [2.2.4.2]
                hamper.append(unit)
                value += unitPrice
                units.pop(u)                   # [2.2.4.3]
                canAdd = len(units) &gt; 0
                break                          # [2.2.4.4]
            o += 1                             # [2.2.4.5]
                                            # [2.2.5]
    print('')
    print('Hamper',hamperNumber,'value',value)
    for item in hamper:
        print('%-25s%-25s%7.2f' % (item['item'],item['brand'],item['price'])) # [2.3]
    print('Remaining units',len(units))                                       # [2.4]
```

一些澄清，上面注释中括号中的数字（例如，_[1]_）对应于以下澄清：

  * 1\. 导入 Python 的随机数生成器工具并初始化 hampers 数。
  * 2\. 只要有更多可用的单元，这个`while` 循环就会将单元重新分配到 hampers 中：
    * 2.1 增加 hamper 编号，得到一个新的空hamper（单位列表），并将其值设为0； 开始假设您可以向 hamper 中添加更多物品。
    * 2.2 这个 `while` 循环将尽可能多地向 Hamper 添加单元（Groovy 代码使用了 `for` 循环，但 Python 的 `for` 循环期望迭代某些东西，而 Groovy 则是为更传统的 C 形式的 `for` 循环形式）：
      * 2.2.1 获取一个介于 0 和剩余单位数减 1 之间的随机数。
      * 2.2.2 假设您找不到更多要添加的单位。
      * 2.2.3 创建一个变量，用于从您正在寻找要放入 hamper 中的物品的起点的偏移量。
      * 2.2.4 从随机选择的索引开始，这个 `while` 循环将尝试找到一个可以添加到 hamper 的单元（再次注意，Python `for` 循环可能不适合这里，因为列表的长度将在迭代中中发生变化）。
        * 2.2.4.1 找出要查看的单位（随机起点+偏移量）并获得其价格。
        * 2.2.4.2 如果只剩下几个，或者添加单位后篮子的价值不太高，您可以将此单位添加到 Hamper 中。
        * 2.2.4.3 将单位添加到 Hamper 中，按单价增加 Hamper 价值，从可用单位列表中删除该单位。
        * 2.2.4.4 只要还有剩余单位，您就可以添加更多单位，因此可以跳出此循环继续寻找。
        * 2.2.4.5 增加偏移量，。
      * 2.2.5 在退出这个 `while` 循环时，如果你检查了所有剩余的单元并且找不到单元可以添加到 hamper 中，那么 hamper 就完成了搜索； 否则，您找到了一个，可以继续寻找更多。
    * 2.3 打印出 hamper 的内容。
    * 2.4 打印出剩余的单位信息。



运行此代码时，输出看起来与 Groovy 程序的输出非常相似：


```python
Hamper 1 value 5304.0
UHT milk                 Atlantic                  760.00
Tomato sauce             Best Family               190.00
Rice                     Best Family               565.00
Coffee                   Colombia Select          2090.00
Sugar                    Good Price                565.00
Vegetable oil            Crafco                    835.00
Soap                     Sunny Day                 299.00
Remaining units 148

Hamper 2 value 5428.0
Tea                      Superior                  544.00
Lentils                  Southern Style           1189.00
Flour                    Neighbor Mills            520.00
Tofu                     Gourmet Choice           1580.00
Vegetable oil            Crafco                    835.00
UHT milk                 Atlantic                  760.00
Remaining units 142

Hamper 3 value 5424.0
Soap                     Sunny Day                 299.00
Chickpeas                Southern Style           1300.00
Sardines                 Fresh Caught              909.00
Rice                     Best Family               565.00
Vegetable oil            Crafco                    835.00
Spaghetti                Best Family               327.00
Lentils                  Southern Style           1189.00
Remaining units 135

…

Hamper 21 value 5145.0
Tomato sauce             Best Family               190.00
Tea                      Superior                  544.00
Chickpeas                Southern Style           1300.00
Spaghetti                Best Family               327.00
UHT milk                 Atlantic                  760.00
Vegetable oil            Crafco                    835.00
Lentils                  Southern Style           1189.00
Remaining units 4

Hamper 22 value 2874.0
Sardines                 Fresh Caught              909.00
Vegetable oil            Crafco                    835.00
Rice                     Best Family               565.00
Rice                     Best Family               565.00
Remaining units 0
```

最后一个 hamper 在内容和价值上有所简化。

### 结论

乍一看，这个程序的 Python 和 Groovy 版本之间没有太大区别。 两者都有一组相似的结构，这使得处理列表和字典非常简单。 两者都不需要很多“样板代码”或其他“繁杂”操作。

此外，使用 Groovy 时，向 Hamper 中添加单元还是一件比较繁琐的事情。 您需要在单位列表中随机选择一个位置，然后从该位置开始，遍历列表，直到找到一个价格允许的且包含它的单位，或者直到您用完列表为止。 当只剩下几件物品时，您需要将它们扔到最后一个 Hamper 里。 

另一个值得一提的问题是：这不是一种特别有效的方法。 从列表中删除元素、极其多的重复表达式还有一些其它的问题使得这不太适合解决这种大数据重新分配问题。 尽管如此，它仍然在我的老机器上运行。 

如果你觉得我在这段代码中使用 `while` 循环并改变其中的数据感到不舒服，您可能希望我让它更有用一些。 我想不出一种方法不使用 Python 中的 map 和 reduce 函数，并结合随机选择的单元进行重新打包。 你可以吗？ 

在下一篇文章中，我将使用 Java 重新执行此操作，以了解 Groovy 和 Python 的工作量减少了多少，未来的文章将介绍 Julia 和 Go。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/solve-problem-python

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[zepoch](https://github.com/zepoch)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r "Python programming language logo with question marks"
[2]: https://opensource.com/article/20/8/solving-problem-groovy
[3]: https://groovy-lang.org/
[4]: https://www.python.org/
