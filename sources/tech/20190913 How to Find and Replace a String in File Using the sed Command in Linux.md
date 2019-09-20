[#]: collector: (lujun9972)
[#]: translator: (asche910)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Find and Replace a String in File Using the sed Command in Linux)
[#]: via: (https://www.2daygeek.com/linux-sed-to-find-and-replace-string-in-files/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在Linux中使用sed命令如何查找和替换文件中的字符串
======


当你在使用文本文件时，很可能需要查找和替换文件中的字符串。

Sed命令主要用于替换一个文件中的文本。

在Linux中这可以通过使用sed命令和awk命令来完成。

在本教程中，我们将告诉你使用sed命令如何做到这一点，然后讨论讨论awk命令相关的。


### sed命令是什么 

sed命令表示Stream Editor（流编辑器），用来在Linux上执行基本的文本操作。 它可以执行各种功能，如搜索，查找，修改，插入或删除文件。

此外，它也可以执行复杂的正则表达式匹配。


它可用于以下目的：


* 查找和替换匹配给定的格式的内容。
* 在指定行查找和替换匹配给定的格式的内容。
* 在所有行查找和替换匹配给定的格式的内容。
* 搜索并同时替换两种不同的模式。

本文列出的十五个例子可以帮助你掌握sed命令。

如果要使用sed命令删除文件中的行，去下面的文章。

** `注意:`**由于这是一篇演示文章，我们使用不带`-i '选项的sed命令，该命令在Linux终端中删除行并打印文件内容。

但是，在实际环境中如果你想删除源文件中的行，使用带`-i`选项的sed命令。

常见的sed替换字符串的语法。

```
sed -i 's/Search_String/Replacement_String/g' Input_File
```

首先我们需要了解sed语法来做到这一点。 请参阅有关的细节。

  * `sed:` 这是一个Linux命令。
  * `-i:`   这是sed命令的一个选项，它有啥作用？ 默认情况下，sed打印结果到标准输出。 当您添加使用sed这个选项时，那么它会在适当的位置修改文件。 当您添加一个后缀（比如， -i.bak）时，原始文件的备份将就会被创建。
  * `s:` 字母s是一个替换命令。
  * `Search_String:`  搜索一个给定的字符串或正则表达式。
  * `Replacement_String:`  替换的字符串。
  * `g:`  全局替换标志。 默认情况下，sed命令替换每一行第一次出现的pattern模式，它不会替换行中的其他匹配结果。 但是，提供了该置换标志时，所有匹配都将被替换。
  * `/` 分界符。
  * `Input_File:` 要执行操作的文件名。

Let us look at some examples of commonly used with sed command to search and convert text in files.

We have created the below file for demonstration purposes.

让我们来看看文件中用sed命令来搜索和转换文本的一些常用例子。

我们已经创建了用于演示的以下文件。

```
# cat sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 1) 在一行中如何查找和替换Pattern模式的“第一次”匹配


下面的sed命令用**linux**替换文件中的**unix**。 这仅仅改变了每一行pattern模式的第一个实例。

```
# sed 's/unix/linux/' sed-test.txt

1 Unix linux unix 23
2 linux Linux 34
3 linuxlinux UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 2) 如何查找和替换每一行中“第N次”出现的模式

在行中使用/1,/2,../n标志来代替相应的匹配。

下面的sed命令在一行中用“linux”来替换“unix”模式的第二个实例。

```
# sed 's/unix/linux/2' sed-test.txt

1 Unix unix linux 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 3)  在一行中如何搜索和替换模式的所有实例

The below sed command replaces all instances of the “unix” format with “Linux” on the line because “g” means a global replacement.

下面的sed命令用“Linux”替换“unix”格式的所有实例，因为“G”是指一个全局的替换标志。

```
# sed 's/unix/linux/g' sed-test.txt

1 Unix linux linux 23
2 linux Linux 34
3 linuxlinux UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 4) 在一行的“第N个”匹配中如何查找和替换模式的所有实例
下面的sed命令在一行中且从模式的“第n个”实例中替换所有的模式。

```
# sed 's/unix/linux/2g' sed-test.txt

1 Unix unix linux 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 5) 在特定的行号搜索和替换模式

你可以替换特定行号中的字符串。 下面的sed命令用“linux”仅替换第三行的“unix”模式。

```
# sed '3 s/unix/linux/' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxlinux UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 6) 在特定范围行号间搜索和替换模式

You can specify the range of line numbers to replace the string.

The below sed command replaces the “Unix” pattern with “Linux” with lines 1 through 3.

您可以指定行号的范围，以替换字符串。

下面的sed命令在1到3行间用“Linux”替换“Unix”模式。

```
# sed '1,3 s/unix/linux/' sed-test.txt

1 Unix linux unix 23
2 linux Linux 34
3 linuxlinux UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 7) 如何查找和修改最后一行的模式

下面的sed命令允许您只在最后一行更换匹配的字符串。

下面的sed命令只在最后一行用“Unix”替换“Linux”模式。
```
# sed '$ s/Linux/Unix/' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Unix is free and opensource operating system
```

### 8) 在一行中如何只查找和替换正确的模式匹配
你可能已经注意到，子串“linuxunix”被替换为在第6例中的“linuxlinux”。 如果您只想更改正确的匹配词，用这个边界符“\b”上的搜索串的两端。
```
# sed '1,3 s/\bunix\b/linux/' sed-test.txt

1 Unix linux unix 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 9) 如何以不区分大小写来搜索与替换模式

大家都知道，Linux是区分大小写的。 为了与不区分大小写的模式匹配，使用I标志。
```
# sed 's/unix/linux/gI' sed-test.txt

1 linux linux linux 23
2 linux Linux 34
3 linuxlinux linuxLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 10) 如何查找和替换包含分隔符的字符串


当您搜索和替换含分隔符的字符串时，我们需要用反斜杠“\”来取消转义。

在这个例子中，我们将用“/usr/bin/fish”来替换“/bin/bash”。


```
# sed 's/\/bin\/bash/\/usr\/bin\/fish/g' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /usr/bin/fish CentOS Linux OS
Linux is free and opensource operating system
```

上述sed命令按预期工作，但它看起来来很糟糕。 为了简化，大部分的人会用竖线“|”。 所以，我建议你去用它。

```
# sed 's|/bin/bash|/usr/bin/fish/|g' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /usr/bin/fish/ CentOS Linux OS
Linux is free and opensource operating system
```

### 11) 如何以给定的模式来查找和替换数字

类似地，数字可以用模式来代替。 下面的sed命令替换所有数字以“[0-9]”，“number”的模式。

```
# sed 's/[0-9]/number/g' sed-test.txt

number Unix unix unix numbernumber
number linux Linux numbernumber
number linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 12) 如何用模式仅查找和替换两个数字
如果你想用模式来代替两位数字，使用下面的sed命令。

```
# sed 's/\b[0-9]\{2\}\b/number/g' sed-test.txt

1 Unix unix unix number
2 linux Linux number
3 linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```


### 13) 如何用sed命令仅打印被替换的行

如果你想显示仅更改的行，使用下面的sed命令。

* p - 它输出替换的行在终端上两次。
* n - 它抑制由“p”标志所产生的重复行。

```
# sed -n 's/Unix/Linux/p' sed-test.txt

1 Linux unix unix 23
3 linuxunix LinuxLinux
```

### 14) 如何同时运行多个sed命令

以下sed命令检测和同时置换两个不同的模式。

下面的sed命令搜索为“linuxunix”和“CentOS的”模式，用“LINUXUNIX”和“RHEL8”一次性更换他们。

```
# sed -e 's/linuxunix/LINUXUNIX/g' -e 's/CentOS/RHEL8/g' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 LINUXUNIX UnixLinux
linux /bin/bash RHEL8 Linux OS
Linux is free and opensource operating system
```

下面的sed命令搜索替换两个不同的模式，每次以一个字符串。

以下sed的命令搜索 为“linuxunix”和“CentOS的”模式，用“Fedora30”替换它们。
```
# sed -e 's/\(linuxunix\|CentOS\)/Fedora30/g' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 Fedora30 UnixLinux
linux /bin/bash Fedora30 Linux OS
Linux is free and opensource operating system
```

### 15) 如何查找和替换整个行，如果给定的模式匹配


如果模式匹配，可以使用sed命令用新行来代替整行。 这可以通过使用“C”标志来完成。

```
# sed '/OS/ c New Line' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxunix UnixLinux
New Line
Linux is free and opensource operating system
```

### 16) 如何搜索和替换相匹配的模式行

在一行中您可以为sed命令指定一种模式以适应。 在模式匹配的情况下，sed命令搜索要被替换的字符串。

下面的sed命令首先查找具有“OS”模式的行，然后用“ArchLinux”替换单词“Linux”。

```
# sed '/OS/ s/Linux/ArchLinux/' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /bin/bash CentOS ArchLinux OS
Linux is free and opensource operating system
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-sed-to-find-and-replace-string-in-files/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[Asche910](https://github.com/asche910)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
