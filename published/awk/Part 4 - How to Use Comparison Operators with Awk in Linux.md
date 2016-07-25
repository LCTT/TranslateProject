awk 系列：如何使用 awk 比较操作符
===================================================

![](http://www.tecmint.com/wp-content/uploads/2016/05/Use-Comparison-Operators-with-AWK.png)

对于 使用 awk 命令的用户来说，处理一行文本中的数字或者字符串时，使用比较运算符来过滤文本和字符串是十分方便的。

在  awk 系列的此部分中，我们将探讨一下如何使用比较运算符来过滤文本或者字符串。如果你是程序员，那么你应该已经熟悉了比较运算符；对于其它人，下面的部分将介绍比较运算符。

### awk 中的比较运算符是什么？

awk 中的比较运算符用于比较字符串和或者数值，包括以下类型：

- `>` – 大于
- `<` – 小于
- `>=` – 大于等于
- `<=` – 小于等于
- `==` – 等于
- `!=` – 不等于
- `some_value ~ / pattern/` – 如果 some_value 匹配模式 pattern，则返回 true
- `some_value !~ / pattern/` – 如果 some_value 不匹配模式 pattern，则返回 true

现在我们通过例子来熟悉 awk 中各种不同的比较运算符。

在这个例子中，我们有一个文件名为 food_list.txt 的文件，里面包括不同食物的购买列表。我想给食物数量小于或等于 30 的物品所在行的后面加上`(**)`

```
File – food_list.txt
No      Item_Name               Quantity        Price
1       Mangoes                    45           $3.45
2       Apples                     25           $2.45
3       Pineapples                 5            $4.45
4       Tomatoes                   25           $3.45
5       Onions                     15           $1.45
6       Bananas                    30           $3.45
```

Awk 中使用比较运算符的通用语法如下：

```
# 表达式 { 动作; }
```

为了实现刚才的目的，执行下面的命令：

```
# awk '$3 <= 30 { printf "%s\t%s\n", $0,"**" ; } $3 > 30 { print $0 ;}' food_list.txt

No	Item_Name`		Quantity	Price
1	Mangoes	      		   45		$3.45
2	Apples			   25		$2.45	**
3	Pineapples		   5		$4.45	**
4	Tomatoes		   25		$3.45	**
5	Onions			   15           $1.45	**
6	Bananas			   30           $3.45	**
```

在刚才的例子中，发生如下两件重要的事情：

- 第一个“表达式 {动作;}”组合中， `$3 <= 30 { printf “%s\t%s\n”, $0,”**” ; }` 打印出数量小于等于30的行，并且在后面增加`(**)`。物品的数量是通过 `$3` 这个域变量获得的。
- 第二个“表达式 {动作;}”组合中， `$3 > 30 { print $0 ;}` 原样输出数量小于等于 `30` 的行。

再举一个例子：

```
# awk '$3 <= 20 { printf "%s\t%s\n", $0,"TRUE" ; } $3 > 20  { print $0 ;} ' food_list.txt 

No	  Item_Name		Quantity	Price
1	    Mangoes			   45		  $3.45
2	    Apples			   25		  $2.45
3	    Pineapples		  5		  $4.45	TRUE
4	    Tomatoes		   25		  $3.45
5	    Onions			   15     $1.45	TRUE
6     Bananas	       30     $3.45
```

在这个例子中，我们想通过在行的末尾增加 (TRUE) 来标记数量小于等于20的行。

### 总结

这是一篇对 awk 中的比较运算符介绍性的指引，因此你需要尝试其他选项，发现更多使用方法。

如果你遇到或者想到任何问题，请在下面评论区留下评论。请记得阅读  awk 系列下一部分的文章，那里我将介绍组合表达式。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/comparison-operators-in-awk/

作者：[Aaron Kili][a]
译者：[chunyang-wen](https://github.com/chunyang-wen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
