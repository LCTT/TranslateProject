如何使用 Awk 打印文件中的字段和列
===================================================

在 [Linux Awk 命令系列介绍][1] 的这部分，我们来看一下 awk 最重要的功能之一，字段编辑。

首先我们要知道 Awk 会自动把输入的行切分为字段，字段可以定义为是一些字符集，这些字符集和其它字段被内部字段分隔符分离。

![](http://www.tecmint.com/wp-content/uploads/2016/04/Awk-Print-Fields-and-Columns.png)
>Awk 输出字段和列

如果你熟悉 Unix/Linux 或者懂得 [bash shell 编程][2]，那么你也应该知道内部字段分隔符（IFS）变量。Awk 默认的 IFS 是 tab 和空格。

Awk 字段切分的工作原理如下：当获得一行输入时，根据定义的 IFS，第一个字符集是字段一，用 $1 表示，第二个字符集是字段二，用 $2 表示，第三个字符集是字段三，用 $3 表示，以此类推直到最后一个字符集。

为了更好的理解 Awk 的字段编辑，让我们来看看下面的例子：

**事例 1:**： 我创建了一个名为 tecmintinfo.txt 的文件。

```
# vi tecmintinfo.txt
# cat tecmintinfo.txt
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Create-File-in-Linux.png)
>在 Linux 中创建文件

然后在命令行中使用以下命令打印 tecmintinfo.txt 文件中的第一、第二和第三个字段。

```
$ awk '//{print $1 $2 $3 }' tecmintinfo.txt
TecMint.comisthe
```
从上面的输出中你可以看到，三个字段中的第一个是按照定义的 IFS，也就是空格，打印的。

- 字段一 “TecMint.com” 使用 $1 访问。
- 字段二 “is” 通过 $2 访问。
- 字段三 “the” 通过 $3 访问。

如果你注意打印的输出，可以看到字段值之间并没有分隔开，这是 print 默认的方式。

为了在字段值之间加入空格，你需要像下面这样添加（,）分隔符：

```
$ awk '//{print $1, $2, $3; }' tecmintinfo.txt

TecMint.com is the
```

很重要而且必须牢记的一点是，Awk 中 （$） 的使用和在 shell 脚本中不一样。

在 shell 脚本中 （$） 用于获取变量的值，而在 Awk 中 （$） 只用于获取一个字段的内容，而不能用于获取变量的值。 

**事例2**： 让我们再看一个使用多行文件 my_shoping.list 的例子。

```
No	Item_Name		Unit_Price	Quantity	Price
1	Mouse			#20,000		   1		#20,000
2 	Monitor			#500,000	   1		#500,000
3	RAM_Chips		#150,000	   2		#300,000
4	Ethernet_Cables	        #30,000		   4		#120,000	
```

假设你只想打印购物清单中每个物品的 Unit_Price，你需要允许下面的命令：

```
$ awk '//{print $2, $3 }' my_shopping.txt 

Item_Name Unit_Price
Mouse #20,000
Monitor #500,000
RAM_Chips #150,000
Ethernet_Cables #30,000
```

Awk 也有一个 printf 命令，它能帮助你用更好的方式格式化输出，正如你可以看到上面的输出并不清晰。

使用 printf 格式化输出 Item_Name 和 Unit_Price：

```
$ awk '//{printf "%-10s %s\n",$2, $3 }' my_shopping.txt 

Item_Name  Unit_Price
Mouse      #20,000
Monitor    #500,000
RAM_Chips  #150,000
Ethernet_Cables #30,000
```

### 总结

使用 Awk 进行文本和字符串过滤时字段编辑功能非常重要，它能帮助你从列表中获取列的特定数据。同时需要记住 Awk 中 （$） 操作符和 shell 脚本中不一样。

我希望这篇文章能对你有所帮助，如果你需要获取其它信息或者有任何疑问，都可以在下面的评论框中告诉我们。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/awk-print-fields-columns-with-space-separator/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Aaron Kili][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/tag/awk-command/
[2]: http://www.tecmint.com/category/bash-shell/
