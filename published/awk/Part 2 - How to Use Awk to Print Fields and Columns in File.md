awk 系列：如何使用 awk 输出文本中的字段和列
======================================================

在 Awk 系列的这一节中，我们将看到 awk 最重要的特性之一，字段编辑。

首先我们要知道，Awk 能够自动将输入的行，分隔为若干字段。每一个字段就是一组字符，它们和其他的字段由一个内部字段分隔符分隔开来。

![](http://www.tecmint.com/wp-content/uploads/2016/04/Awk-Print-Fields-and-Columns.png)

*Awk 输出字段和列*

如果你熟悉 Unix/Linux 或者懂得 [bash shell 编程][1]，那么你应该知道什么是内部字段分隔符（IFS）变量。awk 中默认的 IFS 是制表符和空格。

awk 中的字段分隔符的工作原理如下：当读到一行输入时，将它按照指定的 IFS 分割为不同字段，第一组字符就是字段一，可以通过 $1 来访问，第二组字符就是字段二，可以通过 $2 来访问，第三组字符就是字段三，可以通过 $3 来访问，以此类推，直到最后一组字符。

为了更好地理解 awk 的字段编辑，让我们看一个下面的例子：

**例 1**：我创建了一个名为 tecmintinfo.txt 的文本文件。

```
# vi tecmintinfo.txt
# cat tecmintinfo.txt
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Create-File-in-Linux.png)

*在 Linux 上创建一个文件*

然后在命令行中，我试着使用下面的命令从文本 tecmintinfo.txt 中输出第一个，第二个，以及第三个字段。

```
$ awk '//{print $1 $2 $3 }' tecmintinfo.txt
TecMint.comisthe
```

从上面的输出中你可以看到，前三个字段的字符是以空格为分隔符输出的：

- 字段一是 “TecMint.com”，可以通过 `$1` 来访问。
- 字段二是 “is”，可以通过 `$2` 来访问。
- 字段三是 “the”，可以通过 `$3` 来访问。

如果你注意观察输出的话可以发现，输出的字段值并没有被分隔开，这是 print 函数默认的行为。

为了使输出看得更清楚，输出的字段值之间使用空格分开，你需要添加 (,) 操作符。

```
$ awk '//{print $1, $2, $3; }' tecmintinfo.txt

TecMint.com is the
```

需要记住而且非常重要的是，`($)` 在 awk 和在 shell 脚本中的使用是截然不同的！

在 shell 脚本中，`($)` 被用来获取变量的值。而在 awk 中，`($)` 只有在获取字段的值时才会用到，不能用于获取变量的值。

**例 2**：让我们再看一个例子，用到了一个名为 my_shoping.list 的包含多行的文件。

```
No	  Item_Name		            Unit_Price	Quantity	Price
1	    Mouse			              #20,000		   1		    #20,000
2 	    Monitor			            #500,000	   1		    #500,000
3	    RAM_Chips		            #150,000	   2		    #300,000
4	    Ethernet_Cables	        #30,000		   4		    #120,000		
```

如果你只想输出购物清单上每一个物品的`单价`，你只需运行下面的命令：

```
$ awk '//{print $2, $3 }' my_shopping.txt 

Item_Name Unit_Price
Mouse #20,000
Monitor #500,000
RAM_Chips #150,000
Ethernet_Cables #30,000
```

可以看到上面的输出不够清晰，awk 还有一个 `printf` 的命令，可以帮助你将输出格式化。

使用 `printf` 来格式化 Item_Name 和 Unit_Price 的输出：

```
$ awk '//{printf "%-10s %s\n",$2, $3 }' my_shopping.txt 

Item_Name  Unit_Price
Mouse      #20,000
Monitor    #500,000
RAM_Chips  #150,000
Ethernet_Cables #30,000
```

### 总结

使用 awk 过滤文本或字符串时，字段编辑的功能是非常重要的。它能够帮助你从一个表的数据中得到特定的列。一定要记住的是，awk 中 `($)` 操作符的用法与其在 shell 脚本中的用法是不同的！

希望这篇文章对您有所帮助。如有任何疑问，可以在评论区域发表评论。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/awk-print-fields-columns-with-space-separator/

作者：[Aaron Kili][a]
译者：[Cathon](https://github.com/Cathon)，[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/category/bash-shell/
