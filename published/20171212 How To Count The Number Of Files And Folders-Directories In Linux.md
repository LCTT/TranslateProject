如何统计 Linux 中文件和文件夹/目录的数量
======

嗨，伙计们，今天我们再次带来一系列可以多方面帮助到你的复杂的命令。 通过操作命令，可以帮助您计数当前目录中的文件和目录、递归计数，统计特定用户创建的文件列表等。

在本教程中，我们将向您展示如何使用多个命令，并使用 `ls`、`egrep`、`wc` 和 `find` 命令执行一些高级操作。 下面的命令将可用在多个方面。

为了实验，我打算总共创建 7 个文件和 2 个文件夹（5 个常规文件和 2 个隐藏文件）。 下面的 `tree` 命令的输出清楚的展示了文件和文件夹列表。

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

### 示例-1

统计当前目录的文件（不包括隐藏文件）。 运行以下命令以确定当前目录中有多少个文件，并且不计算点文件（LCTT 译注：点文件即以“.” 开头的文件，它们在 Linux 默认是隐藏的）。

```
# ls -l . | egrep -c '^-'
4
```

**细节：**

  * `ls` ： 列出目录内容
  * `-l` ： 使用长列表格式
  * `.` ： 列出有关文件的信息（默认为当前目录）
  * `|` ： 将一个程序的输出发送到另一个程序进行进一步处理的控制操作符
  * `egrep` ： 打印符合模式的行
  * `-c` ： 通用输出控制
  * `'^-'` ： 以“-”开头的行（`ls -l` 列出长列表时，行首的 “-” 代表普通文件）

### 示例-2

统计当前目录包含隐藏文件在内的文件。 包括当前目录中的点文件。

```
# ls -la . | egrep -c '^-'
5
```

### 示例-3

运行以下命令来计数当前目录的文件和文件夹。 它会计算所有的文件和目录。

```
# ls -l | wc -l
5
```

**细节：**

  * `ls` ： 列出目录内容
  * `-l` ： 使用长列表格式
  * `|` ： 将一个程序的输出发送到另一个程序进行进一步处理的控制操作符
  * `wc` ： 这是一个统计每个文件的换行符、单词和字节数的命令
  * `-l` ： 输出换行符的数量

### 示例-4

统计当前目录包含隐藏文件和目录在内的文件和文件夹。

```
# ls -la | wc -l
8
```

### 示例-5

递归计算当前目录的文件，包括隐藏文件。

```
# find . -type f | wc -l
7
```

**细节 ：**

  * `find` ： 搜索目录结构中的文件
  * `-type` ： 文件类型
  * `f` ： 常规文件
  * `wc` ： 这是一个统计每个文件的换行符、单词和字节数的命令
  * `-l` ： 输出换行符的数量

### 示例-6

使用 `tree` 命令输出目录和文件数（不包括隐藏文件）。

```
# tree | tail -1
2 directories, 5 files
```

### 示例-7

使用包含隐藏文件的 `tree` 命令输出目录和文件计数。

```
# tree -a | tail -1
2 directories, 7 files
```

### 示例-8

运行下面的命令递归计算包含隐藏目录在内的目录数。

```
# find . -type d | wc -l
3
```

### 示例-9

根据文件扩展名计数文件数量。 这里我们要计算 `.txt` 文件。

```
# find . -name "*.txt" | wc -l
7
```

### 示例-10

组合使用 `echo` 命令和 `wc` 命令统计当前目录中的所有文件。 `4` 表示当前目录中的文件数量。

```
# echo *.* | wc
1       4      39
```

### 示例-11

组合使用 `echo` 命令和 `wc` 命令来统计当前目录中的所有目录。 第二个 `1` 表示当前目录中的目录数量。

```
# echo */ | wc
1       1       6
```

### 示例-12

组合使用 `echo` 命令和 `wc` 命令来统计当前目录中的所有文件和目录。 `5` 表示当前目录中的目录和文件的数量。

```
# echo * | wc
1 5 44
```

### 示例-13

统计系统（整个系统）中的文件数。

```
# find / -type f | wc -l
69769
```

### 示例-14

统计系统（整个系统）中的文件夹数。

```
# find / -type d | wc -l
8819
```

### 示例-15

运行以下命令来计算系统（整个系统）中的文件、文件夹、硬链接和符号链接数。

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
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/empty-a-file-delete-contents-lines-from-a-file-remove-matching-string-from-a-file-remove-empty-blank-lines-from-a-file/
