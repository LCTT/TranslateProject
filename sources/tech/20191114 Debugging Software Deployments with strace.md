[#]: collector: (lujun9972)
[#]: translator: (hanwckf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Debugging Software Deployments with strace)
[#]: via: (https://theartofmachinery.com/2019/11/14/deployment_debugging_strace.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Debugging Software Deployments with strace
======

Most of my paid work involves deploying software systems, which means I spend a lot of time trying to answer the following questions:

  * This software works on the original developer’s machine, so why doesn’t it work on mine?
  * This software worked on my machine yesterday, so why doesn’t it work today?



That’s a kind of debugging, but it’s a different kind of debugging from normal software debugging. Normal debugging is usually about the logic of the code, but deployment debugging is usually about the interaction between the code and its environment. Even when the root cause is a logic bug, the fact that the software apparently worked on another machine means that the environment is usually involved somehow.

So, instead of using normal debugging tools like `gdb`, I have another toolset for debugging deployments. My favourite tool for “Why isn’t this software working on this machine?” is `strace`.

### What is `strace`?

[`strace`][1] is a tool for “system call tracing”. It’s primarily a Linux tool, but you can do the same kind of debugging tricks with tools for other systems (such as [DTrace][2] and [ktrace][3]).

The basic usage is very simple. Just run it against a command and it dumps all the system calls (you’ll probably need to install `strace` first):

```
$ strace echo Hello
...Snip lots of stuff...
write(1, "Hello\n", 6)                  = 6
close(1)                                = 0
close(2)                                = 0
exit_group(0)                           = ?
+++ exited with 0 +++
```

What are these system calls? They’re like the API for the operating system kernel. Once upon a time, software used to have direct access to the hardware it ran on. If it needed to display something on the screen, for example, it could twiddle with ports and/or memory-mapped registers for the video hardware. That got chaotic when multitasking computer systems became popular because different applications would “fight” over hardware, and bugs in one application could crash other applications, or even bring down the whole system. So CPUs started supporting different privilege modes (or “protection rings”). They let an operating system kernel run in the most privileged mode with full hardware access, while spawning less-privileged software applications that must ask the kernel to interact with the hardware for them using system calls.

At the binary level, making a system call is a bit different from making a simple function call, but most programs use wrappers in a standard library. E.g. the POSIX C standard library contains a `write()` function call that contains all the architecture-dependent code for making the `write` system call.

![][4]

In short, an application’s interaction with its environment (the computer system) is all done through system calls. So when software works on one machine but not another, looking at system call traces is a good way to find what’s wrong. More specifically, here are the typical things you can analyse using a system call trace:

  * Console input and output (IO)
  * Network IO
  * Filesystem access and file IO
  * Process/thread lifetime management
  * Raw memory management
  * Access to special device drivers



### When can `strace` be used?

In theory, `strace` can be used with any userspace program because all userspace programs have to make system calls. It’s more effective with compiled, lower-level programs, but still works with high-level languages like Python if you can wade through the extra noise from the runtime environment and interpreter.

`strace` shines with debugging software that works fine on one machine, but on another machine fails with a vague error message about files or permissions or failure to run some command or something. Unfortunately, it’s not so great with higher-level problems, like a certificate verification failure. They usually need a combination of `strace`, sometimes [`ltrace`][5], and higher-level tooling (like the `openssl` command line tool for certificate debugging).

The examples in this post are based on a standalone server, but system call tracing can often be done on more complicated deployment platforms, too. Just search for appropriate tooling.

### A simple debugging example

Let’s say you’re trying to run an awesome server application called foo, but here’s what happens:

```
$ foo
Error opening configuration file: No such file or directory
```

Obviously it’s not finding the configuration file that you’ve written. This can happen because package managers sometimes customise the expected locations of files when compiling an application, so following an installation guide for one distro leads to files in the wrong place on another distro. You could fix the problem in a few seconds if only the error message told you where the configuration file is expected to be, but it doesn’t. How can you find out?

If you have access to the source code, you could read it and work it out. That’s a good fallback plan, but not the fastest solution. You also could use a stepping debugger like `gdb` to see what the program does, but it’s more efficient to use a tool that’s specifically designed to show the interaction with the environment: `strace`.

The output of `strace` can be a bit overwhelming at first, but the good news is that you can ignore most of it. It often helps to use the `-o` switch to save the trace to a separate file:

```
$ strace -o /tmp/trace foo
Error opening configuration file: No such file or directory
$ cat /tmp/trace
execve("foo", ["foo"], 0x7ffce98dc010 /* 16 vars */) = 0
brk(NULL)                               = 0x56363b3fb000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=25186, ...}) = 0
mmap(NULL, 25186, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f2f12cf1000
close(3)                                = 0
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\260A\2\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1824496, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f2f12cef000
mmap(NULL, 1837056, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f2f12b2e000
mprotect(0x7f2f12b50000, 1658880, PROT_NONE) = 0
mmap(0x7f2f12b50000, 1343488, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x22000) = 0x7f2f12b50000
mmap(0x7f2f12c98000, 311296, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16a000) = 0x7f2f12c98000
mmap(0x7f2f12ce5000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1b6000) = 0x7f2f12ce5000
mmap(0x7f2f12ceb000, 14336, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f2f12ceb000
close(3)                                = 0
arch_prctl(ARCH_SET_FS, 0x7f2f12cf0500) = 0
mprotect(0x7f2f12ce5000, 16384, PROT_READ) = 0
mprotect(0x56363b08b000, 4096, PROT_READ) = 0
mprotect(0x7f2f12d1f000, 4096, PROT_READ) = 0
munmap(0x7f2f12cf1000, 25186)           = 0
openat(AT_FDCWD, "/etc/foo/config.json", O_RDONLY) = -1 ENOENT (No such file or directory)
dup(2)                                  = 3
fcntl(3, F_GETFL)                       = 0x2 (flags O_RDWR)
brk(NULL)                               = 0x56363b3fb000
brk(0x56363b41c000)                     = 0x56363b41c000
fstat(3, {st_mode=S_IFCHR|0620, st_rdev=makedev(0x88, 0x8), ...}) = 0
write(3, "Error opening configuration file"..., 60) = 60
close(3)                                = 0
exit_group(1)                           = ?
+++ exited with 1 +++
```

The first page or so of `strace` output is typically low-level process startup. (You can see a lot of `mmap`, `mprotect`, `brk` calls for things like allocating raw memory and mapping dynamic libraries.) Actually, when debugging an error, `strace` output is best read from the bottom up. You can see the `write` call that outputs the error message at the end. If you work up, the first failing system call is the `openat` call that fails with `ENOENT` (“No such file or directory”) trying to open `/etc/foo/config.json`. And now we know where the configuration file is supposed to be.

That’s a simple example, but I’d say at least 90% of the time I use `strace`, I’m not doing anything more complicated. Here’s the complete debugging formula step-by-step:

  1. Get frustrated by a vague system-y error message from a program
  2. Run the program again with `strace`
  3. Find the error message in the trace
  4. Work upwards to find the first failing system call



There’s a very good chance the system call in step 4 shows you what went wrong.

### Some tips

Before walking through a more complicated example, here are some useful tips for using `strace` effectively:

#### `man` is your friend

On many *nix systems, you can get a list of all kernel system calls by running `man syscalls`. You’ll see things like `brk(2)`, which means you can get more information by running `man 2 brk`.

One little gotcha: `man 2 fork` shows me the man page for the `fork()` wrapper in GNU `libc`, which is actually now implemented using the `clone` system call instead. The semantics of `fork` are the same, but if I write a program using `fork()` and `strace` it, I won’t find any `fork` calls in the trace, just `clone` calls. Gotchas like that are only confusing if you’re comparing source code to `strace` output.

#### Use `-o` to save output to a file

`strace` can generate a lot of output so it’s often helpful to store the trace in a separate file (as in the example above). It also avoids mixing up program output with `strace` output in the console.

#### Use `-s` to see more argument data

You might have noticed that the second part of the error message doesn’t appear in the example trace above. That’s because `strace` only shows the first 32 bytes of string arguments by default. If you need to capture more, add something like `-s 128` to the `strace` invocation.

#### `-y` makes it easier to track files/sockets/etc

“Everything is a file” means *nix systems do all IO using file descriptors, whether it’s to an actual file or over networks or through interprocess pipes. That’s convenient for programming, but makes it harder to follow what’s really going on when you see generic `read` and `write` in the system call trace.

Adding the `-y` switch makes `strace` annotate every file descriptor in the output with a note about what it points to.

#### Attach to an already-running process with `-p`

As we’ll see in the example later, sometimes you want to trace a program that’s already running. If you know it’s running as process 1337 (say, by looking at the output of `ps`), you can trace it like this:

```
$ strace -p 1337
...system call trace output...
```

You probably need root.

#### Use `-f` to follow child processes

By default, `strace` only traces the one process. If that process spawns a child process, you’ll see the system call for spawning the process (normally `clone` nowadays), but not any of the calls made by the child process.

If you think the bug is in a child process, you’ll need to use the `-f` switch to enable tracing it. A downside is that the output can be more confusing. When tracing one process and one thread, `strace` can show you a single stream of call events. When tracing multiple processes, you might see the start of a call cut off with `<unfinished ...>`, then a bunch of calls for other threads of execution, before seeing the end of the original call with `<... foocall resumed>`. Alternatively, you can separate all the traces into different files by using the `-ff` switch as well (see [the `strace` manual][6] for details).

#### You can filter the trace with `-e`

As you’ve seen, the default trace output is a firehose of all system calls. You can filter which calls get traced using the `-e` flag (see [the `strace` manual][6]). The main advantage is that it’s faster to run the program under a filtered `strace` than to trace everything and `grep` the results later. Honestly, I don’t bother most of the time.

#### Not all errors are bad

A simple and common example is a program searching for a file in multiple places, like a shell searching for which `bin/` directory has an executable:

```
$ strace sh -c uname
...
stat("/home/user/bin/uname", 0x7ffceb817820) = -1 ENOENT (No such file or directory)
stat("/usr/local/bin/uname", 0x7ffceb817820) = -1 ENOENT (No such file or directory)
stat("/usr/bin/uname", {st_mode=S_IFREG|0755, st_size=39584, ...}) = 0
...
```

The “last failed call before the error message” heuristic is pretty good at finding relevent errors. In any case, working from the bottom up makes sense.

#### C programming guides are good for understanding system calls

Standard C library calls aren’t system calls, but they’re only thin layers on top. So if you understand (even just roughly) how to do something in C, it’s easier to read a system call trace. For example, if you’re having trouble debugging networking system calls, you could try skimming through [Beej’s classic Guide to Network Programming][7].

### A more complicated debugging example

As I said, that simple debugging example is representative of most of my `strace` usage. However, sometimes a little more detective work is required, so here’s a slightly more complicated (and real) example.

[`bcron`][8] is a job scheduler that’s yet another implementation of the classic *nix `cron` daemon. It’s been installed on a server, but here’s what happens when someone tries to edit a job schedule:

```
# crontab -e -u logs
bcrontab: Fatal: Could not create temporary file
```

Okay, so bcron tried to write some file, but it couldn’t, and isn’t telling us why. This is a debugging job for `strace`:

```
# strace -o /tmp/trace crontab -e -u logs
bcrontab: Fatal: Could not create temporary file
# cat /tmp/trace
...
openat(AT_FDCWD, "bcrontab.14779.1573691864.847933", O_RDONLY) = 3
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f82049b4000
read(3, "#Ansible: logsagg\n20 14 * * * lo"..., 8192) = 150
read(3, "", 8192)                       = 0
munmap(0x7f82049b4000, 8192)            = 0
close(3)                                = 0
socket(AF_UNIX, SOCK_STREAM, 0)         = 3
connect(3, {sa_family=AF_UNIX, sun_path="/var/run/bcron-spool"}, 110) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f82049b4000
write(3, "156:Slogs\0#Ansible: logsagg\n20 1"..., 161) = 161
read(3, "32:ZCould not create temporary f"..., 8192) = 36
munmap(0x7f82049b4000, 8192)            = 0
close(3)                                = 0
write(2, "bcrontab: Fatal: Could not creat"..., 49) = 49
unlink("bcrontab.14779.1573691864.847933") = 0
exit_group(111)                         = ?
+++ exited with 111 +++
```

There’s the error message `write` near the end, but a couple of things are different this time. First, there’s no relevant system call error that happens before it. Second, we see that the error message has just been `read` from somewhere else. It looks like the real problem is happening somewhere else, and `bcrontab` is just replaying the message.

If you look at `man 2 read`, you’ll see that the first argument (the 3) is a file descriptor, which is what *nix uses for all IO handles. How do you know what file descriptor 3 represents? In this specific case, you could run `strace` with the `-y` switch (as explained above) and it would tell you automatically, but it’s useful to know how to read and analyse traces to figure things like this out.

A file descriptor can come from one of many system calls (depending on whether it’s a descriptor for the console, a network socket, an actual file, or something else), but in any case we can search for calls returning 3 (i.e., search for “= 3” in the trace). There are two in this trace: the `openat` at the top, and the `socket` in the middle. `openat` opens a file, but the `close(3)` afterwards shows that it gets closed again. (Gotcha: file descriptors can be reused as they’re opened and closed.) The `socket` call is the relevant one (it’s the last one before the `read`), which tells us `bcrontab` is talking to something over a network socket. The next line, `connect` shows file descriptor 3 being configured as a Unix domain socket connection to `/var/run/bcron-spool`.

So now we need to figure out what’s listening on the other side of the Unix socket. There are a couple of neat tricks for that, both useful for debugging server deployments. One is to use `netstat` or the newer `ss` (“socket status”). Both commands describe active network sockets on the system, and take the `-l` switch for describing listening (server) sockets, and the `-p` switch to get information about what program is using the socket. (There are many more useful options, but those two are enough to get this job done.)

```
# ss -pl | grep /var/run/bcron-spool
u_str LISTEN 0   128   /var/run/bcron-spool 1466637   * 0   users:(("unixserver",pid=20629,fd=3))
```

That tells us that the listener is a command `unixserver` running as process ID 20629. (It’s a coincidence that it’s also using file descriptor 3 for the socket.)

The second really useful tool for finding the same information is `lsof`. It can list all open files (or file descriptors) on the system. Alternatively, we can get information about a specific file:

```
# lsof /var/run/bcron-spool
COMMAND   PID   USER  FD  TYPE  DEVICE              SIZE/OFF  NODE    NAME
unixserve 20629 cron  3u  unix  0x000000005ac4bd83  0t0       1466637 /var/run/bcron-spool type=STREAM
```

Process 20629 is a long-running server, so we can attach `strace` to it using something like `strace -o /tmp/trace -p 20629`. If we then try to edit the cron schedule in another terminal, we can capture a trace while the error is happening. Here’s the result:

```
accept(3, NULL, NULL)                   = 4
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7faa47c44810) = 21181
close(4)                                = 0
accept(3, NULL, NULL)                   = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=21181, si_uid=998, si_status=0, si_utime=0, si_stime=0} ---
wait4(0, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], WNOHANG|WSTOPPED, NULL) = 21181
wait4(0, 0x7ffe6bc36764, WNOHANG|WSTOPPED, NULL) = -1 ECHILD (No child processes)
rt_sigaction(SIGCHLD, {sa_handler=0x55d244bdb690, sa_mask=[CHLD], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7faa47ab9840}, {sa_handler=0x55d244bdb690, sa_mask=[CHLD], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7faa47ab9840}, 8) = 0
rt_sigreturn({mask=[]})                 = 43
accept(3, NULL, NULL)                   = 4
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7faa47c44810) = 21200
close(4)                                = 0
accept(3, NULL, NULL)                   = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=21200, si_uid=998, si_status=111, si_utime=0, si_stime=0} ---
wait4(0, [{WIFEXITED(s) && WEXITSTATUS(s) == 111}], WNOHANG|WSTOPPED, NULL) = 21200
wait4(0, 0x7ffe6bc36764, WNOHANG|WSTOPPED, NULL) = -1 ECHILD (No child processes)
rt_sigaction(SIGCHLD, {sa_handler=0x55d244bdb690, sa_mask=[CHLD], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7faa47ab9840}, {sa_handler=0x55d244bdb690, sa_mask=[CHLD], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7faa47ab9840}, 8) = 0
rt_sigreturn({mask=[]})                 = 43
accept(3, NULL, NULL
```

(The last `accept` doesn’t complete during the trace period.) Unfortunately, once again, this trace doesn’t contain the error we’re after. We don’t see any of the messages that we saw `bcrontab` sending to and receiving from the socket. Instead, we see a lot of process management (`clone`, `wait4`, `SIGCHLD`, etc.). This process is spawning a child process, which we can guess is doing the real work. If we want to catch a trace of that, we have to add `-f` to the `strace` invocation. Here’s what we find if we search for the error message after getting a new trace with `strace -f -o /tmp/trace -p 20629`:

```
21470 openat(AT_FDCWD, "tmp/spool.21470.1573692319.854640", O_RDWR|O_CREAT|O_EXCL, 0600) = -1 EACCES (Permission denied)
21470 write(1, "32:ZCould not create temporary f"..., 36) = 36
21470 write(2, "bcron-spool[21470]: Fatal: logs:"..., 84) = 84
21470 unlink("tmp/spool.21470.1573692319.854640") = -1 ENOENT (No such file or directory)
21470 exit_group(111)                   = ?
21470 +++ exited with 111 +++
```

Now we’re getting somewhere. Process ID 21470 is getting a permission denied error trying to create a file at the path `tmp/spool.21470.1573692319.854640` (relative to the current working directory). If we just knew the current working directory, we would know the full path and could figure out why the process can’t create create its temporary file there. Unfortunately, the process has already exited, so we can’t just use `lsof -p 21470` to find out the current directory, but we can work backwards looking for PID 21470 system calls that change directory. (If there aren’t any, PID 21470 must have inherited it from its parent, and we can `lsof -p` that.) That system call is `chdir` (which is easy to find out using today’s web search engines). Here’s the result of working backwards through the trace, all the way to the server PID 20629:

```
20629 clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7faa47c44810) = 21470
...
21470 execve("/usr/sbin/bcron-spool", ["bcron-spool"], 0x55d2460807e0 /* 27 vars */) = 0
...
21470 chdir("/var/spool/cron")          = 0
...
21470 openat(AT_FDCWD, "tmp/spool.21470.1573692319.854640", O_RDWR|O_CREAT|O_EXCL, 0600) = -1 EACCES (Permission denied)
21470 write(1, "32:ZCould not create temporary f"..., 36) = 36
21470 write(2, "bcron-spool[21470]: Fatal: logs:"..., 84) = 84
21470 unlink("tmp/spool.21470.1573692319.854640") = -1 ENOENT (No such file or directory)
21470 exit_group(111)                   = ?
21470 +++ exited with 111 +++
```

(If you’re getting lost here, you might want to read [my previous post about *nix process management and shells][9].) Okay, so the server PID 20629 doesn’t have permission to create a file at `/var/spool/cron/tmp/spool.21470.1573692319.854640`. The most likely reason would be classic *nix filesystem permission settings. Let’s check:

```
# ls -ld /var/spool/cron/tmp/
drwxr-xr-x 2 root root 4096 Nov  6 05:33 /var/spool/cron/tmp/
# ps u -p 20629
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
cron     20629  0.0  0.0   2276   752 ?        Ss   Nov14   0:00 unixserver -U /var/run/bcron-spool -- bcron-spool
```

There’s the problem! The server is running as user `cron`, but only `root` has permissions to write to that `/var/spool/cron/tmp/` directory. A simple `chown cron /var/spool/cron/tmp/` makes `bcron` work properly. (If that weren’t the problem, the next most likely suspect would be a kernel security module like SELinux or AppArmor, so I’d check the kernel logs with `dmesg`.)

### Summary

System call traces can be overwhelming at first, but I hope I’ve shown that they’re a fast way to debug a whole class of common deployment problems. Imagine trying to debug that multi-process `bcron` problem using a stepping debugger.

Working back through a chain of system calls takes practice, but as I said, most of the time I use `strace` I just get a trace and look for errors, working from the bottom up. In any case, `strace` has saved me hours and hours of debugging time. I hope it’s useful for you, too.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2019/11/14/deployment_debugging_strace.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://strace.io/
[2]: http://dtrace.org/blogs/about/
[3]: https://man.openbsd.org/ktrace
[4]: https://theartofmachinery.com/images/strace/system_calls.svg
[5]: https://linux.die.net/man/1/ltrace
[6]: https://linux.die.net/man/1/strace
[7]: https://beej.us/guide/bgnet/html/index.html
[8]: https://untroubled.org/bcron/
[9]: https://theartofmachinery.com/2018/11/07/writing_a_nix_shell.html
