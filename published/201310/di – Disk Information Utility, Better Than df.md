di - 比 df 更有用的磁盘信息工具 
===========================

如果你是个Linux命令行用户，你肯定会使用df命令检查文件系统的磁盘使用情况。尽管df是一个受欢迎的命令，但仍然不能提供一些高级的功能，如一个用户实际的磁盘可用空间，以及各种有用的显示格式等。还有另一个命令行实用工具可用，不仅提供了这些高级功能也提供了df的所有特性。在本文中,我们将讨论磁盘信息工具 -- **di**

**注释** - 如果你想了解 df 更多信息, 查看 [df命令教程][1].

## di - 磁盘信息工具 

![](http://mylinuxbook.com/wp-content/uploads/2013/10/di-main.png)

从这个di帮助手册页很明显的发现 di 提供了一些很有价值的特性，值得一试。让我们看一些这个工具实际使用的例子。

### 测试环境 

- OS – Ubuntu 13.04
- Shell – Bash 4.2.45
- Application – di 4.30

## 一个简短的教程

下面是一些 di 工具的示例:

###1. 默认的输出

默认情况下di命令生成人们易读的输出格式

这里有个示例:

    $ di
    Filesystem         Mount               Size     Used    Avail %Used  fs Type 
    /dev/sda6          /                  28.1G    20.2G     6.5G   77%  ext4    
    udev               /dev                1.5G     0.0G     1.5G    0%  devtmpfs
    tmpfs              /run              300.2M     0.9M   299.3M    0%  tmpfs

所以你能发现用千兆字节(G)和兆字节(M)做磁盘使用情况的数据单位。这绝对是比 df 默认的输出产生的效果好。（译注：df也可以输出带类似单位的显示，只是需要额外加参数 -h）

###2. 用 -A 选项打印类似挂载点、特殊设备名称等全部字段

选项 -A可以用来极详细的打印挂载点，特殊设备名称等。

这里有个示例:

    $ di -A
    Mount fs Type  Filesystem 
         Options                             
            Size     Used     Free %Used  %Free 
            Size     Used    Avail %Used  %Free 
            Size     Used    Avail %Used  
           Inodes     Iused     Ifree %Iused
    /     ext4     /dev/sda6  
        rw,errors=remount-ro                
           28.1G    20.2G     8.0G   72%    28%  
           28.1G    21.6G     6.5G   77%    23%  
           26.7G    20.2G     6.5G   75%  
          1884160    389881   1494279   21% 
    /dev  devtmpfs udev       
        rw,mode=0755                        
            1.5G     0.0G     1.5G    0%   100%  
            1.5G     0.0G     1.5G    0%   100%  
            1.5G     0.0G     1.5G    0%  
           381805       571    381234    0% 
    /run  tmpfs    tmpfs      
        rw,noexec,nosuid,size=10%,mode=0755 
          300.2M     0.9M   299.3M    0%   100%  
          300.2M     0.9M   299.3M    0%   100%  
          300.2M     0.9M   299.3M    0%  
           384191       549    383642    0%

所以你可以看到所有的字段，可以用于调试目的时打印输出。

###3. 用 -a选项打印所有挂载设备

这里是个示例:

    $ di -a
    Filesystem         Mount               Size     Used    Avail %Used  fs Type        
    /dev/sda6          /                  28.1G    20.2G     6.5G   77%  ext4           
    udev               /dev                1.5G     0.0G     1.5G    0%  devtmpfs       
    devpts             /dev/pts            0.0M     0.0M     0.0M    0%  devpts         
    proc               /proc               0.0M     0.0M     0.0M    0%  proc           
    binfmt_misc        /proc/sys/fs/bi     0.0M     0.0M     0.0M    0%  binfmt_misc    
    tmpfs              /run              300.2M     0.9M   299.3M    0%  tmpfs          
    none               /run/lock           0.0M     0.0M     0.0M    0%  tmpfs          
    none               /run/shm            0.0M     0.0M     0.0M    0%  tmpfs          
    none               /run/user           0.0M     0.0M     0.0M    0%  tmpfs          
    gvfsd-fuse         /run/user/himan     0.0M     0.0M     0.0M    0%  fuse.gvfsd-fuse
    sysfs              /sys                0.0M     0.0M     0.0M    0%  sysfs          
    none               /sys/fs/cgroup      0.0M     0.0M     0.0M    0%  tmpfs          
    none               /sys/fs/fuse/co     0.0M     0.0M     0.0M    0%  fusectl        
    none               /sys/kernel/deb     0.0M     0.0M     0.0M    0%  debugfs        
    none               /sys/kernel/sec     0.0M     0.0M     0.0M    0%  securityfs

所以你能看到与所有设备相关的所有信息，被打印出来了。

###4. 用 -c 选项用逗号作为值的分隔符

选项 -c 用命令分隔的值将附上双引号

这里是个示例:

    $ di -c
    s,m,b,u,v,p,T
    /dev/sda6,/,28.1G,20.2G,6.5G,77%,ext4
    udev,/dev,1.5G,0.0G,1.5G,0%,devtmpfs
    tmpfs,/run,300.2M,0.9M,299.3M,0%,tmpfs

如上,你可以看到打印了用逗号分隔符输出的值。（译注：这种输出便于作为其他程序的输入解析）

###5. 用 -g 选项通过千兆字节(G)打印大小

下面是个示例:

    $ di -g
    Filesystem         Mount              Gibis     Used    Avail %Used  fs Type 
    /dev/sda6          /                   28.1     20.2      6.5   77%  ext4    
    udev               /dev                 1.5      0.0      1.5    0%  devtmpfs
    tmpfs              /run                 0.3      0.0      0.3    0%  tmpfs

当然,你能看到所有与大小有关的值都用千兆字节(G)打印出来。

同样的你可以用 -k 和 -m 选项来分别的显示千字节(K)大小和兆字节(M)大小。

###6. 通过 -I 选项显示特定的文件系统类型的相关信息

假设你想显示只跟tmpfs文件系统相关的信息。下面将告诉你如何用 -I 选项完成任务。

    $ di -I tmpfs
    Filesystem         Mount               Size     Used    Avail %Used  fs Type
    tmpfs              /run              300.2M     0.9M   299.3M    0%  tmpfs  
    none               /run/lock           5.0M     0.0M     5.0M    0%  tmpfs  
    none               /run/shm            1.5G     0.0G     1.5G    0%  tmpfs  
    none               /run/user         100.0M     0.0M   100.0M    0%  tmpfs  
    none               /sys/fs/cgroup      0.0M     0.0M     0.0M    0%  tmpfs

Ok 你能看到只有tmpfs类型相关文件系统信息被输出并显示出来了。

###7. 用 -n 选项跳过标题行的输出

如果你正试图通过一个脚本(或程序)解析该命令的输出结果并希望 di 命令跳过显示的标题行，那么用 -n 选项是绝佳的方法。

下面是个示例:

    $ di -n
    /dev/sda6          /                  28.1G    20.2G     6.5G   77%  ext4    
    udev               /dev                1.5G     0.0G     1.5G    0%  devtmpfs
    tmpfs              /run              300.2M     0.9M   299.3M    0%  tmpfs

如上，你能发现输出中并没有显示标题行。

###8. 通过 -t 选项在文件系统列表底下再打印一行总计行

如果想要显示所有相关列的总数，用 -t 选项。

示例:

    $ di -t
    Filesystem         Mount               Size     Used    Avail %Used  fs Type 
    /dev/sda6          /                  28.1G    20.2G     6.5G   77%  ext4    
    udev               /dev                1.5G     0.0G     1.5G    0%  devtmpfs
    tmpfs              /run              300.2M     0.9M   299.3M    0%  tmpfs   
                       Total              29.9G    20.2G     8.3G   72%

观察到最后一行的值为所有文件系统的统计数据。

###9. 通过 -s 选项 排序输出

-s选项可用于排序该命令的输出结果（译注：默认按照挂载点名称排序）

下面告诉你如何反向排序输出:

    $ di -sr
    Filesystem         Mount               Size     Used    Avail %Used  fs Type
    tmpfs              /run              300.2M     0.9M   299.3M    0%  tmpfs
    udev               /dev                1.5G     0.0G     1.5G    0%  devtmpfs
    /dev/sda6          /                  28.1G    20.2G     6.5G   77%  ext4

你也可以在-s后添加子选项'r'逆序排序输出。

类似的,你可以使用 -s 选项做一些其他类型的排序.以下是摘自man手册供您参考:

    -s 排序方式

    可以指定排序方式。默认排序方式的按照挂载点的名称进行排序。支持如下的排序方式：
          m ：按照挂载点名称排序（默认）
          n  ：不排序（即按照在挂载表/etc/fstab中的顺序）
          s   ：按照特殊设备名称
          t   ：按照文件系统类型
          r   ：逆序排序
          
	排序方式可以组合使用，如：  di --stsrm ：按照类型、设备、挂载点逆序排序。di --strsrm ：按照类型、设备逆序、挂载点逆序排序。
    

###10. 通过 -f 选项指定输出格式

你可以通过结合-f选项和其子选项指定输出格式字符串。

例如，用 -fm，打印挂载点的名称。

示例:

    $ di -fm
    Mount          
    /              
    /dev           
    /run

如上你可以看到只有挂载点的名字被打印出来。

同样的，打印文件系统的类型，用 -ft

示例:

    $ di -ft
    fsType 
    ext4   
    devtmpf
    tmpfs

如果你想快速查找,这里有个其他可用的格式选项截图.

![](http://mylinuxbook.com/wp-content/uploads/2013/10/di-1.png)

更完整的选项,参考[di命令man文档][2]

### 下载/安装 ###

这里有一些关于di命令的重要链接:

- [主页][3]

- [下载链接][4]

命令行工具 di 也能通过apt、yum等命令在命令行下载和安装。Ubuntu用户也可以从Ubuntu 软件中心下载这个命令。

### 优点 ###

- 提供了许多高级功能
- 跨平台

### 缺点 ###

- 在大多数的Linux发行版没有预装
- 大量选项需要学习

### 结论 ###

最后，di命令提供了一些非常有用的特性，比df命令更强大。如果你正在寻找一个类似df，但比df更强大的关于磁盘信息的命令行工具，那么di是最理想的选择。试试吧，包你满意!!!

**你试过di或任何其他类似df工具？请跟我们分享你的经验！**

--------------------------------------------------------------------------------

via: http://mylinuxbook.com/di-a-disk-information-utility/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.expertslogin.com/linux-command/linux-df-command/
[2]:http://www.manpagez.com/man/1/di/
[3]:http://www.gentoo.com/di/
[4]:http://freecode.com/projects/diskinfo
