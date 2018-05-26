更深入的理解 Python 中的迭代
====

> 深入探讨 Python 的 `for` 循环来看看它们在底层如何工作，以及为什么它们会按照它们的方式工作。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pez-candy.png?itok=tRoOn_iy)

Python 的 `for` 循环不会像其他语言中的 `for` 循环那样工作。在这篇文章中，我们将深入探讨 Python 的 `for` 循环来看看它们在底层如何工作，以及为什么它们会按照它们的方式工作。

### 循环的问题

我们将通过看一些“陷阱”开始我们的旅程，在我们了解循环如何在 Python 中工作之后，我们将再次看看这些问题并解释发生了什么。

#### 问题 1：循环两次

假设我们有一个数字列表和一个生成器，生成器会返回这些数字的平方：

```
>>> numbers = [1, 2, 3, 5, 7]
>>> squares = (n**2 for n in numbers)
```

我们可以将生成器对象传递给 `tuple` 构造器，从而使其变为一个元组：

```
>>> tuple(squares)
(1, 4, 9, 25, 49)
```

如果我们使用相同的生成器对象并将其传给 `sum` 函数，我们可能会期望得到这些数的和，即 `88`。

```
>>> sum(squares)
0
```

但是我们得到了 `0`。

#### 问题 2：包含的检查

让我们使用相同的数字列表和相同的生成器对象：

```
>>> numbers = [1, 2, 3, 5, 7]

>>> squares = (n**2 for n in numbers)

```

如果我们询问 `9` 是否在 `squares` 生成器中，Python 将会告诉我们 9 在 `squares` 中。但是如果我们再次询问相同的问题，Python 会告诉我们 9 不在 `squares` 中。

```
>>> 9 in squares
True
>>> 9 in squares
False
```

我们询问相同的问题两次，Python 给了两个不同的答案。

#### 问题 3 ：拆包

这个字典有两个键值对：

```
>>> counts = {'apples': 2, 'oranges': 1}
```

让我们使用多个变量来对这个字典进行拆包：

```
>>> x, y = counts
```

你可能会期望当我们对这个字典进行拆包时，我们会得到键值对或者得到一个错误。

但是解包字典不会引发错误，也不会返回键值对。当你解包一个字典时，你会得到键：

```
>>> x
'apples'
```

### 回顾：Python 的 for 循环

在我们了解一些关于这些 Python 片段的逻辑之后，我们将回到这些问题。

Python 没有传统的 `for` 循环。为了解释我的意思，让我们看一看另一种编程语言的 `for` 循环。

这是一种传统 C 风格的 `for` 循环，用 JavaScript 编写：

```
let numbers = [1, 2, 3, 5, 7];
for (let i = 0; i < numbers.length; i += 1) {
    print(numbers[i])
}
```

JavaScript、 C、 C++、 Java、 PHP 和一大堆其他编程语言都有这种风格的 `for` 循环，但是 Python **确实没有**。

Python **确实没有** 传统 C 风格的 `for` 循环。在 Python 中确实有一些我们称之为 `for` 循环的东西，但是它的工作方式类似于 [foreach 循环][1]。

这是 Python 的 `for` 循环的风格：

```
numbers = [1, 2, 3, 5, 7]
for n in numbers:
    print(n)
```

与传统 C 风格的 `for` 循环不同，Python 的 `for` 循环没有索引变量，没有索引变量初始化，边界检查，或者索引递增。Python 的 `for` 循环完成了对我们的 `numbers` 列表进行遍历的所有工作。

因此，当我们在 Python 中确实有 `for` 循环时，我们没有传统 C 风格的 `for` 循环。我们称之为 for 循环的东西的工作机制与之相比有很大的不同。

### 定义：可迭代和序列

既然我们已经解决了 Python 世界中无索引的 `for` 循环，那么让我们在此之外来看一些定义。

**可迭代**是任何你可以用 Python 中的 `for` 循环遍历的东西。可迭代意味着可以遍历，任何可以遍历的东西都是可迭代的。

```
for item in some_iterable:
    print(item)
```

序列是一种非常常见的可迭代类型，列表，元组和字符串都是序列。

```
>>> numbers = [1, 2, 3, 5, 7]
>>> coordinates = (4, 5, 7)
>>> words = "hello there"
```

序列是可迭代的，它有一些特定的特征集。它们可以从 `0` 开始索引，以小于序列的长度结束，它们有一个长度并且它们可以被切分。列表，元组，字符串和其他所有序列都是这样工作的。

```
>>> numbers[0]
1
>>> coordinates[2]
7
>>> words[4]
'o'
```

Python 中很多东西都是可迭代的，但不是所有可迭代的东西都是序列。集合、字典、文件和生成器都是可迭代的，但是它们都不是序列。

```
>>> my_set = {1, 2, 3}
>>> my_dict = {'k1': 'v1', 'k2': 'v2'}
>>> my_file = open('some_file.txt')
>>> squares = (n**2 for n in my_set)
```

因此，任何可以用 `for` 循环遍历的东西都是可迭代的，序列只是一种可迭代的类型，但是 Python 也有许多其他种类的迭代器。

### Python 的 for 循环不使用索引

你可能认为，Python 的 `for` 循环在底层使用了索引进行循环。在这里我们使用 `while` 循环和索引手动遍历：

```
numbers = [1, 2, 3, 5, 7]
i = 0
while i < len(numbers):
    print(numbers[i])
    i += 1
```

这适用于列表，但它不会对所有东西都起作用。这种循环方式**只适用于序列**。

如果我们尝试用索引去手动遍历一个集合，我们会得到一个错误：

```
>>> fruits = {'lemon', 'apple', 'orange', 'watermelon'}
>>> i = 0
>>> while i < len(fruits):
...     print(fruits[i])
...     i += 1
...
Traceback (most recent call last):
File "<stdin>", line 2, in <module>
TypeError: 'set' object does not support indexing
```

集合不是序列，所以它们不支持索引。

我们不能使用索引手动对 Python 中的每一个迭代对象进行遍历。对于那些不是序列的迭代器来说，这是行不通的。

### 迭代器驱动 for 循环

因此，我们已经看到，Python 的 `for` 循环在底层不使用索引。相反，Python 的 `for` 循环使用**迭代器**。

迭代器就是可以驱动可迭代对象的东西。你可以从任何可迭代对象中获得迭代器，你也可以使用迭代器来手动对它的迭代进行遍历。

让我们来看看它是如何工作的。

这里有三个可迭代对象：一个集合，一个元组和一个字符串。

```
>>> numbers = {1, 2, 3, 5, 7}
>>> coordinates = (4, 5, 7)
>>> words = "hello there"
```

我们可以使用 Python 的内置 `iter` 函数来访问这些迭代器，将一个迭代器传递给 `iter` 函数总会给我们返回一个迭代器，无论我们正在使用哪种类型的迭代器。

```
>>> iter(numbers)
<set_iterator object at 0x7f2b9271c860>
>>> iter(coordinates)
<tuple_iterator object at 0x7f2b9271ce80>
>>> iter(words)
<str_iterator object at 0x7f2b9271c860>
```

一旦我们有了迭代器，我们可以做的事情就是通过将它传递给内置的 `next` 函数来获取它的下一项。

```
>>> numbers = [1, 2, 3]
>>> my_iterator = iter(numbers)
>>> next(my_iterator)
1
>>> next(my_iterator)
2
```

迭代器是有状态的，这意味着一旦你从它们中消耗了一项，它就消失了。

如果你从迭代器中请求 `next` 项，但是其中没有更多的项了，你将得到一个 `StopIteration` 异常：

```
>>> next(my_iterator)
3
>>> next(my_iterator)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
StopIteration
```

所以你可以从每个迭代中获得一个迭代器，迭代器唯一能做的事情就是用 `next` 函数请求它们的下一项。如果你将它们传递给 `next`，但它们没有下一项了，那么就会引发 `StopIteration` 异常。

你可以将迭代器想象成 Pez 分配器（LCTT 译注：Pez 是一个结合玩具的独特复合式糖果），不能重新分配。你可以把 Pez 拿出去，但是一旦 Pez 被移走，它就不能被放回去，一旦分配器空了，它就没用了。

### 没有 for 的循环

既然我们已经了解了迭代器和 `iter` 以及 `next` 函数，我们将尝试在不使用 `for` 循环的情况下手动遍历迭代器。

我们将通过尝试将这个 `for` 循环变为 `while` 循环：

```
def funky_for_loop(iterable, action_to_do):
    for item in iterable:
        action_to_do(item)
```

为了做到这点，我们需要：

1. 从给定的可迭代对象中获得迭代器
2. 反复从迭代器中获得下一项
3. 如果我们成功获得下一项，就执行 `for` 循环的主体
4. 如果我们在获得下一项时得到了一个 `StopIteration` 异常，那么就停止循环
```

def funky_for_loop(iterable, action_to_do):
    iterator = iter(iterable)
    done_looping = False
    while not done_looping:
        try:
            item = next(iterator)
        except StopIteration:
            done_looping = True
        else:
            action_to_do(item)
```

我们只是通过使用 `while` 循环和迭代器重新定义了 `for` 循环。

上面的代码基本上定义了 Python 在底层循环的工作方式。如果你理解内置的 `iter` 和 `next` 函数的遍历循环的工作方式，那么你就会理解 Python 的 `for` 循环是如何工作的。

事实上，你不仅仅会理解 `for` 循环在 Python 中是如何工作的，所有形式的遍历一个可迭代对象都是这样工作的。

<ruby>迭代器协议<rt>iterator protocol</rt></ruby> 是一种很好表示 “在 Python 中遍历迭代器是如何工作的”的方式。它本质上是对 `iter` 和 `next` 函数在 Python 中是如何工作的定义。Python 中所有形式的迭代都是由迭代器协议驱动的。

迭代器协议被 `for` 循环使用（正如我们已经看到的那样）：

```
for n in numbers:
    print(n)
```

多重赋值也使用迭代器协议：

```
x, y, z = coordinates
```

星型表达式也是用迭代器协议：

```
a, b, *rest = numbers
print(*numbers)
```

许多内置函数依赖于迭代器协议：

```
unique_numbers = set(numbers)
```

在 Python 中任何与迭代器一起工作的东西都可能以某种方式使用迭代器协议。每当你在 Python 中遍历一个可迭代对象时，你将依赖于迭代器协议。

### 生成器是迭代器

所以你可能会想：迭代器看起来很酷，但它们看起来像一个实现细节，我们作为 Python 的使用者，可能不需要关心它们。

我有消息告诉你：在 Python 中直接使用迭代器是很常见的。

这里的 `squares` 对象是一个生成器：

```
>>> numbers = [1, 2, 3]
>>> squares = (n**2 for n in numbers)
```

生成器是迭代器，这意味着你可以在生成器上调用 `next` 来获得它的下一项：

```
>>> next(squares)
1
>>> next(squares)
4
```

但是如果你以前用过生成器，你可能也知道可以循环遍历生成器：

```
>>> squares = (n**2 for n in numbers)
>>> for n in squares:
...     print(n)
...
1
4
9
```

如果你可以在 Python 中循环遍历某些东西，那么它就是**可迭代的**。

所以**生成器是迭代器**，但是生成器也是可迭代的，这又是怎么回事呢？

### 我欺骗了你

所以在我之前解释迭代器如何工作时，我跳过了它们的某些重要的细节。

#### 生成器是可迭代的

我再说一遍：Python 中的每一个迭代器都是可迭代的，意味着你可以循环遍历迭代器。

因为迭代器也是可迭代的，所以你可以使用内置 `next` 函数从可迭代对象中获得迭代器：

```
>>> numbers = [1, 2, 3]
>>> iterator1 = iter(numbers)
>>> iterator2 = iter(iterator1)
```

请记住，当我们在可迭代对象上调用 `iter` 时，它会给我们返回一个迭代器。

当我们在迭代器上调用 `iter` 时，它会给我们返回它自己：

```
>>> iterator1 is iterator2
True
```

迭代器是可迭代的，所有的迭代器都是它们自己的迭代器。

```
def is_iterator(iterable):
    return iter(iterable) is iterable
```

迷惑了吗？

让我们回顾一些这些措辞。

* 一个**可迭代对象**是你可以迭代的东西
* 一个**迭代对象器**是一种实际上遍历可迭代对象的代理

此外，在 Python 中迭代器也是可迭代的，它们充当它们自己的迭代器。

所以迭代器是可迭代的，但是它们没有一些可迭代对象拥有的各种特性。

迭代器没有长度，它们不能被索引：

```
>>> numbers = [1, 2, 3, 5, 7]
>>> iterator = iter(numbers)
>>> len(iterator)
TypeError: object of type 'list_iterator' has no len()
>>> iterator[0]
TypeError: 'list_iterator' object is not subscriptable
```

从我们作为 Python 程序员的角度来看，你可以使用迭代器来做的唯一有用的事情是将其传递给内置的 `next` 函数，或者对其进行循环遍历：

```
>>> next(iterator)
1
>>> list(iterator)
[2, 3, 5, 7]
```

如果我们第二次循环遍历迭代器，我们将一无所获：

```
>>> list(iterator)
[]
```

你可以把迭代器看作是**惰性迭代器**，它们是**一次性使用**，这意味着它们只能循环遍历一次。

正如你在下面的真值表中所看到的，可迭代对象并不总是迭代器，但是迭代器总是可迭代的：


对象 | 可迭代？ | 迭代器？ 
---------|---------|------
可迭代对象 |  V | ?
迭代器  | V | V
生成器  | V | V
列表 | V | X


### 全部的迭代器协议

让我们从 Python 的角度来定义迭代器是如何工作的。

可迭代对象可以被传递给 `iter` 函数，以便为它们获得迭代器。

迭代器：

* 可以传递给 `next` 函数，它将给出下一项，如果没有下一项，那么它将会引发 `StopIteration` 异常
* 可以传递给 `iter` 函数，它会返回一个自身的迭代器

这些语句反过来也是正确的：

* 任何可以在不引发 `TypeError` 异常的情况下传递给 `iter` 的东西都是可迭代的
* 任何可以在不引发 `TypeError` 异常的情况下传递给 `next` 的东西都是一个迭代器
* 当传递给 `iter` 时，任何返回自身的东西都是一个迭代器

这就是 Python 中的迭代器协议。

#### 迭代器的惰性

迭代器允许我们一起工作，创建**惰性可迭代对象**，即在我们要求它们提供下一项之前，它们不做任何事情。因为可以创建惰性迭代器，所以我们可以创建无限长的迭代器。我们可以创建对系统资源比较保守的迭代器，可以节省我们的内存，节省 CPU 时间。

### 迭代器无处不在

你已经在 Python 中看到过许多迭代器，我也提到过生成器是迭代器。Python 的许多内置类型也是迭代器。例如，Python 的 `enumerate` 和 `reversed` 对象就是迭代器。

```
>>> letters = ['a', 'b', 'c']
>>> e = enumerate(letters)
>>> e
<enumerate object at 0x7f112b0e6510>
>>> next(e)
(0, 'a')
```

在 Python 3 中，`zip`, `map` 和 `filter` 也是迭代器。

```
>>> numbers = [1, 2, 3, 5, 7]
>>> letters = ['a', 'b', 'c']
>>> z = zip(numbers, letters)
>>> z
<zip object at 0x7f112cc6ce48>
>>> next(z)
(1, 'a')
```

Python 中的文件对象也是迭代器。

```
>>> next(open('hello.txt'))
'hello world\n'
```

在 Python 标准库和第三方库中内置了大量的迭代器。这些迭代器首先惰性迭代器一样，延迟工作直到你请求它们下一项。


### 创建你自己的迭代器

知道你已经在使用迭代器是很有用的，但是我希望你也知道，你可以创建自己的迭代器和你自己的惰性迭代器。

下面这个类构造了一个迭代器接受一个可迭代的数字，并在循环结束时提供每个数字的平方。

```
class square_all:
    def __init__(self, numbers):
        self.numbers = iter(numbers)
    def __next__(self):
        return next(self.numbers) * 2
    def __iter__(self):
        return self
```

但是在我们开始对该类的实例进行循环遍历之前，没有任何工作要做。

这里，我们有一个无限长的可迭代对象 `count`，你可以看到 `square_all` 接受 `count` 而不用完全循环遍历这个无限长的迭代：

```
>>> from itertools import count
>>> numbers = count(5)
>>> squares = square_all(numbers)
>>> next(squares)
25
>>> next(squares)
36
```

这个迭代器类是有效的，但我们通常不会这样做。通常，当我们想要做一个定制的迭代器时，我们会生成一个生成器函数：

```
def square_all(numbers):
    for n in numbers:
        yield n**2
```

这个生成器函数等价于我们上面所做的类，它的工作原理是一样的。

这种 `yield` 语句似乎很神奇，但它非常强大：`yield` 允许我们在调用 `next` 函数之间暂停生成器函数。`yield` 语句是将生成器函数与常规函数分离的东西。

另一种实现相同迭代器的方法是使用生成器表达式。

```
def square_all(numbers):
    return (n**2 for n in numbers)
```

这和我们的生成器函数确实是一样的，但是它使用的语法看起来[像是一个列表推导一样][2]。如果你需要在代码中使用惰性迭代，请考虑迭代器，并考虑使用生成器函数或生成器表达式。

### 迭代器如何改进你的代码

一旦你已经接受了在代码中使用惰性迭代器的想法，你就会发现有很多可能来发现或创建辅助函数，以此来帮助你循环遍历和处理数据。

#### 惰性求和

这是一个 `for` 循环，它对 Django queryset 中的所有工作时间求和：

```
hours_worked = 0
for event in events:
    if event.is_billable():
        hours_worked += event.duration
```

下面是使用生成器表达式进行惰性评估的代码：

```
billable_times = (
    event.duration
    for event in events
    if event.is_billable()
)

hours_worked = sum(billable_times)
```

请注意，我们代码的形状发生了巨大变化。

将我们的计算工作时间变成一个惰性迭代器允许我们能够命名以前未命名（`billable_times`）的东西。这也允许我们使用 `sum` 函数，我们以前不能使用 `sum` 函数是因为我们甚至没有一个可迭代对象传递给它。迭代器允许你从根本上改变你组织代码的方式。

#### 惰性和打破循环

这段代码打印出日志文件的前 10 行：

```
for i, line in enumerate(log_file):
    if i >= 10:
        break
    print(line)
```

这段代码做了同样的事情，但是我们使用的是 `itertools.islice` 函数来惰性地抓取文件中的前 10 行：

```
from itertools import islice
first_ten_lines = islice(log_file, 10)
for line in first_ten_lines:
    print(line)
```

我们定义的 `first_ten_lines` 变量是迭代器，同样，使用迭代器允许我们给以前未命名的东西命名(`first_ten_lines`)。命名事物可以使我们的代码更具描述性，更具可读性。

作为奖励，我们还消除了在循环中使用 `break` 语句的需要，因为 `islice` 实用函数为我们处理了中断。

你可以在标准库中的 [itertools][3] 中找到更多的迭代辅助函数，以及诸如 [boltons][4] 和 [more-itertools][5] 之类的第三方库。

#### 创建自己的迭代辅助函数

你可以在标准库和第三方库中找到用于循环的辅助函数，但你也可以自己创建！

这段代码列出了序列中连续值之间的差值列表。

```
current = readings[0]
for next_item in readings[1:]:
    differences.append(next_item - current)
    current = next_item
```

请注意，这段代码中有一个额外的变量，我们每次循环时都要指定它。还要注意，这段代码只适用于我们可以切片的东西，比如序列。如果 `readings` 是一个生成器，一个 zip 对象或其他任何类型的迭代器，那么这段代码就会失败。

让我们编写一个辅助函数来修复代码。

这是一个生成器函数，它为给定的迭代中的每个项目提供了当前项和下一项：

```
def with_next(iterable):
    """Yield (current, next_item) tuples for each item in iterable."""
    iterator = iter(iterable)
    current = next(iterator)
    for next_item in iterator:
        yield current, next_item
        current = next_item
```

我们从可迭代对象中手动获取一个迭代器，在它上面调用 `next` 来获取第一项，然后循环遍历迭代器获取后续所有的项目，跟踪后一个项目。这个函数不仅适用于序列，而且适用于任何类型迭代。

这段代码和以前代码是一样的，但是我们使用的是辅助函数而不是手动跟踪 `next_item`：

```
differences = []
for current, next_item in with_next(readings):
    differences.append(next_item - current)
```

请注意，这段代码不会挂在我们循环周围的 `next_item` 上，`with_next` 生成器函数处理跟踪 `next_item` 的工作。

还要注意，这段代码已足够紧凑，如果我们愿意，我们甚至可以[将方法复制到列表推导中来][2]。

```
differences = [
    (next_item - current)
    for current, next_item in with_next(readings)
]
```

### 再次回顾循环问题

现在我们准备回到之前看到的那些奇怪的例子并试着找出到底发生了什么。

#### 问题 1：耗尽的迭代器

这里我们有一个生成器对象 `squares`：

```
>>> numbers = [1, 2, 3, 5, 7]
>>> squares = (n**2 for n in numbers)
```

如果我们把这个生成器传递给 `tuple` 构造函数，我们将会得到它的一个元组：

```
>>> numbers = [1, 2, 3, 5, 7]
>>> squares = (n**2 for n in numbers)
>>> tuple(squares)
(1, 4, 9, 25, 49)
```

如果我们试着计算这个生成器中数字的和，使用 `sum`,我们就会得到 `0`：

```
>>> sum(squares)
0
```

这个生成器现在是空的：我们已经把它耗尽了。如果我们试着再次创建一个元组，我们会得到一个空元组：

```
>>> tuple(squares)
()
```

生成器是迭代器，迭代器是一次性的。它们就像 Hello Kitty Pez 分配器那样不能重新加载。

#### 问题 2：部分消耗一个迭代器

再次使用那个生成器对象 `squares`：

```
>>> numbers = [1, 2, 3, 5, 7]
>>> squares = (n**2 for n in numbers)
```

如果我们询问 `9` 是否在 `squares` 生成器中，我们会得到 `True`：

```
>>> 9 in squares
True
```

但是我们再次询问相同的问题，我们会得到 `False`：

```
>>> 9 in squares
False
```

当我们询问 `9` 是否在迭代器中时，Python 必须对这个生成器进行循环遍历来找到 `9`。如果我们在检查了 `9` 之后继续循环遍历，我们只会得到最后两个数字，因为我们已经在找到 9 之前消耗了这些数字：

```
>>> numbers = [1, 2, 3, 5, 7]
>>> squares = (n**2 for n in numbers)
>>> 9 in squares
True
>>> list(squares)
[25, 49]
```

询问迭代器中是否包含某些东西将会部分地消耗迭代器。如果没有循环遍历迭代器，那么是没有办法知道某个东西是否在迭代器中。

#### 问题 3：拆包是迭代

当你在字典上循环时，你会得到键：

```
>>> counts = {'apples': 2, 'oranges': 1}
>>> for key in counts:
...     print(key)
...
apples
oranges
```

当你对一个字典进行拆包时，你也会得到键：

```
>>> x, y = counts
>>> x, y
('apples', 'oranges')
```

循环依赖于迭代器协议，可迭代对象拆包也依赖于有迭代器协议。拆包一个字典与在字典上循环遍历是一样的，两者都使用迭代器协议，所以在这两种情况下都得到相同的结果。

### 回顾

序列是迭代器，但是不是所有的迭代器都是序列。当有人说“迭代器”这个词时，你只能假设他们的意思是“你可以迭代的东西”。不要假设迭代器可以被循环遍历两次、询问它们的长度或者索引。

迭代器是 Python 中最基本的可迭代形式。如果你想在代码中做一个惰性迭代，请考虑迭代器，并考虑使用生成器函数或生成器表达式。

最后，请记住，Python 中的每一种迭代都依赖于迭代器协议，因此理解迭代器协议是理解 Python 中的循环的关键。

这里有一些我推荐的相关文章和视频：


- [Loop Like a Native](https://nedbatchelder.com/text/iter.html)， Ned Batchelder 在 PyCon 2013 的讲演
- [Loop Better](https://www.youtube.com/watch?v=V2PkkMS2Ack) ，这篇文章是基于这个讲演的
- [The Iterator Protocol: How For Loops Work](http://treyhunner.com/2016/12/python-iterator-protocol-how-for-loops-work/)，我写的关于迭代器协议的短文
- [Comprehensible Comprehensions](https://www.youtube.com/watch?v=5_cJIcgM7rw)，关于推导和迭代器表达器的讲演
- [Python: Range is Not an Iterator](http://treyhunner.com/2018/02/python-range-is-not-an-iterator/)，我关于范围和迭代器的文章
- [Looping Like a Pro in Python](https://www.youtube.com/watch?v=u8g9scXeAcI)，DB 的 PyCon 2017 讲演

本文是基于作者去年在 [DjangoCon AU][6]、 [PyGotham][7] 和 [North Bay Python][8] 中发表的 Loop Better 演讲。有关更多内容，请参加将于 2018 年 5 月 9 日至 17 日在 Columbus， Ohio 举办的 [PYCON][9]。


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/loop-better-deeper-look-iteration-python

作者：[Trey Hunner][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/treyhunner
[1]:https://en.wikipedia.org/wiki/Foreach_loop
[2]:http://treyhunner.com/2015/12/python-list-comprehensions-now-in-color/
[3]:https://docs.python.org/3/library/itertools.html
[4]:https://boltons.readthedocs.io
[5]:https://more-itertools.readthedocs.io
[6]:https://www.youtube.com/watch?v=JYuE8ZiDPl4
[7]:https://www.youtube.com/watch?v=Wd7vcuiMhxU
[8]:https://www.youtube.com/watch?v=V2PkkMS2Ack
[9]:https://us.pycon.org/2018/
