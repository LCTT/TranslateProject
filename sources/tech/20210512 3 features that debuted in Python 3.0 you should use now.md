[#]: subject: (3 features that debuted in Python 3.0 you should use now)
[#]: via: (https://opensource.com/article/21/5/python-30-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

3 features that debuted in Python 3.0 you should use now
======
Explore some of the underutilized but still useful Python features.
![Hands on a keyboard with a Python book ][1]

This is the first in a series of articles about features that first appeared in a version of Python 3.x. Python 3.0 was first released in 2008, and even though it has been out for a while, many of the features it introduced are underused and pretty cool. Here are three you should know about.

### Keyword-only arguments

Python 3.0 first introduced the idea of **keyword-only** arguments. Before this, it was impossible to specify an API where some arguments could be passed in only via keywords. This is useful in functions with many arguments, some of which might be optional.

Consider a contrived example:


```
def show_arguments(base, extended=None, improved=None, augmented=None):
    print("base is", base)
    if extended is not None:
        print("extended is", extended)
    if improved is not None:
        print("improved is", improved)
    if augmented is not None:
        print("augmented is", augmented)
```

When reading code that calls this function, it is sometimes hard to understand what is happening:


```
`show_arguments("hello", "extra")`[/code] [code]

    base is hello
    extended is extra

[/code] [code]`show_arguments("hello", None, "extra")`[/code] [code]

    base is hello
    improved is extra
```

While it is possible to call this function with keyword arguments, it is not obvious that this is the best way. Instead, you can mark these arguments as keyword-only:


```
def show_arguments(base, *, extended=None, improved=None, augmented=None):
    print("base is", base)
    if extended is not None:
        print("extended is", extended)
    if improved is not None:
        print("improved is", improved)
    if augmented is not None:
        print("augmented is", augmented)
```

Now, you can't pass in the extra arguments with positional arguments:


```
`show_arguments("hello", "extra")`[/code] [code]

    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    &lt;ipython-input-7-6000400c4441&gt; in &lt;module&gt;
    ----&gt; 1 show_arguments("hello", "extra")
   

    TypeError: show_arguments() takes 1 positional argument but 2 were given
```

Valid calls to the function are much easier to predict:


```
`show_arguments("hello", improved="extra")`[/code] [code]

    base is hello
    improved is extra
```

### nonlocal

Sometimes, functional programming folks judge a language by how easy is it to write an accumulator. An accumulator is a function that, when called, returns the sum of all arguments sent to it so far.

The standard answer in Python before 3.0 was:


```
class _Accumulator:
    def __init__(self):
        self._so_far = 0
    def __call__(self, arg):
        self._so_far += arg
        return self._so_far

def make_accumulator():
    return _Accumulator()
```

While admittedly somewhat verbose, this does work:


```
acc = make_accumulator()
print("1", acc(1))
print("5", acc(5))
print("3", acc(3))
```

The output for this would be:


```
1 1
5 6
3 9
```

In Python 3.x, **nonlocal** can achieve the same behavior with significantly less code.


```
def make_accumulator():
    so_far = 0
    def accumulate(arg):
        nonlocal so_far
        so_far += arg
        return so_far
    return accumulate
```

While accumulators are contrived examples, the ability to use the `nonlocal` keyword to have inner functions with state is a powerful tool.

### Extended destructuring

Imagine you have a CSV file where each row consists of several elements:

  * The first element is a year
  * The second element is a month
  * The other elements are the total articles published that month, one entry for each day



Note that the last element is _total articles_, not _articles published per day_. For example, a row can begin with:


```
`2021,1,5,8,10`
```

This means that in January 2021, five articles were published on the first day. On the second day, three more articles were published, bringing the total to 8. On the third day, two more articles were published.

Months can have 28, 30, or 31 days. How hard is it to extract the month, day, and total articles?

In versions of Python before 3.0, you might write something like:


```
`year, month, total = row[0], row[1], row[-1]`
```

This is correct, but it obscures the format. With **extended destructuring**, the same can be expressed this way:


```
`year, month, *rest, total = row`
```

This means that if the format ever changes to prefix a description, you can change the code to:


```
`_, year, month, *rest, total = row`
```

Without needing to add `1` to each of the indices.

### What's next?

Python 3.0 and its later versions have been out for more than 12 years, but some of its features are underutilized. In the next article in this series, I'll look at three more of them.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-30-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
