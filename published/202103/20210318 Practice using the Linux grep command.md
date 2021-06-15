[#]: subject: "Practice using the Linux grep command"
[#]: via: "https://opensource.com/article/21/3/grep-cheat-sheet"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13247-1.html"

练习使用 Linux 的 grep 命令
======

> 来学习下搜索文件中内容的基本操作，然后下载我们的备忘录作为 grep 和正则表达式的快速参考指南。

![](https://img.linux.net.cn/data/attachment/album/202103/29/093323yn6ilqvg6z6iizcf.jpg)

`grep`（<ruby>全局正则表达式打印<rt>Global Regular Expression Print</rt></ruby>）是由 Ken Thompson 早在 1974 年开发的基本 Unix 命令之一。在计算领域，它无处不在，通常被用作为动词（“搜索一个文件中的内容”）。如果你的谈话对象有极客精神，那么它也能在真实生活场景中使用。（例如，“我会 `grep` 我的内存条来回想起那些信息。”）简而言之，`grep` 是一种用特定的字符模式来搜索文件中内容的方式。如果你感觉这听起来像是文字处理器或文本编辑器的现代 Find 功能，那么你就已经在计算行业感受到了 `grep` 的影响。

`grep` 绝不是被现代技术抛弃的远古命令，它的强大体现在两个方面：

  * `grep` 可以在终端操作数据流，因此你可以把它嵌入到复杂的处理中。你不仅可以在一个文本文件中*查找*文字，还可以提取文字后把它发给另一个命令。
  * `grep` 使用正则表达式来提供灵活的搜索能力。

虽然需要一些练习，但学习 `grep` 命令还是很容易的。本文会介绍一些我认为 `grep` 最有用的功能。

- 下载我们免费的 [grep 备忘录][2]

### 安装 grep

Linux 默认安装了 `grep`。

MacOS 默认安装了 BSD 版的 `grep`。BSD 版的 `grep` 跟 GNU 版有一点不一样，因此如果你想完全参照本文，那么请使用 [Homebrew][3] 或 [MacPorts][4] 安装 GNU 版的 `grep`。

### 基础的 grep

所有版本的 `grep` 基础语法都一样。入参是匹配模式和你需要搜索的文件。它会把匹配到的每一行输出到你的终端。

```
$ grep gnu gpl-3.0.txt
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
<http://www.gnu.org/licenses/>.
<http://www.gnu.org/philosophy/why-not-lgpl.html>.
```

`grep` 命令默认大小写敏感，因此 “gnu”、“GNU”、“Gnu” 是三个不同的值。你可以使用 `--ignore-case` 选项来忽略大小写。

```
$ grep --ignore-case gnu gpl-3.0.txt
                    GNU GENERAL PUBLIC LICENSE
  The GNU General Public License is a free, copyleft license for
the GNU General Public License is intended to guarantee your freedom to
GNU General Public License for most of our software; it applies also to
[...16 more results...]
<http://www.gnu.org/licenses/>.
<http://www.gnu.org/philosophy/why-not-lgpl.html>.
```

你也可以通过 `--invert-match` 选项来输出所有没有匹配到的行：

```
$ grep --invert-match \
--ignore-case gnu gpl-3.0.txt
                      Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
[...648 lines...]
Public License instead of this License.  But first, please read
```

### 管道

能搜索文件中的文本内容是很有用的，但是 [POSIX][8] 的真正强大之处是可以通过“管道”来连接多条命令。我发现我使用 `grep` 最好的方式是把它与其他工具如 `cut`、`tr` 或 [curl][9] 联合使用。

假如现在有一个文件，文件中每一行是我想要下载的技术论文。我可以打开文件手动点击每一个链接，然后点击火狐浏览器的选项把每一个文件保存到我的硬盘，但是需要点击多次且耗费很长时间。而我还可以搜索文件中的链接，用 `--only-matching` 选项*只*打印出匹配到的字符串。

```
$ grep --only-matching http\:\/\/.*pdf example.html
http://example.com/linux_whitepaper.pdf
http://example.com/bsd_whitepaper.pdf
http://example.com/important_security_topic.pdf
```

输出是一系列的 URL，每行一个。而这与 Bash 处理数据的方式完美契合，因此我不再把 URL 打印到终端，而是把它们通过管道传给 `curl`：

```
$ grep --only-matching http\:\/\/.*pdf \
example.html | curl --remote-name
```

这条命令可以下载每一个文件，然后以各自的远程文件名命名保存在我的硬盘上。

这个例子中我的搜索模式可能很晦涩。那是因为它用的是正则表达式，一种在大量文本中进行模糊搜索时非常有用的”通配符“语言。

### 正则表达式

没有人会觉得<ruby>正则表达式<rt>regular expression</rt></ruby>（简称 “regex”）很简单。然而，我发现它的名声往往比它应得的要差。诚然，很多人在使用正则表达式时“过于炫耀聪明”，直到它变得难以阅读，大而全，以至于复杂得换行才好理解，但是你不必过度使用正则。这里简单介绍一下我使用正则表达式的方式。

首先，创建一个名为 `example.txt` 的文件，输入以下内容：

```
Albania
Algeria
Canada
0
1
3
11
```

最基础的元素是不起眼的 `.` 字符。它表示一个字符。

```
$ grep Can.da example.txt
Canada
```

模式 `Can.da` 能成功匹配到 `Canada` 是因为 `.` 字符表示任意*一个*字符。

可以使用下面这些符号来使 `.` 通配符表示多个字符：

  * `?` 匹配前面的模式零次或一次
  * `*` 匹配前面的模式零次或多次
  * `+` 匹配前面的模式一次或多次
  * `{4}` 匹配前面的模式 4 次（或是你在括号中写的其他次数）

了解了这些知识后，你可以用你认为有意思的所有模式来在 `example.txt` 中做练习。可能有些会成功，有些不会成功。重要的是你要去分析结果，这样你才会知道原因。

例如，下面的命令匹配不到任何国家：

```
$ grep A.a example.txt
```

因为 `.` 字符只能匹配一个字符，除非你增加匹配次数。使用 `*` 字符，告诉 `grep` 匹配一个字符零次或者必要的任意多次直到单词末尾。因为你知道你要处理的内容，因此在本例中*零次*是没有必要的。在这个列表中一定没有单个字母的国家。因此，你可以用 `+` 来匹配一个字符至少一次且任意多次直到单词末尾：

```
$ grep A.+a example.txt
Albania
Algeria
```

你可以使用方括号来提供一系列的字母：

```
$ grep [A,C].+a example.txt
Albania
Algeria
Canada
```

也可以用来匹配数字。结果可能会震惊你：

```
$ grep [1-9] example.txt
1
3
11
```

看到 11 出现在搜索数字 1 到 9 的结果中，你惊讶吗？

如果把 13 加到搜索列表中，会出现什么结果呢？

这些数字之所以会被匹配到，是因为它们包含 1，而 1 在要匹配的数字中。

你可以发现，正则表达式有时会令人费解，但是通过体验和练习，你可以熟练掌握它，用它来提高你搜索数据的能力。

### 下载备忘录

`grep` 命令还有很多文章中没有列出的选项。有用来更好地展示匹配结果、列出文件、列出匹配到的行号、通过打印匹配到的行周围的内容来显示上下文的选项，等等。如果你在学习 `grep`，或者你经常使用它并且通过查阅它的`帮助`页面来查看选项，那么你可以下载我们的备忘录。这个备忘录使用短选项（例如，使用 `-v`，而不是 `--invert-matching`）来帮助你更好地熟悉 `grep`。它还有一部分正则表达式可以帮你记住用途最广的正则表达式代码。 [现在就下载 grep 备忘录！][2]

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/grep-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC "Hand putting a Linux file folder into a drawer"
[2]: https://opensource.com/downloads/grep-cheat-sheet
[3]: https://opensource.com/article/20/6/homebrew-mac
[4]: https://opensource.com/article/20/11/macports
[5]: http://www.gnu.org/licenses/\>
[6]: http://www.gnu.org/philosophy/why-not-lgpl.html\>
[7]: http://fsf.org/\>
[8]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[9]: https://opensource.com/downloads/curl-command-cheat-sheet
