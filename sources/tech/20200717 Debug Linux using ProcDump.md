[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Debug Linux using ProcDump)
[#]: via: (https://opensource.com/article/20/7/procdump-linux)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

Debug Linux using ProcDump
======
Check out Microsoft's open source tool for getting process information.
![Dump truck rounding a turn in the road][1]

Microsoft's growing appreciation for Linux and open source is no secret. The company has steadily increased its contributions to open source in the last several years, including porting some of its software and tools to Linux. In late 2018, Microsoft [announced][2] it was porting some of its [Sysinternals][3] tools to Linux as open source, and [ProcDump for Linux][4] was the first such release.

If you have worked on Windows in debugging or troubleshooting, you have probably heard of Sysinternals. It is a "Swiss Army knife" toolset that helps system administrators, developers, and IT security professionals monitor and troubleshoot Windows environments.

One of Sysinternals' most popular tools is [ProcDump][5]. As its name suggests, it is used for dumping the memory of a running process into a core file on disk. This core file can then be analyzed using a debugger to understand the process' state when the dump was taken. Having used Sysinternals previously, I was curious to try out the Linux port of ProcDump.

### Get started with ProcDump for Linux

To try ProcDump for Linux, you need to download the tool and compile it. (I am using Red Hat Enterprise Linux, though these instructions should work the same on other Linux distros):


```
$ cat /etc/redhat-release
Red Hat Enterprise Linux release 8.2 (Ootpa)
$
$ uname -r
4.18.0-193.el8.x86_64
$
```

First, clone the ProcDump for Linux repository:


```
$ git clone <https://github.com/microsoft/ProcDump-for-Linux.git>
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

Next, build the program using `make`. It prints out the exact [GCC][6] command-line interface needed to compile the source files:


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

The compilation creates two new directories. First is an `obj/` directory, which holds the object files created during compilation. The second (and more important) directory is `bin/`, which is where the compiled `procdump` program is stored. It also compiles another test binary called `ProcDumpTestApplication`:


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

With this setup, every time you run the `procdump` utility, you must move into the `bin/` folder. To make it available from anywhere within the system, run `make install`. This copies the binary into the usual `bin/` directory, which is part of your shell's `$PATH`:


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

With installation, ProcDump provides a man page, which you can access with `man procdump`:


```
$ man procdump
$
```

### Run ProcDump

To dump a process' memory, you need to provide its process ID (PID) to ProcDump. You can use any of the running programs or daemons on your machine. For this example, I will use a tiny C program that loops forever. Compile the program and run it (to exit the program, hit **Ctrl**+**C**, or if it's running in the background, use the `kill` command with the PID):


```
$ cat progxyz.c
#include &lt;stdio.h&gt;

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
$ ./progxyz &amp;
[1] 350498
$
```

By running the program, you can find its PID using either `pgrep` or `ps`. Make note of the PID:


```
$ pgrep progxyz
350498
$
$ ps -ef | grep progxyz
root      350498  345445  0 03:29 pts/1    00:00:00 ./progxyz
root      350508  347350  0 03:29 pts/0    00:00:00 grep --color=auto progxyz
$
```

While the test process is running, invoke `procdump` and provide the PID. The output states the name of the process and the PID, reports that a `Core dump` was generated, and shows its file name:


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

List the contents of the current directory, and you should see the new core file. The file name matches the one shown by the `procdump` command, and the date, time, and PID are appended to it:


```
$ ls -l progxyz_time_2020-06-24_03\:30\:00.350498
-rw-r--r--. 1 root root 356848 Jun 24 03:30 progxyz_time_2020-06-24_03:30:00.350498
$
$ file progxyz_time_2020-06-24_03\:30\:00.350498
progxyz_time_2020-06-24_03:30:00.350498: ELF 64-bit LSB core file, x86-64, version 1 (SYSV), SVR4-style, from './progxyz', real uid: 0, effective uid: 0, real gid: 0, effective gid: 0, execfn: './progxyz', platform: 'x86_64'
$
```

### Analyze the core file with the GNU Project Debugger

To see if you can read the proc file, invoke the [GNU Project Debugger][7] (`gdb`). Remember to provide the test binary's path so you can see all the function names on the stack. Here, `bt` (backtrace) shows that the `sleep()` function was being executed when the dump was taken:


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

### What about gcore?

Linux users will be quick to point out that Linux already has a command called `gcore`, which ships with most Linux distros and does the exact same thing as ProcDump. This is a valid argument. If you have never used it, try the following to dump a process' core with `gcore`. Run the test program again, then run `gcore`, and provide the PID as an argument:


```
$ ./progxyz &amp;
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

`gcore` prints a message saying it has saved the core to a specific file. Check the current directory to find this core file, and use `gdb` again to load it:


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

For `gcore` to work, you need to make sure the following settings are in place. First, ensure the `ulimit` is set for core files; if it is set to `0`, core files won't be generated. Second, ensure that `/proc/sys/kernel/core_pattern` has the proper settings to specify the core pattern:


```
$ ulimit -c
unlimited
$
```

### Should you use ProcDump or gcore?

There are several cases where you might prefer using ProcDump instead of gcore, and ProcDump has a few built-in features that might be useful in general.

#### Waiting for a test binary to execute

Whether you use ProcDump or gcore, the test process must be executed and in a running state so that you can provide a PID to generate a core file. But ProcDump has a feature that waits until a specific binary runs; once it finds a test binary running that matches that given name, it generates a core file for that test binary. It can be enabled using the `-w` argument and the program's name instead of a PID. This feature can be useful in instances where the test program exits quickly.

Here's how it works. In this example, there is no process named `progxyz` running:


```
$ pgrep progxyz
$
```

Invoke `procdump` with the `-w` command to keep it waiting. From another terminal, invoke the test binary `progxyz`:


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

Then, from another terminal, invoke the test binary `progxyz`: 


```
$ ./progxyz &amp;
[1] 350951
$
```

ProcDump immediately detects that the binary is running and dumps the core file for this binary:


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

#### Multiple core dumps

Another important ProcDump feature is that you can specify how many core files to generate by using the command-line argument `-n <count>`. The default time gap between the core dumps is 10 seconds, but you can modify this using the `-s <sec>` argument. This example uses ProcDump to take three core dumps of the test binary:


```
$ ./progxyz &amp;
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

#### Core dump based on CPU and memory usage

ProcDump also enables you to trigger a core dump when a test binary or process reaches a certain CPU or memory threshold. ProcDump's man page shows the command-line arguments to use when invoking ProcDump:


```
-C          Trigger core dump generation when CPU exceeds or equals specified value (0 to 100 * nCPU)
-c          Trigger core dump generation when CPU is less than specified value (0 to 100 * nCPU)
-M          Trigger core dump generation when memory commit exceeds or equals specified value (MB)
-m          Trigger core dump generation when when memory commit is less than specified value (MB)
-T          Trigger when thread count exceeds or equals specified value.
-F          Trigger when filedescriptor count exceeds or equals specified value.
-I          Polling frequency in milliseconds (default is 1000)
```

For example, you can ask ProcDump to dump the core when the given PID's CPU usage exceeds 70%:


```
`procdump -C 70 -n 3 -p 351014`
```

### Conclusion

ProcDump is an interesting addition to the long list of Windows programs being ported to Linux. Not only does it provide additional tooling options to Linux users, but it can also make Windows users feel more at home when working on Linux.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/procdump-linux

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
