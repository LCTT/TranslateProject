[#]: subject: "Reading and writing files with Python"
[#]: via: "https://opensource.com/article/21/7/read-write-files-python"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "turbokernel"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13649-1.html"

使用 Python 读写文件
======

> 每种编程语言处理文件数据的方式不尽相同，Python 是这么干的。

![](https://img.linux.net.cn/data/attachment/album/202108/05/094700u9kj42rn4jh5h4hr.jpg)

有些数据是临时的，它们在应用程序运行时存储在内存中，然后丢弃。但是有些数据是持久的。它们存储在硬盘驱动器上供以后使用，而且它们通常是用户最关心的东西。对于程序员来说，编写代码读写文件是很常见的，但每种语言处理该任务的方式都不同。本文演示了如何使用 Python 处理文件数据。

### 安装 Python

在 Linux 上，你可能已经安装了 Python。如果没有，你可以通过发行版软件仓库安装它。例如，在 CentOS 或 RHEL 上：

```
$ sudo dnf install python3
```

在 macOS 上，你可以使用 [MacPorts][2] 或 [Homebrew][3] 安装。在 Windows 上，你可以使用 [Chocolatey][4] 安装。

一旦安装了 Python，打开你最喜欢的文本编辑器，准备好写代码吧。

### 使用 Python 向文件中写入数据

如果你需要向一个文件中写入数据，记住有三个步骤：

  1. 打开
  2. 写入
  3. 关闭

这与你在计算机上编码、编辑照片或执行其他操作时使用的步骤完全相同。首先，打开要编辑的文档，然后进行编辑，最后关闭文档。

在 Python 中，过程是这样的：

```
f = open('example.txt', 'w')
f.write('hello world')
f.close()
```

这个例子中，第一行以**写**模式打开了一个文件，然后用变量 `f` 表示，我使用了 `f` 是因为它在 Python 代码中很常见，使用其他任意有效变量名也能正常工作。

在打开文件时，有不同的模式：

  * `w` 代表写入
  * `r+` 代表可读可写
  * `a` 表示追加

第二行表示向文件中写入数据，本例写入的是纯文本，但你可以写入任意类型的数据。

最后一行关闭了文件。

#### 使用 `with` 语法写入数据

对于快速的文件交互，常用有一种简短的方法可以写入数据。它不会使文件保持打开状态，所以你不必记得调用 `close()` 函数。相反，它使用 `with` 语法：

```
with open('example.txt', 'a') as f:
    f.write('hello open source')
```

### 使用 Python 读取数据

如果你或你的用户需要通过应用程序需要向文件中写入一些数据，然后你需要使用它们，那么你就需要读取文件了。与写入类似，逻辑一样：

  1. 打开
  2. 读取
  3. 关闭

同样的，这个逻辑反映了你一开始使用计算机就已知的内容。阅读文档，你可以打开、阅读，然后关闭。在计算机术语中，“打开”文件意味着将其加载到内存中。

实际上，一个文本文件内容肯定不止一行。例如，你需要读取一个配置文件、游戏存档或乐队下一首歌曲的歌词，正如你打开一本实体书时，你不可能立刻读完整本书，代码也只能解析已经加载到内存中的文件。因此，你可能需要遍历文件的内容。

```
f = open('example.tmp', 'r')

for line in f:
    print(line)

f.close()
```

示例的第一行指明使用 **读** 模式打开一个文件，然后文件交由变量 `f` 表示，但就像你写数据一样，变量名是任意的。`f` 并没有什么特殊的，它只是单词 “file” 的最简表示，所以 Python 程序员会经常使用它。

在第二行，我们使用了 `line`，另一个任意变量名，用来表示 `f` 的每一行。这告诉 Python 逐行迭代文件的内容，并将每一行的内容打印到输出中（在本例中为终端或 [IDLE][5]）。

#### 使用 `with` 语法读取数据

就像写入一样，使用 `with` 语法是一种更简短的方法读取数据。即不需要调用 `close()` 方法，方便地快速交互。

```
with open('example.txt', 'r') as f:
    for line in f:
        print(line)
```

### 文件和 Python

使用 Python 有很多方法向文件写入数据，包括用 [JSON、YAML、TOML][6] 等不同的格式写入。还有一个非常好的内置方法用于创建和维护 [SQLite][7] 数据库，以及许多库来处理不同的文件格式，包括 [图像][8]、音频和视频等。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/read-write-files-python

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd "Hands on a keyboard with a Python book "
[2]: https://opensource.com/article/20/11/macports
[3]: https://opensource.com/article/20/6/homebrew-mac
[4]: https://opensource.com/article/20/3/chocolatey
[5]: https://opensource.com/article/17/10/python-101#idle
[6]: https://opensource.com/article/21/6/parse-configuration-files-python
[7]: https://opensource.com/article/21/2/sqlite3-cheat-sheet
[8]: https://opensource.com/article/19/3/python-image-manipulation-tools
