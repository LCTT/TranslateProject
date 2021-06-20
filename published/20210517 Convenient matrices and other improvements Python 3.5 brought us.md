[#]: subject: (Convenient matrices and other improvements Python 3.5 brought us)
[#]: via: (https://opensource.com/article/21/5/python-35-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13448-1.html)

Python 3.5 带给我们的方便的矩阵以及其他改进
======

> 探索一些未被充分利用但仍然有用的 Python 特性。

![](https://img.linux.net.cn/data/attachment/album/202106/01/201953lua9t9f3vvwqbqet.jpg)

这是 Python 3.x 首发特性系列文章的第六篇。Python 3.5 在 2015 年首次发布，尽管它已经发布了很长时间，但它引入的许多特性都没有被充分利用，而且相当酷。下面是其中的三个。

### @ 操作符

`@` 操作符在 Python 中是独一无二的，因为在标准库中没有任何对象可以实现它！它是为了在有矩阵的数学包中使用而添加的。

矩阵有两个乘法的概念。元素积是用 `*` 运算符完成的。但是矩阵组合（也被认为是乘法）需要自己的符号。它是用 `@` 完成的。

例如，将一个“八转”矩阵（将轴旋转 45 度）与自身合成，就会产生一个四转矩阵。

```
import numpy

hrt2 = 2**0.5 / 2
eighth_turn = numpy.array([
    [hrt2, hrt2],
    [-hrt2, hrt2]
])
eighth_turn @ eighth_turn
```

```
    array([[ 4.26642159e-17,  1.00000000e+00],
           [-1.00000000e+00, -4.26642159e-17]])
```

浮点数是不精确的，这比较难以看出。从结果中减去四转矩阵，将其平方相加，然后取其平方根，这样就比较容易检查。

这是新运算符的一个优点：特别是在复杂的公式中，代码看起来更像基础数学：

```
almost_zero = ((eighth_turn @ eighth_turn) - numpy.array([[0, 1], [-1, 0]]))**2
round(numpy.sum(almost_zero) ** 0.5, 10)
```

```
    0.0
```

### 参数中的多个关键词字典

Python 3.5 使得调用具有多个关键字-参数字典的函数成为可能。这意味着多个默认值的源可以与更清晰的代码”互操作“。

例如，这里有个可笑的关键字参数的函数：

```
def show_status(
    *,
    the_good=None,
    the_bad=None,
    the_ugly=None,
    fistful=None,
    dollars=None,
    more=None
):
    if the_good:
        print("Good", the_good)
    if the_bad:
        print("Bad", the_bad)
    if the_ugly:
        print("Ugly", the_ugly)
    if fistful:
        print("Fist", fistful)
    if dollars:
        print("Dollars", dollars)
    if more:
        print("More", more)
```

当你在应用中调用这个函数时，有些参数是硬编码的：

```
defaults = dict(
    the_good="You dig",
    the_bad="I have to have respect",
    the_ugly="Shoot, don't talk",
)
```

从配置文件中读取更多参数：

```
import json

others = json.loads("""
{
"fistful": "Get three coffins ready",
"dollars": "Remember me?",
"more": "It's a small world"
}
""")
```

你可以从两个源一起调用这个函数，而不必构建一个中间字典：

```
show_status(**defaults, **others)
```

```
    Good You dig
    Bad I have to have respect
    Ugly Shoot, don't talk
    Fist Get three coffins ready
    Dollars Remember me?
    More It's a small world
```

### os.scandir

`os.scandir` 函数是一种新的方法来遍历目录内容。它返回一个生成器，产生关于每个对象的丰富数据。例如，这里有一种打印目录清单的方法，在目录的末尾跟着 `/`：

```
for entry in os.scandir(".git"):
    print(entry.name + ("/" if entry.is_dir() else ""))
```

```
    refs/
    HEAD
    logs/
    index
    branches/
    config
    objects/
    description
    COMMIT_EDITMSG
    info/
    hooks/
```

### 欢迎来到 2015 年

Python 3.5 在六年前就已经发布了，但是在这个版本中首次出现的一些特性非常酷，而且没有得到充分利用。如果你还没使用，那么将他们添加到你的工具箱中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-35-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/markus-spiske-iar-matrix-unsplash.jpg?itok=78u_4veR (Hacker code matrix)