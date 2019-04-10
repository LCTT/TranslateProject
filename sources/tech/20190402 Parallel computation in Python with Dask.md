[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Parallel computation in Python with Dask)
[#]: via: (https://opensource.com/article/19/4/parallel-computation-python-dask)
[#]: author: (Moshe Zadka (Community Moderator) https://opensource.com/users/moshez)

Parallel computation in Python with Dask
======
The Dask library scales Python computation to multiple cores or even to
multiple machines.
![Pair programming][1]

One frequent complaint about Python performance is the [global interpreter lock][2] (GIL). Because of GIL, only one thread can execute Python byte code at a time. As a consequence, using threads does not speed up computation—even on modern, multi-core machines.

But when you need to parallelize to many cores, you don't need to stop using Python: the **[Dask][3]** library will scale computation to multiple cores or even to multiple machines. Some setups configure Dask on thousands of machines, each with multiple cores; while there are scaling limits, they are not easy to hit.

While Dask has many built-in array operations, as an example of something not built-in, we can calculate the [skewness][4]:
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

Notice that each operation will use as many cores as needed. This will parallelize across all cores, even when calculating across billions of elements.

Of course, it is not always the case that our operations can be parallelized by the library; sometimes we need to implement parallelism on our own.

For that, Dask has a "delayed" functionality:
```
import dask

def is_palindrome(s):
    return s == s[::-1]

palindromes = [dask.delayed(is_palindrome)(s) for s in string_list]
total = dask.delayed(sum)(palindromes)
result = total.compute()
```

This will calculate whether strings are palindromes in parallel and will return a count of the palindromic ones.

While Dask was created for data scientists, it is by no means limited to data science. Whenever we need to parallelize tasks in Python, we can turn to Dask—GIL or no GIL.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/parallel-computation-python-dask

作者：[Moshe Zadka (Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard.png?itok=kBeRTFL1 (Pair programming)
[2]: https://wiki.python.org/moin/GlobalInterpreterLock
[3]: https://github.com/dask/dask
[4]: https://en.wikipedia.org/wiki/Skewness#Definition
