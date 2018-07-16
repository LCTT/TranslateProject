Linux 内核测试与调试（3）
================================================================================
### 基本测试 ###

安装好内核后，试试能不能启动它。能启动的话，检查 dmesg 看看有没有隐藏的错误。试试下面的功能：

- 网络（Wifi 或者网线）是否可用？
- ssh 是否可用？
- 使用 ssh 远程传输文件。
- 使用 git clone 和 git pull 命令。
- 用用网络浏览器。
- 查看 email。
- 使用 ftp, wget 等软件下载文件。
- 播放音频视频文件。
- 连上 USB 鼠标等设备。


### 检查内核日志 ###

使用 dmesg 查看隐藏的问题，对于定位新代码带来的 bug 是一个好方法。一般来说，dmesg 不会输出新的 crit, alert, emerg 级别的错误信息，也不应该出现新的 err 级别的信息。你要注意的是那些 warn 级别的日志信息。请注意 warn 这个级别的信息并不是坏消息，新代码带来新的警告信息，不会给内核带去严重的影响。

- dmesg -t -l emerg
- dmesg -t -l crit
- dmesg -t -l alert
- dmesg -t -l err
- dmesg -t -l warn
- dmesg -t -k
- dmesg -t

下面的脚本运行了上面的命令，并且将输出保存起来，以便与老的内核的 dmesg 输出作比较（LCTT：老内核的 dmesg 输出在本系列的[第二篇文章][3]中有介绍）。然后运行 diff 命令，查看新老内核 dmesg 日志之间的不同。这个脚本需要输入老内核版本号，如果不输入参数，它只会生成新内核的 dmesg 日志文件后直接退出，不再作比较（LCTT：话是这么说没错，但点开脚本一看，没输参数的话，这货会直接退出，连新内核的 dmesg 日志也不会保存的）。如果 dmesg 日志有新的警告信息，表示新发布的内核有漏网之“虫”，这些 bug 逃过了自测和系统测试。你要看看，那些警告信息后面有没有栈跟踪信息？也许这里有很多问题需要你进一步调查分析。

- [**dmesg 测试脚本**][1]

### 压力测试 ###

执行压力测试的一个好办法是同时跑三四个内核编译任务。下载各种版本的内核，同时编译它们，并记录时间。比较新内核跑压力测试和老内核跑压力测试所花的时间，然后可以定位新内核的性能。如果新内核跑压力测试的时间比老内核的更长，说明新内核的部分模块性能退步了。性能问题很难调试出来。第一步是找出哪里导致的性能退步。同时跑多个内核编译任务对检测内核整体性能来说是个好方法，但是这种方法涵盖了多个内核模块，比如内存管理、文件系统、DMA、驱动等（LCTT：也就是说，这种压力测试没办法定位到是哪个模块造成了性能的下降）。

    time make all

### 内核测试工具 ###

我们可以在 Linux 内核本身找到多种测试方法。下面介绍一个很好用的功能测试工具集： ktest 套件

ktest 是一个自动测试套件，它可以提供编译安装启动内核一条龙测试服务，也可以跑交叉编译测试，前提是你的系统有安装交叉编译所需要的软件。ktest 依赖于 flex 和 bison。详细信息请参考放在 tools/testing/ktest 目录下的文档，你可以自学成材。另外还有一些参考资料教你怎么使用 ktest：

- [**ktest-eLinux.org**][2]

### tools/testing/selftests 套件 ###

我们来玩玩自测吧。内核源码的多个子系统都有自己的自测工具，到目前为止，断点、cpu热插拔、efivarfs、IPC、KCMP、内存热插拔、mqueue、网络、powerpc、ptrace、rcutorture、定时器和虚拟机子系统都有自测工具。另外，用户态内存的自测工具可以利用 test_user_copy 模块来测试用户态内存到内核态的拷贝过程。下面的命令演示了如何使用这些测试工具：

编译测试：

    make -C tools/testing/selftests 

测试全部：（有些测试需要 root 权限，你需要以 root 用户登入系统然后运行命令）

    make -C tools/testing/selftests run_tests 

只测试单个子系统：

    make -C tools/testing/selftests TARGETS=vm run_tests 

### tools/testing/fault-injection 套件 ###

在 tools/testing 目录下的另一个测试套件是 fault-injection。failcmd.sh 脚本用于检测 slab 和内存页分配器的错误。这些工具可以测试内核能否很好地从错误状态中恢复回来。这些测试需要用到 root 权限。下面简单介绍了一些当前能提供的错误检测方法。随着错误检测方法的增加，这份名单也会不断增长。最新的名单请参考 Documentation/fault-injection/fault-injection.txt 文档。

failslab （默认选项）

> 产生 slab 分配错误。作用于 kmalloc(), kmem_cache_alloc() 等函数（LCTT：产生的结果是调用这些函数就会返回失败，可以模拟程序分不到内存时是否还能稳定运行下去）。

fail\_page\_alloc

> 产生内存页分配的错误。作用于 alloc_pages(), get_free_pages() 等函数（LCTT：同上，调用这些函数，返回错误）。

fail\_make\_request

> 对满足条件（可以设置 /sys/block//make-it-fail 或 /sys/block///make-it-fail 文件）的磁盘产生 IO 错误，作用于 generic_make_request() 函数（LCTT：所有针对这块磁盘的读或写请求都会出错）。

fail\_mmc\_request

> 对满足条件（可以设置 /sys/kernel/debug/mmc0/fail\_mmc\_request 这个 debugfs 属性）的磁盘产生 MMC 数据错误。

你可以自己配置 fault-injection 套件的功能。fault-inject-debugfs 内核模块在系统运行时会在 debugfs 文件系统下面提供一些属性文件。你可以指定出错的概率，指定两个错误之间的时间间隔，当然本套件还能提供更多其他功能，具体请查看 Documentation/fault-injection/fault-injection.txt。 Boot 选项可以让你的系统在 debugfs 文件系统起来之前就可以产生错误，下面列出几个 boot 选项：

- failslab=
- fail\_page_alloc=
- fail\_make\_request=
- mmc\_core.fail\_request=[interval],[probability],[space],[times]

fault-injection 套件提供接口，以便增加新的功能。下面简单介绍下增加新功能的步骤，详细信息请参考上面提到过的文档：

使用 DECLARE\_FAULT\_INJECTION(name) 定义默认属性；

> 详细信息可查看 fault-inject.h 中定义的 struct fault\_attr 结构体。

配置 fault 属性，新建一个 boot 选项;

> 这步可以使用 setup\_fault\_attr(attr, str) 函数完成，为了能在系统启动的早期产生错误，添加一个 boot 选项这一步是必须要有的。

添加 debugfs 属性；

> 使用 fault\_create\_debugfs\_attr(name, parent, attr) 函数，为新功能添加新的 debugfs 属性。

为模块设置参数；

> 为模块添加一些参数，对于配置错误属性来说是一个好主意，特别是当新功能的应用范围受限于单个内核模块的时候（LCTT：不同内核，你的新功能可能需要不同的测试参数，通过设置参数，你的功能可以不必为了迎合不同内核而每次都重新编译一遍）。

添加一个钩子函数到错误测试的代码中。

> should\_fail(attr, size) —— 当这个钩子函数返回 true 时，用户的代码就应该产生一个错误。

应用程序使用这个 fault-injection 套件可以指定某个具体的内核模块产生 slab 和内存页分配的错误，这样就可以缩小性能测试的范围。

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-kernel-testing-and-debugging?page=0,2

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linuxdriverproject.org/mediawiki/index.php/Dmesg_regression_check_script
[2]:http://elinux.org/Ktest#Git_Bisect_type
[3]:http://linux.cn/article-3629-1.html