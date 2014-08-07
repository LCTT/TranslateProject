Linux FAQs with Answers--How to check what libraries are used by a program or process on Linux
================================================================================
> **Question**: I would like to know which shared libraries are loaded at run-time when I invoke a particular executable. Is there any way to identify shared library dependencies of a program executable or a running process on Linux?

### Check shared library dependencies of a program executable ###

To find out what libraries a particular executable depends on, you can use ldd command. This command invokes dynamic linker to find out library dependencies of an executable.

    $ ldd /path/to/program 

![](https://farm4.staticflickr.com/3872/14846153231_195cfff0f0_z.jpg)

Note that it is NOT recommended to run ldd with any untrusted third-party executable because some versions of ldd may directly invoke the executable to identify its library dependencies, which can be security risk.

Instead, a safer way to show library dependencies of an unknown application binary is to use the following command.

    $ objdump -p /path/to/program | grep NEEDED 

![](https://farm6.staticflickr.com/5552/14849218545_e3b667e742_o.png)

Check shared library dependencies of a running process

If you want to find out what shared libraries are loaded by a running process, you can use pldd command, which shows all shared objects loaded into a process at run-time.

    $ sudo pldd <PID>

Note that you need root privilege to run pldd command.

![](https://farm6.staticflickr.com/5570/14846775694_96a6b96592_z.jpg)

Alternatively, a command line utility called pmap, which reports memory map of a process, can also show shared library dependencies of a running process.

    $ sudo pmap <PID> 

![](https://farm4.staticflickr.com/3919/14848885042_7e5bee2684_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-library-dependency-program-process-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出