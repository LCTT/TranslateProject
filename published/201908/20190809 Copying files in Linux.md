[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11259-1.html)
[#]: subject: (Copying files in Linux)
[#]: via: (https://opensource.com/article/19/8/copying-files-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/scottnesbitthttps://opensource.com/users/greg-p)

在 Linux 中复制文档
======

> 了解在 Linux 中多种复制文档的方式以及各自的优点。

![](https://img.linux.net.cn/data/attachment/album/201908/23/053859f1stcjezllmj28e8.jpg)

在办公室里复印文档过去需要专门的员工与机器。如今，复制是电脑用户无需多加思考的任务。在电脑里复制数据是如此微不足道的事，以致于你还没有意识到复制就发生了，例如当拖动文档到外部硬盘的时候。

数字实体复制起来十分简单已是一个不争的事实，以致于大部分现代电脑用户从未考虑过其它的复制他们工作的方式。无论如何，在 Linux 中复制文档仍有几种不同的方式。每种方法取决于你的目的不同而都有其独到之处。

以下是一系列在 Linux、BSD 及 Mac 上复制文件的方式。

### 在 GUI 中复制

如大多数操作系统一样，如果你想的话，你可以完全用 GUI 来管理文件。

#### 拖拽放下

最浅显的复制文件的方式可能就是你以前在电脑中复制文件的方式：拖拽并放下。在大多数 Linux 桌面上，从一个本地文件夹拖拽放下到另一个本地文件夹是*移动*文件的默认方式，你可以通过在拖拽文件开始后按住 `Ctrl` 来改变这个行为。

你的鼠标指针可能会有一个指示，例如一个加号以显示你在复制模式。

![复制一个文件][2]

注意如果文件是放在远程系统上的，不管它是一个 Web 服务器还是在你自己网络里用文件共享协议访问的另一台电脑，默认动作经常是复制而不是移动文件。

#### 右击

如果你觉得在你的桌面拖拽文档不够精准或者有点笨拙，或者这么做会让你的手离开键盘太久，你可以经常使用右键菜单来复制文件。这取决于你所用的文件管理器，但通常来说，右键弹出的关联菜单会包括常见的操作。

关联菜单的“复制”动作将你的[文件路径][3]（即文件在系统的位置）保存在你的剪切板中，这样你可以将你的文件*粘贴*到别处：（LCTT 译注：此处及下面的描述不确切，这里并非复制的文件路径的“字符串”，而是复制了代表文件实体的对象/指针）

![从右键菜单复制文件][4]

在这种情况下，你并没有将文件的内容复制到你的剪切版上。取而代之的是你复制了[文件路径][3]。当你粘贴时，你的文件管理器会查看剪贴板上的路径并执行复制命令，将相应路径上的文件粘贴到你准备复制到的路径。

### 用命令行复制

虽然 GUI 通常是相对熟悉的复制文件方式，用终端复制却更有效率。

#### cp

在终端上等同于在桌面上复制和粘贴文件的最显而易见的方式就是 `cp` 命令。这个命令可以复制文件和目录，也相对直接。它使用熟悉的*来源*和*目的*（必须以这样的顺序）句法，因此复制一个名为 `example.txt` 的文件到你的 `Documents` 目录就像这样：

```
$ cp example.txt ~/Documents
```

就像当你拖拽文件放在文件夹里一样，这个动作并不会将 `Documents` 替换为 `example.txt`。取而代之的是，`cp` 察觉到 `Documents` 是一个文件夹，就将 `example.txt` 的副本放进去。

你同样可以便捷有效地重命名你复制的文档：

```
$ cp example.txt ~/Documents/example_copy.txt
```

重要的是，它使得你可以在与原文件相同的目录中生成一个副本：

```
$ cp example.txt example.txt
cp: 'example.txt' and 'example.txt' are the same file.
$ cp example.txt example_copy.txt
```

要复制一个目录，你必须使用 `-r` 选项（代表 `--recursive`，递归）。以这个选项对目录 `nodes` 运行 `cp` 命令，然后会作用到该目录下的所有文件。没有 `-r` 选项，`cp` 不会将目录当成一个可复制的对象：

```
$ cp notes/ notes-backup
cp: -r not specified; omitting directory 'notes/'
$ cp -r notes/ notes-backup
```

#### cat

`cat` 命令是最易被误解的命令，但这只是因为它表现了 [POSIX][5] 系统的极致灵活性。在 `cat` 可以做到的所有事情中（包括其原意的连接文件的用途），它也能复制。例如说使用 `cat` 你可以仅用一个命令就[从一个文件创建两个副本][6]。你用 `cp` 无法做到这一点。

使用 `cat` 复制文档要注意的是系统解释该行为的方式。当你使用 `cp` 复制文件时，该文件的属性跟着文件一起被复制，这意味着副本的权限和原件一样。

```
$ ls -l -G -g
-rw-r--r--. 1 57368 Jul 25 23:57  foo.jpg
$ cp foo.jpg bar.jpg
-rw-r--r--. 1 57368 Jul 29 13:37  bar.jpg
-rw-r--r--. 1 57368 Jul 25 23:57  foo.jpg
```

然而用 `cat` 将一个文件的内容读取至另一个文件是让系统创建了一个新文件。这些新文件取决于你的默认 umask 设置。要了解 umask 更多的知识，请阅读 Alex Juarez 讲述 [umask][7] 以及权限概览的文章。

运行 `unmask` 获取当前设置：

```
$ umask
0002
```

这个设置代表在该处新创建的文档被给予 `664`（`rw-rw-r--`）权限，因为该 `unmask` 设置的前几位数字没有遮掩任何权限（而且执行位不是文件创建的默认位），并且写入权限被最终位所屏蔽。

当你使用 `cat` 复制时，实际上你并没有真正复制文件。你使用 `cat` 读取文件内容并将输出重定向到了一个新文件：

```
$ cat foo.jpg &gt; baz.jpg
$ ls -l -G -g
-rw-r--r--. 1 57368 Jul 29 13:37  bar.jpg
-rw-rw-r--. 1 57368 Jul 29 13:42  baz.jpg
-rw-r--r--. 1 57368 Jul 25 23:57  foo.jpg
```

如你所见，`cat` 应用系统默认的 umask 设置创建了一个全新的文件。

最后，当你只是想复制一个文件时，这些手段无关紧要。但如果你想复制文件并保持默认权限时，你可以用一个命令 `cat` 完成一切。

#### rsync

有着著名的同步源和目的文件的能力，`rsync` 命令是一个复制文件的多才多艺的工具。最为简单的，`rsync` 可以类似于 `cp` 命令一样使用。

```
$ rsync example.txt example_copy.txt
$ ls
example.txt    example_copy.txt
```

这个命令真正的威力藏在其能够*不做*不必要的复制的能力里。如果你使用 `rsync` 来将文件复制进目录里，且其已经存在在该目录里，那么 `rsync` 不会做复制操作。在本地这个差别不是很大，但如果你将海量数据复制到远程服务器，这个特性的意义就完全不一样了。

甚至在本地中，真正不一样的地方在于它可以分辨具有相同名字但拥有不同数据的文件。如果你曾发现你面对着同一个目录的两个相同副本时，`rsync` 可以将它们同步至一个包含每一个最新修改的目录。这种配置在尚未发现版本控制威力的业界十分常见，同时也作为需要从一个可信来源复制的备份方案。

你可以通过创建两个文件夹有意识地模拟这种情况，一个叫做 `example` 另一个叫做 `example_dupe`：

```
$ mkdir example example_dupe
```

在第一个文件夹里创建文件：

```
$ echo "one" > example/foo.txt
```

用 `rsync` 同步两个目录。这种做法最常见的选项是 `-a`（代表 “archive”，可以保证符号链接和其它特殊文件保留下来）和 `-v`（代表 “verbose”，向你提供当前命令的进度反馈）：

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

如果你当作源分支的文件发生改变，目的文件也会随之跟新：

```
$ echo "two" >> example/foo.txt
$ rsync -av example/  example_dupe/
$ cat example_dupe/foo.txt
one
two
```

注意 `rsync` 命令是用来复制数据的，而不是充当版本管理系统的。例如假设有一个目的文件比源文件多了改变，那个文件仍将被覆盖，因为 `rsync` 比较文件的分歧并假设目的文件总是应该镜像为源文件：

```
$ echo "You will never see this note again" &gt; example_dupe/foo.txt
$ rsync -av example/  example_dupe/
$ cat example_dupe/foo.txt
one
two
```

如果没有改变，那么就不会有复制动作发生。

`rsync` 命令有许多 `cp` 没有的选项，例如设置目标权限、排除文件、删除没有在两个目录中出现的过时文件，以及更多。可以使用 `rsync` 作为 `cp` 的强力替代或者有效补充。

### 许多复制的方式

在 POSIX 系统中有许多能够达成同样目的的方式，因此开源的灵活性名副其实。我忘了哪个复制数据的有效方式吗？在评论区分享你的复制神技。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/copying-files-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/scottnesbitthttps://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ (Filing papers and documents)
[2]: https://opensource.com/sites/default/files/uploads/copy-nautilus.jpg (Copying a file.)
[3]: https://opensource.com/article/19/7/understanding-file-paths-and-how-use-them
[4]: https://opensource.com/sites/default/files/uploads/copy-files-menu.jpg (Copying a file from the context menu.)
[5]: https://linux.cn/article-11222-1.html
[6]: https://opensource.com/article/19/2/getting-started-cat-command
[7]: https://opensource.com/article/19/7/linux-permissions-101
