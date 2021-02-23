[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to handle dynamic and static libraries in Linux)
[#]: via: (https://opensource.com/article/20/6/linux-libraries)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)

How to handle dynamic and static libraries in Linux
======
Knowing how Linux uses libraries, including the difference between
static and dynamic linking, can help you fix dependency problems.
![Hand putting a Linux file folder into a drawer][1]

Linux, in a way, is a series of static and dynamic libraries that depend on each other. For new users of Linux-based systems, the whole handling of libraries can be a mystery. But with experience, the massive amount of shared code built into the operating system can be an advantage when writing new applications.

To help you get in touch with this topic, I prepared a small [application example][2] that shows the most common methods that work on common Linux distributions (these have not been tested on other systems). To follow along with this hands-on tutorial using the example application, open a command prompt and type:


```
$ git clone <https://github.com/hANSIc99/library\_sample>
$ cd library_sample/
$ make
cc -c main.c -Wall -Werror
cc -c libmy_static_a.c -o libmy_static_a.o -Wall -Werror
cc -c libmy_static_b.c -o libmy_static_b.o -Wall -Werror
ar -rsv libmy_static.a libmy_static_a.o libmy_static_b.o
ar: creating libmy_static.a
a - libmy_static_a.o
a - libmy_static_b.o
cc -c -fPIC libmy_shared.c -o libmy_shared.o
cc -shared -o libmy_shared.so libmy_shared.o
$ make clean
rm *.o
```

After executing these commands, these files should be added to the directory (run `ls` to see them):


```
my_app
libmy_static.a
libmy_shared.so
```

### About static linking

When your application links against a static library, the library's code becomes part of the resulting executable. This is performed only once at linking time, and these static libraries usually end with a `.a` extension.

A static library is an archive ([ar][3]) of object files. The object files are usually in the ELF format. ELF is short for [Executable and Linkable Format][4], which is compatible with many operating systems.

The output of the `file` command tells you that the static library `libmy_static.a` is the `ar` archive type:


```
$ file libmy_static.a
libmy_static.a: current ar archive
```

With `ar -t`, you can look into this archive; it shows two object files:


```
$ ar -t libmy_static.a
libmy_static_a.o
libmy_static_b.o
```

You can extract the archive's files with `ar -x <archive-file>`. The extracted files are object files in ELF format:


```
$ ar -x libmy_static.a
$ file libmy_static_a.o
libmy_static_a.o: ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped
```

### About dynamic linking

Dynamic linking means the use of shared libraries. Shared libraries usually end with `.so` (short for "shared object").

Shared libraries are the most common way to manage dependencies on Linux systems. These shared resources are loaded into memory before the application starts, and when several processes require the same library, it will be loaded only once on the system. This feature saves on memory usage by the application.

Another thing to note is that when a bug is fixed in a shared library, every application that references this library will profit from it. This also means that if the bug remains undetected, each referencing application will suffer from it (if the application uses the affected parts).

It can be very hard for beginners when an application requires a specific version of the library, but the linker only knows the location of an incompatible version. In this case, you must help the linker find the path to the correct version.

Although this is not an everyday issue, understanding dynamic linking will surely help you in fixing such problems.

Fortunately, the mechanics for this are quite straightforward.

To detect which libraries are required for an application to start, you can use `ldd`, which will print out the shared libraries used by a given file:


```
$ ldd my_app
        linux-vdso.so.1 (0x00007ffd1299c000)
        libmy_shared.so =&gt; not found
        libc.so.6 =&gt; /lib64/libc.so.6 (0x00007f56b869b000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f56b8881000)
```

Note that the library `libmy_shared.so` is part of the repository but is not found. This is because the dynamic linker, which is responsible for loading all dependencies into memory before executing the application, cannot find this library in the standard locations it searches.

Errors associated with linkers finding incompatible versions of common libraries (like `bzip2`, for example) can be quite confusing for a new user. One way around this is to add the repository folder to the environment variable `LD_LIBRARY_PATH` to tell the linker where to look for the correct version. In this case, the right version is in this folder, so you can export it:


```
$ LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
$ export LD_LIBRARY_PATH
```

Now the dynamic linker knows where to find the library, and the application can be executed. You can rerun `ldd` to invoke the dynamic linker, which inspects the application's dependencies and loads them into memory. The memory address is shown after the object path:


```
$ ldd my_app
        linux-vdso.so.1 (0x00007ffd385f7000)
        libmy_shared.so =&gt; /home/stephan/library_sample/libmy_shared.so (0x00007f3fad401000)
        libc.so.6 =&gt; /lib64/libc.so.6 (0x00007f3fad21d000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f3fad408000)
```

To find out which linker is invoked, you can use `file`:


```
$ file my_app
my_app: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=26c677b771122b4c99f0fd9ee001e6c743550fa6, for GNU/Linux 3.2.0, not stripped
```

The linker `/lib64/ld-linux-x86–64.so.2` is a symbolic link to `ld-2.30.so`, which is the default linker for my Linux distribution:


```
$ file /lib64/ld-linux-x86-64.so.2
/lib64/ld-linux-x86-64.so.2: symbolic link to ld-2.31.so
```

Looking back to the output of `ldd`, you can also see (next to `libmy_shared.so`) that each dependency ends with a number (e.g., `/lib64/libc.so.6`). The usual naming scheme of shared objects is:


```
`**lib** XYZ.so **.<MAJOR>** . **<MINOR>**`
```

On my system, `libc.so.6` is also a symbolic link to the shared object `libc-2.30.so` in the same folder:


```
$ file /lib64/libc.so.6
/lib64/libc.so.6: symbolic link to libc-2.31.so
```

If you are facing the issue that an application will not start because the loaded library has the wrong version, it is very likely that you can fix this issue by inspecting and rearranging the symbolic links or specifying the correct search path (see "The dynamic loader: ld.so" below).

For more information, look on the [`ldd` man page][5].

#### Dynamic loading

Dynamic loading means that a library (e.g., a `.so` file) is loaded during a program's runtime. This is done using a certain programming scheme.

Dynamic loading is applied when an application uses plugins that can be modified during runtime.

See the [`dlopen` man page][6] for more information.

#### The dynamic loader: ld.so

On Linux, you mostly are dealing with shared objects, so there must be a mechanism that detects an application's dependencies and loads them into memory.

`ld.so` looks for shared objects in these places in the following order:

  1. The relative or absolute path in the application (hardcoded with the `-rpath` compiler option on GCC)
  2. In the environment variable `LD_LIBRARY_PATH`
  3. In the file `/etc/ld.so.cache`



Keep in mind that adding a library to the systems library archive `/usr/lib64` requires administrator privileges. You could copy `libmy_shared.so` manually to the library archive and make the application work without setting `LD_LIBRARY_PATH`:


```
unset LD_LIBRARY_PATH
sudo cp libmy_shared.so /usr/lib64/
```

When you run `ldd`, you can see the path to the library archive shows up now:


```
$ ldd my_app
        linux-vdso.so.1 (0x00007ffe82fab000)
        libmy_shared.so =&gt; /lib64/libmy_shared.so (0x00007f0a963e0000)
        libc.so.6 =&gt; /lib64/libc.so.6 (0x00007f0a96216000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f0a96401000)
```

### Customize the shared library at compile time

If you want your application to use your shared libraries, you can specify an absolute or relative path during compile time.

Modify the makefile (line 10) and recompile the program by invoking `make -B` . Then, the output of `ldd` shows `libmy_shared.so` is listed with its absolute path.

Change this:


```
`CFLAGS =-Wall -Werror -Wl,-rpath,$(shell pwd)`
```

To this (be sure to edit the username):


```
`CFLAGS =/home/stephan/library_sample/libmy_shared.so`
```

Then recompile:


```
`$ make`
```

Confirm it is using the absolute path you set, which you can see on line 2 of the output:


```
$ ldd my_app
    linux-vdso.so.1 (0x00007ffe143ed000)
        libmy_shared.so =&gt; /lib64/libmy_shared.so (0x00007fe50926d000)
        /home/stephan/library_sample/libmy_shared.so (0x00007fe509268000)
        libc.so.6 =&gt; /lib64/libc.so.6 (0x00007fe50909e000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fe50928e000)
```

This is a good example, but how would this work if you were making a library for others to use? New library locations can be registered by writing them to `/etc/ld.so.conf` or creating a `<library-name>.conf` file containing the location under `/etc/ld.so.conf.d/`. Afterward, `ldconfig` must be executed to rewrite the `ld.so.cache` file. This step is sometimes necessary after you install a program that brings some special shared libraries with it.

See the [`ld.so` man page][7] for more information.

### How to handle multiple architectures

Usually, there are different libraries for the 32-bit and 64-bit versions of applications. The following list shows their standard locations for different Linux distributions:

**Red Hat family**

  * 32 bit: `/usr/lib`
  * 64 bit: `/usr/lib64`



**Debian family**

  * 32 bit: `/usr/lib/i386-linux-gnu`
  * 64 bit: `/usr/lib/x86_64-linux-gnu`



**Arch Linux family**

  * 32 bit: `/usr/lib32`
  * 64 bit: `/usr/lib64`



[**FreeBSD**][8] (technical not a Linux distribution)

  * 32bit: `/usr/lib32`
  * 64bit: `/usr/lib`



Knowing where to look for these key libraries can make broken library links a problem of the past.

While it may be confusing at first, understanding dependency management in Linux libraries is a way to feel in control of the operating system. Run through these steps with other applications to become familiar with common libraries, and continue to learn how to fix any library challenges that could come up along your way.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/linux-libraries

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://github.com/hANSIc99/library_sample
[3]: https://en.wikipedia.org/wiki/Ar_%28Unix%29
[4]: https://linuxhint.com/understanding_elf_file_format/
[5]: https://www.man7.org/linux/man-pages/man1/ldd.1.html
[6]: https://www.man7.org/linux/man-pages/man3/dlopen.3.html
[7]: https://www.man7.org/linux/man-pages/man8/ld.so.8.html
[8]: https://opensource.com/article/20/5/furybsd-linux
