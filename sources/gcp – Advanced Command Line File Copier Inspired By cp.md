gcp – 灵感来自CP的高级命令行文件拷贝工具
================================================================================
几周前，我们讨论了[高级拷贝][1](修改于cp命令，让其可以显示复制进度条)。一位读者在注释中指出其他实用工具不仅也提供了基本的cp命令功能，而且还提供cp不具有的高级功能。所以，这篇文章里，我们将会讨论非常相似的命令行工具－**gcp**。

### gcp – 高级命令行文件拷贝器 ###

gcp — 根据操作手册介绍 — 是一款高级命令行文件拷贝工具软件，其灵感来自于标准的 [cp命令工具][2]， 但它提供了像进度条显示、源文件列表、拷贝过程中出现错误文件不中断继续拷贝等cp所不具有的各项高级功能。

下面是完整的选项列表：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-main.png)

### 测试环境###

- 操作系统 – Ubuntu 13.04
- Shell工具 – Bash 4.2.45
- 应用程序 – gcp 0.1.3

### 简短的教程 ###

下面是一些gcp命令的例子：

**1. 复制进度显示**

gcp命令提供了进度显示功能，以便用户能监控到复制操作的时时状态。

下面是例子：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-1.png)

所以，你可以看到，gcp命令显示了如文件大小、复制完成的百分比、传输速率和复制操作完成的剩余时间等的所有细节。

**2. 使用-r选项递归的拷贝目录**

要递归拷贝完整的目录，可以使用-r选项。

下面是例子：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-2.png)

所以，你可以看到，gcp命令显示了用来统计所有文件夹大小的复制情况的进度条。

**3. 精心设计的错误描述显示**

任何情况的错误，gcp命令都会把导致拷贝失败的文件的信息显示出来。

下面是例子：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-3.png)

So you can see that the gcp command provided a detailed error message related to the file **August Rush.avi** that was already present inside the destination folder. But an error did not disrupt the copy of other file(s).

**4. Get Detailed Output Through -v Option**

The verbose option -v can be used to keep track of all the details that the gcp command is up to.

Here is an example :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-4.png)

So you can see that extended details were provided in output when -v option was used.

**5. Create And Use Sources List**

One of the shining features of the gcp command is that it lets you create a list of source files that you can use later.

For example, I saved the list of source file in the following copy operation using the option **–sources-save**.

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-1.png)

The list name in this case is **SOURCES_SAVE**. You can confirm the saved list through **–sources-list** option.

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-3.png)

So you can see that a list named **SOURCES_SAVE** is saved.

Now, I deleted the files that I copied in the first step :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-2.png)

and repeated the first step again but without mentioning the source file names. The option **–sources-load** was use to load the source file names from the list **SOURCES_SAVE**.

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-4.png)

So you can see that the gcp command picked up the source file names from the list **SOURCES_SAVE** and the copy process started normally.

Here are other options related to source file lists :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-5.png)

The gcp command provides various other useful options. For complete list of options, read the [man page of gcp][3].

### Download/Installation/Configuration ###

Here are some of the important links related to the gcp command :

- [Home Page][4]
- [Download Link][5]
- [Another useful gcp Tutorial][6]

You can alternatively download and install the gcp command through command line package managers like yum, apt-get etc. Ubuntu users can also use Ubuntu software centre to download and install this utility.

### Pros ###

- Status bar and source lists are the USP of this utility.
- Skips the problematic file(s) but the copy operation is not hampered.
- Usage is similar to that of the standard cp command.

### Cons ###

- While copying folders, it could be better if copy status of each file is displayed.
- Doesn’t come pre-installed in most of the Linux distributions.

### Conclusion ###

If you are fed up of waiting blindly while copying large files through standard cp command the gcp is a good alternative. System administrators will love the source list feature. It’s a must have utility.

**Have you ever used gcp or any other advanced cp-like command line utility? Share your experience with us.**

--------------------------------------------------------------------------------

via: http://mylinuxbook.com/gcp-advanced-command-line-file-copier-inspired-by-cp/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://mylinuxbook.com/advanced-copy-cp-command/
[2]:http://www.cyberciti.biz/faq/cp-copy-command-in-unix-examples/
[3]:http://manpages.ubuntu.com/manpages/precise/en/man1/gcp.1.html
[4]:http://wiki.goffi.org/wiki/Gcp/en
[5]:http://wiki.goffi.org/wiki/Gcp/en
[6]:http://www.hecticgeek.com/2012/03/gcp-command-line-file-copy-ubuntu-linux/

