[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12340-1.html)
[#]: subject: (5 ways to examine the content of files on Linux)
[#]: via: (https://www.networkworld.com/article/3561490/5-ways-to-examine-the-content-of-files-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 上查看文件内容的 5 种方法
======

> 如何使用 cat、more、head 和 tail 命令查看 Linux 文件的内容，而不仅仅是文本文件。

![](https://img.linux.net.cn/data/attachment/album/202006/23/121047zz9gwx9dwz155m2w.jpg)

Linux 提供了许多命令来查看文件的内容，包 括 `cat`、`more`、`head` 和 `tail`，但这只是一个开始。

一方面，即使是最显而易见的命令也有很多许多用户不会去使用的选项。还有一些普普通通的命令提供了一些独特的功能。在本文中，我们将介绍查看文件内容的命令，以及如何定制这些视图以更好地满足你的需求的选项。

### cat

`cat` 命令将文本文件的全部内容发送到终端窗口以供查看。实际上，如果你输入 `cat`，然后输入包含数千行内容的文件名，那么这些行将以极快的速度在你的窗口中滚动，你将无法看到除了最后一屏外的其他文本。对于 Linux 用户来说 `cat` 命令很熟悉，但即使是这个基本命令也提供了许多有用的选项，例如对输出中的行进行编号，这是我们许多人可能从未使用过的。更进一步，你不仅可以对行进行编号，还可以选择如何编号。

对每行进行编号就像这样：

```
$ cat -n msg
     1  Hello --
     2
     3  I hope you are having a wonderful day!
     4
     5
     6  That's it for ...       now
     7
     8  bye!
     9
    10  s.
```

你也可以只对有内容的行编号。请注意，对于此命令，仅包含空格的行不被视为“空”，而是会被编号。

```
$ cat -b msg
     1  Hello --

     2  I hope you are having a wonderful day!


     3  That's it for ...       now

     4  bye!

     5  s.
```

`cat` 命令允许你使用 `-s` 选项忽略重复的空白行，但是要完全忽略空白行你必须添加另一个命令。

```
$ cat -s msg
Hello --

I hope you are having a wonderful day!

That's it for ...       now

bye!

s.
```

要忽略所有空白行，只需如下将 `cat` 的输出通过管道传递给 `grep` 命令。 点（`.`）匹配包含任意字符的文本，因此它将显示任意非空的行，用于结束一行的回车换行做匹配（LCTT 译注：此处原文有误，径改）。

```
$ cat msg | grep .
Hello --
I hope you are having a wonderful day!
That's it for ...       now
bye!
s.
```

`-E` 选项通过在每行末尾加 `$` 符提供视觉提示，来显示行尾是否还有多余的空格。

```
$ cat -E msg
Hello --$
$
I hope you are having a wonderful day!  $
$
$
That's it for ...       now$
$
bye!$
$
s.$
```

使用 `-A` 时，既可以在每行的末尾显示 `$` 字符，并且制表符会显示为 `^I` 而不是空白。

```
$ cat -A msg
Hello --$
$
I hope you are having a wonderful day!$
$
$
That’s it for ...^Inow$
$
bye!$
$
s.$
```

### 使用 head 和 tail 显示文件部分内容

`head` 和 `tail` 显示文件的头部或尾部，默认为十行。 你可以使用 `-3`（显示 3 行）或 `-11`（显示 11 行）之类的字符串来指定要查看的其它行数。`tail` 命令与 `head` 的工作方式相同，但是显示文件的尾部而不是头部。

```
$ head -3 msg
Hello --
I hope you are having a wonderful day!
$ tail -3 msg
bye!

s.
```

你还可以结合使用 `head` 和 `tail` 命令来查看文件中间的文本。你只需要选择起点和想要查看行数即可。在此例中，命令将在文件中显示第二个一百行，并在 `cat` 的帮助下为这些行编号。

```
$ cat -b mybigfile | head -200 | tail -100
   101  Invoice #2020-06-07a sent to vendor
   ...
```

### 使用 more 或者 less 浏览一屏文本

`more` 命令是一次浏览一屏内容的自然之选，而 `less` 通过使用上下键盘箭头增加了在文件中上下移动的能力，这样你就可以遍历内容，然后在文件中回退。

### 使用 od 查看文本的两种方法

`od`（八进制转储）命令能够以常规文本和一系列 ASCII 值（即该文本在文件中的实际编码方式）的形式查看文件。在下面的例子中可以看到，带编号的行显示了 ASCII 数字值，而其他行则显示了文本和不可打印的字符。

```
$ od -bc msg
0000000 110 145 154 154 157 040 055 055 012 012 111 040 150 157 160 145
          H   e   l   l   o       -   -  \n  \n   I       h   o   p   e
0000020 040 171 157 165 040 141 162 145 040 150 141 166 151 156 147 040
              y   o   u       a   r   e       h   a   v   i   n   g
0000040 141 040 167 157 156 144 145 162 146 165 154 040 144 141 171 041
          a       w   o   n   d   e   r   f   u   l       d   a   y   !
0000060 012 012 012 124 150 141 164 047 163 040 151 164 040 146 157 162
         \n  \n  \n   T   h   a   t   '   s       i   t       f   o   r
0000100 040 056 056 056 011 156 157 167 012 012 142 171 145 041 012 012
              .   .   .  \t   n   o   w  \n  \n   b   y   e   !  \n  \n
0000120 163 056 012
          s   .  \n
```

请注意，换行符显示为 `\n`（八进制 `012`），而制表符显示为 `\t`（八进制 `011`）。

`od` 命令特别有用的用途之一是查看非文本文件以获取可以标识文件类型的信息。在这里，我们看到 `JFIF`（JPEG 文件交换格式）标签，该标签让 `file` 之类报告文件类型的命令将它标示为 jpg 文件。这里还有很多其他有用的信息，特别是如果你对这些文件的格式感到好奇的话。

在接下来的命令中，我们查看 jpg 文件的开始部分。

```
$ od -bc arrow.jpg | head -12
0000000 377 330 377 340 000 020 112 106 111 106 000 001 001 000 000 001
        377 330 377 340  \0 020   J   F   I   F  \0 001 001  \0  \0 001
0000020 000 001 000 000 377 333 000 103 000 003 002 002 002 002 002 003
         \0 001  \0  \0 377 333  \0   C  \0 003 002 002 002 002 002 003
0000040 002 002 002 003 003 003 003 004 006 004 004 004 004 004 010 006
        002 002 002 003 003 003 003 004 006 004 004 004 004 004  \b 006
0000060 006 005 006 011 010 012 012 011 010 011 011 012 014 017 014 012
        006 005 006  \t  \b  \n  \n  \t  \b  \t  \t  \n  \f 017  \f  \n
0000100 013 016 013 011 011 015 021 015 016 017 020 020 021 020 012 014
         \v 016  \v  \t  \t  \r 021  \r 016 017 020 020 021 020  \n  \f
0000120 022 023 022 020 023 017 020 020 020 377 333 000 103 001 003 003
        022 023 022 020 023 017 020 020 020 377 333  \0   C 001 003 003
```

如果我们要 `file` 命令提供有关此图像的信息，我们可能会看到类似下面这样的信息。`file` 命令从文件开头的数据中提取了所有这些描述性信息：

```
$ file arrow.jpg
arrow.png: JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 500x375, components 3
```

### 使用 jp2a 将文件视为基于文本的图像

如果你只能在命令行工作，并且想了解特定图像包含的内容，那么可以使用 `jp2a`（jpeg to ascii）之类的工具提供字符渲染。图像在这种格式下的识别程度取决于文件。不要有太多期待，因为你将看到的图像版本是“低分辨率”下的测试！这是一只分辨率很低的帝王企鹅。（请离远点看）

```
$ jp2a Emperor_Penguin.jpg
MMMMMMMMWOdkNMMMMMMMMMMMMMMMMMMM
MMMXK0kc.... ,OKMMMMMMMMMMMMMMMM
MMNK0Ol...   :Xx'dNMMMMMMMMMMMMM
MMMMMMMd;lx00Oo. ..xMMMMMMMMMMMM
MMMMMMK.OXMMMMMN,...lMMMMMMMMMMM
MMMMMMx'KXNNMMMMK....0MMMMMMMMMM
MMMMMMx:kkKNWWMMMl.. 'NMMMMMMMMM
MMMMMMddx0NNNWMMMK'...;NMMMMMMMM
MMMMMMck0NNWWWWWMMd  ..lMMMMMMMM
MMMMMM.d0KXNWWWWMMo  ...WMMMMMMM
MMMMMM.xOXNNWNMMMW. ....KMMMMMMM
MMMMMM'kKNKWXWMMMK  ..'.0MMMMMMM
MMMMMMxckXNNNNMMMX  .:..XMMMMMMM
MMMMMMW;xKNWWWMMMM. .;. NMMMMMMM
MMMMMMMok0NNWNWMMMx .l..MMMMMMMM
MMMMMMMkxOKXWXNMMMMl.:'dMMMMMMMM
MMMMMMM0dKOdKXXNMMMMNx,WMMMMMMMM
MMMMMMMWoKxldXKNNMMMMM;MMMMMMMMM
MMMMMMMMxxxxdNWNXNMMMM;MMMMMMMMM
MMMMMMMMxOcoo0XOOOOWMW,kMMMMMMMM
MMMMMMM0xK;.cO0dNX:0XXd;NMMMMMMM
MMMNkdd:,'ldXXO0xl;x0kx:;lKMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
```

### 总结

Linux 上有很多命令可以通过各种方式查看文件的内容。其中一些选项在你需要处理文件内容时可能会非常有用。其它的只是……有趣。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3561490/5-ways-to-examine-the-content-of-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/q65bNe9fW-w
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
