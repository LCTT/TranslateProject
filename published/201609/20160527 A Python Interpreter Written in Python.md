用 Python 实现 Python 解释器
===

_Allison 是 Dropbox 的工程师，在那里她维护着这个世界上最大的 Python 客户端网络之一。在去 Dropbox 之前，她是 Recurse Center 的协调人, 是这个位于纽约的程序员深造机构的作者。她在北美的 PyCon 做过关于 Python 内部机制的演讲，并且她喜欢研究奇怪的 bug。她的博客地址是 [akaptur.com](http://akaptur.com)。_

### 介绍

Byterun 是一个用 Python 实现的 Python 解释器。随着我对 Byterun 的开发，我惊喜地的发现，这个 Python 解释器的基础结构用 500 行代码就能实现。在这一章我们会搞清楚这个解释器的结构，给你足够探索下去的背景知识。我们的目标不是向你展示解释器的每个细节---像编程和计算机科学其他有趣的领域一样，你可能会投入几年的时间去深入了解这个主题。

Byterun 是 Ned Batchelder 和我完成的，建立在 Paul Swartz 的工作之上。它的结构和主要的 Python 实现（CPython）差不多，所以理解 Byterun 会帮助你理解大多数解释器，特别是 CPython 解释器。（如果你不知道你用的是什么 Python，那么很可能它就是 CPython）。尽管 Byterun 很小，但它能执行大多数简单的 Python 程序（这一章是基于 Python 3.5 及其之前版本生成的字节码的，在 Python 3.6 中生成的字节码有一些改变）。

#### Python 解释器

在开始之前，让我们限定一下“Pyhton 解释器”的意思。在讨论 Python 的时候，“解释器”这个词可以用在很多不同的地方。有的时候解释器指的是 Python REPL，即当你在命令行下敲下 `python` 时所得到的交互式环境。有时候人们会或多或少的互换使用 “Python 解释器”和“Python”来说明从头到尾执行 Python 代码的这一过程。在本章中，“解释器”有一个更精确的意思：Python 程序的执行过程中的最后一步。

在解释器接手之前，Python 会执行其他 3 个步骤：词法分析，语法解析和编译。这三步合起来把源代码转换成代码对象（code object），它包含着解释器可以理解的指令。而解释器的工作就是解释代码对象中的指令。

你可能很奇怪执行 Python 代码会有编译这一步。Python 通常被称为解释型语言，就像 Ruby，Perl 一样，它们和像 C，Rust 这样的编译型语言相对。然而，这个术语并不是它看起来的那样精确。大多数解释型语言包括 Python 在内，确实会有编译这一步。而 Python 被称为解释型的原因是相对于编译型语言，它在编译这一步的工作相对较少（解释器做相对多的工作）。在这章后面你会看到，Python 的编译器比 C 语言编译器需要更少的关于程序行为的信息。

#### Python 的 Python 解释器

Byterun 是一个用 Python 写的 Python 解释器，这点可能让你感到奇怪，但没有比用 C 语言写 C 语言编译器更奇怪的了。（事实上，广泛使用的 gcc 编译器就是用 C 语言本身写的）你可以用几乎任何语言写一个 Python 解释器。

用 Python 写 Python 既有优点又有缺点。最大的缺点就是速度：用 Byterun 执行代码要比用 CPython 执行慢的多，CPython 解释器是用 C 语言实现的，并做了认真优化。然而 Byterun 是为了学习而设计的，所以速度对我们不重要。使用 Python 最大优势是我们可以*仅仅*实现解释器，而不用担心 Python 运行时部分，特别是对象系统。比如当 Byterun 需要创建一个类时，它就会回退到“真正”的 Python。另外一个优势是 Byterun 很容易理解，部分原因是它是用人们很容易理解的高级语言写的（Python ！）（另外我们不会对解释器做优化 --- 再一次，清晰和简单比速度更重要）

### 构建一个解释器

在我们考察 Byterun 代码之前，我们需要从高层次对解释器结构有一些了解。Python 解释器是如何工作的？

Python 解释器是一个虚拟机（virtual machine），是一个模拟真实计算机的软件。我们这个虚拟机是栈机器（stack machine），它用几个栈来完成操作（与之相对的是寄存器机器（register machine），它从特定的内存地址读写数据）。

Python 解释器是一个字节码解释器（bytecode interpreter）：它的输入是一些称作字节码（bytecode）的指令集。当你写 Python 代码时，词法分析器、语法解析器和编译器会生成代码对象（code object）让解释器去操作。每个代码对象都包含一个要被执行的指令集 —— 它就是字节码 —— 以及还有一些解释器需要的信息。字节码是 Python 代码的一个中间层表示（ intermediate representation）：它以一种解释器可以理解的方式来表示源代码。这和汇编语言作为 C 语言和机器语言的中间表示很类似。

#### 微型解释器

为了让说明更具体，让我们从一个非常小的解释器开始。它只能计算两个数的和，只能理解三个指令。它执行的所有代码只是这三个指令的不同组合。下面就是这三个指令：

- `LOAD_VALUE`
- `ADD_TWO_VALUES`
- `PRINT_ANSWER`

我们不关心词法、语法和编译，所以我们也不在乎这些指令集是如何产生的。你可以想象，当你写下 `7 + 5`，然后一个编译器为你生成那三个指令的组合。如果你有一个合适的编译器，你甚至可以用 Lisp 的语法来写，只要它能生成相同的指令。

假设

```python
7 + 5
```

生成这样的指令集：

```python
what_to_execute = {
    "instructions": [("LOAD_VALUE", 0),  # the first number
                     ("LOAD_VALUE", 1),  # the second number
                     ("ADD_TWO_VALUES", None),
                     ("PRINT_ANSWER", None)],
    "numbers": [7, 5] }
```

Python 解释器是一个栈机器（stack machine），所以它必须通过操作栈来完成这个加法（见下图）。解释器先执行第一条指令，`LOAD_VALUE`，把第一个数压到栈中。接着它把第二个数也压到栈中。然后，第三条指令，`ADD_TWO_VALUES`，先把两个数从栈中弹出，加起来，再把结果压入栈中。最后一步，把结果弹出并输出。

![栈机器](http://aosabook.org/en/500L/interpreter-images/interpreter-stack.png)

`LOAD_VALUE`这条指令告诉解释器把一个数压入栈中，但指令本身并没有指明这个数是多少。指令需要一个额外的信息告诉解释器去哪里找到这个数。所以我们的指令集有两个部分：指令本身和一个常量列表。（在 Python 中，字节码就是我们所称的“指令”，而解释器“执行”的是代码对象。）

为什么不把数字直接嵌入指令之中？想象一下，如果我们加的不是数字，而是字符串。我们可不想把字符串这样的东西加到指令中，因为它可以有任意的长度。另外，我们这种设计也意味着我们只需要对象的一份拷贝，比如这个加法 `7 + 7`, 现在常量表 `"numbers"`只需包含一个`[7]`。

你可能会想为什么会需要除了`ADD_TWO_VALUES`之外的指令。的确，对于我们两个数加法，这个例子是有点人为制作的意思。然而，这个指令却是建造更复杂程序的轮子。比如，就我们目前定义的三个指令，只要给出正确的指令组合，我们可以做三个数的加法，或者任意个数的加法。同时，栈提供了一个清晰的方法去跟踪解释器的状态，这为我们增长的复杂性提供了支持。

现在让我们来完成我们的解释器。解释器对象需要一个栈，它可以用一个列表来表示。它还需要一个方法来描述怎样执行每条指令。比如，`LOAD_VALUE`会把一个值压入栈中。

```python
class Interpreter:
    def __init__(self):
        self.stack = []

    def LOAD_VALUE(self, number):
        self.stack.append(number)

    def PRINT_ANSWER(self):
        answer = self.stack.pop()
        print(answer)

    def ADD_TWO_VALUES(self):
        first_num = self.stack.pop()
        second_num = self.stack.pop()
        total = first_num + second_num
        self.stack.append(total)
```

这三个方法完成了解释器所理解的三条指令。但解释器还需要一样东西：一个能把所有东西结合在一起并执行的方法。这个方法就叫做 `run_code`，它把我们前面定义的字典结构 `what-to-execute` 作为参数，循环执行里面的每条指令，如果指令有参数就处理参数，然后调用解释器对象中相应的方法。

```python
    def run_code(self, what_to_execute):
        instructions = what_to_execute["instructions"]
        numbers = what_to_execute["numbers"]
        for each_step in instructions:
            instruction, argument = each_step
            if instruction == "LOAD_VALUE":
                number = numbers[argument]
                self.LOAD_VALUE(number)
            elif instruction == "ADD_TWO_VALUES":
                self.ADD_TWO_VALUES()
            elif instruction == "PRINT_ANSWER":
                self.PRINT_ANSWER()
```

为了测试，我们创建一个解释器对象，然后用前面定义的 7 + 5 的指令集来调用 `run_code`。

```python
    interpreter = Interpreter()
    interpreter.run_code(what_to_execute)
```

显然，它会输出12。

尽管我们的解释器功能十分受限，但这个过程几乎和真正的 Python 解释器处理加法是一样的。这里，我们还有几点要注意。

首先，一些指令需要参数。在真正的 Python 字节码当中，大概有一半的指令有参数。像我们的例子一样，参数和指令打包在一起。注意指令的参数和传递给对应方法的参数是不同的。

第二，指令`ADD_TWO_VALUES`不需要任何参数，它从解释器栈中弹出所需的值。这正是以基于栈的解释器的特点。

记得我们说过只要给出合适的指令集，不需要对解释器做任何改变，我们就能做多个数的加法。考虑下面的指令集，你觉得会发生什么？如果你有一个合适的编译器，什么代码才能编译出下面的指令集？

```python
    what_to_execute = {
        "instructions": [("LOAD_VALUE", 0),
                         ("LOAD_VALUE", 1),
                         ("ADD_TWO_VALUES", None),
                         ("LOAD_VALUE", 2),
                         ("ADD_TWO_VALUES", None),
                         ("PRINT_ANSWER", None)],
        "numbers": [7, 5, 8] }
```

从这点出发，我们开始看到这种结构的可扩展性：我们可以通过向解释器对象增加方法来描述更多的操作（只要有一个编译器能为我们生成组织良好的指令集就行）。

##### 变量

接下来给我们的解释器增加变量的支持。我们需要一个保存变量值的指令 `STORE_NAME`；一个取变量值的指令`LOAD_NAME`；和一个变量到值的映射关系。目前，我们会忽略命名空间和作用域，所以我们可以把变量和值的映射直接存储在解释器对象中。最后，我们要保证`what_to_execute`除了一个常量列表，还要有个变量名字的列表。

```python
>>> def s():
...     a = 1
...     b = 2
...     print(a + b)
# a friendly compiler transforms `s` into:
    what_to_execute = {
        "instructions": [("LOAD_VALUE", 0),
                         ("STORE_NAME", 0),
                         ("LOAD_VALUE", 1),
                         ("STORE_NAME", 1),
                         ("LOAD_NAME", 0),
                         ("LOAD_NAME", 1),
                         ("ADD_TWO_VALUES", None),
                         ("PRINT_ANSWER", None)],
        "numbers": [1, 2],
        "names":   ["a", "b"] }
```

我们的新的实现在下面。为了跟踪哪个名字绑定到哪个值，我们在`__init__`方法中增加一个`environment`字典。我们也增加了`STORE_NAME`和`LOAD_NAME`方法，它们获得变量名，然后从`environment`字典中设置或取出这个变量值。

现在指令的参数就有两个不同的意思，它可能是`numbers`列表的索引，也可能是`names`列表的索引。解释器通过检查所执行的指令就能知道是那种参数。而我们打破这种逻辑 ，把指令和它所用何种参数的映射关系放在另一个单独的方法中。

```python
class Interpreter:
    def __init__(self):
        self.stack = []
        self.environment = {}

    def STORE_NAME(self, name):
        val = self.stack.pop()
        self.environment[name] = val

    def LOAD_NAME(self, name):
        val = self.environment[name]
        self.stack.append(val)

    def parse_argument(self, instruction, argument, what_to_execute):
        """ Understand what the argument to each instruction means."""
        numbers = ["LOAD_VALUE"]
        names = ["LOAD_NAME", "STORE_NAME"]

        if instruction in numbers:
            argument = what_to_execute["numbers"][argument]
        elif instruction in names:
            argument = what_to_execute["names"][argument]

        return argument

    def run_code(self, what_to_execute):
        instructions = what_to_execute["instructions"]
        for each_step in instructions:
            instruction, argument = each_step
            argument = self.parse_argument(instruction, argument, what_to_execute)

            if instruction == "LOAD_VALUE":
                self.LOAD_VALUE(argument)
            elif instruction == "ADD_TWO_VALUES":
                self.ADD_TWO_VALUES()
            elif instruction == "PRINT_ANSWER":
                self.PRINT_ANSWER()
            elif instruction == "STORE_NAME":
                self.STORE_NAME(argument)
            elif instruction == "LOAD_NAME":
                self.LOAD_NAME(argument)
```

仅仅五个指令，`run_code`这个方法已经开始变得冗长了。如果保持这种结构，那么每条指令都需要一个`if`分支。这里，我们要利用 Python 的动态方法查找。我们总会给一个称为`FOO`的指令定义一个名为`FOO`的方法，这样我们就可用 Python 的`getattr`函数在运行时动态查找方法，而不用这个大大的分支结构。`run_code`方法现在是这样：

```python
    def execute(self, what_to_execute):
        instructions = what_to_execute["instructions"]
        for each_step in instructions:
            instruction, argument = each_step
            argument = self.parse_argument(instruction, argument, what_to_execute)
            bytecode_method = getattr(self, instruction)
            if argument is None:
                bytecode_method()
            else:
                bytecode_method(argument)
```

### 真实的 Python 字节码

现在，放弃我们的小指令集，去看看真正的 Python 字节码。字节码的结构和我们的小解释器的指令集差不多，除了字节码用一个字节而不是一个名字来代表这条指令。为了理解它的结构，我们将考察一个函数的字节码。考虑下面这个例子：

```python
>>> def cond():
...     x = 3
...     if x < 5:
...         return 'yes'
...     else:
...         return 'no'
...
```

Python 在运行时会暴露一大批内部信息，并且我们可以通过 REPL 直接访问这些信息。对于函数对象`cond`，`cond.__code__`是与其关联的代码对象，而`cond.__code__.co_code`就是它的字节码。当你写 Python 代码时，你永远也不会想直接使用这些属性，但是这可以让我们做出各种恶作剧，同时也可以看看内部机制。

```python
>>> cond.__code__.co_code  # the bytecode as raw bytes
b'd\x01\x00}\x00\x00|\x00\x00d\x02\x00k\x00\x00r\x16\x00d\x03\x00Sd\x04\x00Sd\x00
   \x00S'
>>> list(cond.__code__.co_code)  # the bytecode as numbers
[100, 1, 0, 125, 0, 0, 124, 0, 0, 100, 2, 0, 107, 0, 0, 114, 22, 0, 100, 3, 0, 83, 
 100, 4, 0, 83, 100, 0, 0, 83]
```

当我们直接输出这个字节码，它看起来完全无法理解 —— 唯一我们了解的是它是一串字节。很幸运，我们有一个很强大的工具可以用：Python 标准库中的`dis`模块。

`dis`是一个字节码反汇编器。反汇编器以为机器而写的底层代码作为输入，比如汇编代码和字节码，然后以人类可读的方式输出。当我们运行`dis.dis`，它输出每个字节码的解释。

```python
>>> dis.dis(cond)
  2           0 LOAD_CONST               1 (3)
              3 STORE_FAST               0 (x)

  3           6 LOAD_FAST                0 (x)
              9 LOAD_CONST               2 (5)
             12 COMPARE_OP               0 (<)
             15 POP_JUMP_IF_FALSE       22

  4          18 LOAD_CONST               3 ('yes')
             21 RETURN_VALUE

  6     >>   22 LOAD_CONST               4 ('no')
             25 RETURN_VALUE
             26 LOAD_CONST               0 (None)
             29 RETURN_VALUE
```

这些都是什么意思？让我们以第一条指令`LOAD_CONST`为例子。第一列的数字（`2`）表示对应源代码的行数。第二列的数字是字节码的索引，告诉我们指令`LOAD_CONST`在位置 0 。第三列是指令本身对应的人类可读的名字。如果第四列存在，它表示指令的参数。如果第五列存在，它是一个关于参数是什么的提示。

考虑这个字节码的前几个字节：[100, 1, 0, 125, 0, 0]。这 6 个字节表示两条带参数的指令。我们可以使用`dis.opname`，一个字节到可读字符串的映射，来找到指令 100 和指令 125 代表的是什么：

```python
>>> dis.opname[100]
'LOAD_CONST'
>>> dis.opname[125]
'STORE_FAST'
```

第二和第三个字节 —— 1 、0 ——是`LOAD_CONST`的参数，第五和第六个字节 —— 0、0 —— 是`STORE_FAST`的参数。就像我们前面的小例子，`LOAD_CONST`需要知道的到哪去找常量，`STORE_FAST`需要知道要存储的名字。（Python 的`LOAD_CONST`和我们小例子中的`LOAD_VALUE`一样，`LOAD_FAST`和`LOAD_NAME`一样）。所以这六个字节代表第一行源代码`x = 3` （为什么用两个字节表示指令的参数？如果 Python 使用一个字节，每个代码对象你只能有 256 个常量/名字，而用两个字节，就增加到了 256 的平方，65536个）。

#### 条件语句与循环语句

到目前为止，我们的解释器只能一条接着一条的执行指令。这有个问题，我们经常会想多次执行某个指令，或者在特定的条件下跳过它们。为了可以写循环和分支结构，解释器必须能够在指令中跳转。在某种程度上，Python 在字节码中使用`GOTO`语句来处理循环和分支！让我们再看一个`cond`函数的反汇编结果：

```python
>>> dis.dis(cond)
  2           0 LOAD_CONST               1 (3)
              3 STORE_FAST               0 (x)

  3           6 LOAD_FAST                0 (x)
              9 LOAD_CONST               2 (5)
             12 COMPARE_OP               0 (<)
             15 POP_JUMP_IF_FALSE       22

  4          18 LOAD_CONST               3 ('yes')
             21 RETURN_VALUE

  6     >>   22 LOAD_CONST               4 ('no')
             25 RETURN_VALUE
             26 LOAD_CONST               0 (None)
             29 RETURN_VALUE
```

第三行的条件表达式`if x < 5`被编译成四条指令：`LOAD_FAST`、 `LOAD_CONST`、 `COMPARE_OP`和 `POP_JUMP_IF_FALSE`。`x < 5`对应加载`x`、加载 5、比较这两个值。指令`POP_JUMP_IF_FALSE`完成这个`if`语句。这条指令把栈顶的值弹出，如果值为真，什么都不发生。如果值为假，解释器会跳转到另一条指令。

这条将被加载的指令称为跳转目标，它作为指令`POP_JUMP`的参数。这里，跳转目标是 22，索引为 22 的指令是`LOAD_CONST`，对应源码的第 6 行。（`dis`用`>>`标记跳转目标。）如果`X < 5`为假，解释器会忽略第四行（`return yes`），直接跳转到第6行（`return "no"`）。因此解释器通过跳转指令选择性的执行指令。

Python 的循环也依赖于跳转。在下面的字节码中，`while x < 5`这一行产生了和`if x < 10`几乎一样的字节码。在这两种情况下，解释器都是先执行比较，然后执行`POP_JUMP_IF_FALSE`来控制下一条执行哪个指令。第四行的最后一条字节码`JUMP_ABSOLUT`(循环体结束的地方），让解释器返回到循环开始的第 9 条指令处。当 `x < 10`变为假，`POP_JUMP_IF_FALSE`会让解释器跳到循环的终止处，第 34 条指令。 

```python
>>> def loop():
...      x = 1
...      while x < 5:
...          x = x + 1
...      return x
...
>>> dis.dis(loop)
  2           0 LOAD_CONST               1 (1)
              3 STORE_FAST               0 (x)

  3           6 SETUP_LOOP              26 (to 35)
        >>    9 LOAD_FAST                0 (x)
             12 LOAD_CONST               2 (5)
             15 COMPARE_OP               0 (<)
             18 POP_JUMP_IF_FALSE       34

  4          21 LOAD_FAST                0 (x)
             24 LOAD_CONST               1 (1)
             27 BINARY_ADD
             28 STORE_FAST               0 (x)
             31 JUMP_ABSOLUTE            9
        >>   34 POP_BLOCK

  5     >>   35 LOAD_FAST                0 (x)
             38 RETURN_VALUE
```

#### 探索字节码

我希望你用`dis.dis`来试试你自己写的函数。一些有趣的问题值得探索：

- 对解释器而言 for 循环和 while 循环有什么不同？
- 能不能写出两个不同函数，却能产生相同的字节码?
- `elif`是怎么工作的？列表推导呢？

### 帧

到目前为止，我们已经知道了 Python 虚拟机是一个栈机器。它能顺序执行指令，在指令间跳转，压入或弹出栈值。但是这和我们期望的解释器还有一定距离。在前面的那个例子中，最后一条指令是`RETURN_VALUE`，它和`return`语句相对应。但是它返回到哪里去呢？

为了回答这个问题，我们必须再增加一层复杂性：帧（frame）。一个帧是一些信息的集合和代码的执行上下文。帧在 Python 代码执行时动态地创建和销毁。每个帧对应函数的一次调用 —— 所以每个帧只有一个代码对象与之关联，而一个代码对象可以有多个帧。比如你有一个函数递归的调用自己 10 次，这会产生 11 个帧，每次调用对应一个，再加上启动模块对应的一个帧。总的来说，Python 程序的每个作用域都有一个帧，比如，模块、函数、类定义。

帧存在于调用栈（call stack）中，一个和我们之前讨论的完全不同的栈。（你最熟悉的栈就是调用栈，就是你经常看到的异常回溯，每个以"File 'program.py'"开始的回溯对应一个帧。）解释器在执行字节码时操作的栈，我们叫它数据栈（data stack）。其实还有第三个栈，叫做块栈（block stack），用于特定的控制流块，比如循环和异常处理。调用栈中的每个帧都有它自己的数据栈和块栈。

让我们用一个具体的例子来说明一下。假设 Python 解释器执行到下面标记为 3 的地方。解释器正处于`foo`函数的调用中，它接着调用`bar`。下面是帧调用栈、块栈和数据栈的示意图。我们感兴趣的是解释器先从最底下的`foo()`开始，接着执行`foo`的函数体，然后到达`bar`。

```python
>>> def bar(y):
...     z = y + 3     # <--- (3) ... and the interpreter is here.
...     return z
...
>>> def foo():
...     a = 1
...     b = 2
...     return a + bar(b) # <--- (2) ... which is returning a call to bar ...
...
>>> foo()             # <--- (1) We're in the middle of a call to foo ...
3
```

![调用栈](http://aosabook.org/en/500L/interpreter-images/interpreter-callstack.png)

现在，解释器处于`bar`函数的调用中。调用栈中有 3 个帧：一个对应于模块层，一个对应函数`foo`，另一个对应函数`bar`。（见上图）一旦`bar`返回，与它对应的帧就会从调用栈中弹出并丢弃。

字节码指令`RETURN_VALUE`告诉解释器在帧之间传递一个值。首先，它把位于调用栈栈顶的帧中的数据栈的栈顶值弹出。然后把整个帧弹出丢弃。最后把这个值压到下一个帧的数据栈中。

当 Ned Batchelder 和我在写 Byterun 时，很长一段时间我们的实现中一直有个重大的错误。我们整个虚拟机中只有一个数据栈，而不是每个帧都有一个。我们写了很多测试代码，同时在 Byterun 和真正的 Python 上运行，希望得到一致结果。我们几乎通过了所有测试，只有一样东西不能通过，那就是生成器（generators）。最后，通过仔细的阅读 CPython 的源码，我们发现了错误所在（感谢 Michael Arntzenius 对这个 bug 的洞悉）。把数据栈移到每个帧就解决了这个问题。

回头在看看这个 bug，我惊讶的发现 Python 真的很少依赖于每个帧有一个数据栈这个特性。在 Python 中几乎所有的操作都会清空数据栈，所以所有的帧公用一个数据栈是没问题的。在上面的例子中，当`bar`执行完后，它的数据栈为空。即使`foo`公用这一个栈，它的值也不会受影响。然而，对应生成器，它的一个关键的特点是它能暂停一个帧的执行，返回到其他的帧，一段时间后它能返回到原来的帧，并以它离开时的相同状态继续执行。

### Byterun

现在我们有足够的 Python 解释器的知识背景去考察 Byterun。

Byterun 中有四种对象。

- `VirtualMachine`类，它管理高层结构，尤其是帧调用栈，并包含了指令到操作的映射。这是一个比前面`Inteprter`对象更复杂的版本。
- `Frame`类，每个`Frame`类都有一个代码对象，并且管理着其他一些必要的状态位，尤其是全局和局部命名空间、指向调用它的整的指针和最后执行的字节码指令。 
- `Function`类，它被用来代替真正的 Python 函数。回想一下，调用函数时会创建一个新的帧。我们自己实现了`Function`，以便我们控制新的`Frame`的创建。
- `Block`类，它只是包装了块的 3 个属性。（块的细节不是解释器的核心，我们不会花时间在它身上，把它列在这里，是因为 Byterun 需要它。）

####  `VirtualMachine` 类

每次程序运行时只会创建一个`VirtualMachine`实例，因为我们只有一个 Python 解释器。`VirtualMachine` 保存调用栈、异常状态、在帧之间传递的返回值。它的入口点是`run_code`方法，它以编译后的代码对象为参数，以创建一个帧为开始，然后运行这个帧。这个帧可能再创建出新的帧；调用栈随着程序的运行而增长和缩短。当第一个帧返回时，执行结束。

```python
class VirtualMachineError(Exception):
    pass

class VirtualMachine(object):
    def __init__(self):
        self.frames = []   # The call stack of frames.
        self.frame = None  # The current frame.
        self.return_value = None
        self.last_exception = None

    def run_code(self, code, global_names=None, local_names=None):
        """ An entry point to execute code using the virtual machine."""
        frame = self.make_frame(code, global_names=global_names, 
                                local_names=local_names)
        self.run_frame(frame)

```

#### `Frame` 类

接下来，我们来写`Frame`对象。帧是一个属性的集合，它没有任何方法。前面提到过，这些属性包括由编译器生成的代码对象；局部、全局和内置命名空间；前一个帧的引用；一个数据栈；一个块栈；最后执行的指令指针。（对于内置命名空间我们需要多做一点工作，Python 在不同模块中对这个命名空间有不同的处理；但这个细节对我们的虚拟机不重要。）

```python
class Frame(object):
    def __init__(self, code_obj, global_names, local_names, prev_frame):
        self.code_obj = code_obj
        self.global_names = global_names
        self.local_names = local_names
        self.prev_frame = prev_frame
        self.stack = []
        if prev_frame:
            self.builtin_names = prev_frame.builtin_names
        else:
            self.builtin_names = local_names['__builtins__']
            if hasattr(self.builtin_names, '__dict__'):
                self.builtin_names = self.builtin_names.__dict__

        self.last_instruction = 0
        self.block_stack = []
```

接着，我们在虚拟机中增加对帧的操作。这有 3 个帮助函数：一个创建新的帧的方法（它负责为新的帧找到名字空间），和压栈和出栈的方法。第四个函数，`run_frame`，完成执行帧的主要工作，待会我们再讨论这个方法。

```python
class VirtualMachine(object):
    [... snip ...]

    # Frame manipulation
    def make_frame(self, code, callargs={}, global_names=None, local_names=None):
        if global_names is not None and local_names is not None:
            local_names = global_names
        elif self.frames:
            global_names = self.frame.global_names
            local_names = {}
        else:
            global_names = local_names = {
                '__builtins__': __builtins__,
                '__name__': '__main__',
                '__doc__': None,
                '__package__': None,
            }
        local_names.update(callargs)
        frame = Frame(code, global_names, local_names, self.frame)
        return frame

    def push_frame(self, frame):
        self.frames.append(frame)
        self.frame = frame

    def pop_frame(self):
        self.frames.pop()
        if self.frames:
            self.frame = self.frames[-1]
        else:
            self.frame = None

    def run_frame(self):
        pass
        # we'll come back to this shortly
```

####  `Function` 类

`Function`的实现有点曲折，但是大部分的细节对理解解释器不重要。重要的是当调用函数时 —— 即调用 `__call__`方法 —— 它创建一个新的`Frame`并运行它。

```python
class Function(object):
    """
    Create a realistic function object, defining the things the interpreter expects.
    """
    __slots__ = [
        'func_code', 'func_name', 'func_defaults', 'func_globals',
        'func_locals', 'func_dict', 'func_closure',
        '__name__', '__dict__', '__doc__',
        '_vm', '_func',
    ]

    def __init__(self, name, code, globs, defaults, closure, vm):
        """You don't need to follow this closely to understand the interpreter."""
        self._vm = vm
        self.func_code = code
        self.func_name = self.__name__ = name or code.co_name
        self.func_defaults = tuple(defaults)
        self.func_globals = globs
        self.func_locals = self._vm.frame.f_locals
        self.__dict__ = {}
        self.func_closure = closure
        self.__doc__ = code.co_consts[0] if code.co_consts else None

        # Sometimes, we need a real Python function.  This is for that.
        kw = {
            'argdefs': self.func_defaults,
        }
        if closure:
            kw['closure'] = tuple(make_cell(0) for _ in closure)
        self._func = types.FunctionType(code, globs, **kw)

    def __call__(self, *args, **kwargs):
        """When calling a Function, make a new frame and run it."""
        callargs = inspect.getcallargs(self._func, *args, **kwargs)
        # Use callargs to provide a mapping of arguments: values to pass into the new 
        # frame.
        frame = self._vm.make_frame(
            self.func_code, callargs, self.func_globals, {}
        )
        return self._vm.run_frame(frame)

def make_cell(value):
    """Create a real Python closure and grab a cell."""
    # Thanks to Alex Gaynor for help with this bit of twistiness.
    fn = (lambda x: lambda: x)(value)
    return fn.__closure__[0]
```

接着，回到`VirtualMachine`对象，我们对数据栈的操作也增加一些帮助方法。字节码操作的栈总是在当前帧的数据栈。这些帮助函数让我们的`POP_TOP`、`LOAD_FAST`以及其他操作栈的指令的实现可读性更高。

```python
class VirtualMachine(object):
    [... snip ...]

    # Data stack manipulation
    def top(self):
        return self.frame.stack[-1]

    def pop(self):
        return self.frame.stack.pop()

    def push(self, *vals):
        self.frame.stack.extend(vals)

    def popn(self, n):
        """Pop a number of values from the value stack.
        A list of `n` values is returned, the deepest value first.
        """
        if n:
            ret = self.frame.stack[-n:]
            self.frame.stack[-n:] = []
            return ret
        else:
            return []
```

在我们运行帧之前，我们还需两个方法。

第一个方法，`parse_byte_and_args` 以一个字节码为输入，先检查它是否有参数，如果有，就解析它的参数。这个方法同时也更新帧的`last_instruction`属性，它指向最后执行的指令。一条没有参数的指令只有一个字节长度，而有参数的字节有3个字节长。参数的意义依赖于指令是什么。比如，前面说过，指令`POP_JUMP_IF_FALSE`，它的参数指的是跳转目标。`BUILD_LIST`，它的参数是列表的个数。`LOAD_CONST`，它的参数是常量的索引。

一些指令用简单的数字作为参数。对于另一些，虚拟机需要一点努力去发现它含意。标准库中的`dis`模块中有一个备忘单，它解释什么参数有什么意思，这让我们的代码更加简洁。比如，列表`dis.hasname`告诉我们`LOAD_NAME`、 `IMPORT_NAME`、`LOAD_GLOBAL`，以及另外的 9 个指令的参数都有同样的意义：对于这些指令，它们的参数代表了代码对象中的名字列表的索引。

```python
class VirtualMachine(object):
    [... snip ...]

    def parse_byte_and_args(self):
        f = self.frame
        opoffset = f.last_instruction
        byteCode = f.code_obj.co_code[opoffset]
        f.last_instruction += 1
        byte_name = dis.opname[byteCode]
        if byteCode >= dis.HAVE_ARGUMENT:
            # index into the bytecode
            arg = f.code_obj.co_code[f.last_instruction:f.last_instruction+2]  
            f.last_instruction += 2   # advance the instruction pointer
            arg_val = arg[0] + (arg[1] * 256)
            if byteCode in dis.hasconst:   # Look up a constant
                arg = f.code_obj.co_consts[arg_val]
            elif byteCode in dis.hasname:  # Look up a name
                arg = f.code_obj.co_names[arg_val]
            elif byteCode in dis.haslocal: # Look up a local name
                arg = f.code_obj.co_varnames[arg_val]
            elif byteCode in dis.hasjrel:  # Calculate a relative jump
                arg = f.last_instruction + arg_val
            else:
                arg = arg_val
            argument = [arg]
        else:
            argument = []

        return byte_name, argument
```

下一个方法是`dispatch`，它查找给定的指令并执行相应的操作。在 CPython 中，这个分派函数用一个巨大的 switch 语句实现，有超过 1500 行的代码。幸运的是，我们用的是 Python，我们的代码会简洁的多。我们会为每一个字节码名字定义一个方法，然后用`getattr`来查找。就像我们前面的小解释器一样，如果一条指令叫做`FOO_BAR`，那么它对应的方法就是`byte_FOO_BAR`。现在，我们先把这些方法当做一个黑盒子。每个指令方法都会返回`None`或者一个字符串`why`,有些情况下虚拟机需要这个额外`why`信息。这些指令方法的返回值，仅作为解释器状态的内部指示，千万不要和执行帧的返回值相混淆。

```python
class VirtualMachine(object):
    [... snip ...]

    def dispatch(self, byte_name, argument):
        """ Dispatch by bytename to the corresponding methods.
        Exceptions are caught and set on the virtual machine."""

        # When later unwinding the block stack,
        # we need to keep track of why we are doing it.
        why = None
        try:
            bytecode_fn = getattr(self, 'byte_%s' % byte_name, None)
            if bytecode_fn is None:
                if byte_name.startswith('UNARY_'):
                    self.unaryOperator(byte_name[6:])
                elif byte_name.startswith('BINARY_'):
                    self.binaryOperator(byte_name[7:])
                else:
                    raise VirtualMachineError(
                        "unsupported bytecode type: %s" % byte_name
                    )
            else:
                why = bytecode_fn(*argument)
        except:
            # deal with exceptions encountered while executing the op.
            self.last_exception = sys.exc_info()[:2] + (None,)
            why = 'exception'

        return why

    def run_frame(self, frame):
        """Run a frame until it returns (somehow).
        Exceptions are raised, the return value is returned.
        """
        self.push_frame(frame)
        while True:
            byte_name, arguments = self.parse_byte_and_args()

            why = self.dispatch(byte_name, arguments)

            # Deal with any block management we need to do
            while why and frame.block_stack:
                why = self.manage_block_stack(why)

            if why:
                break

        self.pop_frame()

        if why == 'exception':
            exc, val, tb = self.last_exception
            e = exc(val)
            e.__traceback__ = tb
            raise e

        return self.return_value
```

####  `Block` 类

在我们完成每个字节码方法前，我们简单的讨论一下块。一个块被用于某种控制流，特别是异常处理和循环。它负责保证当操作完成后数据栈处于正确的状态。比如，在一个循环中，一个特殊的迭代器会存在栈中，当循环完成时它从栈中弹出。解释器需要检查循环仍在继续还是已经停止。

为了跟踪这些额外的信息，解释器设置了一个标志来指示它的状态。我们用一个变量`why`实现这个标志，它可以是`None`或者是下面几个字符串之一：`"continue"`、`"break"`、`"excption"`、`return`。它们指示对块栈和数据栈进行什么操作。回到我们迭代器的例子，如果块栈的栈顶是一个`loop`块，`why`的代码是`continue`，迭代器就应该保存在数据栈上，而如果`why`是`break`，迭代器就会被弹出。

块操作的细节比这个还要繁琐，我们不会花时间在这上面，但是有兴趣的读者值得仔细的看看。

```python
Block = collections.namedtuple("Block", "type, handler, stack_height")

class VirtualMachine(object):
    [... snip ...]

    # Block stack manipulation
    def push_block(self, b_type, handler=None):
        level = len(self.frame.stack)
        self.frame.block_stack.append(Block(b_type, handler, stack_height))

    def pop_block(self):
        return self.frame.block_stack.pop()

    def unwind_block(self, block):
        """Unwind the values on the data stack corresponding to a given block."""
        if block.type == 'except-handler':
            # The exception itself is on the stack as type, value, and traceback.
            offset = 3  
        else:
            offset = 0

        while len(self.frame.stack) > block.level + offset:
            self.pop()

        if block.type == 'except-handler':
            traceback, value, exctype = self.popn(3)
            self.last_exception = exctype, value, traceback

    def manage_block_stack(self, why):
        """ """
        frame = self.frame
        block = frame.block_stack[-1]
        if block.type == 'loop' and why == 'continue':
            self.jump(self.return_value)
            why = None
            return why

        self.pop_block()
        self.unwind_block(block)

        if block.type == 'loop' and why == 'break':
            why = None
            self.jump(block.handler)
            return why

        if (block.type in ['setup-except', 'finally'] and why == 'exception'):
            self.push_block('except-handler')
            exctype, value, tb = self.last_exception
            self.push(tb, value, exctype)
            self.push(tb, value, exctype) # yes, twice
            why = None
            self.jump(block.handler)
            return why

        elif block.type == 'finally':
            if why in ('return', 'continue'):
                self.push(self.return_value)

            self.push(why)

            why = None
            self.jump(block.handler)
            return why
        return why
```

### 指令

剩下了的就是完成那些指令方法了：`byte_LOAD_FAST`、`byte_BINARY_MODULO`等等。而这些指令的实现并不是很有趣，这里我们只展示了一小部分，完整的实现[在 GitHub 上](https://github.com/nedbat/byterun)。（这里包括的指令足够执行我们前面所述的所有代码了。）

```python
class VirtualMachine(object):
    [... snip ...]

    ## Stack manipulation

    def byte_LOAD_CONST(self, const):
        self.push(const)

    def byte_POP_TOP(self):
        self.pop()

    ## Names
    def byte_LOAD_NAME(self, name):
        frame = self.frame
        if name in frame.f_locals:
            val = frame.f_locals[name]
        elif name in frame.f_globals:
            val = frame.f_globals[name]
        elif name in frame.f_builtins:
            val = frame.f_builtins[name]
        else:
            raise NameError("name '%s' is not defined" % name)
        self.push(val)

    def byte_STORE_NAME(self, name):
        self.frame.f_locals[name] = self.pop()

    def byte_LOAD_FAST(self, name):
        if name in self.frame.f_locals:
            val = self.frame.f_locals[name]
        else:
            raise UnboundLocalError(
                "local variable '%s' referenced before assignment" % name
            )
        self.push(val)

    def byte_STORE_FAST(self, name):
        self.frame.f_locals[name] = self.pop()

    def byte_LOAD_GLOBAL(self, name):
        f = self.frame
        if name in f.f_globals:
            val = f.f_globals[name]
        elif name in f.f_builtins:
            val = f.f_builtins[name]
        else:
            raise NameError("global name '%s' is not defined" % name)
        self.push(val)

    ## Operators

    BINARY_OPERATORS = {
        'POWER':    pow,
        'MULTIPLY': operator.mul,
        'FLOOR_DIVIDE': operator.floordiv,
        'TRUE_DIVIDE':  operator.truediv,
        'MODULO':   operator.mod,
        'ADD':      operator.add,
        'SUBTRACT': operator.sub,
        'SUBSCR':   operator.getitem,
        'LSHIFT':   operator.lshift,
        'RSHIFT':   operator.rshift,
        'AND':      operator.and_,
        'XOR':      operator.xor,
        'OR':       operator.or_,
    }

    def binaryOperator(self, op):
        x, y = self.popn(2)
        self.push(self.BINARY_OPERATORS[op](x, y))

    COMPARE_OPERATORS = [
        operator.lt,
        operator.le,
        operator.eq,
        operator.ne,
        operator.gt,
        operator.ge,
        lambda x, y: x in y,
        lambda x, y: x not in y,
        lambda x, y: x is y,
        lambda x, y: x is not y,
        lambda x, y: issubclass(x, Exception) and issubclass(x, y),
    ]

    def byte_COMPARE_OP(self, opnum):
        x, y = self.popn(2)
        self.push(self.COMPARE_OPERATORS[opnum](x, y))

    ## Attributes and indexing

    def byte_LOAD_ATTR(self, attr):
        obj = self.pop()
        val = getattr(obj, attr)
        self.push(val)

    def byte_STORE_ATTR(self, name):
        val, obj = self.popn(2)
        setattr(obj, name, val)

    ## Building

    def byte_BUILD_LIST(self, count):
        elts = self.popn(count)
        self.push(elts)

    def byte_BUILD_MAP(self, size):
        self.push({})

    def byte_STORE_MAP(self):
        the_map, val, key = self.popn(3)
        the_map[key] = val
        self.push(the_map)

    def byte_LIST_APPEND(self, count):
        val = self.pop()
        the_list = self.frame.stack[-count] # peek
        the_list.append(val)

    ## Jumps

    def byte_JUMP_FORWARD(self, jump):
        self.jump(jump)

    def byte_JUMP_ABSOLUTE(self, jump):
        self.jump(jump)

    def byte_POP_JUMP_IF_TRUE(self, jump):
        val = self.pop()
        if val:
            self.jump(jump)

    def byte_POP_JUMP_IF_FALSE(self, jump):
        val = self.pop()
        if not val:
            self.jump(jump)

    ## Blocks

    def byte_SETUP_LOOP(self, dest):
        self.push_block('loop', dest)

    def byte_GET_ITER(self):
        self.push(iter(self.pop()))

    def byte_FOR_ITER(self, jump):
        iterobj = self.top()
        try:
            v = next(iterobj)
            self.push(v)
        except StopIteration:
            self.pop()
            self.jump(jump)

    def byte_BREAK_LOOP(self):
        return 'break'

    def byte_POP_BLOCK(self):
        self.pop_block()

    ## Functions

    def byte_MAKE_FUNCTION(self, argc):
        name = self.pop()
        code = self.pop()
        defaults = self.popn(argc)
        globs = self.frame.f_globals
        fn = Function(name, code, globs, defaults, None, self)
        self.push(fn)

    def byte_CALL_FUNCTION(self, arg):
        lenKw, lenPos = divmod(arg, 256) # KWargs not supported here
        posargs = self.popn(lenPos)

        func = self.pop()
        frame = self.frame
        retval = func(*posargs)
        self.push(retval)

    def byte_RETURN_VALUE(self):
        self.return_value = self.pop()
        return "return"
```

### 动态类型：编译器不知道它是什么

你可能听过 Python 是一种动态语言 —— 它是动态类型的。在我们建造解释器的过程中，已经透露出这样的信息。

动态的一个意思是很多工作是在运行时完成的。前面我们看到 Python 的编译器没有很多关于代码真正做什么的信息。举个例子，考虑下面这个简单的函数`mod`。它取两个参数，返回它们的模运算值。从它的字节码中，我们看到变量`a`和`b`首先被加载，然后字节码`BINAY_MODULO`完成这个模运算。

```python
>>> def mod(a, b):
...    return a % b
>>> dis.dis(mod)
  2           0 LOAD_FAST                0 (a)
              3 LOAD_FAST                1 (b)
              6 BINARY_MODULO
              7 RETURN_VALUE
>>> mod(19, 5)
4
```

计算 19 % 5 得4，—— 一点也不奇怪。如果我们用不同类的参数呢？

```python
>>> mod("by%sde", "teco")
'bytecode'
```

刚才发生了什么？你可能在其它地方见过这样的语法，格式化字符串。

```
>>> print("by%sde" % "teco")
bytecode
```

用符号`%`去格式化字符串会调用字节码`BUNARY_MODULO`。它取栈顶的两个值求模，不管这两个值是字符串、数字或是你自己定义的类的实例。字节码在函数编译时生成（或者说，函数定义时）相同的字节码会用于不同类的参数。

Python 的编译器关于字节码的功能知道的很少，而取决于解释器来决定`BINAYR_MODULO`应用于什么类型的对象并完成正确的操作。这就是为什么 Python 被描述为动态类型（dynamically typed）：直到运行前你不必知道这个函数参数的类型。相反，在一个静态类型语言中，程序员需要告诉编译器参数的类型是什么（或者编译器自己推断出参数的类型。）

编译器的无知是优化 Python 的一个挑战 —— 只看字节码，而不真正运行它，你就不知道每条字节码在干什么！你可以定义一个类，实现`__mod__`方法，当你对这个类的实例使用`%`时，Python 就会自动调用这个方法。所以，`BINARY_MODULO`其实可以运行任何代码。

看看下面的代码，第一个`a % b`看起来没有用。

```python
def mod(a,b):
    a % b
    return a %b
```

不幸的是，对这段代码进行静态分析 —— 不运行它 —— 不能确定第一个`a % b`没有做任何事。用 `%`调用`__mod__`可能会写一个文件，或是和程序的其他部分交互，或者其他任何可以在 Python 中完成的事。很难优化一个你不知道它会做什么的函数。在 Russell Power 和 Alex Rubinsteyn 的优秀论文中写道，“我们可以用多快的速度解释 Python？”，他们说，“在普遍缺乏类型信息下，每条指令必须被看作一个`INVOKE_ARBITRARY_METHOD`。”

### 总结

Byterun 是一个比 CPython 容易理解的简洁的 Python 解释器。Byterun 复制了 CPython 的主要结构：一个基于栈的解释器对称之为字节码的指令集进行操作，它们顺序执行或在指令间跳转，向栈中压入和从中弹出数据。解释器随着函数和生成器的调用和返回，动态的创建、销毁帧，并在帧之间跳转。Byterun 也有着和真正解释器一样的限制：因为 Python 使用动态类型，解释器必须在运行时决定指令的正确行为。

我鼓励你去反汇编你的程序，然后用 Byterun 来运行。你很快会发现这个缩短版的 Byterun 所没有实现的指令。完整的实现在 https://github.com/nedbat/byterun ，或者你可以仔细阅读真正的 CPython 解释器`ceval.c`，你也可以实现自己的解释器！

### 致谢

感谢 Ned Batchelder 发起这个项目并引导我的贡献，感谢 Michael Arntzenius 帮助调试代码和这篇文章的修订，感谢 Leta Montopoli 的修订，以及感谢整个 Recurse Center 社区的支持和鼓励。所有的不足全是我自己没搞好。

--------------------------------------
via: http://aosabook.org/en/500L/a-python-interpreter-written-in-python.html

作者： Allison Kaptur
译者：[qingyunha](https://github.com/qingyunha) 
校对：[wxy](https://github.com/wxy) 

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出 
