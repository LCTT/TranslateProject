使用 Python 的 toolz 库开始函数式编程
======

> toolz 库允许你操作函数，使其更容易理解，更容易测试代码。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy)

在这个由两部分组成的系列文章的第二部分中，我们将继续探索如何将函数式编程方法中的好想法引入到 Python中，以实现两全其美。

在上一篇文章中，我们介绍了[不可变数据结构][1]。 这些数据结构使得我们可以编写“纯”函数，或者说是没有副作用的函数，仅仅接受一些参数并返回结果，同时保持良好的性能。

在这篇文章中，我们使用 toolz 库来构建。 这个库具有操作此类函数的函数，并且它们在纯函数中表现得特别好。 在函数式编程世界中，它们通常被称为“高阶函数”，因为它们将函数作为参数，将函数作为结果返回。

让我们从这里开始：

```
def add_one_word(words, word):
    return words.set(words.get(word, 0) + 1)
```

这个函数假设它的第一个参数是一个不可变的类似字典的对象，它返回一个新的类似字典的在相关位置递增的对象：这就是一个简单的频率计数器。

但是，只有将它应用于单词流并做*归纳*时才有用。 我们可以使用内置模块 `functools` 中的归纳器。 

```
functools.reduce(function, stream, initializer)
```

我们想要一个函数，应用于流，并且能能返回频率计数。

我们首先使用 `toolz.curry` 函数：

```
add_all_words = curry(functools.reduce, add_one_word)
```

使用此版本，我们需要提供初始化程序。但是，我们不能只将 `pyrsistent.m` 函数添加到 `curry` 函数中； 因为这个顺序是错误的。

```
add_all_words_flipped = flip(add_all_words)
```

`flip` 这个高阶函数返回一个调用原始函数的函数，并且翻转参数顺序。

```
get_all_words = add_all_words_flipped(pyrsistent.m())
```

我们利用 `flip` 自动调整其参数的特性给它一个初始值：一个空字典。

现在我们可以执行 `get_all_words(word_stream)` 这个函数来获取频率字典。 但是，我们如何获得一个单词流呢？ Python 文件是按行供流的。

```
def to_words(lines):
    for line in lines:
        yield from line.split()
```

在单独测试每个函数后，我们可以将它们组合在一起：

```
words_from_file = toolz.compose(get_all_words, to_words)
```

在这种情况下，组合只是使两个函数很容易阅读：首先将文件的行流应用于 `to_words`，然后将 `get_all_words` 应用于 `to_words` 的结果。 但是文字上读起来似乎与代码执行相反。

当我们开始认真对待可组合性时，这很重要。有时可以将代码编写为一个单元序列，单独测试每个单元，最后将它们全部组合。如果有几个组合元素时，组合的顺序可能就很难理解。

`toolz` 库借用了 Unix 命令行的做法，并使用 `pipe` 作为执行相同操作的函数，但顺序相反。

```
words_from_file = toolz.pipe(to_words, get_all_words)
```

现在读起来更直观了：将输入传递到 `to_words`，并将结果传递给 `get_all_words`。 在命令行上，等效写法如下所示：

```
$ cat files | to_words | get_all_words
```

`toolz` 库允许我们操作函数，切片、分割和组合，以使我们的代码更容易理解和测试。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/functional-programming-python-toolz

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10222-1.html
