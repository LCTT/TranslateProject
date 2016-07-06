如何使用 Awk 复合表达式
====================================================

![](http://www.tecmint.com/wp-content/uploads/2016/05/Use-Compound-Expressions-with-Awk.png)

一直以来在查对条件是否匹配时，我们寻求的都是简单的表达式。那如果你想用超过一个表达式，来查对特定的条件呢？

本文，我们将看看如何在过滤文本和字符串时，结合多个表达式，即复合表达式，用以查对条件。

Awk 的复合表达式可由表示`与`的组合操作符 `&&`  和表示`或`的 `||` 构成。

复合表达式的常规写法如下：

```
( first_expression ) && ( second_expression )
```

为了保证整个表达式的正确，在这里必须确保 `first_expression` 和 `second_expression` 是正确的。

```
( first_expression ) || ( second_expression) 
```

为了保证整个表达式的正确，在这里必须确保 `first_expression` 或 `second_expression` 是正确的。

**注意**：切记要加括号。

表达式可以由比较操作符构成，具体可查看 awk 系列的第四部分。

现在让我们通过一个例子来加深理解：

此例中，有一个文本文件 `tecmint_deals.txt`，文本中包含着一张随机的 Tecmint 交易清单，其中包含了名称、价格和种类。

```
TecMint Deal List
No      Name                                    Price           Type
1       Mac_OS_X_Cleanup_Suite                  $9.99           Software
2       Basics_Notebook                         $14.99          Lifestyle
3       Tactical_Pen                            $25.99          Lifestyle
4       Scapple                                 $19.00          Unknown
5       Nano_Tool_Pack                          $11.99          Unknown
6       Ditto_Bluetooth_Altering_Device         $33.00          Tech
7       Nano_Prowler_Mini_Drone                 $36.99          Tech 
```

我们只想打印出价格超过 $20 的物品，并在其中种类为 “Tech” 的物品的行末用 (**) 打上标记。

我们将要执行以下命令。

```
# awk '($3 ~ /^\$[2-9][0-9]*\.[0-9][0-9]$/) && ($4=="Tech") { printf "%s\t%s\n",$0,"*"; } ' tecmint_deals.txt 

6	Ditto_Bluetooth_Altering_Device		$33.00		Tech	*
7	Nano_Prowler_Mini_Drone			$36.99          Tech	 *
```

此例，在复合表达式中我们使用了两个表达式：

- 表达式 1：`($3 ~ /^\$[2-9][0-9]*\.[0-9][0-9]$/)` ；查找交易价格超过 `$20` 的行，即只有当 `$3` 也就是价格满足 `/^\$[2-9][0-9]*\.[0-9][0-9]$/` 时值才为 true。
- 表达式 2：`($4 == “Tech”)` ；查找是否有种类为 “`Tech`”的交易，即只有当 `$4` 等于 “`Tech`” 时值才为 true。
切记，只有当 `&&` 操作符的两端状态，也就是两个表达式都是 true 的情况下，这一行才会被打上 `(**)` 标志。

### 总结

有些时候为了匹配你的真实想法，就不得不用到复合表达式。当你掌握了比较和复合表达式操作符的用法之后，在难的文本或字符串过滤条件也能轻松解决。

希望本向导对你有所帮助，如果你有任何问题或者补充，可以在下方发表评论，你的问题将会得到相应的解释。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/combine-multiple-expressions-in-awk/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
