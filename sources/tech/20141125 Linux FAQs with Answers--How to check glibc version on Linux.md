Linux FAQs with Answers--How to check glibc version on Linux
================================================================================
> **Question**: I need to find out the version of the GNU C library (glibc) that I have on my Linux system. How can I check glibc version on Linux? 

The GNU C library (glibc) is the GNU implementation of the standard C library. glibc is a critical component of the GNU toolchain, which is used along with binutils and compiler to generate userspace application binaries for a target architecture.

When built from source, some Linux programs may be required to link against a particular version of glibc. In that case, you may want to check out the information about installed glibc to see if dependencies are met.

Here are simple ways to check glibc version on Linux.

### Method One ###

A simple command-line to check the version of the GNU C library is as follows.

    $ ldd --version 

![](https://farm6.staticflickr.com/5613/15631104658_940163834a_z.jpg)

In this example, the version of **glibc is 2.19**.

### Method Two ###

Another method is to "type" the **glibc library** (i.e., libc.so.6) from the command line as if it were a command.

The output will show more detailed information about **glibc library**, including the version of glibc and the GNU compiler used, as well as available glibc extensions. The location of glibc varies depending on distros and processor architectures.

On 64-bit Debian based system:

    $ /lib/x86_64-linux-gnu/libc.so.6

on 32-bit Debian based system:

    $ /lib/i386-linux-gnu/libc.so.6

On 64-bit Red Hat based system:

    $ /lib64/libc.so.6

On 32-bit Red Hat based systems:

    $ /lib/libc.so.6

Here is the sample output of typing glibc library.

![](https://farm8.staticflickr.com/7516/15631334667_ef50b247a4_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-glibc-version-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出