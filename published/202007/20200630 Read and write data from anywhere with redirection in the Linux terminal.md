[#]: collector: (lujun9972)
[#]: translator: (nophDog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12385-1.html)
[#]: subject: (Read and write data from anywhere with redirection in the Linux terminal)
[#]: via: (https://opensource.com/article/20/6/redirection-bash)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

通过重定向在 Linux 终端任意读写数据
======

> 重定向是一种十分高效的数据流动方式，它能帮你减少很多鼠标和键盘上的操作。

![](https://img.linux.net.cn/data/attachment/album/202007/06/005419nh6mzxkmmmbsslbb.jpg)

对于任何编程或脚本语言，输入与输出重定向都是很自然的功能。严格来说，当你使用电脑时，数据自然而然地在发生着重定向。从 `stdin`（标准输入，通常是你的键盘或者鼠标）读取输入，输入则发往 `stdout`（标准输出，一段文本或者数据流），最后错误信息送至 `stderr`。如果你使用 [Bash][2] 或 [Zsh][3] 之类的 shell，那么理解这些数据流能够让你更好地控制信息流向。

标准输入、标准输出以及标准错误输出都存在于 Linux 文件系统中。你可以在 `/dev` 查看：

```
$ ls /dev/std*
/dev/stderr@  /dev/stdin@  /dev/stdout@
```

你可能没法直接使用它们，但将它们想象成你能传递数据的元位置，会很有帮助。

重定向的基础很简单：用一些 `>` 符号重定向输出，然后用另外一些 `<` 符号重定向输入。

### 重定向输出

将 [ls][4] 命令的输出写入一个文件：

```
$ ls > list.txt
```

你没法像平常那样看到 `ls` 的输出，因为它们并没有被发送到屏幕，而是被写入 `list.txt` 文件了，这个功能用处太多了，事实上，你甚至可以用它来将文件内容拷贝到另一个文件。不一定是文本文件，你也可以用将重定向用于二进制数据：

```
$ cat image.png > picture.png
```

（你可能会好奇为什么要这样做，有时候对于 [文件权限信息][5] 而间接有用。）

### 重定向输入

你也能将输入重定向“到”一个命令。可以说，它没有重定向输出那么有用，因为许多命令已经被硬编码，只从你的参数中接收输入。但是，如果某个命令需要一系列参数，而且你把这些参数写在文件里，想要快速“复制粘贴”到终端的时候（除非你并不想复制粘贴），它就帮得上忙了。

```
$ sudo dnf install $(<package.list)
```

重定向输入得常规用法是<ruby>嵌入文档<rt>here-document</rt></ruby>（简写成 here-doc）和<ruby>嵌入字符串<rt>here-string</rt></ruby> 技巧。这种输入方法将一整块文本重定向至标准输入流，直到碰见一个特殊的文件结束标记（许多人习惯用 `EOF`，实际上你可以使用任何字符串，只要它是唯一的）。试着把这些（在第二个 `EOF` 标记之前）敲进你的终端：

```
$ echo << EOF
> foo
> bar
> baz
> EOF
```

输出结果：

```
foo
bar
baz
```

使用 [Bash][2] 编写脚本的人常常用这个技巧，将数行文本一次性写入文件或者打印到屏幕上。只要你别忘了末尾的文件结束标记，这会是一个帮你避免大量繁琐 `echo` 或 `printf` 语句的好办法。

嵌入字符串类似于嵌入文档，但是它只含有一个字符串（或者用引号包裹的几个字符串，同样会被当成一个字符串）

```
$ cat <<< "foo bar baz"
foo bar baz
```

### 重定向错误信息

错误信息流叫做 `stderr`，通过 `2>` 实现这个目的。下面这个命令把错误信息定向到 `output.log` 文件：

```
$ ls /nope 2> output.log
```

### 将数据送往 /dev/null

既然标准输入、标准输出和错误输出都有自己的位置，那么“空空如也”也应该在 Linux 文件系统占有一席之地。没错，它叫做 `null`，位于 `/dev`，频繁使用的人懒得说 “slash dev slash null”，于是索性叫它 “devnull”。

通过重定向，你可以把数据发送到 `/dev/null`。比如，`find` 命令常常会输出很多具体信息，而且在搜索文件遇到权限冲突时，会事无巨细地报告：

```
$ find ~ -type f
/home/seth/actual.file
find: `/home/seth/foggy': Permission denied
find: `/home/seth/groggy': Permission denied
find: `/home/seth/soggy': Permission denied
/home/seth/zzz.file
```

`find` 命令把那些当作错误，所以你可以只把错误信息重定向至 `/dev/null`：


```
$ find ~ -type f 2>; /dev/null
/home/seth/actual.file
/home/seth/zzz.file
```

### 使用重定向

在 Bash 中，重定向是转移数据的有效方法。你可能不会频繁使用重定向，但是学会如何使用它，能帮你在打开文件、复制粘贴数据这类需要移动鼠标、大量按键操作上，节省很多不必要的时间。不要做如此浪费时间的事情。使用重定向，好好享受生活。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/redirection-bash

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[nophDog](https://github.com/nophDog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S (Hands programming)
[2]: https://opensource.com/resources/what-bash
[3]: https://opensource.com/article/19/9/getting-started-zsh
[4]: https://opensource.com/article/19/7/master-ls-command
[5]: https://opensource.com/article/19/8/linux-permissions-101
