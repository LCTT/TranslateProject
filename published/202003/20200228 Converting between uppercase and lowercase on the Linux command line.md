[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11983-1.html)
[#]: subject: (Converting between uppercase and lowercase on the Linux command line)
[#]: via: (https://www.networkworld.com/article/3529409/converting-between-uppercase-and-lowercase-on-the-linux-command-line.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 命令行中转换大小写
======

> 转换文本的大小写可能非常繁琐，尤其是当你要避免无意间的拼写错误时。幸运的是，Linux 提供了一些命令，可以使工作变得非常容易。

![](https://img.linux.net.cn/data/attachment/album/202003/11/095821df7u8nlyfyyydqvf.jpg)

有很多方法可以在 Linux 命令行中将文本从小写更改为大写，反之亦然。实际上，有一组这样的命令可以选择。这篇文章检验了一些最佳的命令来完成这项工作，以及你该如何让它们正常工作。

### 使用 tr

`tr`（translate）命令是在命令行或脚本中最容易使用的命令之一。如果你要确定要一串大写字符串，你只需将它传给 `tr`，如下所示：

```
$ echo Hello There | tr [:lower:] [:upper:]
HELLO THERE
```

下面是一个在脚本中使用这个命令的例子，当你要确保添加到文件中的所有文本都使用大写形式以保持一致性时（LCTT 译注：这里输入部门名称作为示例）：

```
#!/bin/bash

echo -n "Enter department name: "
read dept
echo $dept | tr [:lower:] [:upper:] >> depts
```

将顺序切换为 `[:upper:] [:lower:]` 会产生相反的效果，将所有大写的部门名称都转换为小写：

```
echo $dept | tr [:upper:] [:lower:] >> depts
```

同样，你可以使用 `sed` 命令的 `A-Z` 和 `a-z` 字符串完成相同的操作：

```
echo $dept | tr a-z A-Z >> depts
```

毫无疑问，反转 `a-z` 和 `A-Z` 字符串的顺序将产生相反的效果，将文本全部变为小写。

### 使用 awk

`awk` 命令可让你使用它的 `toupper` 和 `tolower` 选项执行相同的操作。上例脚本中的命令可以用这种方式代替：

```
echo $dept | awk '{print toupper($0)}' >> depts
```

相反操作（切换为小写）如下所示：

```
echo $dept | awk '{print tolower($0)}' >> depts
```

### 使用 sed

`sed`（stream editor）命令也可用于切换大小写。它与上面显示的两个命令中的第一个具有相同的效果。

```
echo $dept | sed 's/[a-z]/\U&/g' >> depts
```

从大写字母切换到小写字母只需将行尾附近的 `U` 替换为 `L`。

```
echo $dept | sed 's/[A-Z]/\L&/g' >> depts
```

### 操作文件中的文本

`awk` 和 `sed` 都能更改整个文件的文本大小写。因此，你发现你的老板需要所有部门名称的小写么？没问题。只需带上文件名运行以下命令：

```
$ awk '{print tolower($0)}' depts
finance
billing
bookkeeping
```

如果要覆盖 `depts` 文件，而不仅仅是以小写形式显示，则需要执行以下操作：

```
$ awk '{print tolower($0)}' depts > depts-
$ mv depts- depts
```

但是，使用 `sed` 进行更改，你可以避免最后一步，因为 `sed` 可以“原地”编辑文件，如下所示，文件完整，但文本全部小写：

```
$ sed 's/[A-Z]/\L&/g' depts
```

### 仅将首字母转换为大写

要仅将字符串中单词的首字母转换为大写，那么可以执行以下操作：

```
$ echo design \& engineering| sed -e "s/\b\(.\)/\u\1/g"
Design & Engineering
```

该命令将确保首字母大写，但不会更改其余字母。

### 确保只有首字母大写

当要更改文本以使只有首字母大写时，这更具挑战性。假设你正在处理一个工作人员姓名列表，并且希望以正常的“名 姓”方式对其格式化。

#### 使用 sed

你可以使用更复杂的 `sed` 命令来确保以下结果：

```
$ echo design \& ENGINEERING | sed 's/\b\([[:alpha:]]\)\([[:alpha:]]*\)\b/\u\1\L\2/g'
Design & Engineering
```

#### 使用 Python

如果你已安装 Python，你可以运行这样的命令，它还可以设置文本格式，以便每个单词只有首字母大写，并且它可能比上面显示的 `sed` 命令更易于解析：

```
$ echo -n "design & engineering" | python3 -c "import sys; print(sys.stdin.read().title())"
Design & Engineering
```

有多种方法可以在大小写之间更改文本格式。哪种方法效果最好取决于你要处理的是单个字符串还是整个文件，以及想要的最终结果。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3529409/converting-between-uppercase-and-lowercase-on-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]:https://images.idgesg.net/images/article/2019/04/alphabetic_letters_characters_language_by_andybrandon50_cc_by-sa_2-0_1500x1000-100794409-large.jpg
[2]: https://creativecommons.org/licenses/by-sa/2.0/legalcode
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
