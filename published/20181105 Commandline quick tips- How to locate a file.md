命令行快速技巧：如何定位一个文件
======

![](https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg)

我们都会有文件存储在电脑里 —— 目录、相片、源代码等等。它们是如此之多。也无疑超出了我的记忆范围。要是毫无目标，找到正确的那一个可能会很费时间。在这篇文章里我们来看一下如何在命令行里找到需要的文件，特别是快速找到你想要的那一个。  

好消息是 Linux 命令行专门设计了很多非常有用的命令行工具在你的电脑上查找文件。下面我们看一下它们其中三个：`ls`、`tree` 和 `find`。  

### ls

如果你知道文件在哪里，你只需要列出它们或者查看有关它们的信息，`ls` 就是为此而生的。  

只需运行 `ls` 就可以列出当下目录中所有可见的文件和目录：  

```
$ ls
Documents Music Pictures Videos notes.txt
```

添加 `-l` 选项可以查看文件的相关信息。同时再加上 `-h` 选项，就可以用一种人们易读的格式查看文件的大小：  

```
$ ls -lh
total 60K
drwxr-xr-x 2 adam adam 4.0K Nov 2 13:07 Documents
drwxr-xr-x 2 adam adam 4.0K Nov 2 13:07 Music
drwxr-xr-x 2 adam adam 4.0K Nov 2 13:13 Pictures
drwxr-xr-x 2 adam adam 4.0K Nov 2 13:07 Videos
-rw-r--r-- 1 adam adam 43K Nov 2 13:12 notes.txt
```

`ls` 也可以搜索一个指定位置：  

```
$ ls Pictures/
trees.png wallpaper.png
```

或者一个指定文件 —— 即便只跟着名字的一部分：  

```
$ ls *.txt
notes.txt
```

少了点什么？想要查看一个隐藏文件？没问题，使用 `-a` 选项：  

```
$ ls -a
. .bash_logout .bashrc Documents Pictures notes.txt
.. .bash_profile .vimrc Music Videos
```

`ls` 还有很多其他有用的选项，你可以把它们组合在一起获得你想要的效果。可以使用以下命令了解更多：  

```
$ man ls
```

### tree

如果你想查看你的文件的树状结构，`tree` 是一个不错的选择。可能你的系统上没有默认安装它，你可以使用包管理 DNF 手动安装：  

```
$ sudo dnf install tree
```

如果不带任何选项或者参数地运行 `tree`，将会以当前目录开始，显示出包含其下所有目录和文件的一个树状图。提醒一下，这个输出可能会非常大，因为它包含了这个目录下的所有目录和文件：  

```
$ tree
.
|-- Documents
| |-- notes.txt
| |-- secret
| | `-- christmas-presents.txt
| `-- work
| |-- project-abc
| | |-- README.md
| | |-- do-things.sh
| | `-- project-notes.txt
| `-- status-reports.txt
|-- Music
|-- Pictures
| |-- trees.png
| `-- wallpaper.png
|-- Videos
`-- notes.txt
```

如果列出的太多了，使用 `-L` 选项，并在其后加上你想查看的层级数，可以限制列出文件的层级：  

```
$ tree -L 2
.
|-- Documents
| |-- notes.txt
| |-- secret
| `-- work
|-- Music
|-- Pictures
| |-- trees.png
| `-- wallpaper.png
|-- Videos
`-- notes.txt
```

你也可以显示一个指定目录的树状图：  

```
$ tree Documents/work/
Documents/work/
|-- project-abc
| |-- README.md
| |-- do-things.sh
| `-- project-notes.txt
`-- status-reports.txt
```

如果使用 `tree` 列出的是一个很大的树状图，你可以把它跟 `less` 组合使用：  

```
$ tree | less
```

再一次，`tree` 有很多其他的选项可以使用，你可以把他们组合在一起发挥更强大的作用。man 手册页有所有这些选项：  

```
$ man tree
```

### find

那么如果不知道文件在哪里呢？就让我们来找到它们吧！  

要是你的系统中没有 `find`，你可以使用 DNF 安装它：  

```
$ sudo dnf install findutils
```

运行 `find` 时如果没有添加任何选项或者参数，它将会递归列出当前目录下的所有文件和目录。  

```
$ find
.
./Documents
./Documents/secret
./Documents/secret/christmas-presents.txt
./Documents/notes.txt
./Documents/work
./Documents/work/status-reports.txt
./Documents/work/project-abc
./Documents/work/project-abc/README.md
./Documents/work/project-abc/do-things.sh
./Documents/work/project-abc/project-notes.txt
./.bash_logout
./.bashrc
./Videos
./.bash_profile
./.vimrc
./Pictures
./Pictures/trees.png
./Pictures/wallpaper.png
./notes.txt
./Music
```

但是 `find` 真正强大的是你可以使用文件名进行搜索：  

```
$ find -name do-things.sh
./Documents/work/project-abc/do-things.sh
```

或者仅仅是名字的一部分 —— 像是文件后缀。我们来找一下所有的 .txt 文件：  

```
$ find -name "*.txt"
./Documents/secret/christmas-presents.txt
./Documents/notes.txt
./Documents/work/status-reports.txt
./Documents/work/project-abc/project-notes.txt
./notes.txt
```

你也可以根据大小寻找文件。如果你的空间不足的时候，这种方法也许特别有用。现在来列出所有大于 1 MB 的文件：  

```
$ find -size +1M
./Pictures/trees.png
./Pictures/wallpaper.png
```

当然也可以搜索一个具体的目录。假如我想在我的 Documents 文件夹下找一个文件，而且我知道它的名字里有 “project” 这个词：  

```
$ find Documents -name "*project*"
Documents/work/project-abc
Documents/work/project-abc/project-notes.txt
```

除了文件它还显示目录。你可以限制仅搜索查询文件：  

```
$ find Documents -name "*project*" -type f
Documents/work/project-abc/project-notes.txt
```

最后再一次，`find` 还有很多供你使用的选项，要是你想使用它们，man 手册页绝对可以帮到你：  

```
$ man find
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/commandline-quick-tips-locate-file/

作者：[Adam Šamalík][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/asamalik/
[b]: https://github.com/lujun9972
