

如何编写你的第一个Linux内核模块

================================================================================


>你是否曾经想过开始去攻击一个内核？然而却不知道从何开始？让我们来告诉你该怎么做…


内核程序通常被视为一个黑色魔术。从Arthur C Clarke的理念来说，确实是这样。Linux内核与用户空间的确存在很多不同：许多抽象的东西被搁置，你需要格外小心，当一个bug存在代码中时将会影响到整个系统。这不是一个简单的方法去改浮点数，堆栈既被固定了而且很小，你写的代码通常是异步的，所以你需要考虑到并发性的问题。尽管如此，Linux内核是一个庞大且复杂的C程序，对每个人都提供开源阅读、学习和改进，你也可以成为其中的一份子。

>     “The easiest way to start kernel programming
>     is to write a module – a piece of code that
>     can be dynamically loaded into the kernel.”

>     “最简单的方法来开始写内核程序
>     就是写一个内核模块 - 这段代码
>     可以动态加载到内核中。”


可能开始学习内核程序的最简单方式来就是先编写一个模块——一段代码可以动态加载到你的内核和卸载。但是也存在一些限制，比如说什么模块可以这样做——例如，它们不能添加或者删除常用数据结构的一些字段例如过程描述。但是在其它方面它们是成熟的内核级别代码，根据需要并经常被编译到内核中（因此删除所有受限）。在Linux源代码树开发和编译一个模块（这不出乎医疗应该成为out-of-tree构建）是完全有可以的，如果你只想玩一下而不去提交你主线内核的改动，这是非常方便的。



在这个教程中，我们将开发一个简单的内核模块，创建**/dev/reverse**设备。当字符写到这个设备就回次序颠倒读出来（就像“Hello World”会变成“World Hello”。这是一个很受欢迎的程序员面试难题，当你利用自己的能力在内核级别实现这个功能时，可以使你得到一些加分。在我们开始之前会有一句提示：有一个bug寸在你的模块有可能导致你的系统崩溃（不太可能，但是可能）和数据丢失。

###尽可能避开root用户 ###



>默认情况下，**/dev/reverse**只能对根用户可用，所以你只能通过**sudo**来运行你的测试程序。为了修复这个问题，创建一个**/lib/udev/rules.d/99-reverse.rules**文件，其中包含：
> 
>     SUBSYSTEM=="misc", KERNEL=="reverse", MODE="0666"

>不要忘记重新插入模块。通常来说使设备接点可访问对非根用户来说通常不是一个好主意，但是在开发过程中的确非常有用。更不值得一提的是作为根用户运行测试二进制文件也不是一个好主意。




#### 关于模块的剖析 ####



由于大多数Linux内核模块都是用C编写的（除了底层的特定于体系结构的部分），所以建议把你的内核保存在一个独立的文件中（叫做，reverse.c).我们会将整份源代码放在GitHub中——在这里不我们可以看到一些小片段。首先，我们要把一些常见的头文件和描述该模块使用预定义的宏包含进来：

    #include <linux/init.h>
    #include <linux/kernel.h>
    #include <linux/module.h>
 
    MODULE_LICENSE("GPL");
    MODULE_AUTHOR("Valentine Sinitsyn <valentine.sinitsyn@gmail.com>");
    MODULE_DESCRIPTION("In-kernel phrase reverser");



这一切其实都很简单，除了**MODULE_LICENSE()**之外：这不是一个纯粹的标记。内核尤其钟情于GPL－compatible 代码，所以如果你设置一些非GPL兼容的认证（也就是说，“私有认证”），某些特定的内核功能在你的模块中将不可用。





### 什么时候不该一个内核模块 ###



>- 你开发一个USB驱动时 - 需要查阅[libusb][1].
>- 你开发一个系统文件时 - 试试 [FUSE][2].
>- 你扩展Netfilter - [libnetfilter_queue][3] 也许能够对你有所帮助。

>通常，本地代码会运行得更好，但是很多程序来说这种情况并不是至关重要的。



由于内核程序通常是异步的，它并没有 **main()** 功能，Linux是按顺序运行你的模块。取而代之，你将会提供各种事件的回滚，例如：

    static int __init reverse_init(void)
    {
        printk(KERN_INFO "reverse device has been registered\n");
        return 0;
    }
     
    static void __exit reverse_exit(void)
    {
        printk(KERN_INFO "reverse device has been unregistered\n");
    }
     
    module_init(reverse_init);
    module_exit(reverse_exit);



这里，我们定义的函数被称为模块的插入和删除。只有第一个是必要的。目前，他们简单地发送一条内核指令给缓存中（可以通过用户界面发送 **dmesg** 命令）；**KERN_INFO**是一个日至级别（切记这里没有逗号）.**__init** 和 **__exit** 都是特性 - 把元数据添加到函数（或者变量）。在用户界面中C代码的属性是很罕见的但是在内核中却很普遍。标有**__init**都会经过初始化以后被回收（要记得之前释放未使用的内核内寸...这条消息？）。**__exit** 表示，当代码静态构建到内核中时，函数会安全地优化。最后，**module_init()** 和**module_exit()**宏设置**reverse_init()** 和 **reverse_exit()**作为我们模块生命周期的回滚。实际的函数名称并不重要；你可以按着你的想法命名为**init()** 和**exit()** 或者 **start()** 和 **stop()**。他们都是静态声明，你在外部模块是看不到的。实际上，许多内核中的模块是可视的除非是明显的导出。然而，在函数前面添加你的函数作为前缀通常是内核程序员约定俗成的做法。



这些都是些基本概念 - 让我们来做更多有趣的事情吧。模块可以添加参数，例如：

    # modprobe foo bar=1


**modinfo**显示了所有模块可以接受的参数，这些也可以在**/sys/module//parameters**文件中找到。我们的模块需要一个缓存区来存储参数 - 让我们来调整大小使用户可配置。在**MODULE_DESCRIPTION()**添加如下三行：

    static unsigned long buffer_size = 8192;
    module_param(buffer_size, ulong, (S_IRUSR | S_IRGRP | S_IROTH));
    MODULE_PARM_DESC(buffer_size, "Internal buffer size");



这里，我们定义一个变量来存储值，封装成一个参数，使得每个人都可以通过sysfs对其进行阅读。这个参数的描述（在最后一行）出现在modinfo的输出里。



由于用户可以直接设置**buffer_size**，我们需要在**reverse_init()**中对其进行清理。你应该经常检查来自内核意外数据 - 付过你不这样做，你将是在给自己制造内核异常甚至是安全漏洞。

    static int __init reverse_init()
    {
        if (!buffer_size)
            return -1;
        printk(KERN_INFO
            "reverse device has been registered, buffer size is %lu bytes\n",
            buffer_size);
        return 0;
    }



来自模块初始化函数的非0返回值意味着执行失败。


### 导航 ###



>当你正在开发模块时linux内核就是无限的源头。然而，它确实很大，你也许在寻找的过程中会遇到很多困难。幸运的是，在庞大的代码库面前，有许多工具使这个过程变得简单。首先，有一个叫Cscope的工具，——在终端运行中一个比较经典的工具。简单地运行**make cscope && cscope**在源代码一级目录。Cscope很好地集成了Vim和Emacs，于是你又可以不离开你喜爱地编辑工具。



>基于终端工具的使用也许不是你的强项，请访问[http://lxr.free-electrons.com][4].这是一个基于网站的内核导航工具没有太多的类似Cscope的特性（例如，你不能轻易地查找函数的用法），但是它还是可以给你提供快速的查找。



现在，是时候编译模块了。你需要你正在运行的内核版本头文件（**linux-headers**或者同等包）和**build-essential** （或者类是）。接下来，是时候创建一个叫Makefile的样板：

    obj-m += reverse.o
    all:
        make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
    clean:
        make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean



现在，使用**make**来创建你的第一个模块。如果你正确输入，你将会找到在当前目录里找到 **reverse.ko**。插入**sudo insmod reverse.ko**并运行：

    $ dmesg | tail -1
    [ 5905.042081] reverse device has been registered, buffer size is 8192 bytes



祝贺你！可是，现在这一行告诉你一个假象  —— 这里并不存在设备接点。让我们修复它吧。


#### 混杂设备 ####



在Linux中，有一种特殊的字符设备类型成为“miscellaneous”（简写“misc”）。这是专为单点小型设备驱动而涉及的，而且能恰好满足我们的需求。所有的misc设备共享相同的主设备号（10），所以一个驱动程序(**drivers/char/misc.c**)可以查看到他们的所有设备，你可以从他们的次设备号分辨出他们。从其他意义来说，他们也只是普通的字符设备。


为了给设备注册一个次要设备号（和一个接入点），你需要先声明**struct misc_device**，填写字段（注意语法），并调用**misc_register()**这个结构的指针。为此，你还需要把**linux/miscdevice.h** 头文件包含进去：

    static struct miscdevice reverse_misc_device = {
        .minor = MISC_DYNAMIC_MINOR,
        .name = "reverse",
        .fops = &reverse_fops
    };
    static int __init reverse_init()
    {
        ...
        misc_register(&reverse_misc_device);
        printk(KERN_INFO ...
    }


在这里，我们要求第一个可用的（动态的）次设备号命名为“reverse”;省略号表示已经省略了的代码，这些省略了的代码是我们之前看过的。别忘了在模块卸载后注销该设备：

    static void __exit reverse_exit(void)
    {
        misc_deregister(&reverse_misc_device);
        ...
    }



‘fop’字段存储了一个指向**file_operations**（在linux/fs.h中声明）结构的指针，这是指向我们模块的接入点。**reverse_fops**定义如下：

    static struct file_operations reverse_fops = {
        .owner = THIS_MODULE,
        .open = reverse_open,
        ...
        .llseek = noop_llseek
    };



另外，**reverse_fops**包含了一组将要执行的回调函数（也成为方法），当用户空间代码打开了一个设备，从中进行读写或者关闭文件描述。如果你忽略了这些，那么将会有一个只能的回退来取代它。这就是我们要明确地给**noop_llseek()**设置**llseek**的方法，（顾名思义）而它却什么都不干。默认地实现是改变了文件的指针，我们也不想我们的设备被识别（这将是你们今天的家庭作业）。



####  在结束时开启 ####



让我们来实现这个方法。我们将会为每一个文件描述的打开分配一个新的缓冲区来给它自由关闭。这确实是不安全：如果一个用户空间应用的漏洞描述（或者是故意的），但它可能占用着内存，导致系统无法正常使用。在真实应用中，你应该经常考虑到这些可能性。但是在本教程中，这个方法是可接受的。



我们需要一个结构来描述缓冲区。内核提供了许多通用的数据结构：链表（双键链表），哈希表，树等等。然而，缓冲区通常从零开始实现的。我们将调用我们的“struct buffer”:

    struct buffer {
        char *data, *end, *read_ptr;
        unsigned long size;
    };


**data**是一个寸在缓冲区指向字符串的指针数据，而结尾是在字符串结束后的第一个字节。缓冲区的大小是为完整性而存储的 —— 目前，我们不使用该字段。你不应该认为你的用户结构会正确地初始化所有这些，所以你应更好地在函数中封装缓冲区和重新分配分配。他们通常命名为**buffer_alloc()** 和 **buffer_free()**.

    static struct buffer *buffer_alloc(unsigned long size)
    {
        struct buffer *buf;
        buf = kzalloc(sizeof(*buf), GFP_KERNEL);
        if (unlikely(!buf))
            goto out;
        ...
        out:
            return buf;
    }

Kernel memory is allocated with **kmalloc()** and freed with **kfree()**; the **kzalloc()** flavour sets the memory to all-zeroes. Unlike standard **malloc()**, its kernel counterpart receives flags specifying the type of memory requested in the second argument. Here, **GFP_KERNEL** means we need a normal kernel memory (not in DMA or high-memory zones) and the function can sleep (reschedule the process) if needed. **sizeof(*buf)** is a common way to get the size of a structure accessible via pointer.

内核内存使用通过**kmalloc()**来分配并**kfree()**来释放内存；**kzalloc()**会将内存设置为全零。不像标准的**malloc()**，它的内核版本接收标志在第二个参数指定内存的类型。这里，**GFP_KERNEL**意味着我们需要一个正常的内核内存（并非直接内存存取或者高内存区）以及函数可以按需休眠（重新安排流程）。**sizeof(*buf)**是一种常用的方式通过指针来获取结构的大小。



你应该经常检查**kmalloc()**的返回值；非空指针将会导致内核崩溃。另外还要注意到**unlikely()**宏的用法。它（与**likely()**宏相反）广泛用于表示内核中判断条件几乎是真（或假）。它不影响流控制，但是有助于现代处理器提高分支预测的性能。


最后，注意**gotos**。他们通常被认为是邪恶的，然而，在Linux内核中（和一些其它系统软件）利用他们集中实现函数退出。这将导致更少的深度嵌套和可读代码，就更像**try-ctach**块中使用的更高级语言。


有**buffer_alloc()** 和 **buffer_free()**的存在，**open** 和 **close**的方法就回变得非常简单。

    static int reverse_open(struct inode *inode, struct file *file)
    {
        int err = 0;
        file->private_data = buffer_alloc(buffer_size);
        ...
        return err;
    }


**struct file**是一个标准的内核数据结构，用于存储关于打开的文件信息，例如当前文件位置(**file->f_pos**),标志(**file->f_flags**),或者打开方式(**file->f_mode**).另外一个字段， **file->private_data**常用于关联文件和一些任意数据。它的类型是void *，但是对内核意外的文件拥有者是不透明的。我们将把它存储在缓冲区内。


如果缓存区分配失败，我们通过返回负值显示调用用户空间代码(**-ENOMEM**).C库中利用**open(2)**系统调用(可能是, **glibc**)将会进行检测并适当地设置**errno** 。


#### 学习如何读和写 ####


读和写的方法才是真正工作的完成。当数据在缓冲区被读和写时，我们放弃之前的内容和反向地存储该字段，不需要任何临时存储。读的方法是简单地复制内核缓冲区到用户空间。但是如果还是没有数据在缓冲区时，什么是**reverse_read()**方法应该做的呢？在用户空间，**read()**调用会阻塞，知道数据可用。在内核中，你需要等待。幸运的是，有一个叫做“等待列队”的机制。


这个想法是很简单的。如果一个当前的进程需要等待一些事件，它的描述(a **struct task_struct** 存储为 ‘当前’)被放在非运行状态（sleeping）并添加到队列。接着**schedule()**会计划选择另一个进程来运行。生成事件的代码通过使用队列把等待事件放进**TASK_RUNNING** 状态来唤醒它们。调度表会选择在未来的某个点选择它们中的一个。Linux有许多非运行进程状态，尤其是**TASK_INTERRUPTIBLE**（睡眠状态可以被一个信号中断）和**TASK_KILLABLE**（正在睡眠状态的进程可以被阻断）。所有这些都会被正确把握，而等待队列将会为你安排好这一切。


存储我们的读写队列头的一个天然场所是结构缓存区，所以通过添加**wait_queue_head_t read_queue**字段开始。你将会将**linux/sched.h**包含其中。一个等待队列将会通过DECLARE_WAITQUEUE()宏被静态声明。在我们的例子中，是需要动态初始化的，于是我们添加**buffer_alloc()**这一行：

    init_waitqueue_head(&buf->read_queue);


我们等待可用数据；或者**read_ptr != end**条为真时。我们需要等待可终端（例如，通过Ctrl+C).所以读的方法应该这样开始：

    static ssize_t reverse_read(struct file *file, char __user * out,
            size_t size, loff_t * off)
    {
        struct buffer *buf = file->private_data;
        ssize_t result;
        while (buf->read_ptr == buf->end) {
            if (file->f_flags & O_NONBLOCK) {
                result = -EAGAIN;
                goto out;
            }
            if (wait_event_interruptible
            (buf->read_queue, buf->read_ptr != buf->end)) {
                result = -ERESTARTSYS;
                goto out;
            }
        }
    ...


我们会进行循环，直到有可用数据出现，并且在如果不是的情况下使用**wait_event_interruptible()**（这是一个宏，不是一个函数，这就是为什么队列要通过一个值来传送）来等待。如果是**wait_event_interruptible()**的情况下，很好，会中断，并返回一个非零值，我们将它翻译为**-ERESTARTSYS**.这段代码意味着系统调用将会重启。**file->f_flags**在一个非阻塞模式检查打开的文件数量：如果没有数据，我们会返回**-EAGAIN**.


我们不能使用**if()**来取代**while()**，由于还有许多进程正在等待数据。当**write**方法唤醒他们，调度表会用不可预知的方法来选择一个运行，那么这段代码将在适时有一个机会执行，缓冲区会再次清空。现在我们需要从**buf->data**复制数据到用户空间。**copy_to_user()**内核函数是实现如下：

        size = min(size, (size_t) (buf->end - buf->read_ptr));
        if (copy_to_user(out, buf->read_ptr, size)) {
            result = -EFAULT;
            goto out;
        }

如果用户空间指针是错误的，这个调用将可能失败；如果发生这种情况，我们会返回**-EFAULT**.切记不要相信任何来自内核意外的东西！

        buf->read_ptr += size;
        result = size;
    out:
        return result;
    }



为了使数据在任意块可读，简单的算法往往是必要的。这个方法返回了读或者一段错误代码的字节数。


这个写的方法更简单和更简短。首先，我们检查缓冲区是否有足够的空间，接着我们使用**copy_from_userspace()**功能来获取数据。接着**read_ptr**和结束指针重置和缓冲区内容是相反的：

        buf->end = buf->data + size;
        buf->read_ptr = buf->data;
        if (buf->end > buf->data)
            reverse_phrase(buf->data, buf->end - 1);


这里，**reverse_phrase()**干了所有重活。这有赖于**reverse_word()**函数，既简短有可以做内联标记。这是另一种常见的优化；然而，你不应该过度使用它，因为内敛使用会使内核镜像变得不必要的大。


最后，我们需要唤醒正在**read_queue**等待数据的进程，正如先前面熟。**wake_up_interruptible()**实现如下：

        wake_up_interruptible(&buf->read_queue);


喲！你现在拥有一个至少可以成功调试的内核模块。现在是时候来测试它了。


### 调试内核代码 ###



>也许在内核中大多数常用的调试方法是打印。你可以使用纯**printk()**（大概和**KERN_DEBUG**日志级别相似）如果你愿意。然而，也有更好的方法。使用**pr_debug()** 或者 **dev_dbg()**,如果你正在写一个有“struct device”设备驱动：他们支持动态调试(**dyndbg**)特征并可以启用或者禁止请求（请看**Documentation/dynamic-debug-howto.txt**）。对于纯开发的信息，使用**pr_devel()**，除非DEBUG被定义，这将成为一个空操作。要为我们的模块启用DEBUG，包括：

> 
>     CFLAGS_reverse.o := -DDEBUG
> 


>在 Makefile中。在这之后，使用**dmesg**来查看通过**pr_debug()** 或者 **pr_devel()**生成调试信息。



>或者，你可以通过发送调试信息到控制台。做这一步，你也可以设置**console_loglevel**内核变量为8甚至更高(**echo 8 /proc/sys/kernel/printk**)或者临时在日志级别高的问题上打印调试信息例如**KERN_ERR**.自然而然，你将会在你发布代码之前删除这类调试语句。

>注意内核在控制台出现的内核信息，并不是像Xterm的一个在终端模拟窗口；这就是为什么你会发现建议不要在X环境下开发内核。



### 惊喜，惊喜！ ###



编译模块并加载大内核：

    $ make
    $ sudo insmod reverse.ko buffer_size=2048
    $ lsmod
    reverse 2419 0
    $ ls -l /dev/reverse
    crw-rw-rw- 1 root root 10, 58 Feb 22 15:53 /dev/reverse


一切似乎都就绪了。现在，来测试模块如何工作，我们将要写一段小程序来反转第一个命令行参数。在**main()**函数(sans error checking)你可以看到如下：

    int fd = open("/dev/reverse", O_RDWR);
    write(fd, argv[1], strlen(argv[1]));
    read(fd, argv[1], strlen(argv[1]));
    printf("Read: %s\n", argv[1]);



像这样运行：

    $ ./test 'A quick brown fox jumped over the lazy dog'
    Read: dog lazy the over jumped fox brown quick A



它正常工作了！玩得跟尽兴一点：尝试传递一个单词或者一个字母的字符串，空的或者是非英语字符串（如果你有一个键盘布局设置）以及其它人和东西。



现在让我们把事情变得更棘手一点。我们将要创建2个进程用于共享文件描述（因此还有内核缓冲区）。一个将持续写字符串到设备中去，而另一个回去读取它们。**fork(2)**系统笤俑在下面例子中用到，但是线程还是会很好地工作。我也省略了开关设备的代码和错误检查（再次提到）：

    char *phrase = "A quick brown fox jumped over the lazy dog";
    if (fork())
        /* Parent is the writer */
        while (1)
            write(fd, phrase, len);
    else
        /* child is the reader */
        while (1) {
            read(fd, buf, len);
            printf("Read: %s\n", buf);
    }



你希望这段程序输出什么呢？下面是我从我的笔记本电脑上获得的：

    Read: dog lazy the over jumped fox brown quick A
    Read: A kcicq brown fox jumped over the lazy dog
    Read: A kciuq nworb xor jumped fox brown quick A
    Read: A kciuq nworb xor jumped fox brown quick A
    ...


这里接下来会发生什么？这是一场比赛。我们认为**read**和**write**是原子，或者从一开始到结束执行一个指令。然而内核是一个并发的猛兽，它可以很轻易地重新安排在内核**write**操作部分运行的进程，这个进程在**reverse_phrase()**函数中。如果进程是在作者有机会完成之前，**read()**是按计划执行的，它将会看到数据处于不一致的状态。这些错误真的很难调试出来。那么要如何修复它呢？


基本上，我们需要确保没有**read**方法可以被执行，知道写方法有返回。如果你曾经设定一个多线程应用，你可能已经看到原始同步（锁）像互斥锁和信号。Linux也同样有这些，但是存在细微差别。内核代码可以运行进程上下文（用户空间代码的“代表”工作，就像我们使用的方法）和终端上下文（例如，一个IRQ处理线程）。如果你已经在进程上下文中和你所需要的锁，你只需要简单地睡眠和重试直到成功位置。在终端上下文时你不能处于休眠状态，因此代码会在一个循环中运行直到锁是可使用。相应的原子成为自旋锁，但在我们的例子中，是一个简单的互斥 —— 这个对象只有一个进程可以在特定的时间“hold”住 —— 这就足够了。根据性能因素，在现实的代码中也可以使用读写信号。



锁通常用来保护一些数据（在我们的例子中，一个“就够缓冲区”实例），是一种非常常见的嵌入结构。所以我们结构缓冲区中添加一个互斥锁（‘结构互斥锁’).我们必须初始化使用**mutex_init()**对锁进行初始化；**buffer_alloc()**恰好用来处理这个。这段代码使用锁也必须包含**linux/mutex.h**.


一个锁就像一个交通灯 ——除非司机看它和遵守信号否则将起不了作用。所以我们需要升级**reverse_read()** 和 **reverse_write()** 来确保在对缓冲区做任何事情或者释放时完成获得互斥锁。让我们来看一看**read**方法 —— **write**也是用同样的方式工作的：



    static ssize_t reverse_read(struct file *file, char __user * out,
            size_t size, loff_t * off)
    {
        struct buffer *buf = file->private_data;
        ssize_t result;
        if (mutex_lock_interruptible(&buf->lock)) {
            result = -ERESTARTSYS;
            goto out;
    }


我们需要在每个函数的开始有锁。**mutex_lock_interruptible()**也可以获取锁或者将进程返回至休眠状态，直到锁是可利用。正如之前，**_interruptible**后缀意味着休眠状态也可以被一个信号阻断。

        while (buf->read_ptr == buf->end) {
            mutex_unlock(&buf->lock);
            /* ... wait_event_interruptible() here ... */
            if (mutex_lock_interruptible(&buf->lock)) {
                result = -ERESTARTSYS;
                goto out;
            }
        }



下面是”我们等待数据“的循环。当有互斥锁时，你不应该处于休眠状态，或可能发生一种情况叫”死锁“。所以，如果没有数据，我们要释放锁并调用**wait_event_interruptible()**.当它返回时，我们需要锁并继续和往常一样：

        if (copy_to_user(out, buf->read_ptr, size)) {
            result = -EFAULT;
            goto out_unlock;
        }
        ...
    out_unlock:
        mutex_unlock(&buf->lock);
    out:
        return result;


最后，当函数结束时互斥对象已经被解锁了或者当一个错误发生时互斥锁被持有。重新编译模块（不要忘记重新加载它）并再次运行第二个测试。现在你应该看到没有损坏的数据了。

### 接下来做什么呢？ ###


现在你已经尝试了做内核黑客了。我们只是触及表面的话题，还有更多呢。我们的第一个模块是特意设成简单的，然而你学到的概念将在更复杂的场景中保持不变。并发性、方法表、注册回调，将进程设置成睡眠状态和唤醒它们是每个内核黑客需要使用的，现在你已经看到它们所有都在行动啦。也许总有一天内核代码会在主线Linux代码树上 —— 如果这一天到来，请联系我们！

--------------------------------------------------------------------------------

via: http://www.linuxvoice.com/be-a-kernel-hacker/

译者：disylee(https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.libusb.org/
[2]:http://fuse.sf.net/
[3]:http://www.linuxvoice.com/be-a-kernel-hacker/www.netfilter.org/projects/libnetfilter_queue
[4]:http://lxr.free-electrons.com/