[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12667-1.html)
[#]: subject: (Program hardware from the Linux command line)
[#]: via: (https://opensource.com/article/20/9/hardware-command-line)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)

使用 RT-Thread 的 FinSH 对硬件进行编程
======

> 由于物联网（IoT）的兴起，对硬件进行编程变得越来越普遍。RT-Thread 可以让你可以用 FinSH 从 Linux 命令行与设备进行沟通、
 
![](https://img.linux.net.cn/data/attachment/album/202009/29/233059w523g55qzvo53h6i.jpg)

RT-Thread 是一个开源的[实时操作系统][2]，用于对物联网（IoT）设备进行编程。FinSH 是 [RT-Thread][3] 的命令行组件，它提供了一套操作界面，使用户可以从命令行与设备进行沟通。它主要用于调试或查看系统信息。

通常情况下，开发调试使用硬件调试器和 `printf` 日志来显示。但在某些情况下，这两种方法并不是很有用，因为它是从运行的内容中抽象出来的，而且它们可能很难解析。不过 RT-Thread 是一个多线程系统，当你想知道一个正在运行的线程的状态，或者手动控制系统的当前状态时，这很有帮助。因为它是多线程的，所以你能够拥有一个交互式的 shell，你可以直接在设备上输入命令、调用函数来获取你需要的信息，或者控制程序的行为。如果你只习惯于 Linux 或 BSD 等现代操作系统，这在你看来可能很普通，但对于硬件黑客来说，这是极其奢侈的，远超将串行电缆直接连线到电路板上以获取一丝错误的做法。

FinSH 有两种模式。

  * C 语言解释器模式，称为 c-style。
  * 传统的命令行模式，称为 msh（模块 shell）。

在 C 语言解释器模式下，FinSH 可以解析执行大部分 C 语言的表达式，并使用函数调用访问系统上的函数和全局变量。它还可以从命令行创建变量。

在 msh 模式下，FinSH 的操作与 Bash 等传统 shell 类似。

### GNU 命令标准

当我们在开发 FinSH 时，我们了解到，在编写命令行应用程序之前，你需要熟悉 GNU 命令行标准。这个标准实践的框架有助于给界面带入熟悉感，这有助于开发人员在使用时感到舒适和高效。

一个完整的 GNU 命令主要由四个部分组成。

  1. 命令名（可执行文件）：命令行程序的名称；
  2. 子命令：命令程序的子函数名称。
  3. 选项：子命令函数的配置选项。
  4. 参数：子命令函数配置选项的相应参数。

你可以在任何命令中看到这一点。以 Git 为例：

```
git reset --hard HEAD~1
```

这一点可以分解为：

![GNU command line standards][4]

可执行的命令是 `git`，子命令是 `reset`，使用的选项是 `--head`，参数是 `HEAD~1`。

再举个例子：

```
systemctl enable --now firewalld
```

可执行的命令是 `systemctl`，子命令是 `enable`，选项是 `--now`，参数是 `firewalld`。

想象一下，你想用 RT-Thread 编写一个符合 GNU 标准的命令行程序。FinSH 拥有你所需要的一切，并且会按照预期运行你的代码。更棒的是，你可以依靠这种合规性，让你可以自信地移植你最喜欢的 Linux 程序。

### 编写一个优雅的命令行程序

下面是一个 RT-Thread 运行命令的例子，RT-Thread 开发人员每天都在使用这个命令：

```
usage: env.py package [-h] [--force-update] [--update] [--list] [--wizard]
                      [--upgrade] [--printenv]

optional arguments:
  -h, --help      show this help message and exit
  --force-update  force update and clean packages, install or remove the
                  packages by your settings in menuconfig
  --update        update packages, install or remove the packages by your
                  settings in menuconfig
  --list          list target packages
  --wizard        create a new package with wizard
  --upgrade       upgrade local packages list and ENV scripts from git repo
  --printenv      print environmental variables to check
```

正如你所看到的那样，它看起来很熟悉，行为就像你可能已经在 Linux 或 BSD 上运行的大多数 POSIX 应用程序一样。当使用不正确或不充分的语法时，它会提供帮助，它支持长选项和短选项。这种通用的用户界面对于任何使用过 Unix 终端的人来说都是熟悉的。

### 选项种类

选项的种类很多，按长短可分为两大类。

  1. 短选项：由一个连字符加一个字母组成，如 `pkgs -h` 中的 `-h` 选项。
  2. 长选项：由两个连字符加上单词或字母组成，例如，`scons- --target-mdk5` 中的 `--target` 选项。

你可以把这些选项分为三类，由它们是否有参数来决定。

  1. 没有参数：该选项后面不能有参数。
  2. 参数必选：选项后面必须有参数。
  3. 参数可选：选项后可以有参数，但不是必需的。

正如你对大多数 Linux 命令的期望，FinSH 的选项解析非常灵活。它可以根据空格或等号作为定界符来区分一个选项和一个参数，或者仅仅通过提取选项本身并假设后面的内容是参数（换句话说，完全没有定界符）。

  * `wavplay -v 50`
  * `wavplay -v50`
  * `wavplay --vol=50`

### 使用 optparse

如果你曾经写过命令行程序，你可能会知道，一般来说，你所选择的语言有一个叫做 optparse 的库或模块。它是提供给程序员的，所以作为命令的一部分输入的选项（比如 `-v` 或 `--verbose`）可以与命令的其他部分进行*解析*。这可以帮助你的代码从一个子命令或参数中获取一个选项。

当为 FinSH 编写一个命令时，`optparse` 包希望使用这种格式：

```
MSH_CMD_EXPORT_ALIAS(pkgs, pkgs, this is test cmd.);
```

你可以使用长形式或短形式，或者同时使用两种形式来实现选项。例如：

```
static struct optparse_long long_opts[] =
{
    {"help"        , 'h', OPTPARSE_NONE}, // Long command: help, corresponding to short command h, without arguments.
    {"force-update",  0 , OPTPARSE_NONE}, // Long comman: force-update, without arguments
    {"update"      ,  0 , OPTPARSE_NONE},
    {"list"        ,  0 , OPTPARSE_NONE},
    {"wizard"      ,  0 , OPTPARSE_NONE},
    {"upgrade"     ,  0 , OPTPARSE_NONE},
    {"printenv"    ,  0 , OPTPARSE_NONE},
    { NULL         ,  0 , OPTPARSE_NONE}
};
```

创建完选项后，写出每个选项及其参数的命令和说明：

```
static void usage(void)
{
    rt_kprintf("usage: env.py package [-h] [--force-update] [--update] [--list] [--wizard]\n");
    rt_kprintf("                      [--upgrade] [--printenv]\n\n");
    rt_kprintf("optional arguments:\n");
    rt_kprintf("  -h, --help      show this help message and exit\n");
    rt_kprintf("  --force-update  force update and clean packages, install or remove the\n");
    rt_kprintf("                  packages by your settings in menuconfig\n");
    rt_kprintf("  --update        update packages, install or remove the packages by your\n");
    rt_kprintf("                  settings in menuconfig\n");
    rt_kprintf("  --list          list target packages\n");
    rt_kprintf("  --wizard        create a new package with wizard\n");
    rt_kprintf("  --upgrade       upgrade local packages list and ENV scripts from git repo\n");
    rt_kprintf("  --printenv      print environmental variables to check\n");
}
```

下一步是解析。虽然你还没有实现它的功能，但解析后的代码框架是一样的：

```
int pkgs(int argc, char **argv)
{
    int ch;
    int option_index;
    struct optparse options;

    if(argc == 1)
    {
        usage();
        return RT_EOK;
    }

    optparse_init(&options, argv);
    while((ch = optparse_long(&options, long_opts, &option_index)) != -1)
    {
        ch = ch;

        rt_kprintf("\n");
        rt_kprintf("optopt = %c\n", options.optopt);
        rt_kprintf("optarg = %s\n", options.optarg);
        rt_kprintf("optind = %d\n", options.optind);
        rt_kprintf("option_index = %d\n", option_index);
    }
    rt_kprintf("\n");

    return RT_EOK;
}
```

这里是函数头文件：

```
#include "optparse.h"
#include "finsh.h"
```

然后，编译并下载到设备上。

![Output][6]

### 硬件黑客

对硬件进行编程似乎很吓人，但随着物联网的发展，它变得越来越普遍。并不是所有的东西都可以或者应该在树莓派上运行，但在 RT-Thread，FinSH 可以让你保持熟悉的 Linux 感觉。

如果你对在裸机上编码感到好奇，不妨试试 RT-Thread。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/hardware-command-line

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://opensource.com/article/20/6/open-source-rtos
[3]: https://github.com/RT-Thread/rt-thread
[4]: https://opensource.com/sites/default/files/uploads/command-line-apps_2.png (GNU command line standards)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/command-line-apps_3.png (Output)
