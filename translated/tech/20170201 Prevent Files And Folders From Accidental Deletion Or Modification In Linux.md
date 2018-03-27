
Linux系统中防止文件和目录被意外的删除或修改
======

![](https://www.ostechnix.com/wp-content/uploads/2017/02/Prevent-Files-And-Folders-From-Accidental-Deletion-Or-Modification-In-Linux-720x340.jpg)

有时，我会不小心的按下`SHIFT+DELETE`来删除我的文件数据。是的，我是个笨蛋，不会再次确认下我实际准备要删除的东西。而且我太笨或者说太懒，没有备份我的文件数据。结果呢？数据丢失了！在一瞬间就丢失了。

这种事时不时就会发生在我身上。如果你和我一样，有个好消息告诉你。有个简单又有用的命令行工具叫**“chattr”**（**Ch** ange **Attr** ibute的缩写 ），在类Unix等发行版中，能够用来防止文件和目录被意外的删除或修改。

通过给文件或目录添加或删除某些属性，来保证用户不能删除或修改这些文件和目录，不管是有意的还是无意的，甚至root用户也不行。听起来很有用，是不是？


在这篇简短的教程中，我们一起来看看怎么在实际应用中使用chattr命令，来防止文件和目录被意外删除。


### Linux中防止文件和目录被意外删除和修改

默认，Chattr命令在大多数现代Linux操作系统中是可用的。

默认语法是：

```
chattr [operator] [switch] [file]

```


chattr 具有如下操作符：
    

  * 操作符**‘+’**追加指定属性到文件已存在属性中
  * 操作符**‘-‘**删除指定属性
  * 操作符**‘=’**直接设置文件属性为指定属性

Chattr 提供不同的属性，也就是-**aAcCdDeijsStTu**。每个字符代表一个特定文件属性。
  * **a** – 只能向文件中添加数据，而不能删除（appened only）,
  * **A** – 不更新文件或目录的最后存取时间（no atime updates）,
  * **c** – 将文件或目录压缩后存放（compressed）,
  * **C** – 不适用写入时复制机制（no copy on write）,
  * **d** – 设定文件不能成为dump程序的备份目标（no dump）,
  * **D** – 同步目录更新(synchronous directory updates),
  * **e** – extend格式存储(extent format),
  * **i** – 文件或目录不可改变（immutable）,
  * **j** – 设定此参数使得当通过mount参数：data=ordered 或者 data=writeback挂载的文件系统,文件在写入时会先被记录在journal中。(data journalling),
  * **P** – project层次结构(project hierarchy),
  * **s** – 保密性删除文件或目录（secure deletion）,
  * **S** – 即时更新文件或目录（synchronous updates）,
  * **t** – 不进行尾部合并(no tail-merging),
  * **T** – 顶层目录层次结构(top of directory hierarchy）,
  * **u** – 不可删除（undeletable）.

在本教程中，我们将讨论两个属性的使用，即**a** , **i** ，这个两个属性可以用于防止文件和目录的被删除。这是我们今天的主题，对吧？来开始吧！

### 防止文件被意外删除和修改

我先在我的当前目录创建一个**file.txt**文件。
```
$ touch file.txt

```
现在，我将给文件应用**“i”**属性，让文件不可改变。就是说你不能删除或修改这个文件，就算你是文件的拥有者和root用户也不行。
```
$ sudo chattr +i file.txt
```

使用`lsattr`命令检查文件已有属性
```
$ lsattr file.txt
```

**输出:**
```
----i---------e---- file.txt
```

现在，试着用普通用户去删除文件
```
$ rm file.txt

```

**输出:**
```
#不能删除文件，非法操作
rm: cannot remove 'file.txt': Operation not permitted
```

我来试试sudo特权：
```
$ sudo rm file.txt
```

**输出:**
```
#不能删除文件，非法操作
rm: cannot remove 'file.txt': Operation not permitted
```

我们试试追加写内容到这个文本文件
```
$ echo 'Hello World!' >> file.txt

```

**输出:**
```
#非法操作
bash: file.txt: Operation not permitted
```

试试 **sudo** 特权:
```
$ sudo echo 'Hello World!' >> file.txt

```

**输出:**
```
#非法操作
bash: file.txt: Operation not permitted

```
你应该注意到了，我们不能删除或修改这个文件，甚至root用户或者文件所有者也不行。

要撤销属性，使用**“-i”**即可。
```
$ sudo chattr -i file.txt

```

现在，这不可改变属性已经被删除掉了。你现在可以删除或修改这个文件了。
```
$ rm file.txt

```

类似的，你能够限制目录被意外删除或修改，如下一节所述。

### 防止目录被意外删除和修改

创建一个dir1目录，放入文件file.txt。
```
$ mkdir dir1 && touch dir1/file.txt

```

现在，让目录及其内容（file.txt文件）不可改变：
```
$ sudo chattr -R +i dir1

```

命令中,

  * **-R** – 递归使dir目录及其内容不可修改
  * **+i** – 使目录不可修改



现在，来试试删除这个目录，要么用普通用户，要么用sudo特权。
```
$ rm -fr dir1

$ sudo rm -fr dir1

```

你会看到如下输出:
```
#不可删除'dir1/file.txt'：非法操作
rm: cannot remove 'dir1/file.txt': Operation not permitted

```
尝试用“echo”命令追加内容到文件，你成功了吗？当然，你做不到。
撤销此属性，输入：
```
$ sudo chattr -R -i dir1

```

现在你就能想平常一样删除或修改这个目录内容了。

### 防止文件和目录被意外删除，但允许追加操作

我们现已知道如何防止文件和目录被意外删除和修改了。接下来，我们将防止文件被删除但仅仅允许文件被追加内容。意思是你不可以编辑修改文件已存在的数据，或者重命名这个文件或者删除这个文件，你仅可以使用追加模式打开这个文件。


为了设置追加属性到文件或目录，我们像下面这么操作：
**针对文件:**
```
$ sudo chattr +a file.txt

```

**针对目录: **
```
$ sudo chattr -R +a dir1

```

一个文件或目录被设置了‘a’这个属性就仅仅能够被追加模式打开进行写入。
添加些内容到这个文件以测试是否有效果。
```
$ echo 'Hello World!' >> file.txt

$ echo 'Hello World!' >> dir1/file.txt

```


查看文件内容使用cat命令
```
$ cat file.txt

$ cat dir1/file.txt

```

**输出:**
```
Hello World!

```


你将看到你现在可以追加内容。就表示我们可以修改这个文件或目录。

现在让我们试试删除这个文件或目录。
```
$ rm file.txt

```

**输出:**
```
#不能删除文件'file.txt'：非法操作
rm: cannot remove 'file.txt': Operation not permitted

```


让我们试试删除这个目录：
```
$ rm -fr dir1/

```

**输出:**
```
#不能删除文件'dir1/file.txt'：非法操作
rm: cannot remove 'dir1/file.txt': Operation not permitted

```


删除这个属性，执行下面这个命令：
**针对文件:**
```
$ sudo chattr -R -a file.txt

```

**针对目录:**
```
$ sudo chattr -R -a dir1/

```


现在，你可以想平常一样删除或修改这个文件和目录了。

更多详情，查看man页面。
```
man chattr

```

### 总结


保护数据是系统管理人员的主要工作之一。市场上有众多可用的免费和收费的数据保护软件。幸好，我们已经拥有这个内置命令可以帮助我们去保护数据被意外的删除和修改。在你的Linux系统中，Chattr可作为保护重要系统文件和数据的附加工具。

然后，这就是今天所有内容了。希望对大家有所帮助。接下来我将会在这提供其他有用的文章。在那之前，敬请期待OSTechNix。
再见！




--------------------------------------------------------------------------------

来源: https://www.ostechnix.com/prevent-files-folders-accidental-deletion-modification-linux/

作者：[SK][a]
译者：[yizhuoyan](https://github.com/yizhuoyan)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
