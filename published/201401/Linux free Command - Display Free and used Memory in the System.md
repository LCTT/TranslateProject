Linux free 命令 - 显示系统中空闲和已使用的内存
================================================================================
系统管理员必须维护他们服务器的健康运行。其中一个重要的部分就是内存。当服务器内存使用率过高时，它会降低服务器的性能。Linux有一个称为 **free** 的工具，来监控内存使用率。

### free 命令是什么 ###

**free** 命令是一个显示系统中空闲和已用内存大小的工具。free 命令的输出和 top 命令相似。大多数Linux发行版已经含有 free 命令。

### 如何运行 free ###

想要运行，只需在控制台输入**free** 即可。不带选项运行会显示一个以KB为单位的默认输出。

    $ free

![free默认视图](http://linoxide.com/wp-content/uploads/2013/12/free_default.png)

从上面的截图我们看到：

#### 内存 (以KB计) ####

- Total（全部） : 1026740
- Used（已用） : 843396
- Free（可用） : 183344
- Shared（共享） : 0
- Buffers（块设备缓存区） : 52704
- Cached（文件缓存） : 376384

译注：关于Buffers和Cached的区别，来自 http://www.taobaotesting.com/blogs/qa?bid=2265 的一段解释如下：
	
>	buffers是指用来给块设备做的缓冲大小，他只记录文件系统的metadata以及 tracking in-flight pages.

>	cached是用来给文件做缓冲。

>	那就是说：buffers是用来存储，目录里面有什么内容，权限等等。而cached直接用来记忆我们打开的文件

#### Swap (以KB计) ####

- Total（全部） : 1045500
- Used（已用） : 3376
- Free（可用） : 1042124 

当你看见 buffer/cache 的空闲空间低或者 swap 的空闲空间低，说明内存需要升级了。这意味这内存利用率很高。请注意 **shared（共享）内存列应该被忽略** ，因为它已经被废弃了。

### 以其它单元显示内存信息 ###

如我们先前提到的，默认 free 会以 KB 为单位显示信息。free 同样提供给我们 **b (B), -k (KB), -m (MB), -g (GB) and –tera (TB)**这些单位。要显示我们想要的单位，只要选择一个并在 free 后面跟上。下面一个是以 MB 为单位的输出样例。

    $ free -m

![free命令以MB为单位](http://linoxide.com/wp-content/uploads/2013/12/free_m.png)

这个技巧同样适用于**-b, -k, -g** 以及 **–tera** 选项。

### 以适于人类可读方式显示内存信息 ###

free 同样提供了**-h**选项，这意味着适于人类可读(译注:系统上可能并不存在-h选项，已被-m取代)。那么这与其它的选项有什么不同呢，如**-m**(MB)选项？ 可见的最大不同是**-h**选项会在数字后面加上适于人类可读的单位。让我们看一个例子。

    $ free -h

![人类可读的free](http://linoxide.com/wp-content/uploads/2013/12/free_h.png)

如我们一起看到的，在1,0数字后这里是**G(GB)**字母。当数字并没有达到GB时，free足够聪明来知道并在每个数字后面跟上合适的单位。后面的**M** - 数字929告诉我们它有929MB(译注: 原文为929 number tell us its 969 Megabytes，这里应该为输入错误)。

### 间隔显示 free ###

作为一个状态检查工具，最好的统计内存利用率的方法是使用延迟间隔。这么做的话，我们可以使用**-s**选项后面跟上我们想要间隔的N秒数。我们可以在后面合并几个选项来使输出满足我们的需求。假如我们想要每3秒统计一次内存利用率并且适于人类可读，那么就像这样做:

    $ free -hs 3

![间隔3s显示free](http://linoxide.com/wp-content/uploads/2013/12/free_hs3.png)

### 显示高低内存利用率 ###

如果我们想要知道高低内存统计，我们可以使用-l选项。下面是一个例子。

    $ free -l

![Free 的 低-高 统计](http://linoxide.com/wp-content/uploads/2013/12/free_l.png)

### 显示 Linux 全部内存 ###

如果我们需要每列的总计信息，我们可以在 free 命令后面跟上 **-t** 选项。这会在字底部额外加入一行显示。

    $ free -t

![free命令带总计内存](http://linoxide.com/wp-content/uploads/2013/12/free_t.png)

### 总结 ###

除了[vmstat][1]以外，free 命令也是一个用于统计内存利用率的简单统计工具。用这个你可以快速查看你的 Linux 内存信息。free 命令使用 **/proc/meminfo** 作为基准来显示内存利用率信息。如往常一样，你可以在控制台下输入 **man free** 来获取更多关于 free 的信息。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-free-command/

译者：[geekpi](https://github.com/geekpi) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/linux-vmstat-command-tool-report-virtual-memory-statistics/
