du 及 df 命令的使用（附带示例）
======
在本文中，我将讨论 du 和 df 命令。du 和 df 命令都是 Linux 系统的重要工具，来显示 Linux 文件系统的磁盘使用情况。这里我们将通过一些例子来分享这两个命令的用法。

**（推荐阅读：[使用 scp 和 rsync 命令传输文件][1]）**

**（另请阅读：[使用 dd 和 cat 命令为 Linux 系统克隆磁盘][2]）**

### du 命令

du（disk usage 的简称）是用于查找文件和目录的磁盘使用情况的命令。du 命令在与各种选项一起使用时能以多种格式提供结果。

下面是一些例子：

 **1- 得到一个目录下所有子目录的磁盘使用概况**

```
 $ du /home
```

![du command][4]

该命令的输出将显示 /home 中的所有文件和目录以及显示块大小。

**2- 以人类可读格式也就是 kb、mb 等显示文件/目录大小**

```
 $ du -h /home
```

![du command][6]

**3- 目录的总磁盘大小**

```
 $ du -s /home
```

![du command][8]

它是 /home 目录的总大小

### df 命令

df（disk filesystem 的简称）用于显示 Linux 系统的磁盘利用率。

下面是一些例子。

**1- 显示设备名称、总块数、总磁盘空间、已用磁盘空间、可用磁盘空间和文件系统上的挂载点。**

```
 $ df
```


![df command][10]

**2- 人类可读格式的信息**

```
 $ df -h
```

![df command][12]

上面的命令以人类可读格式显示信息。

**3- 显示特定分区的信息**

```
 $ df -hT /etc
```

![df command][14]

-hT 加上目标目录将以可读格式显示 /etc 的信息。

虽然 du 和 df 命令有更多选项，但是这些例子可以让你初步了解。如果在这里找不到你要找的东西，那么你可以参考有关命令的 man 页面。

另外，[**在这**][15]阅读我的其他帖子，在那里我分享了一些其他重要和经常使用的 Linux 命令。

如往常一样，你的评论和疑问是受欢迎的，因此在下面留下你的评论和疑问，我会回复你。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/du-df-commands-examples/

作者：[SHUSAIN][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/files-transfer-scp-rsync-commands/
[2]:http://linuxtechlab.com/linux-cloning-disks-using-dd-cat-commands/
[3]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=453%2C162
[4]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/du1.jpg?resize=453%2C162
[5]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=491%2C163
[6]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/du2.jpg?resize=491%2C163
[7]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=584%2C61
[8]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/du3.jpg?resize=584%2C61
[9]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=638%2C157
[10]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/df1.jpg?resize=638%2C157
[11]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=641%2C149
[12]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/df2.jpg?resize=641%2C149
[13]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=638%2C62
[14]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/df3-1.jpg?resize=638%2C62
[15]:http://linuxtechlab.com/tips-tricks/
