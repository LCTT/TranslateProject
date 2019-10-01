[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11380-1.html)
[#]: subject: (How to move a file in Linux)
[#]: via: (https://opensource.com/article/19/8/moving-files-linux-depth)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/doni08521059)

在 Linux 中如何移动文件
======

> 无论你是刚接触 Linux 的文件移动的新手还是已有丰富的经验，你都可以通过此深入的文章中学到一些东西。

![](https://img.linux.net.cn/data/attachment/album/201909/24/162919ygppgeevgrj0ppgv.jpg)

在 Linux 中移动文件看似比较简单，但是可用的选项却比大多数人想象的要多。本文介绍了初学者如何在 GUI 和命令行中移动文件，还介绍了底层实际上发生了什么，并介绍了许多有一定经验的用户也很少使用的命令行选项。

### 移动什么？

在研究移动文件之前，有必要仔细研究*移动*文件系统对象时实际发生的情况。当文件创建后，会将其分配给一个<ruby>索引节点<rt>inode</rt></ruby>，这是文件系统中用于数据存储的固定点。你可以使用 [ls][2] 命令看到文件对应的索引节点：

```
$ ls --inode example.txt
7344977 example.txt
```

移动文件时，实际上并没有将数据从一个索引节点移动到另一个索引节点，只是给文件对象分配了新的名称或文件路径而已。实际上，文件在移动时会保留其权限，因为移动文件不会更改或重新创建文件。（LCTT 译注：在不跨卷、分区和存储器时，移动文件是不会重新创建文件的；反之亦然）

文件和目录的索引节点并没有暗示这种继承关系，而是由文件系统本身决定的。索引节点的分配是基于文件创建时的顺序分配的，并且完全独立于你组织计算机文件的方式。一个目录“内”的文件的索引节点号可能比其父目录的索引节点号更低或更高。例如：

```
$ mkdir foo
$ mv example.txt foo
$ ls --inode
7476865 foo
$ ls --inode foo
7344977 example.txt
```

但是，将文件从一个硬盘驱动器移动到另一个硬盘驱动器时，索引节点基本上会更改。发生这种情况是因为必须将新数据写入新文件系统。因此，在 Linux 中，移动和重命名文件的操作实际上是相同的操作。无论你将文件移动到另一个目录还是在同一目录使用新名称，这两个操作均由同一个底层程序执行。

本文重点介绍将文件从一个目录移动到另一个目录。

### 用鼠标移动文件

图形用户界面是大多数人都熟悉的友好的抽象层，位于复杂的二进制数据集合之上。这也是在 Linux 桌面上移动文件的首选方法，也是最直观的方法。从一般意义上来说，如果你习惯使用台式机，那么你可能已经知道如何在硬盘驱动器上移动文件。例如，在 GNOME 桌面上，将文件从一个窗口拖放到另一个窗口时的默认操作是移动文件而不是复制文件，因此这可能是该桌面上最直观的操作之一：

![Moving a file in GNOME.][3]

而 KDE Plasma 桌面中的 Dolphin 文件管理器默认情况下会提示用户以执行不同的操作。拖动文件时按住 `Shift` 键可强制执行移动操作：

![Moving a file in KDE.][4]

### 在命令行移动文件

用于在 Linux、BSD、Illumos、Solaris 和 MacOS 上移动文件的 shell 命令是 `mv`。不言自明，简单的命令 `mv <source> <destination>` 会将源文件移动到指定的目标，源和目标都由[绝对][5]或[相对][6]文件路径定义。如前所述，`mv` 是 [POSIX][7] 用户的常用命令，其有很多不为人知的附加选项，因此，无论你是新手还是有经验的人，本文都会为你带来一些有用的选项。

但是，不是所有 `mv` 命令都是由同一个人编写的，因此取决于你的操作系统，你可能拥有 GNU `mv`、BSD `mv` 或 Sun `mv`。命令的选项因其实现而异（BSD `mv` 根本没有长选项），因此请参阅你的 `mv` 手册页以查看支持的内容，或安装你的首选版本（这是开源的奢侈之处）。

#### 移动文件

要使用 `mv` 将文件从一个文件夹移动到另一个文件夹，请记住语法 `mv <source> <destination>`。 例如，要将文件 `example.txt` 移到你的 `Documents` 目录中：

```
$ touch example.txt
$ mv example.txt ~/Documents
$ ls ~/Documents
example.txt
```

就像你通过将文件拖放到文件夹图标上来移动文件一样，此命令不会将 `Documents` 替换为 `example.txt`。相反，`mv` 会检测到 `Documents` 是一个文件夹，并将 `example.txt` 文件放入其中。

你还可以方便地在移动文件时重命名该文件：

```
$ touch example.txt
$ mv example.txt ~/Documents/foo.txt
$ ls ~/Documents
foo.txt
```

这很重要，这使你不用将文件移动到另一个位置，也可以重命名文件，例如：

```
$ touch example.txt 
$ mv example.txt foo2.txt 
$ ls foo2.txt`
```

#### 移动目录

不像 [cp][8] 命令，`mv` 命令处理文件和目录没有什么不同，你可以用同样的格式移动目录或文件：

```
$ touch file.txt
$ mkdir foo_directory
$ mv file.txt foo_directory
$ mv foo_directory ~/Documents
```

#### 安全地移动文件

如果你移动一个文件到一个已有同名文件的地方，默认情况下，`mv` 会用你移动的文件替换目标文件。这种行为被称为<ruby>清除<rt>clobbering</rt></ruby>，有时候这就是你想要的结果，而有时则不是。

一些发行版将 `mv` 别名定义为 `mv --interactive`（你也可以[自己写一个][9]），这会提醒你确认是否覆盖。而另外一些发行版没有这样做，那么你可以使用 `--interactive` 或 `-i` 选项来确保当两个文件有一样的名字而发生冲突时让 `mv` 请你来确认。

```
$ mv --interactive example.txt ~/Documents
mv: overwrite '~/Documents/example.txt'?
```

如果你不想手动干预，那么可以使用 `--no-clobber` 或 `-n`。该选项会在发生冲突时静默拒绝移动操作。在这个例子当中，一个名为 `example.txt` 的文件以及存在于 `~/Documents`，所以它不会如命令要求从当前目录移走。

```
$ mv --no-clobber example.txt ~/Documents
$ ls
example.txt
```

#### 带备份的移动

如果你使用 GNU `mv`，有一个备份选项提供了另外一种安全移动的方式。要为任何冲突的目标文件创建备份文件，可以使用 `-b` 选项。

```
$ mv -b example.txt ~/Documents
$ ls ~/Documents
example.txt    example.txt~
```

这个选项可以确保 `mv` 完成移动操作，但是也会保护目录位置的已有文件。

另外的 GNU 备份选项是 `--backup`，它带有一个定义了备份文件如何命名的参数。

* `existing`：如果在目标位置已经存在了编号备份文件，那么会创建编号备份。否则，会使用 `simple` 方式。
* `none`：即使设置了 `--backup`，也不会创建备份。当 `mv` 被别名定义为带有备份选项时，这个选项可以覆盖这种行为。
* `numbered`：给目标文件名附加一个编号。
* `simple`：给目标文件附加一个 `~`，当你日常使用带有 `--ignore-backups` 选项的 [ls][2] 时，这些文件可以很方便地隐藏起来。

简单来说：

```
$ mv --backup=numbered example.txt ~/Documents
$ ls ~/Documents
-rw-rw-r--. 1 seth users 128 Aug  1 17:23 example.txt
-rw-rw-r--. 1 seth users 128 Aug  1 17:20 example.txt.~1~
```

可以使用环境变量 `VERSION_CONTROL` 设置默认的备份方案。你可以在 `~/.bashrc` 文件中设置该环境变量，也可以在命令前动态设置：

```
$ VERSION_CONTROL=numbered mv --backup example.txt ~/Documents
$ ls ~/Documents
-rw-rw-r--. 1 seth users 128 Aug  1 17:23 example.txt
-rw-rw-r--. 1 seth users 128 Aug  1 17:20 example.txt.~1~
-rw-rw-r--. 1 seth users 128 Aug  1 17:22 example.txt.~2~
```

`--backup` 选项仍然遵循 `--interactive` 或 `-i` 选项，因此即使它在执行备份之前创建了备份，它仍会提示你覆盖目标文件：

```
$ mv --backup=numbered example.txt ~/Documents
mv: overwrite '~/Documents/example.txt'? y
$ ls ~/Documents
-rw-rw-r--. 1 seth users 128 Aug  1 17:24 example.txt
-rw-rw-r--. 1 seth users 128 Aug  1 17:20 example.txt.~1~
-rw-rw-r--. 1 seth users 128 Aug  1 17:22 example.txt.~2~
-rw-rw-r--. 1 seth users 128 Aug  1 17:23 example.txt.~3~
```

你可以使用 `--force` 或 `-f` 选项覆盖 `-i`。

```
$ mv --backup=numbered --force example.txt ~/Documents
$ ls ~/Documents
-rw-rw-r--. 1 seth users 128 Aug  1 17:26 example.txt
-rw-rw-r--. 1 seth users 128 Aug  1 17:20 example.txt.~1~
-rw-rw-r--. 1 seth users 128 Aug  1 17:22 example.txt.~2~
-rw-rw-r--. 1 seth users 128 Aug  1 17:24 example.txt.~3~
-rw-rw-r--. 1 seth users 128 Aug  1 17:25 example.txt.~4~
```

`--backup` 选项在 BSD `mv` 中不可用。

#### 一次性移动多个文件

移动多个文件时，`mv` 会将最终目录视为目标：

```
$ mv foo bar baz ~/Documents
$ ls ~/Documents
foo   bar   baz
```

如果最后一个项目不是目录，则 `mv` 返回错误：

```
$ mv foo bar baz
mv: target 'baz' is not a directory
```

GNU `mv` 的语法相当灵活。如果无法把目标目录作为提供给 `mv` 命令的最终参数，请使用 `--target-directory` 或 `-t` 选项：

```
$ mv --target-directory=~/Documents foo bar baz
$ ls ~/Documents
foo   bar   baz
```

当从某些其他命令的输出构造 `mv` 命令时（例如 `find` 命令、`xargs` 或 [GNU Parallel][10]），这特别有用。

#### 基于修改时间移动

使用 GNU `mv`，你可以根据要移动的文件是否比要替换的目标文件新来定义移动动作。该方式可以通过 `--update` 或 `-u` 选项使用，在BSD `mv` 中不可用：

```
$ ls -l ~/Documents
-rw-rw-r--. 1 seth users 128 Aug  1 17:32 example.txt
$ ls -l
-rw-rw-r--. 1 seth users 128 Aug  1 17:42 example.txt
$ mv --update example.txt ~/Documents
$ ls -l ~/Documents
-rw-rw-r--. 1 seth users 128 Aug  1 17:42 example.txt
$ ls -l
```

此结果仅基于文件的修改时间，而不是两个文件的差异，因此请谨慎使用。只需使用 `touch` 命令即可愚弄 `mv`：

```
$ cat example.txt
one
$ cat ~/Documents/example.txt
one
two
$ touch example.txt
$ mv --update example.txt ~/Documents
$ cat ~/Documents/example.txt
one
```

显然，这不是最智能的更新功能，但是它提供了防止覆盖最新数据的基本保护。

### 移动

除了 `mv` 命令以外，还有更多的移动数据的方法，但是作为这项任务的默认程序，`mv` 是一个很好的通用选择。现在你知道了有哪些可以使用的选项，可以比以前更智能地使用 `mv` 了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/moving-files-linux-depth

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/doni08521059
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://opensource.com/article/19/7/master-ls-command
[3]: https://opensource.com/sites/default/files/uploads/gnome-mv.jpg (Moving a file in GNOME.)
[4]: https://opensource.com/sites/default/files/uploads/kde-mv.jpg (Moving a file in KDE.)
[5]: https://opensource.com/article/19/7/understanding-file-paths-and-how-use-them
[6]: https://opensource.com/article/19/7/navigating-filesystem-relative-paths
[7]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[8]: https://opensource.com/article/19/7/copying-files-linux
[9]: https://opensource.com/article/19/7/bash-aliases
[10]: https://opensource.com/article/18/5/gnu-parallel
