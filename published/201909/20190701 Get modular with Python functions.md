[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11295-1.html)
[#]: subject: (Get modular with Python functions)
[#]: via: (https://opensource.com/article/19/7/get-modular-python-functions)
[#]: author: (Seth Kenlon https://opensource.com/users/seth/users/xd-deng/users/nhuntwalker/users/don-watkins)

使用 Python 函数进行模块化
======

> 使用 Python 函数来最大程度地减少重复任务编码工作量。

![](https://img.linux.net.cn/data/attachment/album/201909/01/234309ja7ooanopazo3o2m.jpg)

你是否对函数、类、方法、库和模块等花哨的编程术语感到困惑？你是否在与变量作用域斗争？无论你是自学成才的还是经过正式培训的程序员，代码的模块化都会令人困惑。但是类和库鼓励模块化代码，因为模块化代码意味着只需构建一个多用途代码块集合，就可以在许多项目中使用它们来减少编码工作量。换句话说，如果你按照本文对 [Python][2] 函数的研究，你将找到更聪明的工作方法，这意味着更少的工作。

本文假定你对 Python 很熟（LCTT 译注：稍微熟悉就可以），并且可以编写和运行一个简单的脚本。如果你还没有使用过 Python，请首先阅读我的文章：[Python 简介][3]。

### 函数

函数是迈向模块化过程中重要的一步，因为它们是形式化的重复方法。如果在你的程序中，有一个任务需要反复执行，那么你可以将代码放入一个函数中，根据需要随时调用该函数。这样，你只需编写一次代码，就可以随意使用它。

以下一个简单函数的示例：

```
#!/usr/bin/env python3
import time

def Timer():
    print("Time is " + str(time.time() ))
```

创建一个名为 `mymodularity` 的目录，并将以上函数代码保存为该目录下的 `timestamp.py`。

除了这个函数，在 `mymodularity` 目录中创建一个名为 `__init__.py` 的文件，你可以在文件管理器或 bash shell 中执行此操作：

```
$ touch mymodularity/__init__.py
```

现在，你已经创建了属于你自己的 Python 库（Python 中称为“模块”），名为 `mymodularity`。它不是一个特别有用的模块，因为它所做的只是导入 `time` 模块并打印一个时间戳，但这只是一个开始。

要使用你的函数，像对待任何其他 Python 模块一样对待它。以下是一个小应用，它使用你的 `mymodularity` 软件包来测试 Python `sleep()` 函数的准确性。将此文件保存为 `sleeptest.py`，注意要在 `mymodularity` 文件夹 *之外*，因为如果你将它保存在 `mymodularity` *里面*，那么它将成为你的包中的一个模块，你肯定不希望这样。

```
#!/usr/bin/env python3

import time
from mymodularity import timestamp

print("Testing Python sleep()...")

# modularity
timestamp.Timer()
time.sleep(3)
timestamp.Timer()
```

在这个简单的脚本中，你从 `mymodularity` 包中调用 `timestamp` 模块两次。从包中导入模块时，通常的语法是从包中导入你所需的模块，然后使用 *模块名称 + 一个点 + 要调用的函数名*（例如 `timestamp.Timer()`）。

你调用了两次 `Timer()` 函数，所以如果你的 `timestamp` 模块比这个简单的例子复杂些，那么你将节省大量重复代码。

保存文件并运行：

```
$ python3 ./sleeptest.py
Testing Python sleep()...
Time is 1560711266.1526039
Time is 1560711269.1557732
```

根据测试，Python 中的 `sleep` 函数非常准确：在三秒钟等待之后，时间戳成功且正确地增加了 3，在微秒单位上差距很小。

Python 库的结构看起来可能令人困惑，但其实它并不是什么魔法。Python *被编程* 为一个包含 Python 代码的目录，并附带一个 `__init__.py` 文件，那么这个目录就会被当作一个包，并且 Python 会首先在当前目录中查找可用模块。这就是为什么语句 `from mymodularity import timestamp` 有效的原因：Python 在当前目录查找名为 `mymodularity` 的目录，然后查找 `timestamp.py` 文件。

你在这个例子中所做的功能和以下这个非模块化的版本是一样的：

```
#!/usr/bin/env python3

import time
from mymodularity import timestamp

print("Testing Python sleep()...")

# no modularity
print("Time is " + str(time.time() ) )
time.sleep(3)
print("Time is " + str(time.time() ) )
```

对于这样一个简单的例子，其实没有必要以这种方式编写测试，但是对于编写自己的模块来说，最佳实践是你的代码是通用的，可以将它重用于其他项目。

通过在调用函数时传递信息，可以使代码更通用。例如，假设你想要使用模块来测试的不是 *系统* 的 `sleep` 函数，而是 *用户自己实现* 的 `sleep` 函数，更改 `timestamp` 代码，使它接受一个名为 `msg` 的传入变量，它将是一个字符串，控制每次调用 `timestamp` 时如何显示：

```
#!/usr/bin/env python3

import time

# 更新代码
def Timer(msg):
    print(str(msg) + str(time.time() ) )
```

现在函数比以前更抽象了。它仍会打印时间戳，但是它为用户打印的内容 `msg` 还是未定义的。这意味着你需要在调用函数时定义它。

`Timer` 函数接受的 `msg` 参数是随便命名的，你可以使用参数 `m`、`message` 或 `text`，或是任何对你来说有意义的名称。重要的是，当调用 `timestamp.Timer` 函数时，它接收一个文本作为其输入，将接收到的任何内容放入 `msg` 变量中，并使用该变量完成任务。

以下是一个测试测试用户正确感知时间流逝能力的新程序：

```
#!/usr/bin/env python3

from mymodularity import timestamp

print("Press the RETURN key. Count to 3, and press RETURN again.")

input()
timestamp.Timer("Started timer at ")

print("Count to 3...")

input()
timestamp.Timer("You slept until ")
```

将你的新程序保存为 `response.py`，运行它：

```
$ python3 ./response.py
Press the RETURN key. Count to 3, and press RETURN again.

Started timer at 1560714482.3772075
Count to 3...

You slept until 1560714484.1628013
```

### 函数和所需参数

新版本的 `timestamp` 模块现在 *需要* 一个 `msg` 参数。这很重要，因为你的第一个应用程序将无法运行，因为它没有将字符串传递给 `timestamp.Timer` 函数：

```
$ python3 ./sleeptest.py
Testing Python sleep()...
Traceback (most recent call last):
  File "./sleeptest.py", line 8, in &lt;module&gt;
    timestamp.Timer()
TypeError: Timer() missing 1 required positional argument: 'msg'
```

你能修复你的 `sleeptest.py` 应用程序，以便它能够与更新后的模块一起正确运行吗？

### 变量和函数

通过设计，函数限制了变量的范围。换句话说，如果在函数内创建一个变量，那么这个变量 *只* 在这个函数内起作用。如果你尝试在函数外部使用函数内部出现的变量，就会发生错误。

下面是对 `response.py` 应用程序的修改，尝试从 `timestamp.Timer()` 函数外部打印 `msg` 变量：

```
#!/usr/bin/env python3

from mymodularity import timestamp

print("Press the RETURN key. Count to 3, and press RETURN again.")

input()
timestamp.Timer("Started timer at ")

print("Count to 3...")

input()
timestamp.Timer("You slept for ")

print(msg)
```

试着运行它，查看错误：

```
$ python3 ./response.py
Press the RETURN key. Count to 3, and press RETURN again.

Started timer at 1560719527.7862902
Count to 3...

You slept for 1560719528.135406
Traceback (most recent call last):
  File "./response.py", line 15, in &lt;module&gt;
    print(msg)
NameError: name 'msg' is not defined
```

应用程序返回一个 `NameError` 消息，因为没有定义 `msg`。这看起来令人困惑，因为你编写的代码定义了 `msg`，但你对代码的了解比 Python 更深入。调用函数的代码，不管函数是出现在同一个文件中，还是打包为模块，都不知道函数内部发生了什么。一个函数独立地执行它的计算，并返回你想要它返回的内容。这其中所涉及的任何变量都只是 *本地的*：它们只存在于函数中，并且只存在于函数完成其目的所需时间内。

#### Return 语句

如果你的应用程序需要函数中特定包含的信息，那么使用 `return` 语句让函数在运行后返回有意义的数据。

时间就是金钱，所以修改 `timestamp` 函数，以使其用于一个虚构的收费系统：

```
#!/usr/bin/env python3

import time

def Timer(msg):
    print(str(msg) + str(time.time() ) )
    charge = .02
    return charge
```

现在，`timestamp` 模块每次调用都收费 2 美分，但最重要的是，它返回每次调用时所收取的金额。

以下一个如何使用 `return` 语句的演示：

```
#!/usr/bin/env python3

from mymodularity import timestamp

print("Press RETURN for the time (costs 2 cents).")
print("Press Q RETURN to quit.")

total = 0

while True:
    kbd = input()
    if kbd.lower() == "q":
        print("You owe $" + str(total) )
        exit()
    else:
        charge = timestamp.Timer("Time is ")
        total = total+charge
```

在这个示例代码中，变量 `charge` 为 `timestamp.Timer()` 函数的返回，它接收函数返回的任何内容。在本例中，函数返回一个数字，因此使用一个名为 `total` 的新变量来跟踪已经进行了多少更改。当应用程序收到要退出的信号时，它会打印总花费：

```
$ python3 ./charge.py
Press RETURN for the time (costs 2 cents).
Press Q RETURN to quit.

Time is 1560722430.345412

Time is 1560722430.933996

Time is 1560722434.6027434

Time is 1560722438.612629

Time is 1560722439.3649364
q
You owe $0.1
```

#### 内联函数

函数不必在单独的文件中创建。如果你只是针对一个任务编写一个简短的脚本，那么在同一个文件中编写函数可能更有意义。唯一的区别是你不必导入自己的模块，但函数的工作方式是一样的。以下是时间测试应用程序的最新迭代：

```
#!/usr/bin/env python3

import time

total = 0

def Timer(msg):
    print(str(msg) + str(time.time() ) )
    charge = .02
    return charge

print("Press RETURN for the time (costs 2 cents).")
print("Press Q RETURN to quit.")

while True:
    kbd = input()
    if kbd.lower() == "q":
        print("You owe $" + str(total) )
        exit()
    else:
        charge = Timer("Time is ")
        total = total+charge
```

它没有外部依赖（Python 发行版中包含 `time` 模块），产生与模块化版本相同的结果。它的优点是一切都位于一个文件中，缺点是你不能在其他脚本中使用 `Timer()` 函数，除非你手动复制和粘贴它。

#### 全局变量

在函数外部创建的变量没有限制作用域，因此它被视为 *全局* 变量。

全局变量的一个例子是在 `charge.py` 中用于跟踪当前花费的 `total` 变量。`total` 是在函数之外创建的，因此它绑定到应用程序而不是特定函数。

应用程序中的函数可以访问全局变量，但要将变量传入导入的模块，你必须像发送 `msg` 变量一样将变量传入模块。

全局变量很方便，因为它们似乎随时随地都可用，但也很难跟踪它们，很难知道哪些变量不再需要了但是仍然在系统内存中停留（尽管 Python 有非常好的垃圾收集机制）。

但是，全局变量很重要，因为不是所有的变量都可以是函数或类的本地变量。现在你知道了如何向函数传入变量并获得返回，事情就变得容易了。

### 总结

你已经学到了很多关于函数的知识，所以开始将它们放入你的脚本中 —— 如果它不是作为单独的模块，那么作为代码块，你不必在一个脚本中编写多次。在本系列的下一篇文章中，我将介绍 Python 类。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/get-modular-python-functions

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/xd-deng/users/nhuntwalker/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openstack_python_vim_1.jpg?itok=lHQK5zpm 
[2]: https://www.python.org/
[3]: https://opensource.com/article/17/10/python-10
