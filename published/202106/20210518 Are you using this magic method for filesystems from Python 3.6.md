[#]: subject: (Are you using this magic method for filesystems from Python 3.6?)
[#]: via: (https://opensource.com/article/21/5/python-36-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13454-1.html)

你使用过 Python 3.6 中针对文件系统的这个神奇方法吗？
======

> 探索 os.fspath 和其他两个未被充分利用但仍然有用的 Python 特性。

![](https://img.linux.net.cn/data/attachment/album/202106/03/164403a6m2c989hh963lm6.jpg)

这是 Python 3.x 首发特性系列文章中的第七篇。Python 3.6 首次发布于 2016 年，尽管它已经发布了一段时间，但它引入的许多特性都没有得到充分利用，而且相当酷。下面是其中的三个。

### 分隔数字常数

快回答哪个更大，`10000000` 还是 `200000`？你在看代码时能正确回答吗？根据当地的习惯，在写作中，你会用 10,000,000 或 10.000.000 来表示第一个数字。问题是，Python 使用逗号和句号是用于其他地方。

幸运的是，从 Python 3.6 开始，你可以使用下划线来分隔数字。这在代码中和使用字符串的 `int()` 转换器时都可以使用：

```
import math
math.log(10_000_000) / math.log(10)
```

```
    7.0
```

```
math.log(int("10_000_000")) / math.log(10)
```

```
    7.0
```

### Tau 是对的

45 度角用弧度表示是多少？一个正确的答案是 `π/4`，但这有点难记。记住 45 度角是一个八分之一的转角要容易得多。正如 [Tau Manifesto][2] 所解释的，`2π`，称为 `Τ`，是一个更自然的常数。

在 Python 3.6 及以后的版本中，你的数学代码可以使用更直观的常数：

```
print("Tan of an eighth turn should be 1, got", round(math.tan(math.tau/8), 2))
print("Cos of an sixth turn should be 1/2, got", round(math.cos(math.tau/6), 2))
print("Sin of a quarter turn should be 1, go", round(math.sin(math.tau/4), 2))
```

```
    Tan of an eighth turn should be 1, got 1.0
    Cos of an sixth turn should be 1/2, got 0.5
    Sin of a quarter turn should be 1, go 1.0
```

### os.fspath

从 Python 3.6 开始，有一个神奇的方法表示“转换为文件系统路径”。当给定一个 `str` 或 `bytes` 时，它返回输入。

对于所有类型的对象，它寻找 `__fspath__` 方法并调用它。这允许传递的对象是“带有元数据的文件名”。

像 `open()` 或 `stat` 这样的普通函数仍然能够使用它们，只要 `__fspath__` 返回正确的东西。

例如，这里有一个函数将一些数据写入一个文件，然后检查其大小。它还将文件名记录到标准输出，以便追踪：

```
def write_and_test(filename):
    print("writing into", filename)
    with open(filename, "w") as fpout:
        fpout.write("hello")
    print("size of", filename, "is", os.path.getsize(filename))
```

你可以用你期望的方式来调用它，用一个字符串作为文件名：

```
write_and_test("plain.txt")
```

```
    writing into plain.txt
    size of plain.txt is 5
```

然而，可以定义一个新的类，为文件名的字符串表示法添加信息。这样可以使日志记录更加详细，而不改变原来的功能：

```
class DocumentedFileName:
    def __init__(self, fname, why):
        self.fname = fname
        self.why = why
    def __fspath__(self):
        return self.fname
    def __repr__(self):
        return f"DocumentedFileName(fname={self.fname!r}, why={self.why!r})"
```

用 `DocumentedFileName` 实例作为输入运行该函数，允许 `open` 和 `os.getsize` 函数继续工作，同时增强日志：

```
write_and_test(DocumentedFileName("documented.txt", "because it's fun"))
```

```
    writing into DocumentedFileName(fname='documented.txt', why="because it's fun")
    size of DocumentedFileName(fname='documented.txt', why="because it's fun") is 5
```

### 欢迎来到 2016 年

Python 3.6 是在五年前发布的，但是在这个版本中首次出现的一些特性非常酷，而且没有得到充分利用。如果你还没使用，那么将他们添加到你的工具箱中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-36-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://tauday.com/tau-manifesto
