[#]: subject: (What Python 3.3 did to improve exception handling in your code)
[#]: via: (https://opensource.com/article/21/5/python-33)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

What Python 3.3 did to improve exception handling in your code
======
Explore exception handling and other underutilized but still useful
Python features.
![Coding on a computer][1]

This is the fourth in a series of articles about features that first appeared in a version of Python 3.x. Python 3.3 was first released in 2012, and even though it has been out for a long time, many of the features it introduced are underused and pretty cool. Here are three of them.

### yield from

The `yield` keyword made Python much more powerful. Predictably, everyone started using it to create a whole ecosystem of iterators. The [itertools][2] module and the [more-itertools][3] PyPI package are just two examples.

Sometimes, a new generator will want to use an existing generator. As a simple (if somewhat contrived) example, imagine you want to enumerate all pairs of natural numbers.

One way to do it is to generate all pairs in the order of `sum of pair, first item of pair`. Implementing this with `yield from` is natural.

The `yield from <x>` keyword is short for:


```
for item in x:
    yield item

[/code] [code]

import itertools

def pairs():
    for n in itertools.count():
        yield from ((i, n-i) for i in range(n+1))

[/code] [code]`list(itertools.islice(pairs(), 6))`[/code] [code]`    [(0, 0), (0, 1), (1, 0), (0, 2), (1, 1), (2, 0)]`
```

### Implicit namespace packages

Imagine a fictional company called Parasol that makes a bunch of stuff. Much of its internal software is written in Python. While Parasol has open sourced some of its code, some of it is too proprietary or specialized for open source.

The company uses an internal [DevPI][4] server to manage the internal packages. It does not make sense for every Python programmer at Parasol to find an unused name on PyPI, so all the internal packages are called `parasol.<business division>.<project>`. Observing best practices, the developers want the package names to reflect that naming system.

This is important! If the package `parasol.accounting.numeric_tricks` installs a top-level module called `numeric_tricks`, this means nobody who depends on this package will be able to use a PyPI package that is called `numeric_tricks`, no matter how nifty it is.

However, this leaves the developers with a dilemma: Which package owns the `parasol/__init__.py` file? The best solution, starting in Python 3.3, is to make `parasol`, and probably `parasol.accounting`, to be [namespace packages][5], which don't have the `__init__.py` file.

### Suppressing exception context

Sometimes, an exception in the middle of a recovery from an exception is a problem, and having the context to trace it is useful. However, sometimes it is not: the exception has been handled, and the new situation is a different error condition.

For example, imagine that after failing to look up a key in a dictionary, you want to fail with a `ValueError()` if it cannot be analyzed:


```
import time

def expensive_analysis(data):
    time.sleep(10)
    if data[0:1] == "&gt;":
        return data[1:]
    return None
```

This function takes a long time, so when you use it, you want to cache the results:


```
cache = {}

def last_letter_analyzed(data):
    try:
        analyzed = cache[data]
    except KeyError:
        analyzed = expensive_analysis(data)
        if analyzed is None:
            raise ValueError("invalid data", data)
        cached[data] = analyzed
    return analyzed[-1]
```

Unfortunately, when there is a cache miss, the traceback looks ugly:


```
`last_letter_analyzed("stuff")`[/code] [code]

    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    &lt;ipython-input-16-a525ae35267b&gt; in last_letter_analyzed(data)
          4     try:
    ----&gt; 5         analyzed = cache[data]
          6     except KeyError:

    KeyError: 'stuff'
```

During handling of the above exception, another exception occurs:


```
    ValueError                                Traceback (most recent call last)

    &lt;ipython-input-17-40dab921f9a9&gt; in &lt;module&gt;
    ----&gt; 1 last_letter_analyzed("stuff")
   

    &lt;ipython-input-16-a525ae35267b&gt; in last_letter_analyzed(data)
          7         analyzed = expensive_analysis(data)
          8         if analyzed is None:
    ----&gt; 9             raise ValueError("invalid data", data)
         10         cached[data] = analyzed
         11     return analyzed[-1]

    ValueError: ('invalid data', 'stuff')
```

If you use `raise ... from None`, you can get much more readable tracebacks:


```
def last_letter_analyzed(data):
    try:
        analyzed = cache[data]
    except KeyError:
        analyzed = expensive_analysis(data)
        if analyzed is None:
            raise ValueError("invalid data", data) from None
        cached[data] = analyzed
    return analyzed[-1]

[/code] [code]`last_letter_analyzed("stuff")`[/code] [code]

    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    &lt;ipython-input-21-40dab921f9a9&gt; in &lt;module&gt;
    ----&gt; 1 last_letter_analyzed("stuff")
   

    &lt;ipython-input-20-5691e33edfbc&gt; in last_letter_analyzed(data)
          5         analyzed = expensive_analysis(data)
          6         if analyzed is None:
    ----&gt; 7             raise ValueError("invalid data", data) from None
          8         cached[data] = analyzed
          9     return analyzed[-1]

    ValueError: ('invalid data', 'stuff')
```

### Welcome to 2012

Although Python 3.3 was released almost a decade ago, many of its features are still cool—and underused. Add them to your toolkit if you haven't already.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-33

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://docs.python.org/3/library/itertools.html
[3]: https://more-itertools.readthedocs.io/en/stable/
[4]: https://opensource.com/article/18/7/setting-devpi
[5]: https://www.python.org/dev/peps/pep-0420/
