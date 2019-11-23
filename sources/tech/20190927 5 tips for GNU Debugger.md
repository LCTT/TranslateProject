[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 tips for GNU Debugger)
[#]: via: (https://opensource.com/article/19/9/tips-gnu-debugger)
[#]: author: (Tim Waugh https://opensource.com/users/twaugh)

5 tips for GNU Debugger
======
Learn how to use some of the lesser-known features of gdb to inspect and
fix your code.
![Bug tracking magnifying glass on computer screen][1]

The [GNU Debugger][2] (gdb) is an invaluable tool for inspecting running processes and fixing problems while you're developing programs.

You can set breakpoints at specific locations (by function name, line number, and so on), enable and disable those breakpoints, display and alter variable values, and do all the standard things you would expect any debugger to do. But it has many other features you might not have experimented with. Here are five for you to try.

### Conditional breakpoints

Setting a breakpoint is one of the first things you'll learn to do with the GNU Debugger. The program stops when it reaches a breakpoint, and you can run gdb commands to inspect it or change variables before allowing the program to continue.

For example, you might know that an often-called function crashes sometimes, but only when it gets a certain parameter value. You could set a breakpoint at the start of that function and run the program. The function parameters are shown each time it hits the breakpoint, and if the parameter value that triggers the crash is not supplied, you can continue until the function is called again. When the troublesome parameter triggers a crash, you can step through the code to see what's wrong.


```
(gdb) break sometimes_crashes
Breakpoint 1 at 0x40110e: file prog.c, line 5.
(gdb) run
[...]
Breakpoint 1, sometimes_crashes (f=0x7fffffffd1bc) at prog.c:5
5      fprintf(stderr,
(gdb) continue
Breakpoint 1, sometimes_crashes (f=0x7fffffffd1bc) at prog.c:5
5      fprintf(stderr,
(gdb) continue
```

To make this more repeatable, you could count how many times the function is called before the specific call you are interested in, and set a counter on that breakpoint (for example, "continue 30" to make it ignore the next 29 times it reaches the breakpoint).

But where breakpoints get really powerful is in their ability to evaluate expressions at runtime, which allows you to automate this kind of testing. Enter: conditional breakpoints.


```
break [LOCATION] if CONDITION

(gdb) break sometimes_crashes if !f
Breakpoint 1 at 0x401132: file prog.c, line 5.
(gdb) run
[...]
Breakpoint 1, sometimes_crashes (f=0x0) at prog.c:5
5      fprintf(stderr,
(gdb)
```

Instead of having gdb ask what to do every time the function is called, a conditional breakpoint allows you to make gdb stop at that location only when a particular expression evaluates as true. If the execution reaches the conditional breakpoint location, but the expression evaluates as false, the

debugger automatically lets the program continue without asking the user what to do.

### Breakpoint commands

An even more sophisticated feature of breakpoints in the GNU Debugger is the ability to script a response to reaching a breakpoint. Breakpoint commands allow you to write a list of GNU Debugger commands to run whenever it reaches a breakpoint.

We can use this to work around the bug we already know about in the **sometimes_crashes** function and make it return from that function harmlessly when it provides a null pointer.

We can use **silent** as the first line to get more control over the output. Without this, the stack frame will be displayed each time the breakpoint is hit, even before our breakpoint commands run.


```
(gdb) break sometimes_crashes
Breakpoint 1 at 0x401132: file prog.c, line 5.
(gdb) commands 1
Type commands for breakpoint(s) 1, one per line.
End with a line saying just "end".
&gt;silent
&gt;if !f
 &gt;frame
 &gt;printf "Skipping call\n"
 &gt;return 0
 &gt;continue
 &gt;end
&gt;printf "Continuing\n"
&gt;continue
&gt;end
(gdb) run
Starting program: /home/twaugh/Documents/GDB/prog
warning: Loadable section ".note.gnu.property" outside of ELF segments
Continuing
Continuing
Continuing
#0  sometimes_crashes (f=0x0) at prog.c:5
5      fprintf(stderr,
Skipping call
[Inferior 1 (process 9373) exited normally]
(gdb)
```

### Dump binary memory

GNU Debugger has built-in support for examining memory using the **x** command in various formats, including octal, hexadecimal, and so on. But I like to see two formats side by side: hexadecimal bytes on the left, and ASCII characters represented by those same bytes on the right.

When I want to view the contents of a file byte-by-byte, I often use **hexdump -C** (hexdump comes from the [util-linux][3] package). Here is gdb's **x** command displaying hexadecimal bytes:


```
(gdb) x/33xb mydata
0x404040 &lt;mydata&gt;:    0x02    0x01    0x00    0x02    0x00    0x00    0x00    0x01
0x404048 &lt;mydata+8&gt;:    0x01    0x47    0x00    0x12    0x61    0x74    0x74    0x72
0x404050 &lt;mydata+16&gt;:    0x69    0x62    0x75    0x74    0x65    0x73    0x2d    0x63
0x404058 &lt;mydata+24&gt;:    0x68    0x61    0x72    0x73    0x65    0x75    0x00    0x05
0x404060 &lt;mydata+32&gt;:    0x00
```

What if you could teach gdb to display memory just like hexdump does? You can, and in fact, you can use this method for any format you prefer.

By combining the **dump** command to store the bytes in a file, the **shell** command to run hexdump on the file, and the **define** command, we can make our own new **hexdump** command to use hexdump to display the contents of memory.


```
(gdb) define hexdump
Type commands for definition of "hexdump".
End with a line saying just "end".
&gt;dump binary memory /tmp/dump.bin $arg0 $arg0+$arg1
&gt;shell hexdump -C /tmp/dump.bin
&gt;end
```

Those commands can even go in the **~/.gdbinit** file to define the hexdump command permanently. Here it is in action:


```
(gdb) hexdump mydata sizeof(mydata)
00000000  02 01 00 02 00 00 00 01  01 47 00 12 61 74 74 72  |.........G..attr|
00000010  69 62 75 74 65 73 2d 63  68 61 72 73 65 75 00 05  |ibutes-charseu..|
00000020  00                                                |.|
00000021
```

### Inline disassembly

Sometimes you want to understand more about what happened leading up to a crash, and the source code is not enough. You want to see what's going on at the CPU instruction level.

The **disassemble** command lets you see the CPU instructions that implement a function. But sometimes the output can be hard to follow. Usually, I want to see what instructions correspond to a certain section of source code in the function. To achieve this, use the **/s** modifier to include source code lines with the disassembly.


```
(gdb) disassemble/s main
Dump of assembler code for function main:
prog.c:
11    {
   0x0000000000401158 &lt;+0&gt;:    push   %rbp
   0x0000000000401159 &lt;+1&gt;:    mov      %rsp,%rbp
   0x000000000040115c &lt;+4&gt;:    sub      $0x10,%rsp

12      int n = 0;
   0x0000000000401160 &lt;+8&gt;:    movl   $0x0,-0x4(%rbp)

13      sometimes_crashes(&amp;n);
   0x0000000000401167 &lt;+15&gt;:    lea     -0x4(%rbp),%rax
   0x000000000040116b &lt;+19&gt;:    mov     %rax,%rdi
   0x000000000040116e &lt;+22&gt;:    callq  0x401126 &lt;sometimes_crashes&gt;
[...snipped...]
```

This, along with **info registers** to see the current values of all the CPU registers and commands like **stepi** to step one instruction at a time, allow you to have a much more detailed understanding of the program.

### Reverse debug

Sometimes you wish you could turn back time. Imagine you've hit a watchpoint on a variable. A watchpoint is like a breakpoint, but instead of being set at a location in the program, it is set on an expression (using the **watch** command). Whenever the value of the expression changes, execution stops, and the debugger takes control.

So imagine you've hit this watchpoint, and the memory used by a variable has changed value. This can turn out to be caused by something that occurred much earlier; for example, the memory was freed and is now being re-used. But when and why was it freed?

The GNU Debugger can solve even this problem because you can run your program in reverse!

It achieves this by carefully recording the state of the program at each step so that it can restore previously recorded states, giving the illusion of time flowing backward.

To enable this state recording, use the **target record-full** command. Then you can use impossible-sounding commands, such as:

  * **reverse-step**, which rewinds to the previous source line
  * **reverse-next**, which rewinds to the previous source line, stepping backward over function calls
  * **reverse-finish**, which rewinds to the point when the current function was about to be called
  * **reverse-continue**, which rewinds to the previous state in the program that would (now) trigger a breakpoint (or anything else that causes it to stop)



Here is an example of reverse debugging in action:


```
(gdb) b main
Breakpoint 1 at 0x401160: file prog.c, line 12.
(gdb) r
Starting program: /home/twaugh/Documents/GDB/prog
[...]

Breakpoint 1, main () at prog.c:12
12      int n = 0;
(gdb) target record-full
(gdb) c
Continuing.

Program received signal SIGSEGV, Segmentation fault.
0x0000000000401154 in sometimes_crashes (f=0x0) at prog.c:7
7      return *f;
(gdb) reverse-finish
Run back to call of #0  0x0000000000401154 in sometimes_crashes (f=0x0)
        at prog.c:7
0x0000000000401190 in main () at prog.c:16
16      sometimes_crashes(0);
```

These are just a handful of useful things the GNU Debugger can do. There are many more to discover. Which hidden, little-known, or just plain amazing feature of gdb is your favorite? Please share it in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/tips-gnu-debugger

作者：[Tim Waugh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/twaugh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bug_software_issue_tracking_computer_screen.jpg?itok=6qfIHR5y (Bug tracking magnifying glass on computer screen)
[2]: https://www.gnu.org/software/gdb/
[3]: https://en.wikipedia.org/wiki/Util-linux
