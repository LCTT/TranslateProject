[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 ways to analyze binary files on Linux)
[#]: via: (https://opensource.com/article/20/4/linux-binary-analysis)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

10 ways to analyze binary files on Linux
======
These simple commands and tools can help you sail through the task of
analyzing binary files.
![Tux with binary code background][1]

"There are 10 types of people in this world: those who understand binary and those who don't."

We work with binaries daily, yet we understand so little about them. By binaries, I mean the executable files that you run daily, right from your command line tools to full-fledged applications.

Linux provides a rich set of tools that makes analyzing binaries a breeze! Whatever might be your job role, if you are working on Linux, knowing the basics about these tools will help you understand your system better.

In this article, we will cover some of the most popular of these Linux tools and commands, most of which will be available natively as part of your Linux distribution. If not, you can always use your package manager to install and explore them. Remember: learning to use the right tool at the right occasion requires plenty of patience and practice.

### file

What it does: Help to determine the file type.

This will be your starting point for binary analysis. We work with files daily. Not everything is an executable type; there is a whole wide range of file types out there. Before you start, you need to understand the type of file that is being analyzed. Is it a binary file, a library file, an ASCII text file, a video file, a picture file, a PDF, a data file, etc.?

The **file** command will help you identify the exact file type that you are dealing with.


```
$ file /bin/ls
/bin/ls: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=94943a89d17e9d373b2794dcb1f7e38c95b66c86, stripped
$
$ file /etc/passwd
/etc/passwd: ASCII text
$
```

### ldd

What it does: Print shared object dependencies.

If you have already used the **file** command above on an executable binary, you can't miss the "dynamically linked" message in the output. What does it mean?

When software is being developed, we try not to reinvent the wheel. There are a set of common tasks that most software programs require, like printing output or reading from standard in, or opening files, etc. All of these common tasks are abstracted away in a set of common functions that everybody can then use instead of writing their own variants. These common functions are put in a library called **libc** or **glibc**.

How does one find which libraries the executable is dependent on? That’s where **ldd** command comes into the picture. Running it against a dynamically linked binary shows all its dependent libraries and their paths.


```
$ ldd /bin/ls
        linux-vdso.so.1 =&gt;  (0x00007ffef5ba1000)
        libselinux.so.1 =&gt; /lib64/libselinux.so.1 (0x00007fea9f854000)
        libcap.so.2 =&gt; /lib64/libcap.so.2 (0x00007fea9f64f000)
        libacl.so.1 =&gt; /lib64/libacl.so.1 (0x00007fea9f446000)
        libc.so.6 =&gt; /lib64/libc.so.6 (0x00007fea9f079000)
        libpcre.so.1 =&gt; /lib64/libpcre.so.1 (0x00007fea9ee17000)
        libdl.so.2 =&gt; /lib64/libdl.so.2 (0x00007fea9ec13000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fea9fa7b000)
        libattr.so.1 =&gt; /lib64/libattr.so.1 (0x00007fea9ea0e000)
        libpthread.so.0 =&gt; /lib64/libpthread.so.0 (0x00007fea9e7f2000)
$
```

### ltrace

What it does: A library call tracer.

We now know how to find the libraries an executable program is dependent on using the **ldd** command. However, a library can contain hundreds of functions. Out of those hundreds, which are the actual functions being used by our binary?

The **ltrace** command displays all the functions that are being called at run time from the library. In the below example, you can see the function names being called, along with the arguments being passed to that function. You can also see what was returned by those functions on the far right side of the output.


```
$ ltrace ls
__libc_start_main(0x4028c0, 1, 0x7ffd94023b88, 0x412950 &lt;unfinished ...&gt;
strrchr("ls", '/')                                                                  = nil
setlocale(LC_ALL, "")                                                               = "en_US.UTF-8"
bindtextdomain("coreutils", "/usr/share/locale")                                    = "/usr/share/locale"
textdomain("coreutils")                                                             = "coreutils"
__cxa_atexit(0x40a930, 0, 0, 0x736c6974756572)                                      = 0
isatty(1)                                                                           = 1
getenv("QUOTING_STYLE")                                                             = nil
getenv("COLUMNS")                                                                   = nil
ioctl(1, 21523, 0x7ffd94023a50)                                                     = 0
&lt;&lt; snip &gt;&gt;
fflush(0x7ff7baae61c0)                                                              = 0
fclose(0x7ff7baae61c0)                                                              = 0
+++ exited (status 0) +++
$
```

### Hexdump

What it does: Display file contents in ASCII, decimal, hexadecimal, or octal.

Often, it happens that you open a file with an application that doesn’t know what to do with that file. Try opening an executable file or a video file using vim; all you will see is gibberish thrown on the screen.

Opening unknown files in Hexdump helps you see what exactly the file contains. You can also choose to see the ASCII representation of the data present in the file using some command-line options. This might help give you some clues to what kind of file it is.


```
$ hexdump -C /bin/ls | head
00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
00000010  02 00 3e 00 01 00 00 00  d4 42 40 00 00 00 00 00  |..&gt;......B@.....|
00000020  40 00 00 00 00 00 00 00  f0 c3 01 00 00 00 00 00  |@...............|
00000030  00 00 00 00 40 00 38 00  09 00 40 00 1f 00 1e 00  |....@.8...@.....|
00000040  06 00 00 00 05 00 00 00  40 00 00 00 00 00 00 00  |........@.......|
00000050  40 00 40 00 00 00 00 00  40 00 40 00 00 00 00 00  |@.@.....@.@.....|
00000060  f8 01 00 00 00 00 00 00  f8 01 00 00 00 00 00 00  |................|
00000070  08 00 00 00 00 00 00 00  03 00 00 00 04 00 00 00  |................|
00000080  38 02 00 00 00 00 00 00  38 02 40 00 00 00 00 00  |8.......8.@.....|
00000090  38 02 40 00 00 00 00 00  1c 00 00 00 00 00 00 00  |8.@.............|
$
```

### strings

What it does: Print the strings of printable characters in files.

If Hexdump seems a bit like overkill for your use case and you are simply looking for printable characters within a binary, you can use the **strings** command.

When software is being developed, a variety of text/ASCII messages are added to it, like printing info messages, debugging info, help messages, errors, and so on. Provided all this information is present in the binary, it will be dumped to screen using **strings**.


```
`$ strings /bin/ls`
```

### readelf

What it does: Display information about ELF files.

ELF (Executable and Linkable File Format) is the dominant file format for executable or binaries, not just on Linux but a variety of UNIX systems as well. If you have utilized tools like file command, which tells you that the file is in ELF format, the next logical step will be to use the **readelf** command and its various options to analyze the file further.

Having a reference of the actual ELF specification handy when using **readelf** can be very useful. You can find the specification [here][2]. 


```
$ readelf -h /bin/ls
ELF Header:
  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF64
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           Advanced Micro Devices X86-64
  Version:                           0x1
  Entry point address:               0x4042d4
  Start of program headers:          64 (bytes into file)
  Start of section headers:          115696 (bytes into file)
  Flags:                             0x0
  Size of this header:               64 (bytes)
  Size of program headers:           56 (bytes)
  Number of program headers:         9
  Size of section headers:           64 (bytes)
  Number of section headers:         31
  Section header string table index: 30
$
```

### objdump

What it does: Display information from an object file.

Binaries are created when you write source code which gets compiled using a tool called, unsurprisingly, a compiler. This compiler generates machine language instructions equivalent to the source code, which can then be executed by the CPU to perform a given task. This machine language code can be interpreted via mnemonics called an assembly language. An assembly language is a set of instructions that help you understand the operations being performed by the program and ultimately being executed on the CPU.

**objdump** utility reads the binary or executable file and dumps the assembly language instructions on the screen. Knowledge of assembly is critical to understand the output of the **objdump** command.

Remember: assembly language is architecture-specific.


```
$ objdump -d /bin/ls | head

/bin/ls:     file format elf64-x86-64

Disassembly of section .init:

0000000000402150 &lt;_init@@Base&gt;:
  402150:       48 83 ec 08             sub    $0x8,%rsp
  402154:       48 8b 05 6d 8e 21 00    mov    0x218e6d(%rip),%rax        # 61afc8 &lt;__gmon_start__&gt;
  40215b:       48 85 c0                test   %rax,%rax
$
```

### strace

What it does: Trace system calls and signals.

If you have used **ltrace**, mentioned earlier, think of **strace** being similar. The only difference is that, instead of calling a library, the **strace** utility traces system calls. System calls are how you interface with the kernel to get work done.

To give an example, if you want to print something to the screen, you will use the **printf** or **puts** function from the standard library **libc**; however, under the hood, ultimately, a system call named **write** will be made to actually print something to the screen.


```
$ strace -f /bin/ls
execve("/bin/ls", ["/bin/ls"], [/* 17 vars */]) = 0
brk(NULL)                               = 0x686000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f967956a000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=40661, ...}) = 0
mmap(NULL, 40661, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f9679560000
close(3)                                = 0
&lt;&lt; snip &gt;&gt;
fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 1), ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f9679569000
write(1, "R2  RH\n", 7R2  RH
)                 = 7
close(1)                                = 0
munmap(0x7f9679569000, 4096)            = 0
close(2)                                = 0
exit_group(0)                           = ?
+++ exited with 0 +++
$
```

### nm

What it does: List symbols from object files.

If you are working with a binary that is not stripped, the **nm** command will provide you with the valuable information that was embedded in the binary during compilation. **nm** can help you identify variables and functions from the binary. You can imagine how useful this would be if you don't have access to the source code of the binary being analyzed.

To showcase **nm**, we will quickly write a small program and compile it with the **-g** option, and we will also see that the binary is not stripped by using the file command.


```
$ cat hello.c
#include &lt;stdio.h&gt;

int main() {
    printf("Hello world!");
    return 0;
}
$
$ gcc -g hello.c -o hello
$
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=3de46c8efb98bce4ad525d3328121568ba3d8a5d, not stripped
$
$ ./hello
Hello world!$
$

$ nm hello | tail
0000000000600e20 d __JCR_END__
0000000000600e20 d __JCR_LIST__
00000000004005b0 T __libc_csu_fini
0000000000400540 T __libc_csu_init
                 U __libc_start_main@@GLIBC_2.2.5
000000000040051d T main
                 U printf@@GLIBC_2.2.5
0000000000400490 t register_tm_clones
0000000000400430 T _start
0000000000601030 D __TMC_END__
$
```

### gdb

What it does: The GNU debugger.

Well, not everything in the binary can be statically analyzed. We did execute some commands which ran the binary, like **ltrace** and **strace**; however, software consists of a variety of conditions that could lead to various alternate paths being executed.

The only way to analyze these paths is at run time by having the ability to stop or pause the program at any given location and being able to analyze information and then move further down.
That is where debuggers come into the picture, and on Linux, **gdb** is the defacto debugger. It helps you load a program, set breakpoints at specific places, analyze memory and CPU register, and do much more. It complements the other tools mentioned above and allows you to do much more runtime analysis.

One thing to notice is, once you load a program using **gdb**, you will be presented with its own **(gdb)** prompt. All further commands will be run in this **gdb** command prompt until you exit.

We will use the "hello" program that we compiled earlier and use **gdb** to see how it works.


```
$ gdb -q ./hello
Reading symbols from /home/flash/hello...done.
(gdb) break main
Breakpoint 1 at 0x400521: file hello.c, line 4.
(gdb) info break
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x0000000000400521 in main at hello.c:4
(gdb) run
Starting program: /home/flash/./hello

Breakpoint 1, main () at hello.c:4
4           printf("Hello world!");
Missing separate debuginfos, use: debuginfo-install glibc-2.17-260.el7_6.6.x86_64
(gdb) bt
#0  main () at hello.c:4
(gdb) c
Continuing.
Hello world![Inferior 1 (process 29620) exited normally]
(gdb) q
$
```

### Conclusion

Once you are comfortable with using these native Linux binary analysis tools and understanding the output they provide, you can then move onto more advanced and professional open source binary analysis tools like [radare2][3].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/linux-binary-analysis

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tux_linux_penguin_code_binary.jpg?itok=TxGxW0KY (Tux with binary code background)
[2]: http://www.skyfree.org/linux/references/ELF_Format.pdf
[3]: https://github.com/radareorg/radare2
