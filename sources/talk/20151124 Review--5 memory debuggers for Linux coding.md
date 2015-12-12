translating。。。
Review: 5 memory debuggers for Linux coding
================================================================================
![](http://images.techhive.com/images/article/2015/11/penguinadmin-2400px-100627186-primary.idge.jpg)
Credit: [Moini][1]

As a programmer, I'm aware that I tend to make mistakes -- and why not? Even programmers are human. Some errors are detected during code compilation, while others get caught during software testing. However, a category of error exists that usually does not get detected at either of these stages and that may cause the software to behave unexpectedly -- or worse, terminate prematurely. 

If you haven't already guessed it, I am talking about memory-related errors. Manually debugging these errors can be not only time-consuming but difficult to find and correct. Also, it's worth mentioning that these errors are surprisingly common, especially in software written in programming languages like C and C++, which were designed for use with [manual memory management][2]. 

Thankfully, several programming tools exist that can help you find memory errors in your software programs. In this roundup, I assess five popular, free and open-source memory debuggers that are available for Linux: Dmalloc, Electric Fence, Memcheck, Memwatch and Mtrace. I've used all five in my day-to-day programming, and so these reviews are based on practical experience. 

eviews are based on practical experience.

### [Dmalloc][3] ###

**Developer**: Gray Watson
**Reviewed version**: 5.5.2
**Linux support**: All flavors
**License**: Creative Commons Attribution-Share Alike 3.0 License

Dmalloc is a memory-debugging tool developed by Gray Watson. It is implemented as a library that provides wrappers around standard memory management functions like **malloc(), calloc(), free()** and more, enabling programmers to detect problematic code.

![cw dmalloc output](http://images.techhive.com/images/article/2015/11/cw_dmalloc-output-100627040-large.idge.png)
Dmalloc

As listed on the tool's Web page, the debugging features it provides includes memory-leak tracking, [double free][4] error tracking and [fence-post write detection][5]. Other features include file/line number reporting, and general logging of statistics.

#### What's new ####

Version 5.5.2 is primarily a [bug-fix release][6] containing corrections for a couple of build and install problems.

#### What's good about it ####

The best part about Dmalloc is that it's extremely configurable. For example, you can configure it to include support for C++ programs as well as threaded applications. A useful functionality it provides is runtime configurability, which means that you can easily enable/disable the features the tool provides while it is being executed.

You can also use Dmalloc with the [GNU Project Debugger (GDB)][7] -- just add the contents of the dmalloc.gdb file (located in the contrib subdirectory in Dmalloc's source package) to the .gdbinit file in your home directory.

Another thing that I really like about Dmalloc is its extensive documentation. Just head to the [documentation section][8] on its official website, and you'll get everything from how to download, install, run and use the library to detailed descriptions of the features it provides and an explanation of the output file it produces. There's also a section containing solutions to some common problems.

#### Other considerations ####

Like Mtrace, Dmalloc requires programmers to make changes to their program's source code. In this case you may, at the very least, want to add the **dmalloc.h** header, because it allows the tool to report the file/line numbers of calls that generate problems, something that is very useful as it saves time while debugging.

In addition, the Dmalloc library, which is produced after the package is compiled, needs to be linked with your program while the program is being compiled.

However, complicating things somewhat is the fact that you also need to set an environment variable, dubbed **DMALLOC_OPTION**, that the debugging tool uses to configure the memory debugging features -- as well as the location of the output file -- at runtime. While you can manually assign a value to the environment variable, beginners may find that process a bit tough, given that the Dmalloc features you want to enable are listed as part of that value, and are actually represented as a sum of their respective hexadecimal values -- you can read more about it [here][9].

An easier way to set the environment variable is to use the [Dmalloc Utility Program][10], which was designed for just that purpose.

#### Bottom line ####

Dmalloc's real strength lies in the configurability options it provides. It is also highly portable, having being successfully ported to many OSes, including AIX, BSD/OS, DG/UX, Free/Net/OpenBSD, GNU/Hurd, HPUX, Irix, Linux, MS-DOG, NeXT, OSF, SCO, Solaris, SunOS, Ultrix, Unixware and even Unicos (on a Cray T3E). Although the tool has a bit of a learning curve associated with it, the features it provides are worth it.

### [Electric Fence][15] ###

**Developer**: Bruce Perens
**Reviewed version**: 2.2.3
**Linux support**: All flavors
**License**: GNU GPL (version 2)

Electric Fence is a memory-debugging tool developed by Bruce Perens. It is implemented in the form of a library that your program needs to link to, and is capable of detecting overruns of memory allocated on a [heap][11] ) as well as memory accesses that have already been released.

![cw electric fence output](http://images.techhive.com/images/article/2015/11/cw_electric-fence-output-100627041-large.idge.png)
Electric Fence

As the name suggests, Electric Fence creates a virtual fence around each allocated buffer in a way that any illegal memory access results in a [segmentation fault][12]. The tool supports both C and C++ programs.

#### What's new ####

Version 2.2.3 contains a fix for the tool's build system, allowing it to actually pass the -fno-builtin-malloc option to the [GNU Compiler Collection (GCC)][13].

#### What's good about it ####

The first thing that I liked about Electric Fence is that -- unlike Memwatch, Dmalloc and Mtrace -- it doesn't require you to make any changes in the source code of your program. You just need to link your program with the tool's library during compilation.

Secondly, the way the debugging tool is implemented makes sure that a segmentation fault is generated on the very first instruction that causes a bounds violation, which is always better than having the problem detected at a later stage.

Electric Fence always produces a copyright message in output irrespective of whether an error was detected or not. This behavior is quite useful, as it also acts as a confirmation that you are actually running an Electric Fence-enabled version of your program.

#### Other considerations ####

On the other hand, what I really miss in Electric Fence is the ability to detect memory leaks, as it is one of the most common and potentially serious problems that software written in C/C++ has. In addition, the tool cannot detect overruns of memory allocated on the stack, and is not thread-safe.

Given that the tool allocates an inaccessible virtual memory page both before and after a user-allocated memory buffer, it ends up consuming a lot of extra memory if your program makes too many dynamic memory allocations.

Another limitation of the tool is that it cannot explicitly tell exactly where the problem lies in your programs' code -- all it does is produce a segmentation fault whenever it detects a memory-related error. To find out the exact line number, you'll have to debug your Electric Fence-enabled program with a tool like [The Gnu Project Debugger (GDB)][14], which in turn depends on the -g compiler option to produce line numbers in output.

Finally, although Electric Fence is capable of detecting most buffer overruns, an exception is the scenario where the allocated buffer size is not a multiple of the word size of the system -- in that case, an overrun (even if it's only a few bytes) won't be detected.

#### Bottom line ####

Despite all its limitations, where Electric Fence scores is the ease of use -- just link your program with the tool once, and it'll alert you every time it detects a memory issue it's capable of detecting. However, as already mentioned, the tool requires you to use a source-code debugger like GDB.

### [Memcheck][16] ###

**Developer**: [Valgrind Developers][17]
**Reviewed version**: 3.10.1
**Linux support**: All flavors
**License**: GPL

[Valgrind][18] is a suite that provides several tools for debugging and profiling Linux programs. Although it works with programs written in many different languages -- such as Java, Perl, Python, Assembly code, Fortran, Ada and more -- the tools it provides are largely aimed at programs written in C and C++.

The most popular Valgrind tool is Memcheck, a memory-error detector that can detect issues such as memory leaks, invalid memory access, uses of undefined values and problems related to allocation and deallocation of heap memory.

#### What's new ####

This [release][19] of the suite (3.10.1) is a minor one that primarily contains fixes to bugs reported in version 3.10.0. In addition, it also "backports fixes for all reported missing AArch64 ARMv8 instructions and syscalls from the trunk."

#### What's good about it ####

Memcheck, like all other Valgrind tools, is basically a command line utility. It's very easy to use: If you normally run your program on the command line in a form such as prog arg1 arg2, you just need to add a few values, like this: valgrind --leak-check=full prog arg1 arg2.

![cw memcheck output](http://images.techhive.com/images/article/2015/11/cw_memcheck-output-100627037-large.idge.png)
Memcheck

(Note: You don't need to mention Memcheck anywhere in the command line because it's the default Valgrind tool. However, you do need to initially compile your program with the -g option -- which adds debugging information -- so that Memcheck's error messages include exact line numbers.)

What I really like about Memcheck is that it provides a lot of command line options (such as the --leak-check option mentioned above), allowing you to not only control how the tool works but also how it produces the output.

For example, you can enable the --track-origins option to see information on the sources of uninitialized data in your program. Enabling the --show-mismatched-frees option will let Memcheck match the memory allocation and deallocation techniques. For code written in C language, Memcheck will make sure that only the free() function is used to deallocate memory allocated by malloc(), while for code written in C++, the tool will check whether or not the delete and delete[] operators are used to deallocate memory allocated by new and new[], respectively. If a mismatch is detected, an error is reported.

But the best part, especially for beginners, is that the tool even produces suggestions about which command line option the user should use to make the output more meaningful. For example, if you do not use the basic --leak-check option, it will produce an output suggesting: "Rerun with --leak-check=full to see details of leaked memory." And if there are uninitialized variables in the program, the tool will generate a message that says, "Use --track-origins=yes to see where uninitialized values come from."

Another useful feature of Memcheck is that it lets you [create suppression files][20], allowing you to suppress certain errors that you can't fix at the moment -- this way you won't be reminded of them every time the tool is run. It's worth mentioning that there already exists a default suppression file that Memcheck reads to suppress errors in the system libraries, such as the C library, that come pre-installed with your OS. You can either create a new suppression file for your use, or edit the existing one (usually /usr/lib/valgrind/default.supp).

For those seeking advanced functionality, it's worth knowing that Memcheck can also [detect memory errors][21] in programs that use [custom memory allocators][22]. In addition, it also provides [monitor commands][23] that can be used while working with Valgrind's built-in gdbserver, as well as a [client request mechanism][24] that allows you not only to tell the tool facts about the behavior of your program, but make queries as well.

#### Other considerations ####

While there's no denying that Memcheck can save you a lot of debugging time and frustration, the tool uses a lot of memory, and so can make your program execution significantly slower (around 20 to 30 times, [according to the documentation][25]).

Aside from this, there are some other limitations, too. According to some user comments, Memcheck apparently isn't [thread-safe][26]; it doesn't detect [static buffer overruns][27]). Also, there are some Linux programs, like [GNU Emacs][28], that currently do not work with Memcheck.

If you're interested in taking a look, an exhaustive list of Valgrind's limitations can be found [here][29].

#### Bottom line ####

Memcheck is a handy memory-debugging tool for both beginners as well as those looking for advanced features. While it's very easy to use if all you need is basic debugging and error checking, there's a bit of learning curve if you want to use features like suppression files or monitor commands.

Although it has a long list of limitations, Valgrind (and hence Memcheck) claims on its site that it is used by [thousands of programmers][30] across the world -- the team behind the tool says it's received feedback from users in over 30 countries, with some of them working on projects with up to a whopping 25 million lines of code. 

### [Memwatch][31] ###

**Developer**: Johan Lindh
**Reviewed version**: 2.71
**Linux support**: All flavors
**License**: GNU GPL 

Memwatch is a memory-debugging tool developed by Johan Lindh. Although it's primarily a memory-leak detector, it is also capable (according to its Web page) of detecting other memory-related issues like [double-free error tracking and erroneous frees][32], buffer overflow and underflow, [wild pointer][33] writes, and more. 

The tool works with programs written in C. Although you can also use it with C++ programs, it's not recommended (according to the Q&A file that comes with the tool's source package). 

#### What's new ####

This version adds ULONG_LONG_MAX to detect whether a program is 32-bit or 64-bit.

#### What's good about it ####

Like Dmalloc, Memwatch comes with good documentation. You can refer to the USING file if you want to learn things like how the tool works; how it performs initialization, cleanup and I/O operations; and more. Then there is a FAQ file that is aimed at helping users in case they face any common error while using Memcheck. Finally, there is a test.c file that contains a working example of the tool for your reference. 

![cw memwatch output](http://images.techhive.com/images/article/2015/11/cw_memwatch_output-100627038-large.idge.png)
Memwatch

Unlike Mtrace, the log file to which Memwatch writes the output (usually memwatch.log) is in human-readable form. Also, instead of truncating, Memwatch appends the memory-debugging output to the file each time the tool is run, allowing you to easily refer to the previous outputs should the need arise.

It's also worth mentioning that when you execute your program with Memwatch enabled, the tool produces a one-line output on [stdout][34] informing you that some errors were found -- you can then head to the log file for details. If no such error message is produced, you can rest assured that the log file won't contain any mistakes -- this actually saves time if you're running the tool several times. 

Another thing that I liked about Memwatch is that it also provides a way through which you can capture the tool's output from within the code, and handle it the way you like (refer to the mwSetOutFunc() function in the Memwatch source code for more on this). 

#### Other considerations ####

Like Mtrace and Dmalloc, Memwatch requires you to add extra code to your source file -- you have to include the memwatch.h header file in your code. Also, while compiling your program, you need to either compile memwatch.c along with your program's source files or include the object module from the compile of the file, as well as define the MEMWATCH and MW_STDIO variables on the command line. Needless to say, the -g compiler option is also required for your program if you want exact line numbers in the output.

There are some features that it doesn't contain. For example, the tool cannot detect attempts to write to an address that has already been freed or read data from outside the allocated memory. Also, it's not thread-safe. Finally, as I've already pointed out in the beginning, there is no guarantee on how the tool will behave if you use it with programs written in C++. 

#### Bottom line ####

Memcheck can detect many memory-related problems, making it a handy debugging tool when dealing with projects written in C. Given that it has a very small source code, you can learn how the tool works, debug it if the need arises, and even extend or update its functionality as per your requirements. 

### [Mtrace][35] ###

**Developers**: Roland McGrath and Ulrich Drepper
**Reviewed version**: 2.21
**Linux support**: All flavors
**License**: GNU LGPL

Mtrace is a memory-debugging tool included in [the GNU C library][36]. It works with both C and C++ programs on Linux, and detects memory leaks caused by unbalanced calls to the malloc() and free() functions. 

![cw mtrace output](http://images.techhive.com/images/article/2015/11/cw_mtrace-output-100627039-large.idge.png)
Mtrace

The tool is implemented in the form of a function called mtrace(), which traces all malloc/free calls made by a program and logs the information in a user-specified file. Because the file contains data in computer-readable format, a Perl script -- also named mtrace -- is used to convert and display it in human-readable form. 

#### What's new ####

[The Mtrace source][37] and [the Perl file][38] that now come with the GNU C library (version 2.21) add nothing new to the tool aside from an update to the copyright dates. 

#### What's good about it ####

The best part about Mtrace is that the learning curve for it isn't steep; all you need to understand is how and where to add the mtrace() -- and the corresponding muntrace() -- function in your code, and how to use the Mtrace Perl script. The latter is very straightforward -- all you have to do is run the mtrace() <program-executable> <log-file-generated-upon-program-execution> command. (For an example, see the last command in the screenshot above.)

Another thing that I like about Mtrace is that it's scalable -- which means that you can not only use it to debug a complete program, but can also use it to detect memory leaks in individual modules of the program. Just call the mtrace() and muntrace() functions within each module.

Finally, since the tool is triggered when the mtrace() function -- which you add in your program's source code -- is executed, you have the flexibility to enable the tool dynamically (during program execution) [using signals][39]. 

#### Other considerations ####

Because the calls to mtrace() and mauntrace() functions -- which are declared in the mcheck.h file that you need to include in your program's source -- are fundamental to Mtrace's operation (the mauntrace() function is not [always required][40]), the tool requires programmers to make changes in their code at least once. 

Be aware that you need to compile your program with the -g option (provided by both the [GCC][41] and [G++][42] compilers), which enables the debugging tool to display exact line numbers in the output. In addition, some programs (depending on how big their source code is) can take a long time to compile. Finally, compiling with -g increases the size of the executable (because it produces extra information for debugging), so you have to remember that the program needs to be recompiled without -g after the testing has been completed. 

To use Mtrace, you need to have some basic knowledge of environment variables in Linux, given that the path to the user-specified file -- which the mtrace() function uses to log all the information -- has to be set as a value for the MALLOC_TRACE environment variable before the program is executed.

Feature-wise, Mtrace is limited to detecting memory leaks and attempts to free up memory that was never allocated. It can't detect other memory-related issues such as illegal memory access or use of uninitialized memory. Also, [there have been complaints][43] that it's not [thread-safe][44]. 

### Conclusions ###

Needless to say, each memory debugger that I've discussed here has its own qualities and limitations. So, which one is best suited for you mostly depends on what features you require, although ease of setup and use might also be a deciding factor in some cases.

Mtrace is best suited for cases where you just want to catch memory leaks in your software program. It can save you some time, too, since the tool comes pre-installed on your Linux system, something which is also helpful in situations where the development machines aren't connected to the Internet or you aren't allowed to download a third party tool for any kind of debugging.

Dmalloc, on the other hand, can not only detect more error types compared to Mtrace, but also provides more features, such as runtime configurability and GDB integration. Also, unlike any other tool discussed here, Dmalloc is thread-safe. Not to mention that it comes with detailed documentation, making it ideal for beginners.

Although Memwatch comes with even more comprehensive documentation than Dmalloc, and can detect even more error types, you can only use it with software written in the C programming language. One of its features that stands out is that it lets you handle its output from within the code of your program, something that is helpful in case you want to customize the format of the output.

If making changes to your program's source code is not what you want, you can use Electric Fence. However, keep in mind that it can only detect a couple of error types, and that doesn't include memory leaks. Plus, you also need to know GDB basics to make the most out of this memory-debugging tool.

Memcheck is probably the most comprehensive of them all. It detects more error types and provides more features than any other tool discussed here -- and it doesn't require you to make any changes in your program's source code.But be aware that, while the learning curve is not very high for basic usage, if you want to use its advanced features, a level of expertise is definitely required. 

--------------------------------------------------------------------------------

via: http://www.computerworld.com/article/3003957/linux/review-5-memory-debuggers-for-linux-coding.html

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.computerworld.com/author/Himanshu-Arora/
[1]:https://openclipart.org/detail/132427/penguin-admin
[2]:https://en.wikipedia.org/wiki/Manual_memory_management
[3]:http://dmalloc.com/
[4]:https://www.owasp.org/index.php/Double_Free
[5]:https://stuff.mit.edu/afs/sipb/project/gnucash-test/src/dmalloc-4.8.2/dmalloc.html#Fence-Post%20Overruns
[6]:http://dmalloc.com/releases/notes/dmalloc-5.5.2.html
[7]:http://www.gnu.org/software/gdb/
[8]:http://dmalloc.com/docs/
[9]:http://dmalloc.com/docs/latest/online/dmalloc_26.html#SEC32
[10]:http://dmalloc.com/docs/latest/online/dmalloc_23.html#SEC29
[11]:https://en.wikipedia.org/wiki/Memory_management#Dynamic_memory_allocation
[12]:https://en.wikipedia.org/wiki/Segmentation_fault
[13]:https://en.wikipedia.org/wiki/GNU_Compiler_Collection
[14]:http://www.gnu.org/software/gdb/
[15]:https://launchpad.net/ubuntu/+source/electric-fence/2.2.3
[16]:http://valgrind.org/docs/manual/mc-manual.html
[17]:http://valgrind.org/info/developers.html
[18]:http://valgrind.org/
[19]:http://valgrind.org/docs/manual/dist.news.html
[20]:http://valgrind.org/docs/manual/mc-manual.html#mc-manual.suppfiles
[21]:http://valgrind.org/docs/manual/mc-manual.html#mc-manual.mempools
[22]:http://stackoverflow.com/questions/4642671/c-memory-allocators
[23]:http://valgrind.org/docs/manual/mc-manual.html#mc-manual.monitor-commands
[24]:http://valgrind.org/docs/manual/mc-manual.html#mc-manual.clientreqs
[25]:http://valgrind.org/docs/manual/valgrind_manual.pdf
[26]:http://sourceforge.net/p/valgrind/mailman/message/30292453/
[27]:https://msdn.microsoft.com/en-us/library/ee798431%28v=cs.20%29.aspx
[28]:http://www.computerworld.com/article/2484425/linux/5-free-linux-text-editors-for-programming-and-word-processing.html?nsdr=true&page=2
[29]:http://valgrind.org/docs/manual/manual-core.html#manual-core.limits
[30]:http://valgrind.org/info/
[31]:http://www.linkdata.se/sourcecode/memwatch/
[32]:http://www.cecalc.ula.ve/documentacion/tutoriales/WorkshopDebugger/007-2579-007/sgi_html/ch09.html
[33]:http://c2.com/cgi/wiki?WildPointer
[34]:https://en.wikipedia.org/wiki/Standard_streams#Standard_output_.28stdout.29
[35]:http://www.gnu.org/software/libc/manual/html_node/Tracing-malloc.html
[36]:https://www.gnu.org/software/libc/
[37]:https://sourceware.org/git/?p=glibc.git;a=history;f=malloc/mtrace.c;h=df10128b872b4adc4086cf74e5d965c1c11d35d2;hb=HEAD
[38]:https://sourceware.org/git/?p=glibc.git;a=history;f=malloc/mtrace.pl;h=0737890510e9837f26ebee2ba36c9058affb0bf1;hb=HEAD
[39]:http://webcache.googleusercontent.com/search?q=cache:s6ywlLtkSqQJ:www.gnu.org/s/libc/manual/html_node/Tips-for-the-Memory-Debugger.html+&cd=1&hl=en&ct=clnk&gl=in&client=Ubuntu
[40]:http://www.gnu.org/software/libc/manual/html_node/Using-the-Memory-Debugger.html#Using-the-Memory-Debugger
[41]:http://linux.die.net/man/1/gcc
[42]:http://linux.die.net/man/1/g++
[43]:https://sourceware.org/ml/libc-help/2014-05/msg00008.html
[44]:https://en.wikipedia.org/wiki/Thread_safety
