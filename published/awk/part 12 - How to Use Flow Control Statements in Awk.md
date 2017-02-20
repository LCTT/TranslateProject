awk 系列：如何在 awk 中使用流控制语句
====

回顾从 Awk 系列，从最开始到现在我们所讲的所有关于 Awk 的例子，你会发现不同例子中的所有命令都是顺序执行的，也就是一个接一个的执行。但是在某些场景下，我们可能希望根据一些条件来执行一些[文本过滤操作][1]，这个时候流控制语句就派上用场了。

![](http://www.tecmint.com/wp-content/uploads/2016/08/Use-Flow-Control-Statements-in-Awk.png)

Awk 包含很多的流控制语句，包括：

- if-else 语句
- for 语句
- while 语句
- do-while 语句
- break 语句
- continue 语句
- next 语句
- nextfile 语句
- exit 语句

但是在这个系列中，我们将详细解释：`if-else`，`for`，`while`，`do-while` 语句。关于如何使用 `next` 语句，如果你们记得的话，我们已经在 [Awk 系列的第6部分][2]介绍过了。

### 1. if-else 语句

if 语句的语法和 shell 里面的 if 语句类似：

```
if  (condition1) {
actions1
}
else {
actions2
}
```

上面的语法中，condition1 和 condition2 是 Awk 的表达式，actions1 和 actions2 是当相应的条件满足时执行的 Awk 命令。

当 condition1 满足时，意味着它的值是 true，此时会执行 actions1，if 语句退出，否则（译注：condition1 为 false）执行 actions2。

if 语句可以扩展成如下的 `if-else_if-else`：

```
if (condition1){
actions1
}
else if (conditions2){
actions2
}
else{
actions3
}
```

上面例子中，如果 condition1 为 true，执行 actions1，if 语句退出；否则对 condition2 求值，如果值为 true，那么执行 actions2，if 语句退出。然而如果 condition2 是 false，那么会执行 actions3 退出 if语句。

下面是一个使用 if 语句的例子，我们有一个存储用户和他们年龄列表的文件 users.txt。

我们想要打印用户的名字以及他们的年龄是大于 25 还是小于 25。

```
aaronkilik@tecMint ~ $ cat users.txt
Sarah L			35    	F
Aaron Kili		40    	M
John  Doo		20    	M
Kili  Seth		49    	M    
```

我们可以写一个简短的 shell 脚本来执行我们上面的任务，下面是脚本的内容：

```
#!/bin/bash
awk ' { 
if ( $3 <= 25 ){
print "User",$1,$2,"is less than 25 years old." ;
}
else {
print "User",$1,$2,"is more than 25 years old" ; 
}
}'    ~/users.txt
```

保存文件后退出，执行下面命令让脚本可执行，然后执行：

```
$ chmod +x test.sh
$ ./test.sh
```

输出样例：

```
User Sarah L is more than 25 years old
User Aaron Kili is more than 25 years old
User John Doo is less than 25 years old.
User Kili Seth is more than 25 years old
```

### 2. for 语句

如果你想循环执行一些 Awk 命令，那么 `for` 语句十分合适，它的语法如下：

这里只是简单的定义一个计数器来控制循环的执行。首先你要初始化那个计数器 （counter），然后根据某个条件判断是否执行，如果该条件为 true 则执行，最后增加计数器。当计数器不满足条件时则终止循环。

```
for ( counter-initialization; test-condition; counter-increment ){
actions
}
```

下面的 Awk 命令利用打印数字 0-10 来说明 `for` 语句是怎么工作的。

```
$ awk 'BEGIN{ for(counter=0;counter<=10;counter++){ print counter} }'
```

输出样例

```
0
1
2
3
4
5
6
7
8
9
10
```

### 3. while 语句

传统的 `while` 语句语法如下：

```
while ( condition ) {
actions
}
```

上面的 condition 是 Awk 表达式，actions 是当 condition 为 true 时执行的 Awk 命令。

下面是仍然用打印数字 0-10 来解释 while 语句的用法：

```
#!/bin/bash
awk ' BEGIN{ counter=0 ;
while(counter<=10){
print counter;
counter+=1 ;
}
}
```

保存文件，让文件可执行，然后执行：

```
$ chmod +x test.sh
$ ./test.sh
```

输出样例：

```
0
1
2
3
4
5
6
7
8
9
10
```

### 4. do-while 语句

这个是上面的 `while` 语句语法的一个变化，其语法如下：

```
do {
actions
}
while (condition) 
```

二者的区别是，在 `do-while` 中，Awk 的命令在条件求值前先执行。我们使用 `while` 语句中同样的例子来解释 `do-while` 的使用，将 test.sh 脚本中的 Awk 命令做如下更改： 

```
#!/bin/bash
awk ' BEGIN{ counter=0 ;  
do{
print counter;  
counter+=1 ;    
}
while (counter<=10)   
} 
'
```

修改脚本后，保存退出。让脚本可执行，然后按如下方式执行：

```
$ chmod +x test.sh
$ ./test.sh
```

输出样例

```
0
1
2
3
4
5
6
7
8
9
10
```

### 结论

前面指出，这并不是一个 Awk 流控制的完整介绍。在 Awk 中还有其它几个流控制语句。

不管怎样，Awk 系列的此部分给你一个如何基于某些条件来控制 Awk 命令执行的基本概念。

你可以接着通过仔细看看其余的流控制语句来获得关于这个主题的更多知识。最后，Awk 系列的下一部分，我们将会介绍如何写 Awk 脚本。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/use-flow-control-statements-with-awk-command/

作者：[Aaron Kili][a]
译者：[chunyang-wen](https://github.com/chunyang-wen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/use-linux-awk-command-to-filter-text-string-in-files/
[2]: http://www.tecmint.com/use-next-command-with-awk-in-linux/

