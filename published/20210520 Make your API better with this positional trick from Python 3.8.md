[#]: subject: (Make your API better with this positional trick from Python 3.8)
[#]: via: (https://opensource.com/article/21/5/python-38-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13466-1.html)

用 Python 3.8 中的这个位置技巧让你的 API 变得更好
======

> 探索只接受位置参数和其他两个未被充分利用但仍然有用的 Python 特性。

![](https://img.linux.net.cn/data/attachment/album/202106/07/164929k51eccocxkx4xf11.jpg)

这是 Python 3.x 首发特性系列文章的第九篇。Python 3.8 于 2019 年首次发布，两年后，它的许多很酷的新特性仍然没有被使用。下面是其中的三个。

### importlib.metadata

[入口点][2] 在 Python 包中被用来做各种事情。大多数人熟悉的是 [console_scripts][3] 入口点，不过 Python 中的许多插件系统都使用它们。

在 Python 3.8 之前，从 Python 中读取入口点的最好方法是使用 `pkg_resources`，这是一个有点笨重的模块，它是 `setuptools` 的一部分。

新的 `importlib.metadata` 是一个内置模块，它允许访问同样的东西：

```
from importlib import metadata as importlib_metadata

distribution = importlib_metadata.distribution("numpy")
distribution.entry_points
```

```
    [EntryPoint(name='f2py', value='numpy.f2py.f2py2e:main', group='console_scripts'),
     EntryPoint(name='f2py3', value='numpy.f2py.f2py2e:main', group='console_scripts'),
     EntryPoint(name='f2py3.9', value='numpy.f2py.f2py2e:main', group='console_scripts')]
```

入口点并不是 `importlib.metadata` 允许访问的唯一东西。可以调试、报告，或者（在极端情况下）触发兼容模式，你也可以在运行时检查依赖的版本！


```
f"{distribution.metadata['name']}=={distribution.version}"`[/code] [code]`    'numpy==1.20.1'
```

### 只接受位置参数

强制关键字的参数在传达 API 作者的意图方面取得巨大成功之后，另一个空白被填补了：只接受位置参数。

特别是对于那些允许使用任意关键字的函数（例如，生成数据结构），这意味着对允许的参数名称的限制更少：

```
def some_func(prefix, /, **kwargs):
    print(prefix, kwargs)
```

```
some_func("a_prefix", prefix="prefix keyword value")
```

```
   a_prefix {'prefix': 'prefix keyword value'}`
```

注意，令人困惑的是，_变量_ `prefix` 的值与 `kwargs["prefix"]` 的值不同。就像在很多地方一样，要注意小心使用这个功能。

### 自我调试表达式

50 多年来，`print()` 语句（及其在其他语言中的对应语句）一直是快速调试输出的最爱。

但是我们在打印语句方面取得了很大的进展，比如：

```
special_number = 5
print("special_number = %s" % special_number)
```

```
    special_number = 5
```

然而，自我记录的 f-strings 使它更容易明确：


```
print(f"{special_number=}")
```

```
    special_number=5`
```

在 f-string 插值部分的末尾添加一个 `=`，可以保留字面部分，同时添加数值。

当更复杂的表达式在该部分内时，这就更有用了：

```
values = {}
print(f"{values.get('something', 'default')=}")
```

```
    values.get('something', 'default')='default'
```

### 欢迎来到 2019 年

Python 3.8 大约在两年前发布，它的一些新特性非常酷，而且没有得到充分利用。如果你还没使用，那么将他们添加到你的工具箱中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-38-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_5.png?itok=YHpNs_ss (Women in computing and open source v5)
[2]: https://packaging.python.org/specifications/entry-points/
[3]: https://python-packaging.readthedocs.io/en/latest/command-line-scripts.html
