translating----geekpi

Linux FAQs with Answers--How to find information about built-in kernel modules on Linux
================================================================================
> **Question**: I would like to know what modules are built into the kernel of my Linux system, and what parameters are available in each module. Is there a way to get a list of all built-in kernel modules and device drivers, and find detailed information about them? 

The modern Linux kernel has been growing significantly over the years to support a wide variety of hardware devices, file systems and networking functions. During this time, "loadable kernel modules (LKM)" came into being in order to keep the kernel from getting bloated, while flexibly extending its capabilities and hardware support under different environments, without having to rebuild it.

The Linux kernel shipped with the latest Linux distributions comes with relatively a small number of "built-in modules", while the rest of hardware-specific drivers or custom capabilities exist as "loadable modules" which you can selectively load or unload.

The built-in modules are statically compiled into the kernel. Unlike loadable kernel modules which can be dynamically loaded, unloaded, looked up or listed using commands like modprobe, insmod, rmmod, modinfo or lsmod, built-in kernel modules are always loaded in the kernel upon boot-up, and cannot be managed with these commands.

### Find a List of Built-in Kernel Modules ###

To get a list of all built-in modules, run the following command.

    $ cat /lib/modules/$(uname -r)/modules.builtin 

![](https://farm1.staticflickr.com/697/21481933835_ef6b9c71e1_c.jpg)

You can also get a hint on what modules are built-in by running:

![](https://farm6.staticflickr.com/5643/21295025949_57f5849c36_c.jpg)

### Find Parameters of Built-in Kernel Modules ###

Each kernel module, whether it's built-in or loadable, comes with a set of parameters. For loadable kernel modules, the modinfo command will show parameter information about them. However, this command will not work with built-in modules. You will simply get the following error.

    modinfo: ERROR: Module XXXXXX not found.

If you want to check what parameters are available in a given built-in module, and what their values are, you can instead examine the content in **/sys/module** directory.

Under /sys/module directory, you will find sub-directories named after existing kernel modules (both built-in and loadable). Then in each module directory, there is a directory named "parameters", which lists all available parameters for the module.

For example, let's say you want to find out parameters of a built-in module called tcp_cubic (the default TCP implementation of the kernel). Then you can do this:

    $ ls /sys/module/tcp_cubic/parameters 

And check the value of each parameter by reading a corresponding file.

    $ cat /sys/module/tcp_cubic/parameters/tcp_friendliness 

![](https://farm6.staticflickr.com/5639/21293886250_a199b9c8f7_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/find-information-builtin-kernel-modules-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
