[#]: subject: (Use awk to calculate letter frequency)
[#]: via: (https://opensource.com/article/21/4/gawk-letter-game)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (lkxed)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14375-1.html)

使用 awk 统计字母频率
======

> 编写一个 awk 脚本来找到一组单词中出现次数最多（和最少）的单词。

![](https://img.linux.net.cn/data/attachment/album/202203/20/085052bajyoejnea8cpw5j.jpg)

近一段时间，我开始编写一个小游戏，在这个小游戏里，玩家使用一个个字母块来组成单词。编写这个游戏之前，我需要先知道常见英文单词中每个字母的使用频率，这样一来，我就可以找到一组更有用的字母块。字母频次统计在很多地方都有相关讨论，包括在 [维基百科][2] 上，但我还是想要自己来实现。

Linux 系统在 `/usr/share/dict/words` 文件中提供了一个单词列表，所以我已经有了一个现成的单词列表。然而，尽管这个 `words` 文件包含了很多我想要的单词，却也包含了一些我不想要的。我想要的单词首先不能是复合词（即不包含连接符和空格的单词），也不能是专有名词（即不包含大写字母单词）。为了得到这个结果，我可以运行 `grep` 命令来取出只由小写字母组成的行：

```
$ grep  '^[a-z]*$' /usr/share/dict/words
```

这个正则表达式的作用是让 `grep` 去匹配仅包含小写字母的行。表达式中的字符 `^` 和 `$` 分别代表了这一行的开始和结束。`[a-z]` 分组仅匹配从 “a” 到 “z” 的小写字母。

下面是一个输出示例：

```
$ grep  '^[a-z]*$' /usr/share/dict/words | head
a
aa
aaa
aah
aahed
aahing
aahs
aal
aalii
aaliis
```

没错，这些都是合法的单词。比如，“aahed” 是 “aah” 的过去式，表示在放松时的感叹，而 “aalii” 是一种浓密的热带灌木。

现在我只需要编写一个 `gawk` 脚本来统计出单词中各个字母出现的次数，然后打印出每个字母的相对频率。

### 字母计数

一种使用 `gawk` 来统计字母个数的方式是，遍历每行输入中的每一个字符，然后对 “a” 到 “z” 之间的每个字母进行计数。`substr` 函数会返回一个给定长度的子串，它可以只包含一个字符，也可以是更长的字符串。比如，下面的示例代码能够取到输入中的每一个字符 `c`：

```
{
    len = length($0); for (i = 1; i <= len; i++) {
        c = substr($0, i, 1);
    }
}
```

如果使用一个全局字符串变量 `LETTERS` 来存储字母表，我就可以借助 `index` 函数来找到某个字符在字母表中的位置。我将扩展 `gawk` 代码示例，让它在输入数据中只取范围在 “a” 到 “z” 的字母：

```
BEGIN { LETTERS = "abcdefghijklmnopqrstuvwxyz" }
 
{
    len = length($0); for (i = 1; i <= len; i++) {
        c = substr($0, i, 1);
        ltr = index(LETTERS, c);
    }
}
```

需要注意的是，`index` 函数将返回字母在 `LETTERS` 字符串中首次出现的位置，第一个位置返回 1，如果没有找到则返回 0。如果我有一个大小为 26 的数组，我就可以利用这个数组来统计每个字母出现的次数。我将在下面的示例代码中添加这个功能，每当一个字母出现在输入中，我就让它对应的数组元素值增加 1（使用 `++`）：

```
BEGIN { LETTERS = "abcdefghijklmnopqrstuvwxyz" }
 
{
    len = length($0); for (i = 1; i <= len; i++) {
        c = substr($0, i, 1);
        ltr = index(LETTERS, c);
 
        if (ltr &gt; 0) {
            ++count[ltr];
        }
    }
}
```

### 打印相对频率

当 `gawk` 脚本统计完所有的字母后，我希望它能输出每个字母的频率。毕竟，我对输入中各个字母的个数没有兴趣，我更关心它们的 _相对频率_。

我将先统计字母 “a” 的个数，然后把它和剩余 “b” 到 “z” 字母的个数比较：


```
END {
    min = count[1]; for (ltr = 2; ltr <= 26; ltr++) {
        if (count[ltr] < min) {
            min = count[ltr];
        }
    }
}
```

在循环的最后，变量 `min` 会等于最少的出现次数，我可以把它为基准，为字母的个数设定一个参照值，然后计算打印出每个字母的相对频率。比如，如果出现次数最少的字母是 “q”，那么 `min` 就会等于 “q” 的出现次数。

接下来，我会遍历每个字母，打印出它和它的相对频率。我通过把每个字母的个数都除以 `min` 的方式来计算出它的相对频率，这意味着出现次数最少的字母的相对频率是 1。如果另一个字母出现的次数恰好是最少次数的两倍，那么这个字母的相对频率就是 2。我只关心整数，所以 2.1 和 2.9 对我来说是一样的（都是 2）。

```
END {
    min = count[1]; for (ltr = 2; ltr <= 26; ltr++) {
        if (count[ltr] < min) {
            min = count[ltr];
        }
    }
 
    for (ltr = 1; ltr <= 26; ltr++) {
        print substr(LETTERS, ltr, 1), int(count[ltr] / min);
    }
}
```

### 最后的完整程序

现在，我已经有了一个能够统计输入中各个字母的相对频率的 `gawk` 脚本：

```
#!/usr/bin/gawk -f
 
# 只统计 a-z 的字符，忽略 A-Z 和其他的字符
 
BEGIN { LETTERS = "abcdefghijklmnopqrstuvwxyz" }
 
{
    len = length($0); for (i = 1; i <= len; i++) {
        c = substr($0, i, 1);
        ltr = index(LETTERS, c);
 
        if (ltr < 0) {
            ++count[ltr];
        }
    }
}
 
# 打印每个字符的相对频率
   
END {
    min = count[1]; for (ltr = 2; ltr <= 26; ltr++) {
        if (count[ltr] < min) {
            min = count[ltr];
        }
    }
 
    for (ltr = 1; ltr <= 26; ltr++) {
        print substr(LETTERS, ltr, 1), int(count[ltr] / min);
    }
}
```

我将把这段程序保存到名为 `letter-freq.awk` 的文件中，这样一来，我就可以在命令行中更方便地使用它。

如果你愿意的话，你也可以使用 `chmod +x` 命令把这个文件设为可独立执行。第一行中的 `#!/usr/bin/gawk -f` 表示 Linux 会使用 `/usr/bin/gawk` 把这个文件当作一个脚本来运行。由于 `gawk` 命令行使用 `-f` 来指定它要运行的脚本文件名，你需要在末尾加上 `-f`。如此一来，当你在 shell 中执行 `letter-freq.awk`，它会被解释为 `/usr/bin/gawk -f letter-freq.awk`。

接下来我将用几个简单的输入来测试这个脚本。比如，如果我给我的 `gawk` 脚本输入整个字母表，每个字母的相对频率都应该是 1：

```
$ echo abcdefghijklmnopqrstuvwxyz | gawk -f letter-freq.awk
a 1
b 1
c 1
d 1
e 1
f 1
g 1
h 1
i 1
j 1
k 1
l 1
m 1
n 1
o 1
p 1
q 1
r 1
s 1
t 1
u 1
v 1
w 1
x 1
y 1
z 1
```

还是使用上述例子，只不过这次我在输入中添加了一个字母 “e”，此时的输出结果中，“e” 的相对频率会是 2，而其他字母的相对频率仍然会是 1：

```
$ echo abcdeefghijklmnopqrstuvwxyz | gawk -f letter-freq.awk
a 1
b 1
c 1
d 1
e 2
f 1
g 1
h 1
i 1
j 1
k 1
l 1
m 1
n 1
o 1
p 1
q 1
r 1
s 1
t 1
u 1
v 1
w 1
x 1
y 1
z 1
```

现在我可以跨出最大的一步了！我将使用 `grep` 命令和 `/usr/share/dict/words` 文件，统计所有仅由小写字母组成的单词中，各个字母的相对使用频率：

```
$ grep  '^[a-z]*$' /usr/share/dict/words | gawk -f letter-freq.awk
a 53
b 12
c 28
d 21
e 72
f 7
g 15
h 17
i 58
j 1
k 5
l 36
m 19
n 47
o 47
p 21
q 1
r 46
s 48
t 44
u 25
v 6
w 4
x 1
y 13
z 2
```

在 `/usr/share/dict/words` 文件的所有小写单词中，字母 “j”、“q” 和 “x” 出现的相对频率最低，字母 “z” 也使用得很少。不出意料，字母 “e” 是使用频率最高的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/gawk-letter-game

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-docdish-typewriterkeys-3.png?itok=NyBwMdK_ (Typewriter keys in multicolor)
[2]: https://en.wikipedia.org/wiki/Letter_frequency
