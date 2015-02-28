检测 Linux 内存使用情况的 free 命令的10个例子
===

**Linux**是最有名的开源操作系统之一，它拥有着极其巨大的命令集。确定**物理内存**和**交换内存**所有可用空间的最重要、也是唯一的方法是使用“**free**”命令。

Linux “**free**”命令可以给出类**Linux/Unix**操作系统中**物理内存**和**交换内存**的总使用量、可用量及内核使用的**缓冲区**情况。

![10 Linux Free Command Examples](http://www.tecmint.com/wp-content/uploads/2012/09/Linux-Free-commands.png)

这篇文章提供一些各种参数选项的“**free**”命令，这些命令对于你更好地利用你的内存会有帮助。

### 1. 显示你的系统内存 ###

free命令用于检测**物理内存**和**交换内存**已使用量和可用量（默认单位为**KB**）。下面演示命令的使用情况。

    # free

	             total       used       free     shared    buffers     cached
    Mem:       1021628     912548     109080          0     120368     655548
    -/+ buffers/cache:     136632     884996
    Swap:      4194296          0    4194296

### 2. 以字节为单位显示内存 ###

加上**-b**参数的free命令，以**字节**为单位显示内存的大小。

    # free -b

                 total       used       free     shared    buffers     cached
    Mem:    1046147072  934420480  111726592          0  123256832  671281152
    -/+ buffers/cache:  139882496  906264576
    Swap:   4294959104          0 4294959104

### 3. 以千字节为单位显示内存 ###

加上**-k**参数的free命令（默认单位，所以可以不用使用它），以(KB)**千字节**为单位显示内存大小。

    # free -k

                 total       used       free     shared    buffers     cached
    Mem:       1021628     912520     109108          0     120368     655548
    -/+ buffers/cache:     136604     885024
    Swap:      4194296          0    4194296

### 4. 以兆字节为单位显示内存 ###

想以**(兆字节)**显示内存大小，使用**-m**参数。

    # free -m

                 total       used       free     shared    buffers     cached
    Mem:           997        891        106          0        117        640
    -/+ buffers/cache:        133        864
    Swap:         4095          0       4095

### 5. 以千兆字节为单位显示内存 ###

使用**-g**为参数，将会以**GB(千兆字节)**为单位显示内存大小。

    # free -g
                 total       used       free     shared    buffers     cached
    Mem:             0          0          0          0          0          0
    -/+ buffers/cache:          0          0
    Swap:            3          0          3

### 6. 显示总计行 ###

加上-t选项，将会在屏幕最后列出总计一行。

    # free -t

                 total       used       free     shared    buffers     cached
    Mem:       1021628     912520     109108          0     120368     655548
    -/+ buffers/cache:     136604     885024
    Swap:      4194296          0    4194296
    Total: 5215924 912520 4303404

### 7.  关闭显示缓冲区调整一行 ###

默认情况下，free命令是显示“**缓冲区调整**”一行的，为了关闭显示，可以加上-o参数。

    # free -o                                                              

                 total       used       free     shared    buffers     cached                                                                          
    Mem:       1021628     912520     109108          0     120368     655548                                                                         
    Swap:      4194296          0    4194296                               

### 8. 定期时间间隔更新内存状态 ###

-s选项加上一个整数，用来在定期时间间隔内更新free命令。举个例子，下面的命令将会在每5秒更新一个free命令。

    # free -s 5

                 total       used       free     shared    buffers     cached
    Mem:       1021628     912368     109260          0     120368     655548
    -/+ buffers/cache:     136452     885176
    Swap:      4194296          0    4194296

### 9. 显示底和高内存统计信息 ###

-l选项显示了具体的高和低内存的使用统计情况。

    # free -l

                 total       used       free     shared    buffers     cached
    Mem:       1021628     912368     109260          0     120368     655548
    Low:        890036     789064     100972
    High:       131592     123304       8288
    -/+ buffers/cache:     136452     885176
    Swap:      4194296          0    4194296

### 10. 检查free命令版本 ###

-V选项，显示free命令版本信息。

    # free -V

    procps version 3.2.8

---

via: http://www.tecmint.com/check-memory-usage-in-linux/

作者：[Ravi Saive][a]
译者：[su-kaiyao](https://github.com/su-kaiyao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中>
国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
