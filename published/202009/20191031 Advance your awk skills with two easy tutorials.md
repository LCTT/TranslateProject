[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12658-1.html)
[#]: subject: (Advance your awk skills with two easy tutorials)
[#]: via: (https://opensource.com/article/19/10/advanced-awk)
[#]: author: (Dave Neary https://opensource.com/users/dneary)

通过两个简单的教程来提高你的 awk 技能
======

> 超越单行的 awk 脚本，学习如何做邮件合并和字数统计。

![](https://img.linux.net.cn/data/attachment/album/202009/28/154624jk8w4ez6oujbur8j.jpg)

`awk` 是 Unix 和 Linux 用户工具箱中最古老的工具之一。`awk` 由 Alfred Aho、Peter Weinberger 和 Brian Kernighan（即工具名称中的 A、W 和 K）在 20 世纪 70 年代创建，用于复杂的文本流处理。它是流编辑器 `sed` 的配套工具，后者是为逐行处理文本文件而设计的。`awk` 支持更复杂的结构化程序，是一门完整的编程语言。

本文将介绍如何使用 `awk` 完成更多结构化的复杂任务，包括一个简单的邮件合并程序。

### awk 的程序结构

`awk` 脚本是由 `{}`（大括号）包围的功能块组成，其中有两个特殊的功能块，`BEGIN` 和 `END`，它们在处理第一行输入流之前和最后一行处理之后执行。在这两者之间，块的格式为：

```
模式 { 动作语句 }
```

当输入缓冲区中的行与模式匹配时，每个块都会执行。如果没有包含模式，则函数块在输入流的每一行都会执行。

另外，以下语法可以用于在 `awk` 中定义可以从任何块中调用的函数。

```
function 函数名(参数列表) { 语句 }
```

这种模式匹配块和函数的组合允许开发者结构化的 `awk` 程序，以便重用和提高可读性。

### awk 如何处理文本流

`awk` 每次从输入文件或流中一行一行地读取文本，并使用字段分隔符将其解析成若干字段。在 `awk` 的术语中，当前的缓冲区是一个*记录*。有一些特殊的变量会影响 `awk` 读取和处理文件的方式：

  * `FS`（<ruby>字段分隔符<rt>field separator</rt></ruby>）。默认情况下，这是任何空格字符（空格或制表符）。
  * `RS`（<ruby>记录分隔符<rt>record separator</rt></ruby>）。默认情况下是一个新行（`n`）。
  * `NF`（<ruby>字段数<rt>number of fields</rt></ruby>）。当 `awk` 解析一行时，这个变量被设置为被解析出字段数。
  * `$0:` 当前记录。
  * `$1`、`$2`、`$3` 等：当前记录的第一、第二、第三等字段。
  * `NR`（<ruby>记录数<rt>number of records</rt></ruby>）。迄今已被 `awk` 脚本解析的记录数。

影响 `awk` 行为的变量还有很多，但知道这些已经足够开始了。

### 单行 awk 脚本

对于一个如此强大的工具来说，有趣的是，`awk` 的大部分用法都是基本的单行脚本。也许最常见的 `awk` 程序是打印 CSV 文件、日志文件等输入行中的选定字段。例如，下面的单行脚本从 `/etc/passwd` 中打印出一个用户名列表：

```
awk -F":" '{print $1 }' /etc/passwd
```

如上所述，`$1` 是当前记录中的第一个字段。`-F` 选项将 `FS` 变量设置为字符 `:`。

字段分隔符也可以在 `BEGIN` 函数块中设置：

```
awk 'BEGIN { FS=":" } {print $1 }' /etc/passwd
```

在下面的例子中，每一个 shell 不是 `/sbin/nologin` 的用户都可以通过在该块前面加上匹配模式来打印出来：

```
awk 'BEGIN { FS=":" } ! /\/sbin\/nologin/ {print $1 }' /etc/passwd
```

### awk 进阶：邮件合并

现在你已经掌握了一些基础知识，尝试用一个更具有结构化的例子来深入了解 `awk`：创建邮件合并。

邮件合并使用两个文件，其中一个文件（在本例中称为 `email_template.txt`）包含了你要发送的电子邮件的模板：

```
From: Program committee <pc@event.org>
To: {firstname} {lastname} <{email}>
Subject: Your presentation proposal

Dear {firstname},

Thank you for your presentation proposal:
  {title}

We are pleased to inform you that your proposal has been successful! We
will contact you shortly with further information about the event
schedule.

Thank you,
The Program Committee
```

而另一个则是一个 CSV 文件（名为 `proposals.csv`），里面有你要发送邮件的人：

```
firstname,lastname,email,title
Harry,Potter,hpotter@hogwarts.edu,"Defeating your nemesis in 3 easy steps"
Jack,Reacher,reacher@covert.mil,"Hand-to-hand combat for beginners"
Mickey,Mouse,mmouse@disney.com,"Surviving public speaking with a squeaky voice"
Santa,Claus,sclaus@northpole.org,"Efficient list-making"
```

你要读取 CSV 文件，替换第一个文件中的相关字段（跳过第一行），然后把结果写到一个叫 `acceptanceN.txt` 的文件中，每解析一行就递增文件名中的 `N`。

把 `awk` 程序写在一个叫 `mail_merge.awk` 的文件中。在 `awk` 脚本中的语句用 `;` 分隔。第一个任务是设置字段分隔符变量和其他几个脚本需要的变量。你还需要读取并丢弃 CSV 中的第一行，否则会创建一个以 `Dear firstname` 开头的文件。要做到这一点，请使用特殊函数 `getline`，并在读取后将记录计数器重置为 0。

```
BEGIN {
  FS=",";
  template="email_template.txt";
  output="acceptance";
  getline;
  NR=0;
}
```

主要功能非常简单：每处理一行，就为各种字段设置一个变量 —— `firstname`、`lastname`、`email` 和 `title`。模板文件被逐行读取，并使用函数 `sub` 将任何出现的特殊字符序列替换为相关变量的值。然后将该行以及所做的任何替换输出到输出文件中。

由于每行都要处理模板文件和不同的输出文件，所以在处理下一条记录之前，需要清理和关闭这些文件的文件句柄。

```
{
        # 从输入文件中读取关联字段
        firstname=$1;
        lastname=$2;
        email=$3;
        title=$4;

        # 设置输出文件名
        outfile=(output NR ".txt");

        # 从模板中读取一行，替换特定字段，
        # 并打印结果到输出文件。
        while ( (getline ln &lt; template) &gt; 0 )
        {
                sub(/{firstname}/,firstname,ln);
                sub(/{lastname}/,lastname,ln);
                sub(/{email}/,email,ln);
                sub(/{title}/,title,ln);
                print(ln) &gt; outfile;
        }

        # 关闭模板和输出文件，继续下一条记录
        close(outfile);
        close(template);
}
```

你已经完成了! 在命令行上运行该脚本：

```
awk -f mail_merge.awk proposals.csv
```

或

```
awk -f mail_merge.awk < proposals.csv
```

你会在当前目录下发现生成的文本文件。

### awk 进阶：字频计数

`awk` 中最强大的功能之一是关联数组，在大多数编程语言中，数组条目通常由数字索引，但在 `awk` 中，数组由一个键字符串进行引用。你可以从上一节的文件 `proposals.txt` 中存储一个条目。例如，在一个单一的关联数组中，像这样：

```
        proposer["firstname"]=$1;
        proposer["lastname"]=$2;
        proposer["email"]=$3;
        proposer["title"]=$4;
```

这使得文本处理变得非常容易。一个使用了这个概念的简单的程序就是词频计数器。你可以解析一个文件，在每一行中分解出单词（忽略标点符号），对行中的每个单词进行递增计数器，然后输出文本中出现的前 20 个单词。

首先，在一个名为 `wordcount.awk` 的文件中，将字段分隔符设置为包含空格和标点符号的正则表达式：

```
BEGIN {
        # ignore 1 or more consecutive occurrences of the characters
        # in the character group below
        FS="[ .,:;()<>{}@!\"'\t]+";
}
```

接下来，主循环函数将遍历每个字段，忽略任何空字段（如果行末有标点符号，则会出现这种情况），并递增行中单词数：

```
{
        for (i = 1; i &lt;= NF; i++) {
                if ($i != "") {
                        words[$i]++;
                }
        }
}
```

最后，处理完文本后，使用 `END` 函数打印数组的内容，然后利用 `awk` 的能力，将输出的内容用管道输入 shell 命令，进行数字排序，并打印出 20 个最常出现的单词。

```
END {
        sort_head = "sort -k2 -nr | head -n 20";
        for (word in words) {
                printf "%s\t%d\n", word, words[word] | sort_head;
        }
        close (sort_head);
}
```

在这篇文章的早期草稿上运行这个脚本，会产生这样的输出：

```
[dneary@dhcp-49-32.bos.redhat.com]$ awk -f wordcount.awk < awk_article.txt
the     79
awk     41
a       39
and     33
of      32
in      27
to      26
is      25
line    23
for     23
will    22
file    21
we      16
We      15
with    12
which   12
by      12
this    11
output  11
function        11
```

### 下一步是什么？

如果你想了解更多关于 `awk` 编程的知识，我强烈推荐 Dale Dougherty 和 Arnold Robbins 所著的《[Sed 和 awk][8]》这本书。

`awk` 编程进阶的关键之一是掌握“扩展正则表达式”。`awk` 为你可能已经熟悉的 sed [正则表达式][9]语法提供了几个强大的补充。

另一个学习 `awk` 的好资源是 [GNU awk 用户指南][10]。它有一个完整的 `awk` 内置函数库的参考资料，以及很多简单和复杂的 `awk` 脚本的例子。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/advanced-awk

作者：[Dave Neary][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dneary
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk (a checklist for a team)
[2]: mailto:pc@event.org
[3]: mailto:hpotter@hogwarts.edu
[4]: mailto:reacher@covert.mil
[5]: mailto:mmouse@disney.com
[6]: mailto:sclaus@northpole.org
[7]: mailto:dneary@dhcp-49-32.bos.redhat.com
[8]: https://www.amazon.com/sed-awk-Dale-Dougherty/dp/1565922255/book
[9]: https://en.wikibooks.org/wiki/Regular_Expressions/POSIX-Extended_Regular_Expressions
[10]: https://www.gnu.org/software/gawk/manual/gawk.html
