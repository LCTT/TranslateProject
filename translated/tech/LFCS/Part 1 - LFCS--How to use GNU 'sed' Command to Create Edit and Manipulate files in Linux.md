Translating by Xuanwo

LFCS系列第一讲：如何在Linux上使用GNU'sed'命令来创建、编辑和操作文件
================================================================================
Linux基金会宣布了一个全新的LFCS（Linux Foundation Certified Sysadmin，Linux基金会认证系统管理员）认证计划。这一计划旨在帮助遍布全世界的人们获得其在处理Linux系统管理任务上能力的认证。这些能力包括支持运行的系统服务，以及第一手的故障诊断和分析和为工程师团队在升级时提供智能决策。

![Linux Foundation Certified Sysadmin](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-1.png)

Linux基金会认证系统管理员——第一讲

请观看下面关于Linux基金会认证计划的演示：

<embed src="http://static.video.qq.com/TPout.swf?vid=l0163eohhs9&auto=0" allowFullScreen="true" quality="high" width="480" height="400" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>

该系列将命名为《LFCS系列第一讲》至《LFCS系列第十讲》并覆盖关于Ubuntu，CentOS以及openSUSE的下列话题。

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

本文是覆盖这个参加LFCS认证考试的所必需的范围和能力的十个教程的第一讲。话说了那么多，快打开你的终端，让我们开始吧！

### 处理Linux中的文本流 ###

Linux将程序中的输入和输出当成字符流或者字符序列。在开始理解重定向和管道之前，我们必须先了解三种最重要的I/O（Input and Output，输入和输出）流，事实上，它们都是特殊的文件（根据UNIX和Linux中的约定，数据流和外围设备或者设备文件也被视为普通文件）。

> (重定向操作符) 和 | (管道操作符)之间的区别是：前者将命令与文件相连接，而后者将命令的输出和另一个命令相连接。

    # command > file
    # command1 | command2

由于重定向操作符静默创建或覆盖文件，我们必须特别小心谨慎地使用它，并且永远不要把它和管道混淆起来。在Linux和UNIX系统上管道的优势是：第一个命令的输出不会写入一个文件而是直接被第二个命令读取。

在下面的操作练习中，我们将会使用这首诗——《A happy child》（匿名作者)

![cat command](http://www.tecmint.com/wp-content/uploads/2014/10/cat-command.png)

cat 命令样例

#### 使用 sed ####

sed是流编辑器（stream editor）的缩写。为那些不懂术语的人额外解释一下，流编辑器是用来在一个输入流（文件或者管道中的输入）执行基本的文本转换的工具。

sed最基本的用法是字符替换。我们将通过把每个出现的小写y改写为大写Y并且将输出重定向到ahappychild2.txt开始。g标志表示sed应该替换文件每一行中所有应当替换的实例。如果这个标志省略了，sed将会只替换每一行中第一次出现的实例。

**基本语法：**

    # sed ‘s/term/replacement/flag’ file

**我们的样例：**

    # sed ‘s/y/Y/g’ ahappychild.txt > ahappychild2.txt

![sed command](http://www.tecmint.com/wp-content/uploads/2014/10/sed-command.png)

sed 命令样例

如果你要在替换文本中搜索或者替换特殊字符（如/，\，＆），你需要使用反斜杠对它进行转义。

例如，我们将会用一个符号来替换一个文字。与此同时，我们将把一行最开始出现的第一个I替换为You。

    # sed 's/and/\&/g;s/^I/You/g' ahappychild.txt

![sed replace string](http://www.tecmint.com/wp-content/uploads/2014/10/sed-replace-string.png)

sed 替换字符串

在上面的命令中，^（插入符号）是众所周知用来表示一行开头的正则表达式。

正如你所看到的，我们可以通过使用分号分隔以及用括号包裹来把两个或者更多的替换命令（并在他们中使用正则表达式）链接起来。

另一种sed的用法是显示或者删除文件中选中的一部分。在下面的样例中，将会显示/var/log/messages中从6月8日开始的头五行。

    # sed -n '/^Jun  8/ p' /var/log/messages | sed -n 1,5p

请注意，在默认的情况下，sed会打印每一行。我们可以使用-n选项来覆盖这一行为并且告诉sed只需要打印（用p来表示）文件（或管道）中匹配的部分（第一种情况下行开头的第一个6月8日以及第二种情况下的一到五行*此处翻译欠妥，需要修正*）。

最后，可能有用的技巧是当检查脚本或者配置文件的时候可以保留文件本身并且删除注释。下面的单行sed命令删除（d）空行或者是开头为`#`的行（|字符返回两个正则表达式之间的布尔值）。

    # sed '/^#\|^$/d' apache2.conf

![sed match string](http://www.tecmint.com/wp-content/uploads/2014/10/sed-match-string.png)

sed 匹配字符串

#### uniq C命令 ####

uniq命令允许我们返回或者删除文件中重复的行，默认写入标准输出。我们必须注意到，除非两个重复的行相邻，否则uniq命令不会删除他们。因此，uniq经常和前序排序（此处翻译欠妥）（一种用来对文本行进行排序的算法）搭配使用。默认情况下，排序使用第一个字段（用空格分隔）作为关键字段。要指定一个不同的关键字段，我们需要使用-k选项。

**样例**

du –sch /path/to/directory/* 命令将会以人类可读的格式返回在指定目录下每一个子文件夹和文件的磁盘空间使用情况（也会显示每个目录总体的情况），而且不是按照大小输出，而是按照子文件夹和文件的名称。我们可以使用下面的命令来让它通过大小排序。

    # du -sch /var/* | sort –h

![sort command](http://www.tecmint.com/wp-content/uploads/2014/10/sort-command.jpg)

sort 命令样例

你可以通过使用下面的命令告诉uniq比较每一行的前6个字符（-w 6）（指定了不同的日期）来统计日志事件的个数，而且在每一行的开头输出出现的次数（-c）。


    # cat /var/log/mail.log | uniq -c -w 6

![Count Numbers in File](http://www.tecmint.com/wp-content/uploads/2014/10/count-numbers-in-file.jpg)

统计文件中数字

最后，你可以组合使用sort和uniq命令（通常如此）。考虑下面文件中捐助者，捐助日期和金额的列表。假设我们想知道有多少个捐助者。我们可以使用下面的命令来分隔第一字段（字段由冒号分隔），按名称排序并且删除重复的行。

    # cat sortuniq.txt | cut -d: -f1 | sort | uniq

![Find Unique Records in File](http://www.tecmint.com/wp-content/uploads/2014/10/find-uniqu-records-in-file.jpg)

寻找文件中不重复的记录

- 也可阅读: [13个“cat”命令样例][1]

#### grep 命令 ####

grep在文件（或命令输出）中搜索指定正则表达式并且在标准输出中输出匹配的行。

**样例**

显示文件/etc/passwd中用户gacanepa的信息，忽略大小写。

    # grep -i gacanepa /etc/passwd

![grep Command](http://www.tecmint.com/wp-content/uploads/2014/10/grep-command.jpg)

grep 命令样例

显示/etc文件夹下所有rc开头并跟随任意数字的内容。

    # ls -l /etc | grep rc[0-9]

![List Content Using grep](http://www.tecmint.com/wp-content/uploads/2014/10/list-content-using-grep.jpg)

使用grep列出内容

- 也可阅读: [12个“grep”命令样例][2]

#### tr 命令使用技巧 ####

tr命令可以用来从标准输入中翻译（改变）或者删除字符并将结果写入到标准输出中。

**样例**

把sortuniq.txt文件中所有的小写改为大写。

    # cat sortuniq.txt | tr [:lower:] [:upper:]

![Sort Strings in File](http://www.tecmint.com/wp-content/uploads/2014/10/sort-strings.jpg)

排序文件中的字符串

压缩`ls –l`输出中的定界符至一个空格。
    # ls -l | tr -s ' '

![Squeeze Delimiter](http://www.tecmint.com/wp-content/uploads/2014/10/squeeze-delimeter.jpg)

压缩分隔符

#### cut 命令使用方法 ####

cut命令可以基于字节数（-b选项），字符（-c）或者字段（-f）提取部分输入（从标准输入或者文件中）并且将结果输出到标准输出。在最后一种情况下（基于字段），默认的字段分隔符是一个tab，但不同的分隔符可以由-d选项来指定。

**样例**

从/etc/passwd中提取用户账户和他们被分配的默认shell（-d选项允许我们指定分界符，-f选项指定那些字段将被提取）。

    # cat /etc/passwd | cut -d: -f1,7

![Extract User Accounts](http://www.tecmint.com/wp-content/uploads/2014/10/extract-user-accounts.jpg)

提取用户账户

总结一下，我们将使用最后一个命令的输出中第一和第三个非空文件创建一个文本流。我们将使用grep作为第一过滤器来检查用户gacanepa的会话，然后将分隔符压缩至一个空格（tr -s ' ')。下一步，我们将使用cut来提取第一和第三个字段，最后使用第二个字段（本样例中，指的是IP地址）来排序之后再用uniq去重。

    # last | grep gacanepa | tr -s ‘ ‘ | cut -d’ ‘ -f1,3 | sort -k2 | uniq

![last command](http://www.tecmint.com/wp-content/uploads/2014/10/last-command.png)

last 命令样例

上面的命令显示了如何将多个命令和管道结合起来以便根据我们的愿望得到过滤后的数据。你也可以逐步地使用它以帮助你理解输出是如何从一个命令传输到下一个命令的（顺便说一句，这是一个非常好的学习经验！）

### 总结 ###

尽管这个例子（以及在当前教程中的其他实例）第一眼看上去可能不是非常有用，但是他们是体验在Linux命令行中创建，编辑和操作文件的一个非常好的开始。请随时留下你的问题和意见——不胜感激！

#### 参考链接 ####

- [关于LFCS][3]
- [为什么需要Linux基金会认证?][4]
- [注册LFCS考试][5]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/

作者：[Gabriel Cánepa][a]
译者：[Xuanwo](https://github.com/Xuanwo)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[2]:http://www.tecmint.com/12-practical-examples-of-linux-grep-command/
[3]:https://training.linuxfoundation.org/certification/LFCS
[4]:https://training.linuxfoundation.org/certification/why-certify-with-us
[5]:https://identity.linuxfoundation.org/user?destination=pid/1