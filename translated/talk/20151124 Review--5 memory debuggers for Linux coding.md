点评：Linux编程中五款内存调试器
================================================================================
![](http://images.techhive.com/images/article/2015/11/penguinadmin-2400px-100627186-primary.idge.jpg)
Credit: [Moini][1]

作为一个程序员，我知道我总在犯错误——事实是，怎么可能会不犯错的！程序员也是人啊。有的错误能在编码过程中及时发现，而有些却得等到软件测试才显露出来。然而，有一类错误并不能在这两个时期被排除，从而导致软件不能正常运行，甚至是提前中止。

想到了吗？我说的就是内存相关的错误。手动调试这些错误不仅耗时，而且很难发现并纠正。值得一提的是，这种错误非常地常见，特别是在一些软件里，这些软件是用C/C++这类允许[手动管理内存][2]的语言编写的。

幸运的是，现行有一些编程工具能够帮你找到软件程序中这些内存相关的错误。在这些工具集中，我评定了五款Linux可用的，流行、免费并且开源的内存调试器：Dmalloc、Electric Fence、 Memcheck、 Memwatch以及Mtrace。日常编码过程中我已经把这五个调试器用了个遍，所以这些点评是建立在我的实际体验之上的。

### [Dmalloc][3] ###

**开发者**：Gray Watson

**点评版本**：5.5.2

**Linux支持**：所有种类

**许可**：知识共享署名-相同方式共享许可证3.0

Dmalloc是Gray Watson开发的一款内存调试工具。它实现成库，封装了标准内存管理函数如**malloc(), calloc(), free()**等，使得程序员得以检测出有问题的代码。

![cw dmalloc output](http://images.techhive.com/images/article/2015/11/cw_dmalloc-output-100627040-large.idge.png)
Dmalloc

如同工具的网页所列，这个调试器提供的特性包括内存泄漏跟踪、[重复释放(double free)][4]错误跟踪、以及[越界写入(fence-post write)][5]检测。其它特性包括文件/行号报告、普通统计记录。

#### 更新内容 ####

5.5.2版本是一个[bug修复发行版][6]，同时修复了构建和安装的问题。

#### 有何优点 ####

Dmalloc最大的优点是可以进行任意配置。比如说，你可以配置以支持C++程序和多线程应用。Dmalloc还提供一个有用的功能：运行时可配置，这表示在Dmalloc执行时，可以轻易地使能或者禁能它提供的特性。

你还可以配合[GNU Project Debugger (GDB)][7]来使用Dmalloc，只需要将dmalloc.gdb文件（位于Dmalloc源码包中的contrib子目录里）的内容添加到你的主目录中的.gdbinit文件里即可。

另外一个优点让我对Dmalloc爱不释手的是它有大量的资料文献。前往官网的[Documentation标签][8]，可以获取任何内容，有关于如何下载、安装、运行，怎样使用库，和Dmalloc所提供特性的细节描述，及其输入文件的解释。里面还有一个章节介绍了一般问题的解决方法。

#### 注意事项 ####

跟Mtrace一样，Dmalloc需要程序员改动他们的源代码。比如说你可以（必须的）添加头文件**dmalloc.h**，工具就能汇报产生问题的调用的文件或行号。这个功能非常有用，因为它节省了调试的时间。

除此之外，还需要在编译你的程序时，把Dmalloc库（编译源码包时产生的）链接进去。

然而，还有点更麻烦的事，需要设置一个环境变量，命名为**DMALLOC_OPTION**，以供工具在运行时配置内存调试特性，以及输出文件的路径。可以手动为该环境变量分配一个值，不过初学者可能会觉得这个过程有点困难，因为你想使能的Dmalloc特性是存在于这个值之中的——表示为各自的十六进制值的累加。[这里][9]有详细介绍。

一个比较简单方法设置这个环境变量是使用[Dmalloc实用指令][10]，这是专为这个目的设计的方法。

#### 总结 ####

Dmalloc真正的优势在于它的可配置选项。而且高度可移植，曾经成功移植到多种操作系统如AIX、BSD/OS、DG/UX、Free/Net/OpenBSD、GNU/Hurd、HPUX、Irix、Linux、MS-DOG、NeXT、OSF、SCO、Solaris、SunOS、Ultrix、Unixware甚至Unicos（运行在Cray T3E主机上）。虽然Dmalloc有很多东西需要学习，但是它所提供的特性值得为之付出。

### [Electric Fence][15] ###

**开发者**：Bruce Perens

**点评版本**：2.2.3

**Linux支持**：所有种类

**许可**：GNU 通用公共许可证 (第二版)

Electric Fence是Bruce Perens开发的一款内存调试工具，它以库的形式实现，你的程序需要链接它。Electric Fence能检测出[栈][11]内存溢出和访问已经释放的内存。

![cw electric fence output](http://images.techhive.com/images/article/2015/11/cw_electric-fence-output-100627041-large.idge.png)
Electric Fence

顾名思义，Electric Fence在每个申请的缓存边界建立了fence（防护），任何非法内存访问都会导致[段错误][12]。这个调试工具同时支持C和C++编程。


#### 更新内容 ####

2.2.3版本修复了工具的构建系统，使得-fno-builtin-malloc选项能真正传给[GNU Compiler Collection (GCC)][13]。

#### 有何优点 ####

我喜欢Electric Fence首要的一点是（Memwatch、Dmalloc和Mtrace所不具有的），这个调试工具不需要你的源码做任何的改动，你只需要在编译的时候把它的库链接进你的程序即可。

其次，Electric Fence实现一个方法，确认导致越界访问(a bounds violation)的第一个指令就是引起段错误的原因。这比在后面再发现问题要好多了。

不管是否有检测出错误，Electric Fence经常会在输出产生版权信息。这一点非常有用，由此可以确定你所运行的程序已经启用了Electric Fence。

#### 注意事项 ####

另一方面，我对Electric Fence真正念念不忘的是它检测内存泄漏的能力。内存泄漏是C/C++软件最常见也是最难隐秘的问题之一。不过，Electric Fence不能检测出堆内存溢出，而且也不是线程安全的。

基于Electric Fence会在用户分配内存区的前后分配禁止访问的虚拟内存页，如果你过多的进行动态内存分配，将会导致你的程序消耗大量的额外内存。

Electric Fence还有一个局限是不能明确指出错误代码所在的行号。它所能做只是在监测到内存相关错误时产生段错误。想要定位行号，需要借助[The Gnu Project Debugger (GDB)][14]这样的调试工具来调试你启用了Electric Fence的程序。

最后一点，Electric Fence虽然能检测出大部分的缓冲区溢出，有一个例外是，如果所申请的缓冲区大小不是系统字长的倍数，这时候溢出（即使只有几个字节）就不能被检测出来。

#### 总结 ####

尽管有那么多的局限，但是Electric Fence的优点却在于它的易用性。程序只要链接工具一次，Electric Fence就可以在监测出内存相关问题的时候报警。不过，如同前面所说，Electric Fence需要配合像GDB这样的源码调试器使用。


### [Memcheck][16] ###

**开发者**：[Valgrind开发团队][17]

**点评版本**：3.10.1

**Linux支持**：所有种类

**许可**：通用公共许可证

[Valgrind][18]是一个提供好几款调试和Linux程序性能分析工具的套件。虽然Valgrind和编写语言各不相同（有Java、Perl、Python、Assembly code、ortran、Ada等等）的程序配合工作，但是它所提供的工具大部分都意在支持C/C++所编写的程序。

Memcheck作为内存错误检测器，是一款最受欢迎的Memcheck工具。它能够检测出诸多问题诸如内存泄漏、无效的内存访问、未定义变量的使用以及栈内存分配和释放相关的问题等。

#### 更新内容 ####

工具套件(3.10.1)的[发行版][19]是一个副版本，主要修复了3.10.0版本发现的bug。除此之外，从主版本backport一些包，修复了缺失的AArch64 ARMv8指令和系统调用。

####  有何优点 ####

同其它所有Valgrind工具一样，Memcheck也是基本的命令行实用程序。它的操作非常简单：通常我们会使用诸如prog arg1 arg2格式的命令来运行程序，而Memcheck只要求你多加几个值即可，就像valgrind --leak-check=full prog arg1 arg2。

![cw memcheck output](http://images.techhive.com/images/article/2015/11/cw_memcheck-output-100627037-large.idge.png)
Memcheck

（注意：因为Memcheck是Valgrind的默认工具所以无需提及Memcheck。但是，需要在编译程序之初带上-g参数选项，这一步会添加调试信息，使得Memcheck的错误信息会包含正确的行号。）

我真正倾心于Memcheck的是它提供了很多命令行选项（如上所述的--leak-check选项），如此不仅能控制工具运转还可以控制它的输出。

举个例子，可以开启--track-origins选项，以查看程序源码中未初始化的数据。可以开启--show-mismatched-frees选项让Memcheck匹配内存的分配和释放技术。对于C语言所写的代码，Memcheck会确保只能使用free()函数来释放内存，malloc()函数来申请内存。而对C++所写的源码，Memcheck会检查是否使用了delete或delete[]操作符来释放内存，以及new或者new[]来申请内存。

Memcheck最好的特点，尤其是对于初学者来说的，是它会给用户建议使用那个命令行选项能让输出更加有意义。比如说，如果你不使用基本的--leak-check选项，Memcheck会在输出时建议“使用--leak-check=full重新运行，查看更多泄漏内存细节”。如果程序有未初始化的变量，Memcheck会产生信息“使用--track-origins=yes，查看未初始化变量的定位”。

Memcheck另外一个有用的特性是它可以[创建抑制文件(suppression files)][20]，由此可以忽略特定不能修正的错误，这样Memcheck运行时就不会每次都报警了。值得一提的是，Memcheck会去读取默认抑制文件来忽略系统库（比如C库）中的报错，这些错误在系统创建之前就已经存在了。可以选择创建一个新的抑制文件，或是编辑现有的(通常是/usr/lib/valgrind/default.supp)。

Memcheck还有高级功能，比如可以使用[定制内存分配器][22]来[检测内存错误][21]。除此之外，Memcheck提供[监控命令][23]，当用到Valgrind的内置gdbserver，以及[客户端请求][24]机制（不仅能把程序的行为告知Memcheck，还可以进行查询）时可以使用。

#### 注意事项 ####

毫无疑问，Memcheck可以节省很多调试时间以及省去很多麻烦。但是它使用了很多内存，导致程序执行变慢（[由资料可知][25]，大概花上20至30倍时间）。

除此之外，Memcheck还有其它局限。根据用户评论，Memcheck明显不是[线程安全][26]的；它不能检测出 [静态缓冲区溢出][27]；还有就是，一些Linux程序如[GNU Emacs][28]，目前还不能使用Memcheck。

如果有兴趣，可以在[这里][29]查看Valgrind详尽的局限性说明。

#### 总结 ####

无论是对于初学者还是那些需要高级特性的人来说，Memcheck都是一款便捷的内存调试工具。如果你仅需要基本调试和错误核查，Memcheck会非常容易上手。而当你想要使用像抑制文件或者监控指令这样的特性，就需要花一些功夫学习了。

虽然罗列了大量的局限性，但是Valgrind（包括Memcheck）在它的网站上声称全球有[成千上万程序员][30]使用了此工具。开发团队称收到来自超过30个国家的用户反馈，而这些用户的工程代码有的高达2.5千万行。

### [Memwatch][31] ###

**开发者**：Johan Lindh

**点评版本**：2.71

**Linux支持**：所有种类

**许可**：GNU通用公共许可证
 
Memwatch是由Johan Lindh开发的内存调试工具，虽然它主要扮演内存泄漏检测器的角色，但是它也具有检测其它如[重复释放跟踪和内存错误释放][32]、缓冲区溢出和下溢、[野指针][33]写入等等内存相关问题的能力（根据网页介绍所知）。

Memwatch支持用C语言所编写的程序。可以在C++程序中使用它，但是这种做法并不提倡（由Memwatch源码包随附的Q&A文件中可知）。

#### 更新内容 ####

这个版本添加了ULONG_LONG_MAX以区分32位和64位程序。

#### 有何优点 ####

跟Dmalloc一样，Memwatch也有优秀的文献资料。参考USING文件，可以学习如何使用Memwatch，可以了解Memwatch是如何初始化、如何清理以及如何进行I/O操作的，等等不一而足。还有一个FAQ文件，旨在帮助用户解决使用过程遇到的一般问题。最后还有一个test.c文件提供工作案例参考。

![cw memwatch output](http://images.techhive.com/images/article/2015/11/cw_memwatch_output-100627038-large.idge.png)
Memwatch

不同于Mtrace，Memwatch的输出产生的日志文件（通常是memwatch.log）是人类可阅读格式。而且，Memwatch每次运行时总会拼接内存调试输出到此文件末尾，而不是进行覆盖（译改）。如此便可在需要之时，轻松查看之前的输出信息。

同样值得一提的是当你执行了启用Memwatch的程序，Memwatch会在[标准输出][34]中产生一个单行输出，告知发现了错误，然后你可以在日志文件中查看输出细节。如果没有产生错误信息，就可以确保日志文件不会写入任何错误，多次运行的话能实际节省时间。

另一个我喜欢的优点是Memwatch同样在源码中提供一个方法，你可以据此获取Memwatch的输出信息，然后任由你进行处理（参考Memwatch源码中的mwSetOutFunc()函数获取更多有关的信息）。

#### 注意事项 ####

跟Mtrace和Dmalloc一样，Memwatch也需要你往你的源文件里增加代码：你需要把memwatch.h这个头文件包含进你的代码。而且，编译程序的时候，你需要连同memwatch.c一块编译；或者你可以把已经编译好的目标模块包含起来，然后在命令行定义MEMWATCH和MW_STDIO变量。不用说，想要在输出中定位行号，-g编译器选项也少不了。

还有一些没有具备的特性。比如Memwatch不能检测出往一块已经被释放的内存写入操作，或是在分配的内存块之外的读取操作。而且，Memwatch也不是线程安全的。还有一点，正如我在开始时指出，在C++程序上运行Memwatch的结果是不能预料的。

#### 总结 ####

Memcheck可以检测很多内存相关的问题，在处理C程序时是非常便捷的调试工具。因为源码小巧，所以可以从中了解Memcheck如何运转，有需要的话可以调试它，甚至可以根据自身需求扩展升级它的功能。

### [Mtrace][35] ###

**开发者**: Roland McGrath and Ulrich Drepper

**点评版本**: 2.21

**Linux支持**：所有种类

**许可**：GNU通用公共许可证

Mtrace是[GNU C库][36]中的一款内存调试工具，同时支持Linux C和C++程序，检测由malloc()和free()函数的不对等调用所引起的内存泄漏问题。

![cw mtrace output](http://images.techhive.com/images/article/2015/11/cw_mtrace-output-100627039-large.idge.png)
Mtrace

Mtrace实现为对mtrace()函数的调用，跟踪程序中所有malloc/free调用，在用户指定的文件中记录相关信息。文件以一种机器可读的格式记录数据，所以有一个Perl脚本（同样命名为mtrace）用来把文件转换并展示为人类可读格式。

#### 更新内容 ####

[Mtrace源码][37]和[Perl文件][38]同GNU C库(2.21版本)一起释出，除了更新版权日期，其它别无改动。

#### 有何优点 ####

Mtrace最优秀的特点是非常简单易学。你只需要了解在你的源码中如何以及何处添加mtrace()及其对立的muntrace()函数，还有如何使用Mtrace的Perl脚本。后者非常简单，只需要运行指令mtrace <program-executable> <log-file-generated-upon-program-execution>（例子见开头截图最后一条指令）。

Mtrace另外一个优点是它的可收缩性，体现在，不仅可以使用它来调试完整的程序，还可以使用它来检测程序中独立模块的内存泄漏。只需在每个模块里调用mtrace()和muntrace()即可。

最后一点，因为Mtrace会在mtace()（在源码中添加的函数）执行时被触发，因此可以很灵活地[使用信号][39]动态地（在程序执行周期内）使能Mtrace。

#### 注意事项 ####

因为mtrace()和mauntrace()函数（在mcheck.h文件中声明，所以必须在源码中包含此头文件）的调用是Mtrace运行（mauntrace()函数并非[总是必要][40]）的根本，因此Mtrace要求程序员至少改动源码一次。

了解需要在编译程序的时候带上-g选项（[GCC][41]和[G++][42]编译器均由提供），才能使调试工具在输出展示正确的行号。除此之外，有些程序（取决于源码体积有多大）可能会花很长时间进行编译。最后，带-g选项编译会增加了可执行文件的内存（因为提供了额外的调试信息），因此记得程序需要在测试结束，不带-g选项重新进行编译。

使用Mtrace，你需要掌握Linux环境变量的基本知识，因为在程序执行之前，需要把用户指定文件（mtrace()函数用以记载全部信息）的路径设置为环境变量MALLOC_TRACE的值。

Mtrace在检测内存泄漏和尝试释放未经过分配的内存方面存在局限。它不能检测其它内存相关问题如非法内存访问、使用未初始化内存。而且，[有人抱怨][43]Mtrace不是[线程安全][44]的。

### 总结 ###

不言自明，我在此讨论的每款内存调试器都有其优点和局限。所以，哪一款适合你取决于你所需要的特性，虽然有时候容易安装和使用也是一个决定因素。

要想捕获软件程序中的内存泄漏，Mtrace最适合不过了。它还可以节省时间。由于Linux系统已经预装了此工具，对于不能联网或者不可以下载第三方调试调试工具的情况，Mtrace也是极有助益的。

另一方面，相比Mtrace,，Dmalloc不仅能检测更多错误类型，还你呢个提供更多特性，比如运行时可配置、GDB集成。而且，Dmalloc不像这里所说的其它工具，它是线程安全的。更不用说它的详细资料了，这让Dmalloc成为初学者的理想选择。

虽然Memwatch的资料比Dmalloc的更加丰富，而且还能检测更多的错误种类，但是你只能在C语言写就的软件程序上使用它。一个让Memwatch脱颖而出的特性是它允许在你的程序源码中处理它的输出，这对于想要定制输出格式来说是非常有用的。

如果改动程序源码非你所愿，那么使用Electric Fence吧。不过，请记住，Electric Fence只能检测两种错误类型，而此二者均非内存泄漏。还有就是，需要了解GDB基础以最大程序发挥这款内存调试工具的作用。

Memcheck可能是这当中综合性最好的了。相比这里所说其它工具，它检测更多的错误类型，提供更多的特性，而且不需要你的源码做任何改动。但请注意，基本功能并不难上手，但是想要使用它的高级特性，就必须学习相关的专业知识了。

--------------------------------------------------------------------------------

via: http://www.computerworld.com/article/3003957/linux/review-5-memory-debuggers-for-linux-coding.html

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/soooogreen)
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
