Linux free 命令 - 显示系统中空闲和已使用的内存
================================================================================
系统管理员必须管理他们服务器的健康。其中重要的一部分是内存。当服务器内存用满时，它会减小服务器的性能。为了监视内存利用率，Linux有一个工具称为free。

### free是什么 ###

**free** 命令是一个显示系统中空闲和已用内存大小的工具。free命令的输出和top命令相似。大多数Linux发行版已经含有free命令。

### How to run it ###

为了运行，只要在控制台输入**free**。不带选项运行会显示一个以KB为单位的默认输出。

    $ free

![free默认视图](http://linoxide.com/wp-content/uploads/2013/12/free_default.png)

从上面的截图我们看到：

#### 内存 (以KB计) ####

- Total : 1026740
- Used : 843396
- Free : 183344
- Shared : 0
- Buffers : 52704
- Cached : 376384

#### Swap (以KB计) ####

- Total : 1045500
- Used : 3376
- Free : 1042124

当你看见buffer/cache的空闲空间低或者swap的空闲空间低，那么内存需要升级了。这意味这内存利用率很高。请注意 **共享内存那个应该被忽略**，因为他已经被废弃了。

### 以其他单元显示内存信息 ###

如我们先前提到的，默认上free会以KB为单位显示信息。free同样提供给我们 **b (B), -k (KB), -m (MB), -g (GB) and –tera (TB)**这些单位。要显示我们想要的单位，只要选择一个并在free后面跟上。下面一个是以MB为单位的输出。

    $ free -m

![free命令以MB为单位](http://linoxide.com/wp-content/uploads/2013/12/free_m.png)

这个技巧技巧同样适用于**-b, -k, -g** and **–tera** 选项。

### 以人类可读方式显示内存信息 ###

free同样提供了**-h**选项，这意味着人类可读(译注:系统上可能并不存在-h选项，已被-m取代)。那么这与其他的选项有什么不同呢，如**-m**(MB)选项？ 最大的可见的不同是**-h**选项会在数字后面加上人类可读的单元。让我们看一个例子。

    $ free -h

![人类可读的free](http://linoxide.com/wp-content/uploads/2013/12/free_h.png)

如我们一起看到的，在1,0数字后这里是**G(GB)**字母。当数字并没有达到GB时，free足够聪明来知道并在每个数字后面跟上合适的单元。后面的**M** - 数字929告诉我们它有929MB(译注: 原文为929 number tell us its 969 Megabytes，这里应该为typo)。

### 延迟显示free ###

作为一个显示工具，最好的捕捉内存利用率的方法是使用延迟。为了这么做，我们可以使用**-s**选项后面跟上我们想要的N秒。我们总是在后面跟上多于1个的选项来使输出满足我们的需求。假如我们想要每3s捕捉内存利用率并且是人类可读的。那么就像这样做:

    $ free -hs 3

![延迟3s显示free](http://linoxide.com/wp-content/uploads/2013/12/free_hs3.png)

### 显示高低内存利用率 ###

如果我们想要知道高低内存统计，我们可以使用-l选项。下面是一个例子。

    $ free -l

![Free 的 低-高 统计](http://linoxide.com/wp-content/uploads/2013/12/free_l.png)

### 显示Linux全部内存 ###

如果我们需要每列的总计信息，我们可以在free命令后面跟上-t选项。这会字底部额外加入一行显示。

    $ free -t

![free命令带总计内存](http://linoxide.com/wp-content/uploads/2013/12/free_t.png)

### 总结 ###

除了[vmstat][1]以外，free命令是另外一个用于捕捉内存利用率的简单统计工具。用这个你可以抓取一个快速的关于你Linux内存的信息。free命令使用/proc/meminfo作为基准来显示内存利用率信息。如往常一样，你可以在控制台下输入"man free"来发现关于free的更多细节。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-free-command/

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/linux-vmstat-command-tool-report-virtual-memory-statistics/