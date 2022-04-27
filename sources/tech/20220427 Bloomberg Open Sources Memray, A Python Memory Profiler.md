[#]: subject: "Bloomberg Open Sources Memray, A Python Memory Profiler"
[#]: via: "https://www.opensourceforu.com/2022/04/bloomberg-open-sources-memray-a-python-memory-profiler/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Bloomberg Open Sources Memray, A Python Memory Profiler
======
![soft][1]

Memray is a memory profiler that was developed at Bloomberg and is now open source. It can track memory allocations in Python code, including native extensions and the Python interpreter itself. Memory profiling is a strong tool for understanding how a program utilises memory and, as a result, detecting memory leaks or determining which areas of the program consume the most memory.

In contrast to sampling memory profilers like py-spy, Memray can track every function call, including calls into C/C++ libraries, and display the call stack in detail. Bloomberg claims that this does not come at the sacrifice of performance, with profiling only slowing down interpreted code by a little amount. However, native code profiling is slower and must be enabled directly.

Memray may generate a variety of reports based on the acquired memory consumption data, including flame graphs, which are valuable for rapidly and precisely identifying the most common code-paths.

According to Yury Selivanov, co-founder and CEO of EgdeDB, the tool gives previously unavailable insights into Python applications. Memray can be used to execute and profile a Python application from the command line:

```python
$ python3 -m memray run -o output.bin my_script.py
$ python3 -m memray flamegraph output.bin
```

Alternatively, you can use pytest-memray to integrate Memray into your test suite. You can also profile all C/C++ calls with the —native command line option, or analyse memory allocation in real time while a programme is executing with the —live command line option. Memray can be installed with python3 -m pip install memray on a Linux x86/64 system.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/04/bloomberg-open-sources-memray-a-python-memory-profiler/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/soft-1-696x363.jpg
