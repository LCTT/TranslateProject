[#]: subject: (Learn to debug code with the GNU Debugger)
[#]: via: (https://opensource.com/article/21/3/debug-code-gdb)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Learn to debug code with the GNU Debugger
======
Troubleshoot your code with the GNU Debugger. Download our new cheat
sheet.
![magnifying glass on computer screen, finding a bug in the code][1]

The GNU Debugger, more commonly known by its command, `gdb`, is an interactive console to help you step through source code, analyze what gets executed, and essentially reverse-engineer what's going wrong in a buggy application.

The trouble with troubleshooting is that it's complex. [GNU Debugger][2] isn't exactly a complex application, but it can be overwhelming if you don't know where to start or even when and why you might need to turn to GDB to do your troubleshooting. If you've been using print, echo, or [printf statements][3] to debug your code, but you're beginning to suspect there may be something more powerful, then this tutorial is for you.

### Code is buggy

To get started with GDB, you need some code. Here's a sample application written in C++ (it's OK if you don't typically write in C++, the principles are the same across all languages), derived from one of the examples in the [guessing game series][4] here on Opensource.com:


```
#include &lt;iostream&gt;
#include &lt;stdlib.h&gt; //srand
#include &lt;stdio.h&gt;  //printf

using namespace std;

int main () {

srand (time(NULL));
int alpha = rand() % 8;
cout &lt;&lt; "Hello world." &lt;&lt; endl;
int beta = 2;

printf("alpha is set to is %s\n", alpha);
printf("kiwi is set to is %s\n", beta);

 return 0;
} // main
```

There's a bug in this code sample, but it does compile (at least as of GCC 5). If you're familiar with C++, you may already see it, but it's a simple problem that can help new GDB users understand the debugging process. Compile it and run it to see the error:


```
$ g++ -o buggy example.cpp
$ ./buggy
Hello world.
Segmentation fault
```

### Troubleshooting a segmentation fault

From this output, you can surmise that the variable `alpha` was set correctly because otherwise, you wouldn't expect the line of code that came _after_ it. That's not always true, of course, but it's a good working theory, and it's essentially the same conclusion you'd likely come to if you were using `printf` as a log and debugger. From here, you can assume that the bug lies in _some line_ after the one that printed successfully. However, it's not clear whether the bug is in the very next line or several lines later.

GNU Debugger is an interactive troubleshooter, so you can use the `gdb` command to run buggy code. For best results, you should recompile your buggy application from source code with _debug symbols_ included. First, take a look at what information GDB can provide without recompiling:


```
$ gdb ./buggy
Reading symbols from ./buggy...done.
(gdb) start
Temporary breakpoint 1 at 0x400a44
Starting program: /home/seth/demo/buggy

Temporary breakpoint 1, 0x0000000000400a44 in main ()
(gdb)
```

When you start GDB with a binary executable as the argument, GDB loads the application and then waits for your instructions. Because this is the first time you're running GDB on this executable, it makes sense to try to repeat the error in hopes that GDB can provide further insight. GDB's command to launch the application it has loaded is, intuitively enough, `start`. By default, there's a _breakpoint_ built into GDB so that when it encounters the `main` function of your application, it pauses execution. To allow GDB to proceed, use the command `continue`:


```
(gdb) continue
Continuing.
Hello world.

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff71c0c0b in vfprintf () from /lib64/libc.so.6
(gdb)
```

No surprises here: the application crashed shortly after printing "Hello world," but GDB can provide the function call that was happening when the crash occurred. This could potentially be all you need to find the bug that's causing the crash, but to get a better idea of GDB's features and the general debugging process, imagine that the problem hasn't become clear yet, and you want to dig even deeper into what's happening with this code.

### Compiling code with debug symbols

To get the most out of GDB, you need debug symbols compiled into your executable. You can generate this with the `-g` option in GCC:


```
$ g++ -o debuggy example.cpp
$ ./debuggy
Hello world.
Segmentation fault
```

Compiling debug symbols into an executable results in a much larger file, so they're usually not distributed with the added convenience. However, if you're debugging open source code, it makes sense to recompile with debug symbols for testing:


```
$ ls -l *buggy* *cpp
-rw-r--r--    310 Feb 19 08:30 debug.cpp
-rwxr-xr-x  11624 Feb 19 10:27 buggy*
-rwxr-xr-x  22952 Feb 19 10:53 debuggy*
```

### Debugging with GDB

Launch GDB with your new executable (`debuggy`, in this example) loaded:


```
$ gdb ./debuggy
Reading symbols from ./debuggy...done.
(gdb) start
Temporary breakpoint 1 at 0x400a44
Starting program: /home/seth/demo/debuggy

Temporary breakpoint 1, 0x0000000000400a44 in main ()
(gdb)
```

As before, use the `start` command to proceed:


```
(gdb) start
Temporary breakpoint 1 at 0x400a48: file debug.cpp, line 9.
Starting program: /home/sek/demo/debuggy

Temporary breakpoint 1, main () at debug.cpp:9
9       srand (time(NULL));
(gdb)
```

This time, the automatic `main` breakpoint can specify what line number GDB paused on and what code the line contains. You could resume normal operation with `continue` but you already know that the application crashes before completion, so instead, you can step through your code line-by-line using the `next` keyword:


```
(gdb) next
10  int alpha = rand() % 8;
(gdb) next
11  cout &lt;&lt; "Hello world." &lt;&lt; endl;
(gdb) next
Hello world.
12  int beta = 2;
(gdb) next
14      printf("alpha is set to is %s\n", alpha);
(gdb) next

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff71c0c0b in vfprintf () from /lib64/libc.so.6
(gdb)
```

From this process, you can confirm that the crash didn't happen when the `beta` variable was being set but when the `printf` line was executed. The bug has been exposed several times in this article (spoiler: the wrong data type is being provided to `printf`), but assume for a moment that the solution remains unclear and that further investigation is required.

### Setting breakpoints

Once your code is loaded into GDB, you can ask GDB about the data that the code has produced so far. To try some data introspection, restart your application by issuing the `start` command again and then proceed to line 11. An easy way to get to 11 quickly is to set a breakpoint that looks for a specific line number:


```
(gdb) start
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Temporary breakpoint 2 at 0x400a48: file debug.cpp, line 9.
Starting program: /home/sek/demo/debuggy

Temporary breakpoint 2, main () at debug.cpp:9
9       srand (time(NULL));
(gdb) break 11
Breakpoint 3 at 0x400a74: file debug.cpp, line 11.
```

With the breakpoint established, continue the execution with `continue`:


```
(gdb) continue
Continuing.

Breakpoint 3, main () at debug.cpp:11
11      cout &lt;&lt; "Hello world." &lt;&lt; endl;
(gdb)
```

You're now paused at line 11, just after the `alpha` variable has been set, and just before `beta` gets set.

### Doing variable introspection with GDB

To see the value of a variable, use the `print` command. The value of `alpha` is random in this example code, so your actual results may vary from mine:


```
(gdb) print alpha
$1 = 3
(gdb)
```

Of course, you can't see the value of a variable that has not yet been established:


```
(gdb) print beta
$2 = 0
```

### Using flow control

To proceed, you could step through the lines of code to get to the point where `beta` is set to a value:


```
(gdb) next
Hello world.
12  int beta = 2;
(gdb) next
14  printf("alpha is set to is %s\n", alpha);
(gdb) print beta
$3 = 2
```

Alternatively, you could set a watchpoint. A watchpoint, like a breakpoint, is a way to control the flow of how GDB executes the code. In this case, you know that the `beta` variable should be set to `2`, so you could set a watchpoint to alert you when the value of `beta` changes:


```
(gdb) watch beta &gt; 0
Hardware watchpoint 5: beta &gt; 0
(gdb) continue
Continuing.

Breakpoint 3, main () at debug.cpp:11
11      cout &lt;&lt; "Hello world." &lt;&lt; endl;
(gdb) continue
Continuing.
Hello world.

Hardware watchpoint 5: beta &gt; 0

Old value = false
New value = true
main () at debug.cpp:14
14      printf("alpha is set to is %s\n", alpha);
(gdb)
```

You can step through the code execution manually with `next`, or you can control how the code executes with breakpoints, watchpoints, and catchpoints.

### Analyzing data with GDB

You can see data in different formats. For instance, to see the value of `beta` as an octal value:


```
(gdb) print /o beta
$4 = 02
```

To see its address in memory:


```
(gdb) print /o beta
$5 = 0x2
```

You can also see the data type of a variable:


```
(gdb) whatis beta
type = int
```

### Solving bugs with GDB

This kind of introspection better informs you about not only what code is getting executed but how it's getting executed. In this example, the `whatis` command on a variable gives you a clue that your `alpha` and `beta` variables are integers, which might jog your memory about `printf` syntax, making you realize that instead of `%s` in your `printf` statements, you must use the `%d` designator. Making that change causes the application to run as expected, with no more obvious bugs present.

It's especially frustrating when code compiles but then reveals that there are bugs present, but that's how the trickiest of bugs work. If they were easy to catch, they wouldn't be bugs. Using GDB is one way to hunt them down and eliminate them.

### Download our cheatsheet

It's a fact of life, in even the most basic forms of programming, that code has bugs. Not all bugs are so crippling that they stop an application from running (or even from compiling), and not all bugs are caused by incorrect code. Sometimes bugs happen intermittently based on an unexpected combination of choices made by a particularly creative user. Sometimes programmers inherit bugs from the libraries they use in their own code. Whatever the cause, bugs are basically everywhere, and it's part of the programmer's job to find and neutralize them.

GNU Debugger is a useful tool in finding bugs. There's a lot more you can do with it than I demonstrated in this article. You can read about its many functions with the GNU Info reader:


```
`$ info gdb`
```

Whether you're just learning GDB or you're a pro at it, it never hurts to have a reminder of what commands are available to you and what the syntax for those commands are.

### [Download our cheatsheet for GDB today.][5]

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/debug-code-gdb

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mistake_bug_fix_find_error.png?itok=PZaz3dga (magnifying glass on computer screen, finding a bug in the code)
[2]: https://www.gnu.org/software/gdb/
[3]: https://opensource.com/article/20/8/printf
[4]: https://opensource.com/article/20/12/learn-c-game
[5]: https://opensource.com/downloads/gnu-debugger-cheat-sheet
