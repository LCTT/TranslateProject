为什么 Python 这么慢？
==========

Python 现在越来越火，已经迅速扩张到包括 DevOps、数据科学、Web 开发、信息安全等各个领域当中。

然而，相比起 Python 扩张的速度，Python 代码的运行速度就显得有点逊色了。

![](https://cdn-images-1.medium.com/max/1200/0*M2qZQsVnDS-4i5zc.jpg)

> 在代码运行速度方面，Java、C、C++、C# 和 Python 要如何进行比较呢？并没有一个放之四海而皆准的标准，因为具体结果很大程度上取决于运行的程序类型，而<ruby>语言基准测试<rt>Computer Language Benchmarks Games</rt></ruby>可以作为[衡量的一个方面][5]。

根据我这些年来进行语言基准测试的经验来看，Python 比很多语言运行起来都要慢。无论是使用 [JIT][7] 编译器的 C＃、Java，还是使用 [AOT][8] 编译器的 C、C++，又或者是 JavaScript 这些解释型语言，Python 都[比它们运行得慢][6]。

注意：对于文中的 “Python” ，一般指 CPython 这个官方的实现。当然我也会在本文中提到其它语言的 Python 实现。

> 我要回答的是这个问题：对于一个类似的程序，Python 要比其它语言慢 2 到 10 倍不等，这其中的原因是什么？又有没有改善的方法呢？

主流的说法有这些：

*   “是<ruby>全局解释器锁<rt>Global Interpreter Lock</rt></ruby>（GIL）的原因”
*   “是因为 Python 是解释型语言而不是编译型语言”
*   “是因为 Python 是一种动态类型的语言”

哪一个才是是影响 Python 运行效率的主要原因呢？

### 是全局解释器锁的原因吗？

现在很多计算机都配备了具有多个核的 CPU ，有时甚至还会有多个处理器。为了更充分利用它们的处理能力，操作系统定义了一个称为线程的低级结构。某一个进程（例如 Chrome 浏览器）可以建立多个线程，在系统内执行不同的操作。在这种情况下，CPU 密集型进程就可以跨核心分担负载了，这样的做法可以大大提高应用程序的运行效率。

例如在我写这篇文章时，我的 Chrome 浏览器打开了 44 个线程。需要提及的是，基于 POSIX 的操作系统（例如 Mac OS、Linux）和 Windows 操作系统的线程结构、API 都是不同的，因此操作系统还负责对各个线程的调度。

如果你还没有写过多线程执行的代码，你就需要了解一下线程锁的概念了。多线程进程比单线程进程更为复杂，是因为需要使用线程锁来确保同一个内存地址中的数据不会被多个线程同时访问或更改。

CPython 解释器在创建变量时，首先会分配内存，然后对该变量的引用进行计数，这称为<ruby>引用计数<rt>reference counting</rt></ruby>。如果变量的引用数变为 0，这个变量就会从内存中释放掉。这就是在 for 循环代码块内创建临时变量不会增加内存消耗的原因。

而当多个线程内共享一个变量时，CPython 锁定引用计数的关键就在于使用了 GIL，它会谨慎地控制线程的执行情况，无论同时存在多少个线程，解释器每次只允许一个线程进行操作。

#### 这会对 Python 程序的性能有什么影响？

如果你的程序只有单线程、单进程，代码的速度和性能不会受到全局解释器锁的影响。

但如果你通过在单进程中使用多线程实现并发，并且是 IO 密集型（例如网络 IO 或磁盘 IO）的线程，GIL 竞争的效果就很明显了。

![](https://cdn-images-1.medium.com/max/1600/0*S_iSksY5oM5H1Qf_.png)

*由 David Beazley 提供的 GIL 竞争情况图[http://dabeaz.blogspot.com/2010/01/python-gil-visualized.html][1]*

对于一个 web 应用（例如 Django），同时还使用了 WSGI，那么对这个 web 应用的每一个请求都运行一个**单独**的 Python 解释器，而且每个请求只有一个锁。同时因为 Python 解释器的启动比较慢，某些 WSGI 实现还具有“守护进程模式”，[可以使 Python 进程一直就绪][9]。

#### 其它的 Python 解释器表现如何？

[PyPy 也是一种带有 GIL 的解释器][10]，但通常比 CPython 要快 3 倍以上。

[Jython 则是一种没有 GIL 的解释器][11]，这是因为 Jython 中的 Python 线程使用 Java 线程来实现，并且由 JVM 内存管理系统来进行管理。

#### JavaScript 在这方面又是怎样做的呢？

所有的 Javascript 引擎使用的都是 [mark-and-sweep 垃圾收集算法][12]，而 GIL 使用的则是 CPython 的内存管理算法。

JavaScript 没有 GIL，而且它是单线程的，也不需要用到 GIL， JavaScript 的事件循环和 Promise/Callback 模式实现了以异步编程的方式代替并发。在 Python 当中也有一个类似的 asyncio 事件循环。

### 是因为 Python 是解释型语言吗？

我经常会听到这个说法，但是这过于粗陋地简化了 Python 所实际做的工作了。其实当终端上执行 `python myscript.py` 之后，CPython 会对代码进行一系列的读取、语法分析、解析、编译、解释和执行的操作。

如果你对这一系列过程感兴趣，也可以阅读一下我之前的文章：[在 6 分钟内修改 Python 语言][13] 。 

`.pyc` 文件的创建是这个过程的重点。在代码编译阶段，Python 3 会将字节码序列写入 `__pycache__/` 下的文件中，而 Python 2 则会将字节码序列写入当前目录的 `.pyc` 文件中。对于你编写的脚本、导入的所有代码以及第三方模块都是如此。

因此，绝大多数情况下（除非你的代码是一次性的……），Python 都会解释字节码并本地执行。与 Java、C#.NET 相比：

> Java 代码会被编译为“中间语言”，由 Java 虚拟机读取字节码，并将其即时编译为机器码。.NET CIL 也是如此，.NET CLR（Common-Language-Runtime）将字节码即时编译为机器码。

既然 Python 像 Java 和 C# 那样都使用虚拟机或某种字节码，为什么 Python 在基准测试中仍然比 Java 和 C# 慢得多呢？首要原因是，.NET 和 Java 都是 JIT 编译的。

<ruby>即时<rt>Just-in-time</rt></ruby>（JIT）编译需要一种中间语言，以便将代码拆分为多个块（或多个帧）。而<ruby>提前<rt>ahead of time</rt></ruby>（AOT）编译器则需要确保 CPU 在任何交互发生之前理解每一行代码。

JIT 本身不会使执行速度加快，因为它执行的仍然是同样的字节码序列。但是 JIT 会允许在运行时进行优化。一个优秀的 JIT 优化器会分析出程序的哪些部分会被多次执行，这就是程序中的“热点”，然后优化器会将这些代码替换为更有效率的版本以实现优化。

这就意味着如果你的程序是多次重复相同的操作时，有可能会被优化器优化得更快。而且，Java 和 C# 是强类型语言，因此优化器对代码的判断可以更为准确。

PyPy 使用了明显快于 CPython 的 JIT。更详细的结果可以在这篇性能基准测试文章中看到：[哪一个 Python 版本最快?][15]。

#### 那为什么 CPython 不使用 JIT 呢？

JIT 也不是完美的，它的一个显著缺点就在于启动时间。 CPython 的启动时间已经相对比较慢，而 PyPy 比 CPython 启动还要慢 2 到 3 倍。Java 虚拟机启动速度也是出了名的慢。.NET CLR 则通过在系统启动时启动来优化体验，而 CLR 的开发者也是在 CLR 上开发该操作系统。

因此如果你有个长时间运行的单一 Python 进程，JIT 就比较有意义了，因为代码里有“热点”可以优化。

不过，CPython 是个通用的实现。设想如果使用 Python 开发命令行程序，但每次调用 CLI 时都必须等待 JIT 缓慢启动，这种体验就相当不好了。

CPython 试图用于各种使用情况。有可能实现[将 JIT 插入到 CPython 中][17]，但这个改进工作的进度基本处于停滞不前的状态。

> 如果你想充分发挥 JIT 的优势，请使用 PyPy。

### 是因为 Python 是一种动态类型的语言吗？

在 C、C++、Java、C#、Go 这些静态类型语言中，必须在声明变量时指定变量的类型。而在动态类型语言中，虽然也有类型的概念，但变量的类型是可改变的。

```
a = 1
a = "foo"
```

在上面这个示例里，Python 将变量 `a` 一开始存储整数类型变量的内存空间释放了，并创建了一个新的存储字符串类型的内存空间，并且和原来的变量同名。

静态类型语言这样的设计并不是为了为难你，而是为了方便 CPU 运行而这样设计的。因为最终都需要将所有操作都对应为简单的二进制操作，因此必须将对象、类型这些高级的数据结构转换为低级数据结构。

Python 也实现了这样的转换，但用户看不到这些转换，也不需要关心这些转换。

不用必须声明类型并不是为了使 Python 运行慢，Python 的设计是让用户可以让各种东西变得动态：可以在运行时更改对象上的方法，也可以在运行时动态添加底层系统调用到值的声明上，几乎可以做到任何事。

但也正是这种设计使得 Python 的优化异常的难。

为了证明我的观点，我使用了一个 Mac OS 上的系统调用跟踪工具  DTrace。CPython 发布版本中没有内置 DTrace，因此必须重新对 CPython 进行编译。以下以 Python 3.6.6 为例：

```
wget https://github.com/python/cpython/archive/v3.6.6.zip
unzip v3.6.6.zip
cd v3.6.6
./configure --with-dtrace
make
```

这样 `python.exe` 将使用 DTrace 追踪所有代码。[Paul Ross 也作过关于 DTrace 的闪电演讲][19]。你可以下载 Python 的 DTrace 启动文件来查看函数调用、执行时间、CPU 时间、系统调用，以及各种其它的内容。

```
sudo dtrace -s toolkit/<tracer>.d -c ‘../cpython/python.exe script.py’
```

`py_callflow` 追踪器[显示](https://cdn-images-1.medium.com/max/1600/1*Lz4UdUi4EwknJ0IcpSJ52g.gif)了程序里调用的所有函数。

那么，Python 的动态类型会让它变慢吗？

* 类型比较和类型转换消耗的资源是比较多的，每次读取、写入或引用变量时都会检查变量的类型
* Python 的动态程度让它难以被优化，因此很多 Python 的替代品能够如此快都是为了提升速度而在灵活性方面作出了妥协
* 而 [Cython][2] 结合了 C 的静态类型和 Python 来优化已知类型的代码，它[可以将][3]性能提升 **84 倍**。

### 总结

> 由于 Python 是一种动态、多功能的语言，因此运行起来会相对缓慢。对于不同的实际需求，可以使用各种不同的优化或替代方案。

例如可以使用异步，引入分析工具或使用多种解释器来优化 Python 程序。

对于不要求启动时间且代码可以充分利用 JIT 的程序，可以考虑使用 PyPy。

而对于看重性能并且静态类型变量较多的程序，不妨使用 [Cython][4]。

#### 延伸阅读

Jake VDP 的优秀文章（略微过时） [https://jakevdp.github.io/blog/2014/05/09/why-python-is-slow/][21]

Dave Beazley 关于 GIL 的演讲 [http://www.dabeaz.com/python/GIL.pdf][22]

JIT 编译器的那些事 [https://hacks.mozilla.org/2017/02/a-crash-course-in-just-in-time-jit-compilers/][23]

--------------------------------------------------------------------------------

via: https://hackernoon.com/why-is-python-so-slow-e5074b6fe55b

作者：[Anthony Shaw][a]
选题：[oska874][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://hackernoon.com/@anthonypjshaw?source=post_header_lockup
[b]:https://github.com/oska874
[1]:http://dabeaz.blogspot.com/2010/01/python-gil-visualized.html
[2]:http://cython.org/
[3]:http://notes-on-cython.readthedocs.io/en/latest/std_dev.html
[4]:http://cython.org/
[5]:http://algs4.cs.princeton.edu/faq/
[6]:https://benchmarksgame-team.pages.debian.net/benchmarksgame/faster/python.html
[7]:https://en.wikipedia.org/wiki/Just-in-time_compilation
[8]:https://en.wikipedia.org/wiki/Ahead-of-time_compilation
[9]:https://www.slideshare.net/GrahamDumpleton/secrets-of-a-wsgi-master
[10]:http://doc.pypy.org/en/latest/faq.html#does-pypy-have-a-gil-why
[11]:http://www.jython.org/jythonbook/en/1.0/Concurrency.html#no-global-interpreter-lock
[12]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Memory_Management
[13]:https://hackernoon.com/modifying-the-python-language-in-7-minutes-b94b0a99ce14
[14]:https://hackernoon.com/modifying-the-python-language-in-7-minutes-b94b0a99ce14
[15]:https://hackernoon.com/which-is-the-fastest-version-of-python-2ae7c61a6b2b
[16]:https://hackernoon.com/which-is-the-fastest-version-of-python-2ae7c61a6b2b
[17]:https://www.slideshare.net/AnthonyShaw5/pyjion-a-jit-extension-system-for-cpython
[18]:https://github.com/python/cpython/archive/v3.6.6.zip
[19]:https://github.com/paulross/dtrace-py#the-lightning-talk
[20]:https://github.com/paulross/dtrace-py/tree/master/toolkit
[21]:https://jakevdp.github.io/blog/2014/05/09/why-python-is-slow/
[22]:http://www.dabeaz.com/python/GIL.pdf
[23]:https://hacks.mozilla.org/2017/02/a-crash-course-in-just-in-time-jit-compilers/

