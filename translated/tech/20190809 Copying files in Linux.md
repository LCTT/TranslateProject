[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Copying files in Linux)
[#]: via: (https://opensource.com/article/19/8/copying-files-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/scottnesbitthttps://opensource.com/users/greg-p)

在 Linux 中复制文档
======

了解在 Linux 中多种复制文档的方式以及各自的优点
![归档文件][1]

在办公室里复制文档过去需要专门的员工与机器。如今，复制是电脑用户无需多加思考的任务。在电脑里复制数据是如此微不足道的事以致于你还没有意识到复制就发生了，例如当拖动文档到外部硬盘的时候。

数字实体复制起来十分简单已是一个不争的事实，以致于大部分现代电脑用户未去考虑其它复制他们工作的可选方式。尽管如此，在 Linux 中复制文档仍有几种不同的方式。每种方法取决于你的目的不同都有其独到之处。

以下是一系列在 Linux，BSD 及 Mac 上复制文件的方式。

### 在 GUI 中复制
如大多数操纵系统一样，如果你想的话，你可以完全用 GUI 来管理文件。

拖拽放下

复制文件最浅显的方式可能就是你在电脑中用来复制文件的方式：拖拽并放下。在大多数 Linux 桌面上，从一个本地文件夹拖拽放下到另一个本地文件夹是_移动_文件的默认方式/你可以通过在拖拽文件后按住 **Ctrl** 到复制区域改变这个行为。

你的鼠标指针可能会有一个指示，例如一个加号以显示你在复制模式。

![复制一个文件。][2]

注意如果文件在原创系统上存在，不管它是一个网页服务器或者你自己网络里的用文件共享协议访问另一台电脑，默认动作经常是复制而不是移动文件。

### 右击

如果你觉得在你的桌面拖拽文档不够精准或者臃肿，或者这么做让你的手离开键盘太多，你可以经常使用右键菜单复制文件。这取决于你所用的文件管理器，但通常来说，右键产生的相关菜单会包括常见的操作。

相关菜单的复制动作将你的[文件路径][3]（文件在系统的位置）保存在你的剪切板中，这样你可以将你的文件 _粘贴_ 到别处：


![从相关菜单复制文件][4]

在这种情况下，你并没有将文件的内容复制到你的剪切版上。取而代之的是你复制了[文件路径][3]。当你粘贴时，你的文件管理器查看剪贴板上的路径并执行复制命令，将相应路径上的文件粘贴到你准备拷贝到的路径。

### 用命令行复制

虽然 GUI 通常是相对熟悉的拷贝文件方式，用终端拷贝却更有效率。

#### cp

基于终端最显而易见的复制拷贝替代物就是 **cp** 命令。这个命令可以拷贝文件和目录，也相对直接。它使用熟悉的 _来源_ 和 _目的_（必须以这样的顺序）句法，因此拷贝一个叫 **example.txt** 的文件到你的 **Documents** 目录就像这样：

```
$ cp example.txt ~/Documents
```

就像当你拖拽文件放在文件夹里一样，这个动作并不将 **Documents** 替换为 **example.txt**。取而代之的是，**cp** 察觉到 **Documents** 是一个文件夹，就将 **example.txt** 的复件放进去。

你同样可以（便捷有效地）重命名你拷贝的文档：

```
$ cp example.txt ~/Documents/example_copy.txt
```

这很重要因为它使得你可以在于原文件相同的目录中生成一个复件：

```
$ cp example.txt example.txt
cp: 'example.txt' and 'example.txt' are the same file.
$ cp example.txt example_copy.txt
```

要复制一个目录，你必须使用 **-r** 选项，代表 --**递归式的**。这个选项在目录 _inode_ 中运行 **cp** 命令，然后作用到该目录下的所有文件。没有 **-r** 选项，**cp** 不会将目录当成一个可复制的对象：

```
$ cp notes/ notes-backup
cp: -r not specified; omitting directory 'notes/'
$ cp -r notes/ notes-backup
```

#### cat

**cat** 命令是最易被误解的命令，但只是因为它表现了 [POSIX][5] 系统的极致灵活性。在 **cat** 可以做到的所有事情中，也包括拷贝。例如说使用 **cat** 你可以仅用一个命令就[从一个文件创建两个副本][6]。你用 **cp** 无法做到这一点。

使用 **cat** 复制文档的重要性在于系统解释该行为的方式。当你使用 **cp** 拷贝文件时，文件的属性跟着文件一起被拷贝。这代表复件的权限和原件一样。


```
$ ls -l -G -g
-rw-r--r--. 1 57368 Jul 25 23:57  foo.jpg
$ cp foo.jpg bar.jpg
-rw-r--r--. 1 57368 Jul 29 13:37  bar.jpg
-rw-r--r--. 1 57368 Jul 25 23:57  foo.jpg
```

然而用 **cat** 将一个文件的内容读取至另一个文件让系统创建了一个新文件。这些新文件取决于你的默认 **umansk** 设置。了解更多关于`umask`，阅读 Alex Juarez 包含 [umask][7] 以及权限概览的文章。

运行 **unmask** 获取当前设置：


```
$ umask
0002
```

这个设置代表在该处新创建的文档被给予**664**（**rw-rw-r--**）权限因为 **unmask** 设置的前几位数字没有遮掩任何东西（并且执行数位不是文件创建的默认数位）且写入权限被最终位屏蔽。

当你使用 **cat** 拷贝时，你并没有真正拷贝文件。你使用 **cat** 读取文件内容并将输出重新导向一个新文件：


```
$ cat foo.jpg &gt; baz.jpg
$ ls -l -G -g
-rw-r--r--. 1 57368 Jul 29 13:37  bar.jpg
-rw-rw-r--. 1 57368 Jul 29 13:42  baz.jpg
-rw-r--r--. 1 57368 Jul 25 23:57  foo.jpg
```

如你所见，**cat** 使用系统默认的 umask 创建了一个全新的文件。

最后，当你仅仅想复制一个文件时，这些手段无关紧要。但如果你想以拷贝文件并保持默认权限时，你可以用一个命令 **cat** 完成一切。

#### rsync

有着著名的同步源和目的文件的能力，**rsync** 命令是一个拷贝文件的多才多艺的工具。最为简单的，**rsync** 可以与 **cp** 命令相似般使用。


```
$ rsync example.txt example_copy.txt
$ ls
example.txt    example_copy.txt
```

这个命令真正的威力藏在其能不做不必要的拷贝的能力里。如果你使用 **rsync** 来将文件拷经目录里且其已经存在在该目录里，那么 **rsync** 和普通的拷贝在本地里并无二致。但如果你将从远程服务器拷贝海量数据，这个特性就完全不一样了。

甚至在本地中，真正不一样的地方在于它可以分辨具有相同名字但拥有不同数据的文件。如果你曾发现你面对着同一个目录里的两个相同副本时，**rsync** 可以将它们同步至一个包含每个最新修改的目录。这种配置在尚未发现版本控制威力的业界十分常见，同时也作为需要从同一个源拷贝的备选方案。

你可以通过创建两个文件夹有意识地模拟这种情况，一个叫做 **example** 另一个叫做 **example_dupe**：


```
$ mkdir example example_dupe
```

在第一个文件夹里创建文件：


```
$ echo "one" &gt; example/foo.txt
```

用 **rsync** 同步两个目录。这种做法最常见的选项是 **-a**（代表 _archive_，保证符号链接和其它特殊文件保存下来）和 **-v**（代表 _verbose_，向你提供当前命令的进度反馈）：


```
$ rsync -av example/ example_dupe/
```

两个目录现在包含同样的信息：


```
$ cat example/foo.txt
one
$ cat example_dupe/foo.txt
one
```

如果你当作源的文件发生改变，目的文件也会随之跟新：


```
$ echo "two" &gt;&gt; example/foo.txt
$ rsync -av example/  example_dupe/
$ cat example_dupe/foo.txt
one
two
```

注意 **rsync** 命令是用来复制数据的，而不是充当版本管理系统的。例如假设有一个目的文件比源文件多了改变，那个文件仍将被覆盖因为 **rsync** 比较文件的分歧并假设目的文件总是反映着源文件：


```
$ echo "You will never see this note again" &gt; example_dupe/foo.txt
$ rsync -av example/  example_dupe/
$ cat example_dupe/foo.txt
one
two
```

如果没有改变，那么就不会有拷贝。

**rsync** 命令有许多 **cp** 没有的选项，例如查看目标权限，排除文件，删除过时的文件不在两个目录中出现以及更多。使用 **rsync** 作为 **cp** 的强力替代或者有效补充。

### 许多拷贝的方式

在 POSIX 系统中有许多能够达成同样目的的方式，因此开源的灵活性名副其实。我忘了哪个复制数据的有效方式吗？在评论区分享你的拷贝神技。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/copying-files-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/scottnesbitthttps://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ (Filing papers and documents)
[2]: https://opensource.com/sites/default/files/uploads/copy-nautilus.jpg (Copying a file.)
[3]: https://opensource.com/article/19/7/understanding-file-paths-and-how-use-them
[4]: https://opensource.com/sites/default/files/uploads/copy-files-menu.jpg (Copying a file from the context menu.)
[5]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[6]: https://opensource.com/article/19/2/getting-started-cat-command
[7]: https://opensource.com/article/19/7/linux-permissions-101
