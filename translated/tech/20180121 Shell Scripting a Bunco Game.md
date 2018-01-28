 脚本编程之骰子游戏
======
我已经有段时间没有编写游戏了，所以我觉得现在正是做一些这方面事情的时候。起初，我想 " 用脚本编一个Halo? " (Halo:光晕系列游戏)，但我后来意识到这不太可能。来编一个叫Bunco的简单骰子游戏。你也许没有听说过，不过你母亲绝对知道 - 当一群年轻女孩聚在当地的酒吧或者小酒馆的时候，这是个很受欢迎的游戏。


游戏一共六轮，有三个骰子，规则很简单。每次投三个骰子，投出的点数要和当前的轮数数字一致。如果三个骰子都和当前的轮数一致，(比如，在第三轮三个骰子都是3)，你这一轮的分数就是21。 如果三个骰子点数都相同但和轮数数字不同，你会得到最低的Bunco分数，只有5分。如果你投出的点数两者都不是，每一个和当前轮数相同的骰子得1分。


要想玩这个游戏，它还涉及到团队合作，每一队(包括赢得那队)，每人付5美元现金，或赢家得到其他类似现金奖励，并规定什么样的情况下才是赢家，例如"most Buncos" or "most points"的情况下胜利。在这里我会跳过这些，而只关注投骰子这一部分。


### 关于数学逻辑部分

在专注于编程这方面的事之前，我先简单说说游戏背后的数学逻辑。要是有一个适当重量的骰子投骰子会变得很容易，任意一个值出现概率都是 1/6。


完全随机小提示：不确定你的骰子是否每个面都是一样重量? 把它们扔进盐水里然后转一下。YouTube上，有很多科学界的有趣视频向你展示怎么来做这个测试。


所以三个骰子点数一样的几率有多大? 第一个骰子100%会有一个值 (这儿没什么可说的)，所以很简单。第二个则有16.66%的概率和第一个骰子的值一样，接下来第三个骰子也是一样。 但当然，总概率是三个概率相乘的结果，所以最后，三个骰子值相等的概率是2.7%。



接下来，每个骰子和当前轮数数字相同的概率都是16.66%。从数学角度来说：0.166 * 0.166 * 0.166 = 0.00462。


换句话说，你有0.46%的可能性投出Bunco,比200次中出现一次的可能性还小一点。


实际上还可以更难。如果你有5个骰子，投出 Mini Bunco (也可以叫做Yahtzee) 的概率为0.077%，如果你想所有的骰子的值都相同，假设都是6，那概率就是0.00012%，那就基本上没什么可能了。


### 开始编程吧

和所有游戏一样，最难的部分是有一个能生成随机数的随机数发生器。这一部分在shell 脚本中还是很难实现的，所以我需要一步步来，并假设shell内置的随机数发生器就够用了

不过好在内置的随机数发生器很好用。用 $RANDOM 就能得到一个0到MAXINT(32767)之间的随机值：

```

$ echo $RANDOM $RANDOM $RANDOM
10252 22142 14863

```

为了确保产生的值一定是 1-6之中的某个值，使用取余函数： 


```

$ echo $(( $RANDOM % 6 ))
3
$ echo $(( $RANDOM % 6 ))
0

```

哦！我忘了要加1，下面是另一次尝试：


```

$ echo $(( ( $RANDOM % 6 ) + 1 ))
6

```

下面要实现投骰子这一功能。这个函数中你可以声明一个局部变量来存储生成的随机值：


```

rolldie()
{
   local result=$1
   rolled=$(( ( $RANDOM % 6 ) + 1 ))
   eval $result=$rolled
}

```

使用 eval 确保生成的随机数被实际存储在变量中。这一部分也很容易：

```

rolldie die1

```

这会为第一个骰子生成一个1-6之中的值。要为3个骰子都生成值，执行3次上面的函数：


```

rolldie die1 ; rolldie die2 ; rolldie die3

```

现在判断下生成的值。首先，判断是不是Bunco(3个骰子值相同)，然后是不是和当前轮数值也相同：


```

if [ $die1 -eq $die2 ] && [ $die2 -eq $die3 ] ; then
  if [ $die1 -eq $round ] ; then
    echo "BUNCO!"
    score=25
  else
    echo "Mini Bunco!"
    score=5
  fi

```

这可能是所有判断语句中最难的部分了，注意第一个条件语句中这种不常用的写法 ： [ cond1 ] && [ cond2 ]。如果你想写成 cond1 -a cond2 ，这样也可以。在shell编程中，解决问题的方法往往不止一种。


代码剩下的部分很直白，你只需要判断每个骰子的值是不是和本轮数字相同：


```

if [ $die1 -eq $round ] ; then
  score=1
fi
if [ $die2 -eq $round ] ; then
  score=$(( $score + 1 ))
fi
if [ $die3 -eq $round ] ; then
  score=$(( $score + 1 ))
fi

```

唯一要注意的是当出现 Bunco/Mini Bunco 就不需要再统计本轮分数了。所以整个第二部分的判断语句都要写在第一个条件语句的else中（为了判断3个骰子值是否都相同）。



把所有的综合起来，然后在命令行中输入轮数，下面是现在的脚本执行后的结果：


```

$ sh bunco.sh 5
You rolled: 1 1 5
score = 1
$ sh bunco.sh 2
You rolled: 6 4 3
score = 0
$ sh bunco.sh 1
You rolled: 1 1 1
BUNCO!
score = 25

```

竟然这么快就出现 Bunco 了? 好吧，就像我说的，shell内置的随机数发生器在随机数产生这方面可能有些问题。



你可以执行脚本几百次，从而让你的脚本得以正确运行，然后看看Bunco/Mini Bunco出现次数所占的百分比。但是我想把这部分作为练习，留给亲爱的读者你们。不过，也许我下次会抽时间完成剩下的部分。


让我们完成这一脚本吧，还有分数统计和一次性执行6次投骰子(这次不用再在命令行中手动输入当前轮数了)这两个功能。这也很容易，因为只是将上面的内容整个嵌套在里面，换句话说，就是将一个复杂的条件嵌套结构全部写在了一个函数中：


```

BuncoRound()
{
   # roll, display, and score a round of bunco!
   # round is specified when invoked, score added to totalscore

   local score=0 ; local round=$1 ; local hidescore=0

   rolldie die1 ; rolldie die2 ; rolldie die3
   echo Round $round. You rolled: $die1 $die2 $die3

   if [ $die1 -eq $die2 ] && [ $die2 -eq $die3 ] ; then
     if [ $die1 -eq $round ] ; then
       echo "  BUNCO!"
       score=25
       hidescore=1
     else
       echo "  Mini Bunco!"
       score=5
       hidescore=1
     fi
   else
     if [ $die1 -eq $round ] ; then
       score=1
     fi
     if [ $die2 -eq $round ] ; then
       score=$(( $score + 1 ))
     fi
     if [ $die3 -eq $round ] ; then
       score=$(( $score + 1 ))
     fi
   fi

   if [ $hidescore -eq 0 ] ; then
     echo "  score this round: $score"
   fi

   totalscore=$(( $totalscore + $score ))
}

```

我承认，我忍不住自己做了一点改进，包括判断当前是Bunco, Mini Bunco 还是其他需要计算分数的情况这一部分 (这就是$hidescore这一变量的作用).


实现这个简直是小菜一碟，只要一个循环就好了：

```

for round in {1..6} ; do
  BuncoRound $round
done

```

这就是现在所写的整个程序。让我们执行一下看看结果：

```

$ sh bunco.sh 1
Round 1\. You rolled: 2 3 3
  score this round: 0
Round 2\. You rolled: 2 6 6
  score this round: 1
Round 3\. You rolled: 1 2 4
  score this round: 0
Round 4\. You rolled: 2 1 4
  score this round: 1
Round 5\. You rolled: 5 5 6
  score this round: 2
Round 6\. You rolled: 2 1 3
  score this round: 0
Game over. Your total score was 4

```

嗯。并不是很令人满意，可能是因为它只是游戏的一次完整执行。不过，你可以将脚本执行几百几千次，记下"Game over"出现的位置，然后用一些快速分析工具来看看你在每6轮中有几次得分超过3分。(要让3个骰子值相同，这个概率大概在50%左右)。

无论怎么说，这都不是一个复杂的游戏，但是它是一个很有意思的小程序项目。现在，如果有一个20面的骰子，每一轮游戏有好几十轮，每轮都掷同一个骰子，情况又会发生什么变化呢?



--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/shell-scripting-bunco-game

作者：[Dave Taylor][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/dave-taylor
