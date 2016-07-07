LFCS第十二讲: 如何使用Linux的帮助文档和工具
==================================================================================

由于 2016 年 2 月 2 号开始启用了新的 LFCS 考试要求,  我们在[LFCS series][1]系列添加了一些必要的内容 . 为了考试的需要,  我们强烈建议你看一下[LFCE series][2] .

![](http://www.tecmint.com/wp-content/uploads/2016/03/Explore-Linux-with-Documentation-and-Tools.png)
>LFCS: 了解Linux的帮助文档和工具

当你习惯了在命令行下进行工作, 你会发现Linux有许多文档需要你去使用和配置Linux系统.

另一个你必须熟悉命令行帮助工具的理由是，在[LFCS][3] 和 [LFCE][4] 考试中, 你只能靠你自己和命令行工具，没有互联网也没有百度。

基于上面的理由, 在这一章里我们将给你一些建议来帮助你通过**Linux Foundation Certification** 考试.

### Linux 帮助手册

man命令, 大体上来说就是一个工具手册. 它包含选项列表(和解释) , 甚至还提供一些例子.

我们用**man command** 加工具名称来打开一个帮助手册以便获取更多内容. 例如:

```
# man diff
```

我们将打开`diff`的手册页, 这个工具将一行一行的对比文本文档 (如你想退出只需要轻轻的点一下Q键).

下面我来比较两个文本文件 `file1` 和 `file2` . 这两个文本文件包含着相同版本Linux的安装包信息.

输入`diff` 命令它将告诉我们 `file1` 和`file2` 有什么不同:

```
# diff file1 file2
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Compare-Two-Text-Files-in-Linux.png)
>在Linux中比较两个文本文件

`<` 这个符号是说`file2`少一行. 如果是 `file1`少一行, 我们将用 `>` 符号来替代.

接下来说, **7d6** 意思是说 文件1的**#7**行在 `file2`中被删除了 ( **24d22** 和**41d38**是同样的意思), 65,67d61告诉我们移动 **65** 到 **67** . 我们把以上步骤都做了两个文件将完全匹配.

你还可以通过 `-y` 选项来对比两个文件:

```
# diff -y file1 file2
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Compare-and-List-Difference-of-Two-Files.png)
>通过列表来列出两个文件的不同

 当然你也可以用`diff`来比较两个二进制文件 . 如果它们完全一样, `diff` 将什么也不会输出. 否则, 他将会返回如下信息: “**Binary files X and Y differ**”.

### –help 选项

`--help`选项 , 大多数命令都可以用它(并不是所有) , 他可以理解为一个命令的简单介绍. 尽管它不提供工具的详细介绍, 但是确实是一个能够快速列出程序使用信息的不错的方法.

例如,

```
# sed --help
```

显示 sed 的每个选项的用法(sed文本流编辑器).

一个经典的`sed`例子，替换文件字符. 用 `-i` 选项 (描述为 “**编辑文件在指定位置**”), 你可以编辑一个文件而且并不需要打开他. 如果你想要备份一个原始文件, 用 `-i` 选项 加后缀来创建一个原始文件的副本.

例如, 替换 `lorem.txt`中的`Lorem` 为 `Tecmint` (忽略大小写)  并且创建一个新的原始文件副本, 命令如下:

```
# less lorem.txt | grep -i lorem
# sed -i.orig 's/Lorem/Tecmint/gI' lorem.txt
# less lorem.txt | grep -i lorem
# less lorem.txt.orig | grep -i lorem
```

 请注意`lorem.txt`文件中`Lorem` 都已经替换为 `Tecmint`  , 并且原始的 `lorem.txt` 保存为`lorem.txt.orig`.

![](http://www.tecmint.com/wp-content/uploads/2016/03/Replace-A-String-in-File.png)
>替换文件文本

### /usr/share/doc内的文档
这可能是我最喜欢的方法. 如果你进入 `/usr/share/doc` 目录, 你可以看到好多Linux已经安装的工具的名称的文件夹.

根据[Filesystem Hierarchy Standard][5](文件目录标准),这些文件夹包含了许多帮助手册没有的信息, 还有一些模板和配置文件.

例如, 让我们来看一下 `squid-3.3.8` (版本可能会不同) 一个非常受欢迎的HTTP代理[squid cache server][6].

让我们用`cd`命令进入目录 :

```
# cd /usr/share/doc/squid-3.3.8
```

列出当前文件夹列表:

```
# ls
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/List-Files-in-Linux.png)
>ls linux列表命令

你应该特别注意 `QUICKSTART` 和 `squid.conf.documented`. 这两个文件包含了Squid许多信息, . 对于别的安装包来说, 他们的名字可能不同 (有可能是 **QuickRef** 或者**00QUICKSTART**), 但原理是一样的.

对于另外一些安装包, 比如 the Apache web server, 在`/usr/share/doc`目录提供了配置模板, 当你配置独立服务器或者虚拟主机的时候会非常有用.

### GNU 信息文档

你可以把它想象为帮助手册的超级链接形式. 正如上面说的, 他不仅仅提供工具的帮助信息, 而且还是超级链接的形式(是的!在命令行中的超级链接) 你可以通过箭头按钮和回车按钮来浏览你需要的内容.

一个典型的例子是:

```
# info coreutils
```

通过coreutils 列出当前系统的 基本文件，shell脚本和文本处理工具[basic file, shell and text manipulation utilities][7] , 你可以得到他们的详细介绍.

![](http://www.tecmint.com/wp-content/uploads/2016/03/Info-Coreutils.png)
>Info Coreutils

和帮助手册一样你可以按Q键退出.

此外, GNU info 还可以像帮助手册一样使用. 例如:

```
# info tune2fs
```

它将显示 **tune2fs**的帮助手册,  ext2/3/4 文件系统管理工具.

让我们来看看怎么用**tune2fs**:

显示 **/dev/mapper/vg00-vol_backups**文件系统信息:

```
# tune2fs -l /dev/mapper/vg00-vol_backups
```

修改文件系统标签 (修改为Backups):

```
# tune2fs -L Backups /dev/mapper/vg00-vol_backups
```

设置 `/` 自检的挂载次数 (用`-c` 选项设置 `/`的自检的挂载次数 或者用  `-i` 选项设置  自检时间 **d=days, w=weeks, and m=months**).

```
# tune2fs -c 150 /dev/mapper/vg00-vol_backups # Check every 150 mounts
# tune2fs -i 6w /dev/mapper/vg00-vol_backups # Check every 6 weeks
```

以上这些内容也可以通过 `--help` 选项找到, 或者查看帮助手册.

### 摘要

不管你选择哪种方法，知道并且会使用它们在考试中对你是非常有用的. 你知道其它的一些方法吗? 欢迎给我们留言.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-basic-shell-scripting-and-linux-filesystem-troubleshooting/

作者：[Gabriel Cánepa][a]
译者：[kokialoves](https://github.com/kokialoves)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/
[2]: http://www.tecmint.com/installing-network-services-and-configuring-services-at-system-boot/
[3]: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/
[4]: http://www.tecmint.com/installing-network-services-and-configuring-services-at-system-boot/
[5]: http://www.tecmint.com/linux-directory-structure-and-important-files-paths-explained/
[6]: http://www.tecmint.com/configure-squid-server-in-linux/
[7]: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/
[8]: 
