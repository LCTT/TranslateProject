Fold命令入门级示例教程
======

![](https://www.ostechnix.com/wp-content/uploads/2018/01/Fold-Command-2-720x340.png)

你有没有发现自己在某种情况下想要折叠或打破命令的输出用于适应特定的宽度？ 在运行虚拟机的时候，我遇到了几次这种的情况，特别是没有GUI的服务器。 以防万一，如果你想限制一个命令的输出为一个特定的宽度，现在看看这里！ **fold**命令在这里就能派的上用场了！ fold命令以适合指定的宽度调整输入文件中的每一行并将其打印到标准输出。

在这个简短的教程中，我们将看到fold命令的用法，带有实例哦。

### fold命令示例教程

fold命令是GNU coreutils包的一部分，所以我们不用为安装的事情烦恼。

fold命令的典型语法：
```
fold [OPTION]... [FILE]...
```

请允许我向您展示一些示例，以便您更好地了解fold命令。 我有一个名为linux.txt文件，内容是随机的。

Allow me to show you some examples, so you can get a better idea about fold command. I have a file named **linux.txt** with some random lines.

![][2]

要将上述文件中的每一行换行为默认宽度，请运行：

```
fold linux.txt
```

每行**80**列是默认的宽度。 这里是上述命令的输出：

![][3]

正如你在上面的输出中看到的，fold命令已经将输出限制为80个字符的宽度。

当然，我们可以指定您的首选宽度，例如50，如下所示：

```
fold -w50 linux.txt
```

Sample output would be:

![][4]

我们也可以将输出写入一个新的文件，如下所示：

```
fold -w50 linux.txt > linux1.txt
```

以上命令将把**linux.txt**的行宽度改为50个字符，并将输出写入到名为**linux1.txt**的新文件中。

让我们检查一下新文件的内容：

```
cat linux1.txt
```

![][5]

你有没有注意到前面的命令的输出？ 有些词在行之间被打破。 为了解决这个问题，我们可以使用-s标志来在空格处换行。

以下命令将给定文件中的每行调整为宽度“50”，并在空格处换到新行：

```
fold -w50 -s linux.txt
```

示例输出：

![][6]

看清楚了吗？ 现在，输出很清楚。 换到新行中的单词都是用空格隔开的，所在行单词的长度大于50的时候就会被调整到下一行。

在所有上面的例子中，我们用列来限制输出宽度。 但是，我们可以使用**-b**选项将输出的宽度强制为指定的字节数。 以下命令以20个字节中断输出。

```
fold -b20 linux.txt
```

Sample output:

![][7]

**另请阅读：**

+ [Unix命令入门级示例教程][8]

有关更多详细信息，请参阅man手册页。
```
man fold
```

而且，这些就是所有的内容了。 您现在知道如何使用fold命令以适应特定的宽度来限制命令的输出。 我希望这是有用的。 我们将每天发布更多有用的指南。 敬请关注！

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/fold-command-tutorial-examples-beginners/

作者：[SK][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/01/fold-command-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/01/fold-command-2.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/01/fold-command-3-1.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/01/fold-command-4.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/01/fold-command-5-1.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/01/fold-command-6-1.png
[8]:https://www.ostechnix.com/uniq-command-tutorial-examples-beginners/
