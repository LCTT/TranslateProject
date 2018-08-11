学习用 Thonny 写代码： 一个面向初学者的Python IDE
======

![](https://fedoramagazine.org/wp-content/uploads/2018/02/thonny.png-945x400.jpg)

学习编程很难。即使当你最终怎么正确使用你的冒号和括号，但仍然有很大的可能你的程序不会如果所想的工作。 通常，这意味着你忽略了某些东西或者误解了语言结构，你需要在代码中找到你的期望与现实存在分歧的地方。

程序员通常使用被叫做<ruby>调试器<rt>debugger</rt></ruby>的工具来处理这种情况，它允许一步一步地运行他们的程序。不幸的是，大多数调试器都针对专业用途进行了优化，并假设用户已经很好地了解了语言结构的语义（例如：函数调用）。

Thonny 是一个适合初学者的 Python IDE，由爱沙尼亚的 [Tartu 大学][1] 开发，它采用了不同的方法，因为它的调试器是专为学习和教学编程而设计的。

虽然 Thonny 适用于像小白一样的初学者，但这篇文章面向那些至少具有 Python 或其他命令式语言经验的读者。

### 开始

从第 Fedora 27 开始，Thonny 就被包含在 Fedora 软件库中。 使用 `sudo dnf install thonny` 或者你选择的图形工具（比如“<ruby>软件<rt>Software</rt></ruby>”）安装它。

当第一次启动 Thonny 时，它会做一些准备工作，然后呈现一个空白的编辑器和 Python shell 。将下列程序文本复制到编辑器中，并将其保存到文件中（`Ctrl+S`）。

```
n = 1
while n < 5:
    print(n * "*")
    n = n + 1
```

我们首先运行该程序。 为此请按键盘上的 `F5` 键。  你应该看到一个由星号组成的三角形出现在 shell 窗格中。

![一个简单的 Thonny 程序][2]

Python 分析了你的代码并理解了你想打印一个三角形了吗？让我们看看！

首先从“<ruby>查看<rt>View</rt></ruby>”菜单中选择“<ruby>变量<rt>Variables</rt></ruby>”。这将打开一张表格，向我们展示 Python 是如何管理程序的变量的。现在通过按 `Ctrl + F5`（在 XFCE 中是 `Ctrl + Shift + F5`）以调试模式运行程序。在这种模式下，Thonny 使 Python 在每一步所需的步骤之前暂停。你应该看到程序的第一行被一个框包围。我们将这称为焦点，它表明 Python 将接下来要执行的部分代码。

![ Thonny 调试器焦点 ][3]

你在焦点框中看到的一段代码段被称为赋值语句。 对于这种声明，Python 应该计算右边的表达式，并将值存储在左边显示的名称下。按 `F7` 进行下一步。你将看到 Python 将重点放在语句的正确部分。在这个例子中，表达式实际上很简单，但是为了通用性，Thonny 提供了表达式计算框，它允许将表达式转换为值。再次按 `F7` 将文字 `1` 转换为值 `1`。现在 Python 已经准备好执行实际的赋值—再次按 `F7`，你应该会看到变量 `n` 的值为 `1` 的变量出现在变量表中。

![Thonny 变量表][4]

继续按 `F7` 并观察 Python 如何以非常小的步骤前进。它看起来像是理解你的代码的目的或者更像是一个愚蠢的遵循简单规则的机器？

### 函数调用

<ruby>函数调用<rt>Function Call</rt></ruby>是一种编程概念，它常常给初学者带来很大的困惑。从表面上看，没有什么复杂的事情——给代码命名，然后在代码中的其他地方引用它（调用它）。传统的调试器告诉我们，当你进入调用时，焦点跳转到函数定义中（然后稍后神奇地返回到原来的位置）。这是整件事吗？这需要我们关心吗？

结果证明，“跳转模型” 只对最简单的函数是足够的。理解参数传递、局部变量、返回和递归都得理解堆栈框架的概念。幸运的是，Thonny 可以直观地解释这个概念，而无需在厚厚的掩盖下搜索重要的细节。

将以下递归程序复制到 Thonny 并以调试模式（`Ctrl+F5` 或 `Ctrl+Shift+F5`）运行。

```
def factorial(n):
    if n == 0:
        return 1
    else:
        return factorial(n-1) * n

print(factorial(4))
```

重复按 `F7`，直到你在对话框中看到表达式 `factorial(4)`。 当你进行下一步时，你会看到 Thonny 打开一个包含了函数代码、另一个变量表和另一个焦点框的新窗口（移动窗口以查看旧的焦点框仍然存在）。

![通过递归函数的 Thonny][5]

此窗口表示堆栈帧，即用于解析函数调用的工作区。几个放在彼此顶部的这样的窗口称为<ruby>调用堆栈<rt>call stack</rt></ruby>。注意调用位置的参数 `4` 与 “局部变量” 表中的输入 `n` 之间的关系。继续按 `F7` 步进, 观察在每次调用时如何创建新窗口并在函数代码完成时被销毁，以及如何用返回值替换了调用位置。

### 值与参考

现在，让我们在 Python shell 中进行一个实验。首先输入下面屏幕截图中显示的语句：

![Thonny shell 显示列表突变][6]

正如你所看到的, 我们追加到列表 `b`, 但列表 `a` 也得到了更新。你可能知道为什么会发生这种情况, 但是对初学者来说，什么才是最好的解释呢？

当教我的学生列表时，我告诉他们我一直欺骗了他们关于 Python 内存模型。实际上，它并不像变量表所显示的那样简单。我告诉他们重新启动解释器（工具栏上的红色按钮），从“<ruby>查看<rt>View</rt></ruby>”菜单中选择“<ruby>堆<rt>Heap</rt></ruby>”，然后再次进行相同的实验。如果这样做，你就会发现变量表不再包含值——它们实际上位于另一个名为“<ruby>堆<rt>Heap</rt></ruby>”的表中。变量表的作用实际上是将变量名映射到地址（或称 ID），地址又指向了<ruby>堆<rt>Heap</rt></ruby>表中的行。由于赋值仅更改变量表，因此语句 `b = a` 只复制对列表的引用，而不是列表本身。这解释了为什么我们通过这两个变量看到了变化。

![在堆模式中的 Thonny][7]

（为什么我要在教列表的主题之前推迟说出内存模型的事实？Python 存储的列表是否有所不同？请继续使用 Thonny 的堆模式来找出结果！在评论中告诉我你认为怎么样！）

如果要更深入地了解参考系统, 请将以下程序通过打开堆表复制到 Thonny 并进行小步调试（`F7`） 中。

```
def do_something(lst, x):
    lst.append(x)

a = [1,2,3]
n = 4
do_something(a, n)
print(a)
```

即使“堆模式”向我们显示真实的图片，但它使用起来也相当不方便。 因此，我建议你现在切换回普通模式（取消选择“<ruby>查看<rt>View</rt></ruby>”菜单中的“<ruby>堆<rt>Heap</rt></ruby>”），但请记住，真实模型包含变量、参考和值。

### 结语

我在这篇文章中提及到的特性是创建 Thonny 的主要原因。很容易对函数调用和引用形成错误的理解，但传统的调试器并不能真正帮助减少混淆。

除了这些显著的特性，Thonny 还提供了其他几个初学者友好的工具。 请查看 [Thonny的主页][8] 以了解更多信息！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/learn-code-thonny-python-ide-beginners/

作者：[Aivar Annamaa][a]
译者：[Auk7F7](https://github.com/Auk7F7)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/
[1]:https://www.ut.ee/en
[2]:https://fedoramagazine.org/wp-content/uploads/2017/12/scr1.png
[3]:https://fedoramagazine.org/wp-content/uploads/2017/12/thonny-scr2.png
[4]:https://fedoramagazine.org/wp-content/uploads/2017/12/thonny-scr3.png
[5]:https://fedoramagazine.org/wp-content/uploads/2017/12/thonny-scr4.png
[6]:https://fedoramagazine.org/wp-content/uploads/2017/12/thonny-scr5.png
[7]:https://fedoramagazine.org/wp-content/uploads/2017/12/thonny-scr6.png
[8]:http://thonny.org
