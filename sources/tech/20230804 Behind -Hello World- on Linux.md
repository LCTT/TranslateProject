[#]: subject: "Behind "Hello World" on Linux"
[#]: via: "https://jvns.ca/blog/2023/08/03/behind--hello-world/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Behind "Hello World" on Linux
======

Today I was thinking about – what happens when you run a simple “Hello World” Python program on Linux, like this one?

```

    print("hello world")

```

Here’s what it looks like at the command line:

```

    $ python3 hello.py
    hello world

```

But behind the scenes, there’s a lot more going on. I’ll describe some of what happens, and (much much more importantly!) explain some tools you can use to see what’s going on behind the scenes yourself. We’ll use `readelf`, `strace`, `ldd`, `debugfs`, `/proc`, `ltrace`, `dd`, and `stat`. I won’t talk about the Python-specific parts at all – just what happens when you run any dynamically linked executable.

Here’s a table of contents:

  1. [parse “python3 hello.py”][1]
  2. [figure out the full path to python3][2]
  3. [stat, under the hood][3]
  4. [time to fork][4]
  5. [the shell calls execve][5]
  6. [get the binary’s contents][6]
  7. [find the interpreter][7]
  8. [dynamic linking][8]
  9. [go to _start][9]
  10. [write a string][10]



### before `execve`

Before we even start the Python interpreter, there are a lot of things that have to happen. What executable are we even running? Where is it?

#### 1: The shell parses the string `python3 hello.py` into a command to run and a list of arguments: `python3`, and `['hello.py']`

A bunch of things like glob expansion could happen here. For example if you run `python3 *.py`, the shell will expand that into `python3 hello.py`

#### 2: The shell figures out the full path to `python3`

Now we know we need to run `python3`. But what’s the full path to that binary? The way this works is that there’s a special environment variable named `PATH`.

**See for yourself** : Run `echo $PATH` in your shell. For me it looks like this.

```

    $ echo $PATH
    /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

```

When you run a command, the shell will search every directory in that list (in order) to try to find a match.

In `fish` (my shell), you can see the [path resolution logic here][11]. It uses the `stat` system call to check if files exist.

**See for yourself** : Run `strace -e stat bash`, and then run a command like `python3`. You should see output like this:

```

    stat("/usr/local/sbin/python3", 0x7ffcdd871f40) = -1 ENOENT (No such file or directory)
    stat("/usr/local/bin/python3", 0x7ffcdd871f40) = -1 ENOENT (No such file or directory)
    stat("/usr/sbin/python3", 0x7ffcdd871f40) = -1 ENOENT (No such file or directory)
    stat("/usr/bin/python3", {st_mode=S_IFREG|0755, st_size=5479736, ...}) = 0

```

You can see that it finds the binary at `/usr/bin/python3` and stops: it doesn’t continue searching `/sbin` or `/bin`.

#### 2.1: A note on `execvp`

If you want to run the same PATH searching logic as the shell does without reimplementing it yourself, you can use the libc function `execvp` (or one of the other `exec*` functions with `p` in the name).

#### 3: `stat`, under the hood

Now you might be wondering – Julia, what is `stat` doing? Well, when your OS opens a file, it’s split into 2 steps.

  1. It maps the **filename** to an **inode** , which contains metadata about the file
  2. It uses the **inode** to get the file’s contents



The `stat` system call just returns the contents of the file’s inodes – it doesn’t read the contents at all. The advantage of this is that it’s a lot faster. Let’s go on a short adventure into inodes. ([this great post “A disk is a bunch of bits” by Dmitry Mazin][12] has more details)

```

    $ stat /usr/bin/python3
      File: /usr/bin/python3 -> python3.9
      Size: 9           Blocks: 0          IO Block: 4096   symbolic link
    Device: fe01h/65025d    Inode: 6206        Links: 1
    Access: (0777/lrwxrwxrwx)  Uid: (    0/    root)   Gid: (    0/    root)
    Access: 2023-08-03 14:17:28.890364214 +0000
    Modify: 2021-04-05 12:00:48.000000000 +0000
    Change: 2021-06-22 04:22:50.936969560 +0000
     Birth: 2021-06-22 04:22:50.924969237 +0000

```

**See for yourself** : Let’s go see where exactly that inode is on our hard drive.

First, we have to find our hard drive’s device name

```

    $ df
    ...
    tmpfs             100016      604     99412   1% /run
    /dev/vda1       25630792 14488736  10062712  60% /
    ...

```

Looks like it’s `/dev/vda1`. Next, let’s find out where the inode for `/usr/bin/python3` is on our hard drive:

```

    $ sudo debugfs /dev/vda1
    debugfs 1.46.2 (28-Feb-2021)
    debugfs:  imap /usr/bin/python3
    Inode 6206 is part of block group 0
        located at block 658, offset 0x0d00

```

I have no idea how `debugfs` is figuring out the location of the inode for that filename, but we’re going to leave that alone.

Now, we need to calculate how many bytes into our hard drive “block 658, offset 0x0d00” is on the big array of bytes that is your hard drive. Each block is 4096 bytes, so we need to go `4096 * 658 + 0x0d00` bytes. A calculator tells me that’s `2698496`

```

    $ sudo dd if=/dev/vda1 bs=1 skip=2698496 count=256 2>/dev/null | hexdump -C
    00000000  ff a1 00 00 09 00 00 00  f8 b6 cb 64 9a 65 d1 60  |...........d.e.`|
    00000010  f0 fb 6a 60 00 00 00 00  00 00 01 00 00 00 00 00  |..j`............|
    00000020  00 00 00 00 01 00 00 00  70 79 74 68 6f 6e 33 2e  |........python3.|
    00000030  39 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |9...............|
    00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00000060  00 00 00 00 12 4a 95 8c  00 00 00 00 00 00 00 00  |.....J..........|
    00000070  00 00 00 00 00 00 00 00  00 00 00 00 2d cb 00 00  |............-...|
    00000080  20 00 bd e7 60 15 64 df  00 00 00 00 d8 84 47 d4  | ...`.d.......G.|
    00000090  9a 65 d1 60 54 a4 87 dc  00 00 00 00 00 00 00 00  |.e.`T...........|
    000000a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|

```

Neat! There’s our inode! You can see it says `python3` in it, which is a really good sign. We’re not going to go through all of this, but the [ext4 inode struct from the Linux kernel][13] says that the first 16 bits are the “mode”, or permissions. So let’s work that out how `ffa1` corresponds to file permissions.

  * The bytes `ffa1` correspond to the number `0xa1ff`, or 41471 (because x86 is little endian)
  * 41471 in octal is `0120777`
  * This is a bit weird – that file’s permissions could definitely be `777`, but what are the first 3 digits? I’m not used to seeing those! You can find out what the `012` means in [man inode][14] (scroll down to “The file type and mode”). There’s a little table that says `012` means “symbolic link”.



Let’s list the file and see if it is in fact a symbolic link with permissions `777`:

```

    $ ls -l /usr/bin/python3
    lrwxrwxrwx 1 root root 9 Apr  5  2021 /usr/bin/python3 -> python3.9

```

It is! Hooray, we decoded it correctly.

#### 4: Time to fork

We’re still not ready to start `python3`. First, the shell needs to create a new child process to run. The way new processes start on Unix is a little weird – first the process clones itself, and then runs `execve`, which replaces the cloned process with a new process.

* **See for yourself:** Run `strace -e clone bash`, then run `python3`. You should see something like this:

```

    clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f03788f1a10) = 3708100

```

`3708100` is the PID of the new process, which is a child of the shell process.

Some more tools to look at what’s going on with processes:

  * `pstree` will show you a tree of all the processes on your system
  * `cat /proc/PID/stat` shows you some information about the process. The contents of that file are documented in `man proc`. For example the 4th field is the parent PID.



#### 4.1: What the new process inherits.

The new process (which will become `python3`) has inherited a bunch of from the shell. For example, it’s inherited:

  1. **environment variables** : you can look at them with `cat /proc/PID/environ | tr '\0' '\n'`
  2. **file descriptors** for stdout and stderr: look at them with `ls -l /proc/PID/fd`
  3. a **working directory** (whatever the current directory is)
  4. **namespaces and cgroups** (if it’s in a container)
  5. the **user** and **group** that’s running it
  6. probably more things I’m not thinking of right now



#### 5: The shell calls `execve`

Now we’re ready to start the Python interpreter!

**See for yourself** : Run `strace -e -f execve bash`, then run `python3`. The `-f` is important because we want to follow any forked child subprocesses. You should see something like this:

```

    [pid 3708381] execve("/usr/bin/python3", ["python3"], 0x560397748300 /* 21 vars */) = 0

```

The first argument is the binary, and the second argument is the list of command line arguments. The command line arguments get placed in a special location in the program’s memory so that it can access them when it runs.

Now, what’s going on inside `execve`?

#### 6: get the binary’s contents

The first thing that has to happen is that we need to open the `python3` binary file and read its contents. So far we’ve only used the `stat` system call to access its metadata, but now we need its contents.

Let’s look at the output of `stat` again:

```

    $ stat /usr/bin/python3
      File: /usr/bin/python3 -> python3.9
      Size: 9           Blocks: 0          IO Block: 4096   symbolic link
    Device: fe01h/65025d    Inode: 6206        Links: 1
    ...

```

This takes up 0 blocks of space on the disk. This is because the contents of the symbolic link (`python3.9`) are actually in the inode itself: you can see them here (from the binary contents of the inode above, it’s split across 2 lines in the hexdump output):

```

    00000020  00 00 00 00 01 00 00 00  70 79 74 68 6f 6e 33 2e  |........python3.|
    00000030  39 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |9...............|

```

So we’ll need to open `/usr/bin/python3.9` instead. All of this is happening inside the kernel so you won’t see it another system call for that.

Every file is made up of a bunch of **blocks** on the hard drive. I think each of these blocks on my system is 4096 bytes, so the minimum size of a file is 4096 bytes – even if the file is only 5 bytes, it still takes up 4KB on disk.

**See for yourself** : We can find the block numbers using `debugfs` like this: (again, I got these instructions from [dmitry mazin’s “A disk is a bunch of bits” post][12])

```

    $ debugfs /dev/vda1
    debugfs:  blocks /usr/bin/python3.9
    145408 145409 145410 145411 145412 145413 145414 145415 145416 145417 145418 145419 145420 145421 145422 145423 145424 145425 145426 145427 145428 145429 145430 145431 145432 145433 145434 145435 145436 145437

```

Now we can use `dd` to read the first block of the file. We’ll set the block size to 4096 bytes, skip `145408` blocks, and read 1 block.

```

    $ dd if=/dev/vda1 bs=4096 skip=145408 count=1 2>/dev/null | hexdump -C | head
    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
    00000010  02 00 3e 00 01 00 00 00  c0 a5 5e 00 00 00 00 00  |..>.......^.....|
    00000020  40 00 00 00 00 00 00 00  b8 95 53 00 00 00 00 00  |@.........S.....|
    00000030  00 00 00 00 40 00 38 00  0b 00 40 00 1e 00 1d 00  |....@.8...@.....|
    00000040  06 00 00 00 04 00 00 00  40 00 00 00 00 00 00 00  |........@.......|
    00000050  40 00 40 00 00 00 00 00  40 00 40 00 00 00 00 00  |@.@.....@.@.....|
    00000060  68 02 00 00 00 00 00 00  68 02 00 00 00 00 00 00  |h.......h.......|
    00000070  08 00 00 00 00 00 00 00  03 00 00 00 04 00 00 00  |................|
    00000080  a8 02 00 00 00 00 00 00  a8 02 40 00 00 00 00 00  |..........@.....|
    00000090  a8 02 40 00 00 00 00 00  1c 00 00 00 00 00 00 00  |..@.............|

```

You can see that we get the exact same output as if we read the file with `cat`, like this:

```

    $ cat /usr/bin/python3.9 | hexdump -C | head
    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
    00000010  02 00 3e 00 01 00 00 00  c0 a5 5e 00 00 00 00 00  |..>.......^.....|
    00000020  40 00 00 00 00 00 00 00  b8 95 53 00 00 00 00 00  |@.........S.....|
    00000030  00 00 00 00 40 00 38 00  0b 00 40 00 1e 00 1d 00  |....@.8...@.....|
    00000040  06 00 00 00 04 00 00 00  40 00 00 00 00 00 00 00  |........@.......|
    00000050  40 00 40 00 00 00 00 00  40 00 40 00 00 00 00 00  |@.@.....@.@.....|
    00000060  68 02 00 00 00 00 00 00  68 02 00 00 00 00 00 00  |h.......h.......|
    00000070  08 00 00 00 00 00 00 00  03 00 00 00 04 00 00 00  |................|
    00000080  a8 02 00 00 00 00 00 00  a8 02 40 00 00 00 00 00  |..........@.....|
    00000090  a8 02 40 00 00 00 00 00  1c 00 00 00 00 00 00 00  |..@.............|

```

#### an aside on magic numbers

This file starts with `ELF`, which is a “magic number”, or a byte sequence that tells us that this is an ELF file. ELF is the binary file format on Linux.

Different file formats have different magic numbers, for example the magic number for gzip is `1f8b`. The magic number at the beginning is how `file blah.gz` knows that it’s a gzip file.

I think `file` has a variety of heuristics for figuring out the file type of a file, not just magic numbers, but the magic number is an important one.

#### 7: find the interpreter

Let’s parse the ELF file to see what’s in there.

**See for yourself:** Run `readelf -a /usr/bin/python3.9`. Here’s what I get (though I’ve redacted a LOT of stuff):

```

    $ readelf -a /usr/bin/python3.9
    ELF Header:
        Class:                             ELF64
        Machine:                           Advanced Micro Devices X86-64
    ...
    ->  Entry point address:               0x5ea5c0
    ...
    Program Headers:
      Type           Offset             VirtAddr           PhysAddr
      INTERP         0x00000000000002a8 0x00000000004002a8 0x00000000004002a8
                     0x000000000000001c 0x000000000000001c  R      0x1
    ->      [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]
            ...
    ->        1238: 00000000005ea5c0    43 FUNC    GLOBAL DEFAULT   13 _start

```

Here’s what I understand of what’s going on here:

  1. it’s telling the kernel to run `/lib64/ld-linux-x86-64.so.2` to start this program. This is called the **dynamic linker** and we’ll talk about it next
  2. it’s specifying an entry point (at `0x5ea5c0`, which is where this program’s code starts)



Now let’s talk about the dynamic linker.

#### 8: dynamic linking

Okay! We’ve read the bytes from disk and we’ve started this “interpreter” thing. What next? Well, if you run `strace -o out.strace python3`, you’ll see a bunch of stuff like this right after the `execve` system call:

```

    execve("/usr/bin/python3", ["python3"], 0x560af13472f0 /* 21 vars */) = 0
    brk(NULL)                       = 0xfcc000
    access("/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory)
    openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
    fstat(3, {st_mode=S_IFREG|0644, st_size=32091, ...}) = 0
    mmap(NULL, 32091, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f718a1e3000
    close(3)                        = 0
    openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
    read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 l\0\0\0\0\0\0"..., 832) = 832
    fstat(3, {st_mode=S_IFREG|0755, st_size=149520, ...}) = 0
    mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f718a1e1000
    ...
    close(3)                        = 0
    openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3

```

This all looks a bit intimidating at first, but the part I want you to pay attention to is `openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libpthread.so.0"`. This is opening a C threading library called `pthread` that the Python interpreter needs to run.

**See for yourself:** If you want to know which libraries a binary needs to load at runtime, you can use `ldd`. Here’s what that looks like for me:

```

    $ ldd /usr/bin/python3.9
        linux-vdso.so.1 (0x00007ffc2aad7000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f2fd6554000)
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f2fd654e000)
        libutil.so.1 => /lib/x86_64-linux-gnu/libutil.so.1 (0x00007f2fd6549000)
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f2fd6405000)
        libexpat.so.1 => /lib/x86_64-linux-gnu/libexpat.so.1 (0x00007f2fd63d6000)
        libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f2fd63b9000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f2fd61e3000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f2fd6580000)

```

You can see that the first library listed is `/lib/x86_64-linux-gnu/libpthread.so.0`, which is why it was loaded first.

#### on LD_LIBRARY_PATH

I’m honestly still a little confused about dynamic linking. Some things I know:

  * Dynamic linking happens in userspace and the dynamic linker on my system is at `/lib64/ld-linux-x86-64.so.2`. If you’re missing the dynamic linker, you can end up with weird bugs like this [weird “file not found” error][15]
  * The dynamic linker uses the `LD_LIBRARY_PATH` environment variable to find libraries
  * The dynamic linker will also use the `LD_PRELOAD` environment to override any dynamically linked function you want (you can use this for [fun hacks][16], or to replace your default memory allocator with an alternative one like jemalloc)
  * there are some `mprotect`s in the strace output which are marking the library code as read-only, for security reasons
  * on Mac, it’s `DYLD_LIBRARY_PATH` instead of `LD_LIBRARY_PATH`



You might be wondering – if dynamic linking happens in userspace, why don’t we see a bunch of `stat` system calls where it’s searching through `LD_LIBRARY_PATH` for the libraries, the way we did when bash was searching the `PATH`?

That’s because `ld` has a cache in `/etc/ld.so.cache`, and all of those libraries have already been found in the past. You can see it opening the cache in the strace output – `openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3`.

There are still a bunch of system calls after dynamic linking in the [full strace output][17] that I still don’t really understand (what’s `prlimit64` doing? where does the locale stuff come in? what’s `gconv-modules.cache`? what’s `rt_sigaction` doing? what’s `arch_prctl`? what’s `set_tid_address` and `set_robust_list`?). But this feels like a good start.

#### aside: ldd is actually a simple shell script!

Someone on mastodon [pointed out][18] that `ldd` is actually a shell script that just sets the `LD_TRACE_LOADED_OBJECTS=1` environment variable and starts the program. So you can do exactly the same thing like this:

```

    $ LD_TRACE_LOADED_OBJECTS=1 python3
        linux-vdso.so.1 (0x00007ffe13b0a000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f01a5a47000)
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f01a5a41000)
        libutil.so.1 => /lib/x86_64-linux-gnu/libutil.so.1 (0x00007f2fd6549000)
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f2fd6405000)
        libexpat.so.1 => /lib/x86_64-linux-gnu/libexpat.so.1 (0x00007f2fd63d6000)
        libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f2fd63b9000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f2fd61e3000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f2fd6580000)

```

Apparently `ld` is also a binary you can just run, so `/lib64/ld-linux-x86-64.so.2 --list /usr/bin/python3.9` also does the the same thing.

#### 9: go to `_start`

After dynamic linking is done, we go to `_start` in the Python interpreter. Then it does all the normal Python interpreter things you’d expect.

I’m not going to talk about this because here I’m interested in general facts about how binaries are run on Linux, not the Python interpreter specifically.

#### 10: write a string

We still need to print out “hello world” though. Under the hood, the Python `print` function calls some function from libc. But which one? Let’s find out!

**See for yourself** : Run `ltrace -o out python3 hello.py`.

```

    $ ltrace -o out python3 hello.py
    $ grep hello out
    write(1, "hello world\n", 12) = 12

```

So it looks like it’s calling `write`

I honestly am always a little suspicious of ltrace – unlike strace (which I would trust with my life), I’m never totally sure that ltrace is actually reporting library calls accurately. But in this case it seems to be working. And if we look at the [cpython source code][19], it does seem to be calling `write()` in some places. So I’m willing to believe that.

#### what’s libc?

We just said that Python calls the `write` function from libc. What’s libc? It’s the C standard library, and it’s responsible for a lot of basic things like:

  * allocating memory with `malloc`
  * file I/O (opening/closing/
  * executing programs (with `execvp`, like we mentioned before)
  * looking up DNS records with `getaddrinfo`
  * managing threads with `pthread`



Programs don’t _have_ to use libc (on Linux, Go famously doesn’t use it and calls Linux system calls directly instead), but most other programming languages I use (node, Python, Ruby, Rust) all use libc. I’m not sure about Java.

You can find out if you’re using libc by running `ldd` on your binary: if you see something like `libc.so.6`, that’s libc.

#### why does libc matter?

You might be wondering – why does it matter that Python calls the libc `write` and then libc calls the `write` system call? Why am I making a point of saying that `libc` is in the middle?

I think in this case it doesn’t really matter (AFAIK the `write` libc function maps pretty directly to the `write` system call)

But there are different libc implementations, and sometimes they behave differently. The two main ones are glibc (GNU libc) and musl libc.

For example, until recently [musl’s `getaddrinfo` didn’t support TCP DNS][20], [here’s a blog post talking about a bug that that caused][21].

#### a little detour into stdout and terminals

In this program, stdout (the `1` file descriptor) is a terminal. And you can do funny things with terminals! Here’s one:

  1. In a terminal, run `ls -l /proc/self/fd/1`. I get `/dev/pts/2`
  2. In another terminal window, write `echo hello > /dev/pts/2`
  3. Go back to the original terminal window. You should see `hello` printed there!



#### that’s all for now!

Hopefully you have a better idea of how `hello world` gets printed! I’m going to stop adding more details for now because this is already pretty long, but obviously there’s more to say and I might add more if folks chip in with extra details. I’d especially love suggestions for other tools you could use to inspect parts of the process that I haven’t explained here.

### I’d love to see a Mac version of this

One of my frustrations with Mac OS is that I don’t know how to introspect my system on this level – when I print `hello world`, I can’t figure out how to spy on what’s going on behind the scenes the way I can on Linux. I’d love to see a really in depth explainer.

Some Mac equivalents I know about:

  * `ldd` -> `otool -L`
  * `readelf` -> `otool`
  * supposedly you can use `dtruss` or `dtrace` on mac instead of strace but I’ve never been brave enough to turn off system integrity protection to get it to work



### more reading

Some more links:

  * [A Whirlwind Tutorial on Creating Really Teensy ELF Executables for Linux][22]
  * [an exploration of “hello world” on FreeBSD][23]
  * From LWN: [how programs get run][24] ([and part two][25]) have a bunch more details on the internals of `execve`
  * [how to run a program][26]



--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/08/03/behind--hello-world/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: tmp.jwyQxZQiCF#1-the-shell-parses-the-string-python3-hello-py-into-a-command-to-run-and-a-list-of-arguments-python3-and-hello-py
[2]: tmp.jwyQxZQiCF#2-the-shell-figures-out-the-full-path-to-python3
[3]: tmp.jwyQxZQiCF#3-stat-under-the-hood
[4]: tmp.jwyQxZQiCF#4-time-to-fork
[5]: tmp.jwyQxZQiCF#5-the-shell-calls-execve
[6]: tmp.jwyQxZQiCF#6-get-the-binary-s-contents
[7]: tmp.jwyQxZQiCF#7-find-the-interpreter
[8]: tmp.jwyQxZQiCF#8-dynamic-linking
[9]: tmp.jwyQxZQiCF#9-go-to-start
[10]: tmp.jwyQxZQiCF#10-write-a-string
[11]: https://github.com/fish-shell/fish-shell/blob/900a0487443f10caa6539634ca8c49fb6e3ce5ba/src/path.cpp#L31-L45
[12]: https://www.cyberdemon.org/2023/07/19/bunch-of-bits.html
[13]: https://github.com/torvalds/linux/blob/fdf0eaf11452d72945af31804e2a1048ee1b574c/fs/ext4/ext4.h#L769
[14]: https://man7.org/linux/man-pages/man7/inode.7.html
[15]: https://jvns.ca/blog/2021/11/17/debugging-a-weird--file-not-found--error/
[16]: https://jvns.ca/blog/2014/11/27/ld-preload-is-super-fun-and-easy/
[17]: https://gist.github.com/jvns/4254251bea219568df9f43a2efd8d0f5
[18]: https://octodon.social/@lkundrak/110832640058459399
[19]: https://github.com/python/cpython/blob/400835ea1626c8c6dcd967c7eabe0dad4a923182/Python/fileutils.c#L1955
[20]: https://www.openwall.com/lists/musl/2023/05/02/1
[21]: https://christoph.luppri.ch/fixing-dns-resolution-for-ruby-on-alpine-linux
[22]: https://www.muppetlabs.com/~breadbox/software/tiny/teensy.html
[23]: https://people.freebsd.org/~brooks/talks/asiabsdcon2017-helloworld/helloworld.pdf
[24]: https://lwn.net/Articles/630727/
[25]: https://lwn.net/Articles/631631/
[26]: https://cpu.land/how-to-run-a-program
