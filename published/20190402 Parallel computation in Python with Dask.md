[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10742-1.html)
[#]: subject: (Parallel computation in Python with Dask)
[#]: via: (https://opensource.com/article/19/4/parallel-computation-python-dask)
[#]: author: (Moshe Zadka (Community Moderator) https://opensource.com/users/moshez)

使用 Dask 在 Python 中进行并行计算
======

> Dask 库可以将 Python 计算扩展到多个核心甚至是多台机器。

![Pair programming][1]

关于 Python 性能的一个常见抱怨是[全局解释器锁][2]（GIL）。由于 GIL，同一时刻只能有一个线程执行 Python 字节码。因此，即使在现代的多核机器上，使用线程也不会加速计算。

但当你需要并行化到多核时，你不需要放弃使用 Python：[Dask][3] 库可以将计算扩展到多个内核甚至多个机器。某些设置可以在数千台机器上配置 Dask，每台机器都有多个内核。虽然存在扩展规模的限制，但一般达不到。

虽然 Dask 有许多内置的数组操作，但举一个非内置的例子，我们可以计算[偏度][4]：

```
import numpy
import dask
from dask import array as darray

arr = dask.from_array(numpy.array(my_data), chunks=(1000,))
mean = darray.mean()
stddev = darray.std(arr)
unnormalized_moment = darry.mean(arr * arr * arr)
## See formula in wikipedia:
skewness = ((unnormalized_moment - (3 * mean * stddev ** 2) - mean ** 3) /
            stddev ** 3)
```

请注意，每个操作将根据需要使用尽可能多的内核。这将在所有核心上并行化执行，即使在计算数十亿个元素时也是如此。

当然，并不是我们所有的操作都可由这个库并行化，有时我们需要自己实现并行性。

为此，Dask 有一个“延迟”功能：

```
import dask

def is_palindrome(s):
    return s == s[::-1]

palindromes = [dask.delayed(is_palindrome)(s) for s in string_list]
total = dask.delayed(sum)(palindromes)
result = total.compute()
```

这将计算字符串是否是回文并返回回文的数量。

虽然 Dask 是为数据科学家创建的，但它绝不仅限于数据科学。每当我们需要在 Python 中并行化任务时，我们可以使用 Dask —— 无论有没有 GIL。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/parallel-computation-python-dask

作者：[Moshe Zadka (Community Moderator)][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard.png?itok=kBeRTFL1 (Pair programming)
[2]: https://wiki.python.org/moin/GlobalInterpreterLock
[3]: https://github.com/dask/dask
[4]: https://en.wikipedia.org/wiki/Skewness#Definition
