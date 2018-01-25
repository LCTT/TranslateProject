三步上手 GDB
===============

调试 C 程序，曾让我很困扰。然而当我之前在写我的[操作系统][2]时，我有很多的 Bug 需要调试。我很幸运的使用上了 qemu 模拟器，它允许我将调试器附加到我的操作系统。这个调试器就是 `gdb`。

我得解释一下，你可以使用 `gdb` 先做一些小事情，因为我发现初学它的时候真的很混乱。我们接下来会在一个小程序中，设置断点，查看内存。.

### 1、 设断点

如果你曾经使用过调试器，那你可能已经会设置断点了。

下面是一个我们要调试的程序（虽然没有任何 Bug）:

```
#include <stdio.h>
void do_thing() {
    printf("Hi!\n");
}
int main() {
    do_thing();
}
```

另存为 `hello.c`. 我们可以使用 `dbg` 调试它，像这样：

```
bork@kiwi ~> gcc -g hello.c -o hello
bork@kiwi ~> gdb ./hello
```

以上是带调试信息编译 `hello.c`（为了 `gdb` 可以更好工作），并且它会给我们醒目的提示符，就像这样：

```
(gdb)
```

我们可以使用 `break` 命令设置断点，然后使用 `run` 开始调试程序。

```
(gdb) break do_thing 
Breakpoint 1 at 0x4004f8
(gdb) run
Starting program: /home/bork/hello 

Breakpoint 1, 0x00000000004004f8 in do_thing ()
```

程序暂停在了 `do_thing` 开始的地方。

我们可以通过 `where` 查看我们所在的调用栈。

```
(gdb) where
#0  do_thing () at hello.c:3
#1  0x08050cdb in main () at hello.c:6
(gdb) 
```

### 2、 阅读汇编代码

使用 `disassemble` 命令，我们可以看到这个函数的汇编代码。棒级了，这是 x86 汇编代码。虽然我不是很懂它，但是 `callq` 这一行是 `printf` 函数调用。

```
(gdb) disassemble do_thing
Dump of assembler code for function do_thing:
   0x00000000004004f4 <+0>:     push   %rbp
   0x00000000004004f5 <+1>:     mov    %rsp,%rbp
=> 0x00000000004004f8 <+4>:     mov    $0x40060c,%edi
   0x00000000004004fd <+9>:     callq  0x4003f0 
   0x0000000000400502 <+14>:    pop    %rbp
   0x0000000000400503 <+15>:    retq 
```

你也可以使用 `disassemble` 的缩写 `disas`。

### 3、 查看内存

当调试我的内核时，我使用 `gdb` 的主要原因是，以确保内存布局是如我所想的那样。检查内存的命令是 `examine`，或者使用缩写 `x`。我们将使用`x`。   

通过阅读上面的汇编代码，似乎 `0x40060c` 可能是我们所要打印的字符串地址。我们来试一下。

```
(gdb) x/s 0x40060c
0x40060c:        "Hi!"
```

的确是这样。`x/s` 中 `/s` 部分，意思是“把它作为字符串展示”。我也可以“展示 10 个字符”，像这样：

```
(gdb) x/10c 0x40060c
0x40060c:       72 'H'  105 'i' 33 '!'  0 '\000'        1 '\001'        27 '\033'       3 '\003'        59 ';'
0x400614:       52 '4'  0 '\000'
```

你可以看到前四个字符是 `H`、`i`、`!` 和 `\0`，并且它们之后的是一些不相关的东西。

我知道 `gdb` 很多其他的东西，但是我仍然不是很了解它，其中 `x` 和 `break` 让我获得很多。你还可以阅读 [do umentation for examining memory][4]。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2014/02/10/three-steps-to-learning-gdb/

作者：[Julia Evans][a]
译者：[Torival](https://github.com/Torival)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca
[1]:https://jvns.ca/categories/spytools
[2]:https://jvns.ca/blog/categories/kernel
[3]:https://twitter.com/mgedmin
[4]:https://ftp.gnu.org/old-gnu/Manuals/gdb-5.1.1/html_chapter/gdb_9.html#SEC56
