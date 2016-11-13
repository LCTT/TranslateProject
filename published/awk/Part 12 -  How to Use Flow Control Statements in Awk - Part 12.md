awk 系列：在 awk 中如何使用流程控制语句
===========================================

当你回顾所有到目前为止我们已经覆盖的 awk 实例，从 awk 系列的开始，你会注意到各种实例的所有指令是顺序执行的，即一个接一个地执行。但在某些情况下，我们可能希望基于一些条件进行文本过滤操作，即流程控制语句允许的那些语句。

![](http://www.tecmint.com/wp-content/uploads/2016/08/Use-Flow-Control-Statements-in-Awk.png)

在 awk 编程中有各种各样的流程控制语句，其中包括：

- if-else 语句
- for 语句
- while 语句
- do-while 语句
- break 语句
- continue 语句
- next 语句
- nextfile 语句
- exit 语句

然而，对于本系列的这一部分，我们将阐述：`if-else`、`for`、`while` 和 `do while` 语句。请记住，我们已经在这个 [awk 系列的第 6 部分][1]介绍过如何使用 awk 的 `next` 语句。

### 1. if-else 语句

如你想的那样。if 语句的语法类似于 shell 中的 if 语句：

```
if  (条件 1) {
     动作 1
}
else {
      动作 2
}
```

在上述语法中，`条件 1` 和`条件 2` 是 awk 表达式，而`动作 1` 和`动作 2` 是当各自的条件得到满足时所执行的 awk 命令。

当`条件 1` 满足时，意味着它为真，那么`动作 1` 被执行并退出 `if 语句`，否则`动作 2` 被执行。

if 语句还能扩展为如下的 `if-else_if-else` 语句：

```
if (条件 1){
     动作 1
}
else if (条件 2){
      动作 2
}
else{
     动作 3
}
```

对于上面的形式，如果`条件 1` 为真，那么`动作 1` 被执行并退出 `if 语句`，否则`条件 2` 被求值且如果值为真，那么`动作 2` 被执行并退出 `if 语句`。然而，当`条件 2` 为假时，那么`动作 3` 被执行并退出 `if 语句`。

这是在使用 if 语句的一个实例，我们有一个用户和他们年龄的列表，存储在文件 users.txt 中。

我们要打印一个清单，显示用户的名称和用户的年龄是否小于或超过 25 岁。

```
aaronkilik@tecMint ~ $ cat users.txt
Sarah L			35    	F
Aaron Kili		40    	M
John  Doo		20    	M
Kili  Seth		49    	M
```

我们可以写一个简短的 shell 脚本来执行上文中我们的工作，这是脚本的内容：

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

然后保存文件并退出，按如下方式使脚本可执行并运行它：

```
$ chmod +x test.sh
$ ./test.sh
```

输出样例

```
User Sarah L is more than 25 years old
User Aaron Kili is more than 25 years old
User John Doo is less than 25 years old.
User Kili Seth is more than 25 years old
```

### 2. for 语句

如果你想在一个循环中执行一些 awk 命令，那么 `for 语句`为你提供一个做这个的合适方式，格式如下：

```
for ( 计数器的初始化 ; 测试条件 ; 计数器增加 ){
      动作
}
```

这里，该方法是通过一个计数器来控制循环执行来定义的，首先你需要初始化这个计数器，然后针对测试条件运行它，如果它为真，执行这些动作并最终增加这个计数器。当计数器不满足条件时，循环终止。

在我们想要打印数字 0 到 10 时，以下 awk 命令显示 for 语句是如何工作的：

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

while 语句的传统语法如下：

```
while ( 条件 ) {
          动作
}
```

这个`条件`是一个 awk 表达式而`动作`是当条件为真时被执行的 awk 命令。

下面是一个说明使用 `while` 语句来打印数字 0 到 10 的脚本：

```
#!/bin/bash
awk ' BEGIN{ counter=0;

        while(counter<=10){
              print counter;
              counter+=1;

        }
}'
```

保存文件并使脚本可执行，然后运行它：

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

### 4. do while 语句

它是上文中 `while` 语句的一个变型，具有以下语法：

```
do {
     动作
}
 while (条件)
```

这轻微的区别在于，在 `do while` 语句下，awk 的命令在求值条件之前执行。使用上文 `while` 语句的例子，我们可以通过按如下所述修改 test.sh 脚本中的 awk 命令来说明 `do while` 语句的用法：

```
#!/bin/bash

awk ' BEGIN{ counter=0;
        do{
            print counter;
            counter+=1;
        }
        while (counter<=10)
}'
```

修改脚本之后，保存文件并退出。按如下方式使脚本可执行并执行它：

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

### 总结

这不是关于 awk 的流程控制语句的一个全面的指南，正如我早先提到的，在 awk 里还有其他几个流程控制语句。

尽管如此，awk 系列的这一部分使应该你明白了一个明确的基于某些条件控制的 awk 命令是如何执行的基本概念。

你还可以了解其余更多的流程控制语句以获得更多关于该主题的理解。最后，在 awk 的系列下一节，我们将进入编写 awk 脚本。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/use-flow-control-statements-with-awk-command/
作者：[Aaron Kili][a]
译者：[robot527](https://github.com/robot527)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: https://linux.cn/article-7609-1.html