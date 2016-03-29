LFCS 系列第三讲：归档/压缩文件及目录、设置文件属性和搜索文件
================================================================================

最近，Linux 基金会发起了一个全新的 LFCS（Linux Foundation Certified Sysadmin，Linux 基金会认证系统管理员）认证，旨在让遍布全世界的人都有机会参加该认证的考试，通过考试的人将表明他们有能力在 Linux 上执行基本的中级系统管理任务。这项认证包括了对已运行的系统和服务的支持、一流水平的问题解决和分析以及决定何时将问题反映给工程师团队的能力。

![Linux Foundation Certified Sysadmin – Part 3](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-3.png)

*LFCS 系列第三讲*

请看以下视频，这里边讲给出 Linux 基金会认证程序的一些想法。

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

本讲是系列教程中的第三讲，在这一讲中，我们会涵盖如何在文件系统中归档/压缩文件及目录、设置文件属性和搜索文件等内容，这些都是 LFCS 认证中必须掌握的知识。

### 归档和压缩的相关工具 ###

文件归档工具将一堆文件整合到一个单独的归档文件之后，我们可以将归档文件备份到不同类型的介质或者通过网络传输和发送 Email 来备份。在 Linux 中使用频率最高的归档实用工具是 tar。当归档工具和压缩工具一起使用的时候，可以减少同一文件和信息在硬盘中的存储空间。

#### tar 使用工具 ####

tar 将一组文件打包到一个单独的归档文件（通常叫做 tar 文件或者 tarball）。tar 这个名称最初代表磁带存档程序（tape archiver），但现在我们可以用它来归档任意类型的可读写介质上边的数据，而不是只能归档磁带数据。tar 通常与 gzip、bzip2 或者 xz 等压缩工具一起使用，生成一个压缩的 tarball。

**基本语法：**

    # tar [选项] [路径名 ...]

其中 ... 代表指定哪些文件进行归档操作的表达式

#### tar 的常用命令 ####


|长选项|简写|描述|
|-----|:---:|:---|
| -create| c| 创建 tar 归档文件|
| -concatenate| A| 将一存档与已有的存档合并|
| -append| r| 把要存档的文件追加到归档文件的末尾|
| -update| u| 更新新文件到归档文件中去|
| -diff 或 -compare| d| 比较存档与当前文件的不同之处|
| -file archive| f| 使用档案文件或归档设备|
| -list| t| 列出 tarball 中的内容|
| -extract 或 -get| x| 从归档文件中释放文件|


#### 常用的操作修饰符 ####

注：表格

|长选项|缩写|描述|
|-----|:--:|:--|
| -directory dir| C| 执行归档操作前，先转到指定目录|
| -same-permissions| p| 保持原始的文件权限|
| -verbose| v| 列出所有的读取或提取的文件。但这个标识符与 -list 一起使用的时候，还会显示出文件大小、属主和时间戳的信息|
| -verify| W| 写入存档后进行校验|
| -exclude file| | 不把指定文件包含在内|
| -exclude=pattern| X| 以PATTERN模式排除文件|
| -gzip 或 -gunzip| z| 通过gzip压缩归档|
| -bzip2| j| 通过bzip2压缩归档|
| -xz| J| 通过xz压缩归档|


Gzip 是最古老的压缩工具，压缩率最小，bzip2 的压缩率稍微高一点。另外，xz 是最新的压缩工具，压缩率最好。xz 具有最佳压缩率的代价是：完成压缩操作花费最多时间，压缩过程中占有较多系统资源。

通常，通过这些工具压缩的 tar 文件相应的具有 .gz、.bz2 或 .xz的扩展名。在下列的例子中，我们使用 file1、file2、file3、file4 和 file5 进行演示。

**通过 gzip、bzip2 和 xz 压缩归档**

归档当前工作目录的所有文件，并以 gzip、bzip2 和 xz 压缩刚刚的归档文件（请注意，用正则表达式来指定哪些文件应该归档——这是为了防止将归档工具包前一步生成的文件打包进来）。

    # tar czf myfiles.tar.gz file[0-9]
    # tar cjf myfiles.tar.bz2 file[0-9]
    # tar cJf myfile.tar.xz file[0-9]

![Compress Multiple Files Using tar](http://www.tecmint.com/wp-content/uploads/2014/10/Compress-Multiple-Files.png)

*压缩多个文件*

**列举 tarball 中的内容和更新/追加文件到归档文件中**

列举 tarball 中的内容，并显示相同信息为一个详细目录清单。注意，不能直接向压缩的归档文件更新/追加文件（若你需要向压缩的 tarball 中更新/追加文件，需要先解压 tar 文件后再进行操作，然后重新压缩）。

    # tar tvf [tarball]

![Check Files in tar Archive](http://www.tecmint.com/wp-content/uploads/2014/10/List-Archive-Content.png)

*列举归档文件中的内容*

运行一下任意一条命令：

    # gzip -d myfiles.tar.gz	[#1]
    # bzip2 -d myfiles.tar.bz2	[#2]
    # xz -d myfiles.tar.xz 		[#3]

然后：

    # tar --delete --file myfiles.tar file4 (删除tarball中的file4)
    # tar --update --file myfiles.tar file4 (更新tarball中的file4)

和

    # gzip myfiles.tar		[ 如果你运行 #1 命令 ]
    # bzip2 myfiles.tar		[ 如果你运行 #2 命令 ]
    # xz myfiles.tar 		[ 如果你运行 #3 命令 ]

最后

    # tar tvf [tarball] #again

将 file4 修改后的日期和时间与之前显示的对应信息进行比较

**排除文件类型**

假设你现在需要备份用户的家目录。一个有经验的系统管理员会选择忽略所有视频和音频文件再备份（也可能是公司规定）。

可能你最先想到的方法是在备份的时候，忽略扩展名为 .mp3 和 .mp4（或者其他格式）的文件。但如果你有些自作聪明的用户将扩展名改为 .txt 或者 .bkp，那你的方法就不灵了。为了发现并排除音频或者视频文件，你需要先检查文件类型。以下 shell 脚本可以代你完成类型检查：

    #!/bin/bash
    # 把需要进行备份的目录传递给 $1 参数.
    DIR=$1
	# 排除文件类型中包含了 mpeg 字符串的文件，然后创建 tarball 并进行压缩。
    # -若文件类型中包含 mpeg 字符串， $?（最后执行的命令的退出状态）返回 0，然后文件名被定向到排除选项。否则返回 1。
    # -若 $? 等于 0，该文件从需要备份文件的列表排除。
    tar X <(for i in $DIR/*; do file $i | grep -i mpeg; if [ $? -eq 0 ]; then echo $i; fi;done) -cjf backupfile.tar.bz2 $DIR/*

![Exclude Files in tar Archive](http://www.tecmint.com/wp-content/uploads/2014/10/Exclude-Files-in-Tar.png)

*排除文件进行备份*

**使用 tar 保持文件的原有权限进行恢复**

通过以下命令，你可以保留文件的权限将备份文件恢复到原始用户的家目录（本例是 user_restore）。

    # tar xjf backupfile.tar.bz2 --directory user_restore --same-permissions

![Restore Files from tar Archive](http://www.tecmint.com/wp-content/uploads/2014/10/Restore-tar-Backup-Files.png)

*从归档文件中恢复*

**扩展阅读：**

- [18 tar Command Examples in Linux][1]
- [Dtrx – An Intelligent Archive Tool for Linux][2]

### 通过 find 命令搜索文件 ###

find 命令用于递归搜索目录树中包含指定字符的文件和目录，然后在屏幕显示出于指定字符相匹配的文件和目录，或者在匹配项进行其他操作。

通常，我们通过文件名、文件的属主、属组、类型权限、日期及大小来搜索。

#### 基本语法：####

	# find [需搜索的目录] [表达式]

**通过文件大小递归搜索文件**

以下命令会搜索当前目录（.）及其下两层子目录（-maxdepth 3，包含当前目录及往下两层的子目录）中大于 2 MB（-size +2M）的所有文件（-f）。

    # find . -maxdepth 3 -type f -size +2M

![Find Files by Size in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Find-Files-Based-on-Size.png)
*
通过文件大小搜索文件*

**搜索符合一定规则的文件并将其删除**

有时候，777 权限的文件通常为外部攻击者打开便利之门。不管是以何种方式，让所有人都可以对文件进行任意操作都是不安全的。对此，我们采取一个相对激进的方法——删除这些文件（'{}' + 用来“聚集”搜索的结果）。

    # find /home/user -perm 777 -exec rm '{}' +

![Find all 777 Permission Files](http://www.tecmint.com/wp-content/uploads/2014/10/Find-Files-with-777-Permission.png)

*搜索 777 权限的文件*

**按访问时间和修改时间搜索文件**

搜索 /etc 目录下访问时间（-atime）或修改时间（-mtime）大于（+180）或小于（-180） 6 个月或者刚好（180） 6 个月的配置文件。

按照下面例子对命令进行修改：

    # find /etc -iname "*.conf" -mtime -180 -print

![Find Files by Modification Time](http://www.tecmint.com/wp-content/uploads/2014/10/Find-Modified-Files.png)

*按修改时间搜索文件*

- 扩展阅读： [35 Practical Examples of Linux ‘find’ Command][3]

### 文件权限及基本属性 ###

ls -l 命令输出的前 10 位字符是文件的属性，其中第一个字符用来表明文件的类型。

- – : 普通文件
- -d : 目录
- -l : 符号链接
- -c : 字符设备 (它将数据作为字节流处理，如terminal)
- -b : 块设备 (在块设备中处理数据，如存储设备)

接下来表示文件属性的 9 位字符叫做文件的读写模式，代表文件属主、同组用户和其他用户（通常指的是“外部世界”）对应的读（r）、写（w）和执行（x）权限。

文件的写权限允许对应的用户对文件进行打开和读写，对于同时设置了执行权限的目录，对应用户可以列举出该目录的内容。另外，文件的执行权限允许将文件当做是一个可执行程序来运行，而目录的执行权限则是允许用户进入和退出该目录。

文件的权限通过 chown 命令来更改，其基本语法如下：

    # chmod [new_mode] file

new_mode 可以是 3 位八进制数值或者对应权限的表达式。

八进制数值可以从二进制数值进行等值转换，通过下列方法来计算文件属主、同组用户和其他用户权限对应的二进制数值：

一个确定权限的二进制数值表现为 2 的幂（r=2\^2，w=2\^1，x=2\^0），当权限省缺时，二进制数值为 0。如下：

![Linux File Permissions](http://www.tecmint.com/wp-content/uploads/2014/10/File-Permissions.png)

*文件权限*

使用八进制数值设置上图的文件权限，请输入：

    # chmod 744 myfile

通过 u、g 和 o 分别代表用户、同组用户和其他用户，然后你也可以使用权限表达式来单独对用户设置文件的权限模式。也可以通过 a 代表所有用户，然后设置文件权限。通过 + 号或者 - 号相应的赋予或移除文件权限。

**为所有用户撤销一个 shell 脚本的执行权限**

正如之前解释的那样，我们可以通过 - 号为需要移除权限的属主、同组用户、其他用户或者所有用户去掉指定的文件权限。下面命令中的短横线（-）可以理解为：移除（-）所有用户（a）的 backup.sh 文件执行权限（x）。

    # chmod a-x backup.sh

下面演示为文件属主、同组用户赋予读、写和执行权限，并赋予其他用户读权限。

当我们使用 3 位八进制数值为文件设置权限的时候，第一位数字代表属主权限，第二位数字代表同组用户权限，第三位数字代表其他用户的权限：

- 属主：(r=2\^2 + w=2\^1 + x=2\^0 = 7)
- 同组用户：(r=2\^2 + w=2\^1 + x=2\^0 = 7)
- 其他用户：(r=2\^2 + w=0 + x=0 = 4)

命令如下：

	# chmod 774 myfile

随着练习时间的推移，你会知道何种情况下使用哪种方式来更改文件的权限模式的效果最好。

使用 ls -l 详细列举目录详细同样会显示出文件的属主和属组（这个很基本，而且影响到系统文件的访问控制）。

![Linux File Listing](http://www.tecmint.com/wp-content/uploads/2014/10/Linux-File-Listing.png)

*列举 Linux 文件*

通过 chown 命令可以对文件的归属权进行更改，可以同时或者分开更改属主和属组。其基本语法为：

    # chown user:group file

至少要指定用户或者用户组

**举几个例子：**

将文件的属主更改为指定用户：

    # chown gacanepa sent

同时将文件的属主和属组更改为指定的用户和组：

    # chown gacanepa:gacanepa TestFile

只将文件的属组更改为指定组。注意组名前的冒号（:）。

    # chown :gacanepa email_body.txt

### 结论 ###

作为一个系统管理员，你需要懂得如何创建和恢复备份、如何在系统中搜索文件并更改它们的属性。通过一些技巧，你可以更好地管理系统并避免以后出问题。

我希望，本文给出的技巧可以帮助你达成管理系统的目标。你可以随时在评论中发表自己的技巧及社区给你带来的益处。

先行感谢！

参考链接
- [关于 LFCS][4]
- [为什么需要 Linux 基金会认证?][5]
- [注册 LFCS 考试][6]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/compress-files-and-finding-files-in-linux/

作者：[Gabriel Cánepa][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/18-tar-command-examples-in-linux/
[2]:http://www.tecmint.com/dtrx-an-intelligent-archive-extraction-tar-zip-cpio-rpm-deb-rar-tool-for-linux/
[3]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[4]:https://training.linuxfoundation.org/certification/LFCS
[5]:https://training.linuxfoundation.org/certification/why-certify-with-us
[6]:https://identity.linuxfoundation.org/user?destination=pid/1
