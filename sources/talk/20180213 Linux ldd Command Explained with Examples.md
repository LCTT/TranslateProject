Linux ldd Command Explained with Examples
=========================================

If your work involves deep knowledge of executables and shared libraries in Linux, there are several command line tools that you should be aware of. One of those is ldd, which you can use to access shared object dependencies. In this tutorial, we will discuss the basics of this utility using some easy to understand examples.

Please note that all examples mentioned here have been tested on Ubuntu 16.04 LTS.

### Linux ldd command

As already mentioned in the beginning, the ldd command prints shared object dependencies. Following is the command's syntax:

`ldd [option]... file...`

And here's how the tool's man page explains it:

```
ldd prints the shared objects (shared libraries) required by each program or shared object 

specified on the command line.

```

The following Q&A-styled examples should give you a better idea on how ldd works.

### Q1. How to use ldd?

Basic usage of ldd is fairly simple - just run the 'ldd' command along with an executable or shared object file name as input.

`ldd [object-name]`

For example:

`ldd test`

[![How to use ldd](https://www.howtoforge.com/images/command-tutorial/ldd-basic.png)](https://www.howtoforge.com/images/command-tutorial/big/ldd-basic.png)

So you can see all shared library dependencies have been produced in output.

### Q2. How to make ldd produce detailed information in output?

If you want ldd to produce detailed information, including symbol versioning data, you can use the -v command line option. For example, the command

`ldd -v test`

produced the following in output when the **-v** command line option was used:

[![How to make ldd produce detailed information in output](https://www.howtoforge.com/images/command-tutorial/ldd-v-option.png)](https://www.howtoforge.com/images/command-tutorial/big/ldd-v-option.png)

### Q3. How to make ldd produce unused direct dependencies?

For this info, use the **-u** command line option. Here's an example:

`ldd -u test`

[![How to make ldd produce unused direct dependencies](https://www.howtoforge.com/images/command-tutorial/ldd-u-test.png)](https://www.howtoforge.com/images/command-tutorial/big/ldd-u-test.png)

### Q4. How make ldd perform relocations?

There are a couple of command line options you can use here: **-d** and **-r**. While the former tells ldd to perform data relocations, the latter makes ldd perform relocations for both data objects and functions. In both cases, the tool reports missing ELF objects (if any).

`ldd -d`

`ldd -r`

### Q5. How get help on ldd?

The --help command line option makes ldd produce useful usage-related information for the tool.

`ldd --help`

[![How get help on ldd](https://www.howtoforge.com/images/command-tutorial/ldd-help-option.png)](https://www.howtoforge.com/images/command-tutorial/big/ldd-help-option.png)

### Conclusion

Agreed, ldd doesn't fall into the category where tools like cd, rm, and mkdir fit in. That's because it's built for a specific purpose, and it does what it promises. The utility offers limited command line options, and we've covered most of them here. To know more, head to ldd's [man page](https://linux.die.net/man/1/ldd).

* * *

via: [https://www.howtoforge.com/linux-ldd-command/](https://www.howtoforge.com/linux-ldd-command/)

作者: [Himanshu Arora](https://www.howtoforge.com/) 选题者: [@lujun9972](https://github.com/lujun9972) 译者: [译者ID](https://github.com/译者ID) 校对: [校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出