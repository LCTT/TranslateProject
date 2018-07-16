Linux slabtop命令——显示内核片缓存信息
================================================================================

Linux内核需要为临时对象如任务或者设备结构和节点分配内存，缓存分配器管理着这些类型对象的缓存。现代Linux内核部署了该缓存分配器以持有缓存，称之为片。不同类型的片缓存由片分配器维护。本文集中讨论slabtop命令，该命令显示了实时内核片缓存信息。

### 1. 命令用法： ###

该命令用起来很简单，默认执行时不要求任何参数。但是它要求root特权来读取内核片信息。以普通用户执行该命令会出现以下错误：

![Run slabtop as non-privileged user](http://linoxide.com/wp-content/uploads/2014/07/001.slabtop_normal_user.png)

你可以在前面设置“sudo”来运行该命令，默认输出见下图：

![Slabtop default output](http://linoxide.com/wp-content/uploads/2014/07/002.slabtop_output.png)
 
要退出slabtop，只需敲‘q’，就像在top命令中那样。

### 2. Slabtop选项： ###

#### 2.1 显示间隔： ####

默认情况下，slabtop每隔3秒刷新一次。但是，如果你想要调整，可以使用-d或者--delay=N选项来调整刷新间隔，以秒为单位：

![Custom delay interval 01](http://linoxide.com/wp-content/uploads/2014/07/003.slabtop_delay01.png)

![Custom delay interval 02](http://linoxide.com/wp-content/uploads/2014/07/004.slabtop_delay02.png)

#### 2.2 排序标准： ####

在slabtop输出中有很多字段，-s或--sort=S选项可以根据指定的排序标准对这些字段排序。该选项将在下一节中详细讲述。

#### 2.3 输出一次： ####

-o或--once选项不会刷新输出，它仅仅将一次输出结果丢给STDOUT，然后退出。 

![Output once and exit](http://linoxide.com/wp-content/uploads/2014/07/005.slabtop_output_once.png)

#### 2.4 版本信息： ####

-V或--version选项显示命令的版本并退出。

![Slabtop version](http://linoxide.com/wp-content/uploads/2014/07/006.slabtop_version.png)

#### 2.5 帮助： ####

常见选项，-h或--help显示命令的使用帮助。

![Slabtop help options](http://linoxide.com/wp-content/uploads/2014/07/007.slabtop_help.png)

### 3. 排序标准： ###

排序标准确定了哪个片缓存显示在顶部，下面是slabtop的排序标准：

#### 3.1 活跃： ####

缓存可以通过‘a’来对活跃对象编号进行排序。

![Sort by Active 01](http://linoxide.com/wp-content/uploads/2014/07/008.slabtop_sort_active01.png)

![Sort by Active 02](http://linoxide.com/wp-content/uploads/2014/07/009.slabtop_sort_active02.png)

#### 3.2 对象/分片: ####

每分片对象数可以使用“b”来选择。

![Sort by objects per slab 01](http://linoxide.com/wp-content/uploads/2014/07/010.slabtop_sort_objslab01.png)

![Sort by objects per slab 02](http://linoxide.com/wp-content/uploads/2014/07/011.slabtop_sort_objslab02.png)

#### 3.3 缓存大小： ####

要选择缓存大小，你需要提供“c”选项。

![Sort by cache size 01](http://linoxide.com/wp-content/uploads/2014/07/012.slabtop_sort_cache_size01.png)

![Sort by cache size 02](http://linoxide.com/wp-content/uploads/2014/07/013.slabtop_sort_cache_size02.png)

#### 3.4 分片： ####

分片数量，使用“l”来选择。

![Sort by number of slabs 01](http://linoxide.com/wp-content/uploads/2014/07/014.slabtop_sort_slabs01.png)

![Sort by number of slabs 02](http://linoxide.com/wp-content/uploads/2014/07/015.slabtop_sort_slabs02.png)

#### 3.5 活跃分片： ####

活跃分片数量。（注意：这不同于上面讲得活跃对象数量。）使用“v”来根据该标准排序。

![Sort by Active Slabs 01](http://linoxide.com/wp-content/uploads/2014/07/016.slabtop_sort_active_slabs01.png)

![Sort by Active Slabs 02](http://linoxide.com/wp-content/uploads/2014/07/017.slabtop_sort_active_slabs02.png)

#### 3.6 名称： ####

缓存名称。相关字符是“n”。

![Sort by cache name 01](http://linoxide.com/wp-content/uploads/2014/07/018.slabtop_sort_cache_name01.png)

![Sort by cache name 02](http://linoxide.com/wp-content/uploads/2014/07/019.slabtop_sort_cache_name02.png)

#### 3.7 对象： ####

要根据对象数量排序，使用“o”。

![Sort by number of objects 01](http://linoxide.com/wp-content/uploads/2014/07/020.slabtop_sort_objectnunber01.png)

![Sort by number of objects 02](http://linoxide.com/wp-content/uploads/2014/07/021.slabtop_sort_objectnunber02.png)

#### 3.8 每分片页面数： ####

“p”将根据每分片页面数排序。

![Sort by pages per slab 01](http://linoxide.com/wp-content/uploads/2014/07/022.slabtop_sort_pagesperslab01.png)

![Sort by pages per slab 02](http://linoxide.com/wp-content/uploads/2014/07/023.slabtop_sort_pagesperslab02.png)

#### 3.9 对象大小： ####

对象大小排序由“s”来指定。

![Sort by object size 01](http://linoxide.com/wp-content/uploads/2014/07/024.slabtop_sort_object_size01.png)

![Sort by object size 02](http://linoxide.com/wp-content/uploads/2014/07/025.slabtop_sort_object_size02.png)

#### 3.10 使用： ####

“u”选项根据缓存使用量排序。

![Sort by cache utilization 01](http://linoxide.com/wp-content/uploads/2014/07/026.slabtop_sort_cache_utilization01.png)

![Sort by cache utilization 02](http://linoxide.com/wp-content/uploads/2014/07/027.slabtop_sort_cache_utilization02.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/kernel-slab-cache-information/

译者：[GOLinux](https://github.com/GOLinux) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
