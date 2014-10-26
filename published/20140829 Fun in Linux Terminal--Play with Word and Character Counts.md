Linux终端的乐趣之把玩字词计数
================================================================================
Linux 命令行有很多的乐趣，我们可以很容易并且完善地执行很多繁琐的任务。比如，我们计算一个文本文件中字和字符的出现频率，这就是我们打算在这篇文章中讲到的。

立刻来到我们脑海的命令，计算字和字符在一个文本文件中出现频率的 Linux 命令是 [wc 命令] [1]。

![Fun with Word and Letter Counts in Shell](http://www.tecmint.com/wp-content/uploads/2014/03/Linux-Word-Count.png)

在使用的脚本来分析文本文件之前，我们必须有一个文本文件。为了保持一致性，我们将创建一个文本文件，man命令的输出如下所述。

    $ man man > man.txt

以上命令是将man命令的使用方式导入到**man.txt**文件里。

我们希望能得到最平常的单词，对之前我们新建的文件执行如下脚本。

    $ cat man.txt | tr ' '  '\012' | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | grep -v '[^a-z]' | sort | uniq -c | sort -rn | head

### Sample Output ###

    7557 
    262 the 
    163 to 
    112 is 
    112 a 
    78 of 
    78 manual 
    76 and 
    64 if 
    63 be

上面的脚本，输出了最常使用的十个单词。

如何看单个的字母呢？那就用如下的命令。

    $ echo 'tecmint team' | fold -w1

### Sample Output ###

    t 
    e 
    c 
    m 
    i 
    n 
    t 
    t 
    e 
    a 
    m

**注**: `-w1`只是设定了长度

现在我们将从那个文本文件中掰下来的每一个字母，对结果进行排序，得到所需的输出频率的十个最常见的字符。

    $ fold -w1 < man.txt | sort | uniq -c | sort -rn | head

### Sample Output ###

    8579  
    2413 e
    1987 a
    1875 t
    1644 i
    1553 n
    1522 o
    1514 s
    1224 r
    1021 l

如何区分大小写呢？之前我们都是忽略大小写的。所以，用如下命令。

    $ fold -w1 < man.txt | sort | tr '[:lower:]' '[:upper:]' | uniq -c | sort -rn | head -20

### Sample Output ###

    11636  
    2504 E 
    2079 A 
    2005 T 
    1729 I 
    1645 N 
    1632 S 
    1580 o
    1269 R 
    1055 L 
    836 H 
    791 P 
    766 D 
    753 C 
    725 M 
    690 U 
    605 F 
    504 G 
    352 Y 
    344 .

请检查上面的输出，标点符号居然包括在内。让我们干掉他，用**tr** 命令。GO:

    $ fold -w1 < man.txt | tr '[:lower:]' '[:upper:]' | sort | tr -d '[:punct:]' | uniq -c | sort -rn | head -20

### Sample Output ###

      11636  
      2504 E 
      2079 A 
      2005 T 
      1729 I 
      1645 N 
      1632 S 
      1580 O 
      1550 
      1269 R 
      1055 L 
       836 H 
       791 P 
       766 D 
       753 C 
       725 M 
       690 U 
       605 F 
       504 G 
       352 Y

现在，我们有了三个文本，那就让我们用如下命令查看结果吧。

    $ cat *.txt | fold -w1 | tr '[:lower:]' '[:upper:]' | sort | tr -d '[:punct:]' | uniq -c | sort -rn | head -8

### Sample Output ###

      11636  
       2504 E 
       2079 A 
       2005 T 
       1729 I 
       1645 N 
       1632 S 
       1580 O

下一步我们将会生成那些罕见的至少十个字母长的单词。以下是简单的脚本：

    $ cat man.txt | tr '' '\012' | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr -d '[0-9]' | sort | uniq -c | sort -n |  grep -E '..................' | head

### Sample Output ###

    1        ────────────────────────────────────────── 
    1        a all 
    1        abc             any or all arguments within   are optional 
    1               able  see setlocale for precise details 
    1        ab              options delimited by  cannot be used together 
    1               achieved by using the less environment variable 
    1              a child process returned a nonzero exit status 
    1               act as if this option was supplied using the name as a filename 
    1               activate local mode  format and display  local  manual  files 
    1               acute accent

**注**: 上面的.越来越多，其实，我们可以使用.{10} 得到同样的效果。

这些简单的脚本，让我们知道最频繁出现的单词和英语中的字符。

现在结束了。下次我会在这里讲到另一个有趣的话题，你应该会喜欢读。还有别忘了向我们提供您的宝贵意见。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/play-with-word-and-character-counts-in-linux/

作者：[Avishek Kumar][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/wc-command-examples/