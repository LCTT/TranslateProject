Write your first Linux Kernel module
================================================================================
> Ever wanted to start hacking the kernel? Don’t have a clue how to begin? Let us show you how it’s done…

Kernel programming is often seen as a black magic. In Arthur C Clarke’s sense, it probably is. The Linux kernel is quite different from its user space: many abstractions are waived, and you have to take extra care, as a bug in you code affects the whole system. There is no easy way to do floating-point maths, the stack is fixed and small, and the code you write is always asynchronous so you need to think about the concurrency. Despite all of this though, the Linux kernel is just a very large and complex C program that is open for everyone to read, learn and improve, and you too can be a part of it.

>     “The easiest way to start kernel programming
>     is to write a module – a piece of code that
>     can be dynamically loaded into the kernel.“

Probably the easiest way to start kernel programming is to write a module – a piece of code that can be dynamically loaded into the kernel and removed from it. There are limits to what modules can do – for example, they can’t add or remove fields to common data structures like process descriptors. But in all other ways they are full-fledged kernel-level code, and they can always be compiled into the kernel (thus removing all the restrictions) if needed. It is fully possible to develop and compile a module outside the Linux source tree (this is unsurprisingly called an out-of-tree build), which is very convenient if you just want to play a bit and do not wish to submit your changes for inclusion into the mainline kernel.

In this tutorial, we’ll develop a simple kernel module that creates a **/dev/reverse** device. A string written to this device is read back with the word order reversed (“Hello World” becomes “World Hello”). It is a popular programmer interview puzzle, and you are likely to get some bonus points when you show the ability to implement it at the kernel level as well. A word of warning before we start: a bug in your module may lead to a system crash and (unlikely, but possible) data loss. Be sure you’ve backed up all your important data before you start, or, even better, experiment in a virtual machine.

### Avoid root if possible ###

> By default, **/dev/reverse** is available to root only, so you’ll have to run your test programs with **sudo**. To fix this, create a **/lib/udev/rules.d/99-reverse.rules** file that contains:
> 
>     SUBSYSTEM=="misc", KERNEL=="reverse", MODE="0666"
> 
> Don’t forget to reinsert the module. Making device nodes accessible to non-root users is generally not a good idea, but it is quite useful during development. This is not to mention that running test binaries as root is not a good idea either.

#### A module’s anatomy ####

As most of the Linux kernel modules are written in C (apart from low-level architecture-specific parts), it is recommended that you keep your module in a single file (say, reverse.c). We’ve put the full source code on GitHub – and here we’ll look at some snippets of it. To begin, let’s include some common headers and describe the module using predefined macros:

    #include <linux/init.h>
    #include <linux/kernel.h>
    #include <linux/module.h>
 
    MODULE_LICENSE("GPL");
    MODULE_AUTHOR("Valentine Sinitsyn <valentine.sinitsyn@gmail.com>");
    MODULE_DESCRIPTION("In-kernel phrase reverser");

Everything is straightforward here, except for **MODULE_LICENSE()**: it is not a mere marker. The kernel strongly favours GPL-compatible code, so if you set the licence to something non GPL-compatible (say, “Proprietary”), certain kernel functions will not be available to your module.

### When not to write a kernel module ###

> Kernel programming is fun, but writing (and especially debugging) kernel code in a real-world project requires certain skills. In general, you should descend to the kernel level only if there is no other way to solve your problem. Chances are you can stay in the userspace if:
> 
> - You develop a USB driver – have a look at [libusb][1].
> - You develop a filesystem – try [FUSE][2].
> - You are extending Netfilter – [libnetfilter_queue][3] may help you then.
> 
> Generally, native kernel code will perform better, but for many projects this performance loss isn’t crucial.

Since kernel programming is always asynchronous, there is no **main()** function that Linux executes sequentially to run your module. Instead, you provide callbacks for various events, like this:

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

Here, we define functions to be called on the module’s insertion and removal. Only the first one is required. For now, they simply print a message to the kernel ring buffer (accessible from the userspace via the **dmesg** command); **KERN_INFO** is a log level (note there is no comma). **__init** and **__exit** are attributes – the pieces of metadata attached to functions (or variables). Attributes are rarely seen in userspace C code but are pretty common in the kernel. Everything marked with **__init** is recycled after the initialisation (remember the old “Freeing unused kernel memory…” message?). **__exit** denotes functions that are safe to optimise out when the code is built statically into the kernel. Finally, the **module_init()** and **module_exit()** macros set **reverse_init()** and **reverse_exit()** functions as lifecycle callbacks for our module. The actual function names aren’t important; you can call them **init()** and **exit()** or **start()** and **stop()**, if you wish. They are declared static and hence invisible outside your module. In fact, any function in the kernel is invisible unless explicitly exported. However, prefixing your functions with a module name is a common convention among kernel programmers.

These are bare bones – let’s make things more interesting. Modules can accept parameters, like this:

    # modprobe foo bar=1

The **modinfo** command displays all parameters accepted by the module, and these are also available under **/sys/module//parameters** as files. Our module will need a buffer to store phrases – let’s make its size user-configurable. Add the following three lines just below **MODULE_DESCRIPTION()**:

    static unsigned long buffer_size = 8192;
    module_param(buffer_size, ulong, (S_IRUSR | S_IRGRP | S_IROTH));
    MODULE_PARM_DESC(buffer_size, "Internal buffer size");

Here, we define a variable to store the value, wrap it into a parameter, and make it readable by everyone via sysfs. The parameter’s description (the last line) appears in the modinfo’s output.

As the user can set **buffer_size** directly, we need to sanitise it in **reverse_init()**. You should always check the data that comes outside the kernel – if you don’t, you are opening yourself to kernel panics or even security holes.

    static int __init reverse_init()
    {
        if (!buffer_size)
            return -1;
        printk(KERN_INFO
            "reverse device has been registered, buffer size is %lu bytes\n",
            buffer_size);
        return 0;
    }

Non-zero return value from a module init function indicates a failure.

### Navigation ###

> The Linux kernel is the ultimate source for everything you may need when developing modules. However, it’s quite big, and you may have trouble trying to find what you are after. Luckily, there are tools that make it easier to navigate large codebases. First of all, there is Cscope – a venerable tool that runs in a terminal. Simply run **make cscope && cscope** in the kernel sources top-level directory. Cscope integrates well with Vim and Emacs, so you can use it without leaving the comfort of your favorite editor.
> 
> If terminal-based tools aren’t your cup of tea, visit [http://lxr.free-electrons.com][4]. It is a web-based kernel navigation tool with not quite as many features as Cscope (for example, you can’t easily find usages for the function), but it still provides enough for the quick lookups.

Now it’s time to compile the module. You will need the headers for the kernel version you are running (**linux-headers** or equivalent package) and **build-essential** (or analogous). Next, it’s time to create a boilerplate Makefile:

    obj-m += reverse.o
    all:
        make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
    clean:
        make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

Now, call **make** to build your first module. If you typed everything correctly, you will find **reverse.ko** in the current directory. Insert it with **sudo insmod reverse.ko**, and run:

    $ dmesg | tail -1
    [ 5905.042081] reverse device has been registered, buffer size is 8192 bytes

Congratulations! However, for now this line is telling lies – there is no device node yet. Let’s fix it.

#### Miscellaneous devices ####

In Linux, there is a special character device type called “miscellaneous” (or simply “misc”). It is designed for small device drivers with a single entry point, and is exactly what we need. All misc devices share the same major number (10), so the one driver (**drivers/char/misc.c**) can look after all of them, and they are distinguished by their minor numbers. In all other senses, they are just normal character devices.

To register a minor number (and an entry point) for the device, you declare **struct misc_device**, fill its fields (note the syntax), and call **misc_register()** with a pointer to this structure. For this to work, you will also need to include the **linux/miscdevice.h** header file:

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

Here, we request a first available (dynamic) minor number for the device named “reverse”; th ellipsis indicates omitted code that we’ve already seen. Don’t forget to unregister the device on the module’s teardown:

    static void __exit reverse_exit(void)
    {
        misc_deregister(&reverse_misc_device);
        ...
    }

The ‘fops’ field stores a pointer to a struct **file_operations** (declared in linux/fs.h), and this is the entry point for our module. **reverse_fops** is defined as:

    static struct file_operations reverse_fops = {
        .owner = THIS_MODULE,
        .open = reverse_open,
        ...
        .llseek = noop_llseek
    };

Again, **reverse_fops** contains a set of callbacks (also known as methods) to be executed when userspace code opens a device, reads from it, writes to it or closes the file descriptor. If you omit any of these, a sensible fallback will be used instead. That’s why we explicitly set the **llseek** method to **noop_llseek()**, which (as the name implies) does nothing. The default implementation changes a file pointer, and we don’t want our device to be seekable now (this will be your home assignment for today).

#### I open at the close ####

Let’s implement the methods. We’ll allocate a new buffer for each file descriptor opened, and free it on close. This is not really safe: if a userspace application leaks descriptors (perhaps intentionally), it may hog the RAM, and render the system unusable. You should always think about these possibilities in the real world, but for the tutorial, it’s acceptable.

We’ll need a structure to describe the buffer. The kernel provides many generic data structures: linked lists (which are double-linked), hash tables, trees and so on. However, buffers are usually implemented from scratch. We will call ours “struct buffer”:

    struct buffer {
        char *data, *end, *read_ptr;
        unsigned long size;
    };

**data** is a pointer to the string this buffer stores, and end is the first byte after the string end. **read_ptr** is where **read()** should start reading the data from. The buffer size is stored for the completeness – for now, we don’t use this field. You shouldn’t assume the users of your structure will correctly initialise all of these, so it is better to encapsulate buffer allocation and deallocation in functions. They are usually named **buffer_alloc()** and **buffer_free()**.

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

You should always check **kmalloc()**’s return value: dereferencing NULL pointer will result in kernel panic. Also note the use of **unlikely()** macro. It (and the opposite **likely()** macro) is widely used in the kernel to signify that the condition is almost always true (or false). It doesn’t affect control flow, but helps modern processors to boost performance with branch prediction.

Finally, note the **gotos**. They are often considered evil, however, the Linux kernel (and some other system software) employs them to implement centralised function exiting. This results in less deeply nested and more readable code, and is much like the **try-ctach** blocks used in higher-level languages.

With **buffer_alloc()** and **buffer_free()** in place, the implementation of the **open** and **close** methods becomes pretty straightforward.

    static int reverse_open(struct inode *inode, struct file *file)
    {
        int err = 0;
        file->private_data = buffer_alloc(buffer_size);
        ...
        return err;
    }

**struct file** is a standard kernel data structure that stores information about an opened file, like current file position (**file->f_pos**), flags (**file->f_flags**), or open mode (**file->f_mode**). Another field, **file->private_data** is used to associate the file with some arbitrary data. Its type is void *, and it is opaque to the kernel outside the file’s owner. We store a buffer there.

If the buffer allocation fails, we indicate this to the calling user space code by returning negative value (**-ENOMEM**). A C library doing **open(2)** system call (probably, **glibc**) will detect this and set **errno** appropriately.

#### Learn to read and write ####

“Read” and “write” methods are where the real job is done. When data is written to a buffer, we drop its previous contents and reverse the phrase in-place, without any temporary storage. The **read** method simply copies the data from the kernel buffer into the userspace. But what should the **reverse_read()** method do if there is no data in the buffer yet? In userspace, the **read()** call would block until the data is available. In the kernel, you must wait. Luckily, there is a mechanism for this, and it is called ‘wait queues’.

The idea is simple. If a current process needs to wait for some event, its descriptor (a **struct task_struct** stored as ‘current’) is put into non-runnable (sleeping) state and added to a queue. Then **schedule()** is called to select another process to run. A code that generates the event uses the queue to wake up the waiters by putting them back to the **TASK_RUNNING** state. The scheduler will select one of them somewhere in the future. Linux has several non-runnable process states, most notably **TASK_INTERRUPTIBLE** (a sleep that can be interrupted with a signal) and **TASK_KILLABLE** (a sleeping process that can be killed). All of this should be handled correctly, and wait queues do this for you.

A natural place to store our read wait queue head is struct buffer, so start with adding **wait_queue_head_t read_queue** field to it. You should also include **linux/sched.h**. A wait queue can be declared statically with DECLARE_WAITQUEUE() macro. In our case, dynamic initialisation is needed, so add this line to **buffer_alloc()**:

    init_waitqueue_head(&buf->read_queue);

We wait for the data to be available; or for **read_ptr != end** condition to become true. We also want the wait to be interruptible (say, by Ctrl+C). So the “read” method should start like this:

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

We loop until the data is available and use **wait_event_interruptible()** (it’s a macro, not a function, that’s why the queue is passed by value) to wait if it isn’t. If **wait_event_interruptible()** is, well, interrupted, it returns a non-zero value, which we translate to **-ERESTARTSYS**. This code means the system call should be restarted. **file->f_flags** check accounts for files opened in non-blocking mode: if there is no data, we return **-EAGAIN**.

We can’t use **if()** instead of **while()**, since there can be many processes waiting for the data. When the **write** method awakes them, the scheduler chooses the one to run in an unpredictable way, so by the time this code is given a chance to execute, the buffer can be empty again. Now we need to copy the data from **buf->data** to the userspace. The **copy_to_user()** kernel function does just that:

        size = min(size, (size_t) (buf->end - buf->read_ptr));
        if (copy_to_user(out, buf->read_ptr, size)) {
            result = -EFAULT;
            goto out;
        }

The call can fail if the user space pointer is wrong; if this happen, we return **-EFAULT**. Remember not to trust anything coming outside the kernel!

        buf->read_ptr += size;
        result = size;
    out:
        return result;
    }

Simple arithmetic is needed so the data can be read in arbitrary chunks. The method returns the number of bytes read or an error code.

The write method is simpler and shorter. First, we check that the buffer have enough space, then we use the **copy_from_userspace()** function to get the data. Then **read_ptr** and end pointers are reset and the buffer contents are reversed:

        buf->end = buf->data + size;
        buf->read_ptr = buf->data;
        if (buf->end > buf->data)
            reverse_phrase(buf->data, buf->end - 1);

Here, **reverse_phrase()** does all heavy lifting. It relies on the **reverse_word()** function, which is quite short and marked inline. This is another common optimisation; however, you shouldn’t overuse it, since aggressive inlining makes the kernel image unnecessarily large.

Finally, we need to wake up processes waiting for the data at **read_queue**, as described earlier. **wake_up_interruptible()** does just that:

        wake_up_interruptible(&buf->read_queue);

Phew! You now have a kernel module that at least compiles successfully. Now it’s time to test it.

### Debugging kernel code ###

> Perhaps the most common debugging method in the kernel is printing. You can use plain **printk()** (presumably with **KERN_DEBUG** log level) if you wish. However, there are better ways. Use **pr_debug()** or **dev_dbg()**, if you are writing a device driver that has its own “struct device”: they support the dynamic debug (**dyndbg**) feature and can be enabled or disabled on request (see **Documentation/dynamic-debug-howto.txt**). For pure development messages, use **pr_devel()**, which becomes a no-op unless DEBUG is defined. To enable DEBUG for our module, include:
> 
>     CFLAGS_reverse.o := -DDEBUG
> 
> in the Makefile. After that, use **dmesg** to view debug messages generated by **pr_debug()** or **pr_devel()**.
> 
> Alternatively, you can send debug messages directly to the console. To do this, either set the **console_loglevel** kernel variable to 8 or greater (**echo 8 /proc/sys/kernel/printk**) or temporarily print the debug message in question at the high log level like **KERN_ERR**. Naturally, you should remove debug statements of this kind before publishing your code.
> 
> Note that kernel messages appear on the console, not in a terminal emulator window such as Xterm; that’s why you’ll find recommendations not to do kernel development in the X environment.

### Surprise, surprise! ###

Compile the module and load it into the kernel:

    $ make
    $ sudo insmod reverse.ko buffer_size=2048
    $ lsmod
    reverse 2419 0
    $ ls -l /dev/reverse
    crw-rw-rw- 1 root root 10, 58 Feb 22 15:53 /dev/reverse

Everything seems to be in place. Now, to test how the module works, we’ll write a small program that reverses its first command line argument. The **main()** function (sans error checking) may look like this:

    int fd = open("/dev/reverse", O_RDWR);
    write(fd, argv[1], strlen(argv[1]));
    read(fd, argv[1], strlen(argv[1]));
    printf("Read: %s\n", argv[1]);

Run it as:

    $ ./test 'A quick brown fox jumped over the lazy dog'
    Read: dog lazy the over jumped fox brown quick A

It works! Play with it a little: try passing single-word or single-letter phrases, empty or non-English strings (if you have a keyboard layout set) and anything else.

Now let’s make things a little trickier. We’ll create two processes that share the file descriptor (and hence the kernel buffer). One will continuously write strings to the device, and another will read them. The **fork(2)** system call is used in the example below, but pthreads will work as well. I also omitted the code that opens and closes the device and does the error checking (again):

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

What do you expect this program to output? Below is what I’ve got on my laptop:

    Read: dog lazy the over jumped fox brown quick A
    Read: A kcicq brown fox jumped over the lazy dog
    Read: A kciuq nworb xor jumped fox brown quick A
    Read: A kciuq nworb xor jumped fox brown quick A
    ...

What’s going on here? It’s a race. We thought **read** and **write** were atomic, or executed one instruction at a time from the beginning till the end. However the kernel is a concurrent beast, and it can easily reschedule the process running the kernel-mode part of the **write** operation somewhere inside the **reverse_phrase()** function. If the process that does **read()** is scheduled before the writer is given a chance to finish, it will see the data in an inconsistent state. Such bugs are really hard to debug. But how to fix it?

Basically, we need to ensure that no **read** method can be executed until the write method returns. If you ever programmed a multi-threaded application, you’ve probably seen synchronisation primitives (locks) like mutexes or semaphores. Linux has them as well, but there are nuances. Kernel code can run in the process context (working “on behalf” of the userspace code, as our methods do) and in the interrupt context (for example, in an IRQ handler). If you are in the process context and a lock you need has already been taken, you simply sleep and retry until you succeed. You can’t sleep in the interrupt context, so the code spins in a loop until the lock become available. The corresponding primitive is called a spinlock, but in our case, a simple mutex – an object that only one process can “hold” at the given time – is sufficient. A real-world code may also use a read-write semaphore, for performance reasons.

Locks always protect some data (in our case, a “struct buffer” instance), and it is very common to embed them in a structure they are protecting. So we add a mutex (‘struct mutex lock’) into the “struct buffer”. We must also initialise the mutex with **mutex_init()**; **buffer_alloc()** is a good place for this. The code that uses mutexes must also include **linux/mutex.h**.

A mutex is much like a traffic light – it’s useless unless drivers look at it and follow the signals. So we need to update **reverse_read()** and **reverse_write()** to acquire the mutex before doing anything to the buffer and release it when they are done. Let’s have a look at the **read** method – **write** works just the same way:

    static ssize_t reverse_read(struct file *file, char __user * out,
            size_t size, loff_t * off)
    {
        struct buffer *buf = file->private_data;
        ssize_t result;
        if (mutex_lock_interruptible(&buf->lock)) {
            result = -ERESTARTSYS;
            goto out;
    }

We acquire the lock at the very beginning of the function. **mutex_lock_interruptible()** either grabs the mutex and returns or puts the process to sleep until the mutex is available. As before, the **_interruptible** suffix means the sleep can be interrupted with a signal.

        while (buf->read_ptr == buf->end) {
            mutex_unlock(&buf->lock);
            /* ... wait_event_interruptible() here ... */
            if (mutex_lock_interruptible(&buf->lock)) {
                result = -ERESTARTSYS;
                goto out;
            }
        }

Below is our “wait for the data” loop. You should never sleep when holding a mutex, or a situation called a “deadlock” may occur. So, if there is no data, we release the mutex and call **wait_event_interruptible()**. When it returns, we reacquire the mutex and continue as usual:

        if (copy_to_user(out, buf->read_ptr, size)) {
            result = -EFAULT;
            goto out_unlock;
        }
        ...
    out_unlock:
        mutex_unlock(&buf->lock);
    out:
        return result;

Finally, the mutex is unlocked when the function ends or if an error occurs while the mutex is being held. Recompile the module (don’t forget to reload it) and run the second test again. You should see no corrupted data now.

### What’s next? ###

Now you have a taste of kernel hacking. We’ve just scratched the surface of the topic, and there is much more to see. Our first module was intentionally simple, however the concepts you learned will stay the same in more complex scenarios as well. Concurrency, method tables, registering callbacks, putting processes to sleep and waking them up are things that every kernel hacker should be comfortable with, and now you’ve seen all of them in action. Maybe your kernel code will end up in the mainline Linux source tree some day – drop us a line if this happens!

--------------------------------------------------------------------------------

via: http://www.linuxvoice.com/be-a-kernel-hacker/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.libusb.org/
[2]:http://fuse.sf.net/
[3]:http://www.linuxvoice.com/be-a-kernel-hacker/www.netfilter.org/projects/libnetfilter_queue
[4]:http://lxr.free-electrons.com/