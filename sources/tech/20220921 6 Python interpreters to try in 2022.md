[#]: subject: "6 Python interpreters to try in 2022"
[#]: via: "https://opensource.com/article/22/9/python-interpreters-2022"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

6 Python interpreters to try in 2022
======
It could be interesting to see how your code behaves on another interpreter than what you're used to.

![Hands on a keyboard with a Python book][1]

Image by: WOCinTech Chat. Modified by Opensource.com. CC BY-SA 4.0

Python, one of the most popular programming languages, requires an interpreter to execute the instructions defined by the Python code. In contrast to other languages, which compile directly into machine code, it’s up to the interpreter to read Python code and translate its instructions for the CPU performing the related actions. There are several interpreters out there, and in this article, I’ll take a look at a few of them.

### Primer to interpreters

When talking about the Python interpreter, it’s usually the `/usr/bin/python` binary being referred to. That lets you execute a `.py` file.
However, interpreting is just one task. Before a line of Python code is actually executed on the CPU, these four steps are involved:

1. Lexing - The human-made source code is converted into a sequence of logical entities, the so called lexical tokens.
2. Parsing - In the parser, the lexical tokens are checked in regards of syntax and grammar. The output of the parser is an abstract syntax tree (AST).
3. Compiling - Based on the AST, the compiler creates Python bytecode. The bytecode consists of very basic, platform independent instructions.
4. Interpreting - The interpreter takes the bytecode and performs the specified operations.

As you can see, a lot of steps are required before any real action is taken. It makes sense to take a closer look at the different interpreters.

### 1. CPython

[CPython][2] is the reference implementation of Python and the default on many systems. As the name suggests, CPython is written in C.
As a result, it is possible to [write extensions in C][3] and therefore make the widley used C based library code available to Python. CPython is available on a wide range of platforms including ARM, iOS, and RISC. However, as the reference implementation of the language, CPython is carefully optimized and not focused on speed.

### 2. Pyston

[Pyston][4] is a fork of the CPython interpreter which implements performance optimizations. The project describes itself as a replacement of the standard CPython interpreter for large, real-world applications with a speedup potential up to 30%. Due to the lack of compatible binary packages, Pyston packages must be recompiled during the download process.

### 3. PyPy

[PyPy][5] is a [Just-in-time (JIT)][6] compiler for Python which is written in RPython, a statically typed subset of Python. In contrast to the CPython interpreter, PyPy compiles to machine code which can be directly executed by the CPU. PyPy is the playground for Python developers where they can experiment with new features more easily.

PyPy is faster than the reference CPython implementation. Because of the nature of JIT compiler, only applications that have been running for a long time benefit from caching.  PyPy can act as a replacement for CPython. There is a drawback, though. C-extension modules are mostly supported, but they run slower than a Python one. PyPy extension modules are written in Python (not C) and so the JIT compiler is able to optimized them. As long as your application isn't dependent on incompatible modules, PyPy is a great replacement for CPython. There is a dedicated page on the project website which describes the differences to CPython in detail: [Diffrences between PyPy and CPython][7]

### 4. RustPython

As the name suggest, [RustPython][8] is a Python interpreter written in Rust. Although the Rust programming language is quite new, it has been gaining popularity and is a candidate to be a successor of C and C++. By default, RustPython behaves like the interpreter of CPython but it also has a JIT compiler which can be enabled optionally. Another nice feature is that the Rust toolchain allows you to directly compile to [WebAssembly][9] and also allows you to run the interpreter completely in the browser. A demo of it can be found at [rustpython.github.com/demo][10].

### 5. Stackless Python

[Stackless Python][11] describes itself as an enhanced version of the Python programming language. The project is basically a fork of the CPython interpreter which adds microthreads, channels and a scheduler to the language. Microthreads allow you to structure your code into tasklets which let you run your code in parallel. This approach is comparable to using green threads of the [greenlet][12] module. Channels can be used for bidirectional communication between tasklets. A famous user of Stackless Python is the MMORPG [Eve Online][13].

### 6. Micro Python

[MicroPython][14] is the way to go if you target micro controllers. It is a lean implementation that only requires 16kB of RAM and 256kB of space. Due to the embedded environment which it is intended for, MicroPython’s standard library is only a subset of CPython’s extensive STL. For developing and testing or as a lightweight alternative, MicroPython also runs on ordinary x86 and x64 machines. MicroPython is available for Linux, Windows, as well as many microcontrollers.

### Performance

By design, Python is an inherently slow language. Depending on the task, there are significant performance differences between the interpreters. To get an overview of which interpreter is the best pick for a certain task, refer to [pybenchmarks.org][15]. An alternative to using an interpreter is to compile Python binary code directly into machine code. [Nuitka][16], for example, is one of those projects which can compile Python code to C code and from C to machine code. The C code is then compiled to machine code using an ordinary C compiler. The topic of Python compilers is quite comprehensive and worth a separate article.

### Summary

Python is a wonderful language for rapid prototyping and automating tasks. Additionally, it is easy to learn and well suited for beginners. If you usually stick with CPython, it could be interesting to see how your code behaves on another interpreter. If you use Fedora, you can easily test a few other interpreters as the package manager already provides the right binaries. Check out [fedora.developer.org][17] for more information.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/python-interpreters-2022

作者：[Stephan Avenwedde][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/python-programming-code-keyboard.png
[2]: https://github.com/python/cpython#general-information
[3]: https://opensource.com/article/21/4/cython
[4]: https://github.com/pyston/pyston
[5]: https://foss.heptapod.net/pypy/pypy
[6]: https://en.wikipedia.org/wiki/Just-in-time_compilation
[7]: https://doc.pypy.org/en/latest/cpython_differences.html
[8]: https://github.com/RustPython/RustPython
[9]: https://opensource.com/article/21/3/webassembly-firefox
[10]: https://rustpython.github.io/demo/
[11]: https://github.com/stackless-dev/stackless
[12]: https://pypi.org/project/greenlet/
[13]: https://www.eveonline.com/
[14]: https://micropython.org
[15]: https://pybenchmarks.org/
[16]: https://github.com/Nuitka/Nuitka
[17]: https://developer.fedoraproject.org/tech/languages/python/multiple-pythons.html
