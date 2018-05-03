Linux 命令行下的数学运算
======

![](https://images.techhive.com/images/article/2014/12/math_blackboard-100534564-large.jpg)
可以在 Linux 命令行下做数学运算吗？当然可以！事实上，有不少命令可以轻松完成这些操作，其中一些甚至让你大吃一惊。让我们来学习这些有用的数学运算命令或命令语法吧。

### expr

首先，对于在命令行使用命令进行数学运算，可能最容易想到、最常用的命令就是 **expr** (expression)。它可以完成四则运算，也可以用于比较大小。下面是几个例子：

#### 变量递增
```
$ count=0
$ count=`expr $count + 1`
$ echo $count
1

```

#### 完成简单运算
```
$ expr 11 + 123
134
$ expr 134 / 11
12
$ expr 134 - 11
123
$ expr 11 * 123
expr: syntax error      <== oops!
$ expr 11 \* 123
1353
$ expr 20 % 3
2

```
注意，你需要在 * 运算符之前增加 \ 符号，避免语法错误。% 运算符用于取余运算。

下面是一个稍微复杂的例子：
```
participants=11
total=156
share=`expr $total / $participants`
remaining=`expr $total - $participants \* $share`
echo $share
14
echo $remaining
2

```

假设某个活动中有 11 位参与者，需要颁发的奖项总数为 156，那么平均每个参与者获得 14 项奖项，额外剩余 2 个奖项。

#### 比较大小

下面让我们看一下比较大小的操作。从第一印象来看，语句看似有些怪异；这里并不是设置数值，而是进行数字大小比较。在本例中 **expr** 判断表达式是否为真：如果结果是 1，那么表达式为真；反之，表达式为假。
```
$ expr 11 = 11
1
$ expr 11 = 12
0

```
请读作"11 是否等于 11？"及"11 是否等于 12？"，你很快就会习惯这种写法。当然，我们不会在命令行上执行上述比较，可能的比较是 $age 是否等于 11。
```
$ age=11
$ expr $age = 11
1

```
如果将数字放到引号中间，那么你将进行字符串比较，而不是数值比较。
```
$ expr "11" = "11"
1
$ expr "eleven" = "11"
0

```

在本例中，我们判断 10 是否大于 5，以及是否 大于 99。
```
$ expr 10 \> 5
1
$ expr 10 \> 99
0

```

的确，返回 1 和 0 分别代表比较的结果为真和假，我们一般预期在 Linux 上得到这个结果。在下面的例子中，按照上述逻辑使用 **expr** 并不正确，因为 **if** 的工作原理刚好相反，即 0 代表真。
```
#!/bin/bash

echo -n "Cost to us> "
read cost
echo -n "Price we're asking> "
read price

if [ `expr $price \> $cost` ]; then
 echo "We make money"
else
 echo "Don't sell it"
fi

```

下面，我们运行这个脚本：
```
$ ./checkPrice
Cost to us> 11.50
Price we're asking> 6
We make money

```

这显然与我们预期不符！我们稍微修改一下，以便使其按我们预期工作：
```
#!/bin/bash

echo -n "Cost to us> "
read cost
echo -n "Price we're asking> "
read price

if [ `expr $price \> $cost` == 1 ]; then
 echo "We make money"
else
 echo "Don't sell it"
fi

```

### factor

**factor** 命令的功能基本与你预期相符。你给出一个数字，该命令会给出对应数字的因子。
```
$ factor 111
111: 3 37
$ factor 134
134: 2 67
$ factor 17894
17894: 2 23 389
$ factor 1987
1987: 1987

```

注：factor 命令对于最后一个数字没有返回很多，这是因为 1987 是一个 **质数**。

### jot

**jot** 命令可以创建一系列数字。给定数字总数及起始数字即可。
```
$ jot 8 10
10
11
12
13
14
15
16
17

```

你也可以用如下方式使用 **jot**，这里我们要求递减至数字 2。
```
$ jot 8 10 2
10
9
8
7
5
4
3
2

```

**jot** 可以帮你构造一系列数字组成的列表，该列表可以用于其它任务。
```
$ for i in `jot 7 17`; do echo April $i; done
April 17
April 18
April 19
April 20
April 21
April 22
April 23

```

### bc

**bc** 基本上是命令行数学运算最佳工具之一。输入你想执行的运算，使用管道发送至该命令即可：
```
$ echo "123.4+5/6-(7.89*1.234)" | bc
113.664

```

可见 **bc** 并没有忽略精度，而且输入的字符串也相当直截了当。它还可以进行大小比较、处理布尔值、计算平方根、正弦、余弦和正切等。
```
$ echo "sqrt(256)" | bc
16
$ echo "s(90)" | bc -l
.89399666360055789051

```

事实上，**bc** 甚至可以计算 pi。你需要指定需要的精度。
```
$ echo "scale=5; 4*a(1)" | bc -l
3.14156
$ echo "scale=10; 4*a(1)" | bc -l
3.1415926532
$ echo "scale=20; 4*a(1)" | bc -l
3.14159265358979323844
$ echo "scale=40; 4*a(1)" | bc -l
3.1415926535897932384626433832795028841968

```

除了通过管道接收数据并返回结果，**bc**还可以交互式运行，输入你想执行的运算即可。本例中提到的 scale 设置可以指定有效数字的个数。
```
$ bc
bc 1.06.95
Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'.
scale=2
3/4
.75
2/3
.66
quit

```

你还可以使用 **bc** 完成数字进制转换。**obase** 用于设置输出的数字进制。
```
$ bc
bc 1.06.95
Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'.
obase=16
16      <=== entered
10      <=== response
256     <=== entered
100     <=== response
quit

```

按如下方式使用 **bc** 也是完成十六进制与十进制转换的最简单方式之一：
```
$ echo "ibase=16; F2" | bc
242
$ echo "obase=16; 242" | bc
F2

```

在上面第一个例子中，我们将输入进制 (ibase) 设置为十六进制 (hex)，完成十六进制到为十进制的转换。在第二个例子中，我们执行相反的操作，即将输出进制 (obase) 设置为十六进制。

### 简单的 bash 数学运算

通过使用双括号，我们可以在 bash 中完成简单的数学运算。在下面的例子中，我们创建一个变量，为变量赋值，然后依次执行加法、自减和平方。
```
$ ((e=11))
$ (( e = e + 7 ))
$ echo $e
18

$ ((e--))
$ echo $e
17

$ ((e=e**2))
$ echo $e
289

```

允许使用的运算符包括：
```
+ -     加法及减法
++ --   自增与自减
* / %   乘法，除法及求余数
^       指数运算

```

你还可以使用逻辑运算符和布尔运算符：
```
$ ((x=11)); ((y=7))
$ if (( x > y )); then
> echo "x > y"
> fi
x > y

$ ((x=11)); ((y=7)); ((z=3))
$ if (( x > y )) >> (( y > z )); then
> echo "letters roll downhill"
> fi
letters roll downhill

```

或者如下方式：
```
$ if [ x > y ] << [ y > z ]; then echo "letters roll downhill"; fi
letters roll downhill

```

下面计算 2 的 3 次幂：
```
$ echo "2 ^ 3"
2 ^ 3
$ echo "2 ^ 3" | bc
8

```

### 总结

在 Linux 系统中，有很多不同的命令行工具可以完成数字运算。希望你在读完本文之后，能掌握一两个新工具。

使用 [Facebook][1] 或 [LinkedIn][2] 加入 Network World 社区，点评你最喜爱的主题。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3268964/linux/how-to-do-math-on-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
译者：[pinewall](https://github.com/pinewall)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.facebook.com/NetworkWorld/
[2]:https://www.linkedin.com/company/network-world
