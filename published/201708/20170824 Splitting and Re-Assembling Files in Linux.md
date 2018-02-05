在 Linux 中分割和重组文件
============================================================

![csplit](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/split-files.png?itok=kZTP_VF9 "csplit")

非常有用的 `csplit` 命令可以将单个文件分割成多个文件。Carla Schroder 解释说。

Linux 有几个用于分割文件的工具程序。那么你为什么要分割文件呢？一个用例是将大文件分割成更小的尺寸，以便它适用于比较小的存储介质，比如 U 盘。当您遇到 FAT32（最大文件大小为 4GB），且您的文件大于此时，通过 U 盘传输文件也是一个很好的技巧。另一个用例是加速网络文件传输，因为小文件的并行传输通常更快。

我们将学习如何使用 `csplit`，`split` 和 `cat` 来重新整理文件，然后再将文件合并在一起。这些操作在任何文件类型下都有用：文本、图片、音频文件、ISO 镜像文件等。

### 使用 csplit 分割文件

`csplit` 是这些有趣的小命令中的一个，它永远伴你左右，一旦开始用它就离不开了。`csplit` 将单个文件分割成多个文件。这个示例演示了最简单的使用方法，它将文件 foo.txt 分为三个文件，以行号 17 和 33 作为分割点：

```
$ csplit foo.txt 17 33
2591
3889
2359
```

`csplit` 在当前目录下创建了三个新文件，并以字节为单位打印出新文件的大小。默认情况下，每个新文件名为 `xx_nn`：

```
$ ls
xx00
xx01
xx02
```

您可以使用 `head` 命令查看每个新文件的前十行：

```
$ head xx*

==> xx00 <==
Foo File
by Carla Schroder

Foo text

Foo subheading

More foo text

==> xx01 <==
Foo text

Foo subheading

More foo text

==> xx02 <==
Foo text

Foo subheading

More foo text
```

如果要将文件分割成包含相同行数的多个文件怎么办？可以指定行数，然后将重复次数放在在花括号中。此示例重复分割 4 次，并将剩下的转储到最后一个文件中：

```
$ csplit foo.txt 5 {4}
57
1488
249
1866
3798
```

您可以使用星号通配符来告诉 `csplit` 尽可能多地重复分割。这听起来很酷，但是如果文件不能等分，则可能会失败（LCTT 译注：低版本的 `csplit` 不支持此参数）：

```
$ csplit foo.txt 10 {*}
1545
2115
1848
1901
csplit: '10': line number out of range on repetition 4
1430
```

默认的行为是删除发生错误时的输出文件。你可以用 `-k` 选项来解决这个问题，当有错误时，它就不会删除输出文件。另一个行为是每次运行 `csplit` 时，它将覆盖之前创建的文件，所以你需要使用新的文件名来分别保存它们。使用 `--prefix= _prefix_` 来设置一个不同的文件前缀：

```
$ csplit -k --prefix=mine foo.txt 5 {*}  
57
1488
249
1866
993
csplit: '5': line number out of range on repetition 9
437

$ ls
mine00
mine01
mine02
mine03 
mine04
mine05
```

选项 `-n` 可用于改变对文件进行编号的数字位数（默认是 2 位）：

```
$ csplit -n 3 --prefix=mine foo.txt 5 {4}
57
1488
249
1866
1381
3798

$ ls
mine000
mine001
mine002
mine003
mine004
mine005
```

`csplit` 中的 “c” 是上下文（context）的意思。这意味着你可以根据任意匹配的方式或者巧妙的正则表达式来分割文件。下面的例子将文件分为两部分。第一个文件在包含第一次出现 “fie” 的前一行处结束，第二个文件则以包含 “fie” 的行开头。

```
$ csplit foo.txt /fie/ 
```

在每次出现 “fie” 时分割文件：

```
$ csplit foo.txt /fie/ {*}
```

在 “fie” 前五次出现的地方分割文件：

```
$ csplit foo.txt /fie/ {5}
```

仅当内容以包含 “fie” 的行开始时才复制，并且省略前面的所有内容：

```
$ csplit myfile %fie% 
```

### 将文件分割成不同大小

`split` 与 `csplit` 类似。它将文件分割成特定的大小，当您将大文件分割成小的多媒体文件或者使用网络传送时，这就非常棒了。默认的大小为 1000 行：

```
$ split foo.mv
$ ls -hl
266K Aug 21 16:58 xaa
267K Aug 21 16:58 xab
315K Aug 21 16:58 xac
[...]
```

它们分割出来的大小相似，但你可以指定任何你想要的大小。这个例子中是 20M 字节：

```
$ split -b 20M foo.mv
```

尺寸单位缩写为 K，M，G，T，P，E，Z，Y（1024 的幂）或者 KB，MB，GB 等等（1000 的幂）。

为文件名选择你自己的前缀和后缀：

```
$ split -a 3 --numeric-suffixes=9 --additional-suffix=mine foo.mv SB
240K Aug 21 17:44 SB009mine
214K Aug 21 17:44 SB010mine
220K Aug 21 17:44 SB011mine
```

`-a` 选项控制编号的数字位置。`--numeric-suffixes` 设置编号的开始值。默认前缀为 `x`，你也可以通过在文件名后输入它来设置一个不同的前缀。

### 将分割后的文件合并

你可能想在某个时候重组你的文件。常用的 `cat` 命令就用在这里：

```
$ cat SB0* > foo2.txt
```

示例中的星号通配符将匹配到所有以 SB0 开头的文件，这可能不会得到您想要的结果。您可以使用问号通配符进行更精确的匹配，每个字符使用一个问号：

```
$ cat SB0?????? > foo2.txt
```

和往常一样，请查阅相关的手册和信息页面以获取完整的命令选项。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/8/splitting-and-re-assembling-files-linux

作者：[CARLA SCHRODER][a]
译者：[firmianay](https://github.com/firmianay)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-attribution
[2]:https://www.linux.com/files/images/split-filespng
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
