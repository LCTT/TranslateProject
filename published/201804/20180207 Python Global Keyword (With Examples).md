初识 Python： global 关键字
======

在读这篇文章之前，确保你对 [Python  全局、本地和非本地变量][1] 有一定的基础。

### global 关键字简介

在 Python 中，`global` 关键字允许你修改当前范围之外的变量。它用于创建全局变量并在本地上下文中更改变量。

### global 关键字的规则

在 Python 中，有关 `global` 关键字基本规则如下：

* 当我们在一个函数中创建一个变量时，默认情况下它是本地变量。
* 当我们在一个函数之外定义一个变量时，默认情况下它是全局变量。你不必使用 `global` 关键字。
* 我们使用 `global` 关键字在一个函数中来读写全局变量。
* 在一个函数外使用 `global` 关键字没有效果。

### 使用  global 关键字（含示例）

我们来举个例子。

#### 示例 1：从函数内部访问全局变量

```
c = 1 # 全局变量
def add():
	print(c)
	
add()
```

运行程序，输出为：

```
1
```

但是我们可能有一些场景需要从函数内部修改全局变量。

#### 示例 2：在函数内部修改全局变量

```
c = 1 # 全局变量
def add():
	c = c + 2 # 将 c 增加 2
	print(c)
add()
```

运行程序，输出显示错误：

```
UnboundLocalError: local variable 'c' referenced before assignment
```

这是因为在函数中，我们只能访问全局变量但是不能修改它。

解决的办法是使用 `global` 关键字。

#### 示例 3：使用 global 在函数中改变全局变量

```
c = 0 # global variable
	
def add():
	global c
	c = c + 2 # 将 c 增加 2
	print("Inside add():", c)

add()
print("In main:", c)
```

运行程序，输出为：

```
Inside add(): 2
In main: 2
```

在上面的程序中，我们在 `add()` 函数中定义了 `c` 将其作为全局关键字。

然后，我们给变量 `c` 增加 `2`，即 `c = c + 2`。之后，我们调用了 `add()` 函数。最后，打印全局变量 `c`。

正如我们所看到的，在函数外的全局变量也发生了变化，`c = 2`。

### Python 模块中的全局变量

在 Python 中，我们创建一个单独的模块 `config.py` 来保存全局变量并在同一个程序中的 Python 模块之间共享信息。

以下是如何通过 Python 模块共享全局变量。

#### 示例 4：在Python模块中共享全局变量

创建 `config.py` 文件来存储全局变量

```
a = 0
b = "empty"
```

创建 `update.py` 文件来改变全局变量

```
import config
	
config.a = 10
config.b = "alphabet"
```

创建 `main.py` 文件来测试其值的变化

```
import config
import update
	
print(config.a)
print(config.b)
```

运行 `main.py`，输出为：
	
```
10
alphabet
```

在上面，我们创建了三个文件： `config.py`, `update.py` 和 `main.py`。

在 `config.py` 模块中保存了全局变量 `a` 和 `b`。在 `update.py` 文件中，我们导入了 `config.py` 模块并改变了 `a` 和 `b` 的值。同样，在 `main.py` 文件，我们导入了 `config.py` 和 `update.py` 模块。最后，我们打印并测试全局变量的值，无论它们是否被改变。

### 在嵌套函数中的全局变量

以下是如何在嵌套函数中使用全局变量。

#### 示例 5：在嵌套函数中使用全局变量

```
def foo():
	x = 20
	def bar():
		 global x
		 x = 25
	
	print("Before calling bar: ", x)
	print("Calling bar now")
	bar()
	print("After calling bar: ", x)

foo()
print("x in main : ", x)
```

输出为：

```
Before calling bar: 20
Calling bar now
After calling bar: 20
x in main : 25
```

在上面的程序中，我们在一个嵌套函数 `bar()` 中声明了全局变量。在 `foo()` 函数中， 变量 `x` 没有全局关键字的作用。

调用 `bar()` 之前和之后， 变量 `x` 取本地变量的值，即 `x = 20`。在 `foo()` 函数之外，变量 `x` 会取在函数 `bar()` 中的值，即 `x = 25`。这是因为在 `bar()` 中，我们对 `x` 使用 `global` 关键字创建了一个全局变量（本地范围）。

如果我们在 `bar()` 函数内进行了任何修改，那么这些修改就会出现在本地范围之外，即 `foo()`。

--------------------------------------------------------------------------------

via: [https://www.programiz.com/python-programming/global-keyword](https://www.programiz.com/python-programming/global-keyword)

作者：[programiz][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.programiz.com
[1]:https://www.programiz.com/python-programming/global-local-nonlocal-variables
