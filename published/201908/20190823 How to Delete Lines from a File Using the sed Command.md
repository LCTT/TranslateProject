[#]: collector: (lujun9972)
[#]: translator: (hello-wn)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11276-1.html)
[#]: subject: (How to Delete Lines from a File Using the sed Command)
[#]: via: (https://www.2daygeek.com/linux-remove-delete-lines-in-file-sed-command/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何使用 sed 命令删除文件中的行
======

![](https://img.linux.net.cn/data/attachment/album/201908/28/100204ei6v98sa69hdf3zf.jpg)

Sed 代表<ruby>流编辑器<rt>Stream Editor</rt></ruby>，常用于 Linux 中基本的文本处理。`sed` 命令是 Linux 中的重要命令之一，在文件处理方面有着重要作用。可用于删除或移动与给定模式匹配的特定行。

它还可以删除文件中的特定行，它能够从文件中删除表达式，文件可以通过指定分隔符（例如逗号、制表符或空格）进行标识。

本文列出了 15 个使用范例，它们可以帮助你掌握 `sed` 命令。

如果你能理解并且记住这些命令，在你需要使用 `sed` 时，这些命令就能派上用场，帮你节约很多时间。

注意：为了方便演示，我在执行 `sed` 命令时，不使用 `-i` 选项（因为这个选项会直接修改文件内容），被移除了行的文件内容将打印到 Linux 终端。

但是，如果你想在实际环境中从源文件中删除行，请在 `sed` 命令中使用 `-i` 选项。

演示之前，我创建了 `sed-demo.txt` 文件，并添加了以下内容和相应行号以便更好地理解。

```
# cat sed-demo.txt

1 Linux Operating System
2 Unix Operating System
3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 1) 如何删除文件的第一行？

使用以下语法删除文件首行。

`N` 表示文件中的第 N 行，`d` 选项在 `sed` 命令中用于删除一行。

语法：

```
sed 'Nd' file
```

使用以下 `sed` 命令删除 `sed-demo.txt` 中的第一行。

```
# sed '1d' sed-demo.txt

2 Unix Operating System
3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 2) 如何删除文件的最后一行？

使用以下语法删除文件最后一行。

`$` 符号表示文件的最后一行。

使用以下 `sed` 命令删除 `sed-demo.txt` 中的最后一行。

```
# sed '$d' sed-demo.txt

1 Linux Operating System
2 Unix Operating System
3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
```

### 3) 如何删除指定行？

使用以下 `sed` 命令删除 `sed-demo.txt` 中的第 3 行。

```
# sed '3d' sed-demo.txt

1 Linux Operating System
2 Unix Operating System
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 4) 如何删除指定范围内的行？

使用以下 `sed` 命令删除 `sed-demo.txt` 中的第 5 到 7 行。

```
# sed '5,7d' sed-demo.txt

1 Linux Operating System
2 Unix Operating System
3 RHEL
4 Red Hat
8 Debian
9 Ubuntu
10 openSUSE
```

### 5) 如何删除多行内容？

`sed` 命令能够删除给定行的集合。

本例中，下面的 `sed` 命令删除了第 1 行、第 5 行、第 9 行和最后一行。

```
# sed '1d;5d;9d;$d' sed-demo.txt

2 Unix Operating System
3 RHEL
4 Red Hat
6 Arch Linux
7 CentOS
8 Debian
```

### 5a) 如何删除指定范围以外的行？

使用以下 `sed` 命令删除 `sed-demo.txt` 中第 3 到 6 行范围以外的所有行。

```
# sed '3,6!d' sed-demo.txt

3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
```

### 6) 如何删除空行？

使用以下 `sed` 命令删除 `sed-demo.txt` 中的空行。

```
# sed '/^$/d' sed-demo.txt

1 Linux Operating System
2 Unix Operating System
3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 7) 如何删除包含某个模式的行？

使用以下 `sed` 命令删除 `sed-demo.txt` 中匹配到 `System` 模式的行。

```
# sed '/System/d' sed-demo.txt

3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 8) 如何删除包含字符串集合中某个字符串的行？

使用以下 `sed` 命令删除 `sed-demo.txt` 中匹配到 `System` 或 `Linux` 表达式的行。

```
# sed '/System\|Linux/d' sed-demo.txt

3 RHEL
4 Red Hat
5 Fedora
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 9) 如何删除以指定字符开头的行？

为了测试，我创建了 `sed-demo-1.txt` 文件，并添加了以下内容。

```
# cat sed-demo-1.txt

Linux Operating System
Unix Operating System
RHEL
Red Hat
Fedora
debian
ubuntu
Arch Linux - 1
2 - Manjaro
3 4 5 6
```

使用以下 `sed` 命令删除以 `R` 字符开头的所有行。

```
# sed '/^R/d' sed-demo-1.txt

Linux Operating System
Unix Operating System
Fedora
debian
ubuntu
Arch Linux - 1
2 - Manjaro
3 4 5 6
```

使用以下 `sed` 命令删除  `R` 或者 `F` 字符开头的所有行。

```
# sed '/^[RF]/d' sed-demo-1.txt

Linux Operating System
Unix Operating System
debian
ubuntu
Arch Linux - 1
2 - Manjaro
3 4 5 6
```

### 10) 如何删除以指定字符结尾的行？

使用以下 `sed` 命令删除  `m` 字符结尾的所有行。

```
# sed '/m$/d' sed-demo.txt

3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

使用以下 `sed` 命令删除  `x` 或者 `m` 字符结尾的所有行。

```
# sed '/[xm]$/d' sed-demo.txt

3 RHEL
4 Red Hat
5 Fedora
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 11) 如何删除所有大写字母开头的行？

使用以下 `sed` 命令删除所有大写字母开头的行。

```
# sed '/^[A-Z]/d' sed-demo-1.txt

debian
ubuntu
2 - Manjaro
3 4 5 6
```

### 12) 如何删除指定范围内匹配模式的行？

使用以下 `sed` 命令删除第 1 到 6 行中包含 `Linux` 表达式的行。

```
# sed '1,6{/Linux/d;}' sed-demo.txt

2 Unix Operating System
3 RHEL
4 Red Hat
5 Fedora
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 13) 如何删除匹配模式的行及其下一行？

使用以下 `sed` 命令删除包含 `System` 表达式的行以及它的下一行。

```
# sed '/System/{N;d;}' sed-demo.txt

3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 14) 如何删除包含数字的行？

使用以下 `sed` 命令删除所有包含数字的行。

```
# sed '/[0-9]/d' sed-demo-1.txt

Linux Operating System
Unix Operating System
RHEL
Red Hat
Fedora
debian
ubuntu
```

使用以下 `sed` 命令删除所有以数字开头的行。

```
# sed '/^[0-9]/d' sed-demo-1.txt

Linux Operating System
Unix Operating System
RHEL
Red Hat
Fedora
debian
ubuntu
Arch Linux - 1
```

使用以下 `sed` 命令删除所有以数字结尾的行。

```
# sed '/[0-9]$/d' sed-demo-1.txt

Linux Operating System
Unix Operating System
RHEL
Red Hat
Fedora
debian
ubuntu
2 - Manjaro
```

### 15) 如何删除包含字母的行？

使用以下 `sed` 命令删除所有包含字母的行。

```
# sed '/[A-Za-z]/d' sed-demo-1.txt

3 4 5 6
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-remove-delete-lines-in-file-sed-command/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[hello-wn](https://github.com/hello-wn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
