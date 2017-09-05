学习用 Python 编程时要避免的 3 个错误
============================================================

> 这些错误会造成很麻烦的问题，需要数小时才能解决。

![学习用 python 编码时要避免的 3 个错误](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/blocks_building.png?itok=q0_Wo8Tr "3 mistakes to avoid when learning to code in Python")  

当你做错事时，承认错误并不是一件容易的事，但是犯错是任何学习过程中的一部分，无论是学习走路，还是学习一种新的编程语言都是这样，比如学习 Python。

为了让初学 Python 的程序员避免犯同样的错误，以下列出了我学习 Python 时犯的三种错误。这些错误要么是我长期以来经常犯的，要么是造成了需要几个小时解决的麻烦。

年轻的程序员们可要注意了，这些错误是会浪费一下午的！

### 1、 可变数据类型作为函数定义中的默认参数

这似乎是对的？你写了一个小函数，比如，搜索当前页面上的链接，并可选将其附加到另一个提供的列表中。

```
def search_for_links(page, add_to=[]):
    new_links = page.search_for_links()
    add_to.extend(new_links)
    return add_to
```

从表面看，这像是十分正常的 Python 代码，事实上它也是，而且是可以运行的。但是，这里有个问题。如果我们给 `add_to` 参数提供了一个列表，它将按照我们预期的那样工作。但是，如果我们让它使用默认值，就会出现一些神奇的事情。

试试下面的代码：

```
def fn(var1, var2=[]):
    var2.append(var1)
    print var2

fn(3)
fn(4)
fn(5)
```

可能你认为我们将看到：

```
[3]
[4]
[5]
```

但实际上，我们看到的却是：

```
[3]
[3, 4]
[3, 4, 5]
```

为什么呢？如你所见，每次都使用的是同一个列表，输出为什么会是这样？在 Python 中，当我们编写这样的函数时，这个列表被实例化为函数定义的一部分。当函数运行时，它并不是每次都被实例化。这意味着，这个函数会一直使用完全一样的列表对象，除非我们提供一个新的对象：

```
fn(3, [4])
```

```
[4, 3]
```

答案正如我们所想的那样。要想得到这种结果，正确的方法是：

```
def fn(var1, var2=None):
    if not var2:
        var2 = []
    var2.append(var1)
```

或是在第一个例子中：

```
def search_for_links(page, add_to=None):
    if not add_to:
        add_to = []
    new_links = page.search_for_links()
    add_to.extend(new_links)
    return add_to
```

这将在模块加载的时候移走实例化的内容，以便每次运行函数时都会发生列表实例化。请注意，对于不可变数据类型，比如[**元组**][7]、[**字符串**][8]、[**整型**][9]，是不需要考虑这种情况的。这意味着，像下面这样的代码是非常可行的：

```
def func(message="my message"):
    print message
```

### 2、 可变数据类型作为类变量

这和上面提到的最后一个错误很相像。思考以下代码：

```
class URLCatcher(object):
    urls = []

    def add_url(self, url):
        self.urls.append(url)
```

这段代码看起来非常正常。我们有一个储存 URL 的对象。当我们调用 add_url 方法时，它会添加一个给定的 URL 到存储中。看起来非常正确吧？让我们看看实际是怎样的：

```
a = URLCatcher()
a.add_url('http://www.google.com')
b = URLCatcher()
b.add_url('http://www.bbc.co.hk')
```

b.urls：

```
['http://www.google.com', 'http://www.bbc.co.uk']
```

a.urls：

```
['http://www.google.com', 'http://www.bbc.co.uk']
```

等等，怎么回事？！我们想的不是这样啊。我们实例化了两个单独的对象 `a` 和 `b`。把一个 URL 给了 `a`，另一个给了 `b`。这两个对象怎么会都有这两个 URL 呢？

这和第一个错例是同样的问题。创建类定义时，URL 列表将被实例化。该类所有的实例使用相同的列表。在有些时候这种情况是有用的，但大多数时候你并不想这样做。你希望每个对象有一个单独的储存。为此，我们修改代码为：

```
class URLCatcher(object):
    def __init__(self):
        self.urls = []

    def add_url(self, url):
        self.urls.append(url)
```

现在，当创建对象时，URL 列表被实例化。当我们实例化两个单独的对象时，它们将分别使用两个单独的列表。

### 3、 可变的分配错误

这个问题困扰了我一段时间。让我们做出一些改变，并使用另一种可变数据类型 - [**字典**][10]。

```
a = {'1': "one", '2': 'two'}
```

现在，假设我们想把这个字典用在别的地方，且保持它的初始数据完整。

```
b = a

b['3'] = 'three'
``` 

简单吧？

现在，让我们看看原来那个我们不想改变的字典 `a`：

```
{'1': "one", '2': 'two', '3': 'three'}
```

哇等一下，我们再看看 **b**？

```
{'1': "one", '2': 'two', '3': 'three'}
```

等等，什么？有点乱……让我们回想一下，看看其它不可变类型在这种情况下会发生什么，例如一个**元组**：

```
c = (2, 3)
d = c
d = (4, 5)
```

现在 `c` 是 `(2, 3)`，而 `d` 是 `(4, 5)`。

这个函数结果如我们所料。那么，在之前的例子中到底发生了什么？当使用可变类型时，其行为有点像 **C** 语言的一个指针。在上面的代码中，我们令 `b = a`，我们真正表达的意思是：`b` 成为 `a` 的一个引用。它们都指向 Python 内存中的同一个对象。听起来有些熟悉？那是因为这个问题与先前的相似。其实，这篇文章应该被称为「可变引发的麻烦」。

列表也会发生同样的事吗？是的。那么我们如何解决呢？这必须非常小心。如果我们真的需要复制一个列表进行处理，我们可以这样做：

```
b = a[:]
```

这将遍历并复制列表中的每个对象的引用，并且把它放在一个新的列表中。但是要注意：如果列表中的每个对象都是可变的，我们将再次获得它们的引用，而不是完整的副本。

假设在一张纸上列清单。在原来的例子中相当于，A 某和 B 某正在看着同一张纸。如果有个人修改了这个清单，两个人都将看到相同的变化。当我们复制引用时，每个人现在有了他们自己的清单。但是，我们假设这个清单包括寻找食物的地方。如果“冰箱”是列表中的第一个，即使它被复制，两个列表中的条目也都指向同一个冰箱。所以，如果冰箱被 A 修改，吃掉了里面的大蛋糕，B 也将看到这个蛋糕的消失。这里没有简单的方法解决它。只要你记住它，并编写代码的时候，使用不会造成这个问题的方式。

字典以相同的方式工作，并且你可以通过以下方式创建一个昂贵副本：

```
b = a.copy()
```

再次说明，这只会创建一个新的字典，指向原来存在的相同的条目。因此，如果我们有两个相同的列表，并且我们修改字典 `a` 的一个键指向的可变对象，那么在字典 b 中也将看到这些变化。

可变数据类型的麻烦也是它们强大的地方。以上都不是实际中的问题；它们是一些要注意防止出现的问题。在第三个项目中使用昂贵复制操作作为解决方案在 99% 的时候是没有必要的。你的程序或许应该被改改，所以在第一个例子中，这些副本甚至是不需要的。

_编程快乐！在评论中可以随时提问。_

（题图： opensource.com）

--------------------------------------------------------------------------------

作者简介：

Pete Savage - Peter 是一位充满激情的开源爱好者，在过去十年里一直在推广和使用开源产品。他从 Ubuntu 社区开始，在许多不同的领域自愿参与音频制作领域的研究工作。在职业经历方面，他起初作为公司的系统管理员，大部分时间在管理和建立数据中心，之后在 Red Hat 担任 CloudForms 产品的主要测试工程师。

-----------------

via: https://opensource.com/article/17/6/3-things-i-did-wrong-learning-python

作者：[Pete Savage][a]
译者：[polebug](https://github.com/polebug)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/psav
[1]:https://opensource.com/article/17/6/3-things-i-did-wrong-learning-python?rate=SfClhaQ6tQsJdKM8-YTNG00w53fsncvsNWafwuJbtqs
[2]:http://www.google.com/
[3]:http://www.bbc.co.uk/
[4]:http://www.google.com/
[5]:http://www.bbc.co.uk/
[6]:https://opensource.com/user/36026/feed
[7]:https://docs.python.org/2/library/functions.html?highlight=tuple#tuple
[8]:https://docs.python.org/2/library/string.html
[9]:https://docs.python.org/2/library/functions.html#int
[10]:https://docs.python.org/2/library/stdtypes.html?highlight=dict#dict
[11]:https://opensource.com/users/psav
[12]:https://opensource.com/article/17/6/3-things-i-did-wrong-learning-python#comments
