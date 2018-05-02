给初学者看的 Shuf 命令教程
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/shuf-command-720x340.png)
Shuf 命令用于在类 Unix 操作系统中生成随机排列。使用 shuf 命令，我们可以随机打乱给定输入文件的行。Shuf 命令是 GNU Coreutils 的一部分，因此你不必担心安装问题。在这个简短的教程中，让我向你展示一些 shuf 命令的例子。

### 带例子的 Shuf 命令教程

我有一个名为 **ostechnix.txt** 的文件，内容如下。
```
$ cat ostechnix.txt
line1
line2
line3
line4
line5
line6
line7
line8
line9
line10

```

现在让我们以随机顺序显示上面的行。为此，请运行：
```
$ shuf ostechnix.txt
line2
line8
line5
line10
line7
line1
line4
line6
line9
line3

```

看到了吗？上面的命令将名为 “ostechnix.txt” 中的行随机排列并输出了结果。

你可能想将输出写入另一个文件。例如，我想将输出保存到  **output.txt** 中。为此，请先创建 output.txt：
```
$ touch output.txt

```

然后，像下面使用 **-o** 标志将输出写入该文件。
```
$ shuf ostechnix.txt -o output.txt

```

上面的命令将随机随机打乱 ostechnix.txt 的内容并将输出写入 output.txt。你可以使用命令查看 output.txt 的内容：
```
$ cat output.txt

line2
line8
line9
line10
line1
line3
line7
line6
line4
line5

```

我只想显示文件中的任意一行。我该怎么做？很简单！
```
$ shuf -n 1 ostechnix.txt
line6

```

同样，我们可以选择前 “n” 个随机条目。以下命令将只显示前五个随机条目。
```
$ shuf -n 5 ostechnix.txt
line10
line4
line5
line9
line3

```

如下所示，我们可以直接使用 **-e** 标志传入输入，而不是从文件中读取行。
```
$ shuf -e line1 line2 line3 line4 line5
line1
line3
line5
line4
line2

```

你也可以传入数字：
```
$ shuf -e 1 2 3 4 5
3
5
1
4
2

```

要快速在给定范围选择一个，请改用此命令。
```
$ shuf -n 1 -e 1 2 3 4 5

```

或者，选择下面的任意三个随机数字。
```
$ shuf -n 3 -e 1 2 3 4 5
3
5
1

```

我们也可以在特定范围内生成随机数。例如，要显示 1 到 10 之间的随机数，只需使用：
```
$ shuf -i 1-10
1
9
8
2
4
7
6
3
10
5

```

有关更多详细信息，请参阅手册页。
```
$ man shuf

```

今天就是这些。还有更多更好的东西。敬请关注！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-shuf-command-tutorial-with-examples-for-beginners/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
