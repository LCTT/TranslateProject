[#]: collector: (lujun9972)
[#]: translator: (lkxed)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Power up your Linux terminal text editor with ed)
[#]: via: (https://opensource.com/article/20/12/gnu-ed)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 ed 来启动你的 Linux 终端文本编辑器
======
这个看似简单的编辑器为用户提供了许多易于学习和使用的命令。
![Terminal command prompt on orange background][1]

GNU `ed` 命令是一个行编辑器。它被认为是标准的 Unix 文本编辑器，因为它是首个出现在 Unix 的文本编辑器，并且它曾经无处不在，你在任何一个 POSIX 系统中都能找到它（通常来说，你现在也可以）。在某种程度上，你可以很容易看出来它是第一个文本编辑器，因为它在许多方面的功能都十分基础。和其他大多数的文本编辑器不同，它不会打开一个属于自己的窗口或显示区域，事实上，在默认情况下，它甚至不会提示用户输入文字。从另一个方面来说，它在交互功能上的缺失也可以成为一个优点。它是一个多功能的编辑器，你可以用简短的命令控制它，无论是在交互式的命令行中，还是在编写的 shell 脚本里。

### 安装 ed

如果你正在使用 Linux 或者 BSD 的话，你很可能已经默认安装了 `ed`（在 Linux 上是 GNU 的 `ed`，而在 BSD 上是 BSD 的 `ed`）。但是，一些极简的环境可能没有包括 `ed`，这也没关系，你的发行版的软件仓库中很可能有 `ed` 可供下载。macOS 默认安装了 BSD 的 `ed`。

### 启动 ed

当你启动 `ed` 的时候，你的终端提示符不见了，看起来好像是 `ed` 停止运行了。其实它没有，它只是在等待你输入指令而已。


```
$ ed
```

为使 `ed` 显示更详细的信息，你可以输入命令 `p` 让它返回一个提示符：


```
$ ed
p
?
```

这个问号（`?`）是默认的 `ed` 提示符。

### 缓冲区

当 `ed` 激活时，你其实是在和一个叫 _<ruby>缓冲区<rt>buffer</rt></ruby>_ 的东西打交道。缓冲区是内存中的一块区域。你并不会直接编辑文件，而是在编辑它对应的缓冲区。当你退出 `ed` 却没有把修改保存到磁盘的文件上时，所有的修改都会丢失，因为它们只在缓冲区里存在。（这听起来可能很耳熟，如果你是一个习惯了<ruby>初始抓取缓冲区<rt>initial scratch buffer</rt></ruby>的有经验的 Emacs 用户的话。）

### 使用 `ed` 输入文本

启动 `ed` 后，你处于命令模式。这意味着你可以向编辑器发送指令，比如让它显示一个提示符，而不是空白区域。你可以使用 `a` 命令开始附加文本到当前的缓冲区，使用一个实心的点 `.` 来终止输入。比如，下面的这个例子往缓冲区里附加了两行文字（“hello world” 和 “hello ed”）：


```
?
a
hello world
hello ed
.
```

使用点 `.` 终止输入后，你将回到命令模式。

### 查看缓冲区

怎样查看当前缓冲区里都有什么呢？你可以输入想要查看的行号，也可以使用 `,p` 命令来显示所有的行：


```
?
1
hello world
2
hello ed
,p
hello world
hello ed
```

### 写入文件

如果你现在对文本很满意，你可以使用 `w` 命令把缓冲区写入到文件中，后面跟上目标文件名：


```
?
w example.txt
19
```

写操作后显示的那个数字代表着写入到文件中的字符数。

### 读取文件

除了使用 `ed` 来读取文本，你也可以使用 `r` 命令把一个已经存在的文件加载到到缓冲区里：


```
?
r myfile.txt
```

另外，你也可以在启动 `ed` 时，在它后面加上你想要加载到缓冲区里的文件名：


```
$ ed myfile.txt
```

### 编辑缓冲区

鉴于 `ed` 是一个文本编辑器，你当然可以使用一种特殊的语法来编辑缓冲区里的文本。使用 `sed` 或 `vim` 的用户或许会觉得这个语法很熟悉。假设现在缓冲区里已经加载了一个文件：


```
$ ed myfile.txt
,p
This is an example document.
There is some text, but not much.
There is some errors, but not much.
```

如果你要把第一句话中的 `document` 修改为 `file`，你可以先选择目标行（1），然后使用 `s` 命令调用搜索函数，后面跟着搜索文本和替换文本：


```
?
1
This is an example document.
s/document/file/
1
This is an example file.
```

如果你要编辑其他行，步骤也是一样的，只需提供一个不同的行号即可：


```
?
3
There is some errors, but not much.
s/is/are/
s/much/many/
```

你可以使用 `,p` 命令来看到你对缓冲区的历史编辑记录：


```
This is an example file.
There is some text, but not much.
There are some errors, but not many.
```

当然，这些修改只存在于缓冲区里。你如果在 `ed` 编辑器外查看这个文件，你只会看到原始的文本：


```
$ cat myfile.txt
This is an example document.
There is some text, but not much.
There is some errors, but not much.
```

如果你要把这些修改保存回文件中，使用 `w` 命令即可：


```
w myfile.txt
258
```

### 清空缓冲区

如果想要得到一个新的缓冲区，以此来打开一个新的文件，或者把一个新的文件加载到不同的环境中，你可以使用 `c` 命令。使用这个清空缓冲区后，什么也不会输出，因为缓冲已经是空的了：


```
c
,p
```

### 退出

如果要退出当前的 `ed` 会话，你可以使用 `q` 命令。它并不会给你一个保存缓冲区的机会，所以你要确保自己在这之前执行了保存操作。

### 尝试一下 ed 吧

`ed` 还可以做到很多事情，学习 `ed` 可以让你知道它和部分的 `vim` 是如何工作的。我并没有尝试使用 `ed` 来写这篇文章，老实说，我也不认为它是通常意义上的最佳文本编辑器。但是，`ed` 仍然是一个出色的编辑器。通过阅读它的文档，你可以很轻松地学会它。在 GNU 系统上，你可以使用 `info ed` 来查看它的操作手册。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/gnu-ed

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
