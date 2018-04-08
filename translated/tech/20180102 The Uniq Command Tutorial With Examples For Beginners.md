为初学者提供的 Uniq 命令教程及示例
=====

如果你主要是在命令行上工作，并且每天处理大量的文本文件，那么你应该了解下 **Uniq** 命令。该命令会帮助你轻松地从文件中找到重复的行。它不仅用于查找重复项，而且我们还可以使用它来删除重复项，显示重复项的出现次数，只显示重复的行，只显示唯一的行等。由于 uniq 命令是 GNU coreutils 包的一部分，所以它预装在大多数 Linux 发行版中，让我们不需要费心安装。来看一些实际的例子。

请注意，除非重复行是相邻的，否则 'uniq' 不会删除它们。因此，你可能需要先对它们进行排序，或将排序命令与 uniq 组合以获得结果。让我给你看一些例子。

首先，让我们创建一个带有一些重复行的文件：
```
vi ostechnix.txt
```
```
welcome to ostechnix
welcome to ostechnix
Linus is the creator of Linux.
Linux is secure by default
Linus is the creator of Linux.
Top 500 super computers are powered by Linux
```

正如你在上面的文件中看到的，我们有一些重复的行（第一行和第二行，第三行和第五行是重复的）。

### **1\. 使用 Uniq 命令删除文件中的连续重复行**

如果你在不使用任何参数的情况下使用 'uniq' 命令，它将删除所有连续的重复行，只显示唯一的行。
```
uniq ostechnix.txt
```

示例输出：

![][2]

如你所见， uniq 命令删除了给定文件中的所有连续重复行。你可能还注意到，上面的输出仍然有第二行和第四行重复了。这是因为 uniq 命令只有在相邻的情况下才会删除重复的行，当然，我们也可以删除非连续的重复行。请看下面的第二个例子。

### **2\. 删除所有重复的行**
```
sort ostechnix.txt | uniq
```

示例输出：

![][3]

看到了吗？没有重复的行。换句话说，上面的命令将显示在 ostechnix.txt 中只出现一次的行。我们使用 sort 命令与 uniq 命令结合，因为，就像我提到的，除非重复行是相邻的，否则 uniq 不会删除它们。

### **3\. 只显示文件中唯一的一行**

为了只显示文件中唯一的一行，可以这样做：
```
sort ostechnix.txt | uniq -u
```

示例输出：
```
Linux is secure by default
Top 500 super computers are powered by Linux
```

如你所见，在给定的文件中只有两行是唯一的。

### **4\. 只显示重复的行**

同样的，我们也可以显示文件中重复的行就像下面这样：
```
sort ostechnix.txt | uniq -d
```

示例输出：
```
Linus is the creator of Linux.
welcome to ostechnix
```

这两行在 ostechnix.txt 文件中是重复的行。请注意 -d(小写 d) 将会**只打印重复的行**，**每组有一个**。打印**所有重复的行**，使用 -D(大写 D)，如下所示：
```
sort ostechnix.txt | uniq -D
```

在下面的截图中看两个选项的区别：

![][4]

### **5\. 显示文件中每一行的出现次数**

由于某种原因，你可能想要检查给定文件中每一行重复出现的次数。要做到这一点，使用 **-c** 选项，如下所示：
```
sort ostechnix.txt | uniq -c
```

**示例输出：**
```
 2 Linus is the creator of Linux.
 1 Linux is secure by default
 1 Top 500 super computers are powered by Linux
 2 welcome to ostechnix
```

我们还可以按照每一行的出现次数进行排序，然后显示，如下所示：
```
sort ostechnix.txt | uniq -c | sort -nr
```

示例输出：
```
 2 welcome to ostechnix
 2 Linus is the creator of Linux.
 1 Top 500 super computers are powered by Linux
 1 Linux is secure by default
```

### 6\. 将比较限制为 'N' 个字符

我们可以使用 -w 选项来限制对文件中特定数量字符的比较。例如，让我们比较文件中的前四个字符，并显示重复行，如下所示：
```
uniq -d -w 4 ostechnix.txt
```

### 7\. 忽略比较指定的 'N' 个字符

像对文件中行的 N 个字符进行限制比较一样，我们也可以使用 -s 选项来忽略比较前 N 个字符。

下面的命令将忽略在文件中每行的前四个字符进行比较：
```
uniq -d -s 4 ostechnix.txt
```

为了忽略比较前 N 字段（译者注：即前几列）而不是字符，在上面的命令中使用 '-f' 选项。

欲了解更多详情，请参考帮助部分：
```
uniq --help
```

也可以使用 man 命令查看：
```
man uniq
```

今天就到这里！我希望你现在对 uniq 命令及其目的有一个基本的了解。如果你发现我们的指南有用，请在你的社交网络上分享，并继续支持 OSTechNix。更多好东西要来了，请继续关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/uniq-command-tutorial-examples-beginners/

作者：[][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/01/uniq-2.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/01/uniq-1-1.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/01/uniq-4.png
