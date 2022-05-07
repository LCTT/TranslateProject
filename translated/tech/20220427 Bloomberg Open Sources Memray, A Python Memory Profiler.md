[#]: subject: "Bloomberg Open Sources Memray, A Python Memory Profiler"
[#]: via: "https://www.opensourceforu.com/2022/04/bloomberg-open-sources-memray-a-python-memory-profiler/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

彭博社开源 Memray，一个 Python 内存分析器
======
![soft][1]

Memray 是一个内存分析器，由彭博社发，现在已经开源。它可以跟踪 Python 代码中的内存分配，包括本地扩展和 Python 解释器本身。内存剖析是了解程序如何利用内存的有力工具，因此可以检测内存泄漏或确定程序中哪些区域消耗的内存最多。

与 py-spy 等抽样内存剖析器相比，Memray 可以跟踪每个函数调用，包括对 C/C++ 库的调用，并详细显示调用栈。彭博社称，这并不以牺牲性能为代价，剖析只使解释代码的速度变慢一点。然而，原生代码剖析的速度较慢，因此需要直接启用。

Memray 可以根据获得的内存消耗数据生成各种报告，包括火焰图，这对快速、准确地识别最常见的代码路径很有价值。

据 EgdeDB 的联合创始人兼 CEO Yury Selivanov 称，该工具提供了以前无法获得的对 Python 应用的洞察力。Memray 可以用来从命令行中执行和分析 Python 应用。

```python
$ python3 -m memray run -o output.bin my_script.py
$ python3 -m memray flamegraph output.bin
```

另外，你可以使用 pytest-memray 将 Memray 集成到你的测试套件中。你也可以用 -native 命令行选项对所有的 C/C++ 调用进行剖析，或者用 -live 命令行选项在程序执行过程中实时分析内存分配。Memray 可以在 Linux x86/64 系统上用 python3 -m pip install memray 来安装。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/04/bloomberg-open-sources-memray-a-python-memory-profiler/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/soft-1-696x363.jpg
