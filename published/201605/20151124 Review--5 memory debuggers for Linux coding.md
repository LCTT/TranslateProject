点评五款用于 Linux 编程的内存调试器
================================================================================
![](http://images.techhive.com/images/article/2015/11/penguinadmin-2400px-100627186-primary.idge.jpg)
>Credit: [Moini][1]

作为一个程序员，我知道我肯定会犯错误——怎么可能不犯错！程序员也是人啊。有的错误能在编码过程中及时发现，而有些却得等到软件测试了才能显露出来。然而，还有一类错误并不能在这两个阶段被解决，这就导致软件不能正常运行，甚至是提前终止。

如果你还没猜出是那种错误，我说的就是和内存相关的错误。手动调试这些错误不仅耗时，而且很难发现并纠正。值得一提的是，这种错误很常见，特别是在用 C/C++ 这类允许[手动管理内存][2]的语言编写的软件里。

幸运的是，现行有一些编程工具能够帮你在软件程序中找到这些和内存相关的错误。在这些工具集中，我评估了五款支持 Linux 的、流行的、自由开源的内存调试器： Dmalloc 、 Electric Fence 、 Memcheck 、 Memwatch 以及 Mtrace 。在日常编码中，我已经用过这五个调试器了，所以这些评估是建立在我的实际体验之上的。

### [Dmalloc][3] ###

**开发者**：Gray Watson

**评估版本**：5.5.2

**支持的 Linux 版本**：所有种类

**许可**： CC 3.0

Dmalloc 是 Gray Watson 开发的一款内存调试工具。它是作为库来实现的，封装了标准内存管理函数如`malloc() , calloc() , free()`等，使程序员得以检测出有问题的代码。

![cw dmalloc output](http://images.techhive.com/images/article/2015/11/cw_dmalloc-output-100627040-large.idge.png)

*Dmalloc*

如同工具的网页所示，这个调试器提供的特性包括内存泄漏跟踪、[重复释放内存(double free)][4]错误跟踪、以及[越界写入(fence-post write)][5]检测。其它特性包括报告错误的文件/行号、通用的数据统计记录。

#### 更新内容 ####

5.5.2 版本是一个 [bug 修正发行版][6]，修复了几个有关构建和安装的问题。

#### 有何优点 ####

Dmalloc 最大的优点就是高度可配置性。比如说，你可以配置它以支持 C++ 程序和多线程应用。 Dmalloc 还提供一个有用的功能：运行时可配置，这表示在 Dmalloc 执行时，可以轻易地启用或者禁用它提供的一些特性。

你还可以配合 [GNU Project Debugger (GDB)][7]来使用 Dmalloc ，只需要将`dmalloc.gdb`文件（位于 Dmalloc 源码包中的 contrib 子目录里）的内容添加到你的主目录中的`.gdbinit`文件里即可。

另外一个让我对 Dmalloc 爱不释手的优点是它有大量的资料文献。前往官网的 [Documentation 栏目][8]，可以获取所有关于如何下载、安装、运行、怎样使用库，和 Dmalloc 所提供特性的细节描述，及其生成的输出文件的解释。其中还有一个章节介绍了一般问题的解决方法。

#### 注意事项 ####

跟 Mtrace 一样， Dmalloc 需要程序员改动他们的源代码。比如说你可以（也是必须的）添加头文件`dmalloc.h`，工具就能汇报产生问题的调用的文件或行号。这个功能非常有用，因为它节省了调试的时间。

除此之外，还需要在编译你的程序时，把 Dmalloc 库（编译 Dmalloc 源码包时产生的）链接进去。

然而，还有点更麻烦的事，需要设置一个环境变量，命名为`DMALLOC_OPTION`，以供工具在运行时配置内存调试特性，比如定义输出文件的路径。可以手动为该环境变量分配一个值，不过初学者可能会觉得这个过程有点困难，因为该值的一部分用来表示要启用的 Dmalloc 特性——以十六进制值的累加值表示。[这里][9]有详细介绍。

一个比较简单方法设置这个环境变量是使用 [Dmalloc 实用指令][10]，这是专为这个目的设计的方法。

#### 总结 ####

Dmalloc 真正的优势在于它的可配置选项。而且高度可移植，曾经成功移植到多种操作系统如 AIX 、 BSD/OS 、 DG/UX 、 Free/Net/OpenBSD 、 GNU/Hurd 、 HPUX 、 Irix 、 Linux 、 MS-DOG 、 NeXT 、 OSF 、 SCO 、 Solaris 、 SunOS 、 Ultrix 、 Unixware 甚至 Unicos（运行在 Cray T3E 主机上）。虽然使用 Dmalloc 需要学习许多知识，但是它所提供的特性值得为之付出。

### [Electric Fence][15] ###

**开发者**：Bruce Perens

**评估版本**：2.2.3

**支持的 Linux 版本**：所有种类

**许可**：GPL v2

Electric Fence 是 Bruce Perens 开发的一款内存调试工具，它以库的形式实现，你的程序需要链接它。Electric Fence 能检测出[堆][11]内存溢出和访问已经释放的内存。

![cw electric fence output](http://images.techhive.com/images/article/2015/11/cw_electric-fence-output-100627041-large.idge.png)

*Electric Fence*

顾名思义， Electric Fence 在每个所申请的缓存边界建立了虚拟围栏，这样一来任何非法的内存访问都会导致[段错误][12]。这个调试工具同时支持 C 和 C++ 程序。

#### 更新内容 ####

2.2.3 版本修复了工具的构建系统，使得 `-fno-builtin-malloc` 选项能真正传给 [GNU Compiler Collection (GCC)][13]。

#### 有何优点 ####

我喜欢 Electric Fence 的首要一点是它不同于 Memwatch 、 Dmalloc 和 Mtrace ，不需要对你的源码做任何的改动，你只需要在编译的时候把它的库链接进你的程序即可。

其次， Electric Fence 的实现保证了产生越界访问的第一个指令就会引起段错误。这比在后面再发现问题要好多了。

不管是否有检测出错误， Electric Fence 都会在输出产生版权信息。这一点非常有用，由此可以确定你所运行的程序已经启用了 Electric Fence 。

#### 注意事项 ####

另一方面，我对 Electric Fence 真正念念不忘的是它检测内存泄漏的能力。内存泄漏是 C/C++ 软件最常见也是最不容易发现的问题之一。不过， Electric Fence 不能检测出栈溢出，而且也不是线程安全的。

由于 Electric Fence 会在用户分配内存区的前后分配禁止访问的虚拟内存页，如果你过多的进行动态内存分配，将会导致你的程序消耗大量的额外内存。

Electric Fence 还有一个局限是不能明确指出错误代码所在的行号。它所能做只是在检测到内存相关错误时产生段错误。想要定位错误的行号，需要借助 [GDB][14]这样的调试工具来调试启用了 Electric Fence 的程序。

最后一点，尽管 Electric Fence 能检测出大部分的缓冲区溢出，有一个例外是，如果所申请的缓冲区大小不是系统字长的倍数，这时候溢出（即使只有几个字节）就不能被检测出来。

#### 总结 ####

尽管局限性较大， Electric Fence 的易用性仍然是加分项。只要链接一次程序， Electric Fence 就可以在监测出内存相关问题的时候报警。不过，如同前面所说， Electric Fence 需要配合像 GDB 这样的源码调试器使用。

### [Memcheck][16] ###

**开发者**：[Valgrind 开发团队][17]

**评估版本**：3.10.1

**支持的 Linux 发行版**：所有种类

**许可**：GPL

[Valgrind][18] 是一个提供好几款调试和分析 Linux 程序性能的工具的套件。虽然 Valgrind 能和不同语言——Java 、 Perl 、 Python 、 Assembly code 、 ortran 、 Ada 等——编写的程序一起工作，但是它主要还是针对使用 C/C++ 所编写的程序。

Memcheck ，一款内存错误检测器，是其中最受欢迎的工具。它能够检测出如内存泄漏、无效的内存访问、未定义变量的使用以及堆内存分配和释放相关的问题等诸多问题。

#### 更新内容 ####

[工具套件( 3.10.1 )][19]主要修复了 3.10.0 版本发现的 bug 。除此之外，“从主干开发版本向后移植的一些补丁，修复了缺失的 AArch64 ARMv8 指令和系统调用”。

#### 有何优点 ####

同其它所有 Valgrind 工具一样， Memcheck 也是命令行程序。它的操作非常简单：通常我们会使用诸如 `prog arg1 arg2` 格式的命令来运行程序，而 Memcheck 只要求你多加几个值即可，如 `valgrind --leak-check=full prog arg1 arg2` 。

![cw memcheck output](http://images.techhive.com/images/article/2015/11/cw_memcheck-output-100627037-large.idge.png)

*Memcheck*

（注意：因为 Memcheck 是 Valgrind 的默认工具，所以在命令行执行命令时无需提及 Memcheck。但是，需要在编译程序之初带上 `-g` 参数选项，这一步会添加调试信息，使得 Memcheck 的错误信息会包含正确的行号。）

我真正倾心于 Memcheck 的是它提供了很多命令行选项（如上所述的`--leak-check`选项），如此不仅能控制工具运转还可以控制它的输出。

举个例子，可以开启`--track-origins`选项，以查看程序源码中未初始化的数据；可以开启`--show-mismatched-frees`选项让 Memcheck 匹配内存的分配和释放技术。对于 C 语言所写的代码， Memcheck 会确保只能使用`free()`函数来释放内存，`malloc()`函数来申请内存。而对 C++ 所写的源码， Memcheck 会检查是否使用了`delete`或`delete[]`操作符来释放内存，以及`new`或者`new[]`来申请内存。

Memcheck 最好的特点，尤其是对于初学者来说，是它会给用户建议使用哪个命令行选项能让输出更加有意义。比如说，如果你不使用基本的`--leak-check`选项， Memcheck 会在输出时给出建议：“使用 --leak-check=full 重新运行以查看更多泄漏内存细节”。如果程序有未初始化的变量， Memcheck 会产生信息：“使用 --track-origins=yes 以查看未初始化变量的定位”。

Memcheck 另外一个有用的特性是它可以[创建抑制文件( suppression files )][20]，由此可以略过特定的不能修正的错误，这样 Memcheck 运行时就不会每次都报警了。值得一提的是， Memcheck 会去读取默认抑制文件来忽略系统库（比如 C 库）中的报错，这些错误在系统创建之前就已经存在了。可以选择创建一个新的抑制文件，或是编辑现有的文件(通常是`/usr/lib/valgrind/default.supp`)。

Memcheck 还有高级功能，比如可以使用[定制内存分配器][22]来[检测内存错误][21]。除此之外， Memcheck 提供[监控命令][23]，当用到 Valgrind 内置的 gdbserver ，以及[客户端请求][24]机制（不仅能把程序的行为告知 Memcheck ，还可以进行查询）时可以使用。

#### 注意事项 ####

毫无疑问， Memcheck 可以节省很多调试时间以及省去很多麻烦。但是它使用了很多内存，导致程序执行变慢（[由文档可知][25]，大概会花费 20 至 30 倍时间）。

除此之外， Memcheck 还有其它局限。根据用户评论， Memcheck 很明显不是[线程安全][26]的；它不能检测出 [静态缓冲区溢出][27]；还有就是，一些 Linux 程序如 [GNU Emacs][28] 目前还不能配合 Memcheck 工作。

如果有兴趣，可以在[这里][29]查看 Valgrind 局限性的详细说明。

#### 总结 ####

无论是对于初学者还是那些需要高级特性的人来说， Memcheck 都是一款便捷的内存调试工具。如果你仅需要基本调试和错误检查， Memcheck 会非常容易上手。而当你想要使用像抑制文件或者监控指令这样的特性，就需要花一些功夫学习了。

虽然罗列了大量的局限性，但是 Valgrind（包括 Memcheck ）在它的网站上声称全球有[成千上万程序员][30]使用了此工具。开发团队称收到来自超过 30 个国家的用户反馈，而这些用户的工程代码有的高达两千五百万行。

### [Memwatch][31] ###

**开发者**：Johan Lindh

**评估版本**：2.71

**支持的 Linux 发行版**：所有种类

**许可**：GNU GPL

Memwatch 是由 Johan Lindh 开发的内存调试工具，虽然它扮演的主要角色是内存泄漏检测器，但是（根据网页介绍）它也具有检测其它如[内存重复释放和错误释放][32]、缓冲区溢出和下溢、[野指针][33]写入等等内存相关问题的能力。

Memwatch 支持用 C 语言所编写的程序。也可以在 C++ 程序中使用它，但是这种做法并不提倡（由 Memwatch 源码包随附的 Q&A 文件中可知）。

#### 更新内容 ####

这个版本添加了`ULONG_LONG_MAX`以区分 32 位和 64 位程序。

#### 有何优点 ####

跟 Dmalloc 一样， Memwatch 也有优秀的文档资料。参考 USING 文件，可以学习如何使用 Memwatch ，可以了解 Memwatch 是如何初始化、如何清理以及如何进行 I/O 操作，等等。还有一个 FAQ 文件，旨在帮助用户解决使用过程遇到的一般问题。最后还有一个`test.c`文件提供工作案例参考。

![cw memwatch output](http://images.techhive.com/images/article/2015/11/cw_memwatch_output-100627038-large.idge.png)

*Memwatch*

不同于 Mtrace ， Memwatch 产生的日志文件（通常是`memwatch.log`）是人类可阅读的格式。而且， Memwatch 每次运行时总会把内存调试结果拼接到输出该文件的末尾。如此便可在需要之时轻松查看之前的输出信息。

同样值得一提的是当你执行了启用 Memwatch 的程序， Memwatch 会在[标准输出][34]中产生一个单行输出，告知发现了错误，然后你可以在日志文件中查看输出细节。如果没有产生错误信息，就可以确保日志文件不会写入任何错误，多次运行的话确实能节省时间。

另一个我喜欢的优点是 Memwatch 还提供了在源码中获取其输出信息的方式，你可以获取信息，然后任由你进行处理（参考 Memwatch 源码中的`mwSetOutFunc()`函数获取更多有关的信息）。

#### 注意事项 ####

跟 Mtrace 和 Dmalloc 一样， Memwatch 也需要你往你的源文件里增加代码：你需要把`memwatch.h`这个头文件包含进你的代码。而且，编译程序的时候，你需要连同`memwatch.c`一块编译；或者你可以把已经编译好的目标模块包含起来，然后在命令行定义`MEMWATCH`和`MW_STDIO`变量。不用说，想要在输出中定位行号， -g 编译器选项也少不了。

此外， Memwatch 缺少一些特性。比如 Memwatch 不能检测出对一块已经被释放的内存进行写入操作，或是在分配的内存块之外的进行读取操作。而且， Memwatch 也不是线程安全的。还有一点，正如我在开始时指出，在 C++ 程序上运行 Memwatch 的结果是不能预料的。

#### 总结 ####

Memcheck 可以检测很多内存相关的问题，在处理 C 程序时是非常便捷的调试工具。因为源码小巧，所以可以从中了解 Memcheck 如何运转，有需要的话可以调试它，甚至可以根据自身需求扩展升级它的功能。

### [Mtrace][35] ###

**开发者**: Roland McGrath 和 Ulrich Drepper

**评估版本**: 2.21

**支持的 Linux 发行版**：所有种类

**许可**：GNU GPL

Mtrace 是 [GNU C 库][36]中的一款内存调试工具，同时支持 Linux 上的 C 和 C++ 程序，可以检测由函数`malloc()`和`free()`不匹配的调用所引起的内存泄漏问题。

![cw mtrace output](http://images.techhive.com/images/article/2015/11/cw_mtrace-output-100627039-large.idge.png)

*Mtrace*

Mtrace 实际上是实现了一个名为`mtrace()`的函数，它可以跟踪程序中所有 malloc/free 调用，并在用户指定的文件中记录相关信息。文件以一种机器可读的格式记录数据，所以有一个 Perl 脚本——同样命名为 mtrace ——用来把文件转换并为人类可读格式。

#### 更新内容 ####

[Mtrace 源码][37]和 [Perl 文件][38]同 GNU C 库( 2.21 版本)一起释出，除了更新版权日期，其它别无改动。

#### 有何优点 ####

Mtrace 最好的地方是它非常简单易学。你只需要了解在你的源码中如何以及何处添加 mtrace() 及对应的 muntrace() 函数，还有如何使用 Mtrace 的 Perl 脚本。后者非常简单，只需要运行指令`mtrace <program-executable> <log-file-generated-upon-program-execution>`（例子见开头截图最后一条指令）。

Mtrace 另外一个优点是它的可伸缩性，这体现在不仅可以使用它来调试完整的程序，还可以使用它来检测程序中独立模块的内存泄漏。只需在每个模块里调用`mtrace()`和`muntrace()`即可。

最后一点，因为 Mtrace 会在`mtrace()`——在源码中添加的函数——执行时被触发，因此可以很灵活地[使用信号][39]动态地（在程序执行时）使能 Mtrace 。

#### 注意事项 ####

因为`mtrace()`和`mauntrace()`函数 —— 声明在`mcheck.h`文件中，所以必须在源码中包含此头文件 —— 的调用是 Mtrace 工作的基础（`mauntrace()`函数并非[总是必要][40]），因此 Mtrace 要求程序员至少改动源码一次。

需要注意的是，在编译程序的时候带上 -g 选项（ [GCC][41] 和 [G++][42] 编译器均有提供），才能使调试工具在输出结果时展示正确的行号。除此之外，有些程序（取决于源码体积有多大）可能会花很长时间进行编译。最后，带 -g 选项编译会增加了可执行文件的大小（因为提供了额外的调试信息），因此记得程序需要在测试结束后，不带 -g 选项重新进行编译。

使用 Mtrace ，你需要掌握 Linux 环境变量的基本知识，因为在程序执行之前，需要把用户把环境变量`MALLOC_TRACE`的值设为指定的文件（`mtrace()`函数将会记录全部信息到其中）路径。

Mtrace 在检测内存泄漏和试图释放未经过分配的内存方面存在局限。它不能检测其它内存相关问题如非法内存访问、使用未初始化内存。而且，[有人抱怨][43] Mtrace 不是[线程安全][44]的。

### 总结 ###

不言自明，我在此讨论的每款内存调试器都有其优点和局限。所以，哪一款适合你取决于你所需要的特性，虽然有时候容易安装和使用也是一个决定因素。

要想捕获软件程序中的内存泄漏， Mtrace 最适合不过了。它还可以节省时间。由于 Linux 系统已经预装了此工具，对于不能联网或者不可以下载第三方调试调试工具的情况， Mtrace 也是极有助益的。

另一方面，相比 Mtrace ， Dmalloc 不仅能检测更多错误类型，还提供更多特性，比如运行时可配置、 GDB 集成。而且， Dmalloc 不像这里所说的其它工具，它是线程安全的。更不用说它的详细资料了，这让 Dmalloc 成为初学者的理想选择。

虽然 Memwatch 的资料比 Dmalloc 的更加丰富，而且还能检测更多的错误种类，但是你只能在 C 语言写就的程序中使用它。一个让 Memwatch 脱颖而出的特性是它允许在你的程序源码中处理它的输出，这对于想要定制输出格式来说是非常有用的。

如果改动程序源码非你所愿，那么使用 Electric Fence 吧。不过，请记住， Electric Fence 只能检测两种错误类型，而此二者均非内存泄漏。还有就是，需要基本了解 GDB 以最大化发挥这款内存调试工具的作用。

Memcheck 可能是其中综合性最好的了。相比这里提及的其它工具，它能检测更多的错误类型，提供更多的特性，而且不需要你的源码做任何改动。但请注意，基本功能并不难上手，但是想要使用它的高级特性，就必须学习相关的专业知识了。

--------------------------------------------------------------------------------

via: http://www.computerworld.com/article/3003957/linux/review-5-memory-debuggers-for-linux-coding.html

作者：[Himanshu Arora][a]
译者：[soooogreen](https://github.com/soooogreen)
校对：[PurlingNayuki](https://github.com/PurlingNayuki),[ezio](https://github.com/oska874)

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
