[#]: collector: (lujun9972)
[#]: translator: (tt67wq)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13318-1.html)
[#]: subject: (How to handle dynamic and static libraries in Linux)
[#]: via: (https://opensource.com/article/20/6/linux-libraries)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)

怎样在 Linux 中使用动态和静态库
======

> 了解 Linux 如何使用库，包括静态库和动态库的差别，有助于你解决依赖问题。

![](https://img.linux.net.cn/data/attachment/album/202104/21/184822euzoqsiwxxpiqqrr.jpg)

Linux 从某种意义上来说就是一堆相互依赖的静态和动态库。对于 Linux 系统新手来说，库的整个处理过程简直是个迷。但对有经验的人来说，被构建进操作系统的大量共享代码对于编写新应用来说却是个优点。

为了让你熟悉这个话题，我准备了一个小巧的 [应用例子][2] 来展示在普通的 Linux 发行版（在其他操作系统上未验证）上是经常是如何处理库的。为了用这个例子来跟上这个需要动手的教程，请打开命令行输入：

```
$ git clone https://github.com/hANSIc99/library_sample
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

当执行完这些命令，这些文件应当被添加进目录下（执行 `ls` 来查看）：

```
my_app
libmy_static.a
libmy_shared.so
```

### 关于静态链接

当你的应用链接了一个静态库，这个库的代码就变成了可执行文件的一部分。这个动作只在链接过程中执行一次，这些静态库通常以 `.a` 扩展符结尾。

静态库是多个<ruby>目标<rt>object</rt></ruby>文件的<ruby>归档<rt>archive</rt></ruby>（[ar][3]）。这些目标文件通常是 ELF 格式的。ELF 是 <ruby>[可执行可链接格式][4]<rt>Executable and Linkable Format</rt></ruby> 的简写，它与多个操作系统兼容。

`file` 命令的输出可以告诉你静态库 `libmy_static.a` 是 `ar` 格式的归档文件类型。

```
$ file libmy_static.a
libmy_static.a: current ar archive
```

使用 `ar -t`，你可以看到归档文件的内部。它展示了两个目标文件：

```
$ ar -t libmy_static.a
libmy_static_a.o
libmy_static_b.o
```

你可以用 `ax -x <archive-file>` 命令来提取归档文件的文件。被提出的都是 ELF 格式的目标文件：

```
$ ar -x libmy_static.a
$ file libmy_static_a.o
libmy_static_a.o: ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped
```

### 关于动态链接

动态链接指的是使用共享库。共享库通常以 `.so` 的扩展名结尾（“<ruby>共享对象<rt>shared object</rt></ruby>” 的简写）。

共享库是 Linux 系统中依赖管理的最常用方法。这些共享库在应用启动前被载入内存，当多个应用都需要同一个库时，这个库在系统中只会被加载一次。这个特性减少了应用的内存占用。

另外一个值得注意的地方是，当一个共享库的 bug 被修复后，所有引用了这个库的应用都会受益。但这也意味着，如果一个 bug 还没被发现，那所有相关的应用都会遭受这个 bug 影响（如果这个应用使用了受影响的部分）。

当一个应用需要某个特定版本的库，但是<ruby>链接器<rt>linker</rt></ruby>只知道某个不兼容版本的位置，对于初学者来说这个问题非常棘手。在这个场景下，你必须帮助链接器找到正确版本的路径。

尽管这不是一个每天都会遇到的问题，但是理解动态链接的原理总是有助于你修复类似的问题。

幸运的是，动态链接的机制其实非常简洁明了。

为了检查一个应用在启动时需要哪些库，你可以使用 `ldd` 命令，它会打印出给定文件所需的动态库：

```
$ ldd my_app
        linux-vdso.so.1 (0x00007ffd1299c000)
        libmy_shared.so => not found
        libc.so.6 => /lib64/libc.so.6 (0x00007f56b869b000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f56b8881000)
```

可以注意到 `libmy_shared.so` 库是代码仓库的一部分，但是没有被找到。这是因为负责在应用启动之前将所有依赖加载进内存的动态链接器没有在它搜索的标准路径下找到这个库。

对新手来说，与常用库（例如 `bizp2`）版本不兼容相关的问题往往十分令人困惑。一种方法是把该仓库的路径加入到环境变量 `LD_LIBRARY_PATH` 中来告诉链接器去哪里找到正确的版本。在本例中，正确的版本就在这个目录下，所以你可以导出它至环境变量：

```
$ LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
$ export LD_LIBRARY_PATH
```

现在动态链接器知道去哪找库了，应用也可以执行了。你可以再次执行 `ldd` 去调用动态链接器，它会检查应用的依赖然后加载进内存。内存地址会在对象路径后展示：

```
$ ldd my_app
        linux-vdso.so.1 (0x00007ffd385f7000)
        libmy_shared.so => /home/stephan/library_sample/libmy_shared.so (0x00007f3fad401000)
        libc.so.6 => /lib64/libc.so.6 (0x00007f3fad21d000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f3fad408000)
```

想知道哪个链接器被调用了，你可以用 `file` 命令：

```
$ file my_app
my_app: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=26c677b771122b4c99f0fd9ee001e6c743550fa6, for GNU/Linux 3.2.0, not stripped
```

链接器 `/lib64/ld-linux-x86–64.so.2` 是一个指向 `ld-2.30.so` 的软链接，它也是我的 Linux 发行版的默认链接器：

```
$ file /lib64/ld-linux-x86-64.so.2
/lib64/ld-linux-x86-64.so.2: symbolic link to ld-2.31.so
```

回头看看 `ldd` 命令的输出，你还可以看到（在 `libmy_shared.so` 边上）每个依赖都以一个数字结尾（例如 `/lib64/libc.so.6`）。共享对象的常见命名格式为：

```
libXYZ.so.<MAJOR>.<MINOR>
```

在我的系统中，`libc.so.6` 也是指向同一目录下的共享对象 `libc-2.31.so` 的软链接。

```
$ file /lib64/libc.so.6
/lib64/libc.so.6: symbolic link to libc-2.31.so
```

如果你正在面对一个应用因为加载库的版本不对导致无法启动的问题，有很大可能你可以通过检查整理这些软链接或者确定正确的搜索路径（查看下方“动态加载器：ld.so”一节）来解决这个问题。

更为详细的信息请查看 [ldd 手册页][5]。

#### 动态加载

动态加载的意思是一个库（例如一个 `.so` 文件）在程序的运行时被加载。这是使用某种特定的编程方法实现的。

当一个应用使用可以在运行时改变的插件时，就会使用动态加载。

查看 [dlopen 手册页][6] 获取更多信息。

#### 动态加载器：ld.so

在 Linux 系统中，你几乎总是正在跟共享库打交道，所以必须有个机制来检测一个应用的依赖并将其加载进内存中。

`ld.so` 按以下顺序在这些地方寻找共享对象：

  1. 应用的绝对路径或相对路径下（用 GCC 编译器的 `-rpath` 选项硬编码的）
  2. 环境变量 `LD_LIBRARY_PATH`
  3. `/etc/ld.so.cache` 文件

需要记住的是，将一个库加到系统库归档 `/usr/lib64` 中需要管理员权限。你可以手动拷贝 `libmy_shared.so` 至库归档中来让应用可以运行，而避免设置 `LD_LIBRARY_PATH`。

```
unset LD_LIBRARY_PATH
sudo cp libmy_shared.so /usr/lib64/
```

当你运行 `ldd` 时，你现在可以看到归档库的路径被展示出来：

```
$ ldd my_app
        linux-vdso.so.1 (0x00007ffe82fab000)
        libmy_shared.so => /lib64/libmy_shared.so (0x00007f0a963e0000)
        libc.so.6 => /lib64/libc.so.6 (0x00007f0a96216000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f0a96401000)
```

### 在编译时定制共享库

如果你想你的应用使用你的共享库，你可以在编译时指定一个绝对或相对路径。

编辑 `makefile`（第 10 行）然后通过 `make -B` 来重新编译程序。然后 `ldd` 输出显示 `libmy_shared.so` 和它的绝对路径一起被列出来了。

把这个：

```
CFLAGS =-Wall -Werror -Wl,-rpath,$(shell pwd)
```

改成这个（记得修改用户名）：

```
CFLAGS =/home/stephan/library_sample/libmy_shared.so
```

然后重新编译：

```
$ make
```

确认下它正在使用你设定的绝对路径，你可以在输出的第二行看到：

```
$ ldd my_app
    linux-vdso.so.1 (0x00007ffe143ed000)
        libmy_shared.so => /lib64/libmy_shared.so (0x00007fe50926d000)
        /home/stephan/library_sample/libmy_shared.so (0x00007fe509268000)
        libc.so.6 => /lib64/libc.so.6 (0x00007fe50909e000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fe50928e000)
```

这是个不错的例子，但是如果你在编写给其他人用的库，它是怎样工作的呢？新库的路径可以通过写入 `/etc/ld.so.conf` 或是在 `/etc/ld.so.conf.d/` 目录下创建一个包含路径的 `<library-name>.conf` 文件来注册至系统。之后，你必须执行 `ldconfig` 命令来覆写 `ld.so.cache` 文件。这一步有时候在你装了携带特殊的共享库的程序来说是不可省略的。

查看 [ld.so 的手册页][7] 获取更多详细信息。

### 怎样处理多种架构

通常来说，32 位和 64 位版本的应用有不同的库。下面列表展示了不同 Linux 发行版库的标准路径：

**红帽家族**

  * 32 位：`/usr/lib`
  * 64 位：`/usr/lib64`

**Debian 家族**

  * 32 位：`/usr/lib/i386-linux-gnu`
  * 64 位：`/usr/lib/x86_64-linux-gnu`

**Arch Linux 家族**

  * 32 位：`/usr/lib32`
  * 64 位：`/usr/lib64`

[FreeBSD][8]（技术上来说不算 Linux 发行版）

  * 32 位：`/usr/lib32`
  * 64 位：`/usr/lib`

知道去哪找这些关键库可以让库链接失效的问题成为历史。

虽然刚开始会有点困惑，但是理解 Linux 库的依赖管理是一种对操作系统掌控感的表现。在其他应用程序中运行这些步骤，以熟悉常见的库，然后继续学习怎样解决任何你可能遇到的库的挑战。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/linux-libraries

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[tt67wq](https://github.com/tt67wq)
校对：[wxy](https://github.com/wxy)

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
