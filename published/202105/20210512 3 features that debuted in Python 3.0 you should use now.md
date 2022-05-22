[#]: subject: (3 features that debuted in Python 3.0 you should use now)
[#]: via: (https://opensource.com/article/21/5/python-30-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13407-1.html)

3 个值得使用的首次亮相在 Python 3.0 中的特性
======

> 探索一些未被充分利用但仍然有用的 Python 特性。

![](https://img.linux.net.cn/data/attachment/album/202105/20/103117me72dllr6lebk1fv.jpg)

这是 Python 3.x 首发特性系列文章的第一篇。Python 3.0 于 2008 年首次发布，尽管它已经发布了一段时间，但它引入的许多特性都没有被充分利用，而且相当酷。这里有三个你应该知道的。

### 仅限关键字参数

Python 3.0 首次引入了**仅限关键字参数**参数的概念。在这之前，不可能指定一个只通过关键字传递某些参数的 API。这在有许多参数，其中一些参数可能是可选的函数中很有用。

请看一个特意设计的例子：

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

当阅读调用该函数的代码时，有时很难理解发生了什么：

```
show_arguments("hello", "extra")

    base is hello
    extended is extra

show_arguments("hello", None, "extra")

    base is hello
    improved is extra
```

虽然可以用关键字参数来调用这个函数，但这明显不是最好的方法。相反，你可以将这些参数标记为仅限关键字：

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

现在，你不能用位置参数传入额外的参数：

```
show_arguments("hello", "extra")
    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-7-6000400c4441> in <module>
    ----> 1 show_arguments("hello", "extra")
   

    TypeError: show_arguments() takes 1 positional argument but 2 were given
```

对该函数的有效调用更容易预测：

```
show_arguments("hello", improved="extra")
    base is hello
    improved is extra
```

### nonlocal

有时，函数式编程的人根据编写累加器的难易程度来判断一种语言。累加器是一个函数，当它被调用时，返回目前为止发给它的所有参数的总和。

在 3.0 之前，Python 的标准答案是：

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

虽然我承认有些啰嗦，但这确实有效：

```
acc = make_accumulator()
print("1", acc(1))
print("5", acc(5))
print("3", acc(3))
```

这样做的输出结果将是：

```
1 1
5 6
3 9
```

在 Python 3.x 中，`nonlocal` 关键字可以用少得多的代码实现同样的行为。


```
def make_accumulator():
    so_far = 0
    def accumulate(arg):
        nonlocal so_far
        so_far += arg
        return so_far
    return accumulate
```

虽然累加器是人为的例子，但使用 `nonlocal` 关键字使内部函数拥有具有状态的的能力是一个强大的工具。

### 扩展析构

想象一下，你有一个 CSV 文件，每一行由几个元素组成：

  * 第一个元素是年份
  * 第二个元素是月
  * 其他元素是该月发表的全部文章数，每天一个条目

请注意，最后一个元素是 _文章总数_，而不是 _每天发表的文章_。例如，一行的开头可以是：

```
2021,1,5,8,10
```

这意味着在 2021 年 1 月，第一天发表了 5 篇文章。第二天，又发表了三篇文章，使总数达到 8 篇。第三天，又发表了两篇文章。

一个月可以有 28 天、30 天或 31 天。提取月份、日期和文章总数有多难？

在 3.0 之前的 Python 版本中，你可能会这样写：

```
year, month, total = row[0], row[1], row[-1]
```

这是正确的，但它掩盖了格式。使用**扩展析构**，同样可以这样表达：

```
year, month, *rest, total = row
```

这意味着如果该格式改为前缀了一个描述，你可以把代码改成：

```
_, year, month, *rest, total = row
```

而不需要在每个索引中添加 `1`。

### 接下来是什么？

Python 3.0 和它的后期版本已经推出了 12 年多，但是它的一些功能还没有被充分利用。在本系列的下一篇文章中，我将会写另外三个。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-30-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )