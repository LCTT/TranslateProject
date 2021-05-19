[#]: subject: (Are you using this magic method for filesystems from Python 3.6?)
[#]: via: (https://opensource.com/article/21/5/python-36-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Are you using this magic method for filesystems from Python 3.6?
======
Explore os.fspath and two other underutilized but still useful Python
features.
![Computer screen with files or windows open][1]

This is the seventh in a series of articles about features that first appeared in a version of Python 3.x. Python 3.6 was first released in 2016, and even though it has been out for a while, many of the features it introduced are underused and pretty cool. Here are three of them.

### Separated numeral constants

Quick, which is bigger, `10000000` or `200000`? Would you be able to answer correctly while scanning through code? Depending on local conventions, in prose writing, you would use 10,000,000 or 10.000.000 for the first number. The trouble is, Python uses commas and periods for other reasons.

Fortunately, since Python 3.6, you can use underscores to separate digits. This works both directly in code and when using the `int()` convertor from strings:


```
import math
math.log(10_000_000) / math.log(10)

[/code] [code]`    7.0`[/code] [code]`math.log(int("10_000_000")) / math.log(10)`[/code] [code]`    7.0`
```

### Tau is right

What's a 45-degree angle expressed in radians? One correct answer is `π/4`, but that's a little hard to remember. It's much easier to remember that a 45-degree angle is an eighth of a turn. As the [Tau Manifesto][2] explains, `2π`, called `Τ`, is a more natural constant.

In Python 3.6 and later, your math code can use the more intuitive constant:


```
print("Tan of an eighth turn should be 1, got", round(math.tan(math.tau/8), 2))
print("Cos of an sixth turn should be 1/2, got", round(math.cos(math.tau/6), 2))
print("Sin of a quarter turn should be 1, go", round(math.sin(math.tau/4), 2))

[/code] [code]

    Tan of an eighth turn should be 1, got 1.0
    Cos of an sixth turn should be 1/2, got 0.5
    Sin of a quarter turn should be 1, go 1.0
```

### os.fspath

Starting in Python 3.6, there is a magic method that represents "convert to a filesystem path." When given an `str` or `bytes`, it returns the input.

For all types of objects, it looks for an `__fspath__`method and calls it. This allows passing around objects that are "filenames with metadata."

Normal functions like `open()` or `stat` will still be able to use them, as long as `__fspath__` returns the right thing.

For example, here is a function that writes some data into a file and then checks its size. It also logs the file name to standard output for tracing purposes:


```
def write_and_test(filename):
    print("writing into", filename)
    with open(filename, "w") as fpout:
        fpout.write("hello")
    print("size of", filename, "is", os.path.getsize(filename))
```

You can call it the way you would expect, with a string for a filename:


```
`write_and_test("plain.txt")`[/code] [code]

    writing into plain.txt
    size of plain.txt is 5
```

However, it is possible to define a new class that adds information to the string representation of filenames. This allows the logging to be more detailed, without changing the original function:


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

Running the function with a `DocumentedFileName` instance as input allows the `open` and `os.getsize` functions to keep working while enhancing the logs:


```
`write_and_test(DocumentedFileName("documented.txt", "because it's fun"))`[/code] [code]

    writing into DocumentedFileName(fname='documented.txt', why="because it's fun")
    size of DocumentedFileName(fname='documented.txt', why="because it's fun") is 5
```

### Welcome to 2016

Python 3.6 was released about five years ago, but some of the features that first showed up in this release are cool—and underused. Add them to your toolkit if you haven't already.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-36-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://tauday.com/tau-manifesto
