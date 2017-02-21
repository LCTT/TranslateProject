删除一个目录下部分类型之外的所有文件的三种方法
=========

有的时候，你可能会遇到这种情况，你需要删除一个目录下的所有文件，或者只是简单的通过删除除了一些指定类型（以指定扩展名结尾）之外的文件来清理一个目录。

在这篇文章，我们将会向你展现如何通过 `rm`、 `find` 和 `globignore` 命令删除一个目录下除了指定文件扩展名或者类型的之外的文件。

在我们进一步深入之前，让我们开始简要的了解一下 Linux 中的一个重要的概念 —— 文件名模式匹配，它可以让我们解决眼前的问题。

在 Linux 下，一个 shell 模式是一个包含以下特殊字符的字符串，称为通配符或者元字符：

1.  `*` – 匹配 0 个或者多个字符
2.  `?` – 匹配任意单个字符
3.  `[序列]` – 匹配序列中的任意一个字符
4.  `[!序列]` – 匹配任意一个不在序列中的字符

我们将在这儿探索三种可能的办法，包括：

### 使用扩展模式匹配操作符删除文件

下来列出了不同的扩展模式匹配操作符，这些模式列表是一个用 `|` 分割包含一个或者多个文件名的列表：

1.  `*(模式列表)` – 匹配 0 个或者多个出现的指定模式
2.  `?(模式列表)` – 匹配 0 个或者 1 个出现的指定模式
4.  `@(模式列表)` – 匹配 1 个或者多个出现的指定模式
5.  `!(模式列表)` – 匹配除了一个指定模式之外的任何内容

为了使用它们，需要像下面一样打开 extglob shell 选项：

```
# shopt -s extglob

```

**1. 输入以下命令，删除一个目录下除了 filename 之外的所有文件**

```
$ rm -v !("filename")
```
![删除 Linux 下除了一个文件之外的所有文件](http://www.tecmint.com/wp-content/uploads/2016/10/DeleteAll-Files-Except-One-File-in-Linux.png)

*删除 Linux 下除了一个文件之外的所有文件*

**2. 删除除了 filename1 和 filename2 之外的所有文件**

```
$ rm -v !("filename1"|"filename2") 
```
![在 Linux 下删除除了一些文件之外的所有文件](http://www.tecmint.com/wp-content/uploads/2016/10/Delete-All-Files-Except-Few-Files-in-Linux.png)

*在 Linux 下删除除了一些文件之外的所有文件*

**3. 下面的例子显示如何通过交互模式删除除了 `.zip` 之外的所有文件**

```
$ rm -i !(*.zip)
```

![在 Linux 下删除除了 Zip 文件之外的所有文件](http://www.tecmint.com/wp-content/uploads/2016/10/Delete-All-Files-Except-Zip-Files-in-Linux.png)

*在 Linux 下删除除了 Zip 文件之外的所有文件*

**4. 接下来，通过如下的方式你可以删除一个目录下除了所有的`.zip` 和 `.odt` 文件的所有文件，并且在删除的时候，显示正在删除的文件：**

```
$ rm -v !(*.zip|*.odt)
```
![删除除了指定文件扩展的所有文件](http://www.tecmint.com/wp-content/uploads/2016/10/Delete-All-Files-Except-Certain-File-Extensions.png)

*删除除了指定文件扩展的所有文件*

一旦你已经执行了所有需要的命令，你还可以使用如下的方式关闭 extglob shell 选项。

```
$ shopt -u extglob
```

### 使用 Linux 下的 find 命令删除文件

在这种方法下，我们可以[只使用 find 命令][5]的适当的选项或者采用管道配合 `xargs` 命令，如下所示：

```
$ find /directory/ -type f -not -name 'PATTERN' -delete
$ find /directory/ -type f -not -name 'PATTERN' -print0 | xargs -0 -I {} rm {}
$ find /directory/ -type f -not -name 'PATTERN' -print0 | xargs -0 -I {} rm [options] {}
```

**5. 下面的命令将会删除当前目录下除了 `.gz` 之外的所有文件**

```
$ find . -type f -not -name '*.gz' -delete
```
![find 命令 —— 删除 .gz 之外的所有文件](http://www.tecmint.com/wp-content/uploads/2016/10/Remove-All-Files-Except-gz-Files.png)

*find 命令 —— 删除 .gz 之外的所有文件*

**6. 使用管道和 xargs，你可以通过如下的方式修改上面的例子：**

```
$ find . -type f -not -name '*gz' -print0 | xargs -0  -I {} rm -v {}
```
![使用 find 和 xargs 命令删除文件](http://www.tecmint.com/wp-content/uploads/2016/10/Remove-Files-Using-Find-and-Xargs-Command.png)

*使用 find 和 xargs 命令删除文件*

**7. 让我们看一个额外的例子，下面的命令行将会删除掉当前目录下除了 `.gz`、 `.odt` 和 `.jpg` 之外的所有文件：**

```
$ find . -type f -not \(-name '*gz' -or -name '*odt' -or -name '*.jpg' \) -delete
```
![删除除了指定扩展文件的所有文件](http://www.tecmint.com/wp-content/uploads/2016/10/Remove-All-Files-Except-File-Extensions.png)

*删除除了指定扩展文件的所有文件*

### 通过 bash 中的 GLOBIGNORE 变量删除文件

然而，最后的方法，只适用于 bash。 `GLOBIGNORE` 变量存储了一个路径名展开（pathname expansion）功能的忽略模式（或文件名）列表，以冒号分隔。

为了使用这种方法，切换到要删除文件的目录，像下面这样设置 `GLOBIGNORE` 变量：

```
$ cd test
$ GLOBIGNORE=*.odt:*.iso:*.txt
```

在这种情况下，除了 `.odt`、 `.iso` 和 `.txt` 之外的所有文件，都将从当前目录删除。

现在，运行如下的命令清空这个目录：

```
$ rm -v *
```

之后，关闭 `GLOBIGNORE` 变量：

```
$ unset GLOBIGNORE
```
![使用 bash 变量 GLOBIGNORE 删除文件](http://www.tecmint.com/wp-content/uploads/2016/10/Delete-Files-Using-Bash-GlobIgnore.png)

*使用 bash 变量 GLOBIGNORE 删除文件*

注：为了理解上面的命令行采用的标识的意思，请参考我们在每一个插图中使用的命令对应的 man 手册。

就这些了！如果你知道有实现相同目录的其他命令行技术，不要忘了通过下面的反馈部分分享给我们。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/delete-all-files-in-directory-except-one-few-file-extensions/

作者：[Aaron Kili][a]
译者：[yangmingming](https://github.com/yangmingming)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2016/10/Delete-Files-Using-Bash-GlobIgnore.png
[2]:http://www.tecmint.com/wp-content/uploads/2016/10/Remove-All-Files-Except-File-Extensions.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/Remove-Files-Using-Find-and-Xargs-Command.png
[4]:http://www.tecmint.com/wp-content/uploads/2016/10/Remove-All-Files-Except-gz-Files.png
[5]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[6]:http://www.tecmint.com/wp-content/uploads/2016/10/Delete-All-Files-Except-Certain-File-Extensions.png
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/Delete-All-Files-Except-Zip-Files-in-Linux.png
[8]:http://www.tecmint.com/wp-content/uploads/2016/10/Delete-All-Files-Except-Few-Files-in-Linux.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/10/DeleteAll-Files-Except-One-File-in-Linux.png
