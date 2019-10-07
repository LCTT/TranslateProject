[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (9 essential GNU binutils tools)
[#]: via: (https://opensource.com/article/19/10/gnu-binutils)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

9 essential GNU binutils tools
======
Binary analysis is the most underestimated skill in the computer
industry.
![Tools for the sysadmin][1]

Imagine not having access to a software's source code but still being able to understand how the software is implemented, find vulnerabilities in it, and—better yet—fix the bugs. All of this in binary form. It sounds like having superpowers, doesn't it?

You, too, can possess such superpowers, and the GNU binary utilities (binutils) are a good starting point. The [GNU binutils][2] are a collection of binary tools that are installed by default on all Linux distributions.

Binary analysis is the most underestimated skill in the computer industry. It is mostly utilized by malware analysts, reverse engineers, and people
working on low-level software.

This article explores some of the tools available through binutils. I am using RHEL but these examples should run on any Linux distribution.


```
`[~]# cat /etc/redhat-release  Red Hat Enterprise Linux Server release 7.6 (Maipo) [~]#  [~]# uname -r 3.10.0-957.el7.x86_64 [~]# `
```

Note that some packaging commands (like **rpm**) might not be available on Debian-based distributions, so use the equivalent **dpkg** command where applicable.

### Software development 101

In the open source world, many of us are focused on software in source form; when the software's source code is readily available, it is easy to simply get a copy of the source code, open your favorite editor, get a cup of coffee, and start exploring.

But the source code is not what is executed on the CPU; it is the binary or machine language instructions that are executed on the CPU. The binary or executable file is what you get when you compile the source code. People skilled in debugging often get their edge by understanding this difference.

### Compilation 101

Before digging into the binutils package itself, it's good to understand the basics of compilation.

Compilation is the process of converting a program from its source or text form in a certain programming language (C/C++) into machine code.

Machine code is the sequence of 1's and 0's that are understood by a CPU (or hardware in general) and therefore can be executed or run by the CPU. This machine code is saved to a file in a specific format that is often referred to as an executable file or a binary file. On Linux (and BSD, when using [Linux Binary Compatibility][3]), this is called [ELF][4] (Executable and Linkable Format).

The compilation process goes through a series of complicated steps before it presents an executable or binary file for a given source file. Consider this source program (C code) as an example. Open your favorite editor and type out this program:


```
`#include <stdio.h> int main(void) { printf("Hello World\n"); return 0; }`
```

#### Step 1: Preprocessing with cpp

The [C preprocessor (**cpp**)][5] is used to expand all macros and include the header files. In this example, the header file **stdio.h** will be included in the source code. **stdio.h** is a header file that contains information on a **printf** function that is used within the program. **cpp** runs on the source code, and the resulting instructions are saved in a file called **hello.i**. Open the file with a text editor to see its contents. The source code for printing **hello world** is at the bottom of the file.


```
`[testdir]# cat hello.c #include <stdio.h> int main(void) { printf("Hello World\n"); return 0; } [testdir]# [testdir]# cpp hello.c > hello.i [testdir]# [testdir]# ls -lrt total 24 -rw-r--r--. 1 root root 76 Sep 13 03:20 hello.c -rw-r--r--. 1 root root 16877 Sep 13 03:22 hello.i [testdir]#`
```

#### Step 2: Compilation with gcc

This is the stage where preprocessed source code from Step 1 is converted to assembly language instructions without creating an object file. It uses the [GNU Compiler Collection (**gcc**)][6]. After running the **gcc** command with the -**S** option on the **hello.i** file, it creates a new file called **hello.s**. This file contains the assembly language instructions for the C program.

You can view the contents using any editor or the **cat** command.


```
`[testdir]# [testdir]# gcc -Wall -S hello.i [testdir]# [testdir]# ls -l total 28 -rw-r--r--. 1 root root 76 Sep 13 03:20 hello.c -rw-r--r--. 1 root root 16877 Sep 13 03:22 hello.i -rw-r--r--. 1 root root 448 Sep 13 03:25 hello.s [testdir]# [testdir]# cat hello.s .file "hello.c" .section .rodata .LC0: .string "Hello World" .text .globl main .type main, @function main: .LFB0: .cfi_startproc pushq %rbp .cfi_def_cfa_offset 16 .cfi_offset 6, -16 movq %rsp, %rbp .cfi_def_cfa_register 6 movl $.LC0, %edi call puts movl $0, %eax popq %rbp .cfi_def_cfa 7, 8 ret .cfi_endproc .LFE0: .size main, .-main .ident "GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-36)" .section .note.GNU-stack,"",@progbits [testdir]#`
```

#### Step 3: Assembling with as

The purpose of an assembler is to convert assembly language instructions into machine language code and generate an object file that has a **.o** extension. Use the GNU assembler **as** that is available by default on all Linux platforms.


```
`[testdir]# as hello.s -o hello.o [testdir]# [testdir]# ls -l total 32 -rw-r--r--. 1 root root 76 Sep 13 03:20 hello.c -rw-r--r--. 1 root root 16877 Sep 13 03:22 hello.i -rw-r--r--. 1 root root 1496 Sep 13 03:39 hello.o -rw-r--r--. 1 root root 448 Sep 13 03:25 hello.s [testdir]#`
```

You now have your first file in the ELF format; however, you cannot execute it yet. Later, you will see the difference between an **object file** and an **executable file**.


```
`[testdir]# file hello.o hello.o: ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped`
```

#### Step 4: Linking with ld

This is the final stage of compillation, when the object files are linked to create an executable. An executable usually requires external functions that often come from system libraries (**libc**).

You can directly invoke the linker with the **ld** command; however, this command is somewhat complicated. Instead, you can use the **gcc** compiler with the **-v** (verbose) flag to understand how linking happens. (Using the **ld** command for linking is an exercise left for you to explore.)


```
`[testdir]# gcc -v hello.o Using built-in specs. COLLECT_GCC=gcc COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-redhat-linux/4.8.5/lto-wrapper Target: x86_64-redhat-linux Configured with: ../configure --prefix=/usr --mandir=/usr/share/man [...] --build=x86_64-redhat-linux Thread model: posix gcc version 4.8.5 20150623 (Red Hat 4.8.5-36) (GCC) COMPILER_PATH=/usr/libexec/gcc/x86_64-redhat-linux/4.8.5/:/usr/libexec/gcc/x86_64-redhat-linux/4.8.5/:[...]:/usr/lib/gcc/x86_64-redhat-linux/ LIBRARY_PATH=/usr/lib/gcc/x86_64-redhat-linux/4.8.5/:/usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../../lib64/:/lib/../lib64/:/usr/lib/../lib64/:/usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../:/lib/:/usr/lib/ COLLECT_GCC_OPTIONS='-v' '-mtune=generic' '-march=x86-64' /usr/libexec/gcc/x86_64-redhat-linux/4.8.5/collect2 --build-id --no-add-needed --eh-frame-hdr --hash-style=gnu [...]/../../../../lib64/crtn.o [testdir]#`
```

After running this command, you should see an executable file named **a.out**:


```
`[testdir]# ls -l total 44 -rwxr-xr-x. 1 root root 8440 Sep 13 03:45 a.out -rw-r--r--. 1 root root 76 Sep 13 03:20 hello.c -rw-r--r--. 1 root root 16877 Sep 13 03:22 hello.i -rw-r--r--. 1 root root 1496 Sep 13 03:39 hello.o -rw-r--r--. 1 root root 448 Sep 13 03:25 hello.s`
```

Running the **file** command on **a.out** shows that it is indeed an ELF executable:


```
`[testdir]# file a.out a.out: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=48e4c11901d54d4bf1b6e3826baf18215e4255e5, not stripped`
```

Run your executable file to see if it does as the source code instructs:


```
`[testdir]# ./a.out Hello World`
```

It does! So much happens behind the scenes just to print **Hello World** on the screen. Imagine what happens in more complicated programs.

### Explore the binutils tools

This exercise provided a good background for utilizing the tools that are in the binutils package. My system has binutils version 2.27-34; you may have a different version depending on your Linux distribution.


```
`[~]# rpm -qa | grep binutils binutils-2.27-34.base.el7.x86_64`
```

The following tools are available in the binutils packages:


```
`[~]# rpm -ql binutils-2.27-34.base.el7.x86_64 | grep bin/ /usr/bin/addr2line /usr/bin/ar /usr/bin/as /usr/bin/c++filt /usr/bin/dwp /usr/bin/elfedit /usr/bin/gprof /usr/bin/ld /usr/bin/ld.bfd /usr/bin/ld.gold /usr/bin/nm /usr/bin/objcopy /usr/bin/objdump /usr/bin/ranlib /usr/bin/readelf /usr/bin/size /usr/bin/strings /usr/bin/strip`
```

The compilation exercise above already explored two of these tools: the **as** command was used as an assembler, and the **ld** command was used as a linker. Read on to learn about the other seven GNU binutils package tools highlighted in bold above.

#### readelf: Displays information about ELF files

The exercise above mentioned the terms **object file** and **executable file**. Using the files from that exercise, enter **readelf** using the **-h** (header) option to dump the files' ELF header on your screen. Notice that the object file ending with the **.o** extension is shown as **Type: REL (Relocatable file)**:


```
`[testdir]# readelf -h hello.o ELF Header: Magic: 7f 45 4c 46 02 01 01 00 [...] [...] Type: REL (Relocatable file) [...]`
```

If you try to execute this file, you will get an error saying it cannot be executed. This simply means that it doesn't yet have the information that is required for it to be executed on the CPU.

Remember, you need to add the **x** or **executable bit** on the object file first using the **chmod** command or else you will get a **Permission denied** error.


```
`[testdir]# ./hello.o bash: ./hello.o: Permission denied [testdir]# chmod +x ./hello.o [testdir]# [testdir]# ./hello.o bash: ./hello.o: cannot execute binary file`
```

If you try the same command on the **a.out** file, you see that its type is an **EXEC (Executable file)**.


```
`[testdir]# readelf -h a.out ELF Header: Magic: 7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00 Class: ELF64 [...] Type: EXEC (Executable file)`
```

As seen before, this file can directly be executed by the CPU:


```
`[testdir]# ./a.out Hello World`
```

The **readelf** command gives a wealth of information about a binary. Here, it tells you that it is in ELF64-bit format, which means it can be executed only on a 64-bit CPU and won't work on a 32-bit CPU. It also tells you that it is meant to be executed on X86-64 (Intel/AMD) architecture. The entry point into the binary is at address 0x400430, which is just the address of the **main** function within the C source program.

Try the **readelf** command on the other system binaries you know, like **ls**. Note that your output (especially **Type:**) might differ on RHEL 8 or Fedora 30 systems and above due to position independent executable ([PIE][7]) changes made for security reasons.


```
`[testdir]# readelf -h /bin/ls ELF Header: Magic: 7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00 Class: ELF64 Data: 2's complement, little endian Version: 1 (current) OS/ABI: UNIX - System V ABI Version: 0 Type: EXEC (Executable file)`
```

Learn what **system libraries** the **ls** command is dependant on using the **ldd** command, as follows:


```
`[testdir]# ldd /bin/ls linux-vdso.so.1 => (0x00007ffd7d746000) libselinux.so.1 => /lib64/libselinux.so.1 (0x00007f060daca000) libcap.so.2 => /lib64/libcap.so.2 (0x00007f060d8c5000) libacl.so.1 => /lib64/libacl.so.1 (0x00007f060d6bc000) libc.so.6 => /lib64/libc.so.6 (0x00007f060d2ef000) libpcre.so.1 => /lib64/libpcre.so.1 (0x00007f060d08d000) libdl.so.2 => /lib64/libdl.so.2 (0x00007f060ce89000) /lib64/ld-linux-x86-64.so.2 (0x00007f060dcf1000) libattr.so.1 => /lib64/libattr.so.1 (0x00007f060cc84000) libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f060ca68000)`
```

Run **readelf** on the **libc** library file to see what kind of file it is. As it points out, it is a **DYN (Shared object file)**, which means it can't be directly executed on its own; it must be used by an executable file that internally uses any functions made available by the library.


```
`[testdir]# readelf -h /lib64/libc.so.6 ELF Header: Magic: 7f 45 4c 46 02 01 01 03 00 00 00 00 00 00 00 00 Class: ELF64 Data: 2's complement, little endian Version: 1 (current) OS/ABI: UNIX - GNU ABI Version: 0 Type: DYN (Shared object file)`
```

#### size: Lists section sizes and the total size

The **size** command works only on object and executable files, so if you try running it on a simple ASCII file, it will throw an error saying **File format not recognized**.


```
`[testdir]# echo "test" > file1 [testdir]# cat file1 test [testdir]# file file1 file1: ASCII text [testdir]# size file1 size: file1: File format not recognized`
```

Now, run **size** on the **object file** and the **executable file** from the exercise above. Notice that the executable file (**a.out**) has considerably more information than the object file (**hello.o**), based on the output of size command:


```
`[testdir]# size hello.o text data bss dec hex filename 89 0 0 89 59 hello.o [testdir]# size a.out text data bss dec hex filename 1194 540 4 1738 6ca a.out`
```

But what do the **text**, **data**, and **bss** sections mean?

The **text** sections refer to the code section of the binary, which has all the executable instructions. The **data** sections are where all the initialized data is, and **bss** is where all the uninitialized data is stored.

Compare **size** with some of the other available system binaries.

For the **ls** command:


```
`[testdir]# size /bin/ls text data bss dec hex filename 103119 4768 3360 111247 1b28f /bin/ls`
```

You can see that **gcc** and **gdb** are far bigger programs than **ls** just by looking at the output of the **size** command:


```
`[testdir]# size /bin/gcc text data bss dec hex filename 755549 8464 81856 845869 ce82d /bin/gcc [testdir]# size /bin/gdb text data bss dec hex filename 6650433 90842 152280 6893555 692ff3 /bin/gdb`
```

#### strings: Prints the strings of printable characters in files

It is often useful to add the **-d** flag to the **strings** command to show only the printable characters from the data section.

**hello.o** is an object file that contains instructions to print out the text **Hello World**. Hence, the only output from the **strings** command is **Hello World**.


```
`[testdir]# strings -d hello.o Hello World`
```

Running **strings** on **a.out** (an executable), on the other hand, shows additional information that was included in the binary during the linking phase:


```
`[testdir]# strings -d a.out /lib64/ld-linux-x86-64.so.2 !^BU libc.so.6 puts __libc_start_main __gmon_start__ GLIBC_2.2.5 UH-0 UH-0 =( []A\A]A^A_ Hello World ;*3$"`
```

Recall that compilation is the process of converting source code instructions into machine code. Machine code consists of only 1's and 0's and is difficult for humans to read. Therefore, it helps to present machine code as assembly language instructions. What do assembly languages look like? Remember that assembly language is architecture-specific; since I am using Intel or x86-64 architecture, the instructions will be different if you're using ARM architecture to compile the same programs.

#### objdump: Displays information from object files

Another binutils tool that can dump the machine language instructions from the binary is called **objdump**.
Use the **-d** option, which disassembles all assembly instructions from the binary.


```
 `[testdir]# objdump -d hello.o hello.o: file format elf64-x86-64 Disassembly of section .text: 0000000000000000`

`: 0: 55 push %rbp 1: 48 89 e5 mov %rsp,%rbp 4: bf 00 00 00 00 mov $0x0,%edi 9: e8 00 00 00 00 callq e`

` e: b8 00 00 00 00 mov $0x0,%eax 13: 5d pop %rbp 14: c3 retq`

` `
```

This output seems intimidating at first, but take a moment to understand it before moving ahead. Recall that the **.text** section has all the machine code instructions. The assembly instructions can be seen in the fourth column (i.e., **push**, **mov**, **callq**, **pop**, **retq**). These instructions act on registers, which are memory locations built into the CPU. The registers in this example are **rbp**, **rsp**, **edi**, **eax**, etc., and each register has a special meaning.

Now run **objdump** on the executable file (**a.out**) and see what you get. The output of **objdump** on the executable can be large, so I've narrowed it down to the **main** function using the **grep** command:


```
 `[testdir]# objdump -d a.out | grep -A 9 main\> 000000000040051d`

`: 40051d: 55 push %rbp 40051e: 48 89 e5 mov %rsp,%rbp 400521: bf d0 05 40 00 mov $0x4005d0,%edi 400526: e8 d5 fe ff ff callq 400400 40052b: b8 00 00 00 00 mov $0x0,%eax 400530: 5d pop %rbp 400531: c3 retq`

` `
```

Notice that the instructions are similar to the object file **hello.o**, but they have some additional information in them:

  * The object file **hello.o** has the following instruction: `callq e` ` `
  * The executable **a.out** consists of the following instruction with an address and a function:`callq 400400 <puts@plt>`



The above assembly instruction is calling a **puts** function. Remember that you used a **printf** function in the source code. The compiler inserted a call to the **puts** library function to output **Hello World** to the screen.

Look at the instruction for a line above **puts**:

  * The object file **hello.o** has the instruction **mov**:`mov $0x0,%edi`
  * The instruction **mov** for the executable **a.out** has an actual address (**$0x4005d0**) instead of **$0x0**:`mov $0x4005d0,%edi`



This instruction moves whatever is present at address **$0x4005d0** within the binary to the register named **edi**.

What else could be in the contents of that memory location? Yes, you guessed it right: it is nothing but the text **Hello, World**. How can you be sure?

The **readelf** command enables you to dump any section of the binary file (**a.out**) onto the screen. The following asks it to dump the **.rodata**, which is read-only data, onto the screen:


```
`[testdir]# readelf -x .rodata a.out Hex dump of section '.rodata': 0x004005c0 01000200 00000000 00000000 00000000 .... 0x004005d0 48656c6c 6f20576f 726c6400 Hello World.`
```

You can see the text **Hello World** on the right-hand side and its address in binary on the left-hand side. Does it match the address you saw in the **mov** instruction above? Yes, it does.

#### strip: Discards symbols from object files

This command is often used to reduce the size of the binary before shipping it to customers.

Remember that it hinders the process of debugging since vital information is removed from the binary; nonetheless, the binary executes flawlessly.

Run it on your **a.out** executable and notice what happens. First, ensure the binary is **not stripped** by running the following command:


```
`[testdir]# file a.out a.out: ELF 64-bit LSB executable, x86-64, [......] not stripped`
```

Also, keep track of the number of bytes originally in the binary before running the **strip** command:


```
`[testdir]# du -b a.out 8440 a.out`
```

Now run the **strip** command on your executable and ensure it worked using the **file** command:


```
`[testdir]# strip a.out [testdir]# file a.out a.out: ELF 64-bit LSB executable, x86-64, [......] stripped`
```

After stripping the binary, its size went down to **6296** from the previous **8440** bytes for this small program. With this much savings for a tiny program, no wonder large programs often are stripped.


```
`[testdir]# du -b a.out 6296 a.out`
```

#### addr2line: Converts addresses into file names and line numbers

The **addr2line** tool simply looks up addresses in the binary file and matches them up with lines in the C source code program. Pretty cool, isn't it?

Write another test program for this; only this time ensure you compile it with the **-g** flag for **gcc**, which adds additional debugging information for the binary and also helps by including the line numbers (provided in the source code here):


```
`[testdir]# cat -n atest.c 1 #include <stdio.h> 2 3 int globalvar = 100; 4 5 int function1(void) 6 { 7 printf("Within function1\n"); 8 return 0; 9 } 10 11 int function2(void) 12 { 13 printf("Within function2\n"); 14 return 0; 15 } 16 17 int main(void) 18 { 19 function1(); 20 function2(); 21 printf("Within main\n"); 22 return 0; 23 }`
```

Compile with the **-g** flag and execute it. No surprises here:


```
`[testdir]# gcc -g atest.c [testdir]# ./a.out Within function1 Within function2 Within main`
```

Now use **objdump** to identify memory addresses where your functions begin. You can use the **grep** command to filter out specific lines that you want. The addresses for your functions are highlighted below:


```
 `[testdir]# objdump -d a.out | grep -A 2 -E 'main>:|function1>:|function2>:' 000000000040051d : 40051d: 55 push %rbp 40051e: 48 89 e5 mov %rsp,%rbp -- 0000000000400532 : 400532: 55 push %rbp 400533: 48 89 e5 mov %rsp,%rbp -- 0000000000400547`

`: 400547: 55 push %rbp 400548: 48 89 e5 mov %rsp,%rbp`
```

Now use the **addr2line** tool to map these addresses from the binary to match those of the C source code:


```
`[testdir]# addr2line -e a.out 40051d /tmp/testdir/atest.c:6 [testdir]# [testdir]# addr2line -e a.out 400532 /tmp/testdir/atest.c:12 [testdir]# [testdir]# addr2line -e a.out 400547 /tmp/testdir/atest.c:18`
```

It says that **40051d** starts on line number 6 in the source file **atest.c**, which is the line where the starting brace (**{**) for **function1** starts. Match the output for **function2** and **main**.

#### nm: Lists symbols from object files

Use the C program above to test the **nm** tool. Compile it quickly using **gcc** and execute it.


```
`[testdir]# gcc atest.c [testdir]# ./a.out Within function1 Within function2 Within main`
```

Now run **nm** and **grep** for information on your functions and variables:


```
`[testdir]# nm a.out | grep -Ei 'function|main|globalvar' 000000000040051d T function1 0000000000400532 T function2 000000000060102c D globalvar U __libc_start_main@@GLIBC_2.2.5 0000000000400547 T main`
```

You can see that the functions are marked **T**, which stands for symbols in the **text** section, whereas variables are marked as **D**, which stands for symbols in the initialized **data** section.

Imagine how useful it will be to run this command on binaries where you do not have source code? This allows you to peek inside and understand which functions and variables are used. Unless, of course, the binaries have been stripped, in which case they contain no symbols, and therefore the **nm** command wouldn't be very helpful, as you can see here:


```
`[testdir]# strip a.out [testdir]# nm a.out | grep -Ei 'function|main|globalvar' nm: a.out: no symbols`
```

### Conclusion

The GNU binutils tools offer many options for anyone interested in analyzing binaries, and this has only been a glimpse of what they can do for you. Read the man pages for each tool to understand more about them and how to use them.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/gnu-binutils

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_sysadmin_cloud.png?itok=sUciG0Cn (Tools for the sysadmin)
[2]: https://en.wikipedia.org/wiki/GNU_Binutils
[3]: https://www.freebsd.org/doc/handbook/linuxemu.html
[4]: https://en.wikipedia.org/wiki/Executable_and_Linkable_Format
[5]: https://en.wikipedia.org/wiki/C_preprocessor
[6]: https://gcc.gnu.org/onlinedocs/gcc/
[7]: https://en.wikipedia.org/wiki/Position-independent_code#Position-independent_executables
