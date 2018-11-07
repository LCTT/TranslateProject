translating by dianbanjiu Commandline quick tips: How to locate a file
======

![](https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg)

We all have files on our computers — documents, photos, source code, you name it. So many of them. Definitely more than I can remember. And if not challenging, it might be time consuming to find the right one you’re looking for. In this post, we’ll have a look at how to make sense of your files on the command line, and especially how to quickly find the ones you’re looking for.

Good news is there are few quite useful utilities in the Linux commandline designed specifically to look for files on your computer. We’ll have a look at three of those: ls, tree, and find.

### ls

If you know where your files are, and you just need to list them or see information about them, ls is here for you.

Just running ls lists all visible files and directories in the current directory:

```
$ ls
Documents Music Pictures Videos notes.txt
```

Adding the **-l** option shows basic information about the files. And together with the **-h** option you’ll see file sizes in a human-readable format:

```
$ ls -lh
total 60K
drwxr-xr-x 2 adam adam 4.0K Nov 2 13:07 Documents
drwxr-xr-x 2 adam adam 4.0K Nov 2 13:07 Music
drwxr-xr-x 2 adam adam 4.0K Nov 2 13:13 Pictures
drwxr-xr-x 2 adam adam 4.0K Nov 2 13:07 Videos
-rw-r--r-- 1 adam adam 43K Nov 2 13:12 notes.txt
```

**Is** can also search a specific place:

```
$ ls Pictures/
trees.png wallpaper.png
```

Or a specific file — even with just a part of the name:

```
$ ls *.txt
notes.txt
```

Something missing? Looking for a hidden file? No problem, use the **-a** option:

```
$ ls -a
. .bash_logout .bashrc Documents Pictures notes.txt
.. .bash_profile .vimrc Music Videos
```

There are many other useful options for **ls** , and you can combine them together to achieve what you need. Learn about them by running:

```
$ man ls
```

### tree

If you want to see, well, a tree structure of your files, tree is a good choice. It’s probably not installed by default which you can do yourself using the package manager DNF:

```
$ sudo dnf install tree
```

Running tree without any options or parameters shows the whole tree starting at the current directory. Just a warning, this output might be huge, because it will include all files and directories:

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

If that’s too much, I can limit the number of levels it goes using the -L option followed by a number specifying the number of levels I want to see:

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

You can also display a tree of a specific path:

```
$ tree Documents/work/
Documents/work/
|-- project-abc
| |-- README.md
| |-- do-things.sh
| `-- project-notes.txt
`-- status-reports.txt
```

To browse and search a huge tree, you can use it together with less:

```
$ tree | less
```

Again, there are other options you can use with three, and you can combine them together for even more power. The manual page has them all:

```
$ man tree
```

### find

And what about files that live somewhere in the unknown? Let’s find them!

In case you don’t have find on your system, you can install it using DNF:

```
$ sudo dnf install findutils
```

Running find without any options or parameters recursively lists all files and directories in the current directory.

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

But the true power of find is that you can search by name:

```
$ find -name do-things.sh
./Documents/work/project-abc/do-things.sh
```

Or just a part of a name — like the file extension. Let’s find all .txt files:

```
$ find -name "*.txt"
./Documents/secret/christmas-presents.txt
./Documents/notes.txt
./Documents/work/status-reports.txt
./Documents/work/project-abc/project-notes.txt
./notes.txt
```

You can also look for files by size. That might be especially useful if you’re running out of space. Let’s list all files larger than 1 MB:

```
$ find -size +1M
./Pictures/trees.png
./Pictures/wallpaper.png
```

Searching a specific directory is also possible. Let’s say I want to find a file in my Documents directory, and I know it has the word “project” in its name:

```
$ find Documents -name "*project*"
Documents/work/project-abc
Documents/work/project-abc/project-notes.txt
```

Ah! That also showed the directory. One thing I can do is to limit the search query to files only:

```
$ find Documents -name "*project*" -type f
Documents/work/project-abc/project-notes.txt
```

And again, find have many more options you can use, the man page might definitely help you:

```
$ man find
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/commandline-quick-tips-locate-file/

作者：[Adam Šamalík][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/asamalik/
[b]: https://github.com/lujun9972
