5 User Space Debugging Tools in Linux
================================================================================
By definition, debugging tools are those programs which allow us to monitor ,control and correct errors in other programs while they execute. Why should we use debugging tools? To answer this, there are various situations where we get stuck while running some programs and will have the need to understand what exactly happened. For example, we might be running an application and it produces some error messages. To fix those errors, we should first figure out why and from where did the error messages come from. An application might suddenly hang and we will have to know what other processes were running at that time. We might also have to figure out what was process 'x' doing at the time of hang. In order to dissect such details, we will need the help of debugging tools. There are a few user space debugging tools and techniques in Linux which are quite useful in analysing user space problems. They are:

- **'print' statements**
- **Querying (/proc, /sys etc)**
- **Tracing (strace/ltrace)**
- **Valgrind (memwatch)**
- **GDB**

Let's go through each of them one by one.

### 1.'print' statements ###

This is a basic or primitive way of debugging a problem. We can insert print statements in the middle of a program to understand the control flow and get the value of key variables. Though it is a simple technique, it has some disadvantages to it. Programs need to be edited to add 'print 'statements which then will have to be recompiled and rerun to get the output. This is a time-consuming method if the program to be debugged is quite big.

### 2. Querying ###

In some situations, we might want to figure out in what state a running process is in the kernel or what is the memory map that it is occupying there etc. In order to obtain this type of information, we need not insert any code into the kernel. Instead, one can use the /proc filesystem.

/proc is a pseudo filesystem that gets populated with runtime system information (cpu information, amount of memory etc) once the system is up and running.

![output of 'ls /proc'](http://blog.linoxide.com/wp-content/uploads/2014/12/proc-output.png)
output of 'ls /proc'

As you can see, each process that is running in the system has an entry in the /proc filesystem in the form of its process id . Details about each of these processes can be obtained by looking into the files present in its process id directory

![output of 'ls /proc/pid'](http://blog.linoxide.com/wp-content/uploads/2014/12/proc-pid.png)
output of 'ls /proc/pid'

Explaining all the entries inside the /proc filesystem is beyond the scope of this document. Some of the useful ones are listed below:

- /proc/cmdline -> Kernel command line
- /proc/cpuinfo -> information about the processor's make, model etc
- /proc/filesystems -> filesystem information supported by the kernel
- /proc//cmdline -> command line arguments passed to the current process
- /proc//mem -> memory held by the process
- /proc//status -> status of the process

### 3. Tracing ###

strace and ltrace are two of the tracing tools used in Linux to trace program execution details.

#### strace: ####

strace intercepts and records system calls within a process and the signals received by it. To the user, it displays the system calls, arguments passed to them and the return values. strace can be attached to a process that is already running or to a new process. It is useful as a diagnostic and debugging tools for developers and system administrators. It can also be used as a tool to understand how system calls work by tracing different programs. Advantage of this tool is that no source code is needed and programs need not be recompiled.

The basic syntax for using strace is:

**strace command**

There are various options that are available to be used with strace command. One can check out the man page for strace tool to get more details.

The output of strace can be quite lengthy and we may not be interested in going through each and every line that is displayed. We can use the '-e expr' option to filter the unwanted data.

Use '-p pid' option to attach it to a running process.

Output of the command can be redirected to a file using the '-o' option

![output of strace filtering only the open system call](http://blog.linoxide.com/wp-content/uploads/2014/12/strace-output.png)
output of strace filtering only the open system call

#### ltrace: ####

ltrace tracks and records the dynamic (runtime) library calls made by a process and the signals received by it. It can also track the system calls made within a process. It's usage is similar to strace

**ltrace command**

'-i ' option prints the instruction pointer at the time of library call

'-S' option is used to display both system calls and library calls

Refer to the ltrace man page for all the available options.

![output of ltrace capturing 'strcmp' library call](http://blog.linoxide.com/wp-content/uploads/2014/12/ltrace-output.png)
output of ltrace capturing 'strcmp' library call

### 4. Valgrind ###

Valgrind is a suite of debugging and profiling tools. One of the widely used and the default tool is a memory checking tool called 'Memcheck' which intercepts calls made to malloc(), new(), free() and delete(). In other words, it is useful in detecting problems like:

- memory leaks
- double freeing
- boundary overruns
- using uninitialized memory
- using a memory after it has been freed etc.

It works directly with the executable files.

Valgrind comes with a few drawbacks as well. It can slow down your program as it increases the memory footprint. It can sometimes produce false positives and false negatives. It cannot detect out-of-range access to statically allocated arrays

In order to use it, first download it and install it on your system. ([Valgrind's download page][1]). It can be installed using the package manager for the operating system that one is using.

Installation using command line involves decompressing and untarring the downloaded file.

    tar -xjvf valgring-x.y.z.tar.bz2 (where x.y.z is the version number you are trying to install)

Get inside the newly created directory (valgrind-x.y.z)and run the following commands:

    ./configure
    make
    make install

Let's understand how valgrind works with a small program(test.c):

    #include <stdio.h>
    
    void f(void)
    
    {
    int x = malloc(10 * sizeof(int));
    
    x[10] = 0;
    }
    
    int main()
    {
    f();
    return 0;
    }

Compile the program:

    gcc -o test -g test.c

Now we have an executable file called 'test'. We can now use valgrind to check for memory errors:

    valgrind –tool=memcheck –leak-check=yes test

Here is the valgrind output showing the errors:

![output of valgrind showing heap block overrun and memory leak](http://blog.linoxide.com/wp-content/uploads/2014/12/Valgrind.png)
output of valgrind showing heap block overrun and memory leak

As we can see in the above message, we are trying to access the area beyond what is allocated in function f and the allocated memory is not freed.

### 5. GDB ###

GDB is a debugger from Free Software Foundation. It is useful in locating and fixing problems in the code. It gives control to the user to perform various actions when the program to be debugged is running, like:

- starting the program
- stop at specified locations
- stop on specified conditions
- examine required information
- make changes to data in the program etc.

One can also attach a core dump of a crashed program to GDB and analyse the cause of crash.

GDB provides a lot of options to debug programs. However, we will cover some important options here so that one can get a feel of how to get started with GDB.

If you do not already have GDB installed, it can be downloaded from [GDB's official website][2].

#### Compiling programs: ####

In order to debug a program using GDB, it has to be compiled using gcc with the'-g' option. This produces debugging information in the operating system's native format and GDB works with this information.

Here is a simple program (example1.c)performing divide by zero to show the usage of GDB:

    #include
    int divide()
    {
    int x=5, y=0;
    return x / y;
    }
    
    int main()
    {
    divide();
    }

![An example showing usage of gdb](http://blog.linoxide.com/wp-content/uploads/2014/12/gdb-example.png)
An example showing usage of gdb

#### Invoking GDB: ####

GDB can be started by executing 'gdb' in the command-line:

![invoking gdb](http://blog.linoxide.com/wp-content/uploads/2014/12/gdb.png)
invoking gdb

Once invoked, it remains there waiting for commands from the terminal and executing them until exited .

If a process is already running and you need to attach GDB to it, it can be done by specifying the process id Suppose a program has already crashed and one wants to analyse the cause of the problem, then attaching GDB to the core file helps.

#### Starting the program: ####

Once you are inside GDB, use the 'run' command to start the program to be debugged

#### Passing arguments to the program: ####

Use the 'set args' command to send the arguments to your program when it runs next time 'show args' will show the arguments passed to the program

#### Verifying the stack: ####

Whenever a program stops, first thing anyone wants to understand is why it stopped and how it stopped there. This information is called backtrace. Every function call generated by a program gets stored along with the local variables, arguments passed, call location etc in a block of data inside the stack and is called a frame. Using GDB we can examine all this data. GDB identifies these frames by giving them numbers starting from the innermost frame.

- **bt**: prints the backtrace of the entire stack
- **bt <n>** prints the backtrace of n frames
- **frame  <frame number>**: switches to the specified frame and prints that frame
- **up <n>**: move 'n' frames up
- **down <n>**: move 'n' frames down. ( n is 1 by default)

#### Examining data: ####

Program's data can be examined inside GDB using the 'print' command. For example, if 'x' is a variable inside the debugging program, 'print x' prints the value of x.

#### Examining source: ####

Parts of source file can be printed within GDB. 'list' command by default prints 10 lines of code.

- **list  <linenum>**: list the source file around 'linenum'
- **list <function>**: list the source from the beginning of 'function'

- **disas <function>**: displays the machine code for the function

#### Stopping and resuming the program: ####

Using GDB, we can set breakpoints, watchpoint etc in order to stop the program wherever required.

- **break <location>**: Sets up a breakpoint at 'location'. When this is hit while the program is executing, control is given to the user.
- **watch <expr>**: GDB stops when the 'expr' is written into by the program and it's value changes
- **catch <event>**: GDB stops when the 'event' occurs.
- **disable <breakpoint>**: disable the specified breakpoint
- **enable <breakpoint>**: enable the specified breakpoint
- **delete <breakpoint>**: delete the breakpoint / watchpoint / catch point passed. If no arguments are passed default action is to work on all the breakpoints

- **step**: execute the program step by step
- **continue**: continue with program execution until execution is complete

#### Exiting GDB: ####

Use the 'quit' command to exit from GDB

There are many more options that are available with GDB. Use the help option once you are inside GDB for more details.

![getting help within gdb](http://blog.linoxide.com/wp-content/uploads/2014/12/gdb-help.png)
getting help within gdb

### Summary ###

In this article, we have seen different types of user space debug tools available in Linux. To summarise all of them, here is a quick guideline on when to use what:
Basic debugging, getting values of key variables – print statements

Get information about filesystems supported, available memory, cpus, status of a running program in the kernel etc - querying /proc filesystem

Initial problem diagnosis, system call or library call related issues , understanding program flow – strace / ltrace

Application space related memory problems – valgrind

To examine runtime behaviour of applications, analysing application crashes – gdb.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/user-space-debugging-tools-linux/

作者：[B N Poornima][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bnpoornima/
[1]:http://valgrind.org/downloads.html
[2]:http://www.gnu.org/software/gdb/download/