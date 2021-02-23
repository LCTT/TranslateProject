[#]: collector: (lujun9972)
[#]: translator: (Modrisco)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10986-1.html)
[#]: subject: (How Linux can help with your spelling)
[#]: via: (https://www.networkworld.com/article/3400942/how-linux-can-help-with-your-spelling.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何用 Linux 帮助你拼写
======

> 无论你是纠结一个难以理解的单词，还是在将报告发给老板之前再检查一遍，Linux 都可以帮助你解决拼写问题。

![Sandra Henry-Stocker](https://img.linux.net.cn/data/attachment/album/201906/17/214715jayk1k1kbiatkido.jpg)

Linux 为数据分析和自动化提供了各种工具，它也帮助我们解决了一个一直都在纠结的问题 —— 拼写！无论在写每周报告时努力拼出一个单词，还是在提交商业计划书之前想要借助计算机的“眼睛”来找出你的拼写错误。现在我们来看一下它是如何帮助你的。

### look

`look` 是其中一款工具。如果你知道一个单词的开头，你就可以用这个命令来获取以这些字母开头的单词列表。除非提供了替代词源，否则 `look` 将使用 `/usr/share/dict/words` 中的内容来为你标识单词。这个文件有数十万个单词，可以满足我们日常使用的大多数英语单词的需要，但是它可能不包含我们计算机领域中的一些人倾向于使用的更加生僻的单词，如 zettabyte。

`look` 命令的语法非常简单。输入 `look word` ，它将遍历单词文件中的所有单词并找到匹配项。

```
$ look amelio
ameliorable
ameliorableness
ameliorant
ameliorate
ameliorated
ameliorates
ameliorating
amelioration
ameliorations
ameliorativ
ameliorative
amelioratively
ameliorator
amelioratory
```

如果你遇到系统中单词列表中未包含的单词，将无法获得任何输出。

```
$ look zetta
$
```

如果你没有看到你所希望出现的单词，也不要绝望。你可以在你的单词文件中添加单词，甚至引用一个完全不同的单词列表，在网上找一个或者干脆自己创建一个。你甚至不必将添加的单词放在按字母顺序排列的正确位置；只需将其添加到文件的末尾即可。但是，你必须以 root 用户身份执行此操作。例如（要注意 `>>`！）：

```
# echo “zettabyte” >> /usr/share/dict/words
```

当使用不同的单词列表时，例如这个例子中的 “jargon” ，你只需要添加文件的名称。如果不采用默认文件时，请使用完整路径。

```
$ look nybble /usr/share/dict/jargon
nybble
nybbles
```

`look` 命令大小写不敏感，因此你不必关心要查找的单词是否应该大写。

```
$ look zet
ZETA
Zeta
zeta
zetacism
Zetana
zetas
Zetes
zetetic
Zethar
Zethus
Zetland
Zetta
```

当然，不是所有的单词列表都是一样的。一些 Linux 发行版在单词文件中提供了*多得多*的内容。你的文件中可能有十万或者更多倍的单词。

在我的一个 Linux 系统中：

```
$ wc -l /usr/share/dict/words
102402 /usr/share/dict/words
```

在另一个系统中：

```
$ wc -l /usr/share/dict/words
479828 /usr/share/dict/words
```

请记住，`look` 命令只适用于通过单词开头查找，但如果你不想从单词的开头查找，还可以使用其他选项。

### grep

我们深爱的 `grep` 命令像其他工具一样可以从一个单词文件中选出单词。如果你正在找以某些字母开头或结尾的单词，使用 `grep` 命令是自然而然的事情。它可以通过单词的开头、结尾或中间部分来匹配单词。系统中的单词文件可以像使用 `look` 命令时在 `grep` 命令中轻松使用。不过唯一的缺点是你需要指定文件，这一点与 `look` 不尽相同。

在单词的开头前加上 `^`：

```
$ grep ^terra /usr/share/dict/words
terrace
terrace's
terraced
terraces
terracing
terrain
terrain's
terrains
terrapin
terrapin's
terrapins
terraria
terrarium
terrarium's
terrariums
```

在单词的结尾后加上 `$`：

```
$ grep bytes$ /usr/share/dict/words
bytes
gigabytes
kilobytes
megabytes
terabytes
```

使用 `grep` 时，你需要考虑大小写，不过 `grep` 命令也提供了一些选项。

```
$ grep ^[Zz]et /usr/share/dict/words
Zeta
zeta
zetacism
Zetana
zetas
Zetes
zetetic
Zethar
Zethus
Zetland
Zetta
zettabyte
```

为单词文件添加软连接能使这种搜索方式更加便捷：

```
$ ln -s /usr/share/dict/words words
$ grep ^[Zz]et words
Zeta
zeta
zetacism
Zetana
zetas
Zetes
zetetic
Zethar
Zethus
Zetland
Zetta
zettabytye
```

### aspell

`aspell` 命令提供了一种不同的方式。它提供了一种方法来检查你提供给它的任何文件或文本的拼写。你可以通过管道将文本传递给它，然后它会告诉你哪些单词看起来有拼写错误。如果所有单词都拼写正确，则不会有任何输出。

```
$ echo Did I mispell that? | aspell list
mispell
$ echo I can hardly wait to try out aspell | aspell list
aspell
$ echo Did I misspell anything? | aspell list
$
```

`list` 参数告诉 `aspell` 为标准输入单词提供拼写错误的单词列表。

你还可以使用 `aspell` 来定位和更正文本文件中的单词。如果它发现一个拼写错误的单词，它将为你提供一个相似（但拼写正确的）单词列表来替换这个单词，你也可以将该单词加入个人词库（`~/.aspell.en.pws`）并忽略拼写错误，或者完全中止进程（使文件保持处理前的状态）。

```
$ aspell -c mytext
```

一旦 `aspell` 发现一个单词出现了拼写错误，它将会为不正确的 “mispell” 提供一个选项列表：

```
1) mi spell                             6) misplay
2) mi-spell                             7) spell
3) misspell                             8) misapply
4) Ispell                               9) Aspell
5) misspells                            0) dispel
i) Ignore                               I) Ignore all
r) Replace                              R) Replace all
a) Add                                  l) Add Lower
b) Abort                                x) Exit
```

请注意，备选单词和拼写是数字编号的，而其他选项是由字母选项表示的。你可以选择备选拼写中的一项或者自己输入替换项。“Abort” 选项将使文件保持不变，即使你已经为某些单词选择了替换。你选择添加的单词将被插入到本地单词文件中（例如 `~/.aspell.en.pws`）。

#### 其他单词列表

厌倦了英语？ `aspell` 命令可以在其他语言中使用，只要你添加了相关语言的单词列表。例如，在 Debian 系统中添加法语的词库，你可以这样做：

```
$ sudo apt install aspell-fr
```

这个新的词库文件会被安装为 `/usr/share/dict/French`。为了使用它，你只需要简单地告诉 `aspell` 你想要使用替换的单词列表：

```
$ aspell --lang=fr -c mytext
```

这种情况下，当 `aspell` 读到单词 “one” 时，你可能会看到下面的情况：

```
1) once                                 6) orné
2) onde                                 7) ne
3) ondé                                 8) né
4) onze                                 9) on
5) orne                                 0) cône
i) Ignore                               I) Ignore all
r) Replace                              R) Replace all
a) Add                                  l) Add Lower
b) Abort                                x) Exit
```

你也可以从 [GNU 官网][3]获取其他语言的词库。

### 总结

即使你是全国拼字比赛的冠军，你可能偶尔也会需要一点拼写方面的帮助，哪怕只是为了找出你手滑打错的单词。`aspell` 工具，加上 `look` 和 `grep` 命令已经准备来助你一臂之力了。


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3400942/how-linux-can-help-with-your-spelling.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[Modrisco](https://github.com/Modrisco)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/06/linux-spelling-100798596-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: ftp://ftp.gnu.org/gnu/aspell/dict/0index.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
