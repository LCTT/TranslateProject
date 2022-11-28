[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12533-1.html)
[#]: subject: (Debug Linux using ProcDump)
[#]: via: (https://opensource.com/article/20/7/procdump-linux)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

使用微软的 ProcDump 调试 Linux 进程
======

> 用这个微软的开源工具，获取进程信息。

![](https://img.linux.net.cn/data/attachment/album/202008/20/095646k5wz7cd11vyc7lhr.jpg)

微软越来越心仪 Linux 和开源，这并不是什么秘密。在过去几年中，该公司稳步地增加了对开源的贡献，包括将其部分软件和工具移植到 Linux。2018 年底，微软[宣布][2]将其 [Sysinternals][3] 的部分工具以开源的方式移植到 Linux，[Linux 版的 ProcDump][4]是其中的第一个。

如果你在 Windows 上从事过调试或故障排除工作，你可能听说过 Sysinternals，它是一个“瑞士军刀”工具集，可以帮助系统管理员、开发人员和 IT 安全专家监控和排除 Windows 环境的故障。

Sysinternals 最受欢迎的工具之一是 [ProcDump][5]。顾名思义，它用于将正在运行的进程的内存转储到磁盘上的一个核心文件中。然后可以用调试器对这个核心文件进行分析，了解转储时进程的状态。因为之前用过 Sysinternals，所以我很想试试 ProcDump 的 Linux 移植版。

### 开始使用 Linux 上的 ProcDump

要试用 Linux 上的 ProcDump，你需要下载该工具并编译它。（我使用的是 Red Hat Enterprise Linux，尽管这些步骤在其他 Linux 发行版上应该是一样的）：

```
$ cat /etc/redhat-release
Red Hat Enterprise Linux release 8.2 (Ootpa)
$
$ uname -r
4.18.0-193.el8.x86_64
$
```

首先，克隆 Linux 版 ProcDump 的版本库。

```
$ git clone https://github.com/microsoft/ProcDump-for-Linux.git
Cloning into 'ProcDump-for-Linux'...
remote: Enumerating objects: 40, done.
remote: Counting objects: 100% (40/40), done.
remote: Compressing objects: 100% (33/33), done.
remote: Total 414 (delta 14), reused 14 (delta 6), pack-reused 374
Receiving objects: 100% (414/414), 335.28 KiB | 265.00 KiB/s, done.
Resolving deltas: 100% (232/232), done.
$
$ cd ProcDump-for-Linux/
$
$ ls
azure-pipelines.yml  CONTRIBUTING.md  docs     INSTALL.md  Makefile    procdump.gif  src
CODE_OF_CONDUCT.md   dist             include  LICENSE     procdump.1  README.md     tests
$
```

接下来，使用 `make` 构建程序。它能准确地输出编译源文件所需的 [GCC][6] 命令行参数。

```
$ make
rm -rf obj
rm -rf bin
rm -rf /root/ProcDump-for-Linux/pkgbuild
gcc -c -g -o obj/Logging.o src/Logging.c -Wall -I ./include -pthread -std=gnu99
gcc -c -g -o obj/Events.o src/Events.c -Wall -I ./include -pthread -std=gnu99
gcc -c -g -o obj/ProcDumpConfiguration.o src/ProcDumpConfiguration.c -Wall -I ./include -pthread -std=gnu99
gcc -c -g -o obj/Handle.o src/Handle.c -Wall -I ./include -pthread -std=gnu99
gcc -c -g -o obj/Process.o src/Process.c -Wall -I ./include -pthread -std=gnu99
gcc -c -g -o obj/Procdump.o src/Procdump.c -Wall -I ./include -pthread -std=gnu99
gcc -c -g -o obj/TriggerThreadProcs.o src/TriggerThreadProcs.c -Wall -I ./include -pthread -std=gnu99
gcc -c -g -o obj/CoreDumpWriter.o src/CoreDumpWriter.c -Wall -I ./include -pthread -std=gnu99
gcc -o bin/procdump obj/Logging.o obj/Events.o obj/ProcDumpConfiguration.o obj/Handle.o obj/Process.o obj/Procdump.o obj/TriggerThreadProcs.o obj/CoreDumpWriter.o -Wall -I ./include -pthread -std=gnu99
gcc -c -g -o obj/ProcDumpTestApplication.o tests/integration/ProcDumpTestApplication.c -Wall -I ./include -pthread -std=gnu99
gcc -o bin/ProcDumpTestApplication obj/ProcDumpTestApplication.o -Wall -I ./include -pthread -std=gnu99
$
```

编译过程中会创建两个新的目录。第一个是 `obj/` 目录，存放编译期间创建的对象文件。第二个（也是更重要的）目录是 `bin/`，它是存储编译出的 `procdump` 程序的地方。它还会编译另一个名为 `ProcDumpTestApplication` 的测试二进制文件：

```
$ ls obj/
CoreDumpWriter.o  Handle.o   ProcDumpConfiguration.o  ProcDumpTestApplication.o  TriggerThreadProcs.o
Events.o          Logging.o  Procdump.o               Process.o
$
$
$ ls bin/
procdump  ProcDumpTestApplication
$
$ file bin/procdump
bin/procdump: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=6e8827db64835ea0d1f0941ac3ecff9ee8c06e6b, with debug_info, not stripped
$
$ file bin/ProcDumpTestApplication
bin/ProcDumpTestApplication: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=c8fd86f53c07df142e52518815b2573d1c690e4e, with debug_info, not stripped
$
```

在此情况下，每次运行 `procdump` 实用程序时，你都必须移动到 `bin/` 文件夹中。要使它在系统中的任何地方都可以使用，运行 `make install`。这将这个二进制文件复制到通常的 `bin/` 目录中，它是你的 shell `$PATH` 的一部分：

```
$ which procdump
/usr/bin/which: no procdump in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin)
$
$ make install
mkdir -p //usr/bin
cp bin/procdump //usr/bin
mkdir -p //usr/share/man/man1
cp procdump.1 //usr/share/man/man1
$
$ which procdump
/usr/bin/procdump
$
```

安装时，ProcDump 提供了一个手册页，你可以用 `man procdump` 访问：

```
$ man procdump
$
```

### 运行 ProcDump

要转储一个进程的内存，你需要向 ProcDump 提供它的进程 ID（PID）。你可以使用机器上任何正在运行的程序或守护进程。在这个例子中，我将使用一个永远循环的小 C 程序。编译程序并运行它（要退出程序，按 `Ctrl+C`，如果程序在后台运行，则使用 `kill` 命令并输入 PID）：

```
$ cat progxyz.c
#include <stdio.h>

int main() {
        for (;;)
        {
                printf(".");
                sleep(1);
        }
        return 0;
}
$
$ gcc progxyz.c -o progxyz
$
$ ./progxyz &
[1] 350498
$
```

运行该程序，你可以使用 `pgrep` 或 `ps` 找到它的 PID。记下 PID：

```
$ pgrep progxyz
350498
$
$ ps -ef | grep progxyz
root      350498  345445  0 03:29 pts/1    00:00:00 ./progxyz
root      350508  347350  0 03:29 pts/0    00:00:00 grep --color=auto progxyz
$
```

当测试进程正在运行时，调用 `procdump` 并提供 PID。下面的输出表明了该进程的名称和 PID，并报告它生成了一个核心转储文件，并显示其文件名：

```
$ procdump -p 350498

ProcDump v1.1.1 - Sysinternals process dump utility
Copyright (C) 2020 Microsoft Corporation. All rights reserved. Licensed under the MIT license.
Mark Russinovich, Mario Hewardt, John Salem, Javid Habibi
Monitors a process and writes a dump file when the process exceeds the
specified criteria.

Process:                progxyz (350498)
CPU Threshold:          n/a
Commit Threshold:       n/a
Polling interval (ms):  1000
Threshold (s):  10
Number of Dumps:        1

Press Ctrl-C to end monitoring without terminating the process.

[03:30:00 - INFO]: Timed:
[03:30:01 - INFO]: Core dump 0 generated: progxyz_time_2020-06-24_03:30:00.350498
$
```

列出当前目录的内容，你应该可以看到新的核心文件。文件名与 `procdump` 命令显示的文件名一致，日期、时间、PID 都会附加在文件名上：

```
$ ls -l progxyz_time_2020-06-24_03\:30\:00.350498
-rw-r--r--. 1 root root 356848 Jun 24 03:30 progxyz_time_2020-06-24_03:30:00.350498
$
$ file progxyz_time_2020-06-24_03\:30\:00.350498
progxyz_time_2020-06-24_03:30:00.350498: ELF 64-bit LSB core file, x86-64, version 1 (SYSV), SVR4-style, from './progxyz', real uid: 0, effective uid: 0, real gid: 0, effective gid: 0, execfn: './progxyz', platform: 'x86_64'
$
```

### 用 GNU 项目调试器分析核心文件。

要查看是否可以读取该转储文件，调用 [GNU 项目调试器][7]（`gdb`）。记得提供测试二进制文件的路径，这样你就可以看到堆栈上所有的函数名。在这里，`bt`（回溯）表明，当转储被采集时，`sleep()` 函数正在执行：

```
$ gdb -q ./progxyz ./progxyz_time_2020-06-24_03\:30\:00.350498
Reading symbols from ./progxyz...(no debugging symbols found)...done.
[New LWP 350498]
Core was generated by `./progxyz'.
#0  0x00007fb6947e9208 in nanosleep () from /lib64/libc.so.6
Missing separate debuginfos, use: yum debuginfo-install glibc-2.28-101.el8.x86_64
(gdb) bt
#0  0x00007fb6947e9208 in nanosleep () from /lib64/libc.so.6
#1  0x00007fb6947e913e in sleep () from /lib64/libc.so.6
#2  0x00000000004005f3 in main ()
(gdb)
```

### gcore 怎么样？

Linux 用户会很快指出，Linux 已经有一个叫 `gcore` 的命令，大多数 Linux 发行版都有这个命令，它的作用和 ProcDump 完全一样。你说的对。如果你从来没有使用过它，可以尝试用 `gcore` 来转储一个进程的核心。再次运行测试程序，然后运行 `gcore`，并提供 PID 作为参数：

```
$ ./progxyz &
[1] 350664
$
$
$ pgrep progxyz
350664
$
$
$ gcore 350664
0x00007fefd3be2208 in nanosleep () from /lib64/libc.so.6
Saved corefile core.350664
[Inferior 1 (process 350664) detached]
$
```

`gcore` 打印一条消息，说它已将核心文件保存到一个特定的文件中。检查当前目录，找到这个核心文件，然后再次使用 `gdb` 加载它：

```
$
$ ls -l  core.350664
-rw-r--r--. 1 root root 356848 Jun 24 03:34 core.350664
$
$
$ file core.350664
core.350664: ELF 64-bit LSB core file, x86-64, version 1 (SYSV), SVR4-style, from './progxyz', real uid: 0, effective uid: 0, real gid: 0, effective gid: 0, execfn: './progxyz', platform: 'x86_64'
$
$ gdb -q ./progxyz ./core.350664
Reading symbols from ./progxyz...(no debugging symbols found)...done.
[New LWP 350664]
Core was generated by `./progxyz'.
#0  0x00007fefd3be2208 in nanosleep () from /lib64/libc.so.6
Missing separate debuginfos, use: yum debuginfo-install glibc-2.28-101.el8.x86_64
(gdb) bt
#0  0x00007fefd3be2208 in nanosleep () from /lib64/libc.so.6
#1  0x00007fefd3be213e in sleep () from /lib64/libc.so.6
#2  0x00000000004005f3 in main ()
(gdb) q
$
```

为了使 `gcore` 可以工作，你需要确保以下设置到位。首先，确保为核心文件设置了 `ulimit`，如果设置为 `0`，核心文件将不会被生成。第二，确保 `/proc/sys/kernel/core_pattern` 有正确的设置来指定核心模式：

```
$ ulimit -c
unlimited
$
```

### 你应该使用 ProcDump 还是 gcore？

有几种情况下，你可能更喜欢使用 ProcDump 而不是 gcore，ProcDump 有一些内置的功能，在一些情况下可能很有用。

#### 等待测试二进制文件的执行

无论是使用 ProcDump 还是 gcore，测试进程必须被执行并处于运行状态，这样才能提供一个 PID 来生成核心文件。但 ProcDump 有一个功能，就是等待特定的二进制文件运行，一旦发现运行的测试二进制文件与给定的名称相匹配，它就会为该测试二进制文件生成一个核心文件。它可以使用 `-w` 参数和程序名称而不是 PID 来启用。这个功能在测试程序快速退出的情况下很有用。

下面是它的工作原理。在这个例子中，没有名为 `progxyz` 的进程在运行：

```
$ pgrep progxyz
$
```

用 `-w` 参数调用 `procdump`，让它保持等待。在另一个终端，调用测试二进制 `progxyz`：

```
$ procdump -w progxyz

ProcDump v1.1.1 - Sysinternals process dump utility
Copyright (C) 2020 Microsoft Corporation. All rights reserved. Licensed under the MIT license.
Mark Russinovich, Mario Hewardt, John Salem, Javid Habibi
Monitors a process and writes a dump file when the process exceeds the
specified criteria.

Process:                progxyz (pending)
CPU Threshold:          n/a
Commit Threshold:       n/a
Polling interval (ms):  1000
Threshold (s):  10
Number of Dumps:        1

Press Ctrl-C to end monitoring without terminating the process.

[03:39:23 - INFO]: Waiting for process 'progxyz' to launch...
```

然后，从另一个终端调用测试二进制 `progxyz`：

```
$ ./progxyz &
[1] 350951
$
```

ProcDump 立即检测到该二进制正在运行，并转储这个二进制的核心文件：

```
[03:39:23 - INFO]: Waiting for process 'progxyz' to launch...
[03:43:22 - INFO]: Found process with PID 350951
[03:43:22 - INFO]: Timed:
[03:43:23 - INFO]: Core dump 0 generated: progxyz_time_2020-06-24_03:43:22.350951
$

$ ls -l progxyz_time_2020-06-24_03\:43\:22.350951
-rw-r--r--. 1 root root 356848 Jun 24 03:43 progxyz_time_2020-06-24_03:43:22.350951
$
$ file progxyz_time_2020-06-24_03\:43\:22.350951
progxyz_time_2020-06-24_03:43:22.350951: ELF 64-bit LSB core file, x86-64, version 1 (SYSV), SVR4-style, from './progxyz', real uid: 0, effective uid: 0, real gid: 0, effective gid: 0, execfn: './progxyz', platform: 'x86_64'
$
```

#### 多个核心转储

另一个重要的 ProcDump 功能是，你可以通过使用命令行参数 `-n <count>` 指定要生成多少个核心文件。核心转储之间的默认时间间隔是 `10` 秒，但你可以使用 `-s <sec>` 参数修改。这个例子使用 ProcDump 对测试二进制文件进行了三次核心转储：

```
$ ./progxyz &
[1] 351014
$
$ procdump -n 3 -p 351014

ProcDump v1.1.1 - Sysinternals process dump utility
Copyright (C) 2020 Microsoft Corporation. All rights reserved. Licensed under the MIT license.
Mark Russinovich, Mario Hewardt, John Salem, Javid Habibi
Monitors a process and writes a dump file when the process exceeds the
specified criteria.

Process:                progxyz (351014)
CPU Threshold:          n/a
Commit Threshold:       n/a
Polling interval (ms):  1000
Threshold (s):  10
Number of Dumps:        3

Press Ctrl-C to end monitoring without terminating the process.

[03:45:20 - INFO]: Timed:
[03:45:21 - INFO]: Core dump 0 generated: progxyz_time_2020-06-24_03:45:20.351014
[03:45:31 - INFO]: Timed:
[03:45:32 - INFO]: Core dump 1 generated: progxyz_time_2020-06-24_03:45:31.351014
[03:45:42 - INFO]: Timed:
[03:45:44 - INFO]: Core dump 2 generated: progxyz_time_2020-06-24_03:45:42.351014
$
$ ls -l progxyz_time_2020-06-24_03\:45\:*
-rw-r--r--. 1 root root 356848 Jun 24 03:45 progxyz_time_2020-06-24_03:45:20.351014
-rw-r--r--. 1 root root 356848 Jun 24 03:45 progxyz_time_2020-06-24_03:45:31.351014
-rw-r--r--. 1 root root 356848 Jun 24 03:45 progxyz_time_2020-06-24_03:45:42.351014
$
```

#### 基于 CPU 和内存使用情况的核心转储

ProcDump 还可以让你在测试二进制或进程达到一定的 CPU 或内存阈值时触发核心转储。ProcDump 的手册页显示了调用 ProcDump 时使用的命令行参数：

- `-C`：当 CPU 超过或等于指定值时，触发核心转储生成（0 到 100 * nCPU）。
- `-c`：当 CPU 小于指定值时，触发核心转储生成（0 到 100 * nCPU）。 
- `-M`：当内存提交超过或等于指定值（MB）时，触发核心转储生成。
- `-m`：当内存提交小于指定值（MB）时，触发核心转储生成。
- `-T`：当线程数超过或等于指定值时触发。
- `-F`：当文件描述符数量超过或等于指定值时触发。
- `-I`：轮询频率，单位为毫秒（默认为 1000）。

例如，当给定 PID 的 CPU 使用率超过 70% 时，可以要求 ProcDump 转储核心：

```
procdump -C 70 -n 3 -p 351014
```

### 结论

ProcDump 是一长串被移植到 Linux 的 Windows 程序中的一个有趣的补充。它不仅为 Linux 用户提供了额外的工具选择，而且可以让 Windows 用户在 Linux 上工作时更有熟悉的感觉。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/procdump-linux

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dumptruck_car_vehicle_storage_container_road.jpg?itok=TWK0CbX_ (Dump truck rounding a turn in the road)
[2]: https://www.zdnet.com/article/microsoft-working-on-porting-sysinternals-to-linux/
[3]: https://docs.microsoft.com/en-us/sysinternals/
[4]: https://github.com/Microsoft/ProcDump-for-Linux
[5]: https://docs.microsoft.com/en-us/sysinternals/downloads/procdump
[6]: https://gcc.gnu.org/
[7]: https://www.gnu.org/software/gdb/
