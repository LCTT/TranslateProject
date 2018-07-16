Linux 下使用iostat命令生成CPU和I/O的统计报告
================================================================================
CPU是一台电脑的大脑。所有的处理命令都运行在上面。I/O（输入/输出）同样扮演了一个重要角色。硬盘用于提供数据给处理器并保存CPU处理过的数据。一种衡量处理器和I/O利用率的方法是使用**iostat**命令。通过它们的利用率，我们可以决定是否该增加更多资源。

## iostat 是什么 ##

iostat通过观察设备的活跃时间和他们平均传输率之间的关系来监视系统的输入/输出设备负载。iostat生成的报告可以用于修改系统配置从而更好在物理硬盘间平衡输入/输出的报告。

### 安装 iostat ###

iostat包含在**sysstat**包内。如果你没有，你首先需要安装它。

#### 在 RedHat / CentOS / Fedora ####

    # yum install sysstat

#### 在 Debian / Ubuntu / Linux Mint ####

    $ sudo apt-get install sysstat

### 如何运行 iostat ###

要运行它，只需在控制台下**输入iostat**。下面是一个例子。

    $ iostat

![iostat 默认报告](http://linoxide.com/wp-content/uploads/2013/12/iostat_default.png)

## 下面是如何读取iostat默认报告 ##

### 第一部分包含了CPU报告 ###

- **%user** : 显示了在执行用户(应用)层时的CPU利用率
- **%nice** : 显示了在以nice优先级运行用户层的CPU利用率
- **%system** : 显示了在执行系统(内核)层时的CPU利用率
- **%iowait** : 显示了CPU在I/O请求挂起时空闲时间的百分比
- **%steal** : 显示了当hypervisor正服务于另外一个虚拟处理器时无意识地等待虚拟CPU所占有的时间百分比。
- **%idle** : 显示了CPU在I/O没有挂起请求时空闲时间的百分比

### 第二部分包含了设备利用率报告 ###

- **Device** : 列出的**/dev** 目录下的设备/分区名称
- **tps** : 显示每秒传输给设备的数量。更高的tps意味着处理器更忙。
- **Blk_read/s** : 显示了每秒从设备上读取的块的数量(KB,MB)
- **Blk_wrtn/s** : 显示了每秒写入设备上块的数量(KB,MB)
- **Blk_read** : 显示所有已读取的块
- **Blk_wrtn** : 显示所有已写入的块

### 以KB或MB捕捉iostat ###

默认上，iostat以B为单位衡量I/O系统。为了更便于阅读，我们可以iostat将报告转换成以KB或者MB为单位。只需要加入**-k参数**来创建以**KB为单位**，**-m参数**来创建以**MB为单位**。

    $ iostat -k

![以KB为单位的iostat](http://linoxide.com/wp-content/uploads/2013/12/iostat_k.png)

    $ iostat -m

![以MB为单位的iostat](http://linoxide.com/wp-content/uploads/2013/12/iostat_m.png)

要扩展报告，我们可以在iostat后面跟上**-x选项**。

    $ iostat -x

![扩展iostat报告](http://linoxide.com/wp-content/uploads/2013/12/iostat_x.png)

### 带延迟使用iostat ###

和[vmstat][1]一样,作为一个统计工具，最好带延迟参数来使用它。通过延迟参数，我们可以看到趋势。这里有一些带延时运行iostat的示例。

### 以KB为单位，2秒间隔，运行3次的方式运行iostat ###

    $ iostat -k 2 3

![iostat以KB来报告](http://linoxide.com/wp-content/uploads/2013/12/iostat_k_2_3.png)

### 只显示CPU报告，并以3秒为间隔，报告6次 ###

    $ iostat -c 3 6

![以3秒为间隔，只显示iostat](http://linoxide.com/wp-content/uploads/2013/12/iostat_c_3_6.png)

### 显示hda2和hda6的设备报告，以2秒为间隔，报告4次 ###

    $ iostat -d hda2 hda6 2 4

![只显示硬盘的iostat](http://linoxide.com/wp-content/uploads/2013/12/iostat_d_hda2_hda6_2_4.png)

### 文件 ###

iostat使用这些文件来创建报告。

**/proc/stat**  包含了系统统计
**/proc/partitions** 包含磁盘统计 (对于已打过补丁的2.5以前的内核)
**/proc/diskstats** 包含磁盘统计 (对于2.5以后的内核)
**/sys** 包含块设备统计 (2.5以后内核)

## 总结 ##

vmstat用于监视内存使用，iostat用于监视CPU使用率和I/O系统，这样我们就有了完整的工具来监视你机器中三个重要的组件。这些工具的一个好处是你无需使用root权限运行它们。你可以浏览iostat的手册来深入了解。只需在控制台下输入**man iostat**就可进入iostat手册界面。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-iostat-command/

译者：[geekpi](https://github.com/geekpi) 校对：[Mr小眼儿](http://blog.csdn.net/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/linux-vmstat-command-tool-report-virtual-memory-statistics/
