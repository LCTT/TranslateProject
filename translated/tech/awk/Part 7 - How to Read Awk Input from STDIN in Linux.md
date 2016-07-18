

在 Linux 上怎么读取标准输入(STDIN)作为 Awk 的输入
============================================

![](http://www.tecmint.com/wp-content/uploads/2016/06/Read-Awk-Input-from-STDIN.png)


在 Awk 工具系列的前几节，我们看到大多数操作都是从一个文件或多个文件读取输入，或者你想要把标准输入作为 Awk 的输入．
在 Awk 系列的第７节中，我们将会看到几个例子，这些例子都是关于你可以筛选其他命令的输出代替从一个文件读取输入作为 awk 的输入．


我们开始使用 [dir utility][1] , dir 命令和 [ls 命令][2] 相似，在第一个例子下面，我们使用 'dir -l' 命令的输出作为 Awk 命令的输入，这样就可以打印出文件拥有者的用户名，所属组组名以及在当前路径下他／她拥有的文件．
```
# dir -l | awk '{print $3, $4, $9;}'
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/List-Files-Owned-By-User-in-Directory.png)
>列出当前路径下的用户文件


看另一个例子，我们 [使用 awk 表达式][3] ，在这里，我们想要在 awk 命令里使用一个表达式筛选出字符串，通过这样来打印出 root 用户的文件．命令如下:
```
# dir -l | awk '$3=="root" {print $1,$3,$4, $9;} '
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/List-Files-Owned-by-Root-User.png)
>列出 root 用户的文件


上面的命令包含了 '(==)' 来进行比较操作，这帮助我们在当前路径下筛选出 root 用户的文件.这种方法的实现是通过使用 '$3=="root"' 表达式．

让我们再看另一个例子，我们使用一个 [awk 比较运算符][4] 来匹配一个确定的字符串．


现在，我们已经用了 [cat utility][5] 来浏览文件名为 tecmint_deals.txt 的文件内容，并且我们想要仅仅查看有字符串 Tech 的部分，所以我们会运行下列命令: 
```
# cat tecmint_deals.txt
# cat tecmint_deals.txt | awk '$4 ~ /tech/{print}'
# cat tecmint_deals.txt | awk '$4 ~ /Tech/{print}'
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/Use-Comparison-Operator-to-Match-String.png)
>用 Awk 比较运算符匹配字符串


在上面的例子中，我们已经用了参数为 `~ /匹配字符/` 的比较操作,但是上面的两个命令给我们展示了一些很重要的问题．

当你运行带有 tech 字符串的命令时终端没有输出，因为在文件中没有 tech 这种字符串，但是运行带有 Tech 字符串的命令，你却会得到包含 Tech 的输出． 

所以你应该在进行这种比较操作的时候时刻注意这种问题，正如我们在上面看到的那样， awk 对大小写很敏感．


你可以一直使用另一个命令的输出作为 awk 命令的输入来代替从一个文件中读取输入，这就像我们在上面看到的那样简单．


希望这些例子足够简单可以使你理解 awk 的用法，如果你有任何问题，你可以在下面的评论区提问，记得查看 awk 系列接下来的章节内容，我们将关注 awk 的一些功能，比如变量，数字表达式以及赋值运算符．
--------------------------------------------------------------------------------

via: http://www.tecmint.com/read-awk-input-from-stdin-in-linux/

作者：[Aaron Kili][a]
译者：[vim-kakali](https://github.com/vim-kakali)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/linux-dir-command-usage-with-examples/
[2]: http://www.tecmint.com/15-basic-ls-command-examples-in-linux/
[3]: http://www.tecmint.com/combine-multiple-expressions-in-awk
[4]: http://www.tecmint.com/comparison-operators-in-awk
[5]: http://www.tecmint.com/13-basic-cat-command-examples-in-linux/



