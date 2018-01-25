如何统计Linux中文件和文件夹/目录的数量
======
嗨，伙计们，今天我们又来了一系列棘手的命令，会多方面帮助你。 这是一种操作命令，它可以帮助您计算当前目录中的文件和目录，递归计数，特定用户创建的文件列表等。

在本教程中，我们将向您展示如何使用多个命令，并使用ls，egrep，wc和find命令执行一些高级操作。 下面的命令很有帮助。

为了实验，我打算总共创建7个文件和2个文件夹（5个常规文件和2个隐藏文件）。 看到下面的tree命令的输出清楚的展示文件和文件夹列表。

**推荐阅读** [文件操作命令][1]
```
# tree -a /opt
/opt
├── magi
│   └── 2g
│   ├── test5.txt
│   └── .test6.txt
├── test1.txt
├── test2.txt
├── test3.txt
├── .test4.txt
└── test.txt

2 directories, 7 files

```

**示例-1 ：** 统计当前目录文件（排除隐藏文件）。 运行以下命令以确定当前目录中有多少个文件，并且不计算点文件（LCTT译者注：点文件即当前目录文件和上级目录文件）。
```
# ls -l . | egrep -c '^-'
4
```

**细节：**

  * `ls` ： 列出目录内容
  * `-l` ： 使用长列表格式
  * `.` ： 列出有关文件的信息（默认为当前目录）
  * `|` ： 控制操作器将一个程序的输出发送到另一个程序进行进一步处理
  * `egrep` ： 打印符合模式的行
  * `-c` ： 通用输出控制
  * `'^-'` ： 它们分别匹配一行的开头和结尾的空字符串



**示例-2 ：** 统计包含隐藏文件的当前目录文件。 包括当前目录中的点文件。
```
# ls -la . | egrep -c '^-'
5
```

**示例-3 ：** 运行以下命令来计算当前目录文件和文件夹。 它会一次计算所有的。
```
# ls -1 | wc -l
5
```

**细节：**

  * `ls` ： 列出目录内容
  * `-l` ： 使用长列表格式
  * `|` ： 控制操作器将一个程序的输出发送到另一个程序进行进一步处理
  * `wc` ： 这是一个为每个文件打印换行符，字和字节数的命令
  * `-l` ： 打印换行符数



**示例-4 ：** 统计包含隐藏文件和目录的当前目录文件和文件夹。
```
# ls -1a | wc -l
8
```

**示例-5 ：** 递归计算当前目录文件，其中包括隐藏文件。
```
# find . -type f | wc -l
7
```

**细节 ：**

  * `find` ： 搜索目录层次结构中的文件
  * `-type` ： 文件类型
  * `f` ： 常规文件
  * `wc` ： 这是一个为每个文件打印换行符，字和字节数的命令
  * `-l` ： 打印换行符数



**示例-6 ：** 使用tree命令打印目录和文件数（排除隐藏文件）。
```
# tree | tail -1
2 directories, 5 files
```

**示例-7 ：** 使用包含隐藏文件的树命令打印目录和文件数。
```
# tree -a | tail -1
2 directories, 7 files
```

**示例-8 ：** 运行下面的命令递归计算包含隐藏目录的目录。
```
# find . -type d | wc -l
3
```

**示例-9 ：** 根据文件扩展名计算文件数量。 这里我们要计算 `.txt` 文件。
```
# find . -name "*.txt" | wc -l
7
```

**示例-10 ：** 使用echo命令和wc命令统计当前目录中的所有文件。 `4`表示当前目录中的文件数量。
```
# echo * | wc
1 4 39
```

**示例-11 ：** 通过使用echo命令和wc命令来统计当前目录中的所有目录。 `1`表示当前目录中的目录数量。
```
# echo comic/ published/ sources/ translated/ | wc
1 1 6
```

**示例-12 ：** 通过使用echo命令和wc命令来统计当前目录中的所有文件和目录。 `5`表示当前目录中的目录和文件的数量。
```
# echo * | wc
1 5 44
```

**示例-13 ：** 统计系统（整个系统）中的文件数。
```
# find / -type f | wc -l
69769
```

**示例-14 ：** 统计系统（整个系统）中的文件夹数。
```
# find / -type d | wc -l
8819
```

**示例-15 ：** 运行以下命令来计算系统（整个系统）中的文件，文件夹，硬链接和符号链接数。
```
# find / -type d -exec echo dirs \; -o -type l -exec echo symlinks \; -o -type f -links +1 -exec echo hardlinks \; -o -type f -exec echo files \; | sort | uniq -c
 8779 dirs
 69343 files
 20 hardlinks
 11646 symlinks
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-count-the-number-of-files-and-folders-directories-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/empty-a-file-delete-contents-lines-from-a-file-remove-matching-string-from-a-file-remove-empty-blank-lines-from-a-file/
