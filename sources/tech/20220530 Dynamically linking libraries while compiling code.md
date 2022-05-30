[#]: subject: "Dynamically linking libraries while compiling code"
[#]: via: "https://opensource.com/article/22/5/compile-code-ldlibrarypath"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Dynamically linking libraries while compiling code
======
Compiling software gives you a lot of flexibility in how you run your system. The LD_LIBRARY_PATH variable, along with the -L and -l GCC options, are components of that flexibility.

![women programming][1]

Image by: WOCinTech Chat. Modified by Opensource.com. CC BY-SA 4.0

Compiling software is something that developers do a lot, and in open source some users even choose to do it themselves. Linux podcaster Dann Washko calls source code the "universal package format" because it contains all the components necessary to make an application run on any platform. Of course, not all source code is written for all systems, so it's only "universal" within the subset of targeted systems, but the point is that source code is extremely flexible. With open source, you can decide how code is compiled and run.

When you're compiling code, you're usually dealing with multiple source files. Developers tend to keep different classes or modules in separate files so that they can be maintained separately, and possibly even used by different projects. But when you're compiling these files, many of them get compiled into a single executable.

This is usually done by creating shared libraries, and then dynamically linking back to them from the executable. This keeps the executable small by keeping modular functions external, and ensures that libraries can be updated independently of the applications that use them.

### Locating a shared object during compilation

When you're [compiling with GCC][2], you usually need a library to be installed on your workstation for GCC to be able to locate it. By default, GCC assumes that libraries are in a system library path, such as `/lib64` and `/usr/lib64`. However, if you're linking to a library of your own that's not yet installed, or if you need to link to a library that's not installed in a standard location, then you have to help GCC find the files.

There are two options significant for finding libraries in GCC:

* -L (capital L) adds an additional library path to GCC's search locations.
* -l (lowercase L) sets the name of the library you want to link against.

For example, suppose you've written a library called `libexample.so`, and you want to use it when compiling your application `demo.c`. First, create an object file from `demo.c` :

```
$ gcc -I ./include -c src/demo.c
```

The `-I` option adds a directory to GCC's search path for header files. In this example, I assume that custom header files are in a local directory called `include`. The `-c` option prevents GCC from running a linker, because this task is only to create an object file. And that's exactly what happens:

```
$ ls
demo.o   include/   lib/    src/
```

Now you can use the `-L` option to set a path for your library, and compile:

```
$ gcc -L`pwd`/lib -o myDemo demo.o -lexample
```

Notice that the `-L` option comes *before* the `-l` option. This is significant, because if `-L` hasn't been added to GCC's search path before you tell GCC to look for a non-default library, GCC won't know to search in your custom location. The compilation succeeds as expected, but there's a problem when you attempt to run it:

```
$ ./myDemo
./myDemo: error while loading shared libraries:
libexample.so: cannot open shared object file:
No such file or directory
```

### Troubleshooting with ldd

The `ldd` utility prints shared object dependencies, and it can be useful when troubleshooting issues like this:

```
$ ldd ./myDemo
        linux-vdso.so.1 (0x00007ffe151df000)
        libexample.so => not found
        libc.so.6 => /lib64/libc.so.6 (0x00007f514b60a000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f514b839000)
```

You already knew that `libexample` couldn't be located, but the `ldd` output at least affirms what's expected from a *working* library. For instance, `libc.so.6` has been located, and `ldd` displays its full path.

### LD_LIBRARY_PATH

The `LD_LIBRARY_PATH` [environment variable][3] defines the path to libraries. If you're running an application that relies on a library that's not installed to a standard directory, you can add to the system's library search path using `LD_LIBRARY_PATH`.

There are several ways to set environment variables, but the most flexible is to place them before you run a command. Look at what setting `LD_LIBRARY_PATH` does for the `ldd` command when it's analyzing a "broken" executable:

```
$ LD_LIBRARY_PATH=`pwd`/lib ldd ./
   linux-vdso.so.1 (0x00007ffe515bb000)
   libexample.so => /tmp/Demo/lib/libexample.so (0x0000...
   libc.so.6 => /lib64/libc.so.6 (0x00007eff037ee000)
   /lib64/ld-linux-x86-64.so.2 (0x00007eff03a22000)
```

It applies just as well to your custom command:

```
$ LD_LIBRARY_PATH=`pwd`/lib myDemo
hello world!
```

If you move the library file or the executable, however, it breaks again:

```
$ mv lib/libexample.so ~/.local/lib64
$ LD_LIBRARY_PATH=`pwd`/lib myDemo
./myDemo: error while loading shared libraries...
```

To fix it, you must adjust the `LD_LIBRARY_PATH` to match the library's new location:

```
$ LD_LIBRARY_PATH=~/.local/lib64 myDemo
hello world!
```

### When to use LD_LIBRARY_PATH

In most cases, `LD_LIBRARY_PATH` isn't a variable you need to set. By design, libraries are installed to `/usr/lib64` and so applications naturally search it for their required libraries. You may need to use `LD_LIBRARY_PATH` in two cases:

* You're compiling software that needs to link against a library that itself has just been compiled and has not yet been installed. Good build systems, such as [Autotools][4] and [CMake][5], can help handle this.
* You're bundling software that's designed to run out of a single directory, with no install script or an install script that places libraries in non-standard directories. Several applications have releases that a Linux user can download, copy to `/opt`, and run with "no install." The `LD_PATH_LIBRARY` variable gets set through wrapper scripts so the user often isn't even aware it's been set.

Compiling software gives you a lot of flexibility in how you run your system. The `LD_LIBRARY_PATH` variable, along with the `-L` and `-l` GCC options, are components of that flexibility.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/compile-code-ldlibrarypath

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/collab-team-pair-programming-code-keyboard2.png
[2]: https://opensource.com/article/22/5/what-happens-behind-scenes-during-gcc-compilation-c-programs
[3]: https://opensource.com/article/19/8/what-are-environment-variables
[4]: https://opensource.com/article/19/7/introduction-gnu-autotools
[5]: https://opensource.com/article/21/5/cmake
