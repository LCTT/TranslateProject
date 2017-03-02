Linux 平台下 Python 脚本编程入门（一）
===============================================================================

众所周知，系统管理员需要精通一门脚本语言，而且招聘机构列出的职位需求上也会这么写。大多数人会认为 Bash （或者其他的 shell 语言）用起来很方便，但一些强大的语言（比如 Python）会给你带来一些其它的好处。

![](http://www.tecmint.com/wp-content/uploads/2016/05/Learn-Python-Programming-Scripting-in-Linux.png)

*在 Linux 中学习 Python 脚本编程*

首先，我们会使用 Python 的命令行工具，还会接触到 Python 的面向对象特性（这篇文章的后半部分会谈到它）。

学习 Python 可以助力于你在[桌面应用开发][2]及[数据科学领域][3]的职业发展。

容易上手，广泛使用，拥有海量“开箱即用”的模块（它是一组包含 Python 语句的外部文件），Python 理所当然地成为了美国计算机专业大学生在一年级时所上的程序设计课所用语言的不二之选。

在这个由两篇文章构成的系列中，我们将回顾 Python 的基础部分，希望初学编程的你能够将这篇实用的文章作为一个编程入门的跳板，和日后使用 Python 时的一篇快速指引。

### Linux 中的 Python

Python 2.x 和 3.x 通常已经内置在现代 Linux 发行版中，你可以立刻使用它。你可以终端模拟器中输入 `python` 或 `python3` 来进入 Python shell, 并输入 `quit()` 退出。

```
$ which python
$ which python3
$ python -v
$ python3 -v
$ python
>>> quit()
$ python3
>>> quit()
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Running-Python-Commands-on-Linux.png)

*在 Linux 中运行 Python 命令*

如果你希望在键入 `python` 时使用 Python 3.x 而不是 2.x，你可以像下面一样更改对应的符号链接：

```
$ sudo rm /usr/bin/python 
$ cd /usr/bin
$ ln -s python3.2 python # Choose the Python 3.x binary here
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Remove-Python-2-and-Use-Python-3.png)

*删除 Python 2，使用 Python 3*

顺便一提，有一点需要注意：尽管 Python 2.x 仍旧被使用，但它并不会被积极维护。因此，你可能要考虑像上面指示的那样来切换到 3.x。2.x 和 3.x 的语法有一些不同，我们会在这个系列文章中使用后者。

另一个在 Linux 中使用 Python 的方法是通过 IDLE (the Python Integrated Development Environment)，这是一个为编写 Python 代码而生的图形用户界面。在安装它之前，你最好查看一下适用于你的 Linux 发行版的 IDLE 可用版本。

```
# aptitude search idle     [Debian 及其衍生发行版]
# yum search idle          [CentOS 和 Fedora]
# dnf search idle          [Fedora 23+ 版本]
```

然后，你可以像下面一样安装它：

```
$ sudo aptitude install idle-python3.2    # I'm using Linux Mint 13
```

安装成功后，你会看到 IDLE 的运行画面。它很像 Python shell，但是你可以用它做更多 Python shell 做不了的事。

比如，你可以:

1. 轻松打开外部文件 (File → Open)；

	![](http://www.tecmint.com/wp-content/uploads/2016/05/Python-Shell.png)
	
	*Python Shell*

2. 复制 (`Ctrl + C`) 和粘贴 (`Ctrl + V`) 文本；
3. 查找和替换文本；
4. 显示可能的代码补全（一个在其他 IDE 里可能叫做“智能感知”或者“自动补完”的功能）；
5. 更改字体和字号，等等。

最厉害的是，你可以用 IDLE 创建桌面应用。

我们在这两篇文章中不会开发桌面应用，所以你可以根据喜好来选择 IDLE 或 Python shell 去运行下面的例子。

### Python 中的基本运算

就像你预料的那样，你能够直接进行算术操作（你可以在你的所有运算中使用足够多的括号！），还可以轻松地使用 Python 拼接字符串。

你还可以将运算结果赋给一个变量，然后在屏幕上显示它。Python 有一个叫做拼接 (concatenation) 的实用功能——给 print 函数提供一串用逗号分隔的变量和/或字符串，它会返回一个由你刚才提供的变量依序构成的句子：

```
>>> a = 5
>>> b = 8
>>> x = b / a
>>> x
1.6
>>> print(b, "divided by", a, "equals", x)
```

注意，你可以将不同类型的变量（数字，字符串，布尔符号等等）混合在一起。当你将一个值赋给一个变量后，你可以随后更改它的类型，不会有任何问题（因此，Python 被称为动态类型语言）。

如果你尝试在静态类型语言中（如 Java 或 C#）做这件事，它将抛出一个错误。

![](http://www.tecmint.com/wp-content/uploads/2016/05/Learn-Python-Basic-Operations.png)

*学习 Python 的基本操作*

### 面向对象编程的简单介绍

在面向对象编程（OOP）中，程序中的所有实体都会由对象的形式呈现，并且它们可以与其他对象交互。因此，对象拥有属性，而且大多数对象可以执行动作（这被称为对象的方法）。

举个例子：我们来想象一下，创建一个对象“狗”。它可能拥有的一些属性有`颜色`、`品种`、`年龄`等等，而它可以完成的动作有 `叫()`、`吃()`、`睡觉()`，诸如此类。

你可以看到，方法名后面会跟着一对括号，括号当中可能会包含一个或多个参数（向方法中传递的值），也有可能什么都不包含。

我们用 Python 的基本对象类型之一——列表来解释这些概念。

### 解释对象的属性和方法：Python 中的列表

列表是条目的有序组合，而这些条目所属的数据类型并不需要相同。我们像下面一样来使用一对方括号，来创建一个名叫 `rockBands` 的列表：

你可以向 `rockBands` 的 `append()` 方法传递条目，来将它添加到列表的尾部，就像下面这样：

```
>>> rockBands = []
>>> rockBands.append("The Beatles")
>>> rockBands.append("Pink Floyd")
>>> rockBands.append("The Rolling Stones")
```

为了从列表中移除元素，我们可以向 `remove()` 方法传递特定元素，或向 `pop()` 中传递列表中待删除元素的位置（从 0 开始计数）。

换句话说，我们可以用下面这种方法来从列表中删除 “The Beatles”：

```
>>> rockBands.remove("The Beatles")
```

或者用这种方法：

```
>>> rockBands.pop(0)
```

如果你输入了对象的名字，然后在后面输入了一个点，你可以按 `Ctrl + space` 来显示这个对象的可用方法列表。

![](http://www.tecmint.com/wp-content/uploads/2016/05/List-Available-Python-Methods.png)

*列出可用的 Python 方法*

列表中含有的元素个数是它的一个属性。它通常被叫做“长度”，你可以通过向内建函数 `len` 传递一个列表作为它的参数来显示该列表的长度（顺便一提，之前的例子中提到的 print 语句，是 Python 的另一个内建函数）。

如果你在 IDLE 中输入 `len`，然后跟上一个不闭合的括号，你会看到这个函数的默认语法：

![](http://www.tecmint.com/wp-content/uploads/2016/05/Python-len-Function.png)

*Python 的 len 函数*

现在我们来看看列表中的特定条目。它们也有属性和方法吗？答案是肯定的。比如，你可以将一个字符串条目转换为大写形式，并获取这个字符串所包含的字符数量。像下面这样做：

```
>>> rockBands[0].upper()
'THE BEATLES'
>>> len(rockBands[0])
11
```

### 总结

在这篇文章中，我们简要介绍了 Python、它的命令行 shell、IDLE，展示了如何执行算术运算，如何在变量中存储数据，如何使用 `print` 函数在屏幕上重新显示那些数据（无论是它们本身还是它们的一部分），还通过一个实际的例子解释了对象的属性和方法。

下一篇文章中，我们会展示如何使用条件语句和循环语句来实现流程控制。我们也会解释如何编写一个脚本来帮助我们完成系统管理任务。

你是不是想继续学习一些有关 Python 的知识呢？敬请期待本系列的第二部分（我们会在脚本中将 Python 和命令行工具的优点结合在一起），你还可以考虑购买我们的《终极 Python 编程》系列教程（[这里][4]有详细信息）。

像往常一样，如果你对这篇文章有什么问题，可以向我们寻求帮助。你可以使用下面的联系表单向我们发送留言，我们会尽快回复你。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/learn-python-programming-and-scripting-in-linux/

作者：[Gabriel Cánepa][a]
译者：[StdioA](https://github.com/StdioA)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/gacanepa/
[1]: http://www.tecmint.com/category/bash-shell/
[2]: http://www.tecmint.com/create-gui-applications-in-linux/
[3]: http://www.datasciencecentral.com/profiles/blogs/the-guide-to-learning-python-for-data-science-2
[4]: http://www.tecmint.com/learn-python-programming-online-with-ultimate-python-coding/
