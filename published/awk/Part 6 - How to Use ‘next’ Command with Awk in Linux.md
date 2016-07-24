awk 系列：如何使用 awk 的 ‘next’ 命令
=============================================

![](http://www.tecmint.com/wp-content/uploads/2016/06/Use-next-Command-with-Awk-in-Linux.png)

在 awk 系列的第六节，我们来看一下`next`命令 ，它告诉 awk 跳过你所提供的所有剩下的模式和表达式，直接处理下一个输入行。

`next` 命令帮助你阻止运行命令执行过程中多余的步骤。

要明白它是如何工作的,  让我们来分析一下 food_list.txt 它看起来像这样：

```
Food List Items
No      Item_Name               Price           Quantity
1       Mangoes                 $3.45              5
2       Apples                  $2.45              25
3       Pineapples              $4.45              55
4       Tomatoes                $3.45              25
5       Onions                  $1.45              15
6       Bananas                 $3.45              30
```

运行下面的命令，它将在每个食物数量小于或者等于 20 的行后面标一个星号:

```
# awk '$4 <= 20 { printf "%s\t%s\n", $0,"*" ; } $4 > 20 { print $0 ;} ' food_list.txt 

No	Item_Name		Price		Quantity
1	  Mangoes			$3.45		   5	*
2	  Apples			$2.45      25
3	  Pineapples	$4.45      55
4	  Tomatoes		$3.45      25 
5	  Onions			$1.45      15	*
6	  Bananas	    $3.45      30
```

上面的命令实际运行如下:

- 首先，它用`$4 <= 20`表达式检查每个输入行的第四列（数量（Quantity））是否小于或者等于 20，如果满足条件，它将在末尾打一个星号 `(*)`。
- 接着，它用`$4 > 20`表达式检查每个输入行的第四列是否大于20，如果满足条件，显示出来。

但是这里有一个问题, 当第一个表达式用`{ printf "%s\t%s\n", $0,"**" ; }`命令进行标注的时候在同样的步骤第二个表达式也进行了判断这样就浪费了时间.

因此当我们已经用第一个表达式打印标志行的时候就不再需要用第二个表达式`$4 > 20`再次打印。

要处理这个问题, 我们需要用到`next` 命令：

```
# awk '$4 <= 20 { printf "%s\t%s\n", $0,"*" ; next; } $4 > 20 { print $0 ;} ' food_list.txt

No	Item_Name		Price		           Quantity
1	  Mangoes			$3.45		           5	*
2	  Apples			$2.45              25
3	  Pineapples	$4.45              55
4	  Tomatoes		$3.45              25 
5	  Onions			$1.45              15	*
6	  Bananas	    $3.45              30
```

当输入行用`$4 <= 20` `{ printf "%s\t%s\n", $0,"*" ; next ; }`命令打印以后，`next`命令将跳过第二个`$4 > 20` `{ print $0 ;}`表达式，继续判断下一个输入行，而不是浪费时间继续判断一下是不是当前输入行还大于 20。

`next`命令在编写高效的命令脚本时候是非常重要的，它可以提高脚本速度。本系列的下一部分我们将来学习如何使用 awk 来处理标准输入（STDIN）。

希望这篇文章对你有帮助，你可以给我们留言。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/use-next-command-with-awk-in-linux/

作者：[Aaron Kili][a]
译者：[kokialoves](https://github.com/kokialoves)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
