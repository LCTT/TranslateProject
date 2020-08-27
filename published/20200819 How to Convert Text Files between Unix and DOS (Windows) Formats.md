[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12558-1.html)
[#]: subject: (How to Convert Text Files between Unix and DOS Windows Formats)
[#]: via: (https://www.2daygeek.com/how-to-convert-text-files-between-unix-and-dos-windows-formats/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何将文本文件在 Unix 和 DOS（Windows）格式之间转换
======

![](https://img.linux.net.cn/data/attachment/album/202008/27/235550klfnz34lzpnchf7g.jpg)

作为一名 Linux 管理员，你可能已经注意到了一些开发者请求将文件从 DOS 格式转换为 Unix 格式，反之亦然。

这是因为这些文件是在 Windows 系统上创建的，并由于某种原因被复制到 Linux 系统上。

这本身没什么问题，但 Linux 系统上的一些应用可能不能理解这些新的换行符，所以在使用之前，你需要转换它们。

DOS 文本文件带有回车（`CR` 或 `\r`）和换行（`LF` 或 `\n`）一对字符作为它们的换行符，而 Unix 文本只有换行（`LF`）符。

有很多方法可以将 DOS 文本文件转换为 Unix 格式。

但我推荐使用一个名为 `dos2unix` / `unix2dos` 的特殊工具将文本在 DOS 和 Unix 格式之间转换。

  * `dos2unix`：将文本文件从 DOS 格式转换为 Unix 格式。
  * `unix2dos`：将文本文件从 Unix 格式转换为 DOS 格式。
  * `tr`、`awk` 和 [sed 命令][1]：这些可以用于相同的目的。

使用 `od`（<ruby>八进制转储<rt>octal dump</rt></ruby>）命令可以很容易地识别文件是 DOS 格式还是 Unix 格式，如下图所示：

```
# od -bc windows.txt
0000000 125 156 151 170 040 151 163 040 141 040 146 162 145 145 040 157
U n i x i s a f r e e o
0000020 160 145 156 163 157 165 162 143 145 040 157 160 145 162 141 164
p e n s o u r c e o p e r a t
0000040 151 156 147 040 163 171 163 164 145 155 015 012 123 165 160 145
i n g s y s t e m \r \n S u p e
0000060 162 040 143 157 155 160 165 164 145 162 163 040 141 162 145 040
r c o m p u t e r s a r e
0000100 162 165 156 156 151 156 147 040 157 156 040 125 116 111 130 015
r u n n i n g o n U N I X \r
0000120 012 071 065 045 040 157 146 040 167 145 142 163 151 164 145 163
\n 9 5 % o f w e b s i t e s
0000140 040 141 162 145 040 162 165 156 156 151 156 147 040 157 156 040
a r e r u n n i n g o n
0000160 114 151 156 165 170 040 117 123 015 012 101 156 171 164 150 151
L i n u x O S \r \n A n y t h i
0000200 156 147 040 143 141 156 040 142 145 040 144 157 156 145 040 157
n g c a n b e d o n e o
0000220 156 040 114 151 156 165 170 015 012
n L i n u x \r \n
0000231
```

上面的输出清楚地表明这是一个 DOS 格式的文件，因为它包含了转义序列 `\r\n`。

同时，当你在终端上打印文件输出时，你会得到下面的输出：

```
# cat windows.txt
Unix is a free opensource operating system
Super computers are running on UNIX
95% of websites are running on Linux OS
Anything can be done on Linux
```

### 如何在 Linux 上安装 dos2unix？

`dos2unix` 可以很容易地从发行版的官方仓库中安装。

对于 RHEL/CentOS 6/7 系统，使用 [yum 命令][2] 安装 `dos2unix`。

```
$ sudo yum install -y dos2unix
```

对于 RHEL/CentOS 8 和 Fedora 系统，使用 [dnf 命令][3] 安装 `dos2unix`。

```
$ sudo yum install -y dos2unix
```

对于基于 Debian 的系统，使用 [apt 命令][4] 或 [apt-get 命令][5] 来安装 `dos2unix`。

```
$ sudo apt-get update
$ sudo apt-get install dos2unix
```

对于 openSUSE 系统，使用 [zypper命令][6] 安装 `dos2unix`。

```
$ sudo zypper install -y dos2unix
```

### 1）如何将 DOS 文件转换为 UNIX 格式？

以下命令将 `windows.txt` 文件从 DOS 转换为 Unix 格式。

对该文件的修改是删除文件每行的 `\r`。

```
# dos2unix windows.txt
dos2unix: converting file windows.txt to Unix format …
```

```
# cat windows.txt
0000000 125 156 151 170 040 151 163 040 141 040 146 162 145 145 040 157
U n i x i s a f r e e o
0000020 160 145 156 163 157 165 162 143 145 040 157 160 145 162 141 164
p e n s o u r c e o p e r a t
0000040 151 156 147 040 163 171 163 164 145 155 012 123 165 160 145 162
i n g s y s t e m \n S u p e r
0000060 040 143 157 155 160 165 164 145 162 163 040 141 162 145 040 162
c o m p u t e r s a r e r
0000100 165 156 156 151 156 147 040 157 156 040 125 116 111 130 012 071
u n n i n g o n U N I X \n 9
0000120 065 045 040 157 146 040 167 145 142 163 151 164 145 163 040 141
5 % o f w e b s i t e s a
0000140 162 145 040 162 165 156 156 151 156 147 040 157 156 040 114 151
r e r u n n i n g o n L i
0000160 156 165 170 040 117 123 012 101 156 171 164 150 151 156 147 040
n u x O S \n A n y t h i n g
0000200 143 141 156 040 142 145 040 144 157 156 145 040 157 156 040 114
c a n b e d o n e o n L
0000220 151 156 165 170 012
i n u x \n
0000225
```

上面的命令将覆盖原始文件。

如果你想保留原始文件，请使用以下命令。这将把转换后的输出保存为一个新文件。

```
# dos2unix -n windows.txt unix.txt
dos2unix: converting file windows.txt to file unix.txt in Unix format …
```

#### 1a）如何使用 tr 命令将 DOS 文件转换为 UNIX 格式。

正如文章开头所讨论的，你可以如下所示使用 `tr` 命令将 DOS 文件转换为 Unix 格式。

```
Syntax: tr -d '\r' < source_file > output_file
```

下面的 `tr` 命令将 DOS 格式的文件 `windows.txt` 转换为 Unix 格式文件 `unix.txt`。

```
# tr -d '\r' < windows.txt >unix.txt
```

注意：不能使用 `tr` 命令将文件从 Unix 格式转换为 Windows（DOS）。

#### 1b）如何使用 awk 命令将 DOS 文件转换为 UNIX 格式。

使用以下 `awk` 命令格式将 DOS 文件转换为 Unix 格式。

```
Syntax: awk '{ sub("\r$", ""); print }' source_file.txt > output_file.txt
```

以下 `awk` 命令将 DOS 文件 `windows.txt` 转换为 Unix 格式文件 `unix.txt`。

```
# awk '{ sub("\r$", ""); print }' windows.txt > unix.txt
```

### 2）如何将 UNIX 文件转换为 DOS 格式？

当你把一个文件从 UNIX 转换为 DOS 格式时，它会在每一行中添加一个回车（`CR` 或 `\r`）。

```
# unix2dos unix.txt
unix2dos: converting file unix.txt to DOS format …
```

该命令将保留原始文件。

```
# unix2dos -n unix.txt windows.txt
unix2dos: converting file unix.txt to file windows.txt in DOS format …
```

#### 2a）如何使用 awk 命令将 UNIX 文件转换为 DOS 格式？

使用以下 `awk` 命令格式将 UNIX 文件转换为 DOS 格式。

```
Syntax: awk 'sub("$", "\r")' source_file.txt > output_file.txt
```

下面的 `awk` 命令将 `unix.txt` 文件转换为 DOS 格式文件 `windows.txt`。

```
# awk 'sub("$", "\r")' unix.txt > windows.txt
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-convert-text-files-between-unix-and-dos-windows-formats/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-sed-to-find-and-replace-string-in-files/
[2]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[3]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[6]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
