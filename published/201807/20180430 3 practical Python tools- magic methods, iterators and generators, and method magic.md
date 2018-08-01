日常 Python 编程优雅之道
======

> 3 个可以使你的 Python 代码更优雅、可读、直观和易于维护的工具。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/serving-bowl-forks-dinner.png?itok=a3YqPwr5)

Python 提供了一组独特的工具和语言特性来使你的代码更加优雅、可读和直观。为正确的问题选择合适的工具，你的代码将更易于维护。在本文中，我们将研究其中的三个工具：魔术方法、迭代器和生成器，以及方法魔术。

### 魔术方法

魔术方法可以看作是 Python 的管道。它们被称为“底层”方法，用于某些内置的方法、符号和操作。你可能熟悉的常见魔术方法是 `__init__()`，当我们想要初始化一个类的新实例时，它会被调用。

你可能已经看过其他常见的魔术方法，如 `__str__` 和 `__repr__`。Python 中有一整套魔术方法，通过实现其中的一些方法，我们可以修改一个对象的行为，甚至使其行为类似于内置数据类型，例如数字、列表或字典。

让我们创建一个 `Money` 类来示例：

```
class Money:

    currency_rates = {
        '$': 1,
        '€': 0.88,
    }

    def __init__(self, symbol, amount):
        self.symbol = symbol
        self.amount = amount

    def __repr__(self):
        return '%s%.2f' % (self.symbol, self.amount)

    def convert(self, other):
        """ Convert other amount to our currency """
        new_amount = (
            other.amount / self.currency_rates[other.symbol]
            * self.currency_rates[self.symbol])

        return Money(self.symbol, new_amount)
```

该类定义为给定的货币符号和汇率定义了一个货币汇率，指定了一个初始化器（也称为构造函数），并实现 `__repr__`，因此当我们打印这个类时，我们会看到一个友好的表示，例如 `$2.00` ，这是一个带有货币符号和金额的 `Money('$', 2.00)` 实例。最重要的是，它定义了一种方法，允许你使用不同的汇率在不同的货币之间进行转换。

打开 Python shell，假设我们已经定义了使用两种不同货币的食品的成本，如下所示：

```
>>> soda_cost = Money('$', 5.25)
>>> soda_cost
    $5.25

>>> pizza_cost = Money('€', 7.99)
>>> pizza_cost
    €7.99
```

我们可以使用魔术方法使得这个类的实例之间可以相互交互。假设我们希望能够将这个类的两个实例一起加在一起，即使它们是不同的货币。为了实现这一点，我们可以在 `Money` 类上实现 `__add__` 这个魔术方法：

```
class Money:

    # ... previously defined methods ...

    def __add__(self, other):
        """ Add 2 Money instances using '+' """
        new_amount = self.amount + self.convert(other).amount
        return Money(self.symbol, new_amount)
```

现在我们可以以非常直观的方式使用这个类：

```
>>> soda_cost = Money('$', 5.25)
>>> pizza_cost = Money('€', 7.99)
>>> soda_cost + pizza_cost
    $14.33
>>> pizza_cost + soda_cost
    €12.61
```

当我们将两个实例加在一起时，我们得到以第一个定义的货币符号所表示的结果。所有的转换都是在底层无缝完成的。如果我们想的话，我们也可以为减法实现 `__sub__`，为乘法实现 `__mul__` 等等。阅读[模拟数字类型][1]或[魔术方法指南][2]来获得更多信息。

我们学习到 `__add__` 映射到内置运算符 `+`。其他魔术方法可以映射到像 `[]` 这样的符号。例如，在字典中通过索引或键来获得一项，其实是使用了 `__getitem__` 方法：

```
>>> d = {'one': 1, 'two': 2}
>>> d['two']
2
>>> d.__getitem__('two')
2
``` 

一些魔术方法甚至映射到内置函数，例如 `__len__()` 映射到 `len()`。

```
class Alphabet:
    letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    def __len__(self):
        return len(self.letters)

>>> my_alphabet = Alphabet()
>>> len(my_alphabet)
    26
```

### 自定义迭代器

对于新的和经验丰富的 Python 开发者来说，自定义迭代器是一个非常强大的但令人迷惑的主题。

许多内置类型，例如列表、集合和字典，已经实现了允许它们在底层迭代的协议。这使我们可以轻松地遍历它们。

```
>>> for food in ['Pizza', 'Fries']:

         print(food + '. Yum!')

Pizza. Yum!
Fries. Yum!
```

我们如何迭代我们自己的自定义类？首先，让我们来澄清一些术语。

  * 要成为一个可迭代对象，一个类需要实现 `__iter__()`
  * `__iter__()` 方法需要返回一个迭代器
  * 要成为一个迭代器，一个类需要实现 `__next__()`（或[在 Python 2][3]中是 `next()`），当没有更多的项要迭代时，必须抛出一个 `StopIteration` 异常。

呼！这听起来很复杂，但是一旦你记住了这些基本概念，你就可以在任何时候进行迭代。

我们什么时候想使用自定义迭代器？让我们想象一个场景，我们有一个 `Server` 实例在不同的端口上运行不同的服务，如 `http` 和 `ssh`。其中一些服务处于 `active` 状态，而其他服务则处于 `inactive` 状态。

```
class Server:

    services = [
        {'active': False, 'protocol': 'ftp', 'port': 21},
        {'active': True, 'protocol': 'ssh', 'port': 22},
        {'active': True, 'protocol': 'http', 'port': 80},
    ]
```

当我们遍历 `Server` 实例时，我们只想遍历那些处于 `active` 的服务。让我们创建一个 `IterableServer` 类：

```
class IterableServer:
    def __init__(self):
        self.current_pos = 0
    def __next__(self):
        pass  # TODO: 实现并记得抛出 StopIteration
```

首先，我们将当前位置初始化为 `0`。然后，我们定义一个 `__next__()` 方法来返回下一项。我们还将确保在没有更多项返回时抛出 `StopIteration`。到目前为止都很好！现在，让我们实现这个 `__next__()` 方法。

```
class IterableServer:
    def __init__(self):
        self.current_pos = 0.  # 我们初始化当前位置为 0
    def __iter__(self):  # 我们可以在这里返回 self，因为实现了 __next__
        return self
    def __next__(self):
        while self.current_pos < len(self.services):
            service = self.services[self.current_pos]
            self.current_pos += 1
            if service['active']:
                return service['protocol'], service['port']
        raise StopIteration
    next = __next__  # 可选的 Python2 兼容性
```

我们对列表中的服务进行遍历，而当前的位置小于服务的个数，但只有在服务处于活动状态时才返回。一旦我们遍历完服务，就会抛出一个 `StopIteration` 异常。


因为我们实现了 `__next__()` 方法，当它耗尽时，它会抛出 `StopIteration`。我们可以从 `__iter__()` 返回 `self`，因为 `IterableServer` 类遵循 `iterable` 协议。

现在我们可以遍历一个 `IterableServer` 实例，这将允许我们查看每个处于活动的服务，如下所示：

```
>>> for protocol, port in IterableServer():

        print('service %s is running on port %d' % (protocol, port))

service ssh is running on port 22

service http is running on port 21

```

太棒了，但我们可以做得更好！在这样类似的实例中，我们的迭代器不需要维护大量的状态，我们可以简化代码并使用 [generator（生成器）][4] 来代替。

```
class Server:
    services = [
        {'active': False, 'protocol': 'ftp', 'port': 21},
        {'active': True, 'protocol': 'ssh', 'port': 22},
        {'active': True, 'protocol': 'http', 'port': 21},
    ]
    def __iter__(self):
        for service in self.services:
            if service['active']:
                yield service['protocol'], service['port']
```

`yield` 关键字到底是什么？在定义生成器函数时使用 yield。这有点像 `return`，虽然 `return` 在返回值后退出函数，但 `yield` 会暂停执行直到下次调用它。这允许你的生成器的功能在它恢复之前保持状态。查看 [yield 的文档][5]以了解更多信息。使用生成器，我们不必通过记住我们的位置来手动维护状态。生成器只知道两件事：它现在需要做什么以及计算下一个项目需要做什么。一旦我们到达执行点，即 `yield` 不再被调用，我们就知道停止迭代。

这是因为一些内置的 Python 魔法。在 [Python 关于 `__iter__()` 的文档][6]中我们可以看到，如果 `__iter__()` 是作为一个生成器实现的，它将自动返回一个迭代器对象，该对象提供 `__iter__()` 和 `__next__()` 方法。阅读这篇很棒的文章，深入了解[迭代器，可迭代对象和生成器][7]。

### 方法魔法

由于其独特的方面，Python 提供了一些有趣的方法魔法作为语言的一部分。

其中一个例子是别名功能。因为函数只是对象，所以我们可以将它们赋值给多个变量。例如：

```
>>> def foo():
       return 'foo'
>>> foo()
'foo'
>>> bar = foo
>>> bar()
'foo'
```

我们稍后会看到它的作用。

Python 提供了一个方便的内置函数[称为 `getattr()`][8]，它接受 `object, name, default` 参数并在 `object` 上返回属性 `name`。这种编程方式允许我们访问实例变量和方法。例如：

```
>>> class Dog:
        sound = 'Bark'
        def speak(self):
            print(self.sound + '!', self.sound + '!')

>>> fido = Dog()

>>> fido.sound
'Bark'
>>> getattr(fido, 'sound')
'Bark'

>>> fido.speak
<bound method Dog.speak of <__main__.Dog object at 0x102db8828>>
>>> getattr(fido, 'speak')
<bound method Dog.speak of <__main__.Dog object at 0x102db8828>>


>>> fido.speak()
Bark! Bark!
>>> speak_method = getattr(fido, 'speak')
>>> speak_method()
Bark! Bark!
```

这是一个很酷的技巧，但是我们如何在实际中使用 `getattr` 呢？让我们看一个例子，我们编写一个小型命令行工具来动态处理命令。

```
class Operations:
    def say_hi(self, name):
        print('Hello,', name)
    def say_bye(self, name):
        print ('Goodbye,', name)
    def default(self, arg):
        print ('This operation is not supported.')

if __name__ == '__main__':
    operations = Operations()
    # 假设我们做了错误处理
    command, argument = input('> ').split()
    func_to_call = getattr(operations, command, operations.default)
    func_to_call(argument)
```

脚本的输出是：

```
$ python getattr.py
> say_hi Nina
Hello, Nina
> blah blah
This operation is not supported.
```

接下来，我们来看看 `partial`。例如，`functool.partial(func, *args, **kwargs)` 允许你返回一个新的 [partial 对象][9]，它的行为类似 `func`，参数是 `args` 和 `kwargs`。如果传入更多的 `args`，它们会被附加到 `args`。如果传入更多的 `kwargs`，它们会扩展并覆盖 `kwargs`。让我们通过一个简短的例子来看看：

```
>>> from functools import partial
>>> basetwo = partial(int, base=2)
>>> basetwo
<functools.partial object at 0x1085a09f0>
>>> basetwo('10010')
18

# 这等同于
>>> int('10010', base=2)
``` 

让我们看看在我喜欢的一个[名为 `agithub`][10] 的库中的一些示例代码中，这个方法魔术是如何结合在一起的，这是一个（名字起得很 low 的） REST API 客户端，它具有透明的语法，允许你以最小的配置快速构建任何 REST API 原型（不仅仅是 GitHub）。我发现这个项目很有趣，因为它非常强大，但只有大约 400 行 Python 代码。你可以在大约 30 行配置代码中添加对任何 REST API 的支持。`agithub` 知道协议所需的一切（`REST`、`HTTP`、`TCP`），但它不考虑上游 API。让我们深入到它的实现中。

以下是我们如何为 GitHub API 和任何其他相关连接属性定义端点 URL 的简化版本。在这里查看[完整代码][11]。

```
class GitHub(API):
    def __init__(self, token=None, *args, **kwargs):
        props = ConnectionProperties(api_url = kwargs.pop('api_url', 'api.github.com'))
        self.setClient(Client(*args, **kwargs))
        self.setConnectionProperties(props)
```

然后，一旦配置了[访问令牌][12]，就可以开始使用 [GitHub API][13]。

```
>>> gh = GitHub('token')
>>> status, data = gh.user.repos.get(visibility='public', sort='created')
>>> # ^ 映射到 GET /user/repos
>>> data
... ['tweeter', 'snipey', '...']
```

请注意，你要确保 URL 拼写正确，因为我们没有验证 URL。如果 URL 不存在或出现了其他任何错误，将返回 API 抛出的错误。那么，这一切是如何运作的呢？让我们找出答案。首先，我们将查看一个 [`API` 类][14]的简化示例：

```
class API:
    # ... other methods ...
    def __getattr__(self, key):
        return IncompleteRequest(self.client).__getattr__(key)
    __getitem__ = __getattr__
```

在 `API` 类上的每次调用都会调用 [`IncompleteRequest` 类][15]作为指定的 `key`。

```
class IncompleteRequest:
    # ... other methods ...
    def __getattr__(self, key):
        if key in self.client.http_methods:
            htmlMethod = getattr(self.client, key)
            return partial(htmlMethod, url=self.url)
        else:
            self.url += '/' + str(key)
            return self
    __getitem__ = __getattr__

class Client:
    http_methods = ('get')  # 还有 post, put, patch 等等。
    def get(self, url, headers={}, **params):
        return self.request('GET', url, None, headers)
```

如果最后一次调用不是 HTTP 方法（如 `get`、`post` 等），则返回带有附加路径的 `IncompleteRequest`。否则，它从[`Client` 类][16]获取 HTTP 方法对应的正确函数，并返回 `partial`。

如果我们给出一个不存在的路径会发生什么？

```
>>> status, data = this.path.doesnt.exist.get()
>>> status
... 404
```

因为 `__getattr__` 别名为 `__getitem__`：

```
>>> owner, repo = 'nnja', 'tweeter'
>>> status, data = gh.repos[owner][repo].pulls.get()
>>> # ^ Maps to GET /repos/nnja/tweeter/pulls
>>> data
.... # {....}
```

这真心是一些方法魔术！

### 了解更多

Python 提供了大量工具，使你的代码更优雅，更易于阅读和理解。挑战在于找到合适的工具来完成工作，但我希望本文为你的工具箱添加了一些新工具。而且，如果你想更进一步，你可以在我的博客 [nnja.io][17] 上阅读有关装饰器、上下文管理器、上下文生成器和命名元组的内容。随着你成为一名更好的 Python 开发人员，我鼓励你到那里阅读一些设计良好的项目的源代码。[Requests][18] 和 [Flask][19] 是两个很好的起步的代码库。


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/elegant-solutions-everyday-python-problems

作者：[Nina Zakharenko][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/nnja
[1]:https://docs.python.org/3/reference/datamodel.html#emulating-numeric-types
[2]:https://rszalski.github.io/magicmethods/
[3]:https://docs.python.org/2/library/stdtypes.html#iterator.next
[4]:https://docs.python.org/3/library/stdtypes.html#generator-types
[5]:https://docs.python.org/3/reference/expressions.html#yieldexpr
[6]:https://docs.python.org/3/reference/datamodel.html#object.__iter__
[7]:http://nvie.com/posts/iterators-vs-generators/
[8]:https://docs.python.org/3/library/functions.html#getattr
[9]:https://docs.python.org/3/library/functools.html#functools.partial
[10]:https://github.com/mozilla/agithub
[11]:https://github.com/mozilla/agithub/blob/master/agithub/GitHub.py
[12]:https://github.com/settings/tokens
[13]:https://developer.github.com/v3/repos/#list-your-repositories
[14]:https://github.com/mozilla/agithub/blob/dbf7014e2504333c58a39153aa11bbbdd080f6ac/agithub/base.py#L30-L58
[15]:https://github.com/mozilla/agithub/blob/dbf7014e2504333c58a39153aa11bbbdd080f6ac/agithub/base.py#L60-L100
[16]:https://github.com/mozilla/agithub/blob/dbf7014e2504333c58a39153aa11bbbdd080f6ac/agithub/base.py#L102-L231
[17]:http://nnja.io
[18]:https://github.com/requests/requests
[19]:https://github.com/pallets/flask
[20]:https://us.pycon.org/2018/schedule/presentation/164/
[21]:https://us.pycon.org/2018/
