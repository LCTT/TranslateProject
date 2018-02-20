简单介绍 ldd Linux 命令
=========================================

如果您的工作涉及到 Linux 中的可执行文件和共享库的知识，则需要了解几种命令行工具。其中之一是 ldd ，您可以使用它来访问共享对象依赖关系。在本教程中，我们将使用一些易于理解的示例来讨论此实用程序的基础知识。

请注意，这里提到的所有示例都已在 Ubuntu 16.04 LTS 上进行了测试。


### Linux ldd 命令

正如开头已经提到的，ldd 命令打印共享对象依赖关系。以下是该命令的语法：

`ldd [option]... file...`

下面是该工具的手册页对它作出的解释：

```
ldd prints the shared objects (shared libraries) required by each program or shared object 

specified on the command line.

```

以下使用问答的方式让您更好地了解ldd的工作原理。

### 问题一. 如何使用 ldd 命令?

ldd 的基本用法非常简单，只需运行 'ldd' 命令以及可执行文件或共享对象文件名称作为输入。

`ldd [object-name]`

例如：

`ldd test`

[![How to use ldd](https://www.howtoforge.com/images/command-tutorial/ldd-basic.png)](https://www.howtoforge.com/images/command-tutorial/big/ldd-basic.png)

所以你可以看到所有的共享库依赖已经在输出中产生了。

### Q2. 如何使 ldd 在输出中生成详细的信息？

如果您想要 ldd 生成详细信息，包括符号版本控制数据，则可以使用 **-v** 命令行选项。例如，该命令

`ldd -v test`

当使用-v命令行选项时，在输出中产生以下内容：

[![How to make ldd produce detailed information in output](https://www.howtoforge.com/images/command-tutorial/ldd-v-option.png)](https://www.howtoforge.com/images/command-tutorial/big/ldd-v-option.png)

### Q3. 如何使 ldd 产生未使用的直接依赖关系？

对于这个信息，使用 **-u** 命令行选项。这是一个例子：

`ldd -u test`

[![How to make ldd produce unused direct dependencies](https://www.howtoforge.com/images/command-tutorial/ldd-u-test.png)](https://www.howtoforge.com/images/command-tutorial/big/ldd-u-test.png)

### Q4. 如何让 ldd 执行重定位？

您可以在这里使用几个命令行选项：**-d** 和 **-r**。 前者告诉 ldd 执行数据重定位，后者则使 ldd 为数据对象和函数执行重定位。在这两种情况下，该工具都会报告丢失的 ELF 对象（如果有的话）。

`ldd -d`

`ldd -r`

### Q5. 如何获得关于ldd的帮助？

--help 命令行选项使 ldd 为该工具生成有用的用法相关信息。

`ldd --help`

[![How get help on ldd](https://www.howtoforge.com/images/command-tutorial/ldd-help-option.png)](https://www.howtoforge.com/images/command-tutorial/big/ldd-help-option.png)

### 总结

ldd 不像 cd，rm 和 mkdir 这样的工具类别。这是因为它是为特定目的而构建的。该实用程序提供了有限的命令行选项，我们在这里介绍了其中的大部分。要了解更多信息，请前往 ldd 的[手册页](https://linux.die.net/man/1/ldd)。

* * *

via: [https://www.howtoforge.com/linux-ldd-command/](https://www.howtoforge.com/linux-ldd-command/)

作者: [Himanshu Arora](https://www.howtoforge.com/) 选题者: [@lujun9972](https://github.com/lujun9972) 译者: [MonkeyDEcho](https://github.com/MonkeyDEcho) 校对: [校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出