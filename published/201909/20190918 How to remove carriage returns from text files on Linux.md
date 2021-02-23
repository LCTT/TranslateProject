[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11389-1.html)
[#]: subject: (How to remove carriage returns from text files on Linux)
[#]: via: (https://www.networkworld.com/article/3438857/how-to-remove-carriage-returns-from-text-files-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何在 Linux 中删除文本中的回车字符
======

> 当回车字符（`Ctrl+M`）让你紧张时，别担心。有几种简单的方法消除它们。

![](https://img.linux.net.cn/data/attachment/album/201909/25/214211xenk2dqfepx3xemm.jpg)

“回车”字符可以往回追溯很长一段时间 —— 早在打字机上就有一个机械装置或杠杆将承载纸滚筒的机架移到右边，以便可以重新在左侧输入字母。他们在 Windows 上的文本文件上保留了它，但从未在 Linux 系统上使用过。当你尝试在 Linux 上处理在 Windows 上创建的文件时，这种不兼容性有时会导致问题，但这是一个非常容易解决的问题。

如果你使用 `od`（<ruby>八进制转储<rt>octal dump</rt></ruby>）命令查看文件，那么回车（也用 `Ctrl+M` 代表）字符将显示为八进制的 15。字符 `CRLF` 通常用于表示 Windows 文本文件中的一行结束的回车符和换行符序列。那些注意看八进制转储的会看到 `\r\n`。相比之下，Linux 文本仅以换行符结束。

这有一个 `od` 输出的示例，高亮显示了行中的 `CRLF` 字符，以及它的八进制。

```
$ od -bc testfile.txt
0000000 124 150 151 163 040 151 163 040 141 040 164 145 163 164 040 146
          T   h   i   s       i   s       a       t   e   s   t       f
0000020 151 154 145 040 146 162 157 155 040 127 151 156 144 157 167 163
          i   l   e       f   r   o   m       W   i   n   d   o   w   s
0000040 056 015 012 111 164 047 163 040 144 151 146 146 145 162 145 156  <==
          .  \r  \n   I   t   '   s       d   i   f   f   e   r   e   n  <==
0000060 164 040 164 150 141 156 040 141 040 125 156 151 170 040 164 145
          t       t   h   a   n       a       U   n   i   x       t   e
0000100 170 164 040 146 151 154 145 015 012 167 157 165 154 144 040 142  <==
          x   t       f   i   l   e  \r  \n   w   o   u   l   d       b  <==
```

虽然这些字符不是大问题，但是当你想要以某种方式解析文本，并且不希望就它们是否存在进行编码时，这有时候会产生干扰。

### 3 种从文本中删除回车符的方法

幸运的是，有几种方法可以轻松删除回车符。这有三个选择：

#### dos2unix

你可能会在安装时遇到麻烦，但 `dos2unix` 可能是将 Windows 文本转换为 Unix/Linux 文本的最简单方法。一个命令带上一个参数就行了。不需要第二个文件名。该文件会被直接更改。

```
$ dos2unix testfile.txt
dos2unix: converting file testfile.txt to Unix format...
```

你应该会发现文件长度减少，具体取决于它包含的行数。包含 100 行的文件可能会缩小 99 个字符，因为只有最后一行不会以 `CRLF` 字符结尾。

之前：

```
-rw-rw-r--   1 shs  shs        121 Sep 14 19:11 testfile.txt
```

之后：

```
-rw-rw-r--   1 shs  shs        118 Sep 14 19:12 testfile.txt
```

如果你需要转换大量文件，不用每次修复一个。相反，将它们全部放在一个目录中并运行如下命令：

```
$ find . -type f -exec dos2unix {} \;
```

在此命令中，我们使用 `find` 查找常规文件，然后运行 `dos2unix` 命令一次转换一个。命令中的 `{}` 将被替换为文件名。运行时，你应该处于包含文件的目录中。此命令可能会损坏其他类型的文件，例如除了文本文件外在上下文中包含八进制 15 的文件（如，镜像文件中的字节）。

#### sed

你还可以使用流编辑器 `sed` 来删除回车符。但是，你必须提供第二个文件名。以下是例子：

```
$ sed -e “s/^M//” before.txt > after.txt
```

一件需要注意的重要的事情是，请不要输入你看到的字符。你必须按下 `Ctrl+V` 后跟 `Ctrl+M` 来输入 `^M`。`s` 是替换命令。斜杠将我们要查找的文本（`Ctrl + M`）和要替换的文本（这里为空）分开。

#### vi

你甚至可以使用 `vi` 删除回车符（`Ctrl+M`），但这里假设你没有打开数百个文件，或许也在做一些其他的修改。你可以键入 `:` 进入命令行，然后输入下面的字符串。与 `sed` 一样，命令中 `^M` 需要通过 `Ctrl+V` 输入 `^`，然后 `Ctrl+M` 插入 `M`。`%s` 是替换操作，斜杠再次将我们要删除的字符和我们想要替换它的文本（空）分开。 `g`（全局）意味在所有行上执行。

```
:%s/^M//g
```

### 总结

`dos2unix` 命令可能是最容易记住的，也是从文本中删除回车的最可靠的方法。其他选择使用起来有点困难，但它们提供相同的基本功能。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3438857/how-to-remove-carriage-returns-from-text-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/kmsiever/5895380540/in/photolist-9YXnf5-cNmpxq-2KEvib-rfecPZ-9snnkJ-2KAcDR-dTxzKW-6WdgaG-6H5i46-2KzTZX-7cnSw7-e3bUdi-a9meh9-Zm3pD-xiFhs-9Hz6YM-ar4DEx-4PXAhw-9wR4jC-cihLcs-asRFJc-9ueXvG-aoWwHq-atwL3T-ai89xS-dgnntH-5en8Te-dMUDd9-aSQVn-dyZqij-cg4SeS-abygkg-f2umXt-Xk129E-4YAeNn-abB6Hb-9313Wk-f9Tot-92Yfva-2KA7Sv-awSCtG-2KDPzb-eoPN6w-FE9oi-5VhaNf-eoQgx7-eoQogA-9ZWoYU-7dTGdG-5B1aSS
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
