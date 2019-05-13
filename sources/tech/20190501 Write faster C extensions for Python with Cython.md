[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Write faster C extensions for Python with Cython)
[#]: via: (https://opensource.com/article/19/5/python-cython)
[#]: author: (Moshe Zadka  https://opensource.com/users/moshez/users/moshez/users/foundjem/users/jugmac00)

Write faster C extensions for Python with Cython
======
Learn more about solving common Python problems in our series covering
seven PyPI libraries.
![Hand drawing out the word "code"][1]

Python is one of the most [popular programming languages][2] in use today—and for good reasons: it's open source, it has a wide range of uses (such as web programming, business applications, games, scientific programming, and much more), and it has a vibrant and dedicated community supporting it. This community is the reason we have such a large, diverse range of software packages available in the [Python Package Index][3] (PyPI) to extend and improve Python and solve the inevitable glitches that crop up.

In this series, we'll look at seven PyPI libraries that can help you solve common Python problems. First up: **[**Cython**][4]** , a language that simplifies writing C extensions for Python.

### Cython

Python is fun to use, but sometimes, programs written in it can be slow. All the runtime dynamic dispatching comes with a steep price: sometimes it's up to 10-times slower than equivalent code written in a systems language like C or Rust.

Moving pieces of code to a completely new language can have a big cost in both effort and reliability: All that manual rewrite work will inevitably introduce bugs. Can we have our cake and eat it too?

To have something to optimize for this exercise, we need something slow. What can be slower than an accidentally exponential implementation of the Fibonacci sequence?


```
def fib(n):
  if n < 2:
    return 1
  return fib(n-1) + fib(n-2)
```

Since a call to **fib** results in two calls, this beautifully inefficient algorithm takes a long time to execute. For example, on my new laptop, **fib(36)** takes about 4.5 seconds. These 4.5 seconds will be our baseline as we explore how Python's Cython extension can help.

The proper way to use Cython is to integrate it into **setup.py**. However, a quick and easy way to try things out is with **pyximport**. Let's put the **fib** code above in **fib.pyx** and run it using Cython.


```
>>> import pyximport; pyximport.install()
>>> import fib
>>> fib.fib(36)
```

Just using Cython with _no_ code changes reduced the time the algorithm takes on my laptop to around 2.5 seconds. That's a reduction of almost 50% runtime with almost no effort; certainly, a scrumptious cake to eat and have!

Putting in a little more effort, we can make things even faster.


```
cpdef int fib(int n):
  if n < 2:
    return 1
  return fib(n - 1) + fib(n - 2)
```

We moved the code in **fib** to a function defined with **cpdef** and added a couple of type annotations: it takes an integer and returns an integer.

This makes it _much_ faster—around 0.05 seconds. It's so fast that I may start suspecting my measurement methods contain noise: previously, this noise was lost in the signal.

So, the next time some of your Python code spends too long on the CPU, maybe spinning up some fans in the process, why not see if Cython can fix things?

In the next article in this series, we'll look at **Black** , a project that automatically corrects format errors in your code.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/python-cython

作者：[Moshe Zadka ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez/users/moshez/users/foundjem/users/jugmac00
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_hand_draw.png?itok=dpAf--Db (Hand drawing out the word "code")
[2]: https://opensource.com/article/18/5/numbers-python-community-trends
[3]: https://pypi.org/
[4]: https://pypi.org/project/Cython/
