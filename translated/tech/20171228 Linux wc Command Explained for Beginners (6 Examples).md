Linux wc 命令入门
======

有些时候，我们需要在命令行环境下获取一个文件的单词数量，字节数甚至行数。Linux 自带了一个命令行工具 **wc** 可以完成这些功能。下面举几个例子。

请注意，以下例子的运行环境是 Ubuntu 16.04。

### Linux wc 命令

wc 命令会打印文件的行数，单词数和字节数。以下是这个命令的使用方法：

wc [OPTION]... [FILE]...

wc 的 man 页面的描述：
```
Print newline, word, and byte counts for each FILE, and a total line if more than one FILE is
specified. A word is a non-zero-length sequence of characters delimited by white space. With no
FILE, or when FILE is -, read standard input.
```

下面举 6 个例子，看看 wc 命令的基本使用方法。

**注意**：例子中使用的 file.txt 是输入文件。这个文件的内容是：
```
hi
hello
how are you
thanks.
```

### Q1. 如何打印文件的字节数

使用 **-c** 参数打印字节数。

```
wc -c file.txt
```

这个命令会输出：

[![How to print the byte count][1]][2]

这个文件包含 29 个字节。

### Q2. 如何打印文件的字符数

使用 **-m** 参数打印字符数。

```
wc -m file.txt
```

这个命令会输出：

[![How to print the character count][3]][4]

这个文件包含 29 个字符。

### Q3. 如何打印文件的行数

使用 **-l** 参数打印字符数。

```
wc -l file.txt
```

这个命令会输出：

[![How to print the newline count][5]][6]

这个文件包含 4 行。

### Q4. 如何打印文件的单词数

使用 **-w** 参数打印单词数。

```
wc -w file.txt
```

这个命令会输出：

[![How to print the word count][7]][8]

所以，这个文件包含 6 个单词。

### Q5. 如何打印最长的行的的长度

使用 **-L** 参数打印打印最长的行的的长度。

```
wc -L file.txt
```

这个命令会输出：

[![How to print the maximum display width or length of longest line][9]][10]

所以，这个文件最长的行的长度是 11。

### Q6. 如何使用一个文件的内容作为命令的输入

如果你有一个存放多个文件名的文件，你可以使用 **\--files0-from** 参数从该文件一次读取所有文件。

```
wc --files0-from=names.txt
```

这个命令会输出：

[![How to read input file name\(s\) from a file][11]][12]

在这个例子中， wc 命令打印 file.txt 文件的行数，单词书和字符数。需要注意的是 names.txt 文件的每一行都要使用 NUL 字符作为结尾。你可以使用 Ctrl+v 然后 Ctrl+Shift+@ 输入 NUL 字符。

### 总结
wc 是一个简单易用的命令。上述几个例子简要地说明了这个命令的使用方法，方便我们在日常参考使用。更多 wc 的说明，请参考 [man page][13]。


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-wc-command-explained-for-beginners-6-examples/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/cyleung)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/wc-c-option.png
[2]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/wc-c-option.png
[3]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/wc-m-option.png
[4]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/wc-m-option.png
[5]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/wc-l-option.png
[6]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/wc-l-option.png
[7]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/wc-w-option.png
[8]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/wc-w-option.png
[9]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/wc-L-option.png
[10]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/wc-L-option.png
[11]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/wc-file0-from-option.png
[12]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/wc-file0-from-option.png
[13]:https://linux.die.net/man/1/wc
