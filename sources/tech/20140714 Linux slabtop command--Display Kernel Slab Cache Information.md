Linux slabtop command - Display Kernel Slab Cache Information
================================================================================
The Linux kernel needs to allocate memory for temporary objects such as task or device structures and inodes. The caching memory allocator manages caches of these types of objects. The modern Linux kernel implements this caching memory allocator to hold the caches called the slabs. Different types of slab caches are maintained by the slab allocator. This article concentrates on the slabtop command which shows real-time kernel slab cache information.

### 1. Command Usage: ###

The command is simple to use. Default execution does not mandate any arguments to the command. But it does require root privileges to access the kernel slab information. Executing the command as normal user gives following error:

![Run slabtop as non-privileged user](http://linoxide.com/wp-content/uploads/2014/07/001.slabtop_normal_user.png)

You can run it by prepending “sudo” with slabtop. The default output looks like:

![Slabtop default output](http://linoxide.com/wp-content/uploads/2014/07/002.slabtop_output.png)

To quit from slabtop, just hit ‘q’ like you do for top command.

### 2. Slabtop options: ###

#### 2.1 Display Interval: ####

By default slabtop refreshes every 3 seconds. But if you want, you can provide the refreshing interval in seconds with -d or --delay=N option:

![Custom delay interval 01](http://linoxide.com/wp-content/uploads/2014/07/003.slabtop_delay01.png)

![Custom delay interval 02](http://linoxide.com/wp-content/uploads/2014/07/004.slabtop_delay02.png)

#### 2.2 Sort criteria: ####

There are many fields in slabtop output. The -s or --sort=S option sorts the output according to the mentioned sort criteria. This option will be discussed in detail in the next section.

#### 2.3 Output once: ####

The -o or --once option does not refresh the output, instead it just throws the output once on STDOUT and exits.

![Output once and exit](http://linoxide.com/wp-content/uploads/2014/07/005.slabtop_output_once.png)

#### 2.4 Version info: ####

The -V or --version displays the version of the command and exits.

![Slabtop version](http://linoxide.com/wp-content/uploads/2014/07/006.slabtop_version.png)

#### 2.5 Help: ####

The common option, -h or --help displays usage of the command.

![Slabtop help options](http://linoxide.com/wp-content/uploads/2014/07/007.slabtop_help.png)

### 3. Sort Criteria: ###

The sort criteria determines which slab caches are displayed on top. Following are the sort criteria for slabtop:

#### 3.1 ACTIVE: ####

Caches can be sorted by number of active objects with “a”.

![Sort by Active 01](http://linoxide.com/wp-content/uploads/2014/07/008.slabtop_sort_active01.png)

![Sort by Active 02](http://linoxide.com/wp-content/uploads/2014/07/009.slabtop_sort_active02.png)

#### 3.2 OBJ/SLAB: ####

The Objects per Slab can be selected with “b”.

![Sort by objects per slab 01](http://linoxide.com/wp-content/uploads/2014/07/010.slabtop_sort_objslab01.png)

![Sort by objects per slab 02](http://linoxide.com/wp-content/uploads/2014/07/011.slabtop_sort_objslab02.png)

#### 3.3 CACHE SIZE: ####

For selecting cache size, you need to provide “c”.

![Sort by cache size 01](http://linoxide.com/wp-content/uploads/2014/07/012.slabtop_sort_cache_size01.png)

![Sort by cache size 02](http://linoxide.com/wp-content/uploads/2014/07/013.slabtop_sort_cache_size02.png)

#### 3.4 SLABS: ####

The number of slabs. Select it with “l”

![Sort by number of slabs 01](http://linoxide.com/wp-content/uploads/2014/07/014.slabtop_sort_slabs01.png)

![Sort by number of slabs 02](http://linoxide.com/wp-content/uploads/2014/07/015.slabtop_sort_slabs02.png)

#### 3.5 Active Slabs: ####

The number of Active Slabs. (Note that this is different from number of Active Objects described above.) Use “v” to sort according to this criteria.

![Sort by Active Slabs 01](http://linoxide.com/wp-content/uploads/2014/07/016.slabtop_sort_active_slabs01.png)

![Sort by Active Slabs 02](http://linoxide.com/wp-content/uploads/2014/07/017.slabtop_sort_active_slabs02.png)

#### 3.6 NAME: ####

Name of cache. Corresponding character is “n”

![Sort by cache name 01](http://linoxide.com/wp-content/uploads/2014/07/018.slabtop_sort_cache_name01.png)

![Sort by cache name 02](http://linoxide.com/wp-content/uploads/2014/07/019.slabtop_sort_cache_name02.png)

#### 3.7 OBJS: ####

To sort by number of objects, use “o”

![Sort by number of objects 01](http://linoxide.com/wp-content/uploads/2014/07/020.slabtop_sort_objectnunber01.png)

![Sort by number of objects 02](http://linoxide.com/wp-content/uploads/2014/07/021.slabtop_sort_objectnunber02.png)

#### 3.8 Pages Per Slab: ####

“p” will sort by pages per slab

![Sort by pages per slab 01](http://linoxide.com/wp-content/uploads/2014/07/022.slabtop_sort_pagesperslab01.png)

![Sort by pages per slab 02](http://linoxide.com/wp-content/uploads/2014/07/023.slabtop_sort_pagesperslab02.png)

#### 3.9 OBJ SIZE: ####

The object size is sorted by “s”

![Sort by object size 01](http://linoxide.com/wp-content/uploads/2014/07/024.slabtop_sort_object_size01.png)

![Sort by object size 02](http://linoxide.com/wp-content/uploads/2014/07/025.slabtop_sort_object_size02.png)

#### 3.10 USE: ####

“u” sorts by the cache utilization.

![Sort by cache utilization 01](http://linoxide.com/wp-content/uploads/2014/07/026.slabtop_sort_cache_utilization01.png)

![Sort by cache utilization 02](http://linoxide.com/wp-content/uploads/2014/07/027.slabtop_sort_cache_utilization02.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/kernel-slab-cache-information/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出