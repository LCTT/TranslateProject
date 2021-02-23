[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-11636-1.html"
[#]: subject: "How to use loops in awk"
[#]: via: "https://opensource.com/article/19/11/loops-awk"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"

在 awk 中怎么使用循环
======

> 来学习一下多次执行同一条命令的不同类型的循环。

![](https://img.linux.net.cn/data/attachment/album/201912/02/232951h3ibohlh77bk77d7.jpg)

`awk` 脚本有三个主要部分：`BEGIN` 和 `END` 函数（都可选），用户自己写的每次要执行的函数。某种程度上，`awk` 的主体部分就是一个循环，因为函数中的命令对每一条记录都会执行一次。然而，有时你希望对于一条记录执行多次命令，那么你就需要用到循环。

有多种类型的循环，分别适合不同的场景。

### while 循环

一个 `while` 循环检测一个表达式，如果表达式为 `true` 就执行命令。当表达式变为 `false` 时，循环中断。

```
#!/bin/awk -f

BEGIN {
        # Loop through 1 to 10

    i=1;
    while (i <= 10) {
        print i, " to the second power is ", i*i;
        i = i+1;
    }
exit;
}
```

在这个简单实例中，`awk` 打印了放在变量 `i` 中的整数值的平方。`while (i <= 10)` 语句告诉 `awk` 仅在 `i` 的值小于或等于 10 时才执行循环。在循环最后一次执行时（`i` 的值是 10），循环终止。

### do-while 循环

do-while 循环执行在关键字 `do` 之后的命令。在每次循环结束时检测一个测试表达式来决定是否终止循环。仅在测试表达式返回 `true` 时才会重复执行命令（即还没有到终止循环的条件）。如果测试表达式返回 `false`，因为到了终止循环的条件所以循环被终止。

```
#!/usr/bin/awk -f
BEGIN {

        i=2;
        do {
                print i, " to the second power is ", i*i;
                i = i + 1
        }
        while (i < 10)

exit;
}
```

### for 循环

`awk` 中有两种 `for` 循环。

一种 `for` 循环初始化一个变量，检测一个测试表达式，执行变量递增，当表达式的结果为 `true` 时循环就会一直执行。

```
#!/bin/awk -f

BEGIN {
    for (i=1; i <= 10; i++) {
        print i, " to the second power is ", i*i;
    }
exit;
}
```

另一种 `for` 循环设置一个有连续索引的数组变量，对每一个索引执行一个命令集。换句话说，它用一个数组“收集”每一条命令执行后的结果。

本例实现了一个简易版的 Unix 命令 `uniq`。通过把一系列字符串作为键加到数组 `a` 中，当相同的键再次出现时就增加键值，可以得到某个字符串出现的次数（就像 `uniq` 的 `--count` 选项）。如果你打印该数组的所有键，将会得到出现过的所有字符串。

用演示文件 `colours.txt`（前一篇文章中的文件）来举例：

```
name       color  amount
apple      red    4
banana     yellow 6
raspberry  red    99
strawberry red    3
grape      purple 10
apple      green  8
plum       purple 2
kiwi       brown  4
potato     brown  9
pineapple  yellow 5
```

这是 `awk` 版的简易 `uniq -c`：

```
#! /usr/bin/awk -f

NR != 1 {
    a[$2]++
}
END {
    for (key in a) {
                print a[key] " " key
    }
}
```

示例数据文件的第三列是第一列列出的条目的计数。你可以用一个数组和 `for` 循环来按颜色统计第三列的条目。

```
#! /usr/bin/awk -f

BEGIN {
    FS=" ";
    OFS="\t";
    print("color\tsum");
}
NR != 1 {
    a[$2]+=$3;
}
END {
    for (b in a) {
        print b, a[b]
    }
}
```

你可以看到，在处理文件之前也需要在 `BEFORE` 函数（仅仅执行一次）中打印一列表头。

### 循环

在任何编程语言中循环都是很重要的一部分，`awk` 也不例外。使用循环你可以控制 `awk` 脚本怎样去运行，它可以统计什么信息，还有它怎么去处理你的数据。我们下一篇文章会讨论 `switch`、`continue` 和 `next` 语句。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/loops-awk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh "arrows cycle symbol for failing faster"
[2]: http://hackerpublicradio.org/eps.php?id=2330
