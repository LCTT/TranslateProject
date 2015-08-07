RHCSA 系列: 如何执行文件并进行文件管理 – Part 2
================================================================================

在本篇(RHCSA 第二篇:文件和目录管理)中，我们江回顾一些系统管理员日常任务需要的技能

![RHCSA: Perform File and Directory Management – Part 2](http://www.tecmint.com/wp-content/uploads/2015/03/RHCSA-Part2.png)


RHCSA : 运行文件以及进行文件夹管理 - 第二章
### 创建，删除，复制和移动文件及目录 ###

文件和目录管理是每一个系统管理员都应该掌握的必要的技能.它包括了从头开始的创建、删除文本文件(每个程序的核心配置)以及目录(你用来组织文件和其他目录)，以及识别存在的文件的类型

 [touch 命令][1] 不仅仅能用来创建空文件，还能用来更新已存在的文件的权限和时间表

![touch command example](http://www.tecmint.com/wp-content/uploads/2015/03/touch-command-example.png)

touch 命令示例

你可以使用 `file [filename]`来判断一个文件的类型  (在你用文本编辑器编辑之前，判断类型将会更方便编辑).

![file command example](http://www.tecmint.com/wp-content/uploads/2015/03/file-command-example.png)

file 命令示例

使用`rm [filename]` 可以删除文件

![Linux rm command examples](http://www.tecmint.com/wp-content/uploads/2015/03/rm-command-examples.png)

rm 命令示例

对于目录，你可以使用`mkdir [directory]`在已经存在的路径中创建目录,或者使用 `mkdir -p [/full/path/to/directory].`带全路径创建文件夹


![mkdir command example](http://www.tecmint.com/wp-content/uploads/2015/03/mkdir-command-example.png)

mkdir 命令示例

当你想要去删除目录时，在你使用`rmdir [directory]` 前，你需要先确保目录是空的，或者使用更加强力的命令(小心使用它)`rm -rf [directory]`.后者会强制删除`[directory]`以及他的内容.所以使用这个命令存在一定的风险

### 输入输出重定向以及管道 ###

命令行环境提供了两个非常有用的功能:允许命令重定向的输入和输出到文件和发送到另一个文件,分别称为重定向和管道

To understand those two important concepts, we must first understand the three most important types of I/O (Input and Output) streams (or sequences) of characters, which are in fact special files, in the *nix sense of the word.
为了理解这两个重要概念，我们首先需要理解通常情况下三个重要的输入输出流的形式

- 标准输入 (aka stdin) 是指默认使用键盘链接. 换句话说，键盘是输入命令到命令行的标准输入设备。
- 标准输出 (aka stdout) 是指默认展示再屏幕上, 显示器接受输出命令，并且展示在屏幕上。
- 标准错误 (aka stderr), 是指命令的状态默认输出, 同时也会展示在屏幕上

In the following example, the output of `ls /var` is sent to stdout (the screen), as well as the result of ls /tecmint. But in the latter case, it is stderr that is shown.
在下面的例子中，`ls /var`的结果被发送到stdout(屏幕展示)，就像ls /tecmint 的结果。但在后一种情况下，它是标准错误输出。

![Linux input output redirect](http://www.tecmint.com/wp-content/uploads/2015/03/Linux-input-output-redirect.png)
输入和输出命令实例

为了更容易识别这些特殊文件，每个文件都被分配有一个文件描述符(用于控制他们的抽象标识)。主要要理解的是，这些文件就像其他人一样，可以被重定向。这就意味着你可以从一个文件或脚本中捕获输出，并将它传送到另一个文件、命令或脚本中。你就可以在在磁盘上存储命令的输出结果，用于稍后的分析

To redirect stdin (fd 0), stdout (fd 1), or stderr (fd 2), the following operators are available.

注：表格
<table cellspacing="0" border="0">
<colgroup width="226"></colgroup>
<colgroup width="743"></colgroup>
<tbody>
<tr>
<td align="CENTER" height="24" bgcolor="#999999" style="border: 1px solid #000000;"><b><span style="font-size: medium;">转向操作</span></b></td>
<td align="CENTER" bgcolor="#999999" style="border: 1px solid #000000;"><b><span style="font-size: medium;">效果</span></b></td>
</tr>
<tr class="alt">
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">&gt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">标准输出到一个文件。如果目标文件存在，内容就会被重写</td>
</tr>
<tr>
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">&gt;&gt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">添加标准输出到文件尾部</td>
</tr>
<tr class="alt">
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">2&gt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">标准错误输出到一个文件。如果目标文件存在，内容就会被重写</td>
</tr>
<tr>
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">2&gt;&gt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">添加标准错误输出到文件尾部.</td>
</tr>
<tr class="alt">
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">&amp;&gt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">标准错误和标准输出都到一个文件。如果目标文件存在，内容就会被重写</td>
</tr>
<tr>
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">&lt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">使用特定的文件做标准输出</td>
</tr>
<tr class="alt">
<td align="CENTER" height="18" style="border: 1px solid #000000;"><b><span style="font-family: Courier New;">&lt;&gt;</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;">使用特定的文件做标准输出和标准错误</td>
</tr>
</tbody>
</table>


相比与重定向，管道是通过在命令后添加一个竖杠`(|)`再添加另一个命令 .

记得:

- 重定向是用来定向命令的输出到一个文件，或定向一个文件作为输入到一个命令。
- 管道是用来将命令的输出转发到另一个命令作为输入。

#### 重定向和管道的使用实例  ####

** 例1：将一个命令的输出到文件 **

有些时候，你需要遍历一个文件列表。要做到这样，你可以先将该列表保存到文件中，然后再按行读取该文件。虽然你可以遍历直接ls的输出，不过这个例子是用来说明重定向。

    # ls -1 /var/mail > mail.txt

![Redirect output of command tot a file](http://www.tecmint.com/wp-content/uploads/2015/03/Redirect-output-to-a-file.png)

将一个命令的输出到文件

** 例2：重定向stdout和stderr到/dev/null **

如果不想让标准输出和标准错误展示在屏幕上，我们可以把文件描述符重定向到 `/dev/null` 请注意在执行这个命令时该如何更改输出

    # ls /var /tecmint
    # ls /var/ /tecmint &> /dev/null

![Redirecting stdout and stderr ouput to /dev/null](http://www.tecmint.com/wp-content/uploads/2015/03/Redirecting-stdout-stderr-ouput.png)

重定向stdout和stderr到/dev/null 

#### 例3：使用一个文件作为命令的输入  ####

当官方的[cat 命令][2]的语法如下时

    # cat [file(s)]

您还可以使用正确的重定向操作符传送一个文件作为输入。

    # cat < mail.txt

![Linux cat command examples](http://www.tecmint.com/wp-content/uploads/2015/03/cat-command-examples.png)

cat 命令实例

#### 例4：发送一个命令的输出作为另一个命令的输入 ####

如果你有一个较大的目录或进程列表，并且想快速定位，你或许需要将列表通过管道传送给grep

接下来我们使用管道在下面的命令中，第一个是查找所需的关键词，第二个是除去产生的 `grep command`.这个例子列举了所有与apache用户有关的进程

    # ps -ef | grep apache | grep -v grep

![Send output of command as input to another](http://www.tecmint.com/wp-content/uploads/2015/03/Send-output-of-command-as-input-to-another1.png)

发送一个命令的输出作为另一个命令的输入

### 归档，压缩，解包，解压文件 ###

如果你需要传输，备份，或者通过邮件发送一组文件，你可以使用一个存档（或文件夹）如 [tar][3]工具，通常使用gzip，bzip2，或XZ压缩工具.

您选择的压缩工具每一个都有自己的定义的压缩速度和速率的。这三种压缩工具，gzip是最古老和提供最小压缩的工具，bzip2提供经过改进的压缩，以及XZ提供最信和最好的压缩。通常情况下，这些文件都是被压缩的如.gz .bz2或.xz
注：表格
<table cellspacing="0" border="0">
<colgroup width="165"></colgroup>
<colgroup width="137"></colgroup>
<colgroup width="366"></colgroup>
<tbody>
<tr>
<td align="CENTER" height="24" bgcolor="#999999" style="border: 1px solid #000000;"><b><span style="font-size: medium;">命令</span></b></td>
<td align="CENTER" bgcolor="#999999" style="border: 1px solid #000000;"><b><span style="font-size: medium;">缩写</span></b></td>
<td align="CENTER" bgcolor="#999999" style="border: 1px solid #000000;"><b><span style="font-size: medium;">描述</span></b></td>
</tr>
<tr class="alt">
<td align="LEFT" height="18" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;create</span></td>
<td align="LEFT" style="border: 1px solid #000000;">c</td>
<td align="LEFT" style="border: 1px solid #000000;">创建一个tar归档</td>
</tr>
<tr>
<td align="LEFT" height="18" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;concatenate</span></td>
<td align="LEFT" style="border: 1px solid #000000;">A</td>
<td align="LEFT" style="border: 1px solid #000000;">向归档中添加tar文件</td>
</tr>
<tr class="alt">
<td align="LEFT" height="18" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;append</span></td>
<td align="LEFT" style="border: 1px solid #000000;">r</td>
<td align="LEFT" style="border: 1px solid #000000;">向归档中添加非tar文件</td>
</tr>
<tr>
<td align="LEFT" height="18" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;update</span></td>
<td align="LEFT" style="border: 1px solid #000000;">u</td>
<td align="LEFT" style="border: 1px solid #000000;">添加比归档中的文件更新的文件</td>
</tr>
<tr class="alt">
<td align="LEFT" height="18" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;diff or &ndash;compare</span></td>
<td align="LEFT" style="border: 1px solid #000000;">d</td>
<td align="LEFT" style="border: 1px solid #000000;">将归档和硬盘的文件夹进行对比</td>
</tr>
<tr>
<td align="LEFT" height="20" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;list</span></td>
<td align="LEFT" style="border: 1px solid #000000;">t</td>
<td align="LEFT" style="border: 1px solid #000000;">列举一个tar的压缩包</td>
</tr>
<tr class="alt">
<td align="LEFT" height="18" style="border: 1px solid #000000;"><span style="font-family: Courier New;"> &ndash;extract or &ndash;get</span></td>
<td align="LEFT" style="border: 1px solid #000000;">x</td>
<td align="LEFT" style="border: 1px solid #000000;">从归档中解压文件</td>
</tr>
</tbody>
</table>

注：表格
<table cellspacing="0" border="0">
<colgroup width="258"></colgroup>
<colgroup width="152"></colgroup>
<colgroup width="803"></colgroup>
<tbody>
<tr>
<td align="CENTER" height="24" bgcolor="#999999" style="border: 1px solid #000001;"><b><span style="font-size: medium;">操作参数</span></b></td>
<td align="CENTER" bgcolor="#999999" style="border: 1px solid #000001;"><b><span style="font-size: medium;">缩写</span></b></td>
<td align="CENTER" bgcolor="#999999" style="border: 1px solid #000001;"><b><span style="font-size: medium;">描述</span></b></td>
</tr>
<tr class="alt">
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;">&mdash;</span>directory dir</td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> C</span></td>
<td align="LEFT" style="border: 1px solid #000001;">在执行操作前更改目录</td>
</tr>
<tr>
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;">&mdash;</span>same-permissions and <span style="font-family: Courier New;">&mdash;</span>same-owner</td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> p</span></td>
<td align="LEFT" style="border: 1px solid #000001;">分别保留权限和所有者信息</td>
</tr>
<tr class="alt">
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> &ndash;verbose</span></td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> v</span></td>
<td align="LEFT" style="border: 1px solid #000001;">列举所有文件用于读取或提取，这里包含列表，并显示文件的大小、所有权和时间戳</td>
</tr>
<tr>
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;">&mdash;</span>exclude file</td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> &mdash;</span></td>
<td align="LEFT" style="border: 1px solid #000001;">排除存档文件。在这种情况下，文件可以是一个实际的文件或目录。</td>
</tr>
<tr class="alt">
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;">&mdash;</span>gzip or <span style="font-family: Courier New;">&mdash;</span>gunzip</td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> z</span></td>
<td align="LEFT" style="border: 1px solid #000001;">使用gzip压缩文件</td>
</tr>
<tr>
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> &ndash;bzip2</span></td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> j</span></td>
<td align="LEFT" height="24" style="border: 1px solid #000001;">使用bzip2压缩文件</td>
</tr>
<tr class="alt">
<td align="LEFT" height="24" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> &ndash;xz</span></td>
<td align="LEFT" style="border: 1px solid #000001;"><span style="font-family: Courier New;"> J</span></td>
<td align="LEFT" style="border: 1px solid #000001;">使用xz压缩文件</td>
</tr>
</tbody>
</table>

#### 例5：创建一个文件，然后使用三种压缩工具压缩####

在决定使用一个或另一个工具之前，您可能想比较每个工具的压缩效率。请注意压缩小文件或几个文件，结果可能不会有太大的差异，但可能会给你看出他们的差异

    # tar cf ApacheLogs-$(date +%Y%m%d).tar /var/log/httpd/*        # Create an ordinary tarball
    # tar czf ApacheLogs-$(date +%Y%m%d).tar.gz /var/log/httpd/*    # Create a tarball and compress with gzip
    # tar cjf ApacheLogs-$(date +%Y%m%d).tar.bz2 /var/log/httpd/*   # Create a tarball and compress with bzip2
    # tar cJf ApacheLogs-$(date +%Y%m%d).tar.xz /var/log/httpd/*    # Create a tarball and compress with xz

![Linux tar command examples](http://www.tecmint.com/wp-content/uploads/2015/03/tar-command-examples.png)

tar 命令实例

#### 例6：归档时同时保存原始权限和所有权 ####

如果你创建的是用户的主目录的备份，你需要要存储的个人文件与原始权限和所有权，而不是通过改变他们的用户帐户或守护进程来执行备份。下面的命令可以在归档时保留文件属性

    # tar cJf ApacheLogs-$(date +%Y%m%d).tar.xz /var/log/httpd/* --same-permissions --same-owner

### 创建软连接和硬链接 ###

在Linux中，有2种类型的链接文件：硬链接和软（也称为符号）链接。因为硬链接文件代表另一个名称是由同一点确定，然后链接到实际的数据；符号链接指向的文件名，而不是实际的数据

此外，硬链接不占用磁盘上的空间，而符号链接做占用少量的空间来存储的链接本身的文本。硬链接的缺点就是要求他们必须在同一个innode内。而符号链接没有这个限制，符号链接因为只保存了文件名和目录名,所以可以跨文件系统.

创建链接的基本语法看起来是相似的：

    # ln TARGET LINK_NAME               #从Link_NAME到Target的硬链接
    # ln -s TARGET LINK_NAME            #从Link_NAME到Target的软链接

#### 例7：创建硬链接和软链接 ####

没有更好的方式来形象的说明一个文件和一个指向它的符号链接的关系，而不是创建这些链接。在下面的截图中你会看到文件的硬链接指向它共享相同的节点都是由466个字节的磁盘使用情况确定。

另一方面，在别的磁盘创建一个硬链接将占用5个字节，并不是说你将耗尽存储容量，而是这个例子足以说明一个硬链接和软链接之间的区别。

![Difference between a hard link and a soft link](http://www.tecmint.com/wp-content/uploads/2015/03/hard-soft-link.png)

软连接和硬链接之间的不同

符号链接的典型用法是在Linux系统的版本文件参考。假设有需要一个访问文件foo X.Y 想图书馆一样经常被访问，你想更新一个就可以而不是更新所有的foo X.Y,这时使用软连接更为明智和安全。有文件被看成foo X.Y的链接符号，从而找到foo X.Y

这样的话，当你的X和Y发生变化后，你只需更新一个文件，而不是更新每个文件。

### 总结 ###

在这篇文章中，我们回顾了一些基本的文件和目录管理技能，这是每个系统管理员的工具集的一部分。请确保阅读了本系列的其他部分，以及复习并将这些主题与本教程所涵盖的内容相结合。

如果你有任何问题或意见，请随时告诉我们。我们总是很高兴从读者那获取反馈.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/file-and-directory-management-in-linux/

作者：[Gabriel Cánepa][a]
译者：[xiqingongzi](https://github.com/xiqingongzi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/8-pratical-examples-of-linux-touch-command/
[2]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[3]:http://www.tecmint.com/18-tar-command-examples-in-linux/
