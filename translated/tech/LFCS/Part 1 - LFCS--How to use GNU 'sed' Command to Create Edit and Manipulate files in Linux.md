Translating by Xuanwo

Part 1 - LFCS: How to use GNU ‘sed’ Command to Create, Edit, and Manipulate files in Linux
LFCS系列第一讲：如何在Linux上使用GNU'sed'命令来创建、编辑和操作文件
================================================================================
Linux基金会宣布了一个全新的LFCS（Linux Foundation Certified Sysadmin，Linux基金会认证系统管理员）认证计划。这一计划旨在帮助遍布全世界的人们获得其在处理Linux系统管理任务上能力的认证。这些能力包括支持运行的系统服务，以及第一手的故障诊断和分析和为工程师团队在升级时提供智能决策。

![Linux Foundation Certified Sysadmin](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-1.png)

Linux基金会认证系统管理员——第一讲

请观看下面关于Linux基金会认证计划的演示：

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

该系列将命名为《LFCS预备第一讲》至《LFCS预备第十讲》并覆盖关于Ubuntu，CentOS以及openSUSE的下列话题。

- 第一讲：如何在Linux上使用GNU'sed'命令来创建、编辑和操作文件
- 第二讲：如何安装和使用vi/m全功能文字编辑器
- 第三讲：归档文件/目录和在文件系统中寻找文件
- 第四讲：为存储设备分区，格式化文件系统和配置交换分区
- 第五讲：在Linux中挂载/卸载本地和网络（Samba & NFS）文件系统
- 第六讲：组合分区作为RAID设备——创建&管理系统备份
- 第七讲：管理系统启动进程和服务（使用SysVinit, Systemd 和 Upstart）
- 第八讲：管理用户和组，文件权限和属性以及启用账户的sudo权限
- 第九讲：Linux包管理与Yum，RPM，Apt，Dpkg，Aptitude，Zypper
- 第十讲：学习简单的Shell脚本和文件系统故障排除

本文是覆盖这个参加LFCS认证考试的所必需的范围和能力的十个教程的第一讲。话虽如此，快打开你的终端，让我们开始吧！

### 处理Linux中的文本流 ###

Linux将程序中的输入和输出当成字符流或者字符序列。在开始理解重定向和管道之前，我们必须先了解三种最重要的I/O（Input and Output，输入和输出）流，事实上，它们都是特殊的文件（根据UNIX和Linux中的约定，数据流和外围设备或者设备文件也被视为普通文件）。

> (重定向操作符) 和 | (管道操作符)之间的区别是：前者将命令与文件相连接，而后者将命令的输出和另一个命令相连接。

    # command > file
    # command1 | command2

由于重定向操作符静默创建或覆盖文件，我们必须特别小心谨慎地使用它，并且永远不要把它和管道混淆起来。在Linux和UNIX系统上管道的优势是：第一个命令的输出不会写入一个文件而是直接被第二个命令读取。

在下面的操作练习中，我们将会使用这首诗——《A happy child》（匿名作者)

![cat command](http://www.tecmint.com/wp-content/uploads/2014/10/cat-command.png)

cat command example

#### 使用 sed ####

sed是流编辑器（stream editor）的缩写。为那些不懂术语的人额外解释一下，流编辑器是用来在一个输入流（文件或者管道中的输入）执行基本的文本转换的工具。

sed最基本的用法是字符替换。我们将通过把每个出现的小写y改写为大写Y并且将输出重定向到ahappychild2.txt开始。g标志表示sed应该替换文件每一行中所有应当替换的实例。如果这个标志省略了，sed将会只替换每一行中第一次出现的实例。

**基本语法：**

    # sed ‘s/term/replacement/flag’ file

**我们的样例：**

    # sed ‘s/y/Y/g’ ahappychild.txt > ahappychild2.txt

![sed command](http://www.tecmint.com/wp-content/uploads/2014/10/sed-command.png)

sed command example

如果你要在替换文本中搜索或者替换特殊字符（如/，\，＆），你需要使用反斜杠对它进行转义。

例如，我们将会用一个符号来替换一个文字。与此同时，我们将把一行最开始出现的第一个I替换为You。

    # sed 's/and/\&/g;s/^I/You/g' ahappychild.txt

![sed replace string](http://www.tecmint.com/wp-content/uploads/2014/10/sed-replace-string.png)

sed replace string

在上面的命令中，^（插入符号）是众所周知用来表示一行开头的正则表达式。

正如你所看到的，我们可以通过使用分号分隔以及用括号包裹来把两个或者更多的替换命令（并在他们中使用正则表达式）链接起来。

Another use of sed is showing (or deleting) a chosen portion of a file. In the following example, we will display the first 5 lines of /var/log/messages from Jun 8.

    # sed -n '/^Jun  8/ p' /var/log/messages | sed -n 1,5p

Note that by default, sed prints every line. We can override this behaviour with the -n option and then tell sed to print (indicated by p) only the part of the file (or the pipe) that matches the pattern (Jun 8 at the beginning of line in the first case and lines 1 through 5 inclusive in the second case).

Finally, it can be useful while inspecting scripts or configuration files to inspect the code itself and leave out comments. The following sed one-liner deletes (d) blank lines or those starting with # (the | character indicates a boolean OR between the two regular expressions).

    # sed '/^#\|^$/d' apache2.conf

![sed match string](http://www.tecmint.com/wp-content/uploads/2014/10/sed-match-string.png)

sed match string

#### uniq Command ####

The uniq command allows us to report or remove duplicate lines in a file, writing to stdout by default. We must note that uniq does not detect repeated lines unless they are adjacent. Thus, uniq is commonly used along with a preceding sort (which is used to sort lines of text files). By default, sort takes the first field (separated by spaces) as key field. To specify a different key field, we need to use the -k option.

**Examples**

The du –sch /path/to/directory/* command returns the disk space usage per subdirectories and files within the specified directory in human-readable format (also shows a total per directory), and does not order the output by size, but by subdirectory and file name. We can use the following command to sort by size.

    # du -sch /var/* | sort –h

![sort command](http://www.tecmint.com/wp-content/uploads/2014/10/sort-command.jpg)

sort command example

You can count the number of events in a log by date by telling uniq to perform the comparison using the first 6 characters (-w 6) of each line (where the date is specified), and prefixing each output line by the number of occurrences (-c) with the following command.

    # cat /var/log/mail.log | uniq -c -w 6

![Count Numbers in File](http://www.tecmint.com/wp-content/uploads/2014/10/count-numbers-in-file.jpg)

Count Numbers in File

Finally, you can combine sort and uniq (as they usually are). Consider the following file with a list of donors, donation date, and amount. Suppose we want to know how many unique donors there are. We will use the following command to cut the first field (fields are delimited by a colon), sort by name, and remove duplicate lines.

    # cat sortuniq.txt | cut -d: -f1 | sort | uniq

![Find Unique Records in File](http://www.tecmint.com/wp-content/uploads/2014/10/find-uniqu-records-in-file.jpg)

Find Unique Records in File

- Read Also: [13 “cat” Command Examples][1]

#### grep Command ####

grep searches text files or (command output) for the occurrence of a specified regular expression and outputs any line containing a match to standard output.

**Examples**

Display the information from /etc/passwd for user gacanepa, ignoring case.

    # grep -i gacanepa /etc/passwd

![grep Command](http://www.tecmint.com/wp-content/uploads/2014/10/grep-command.jpg)

grep command example

Show all the contents of /etc whose name begins with rc followed by any single number.

    # ls -l /etc | grep rc[0-9]

![List Content Using grep](http://www.tecmint.com/wp-content/uploads/2014/10/list-content-using-grep.jpg)

List Content Using grep

- Read Also: [12 “grep” Command Examples][2]

#### tr Command Usage ####

The tr command can be used to translate (change) or delete characters from stdin, and write the result to stdout.

**Examples**

Change all lowercase to uppercase in sortuniq.txt file.

    # cat sortuniq.txt | tr [:lower:] [:upper:]

![Sort Strings in File](http://www.tecmint.com/wp-content/uploads/2014/10/sort-strings.jpg)

Sort Strings in File

Squeeze the delimiter in the output of ls –l to only one space.

    # ls -l | tr -s ' '

![Squeeze Delimiter](http://www.tecmint.com/wp-content/uploads/2014/10/squeeze-delimeter.jpg)

Squeeze Delimiter

#### cut Command Usage ####

The cut command extracts portions of input lines (from stdin or files) and displays the result on standard output, based on number of bytes (-b option), characters (-c), or fields (-f). In this last case (based on fields), the default field separator is a tab, but a different delimiter can be specified by using the -d option.

**Examples**

Extract the user accounts and the default shells assigned to them from /etc/passwd (the –d option allows us to specify the field delimiter, and the –f switch indicates which field(s) will be extracted.

    # cat /etc/passwd | cut -d: -f1,7

![Extract User Accounts](http://www.tecmint.com/wp-content/uploads/2014/10/extract-user-accounts.jpg)

Extract User Accounts

Summing up, we will create a text stream consisting of the first and third non-blank files of the output of the last command. We will use grep as a first filter to check for sessions of user gacanepa, then squeeze delimiters to only one space (tr -s ‘ ‘). Next, we’ll extract the first and third fields with cut, and finally sort by the second field (IP addresses in this case) showing unique.

    # last | grep gacanepa | tr -s ‘ ‘ | cut -d’ ‘ -f1,3 | sort -k2 | uniq

![last command](http://www.tecmint.com/wp-content/uploads/2014/10/last-command.png)

last command example

The above command shows how multiple commands and pipes can be combined so as to obtain filtered data according to our desires. Feel free to also run it by parts, to help you see the output that is pipelined from one command to the next (this can be a great learning experience, by the way!).

### Summary ###

Although this example (along with the rest of the examples in the current tutorial) may not seem very useful at first sight, they are a nice starting point to begin experimenting with commands that are used to create, edit, and manipulate files from the Linux command line. Feel free to leave your questions and comments below – they will be much appreciated!

#### Reference Links ####

- [About the LFCS][3]
- [Why get a Linux Foundation Certification?][4]
- [Register for the LFCS exam][5]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[2]:http://www.tecmint.com/12-practical-examples-of-linux-grep-command/
[3]:https://training.linuxfoundation.org/certification/LFCS
[4]:https://training.linuxfoundation.org/certification/why-certify-with-us
[5]:https://identity.linuxfoundation.org/user?destination=pid/1