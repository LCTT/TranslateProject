[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10495-1.html)
[#]: subject: (Plan your own holiday calendar at the Linux command line)
[#]: via: (https://opensource.com/article/18/12/linux-toy-cal)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

在 Linux 命令行中规划你的假期日历
======

> 将命令链接在一起，构建一个彩色日历，然后在暴风雪中将其拂去。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-cal.png?itok=S0F8RY9k)

欢迎阅读今天推出的 Linux 命令行玩具降临日历。如果这是你第一次访问本系列，你可能会问：什么是命令行玩具。即使我不太确定，但一般来说，它可以是一个游戏或任何简单的娱乐，可以帮助你在终端玩得开心。

很可能你们中的一些人之前已经看过我们日历上的各种选择，但我们希望给每个人至少一件新东西。

我们在没有创建实际日历的情况下完成了本系列的第 7 天，所以今天让我们使用命令行工具来做到这一点：`cal`。就其本身而言，`cal` 可能不是最令人惊奇的工具，但我们可以使用其它一些实用程序来为它增添一些趣味。

很可能，你的系统上已经安装了 `cal`。要使用它，只需要输入 `cal` 即可。

```
$ cal
    December 2018  
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31          
```

我们不打算在本文中深入介绍高级用法，因此如果你想了解有关 `cal` 的更多信息，查看 Opensouce.com 社区版主 Don Watkin 的优秀文章 [date 和 cal 命令概述][1]。

现在，让我们用一个漂亮的盒子来为它增添趣味，就像我们在上一篇 Linux 玩具文章中介绍的那样。我将使用钻石块，用一点内边距来对齐。


```
$ cal | boxes -d diamonds -p a1l4t2 
       /\          /\          /\
    /\//\\/\    /\//\\/\    /\//\\/\
 /\//\\\///\\/\//\\\///\\/\//\\\///\\/\
//\\\//\/\\///\\\//\/\\///\\\//\/\\///\\
\\//\/                            \/\\//
 \/                                  \/
 /\           December 2018          /\
//\\      Su Mo Tu We Th Fr Sa      //\\
\\//                         1      \\//
 \/        2  3  4  5  6  7  8       \/
 /\        9 10 11 12 13 14 15       /\
//\\      16 17 18 19 20 21 22      //\\
\\//      23 24 25 26 27 28 29      \\//
 \/       30 31                      \/
 /\                                  /\
//\\/\                            /\//\\
\\///\\/\//\\\///\\/\//\\\///\\/\//\\\//
 \/\\///\\\//\/\\///\\\//\/\\///\\\//\/
    \/\\//\/    \/\\//\/    \/\\//\/
       \/          \/          \/
```

看起来很不错，但是为了更规整，让我们把整个东西放到另一个盒子里，为了好玩，这次我们将使用卷轴式设计。

```
cal | boxes -d diamonds -p a1t2l3 | boxes -a c -d scroll        
 / ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \
|  /~~\                                              /~~\  |
|\ \   |         /\          /\          /\         |   / /|
| \   /|      /\//\\/\    /\//\\/\    /\//\\/\      |\   / |
|  ~~  |   /\//\\\///\\/\//\\\///\\/\//\\\///\\/\   |  ~~  |
|      |  //\\\//\/\\///\\\//\/\\///\\\//\/\\///\\  |      |
|      |  \\//\/                            \/\\//  |      |
|      |   \/                                  \/   |      |
|      |   /\          December 2018           /\   |      |
|      |  //\\     Su Mo Tu We Th Fr Sa       //\\  |      |
|      |  \\//                        1       \\//  |      |
|      |   \/       2  3  4  5  6  7  8        \/   |      |
|      |   /\       9 10 11 12 13 14 15        /\   |      |
|      |  //\\     16 17 18 19 20 21 22       //\\  |      |
|      |  \\//     23 24 25 26 27 28 29       \\//  |      |
|      |   \/      30 31                       \/   |      |
|      |   /\                                  /\   |      |
|      |  //\\/\                            /\//\\  |      |
|      |  \\///\\/\//\\\///\\/\//\\\///\\/\//\\\//  |      |
|      |   \/\\///\\\//\/\\///\\\//\/\\///\\\//\/   |      |
|      |      \/\\//\/    \/\\//\/    \/\\//\/      |      |
|      |         \/          \/          \/         |      |
|      |                                            |      |
 \     |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|     /
  \   /                                              \   /
   ~~~                                                ~~~
```

完美。现在，这事有点小激动了。我喜欢我们的设计，但我想更妙一些，所以我要给它上色。但是 Opensource.com 员工所在的北卡罗来版纳州罗利办公室，本周末很有可能下雪。所以，让我们享受彩色降临日历，然后用雪擦掉它。

关于雪，我抓取了一些 Bash 和 Gawk 的漂亮[代码片段][2]，幸亏我发现了 CLIMagic。如果你不熟悉 CLIMagic，去查看他们的[网站][3]，在 [Twitter][4] 上关注他们。你会满意的。

我们开始吧。让我们清除屏幕，扔掉四四方方的日历，给它上色，等几秒钟，然后用暴风雪把它吹走。这些在终端可以用一行命令完成。

```
$ clear;cal|boxes -d diamonds -p a1t2l3|boxes -a c -d scroll|lolcat;sleep 3;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS)) $(printf "\u2744\n");sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH%s \033[0;0H",a[x],x,$4;}}'
```

大功告成。

![](https://opensource.com/sites/default/files/uploads/linux-toy-cal-animated.gif)

要使它在你的系统上工作，你需要所有它引用的实用程序（`box`、`lolcat`、`gawk` 等），还需要使用支持 Unicode 的终端仿真器。

你有特别喜欢的命令行小玩具需要我介绍的吗？这个系列要介绍的小玩具大部分已经有了落实，但还预留了几个空位置。请在评论区留言，我会查看的。如果还有空位置，我会考虑介绍它的。如果没有，但如果我得到了一些很好的意见，我会在最后做一些有价值的提及。

看看昨天的玩具：[使用 Nyan Cat 在 Linux 命令行休息][5]。记得明天再来！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-cal

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/16/12/using-calendar-function-linux
[2]: http://climagic.org/coolstuff/let-it-snow.html
[3]: http://climagic.org/
[4]: https://twitter.com/climagic
[5]: https://opensource.com/article/18/12/linux-toy-nyancat
