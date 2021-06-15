[#]: subject: (Use cpulimit to free up your CPU)
[#]: via: (https://fedoramagazine.org/use-cpulimit-to-free-up-your-cpu/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use cpulimit to free up your CPU
======

![][1]

Photo by [Henning Witzel][2] on [Unsplash][3]

The recommended tool for managing system resources on Linux systems is [cgroups][4]. While very powerful in terms of what sorts of limits can be tuned (CPU, memory, disk I/O, network, etc.), configuring cgroups is non-trivial. The [_nice_][5] command has been available since 1973. But it only adjusts the scheduling priority among processes that are competing for time on a processor. The _nice_ command will not limit the percentage of CPU cycles that a process can consume per unit of time. The _[cpulimit][6]_ command provides the best of both worlds. It limits the percentage of CPU cycles that a process can allocate per unit of time and it is relatively easy to invoke.

The _cpulimit_ command is mainly useful for long-running and CPU-intensive processes. Compiling software and converting videos are common examples of long-running processes that can max out a computer’s CPU. Limiting the CPU usage of such processes will free up processor time for use by other tasks that may be running on the computer. Limiting CPU-intensive processes will also reduce the power consumption, heat output, and possibly the fan noise of the system. The trade-off for limiting a process’s CPU usage is that it will require more time to run to completion.

### Install cpulimit

The _cpulimit_ command is available in the default Fedora Linux repositories. Run the following command to install _cpulimit_ on a Fedora Linux system.

```
$ sudo dnf install cpulimit
```

### View the documentation for cpulimit

The cpulimit package does not come with a man page. Use the following command to view cpulimit’s built-in documentation. The output is provided below. But you may want to run the command on your own system in case the options have changed since this article was written.

```
$ cpulimit --help
Usage: cpulimit [OPTIONS…] TARGET
   OPTIONS
      -l, --limit=N percentage of cpu allowed from 0 to 800 (required)
      -v, --verbose show control statistics
      -z, --lazy exit if there is no target process, or if it dies
      -i, --include-children limit also the children processes
      -h, --help display this help and exit
   TARGET must be exactly one of these:
      -p, --pid=N pid of the process (implies -z)
      -e, --exe=FILE name of the executable program file or path name
      COMMAND [ARGS] run this command and limit it (implies -z)
```

### A demonstration

To demonstrate using the _cpulimit_ command, a contrived, computationally-intensive Python script is provided below. The script is run first with no limit and then with a limit of 50%. It computes the value of the 42nd [Fibonacci number][7]. The script is run as a child process of the _time_ command in both cases to show the total time that was required to compute the answer.

```
$ /bin/time -f '(computed in %e seconds)' /bin/python -c 'f = lambda n: n if n<2 else f(n-1)+f(n-2); print(f(42), end=" ")'
267914296 (computed in 51.80 seconds)
$ /bin/cpulimit -i -l 50 /bin/time -f '(computed in %e seconds)' /bin/python -c 'f = lambda n: n if n<2 else f(n-1)+f(n-2); print(f(42), end=" ")'
267914296 (computed in 127.38 seconds)
```

You might hear the CPU fan on your PC rev up when running the first version of the command. But you should not when running the second version. The first version of the command is not CPU limited but it should not cause your PC to become bogged down. It is written in such a way that it can only use at most one CPU. Most modern PCs have multiple CPUs and can simultaneously run other tasks without difficulty when one of the CPUs is 100% busy. To verify that the first command is maxing out one of your processors, run the _top_ command in a separate terminal window and press the **1** key. Press the **Q** key to quit the _top_ command.

Setting a limit above 100% is only meaningful on a program that is capable of [task parallelism][8]. For such programs, each increment of 100% represents full utilization of a CPU (200% = 2 CPUs, 300% = 3 CPUs, etc.).

Notice that the **-i** option has been passed to the _cpulimit_ command in the above example. This is necessary because the command to be limited is not a direct child process of the _cpulimit_ command. Rather it is a child process of the _time_ command which in turn is a child process of the _cpulimit_ command. Without the **-i** option, _cpulimit_ would only limit the _time_ command.

### Final notes

If you want to limit a graphical application that you start from a desktop icon, copy the application’s _.desktop_ file (often located under the _/usr/share/applications_ directory) to your _~/.local/share/applications_ directory and modify the _Exec_ line accordingly. Then run the following command to apply the changes.

```
$ update-desktop-database ~/.local/share/applications
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-cpulimit-to-free-up-your-cpu/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/06/cpulimit-816x345.jpg
[2]: https://unsplash.com/@henning?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/speed-limit?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://en.wikipedia.org/wiki/Cgroups
[5]: https://en.wikipedia.org/wiki/Nice_(Unix)
[6]: https://github.com/opsengine/cpulimit
[7]: https://en.wikipedia.org/wiki/Fibonacci_number
[8]: https://en.wikipedia.org/wiki/Task_parallelism
