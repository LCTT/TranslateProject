[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10555-1.html)
[#]: subject: (Drinking coffee with AWK)
[#]: via: (https://opensource.com/article/19/2/drinking-coffee-awk)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

用 AWK 喝咖啡
======
> 用一个简单的 AWK 程序跟踪你的同事喝咖啡的欠款。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o)

以下基于一个真实的故事，虽然一些名字和细节有所改变。

> 很久以前，在一个遥远的地方，有一间~~庙~~（划掉）办公室。由于各种原因，这个办公室没有购买速溶咖啡。所以那个办公室的一些人聚在一起决定建立“咖啡角”。
>
> 咖啡角的一名成员会购买一些速溶咖啡，而其他成员会付给他钱。有人喝咖啡比其他人多，所以增加了“半成员”的级别：半成员每周允许喝的咖啡限量，并可以支付其它成员支付的一半。

管理这事非常操心。而我刚读过《Unix 编程环境》这本书，想练习一下我的 [AWK][1] 编程技能，所以我自告奋勇创建了一个系统。

第 1 步：我用一个数据库来记录成员及其应支付给咖啡角的欠款。我是以 AWK 便于处理的格式记录的，其中字段用冒号分隔：

```
member:john:1:22
member:jane:0.5:33
member:pratyush:0.5:17
member:jing:1:27
```

上面的第一个字段标识了这是哪一种行（`member`）。第二个字段是成员的名字（即他们的电子邮件用户名，但没有 @ ）。下一个字段是其成员级别（成员 = 1，或半会员 = 0.5）。最后一个字段是他们欠咖啡角的钱。正数表示他们欠咖啡角钱，负数表示咖啡角欠他们。

第 2 步：我记录了咖啡角的收入和支出：

```
payment:jane:33
payment:pratyush:17
bought:john:60
payback:john:50
```

Jane 付款 $33，Pratyush 付款 $17，John 买了价值 $60 的咖啡，而咖啡角还款给 John $50。

第 3 步：我准备写一些代码，用来处理成员和付款，并生成记录了新欠账的更新的成员文件。

```
#!/usr/bin/env --split-string=awk -F: -f
```

释伴行（`＃!`）需要做一些调整，我使用 `env` 命令来允许从释伴行传递多个参数：具体来说，AWK 的 `-F` 命令行参数会告诉它字段分隔符是什么。

AWK 程序就是一个规则序列（也可以包含函数定义，但是对于这个咖啡角应用来说不需要）

第一条规则读取该成员文件。当我运行该命令时，我总是首先给它的是成员文件，然后是付款文件。它使用 AWK 关联数组来在 `members` 数组中记录成员级别，以及在 `debt` 数组中记录当前欠账。

```
$1 == "member" {
   members[$2]=$3
   debt[$2]=$4
   total_members += $3
}
```

第二条规则在记录付款（`payment`）时减少欠账。

```
$1 == "payment" {
   debt[$2] -= $3
}
```

还款（`payback`）则相反：它增加欠账。这可以优雅地支持意外地给了某人太多钱的情况。

```
$1 == "payback" {
   debt[$2] += $3
}
```

最复杂的部分出现在有人购买（`bought`）速溶咖啡供咖啡角使用时。它被视为付款（`payment`），并且该人的债务减少了适当的金额。接下来，它计算每个会员的费用。它根据成员的级别对所有成员进行迭代并增加欠款

```
$1 == "bought" {
   debt[$2] -= $3
   per_member = $3/total_members
   for (x in members) {
       debt[x] += per_member * members[x]
   }
}
```

`END` 模式很特殊：当 AWK 没有更多的数据要处理时，它会一次性执行。此时，它会使用更新的欠款数生成新的成员文件。

```
END {
   for (x in members) {
       printf "%s:%s:%s\n", x, members[x], debt[x]
   }
}
```

再配合一个遍历成员文件，并向人们发送提醒电子邮件以支付他们的会费（积极清账）的脚本，这个系统管理咖啡角相当一段时间。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/drinking-coffee-awk

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/AWK
