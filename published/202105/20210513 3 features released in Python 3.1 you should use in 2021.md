[#]: subject: (3 features released in Python 3.1 you should use in 2021)
[#]: via: (https://opensource.com/article/21/5/python-31-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13432-1.html)

3 个值得使用的在 Python 3.1 中发布的特性
======

> 探索一些未被充分利用但仍然有用的 Python 特性。

![](https://img.linux.net.cn/data/attachment/album/202105/27/225101wkeoeqd7bb8ckr8d.jpg)

这是 Python 3.x 首发特性系列文章的第二篇。Python 3.1 于 2009 年首次发布，尽管它已经发布了很长时间，但它引入的许多特性都没有被充分利用，而且相当酷。下面是其中的三个。

### 千位数格式化

在格式化大数时，通常是每三位数放置逗号，使数字更易读（例如，1,048,576 比 1048576 更容易读）。从 Python 3.1 开始，可以在使用字符串格式化函数时直接完成：

```
"2 to the 20th power is {:,d}".format(2**20)
```

```
'2 to the 20th power is 1,048,576'
```

`,d` 格式符表示数字必须用逗号格式化。

### Counter 类

`collections.Counter` 类是标准库模块 `collections` 的一部分，是 Python 中的一个秘密超级武器。它经常在 Python 的面试题的简单解答中首次遇到，但它的价值并不限于此。

例如，在 [Humpty Dumpty 的歌][2] 的前八行中找出五个最常见的字母：

```
hd_song = """
In winter, when the fields are white,
I sing this song for your delight.

In Spring, when woods are getting green,
I'll try and tell you what I mean.

In Summer, when the days are long,
Perhaps you'll understand the song.

In Autumn, when the leaves are brown,
Take pen and ink, and write it down.
"""
```

```
import collections

collections.Counter(hd_song.lower().replace(' ', '')).most_common(5)
```

```
[('e', 29), ('n', 27), ('i', 18), ('t', 18), ('r', 15)]
```

### 执行软件包

Python 允许使用 `-m` 标志来从命令行执行模块。甚至一些标准库模块在被执行时也会做一些有用的事情；例如，`python -m cgi` 是一个 CGI 脚本，用来调试网络服务器的 CGI 配置。

然而，直到 Python 3.1，都不可能像这样执行 _软件包_。从 Python 3.1 开始，`python -m package` 将执行软件包中的 `__main__` 模块。这是一个放调试脚本或命令的好地方，这些脚本主要是用工具执行的，不需要很短。

Python 3.0 在 11 年前就已经发布了，但是在这个版本中首次出现的一些功能是很酷的，而且没有得到充分利用。如果你还没使用，那么将它们添加到你的工具箱中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-31-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r (Python programming language logo with question marks)
[2]: http://www2.open.ac.uk/openlearn/poetryprescription/humpty-dumptys-recitation.html
