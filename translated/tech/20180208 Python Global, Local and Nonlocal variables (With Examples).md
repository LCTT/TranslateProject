Python全局，局部和非局部变量（带示例）
======

### 全局变量

在Python中，在函数之外或在全局范围内声明的变量被称为全局变量。 这意味着，全局变量可以在函数内部或外部访问。

我们来看一个关于如何在Python中创建一个全局变量的示例。

#### 示例1：创建全局变量
```python
x = "global"

def foo():
    print("x inside :", x)

foo()
    print("x outside:", x)
```

当我们运行代码时，将会输出：
```
x inside : global
x outside: global
```

在上面的代码中，我们创建了x作为全局变量，并定义了一个`foo()`来打印全局变量x。 最后，我们调用`foo()`来打印x的值。

倘若你想改变一个函数内的x的值该怎么办？

```python
x = "global"

def foo():
    x = x * 2
    print(x)
foo()
```

当我们运行代码时，将会输出：
```
UnboundLocalError: local variable 'x' referenced before assignment
```

输出显示一个错误，因为Python将x视为局部变量，x也没有`foo()`内部定义。

为了运行正常，我们使用`global`关键字，访问[PythonGlobal关键字][1]以便了解更多。

### 局部变量

在函数体内或局部作用域内声明的变量称为局部变量。

#### 示例2：访问作用域外的局部变量

```python
def foo():
    y = "local"

foo()
print(y)
```

当我们运行代码时，将会输出：
```
NameError: name 'y' is not defined
```

输出显示了一个错误，因为我们试图在全局范围内访问局部变量y，而局部变量只能在`foo() `函数内部或局部作用域内有效。

我们来看一个关于如何在Python中创建一个局部变量的例子。

#### 示例3：创建一个局部变量

通常，我们在函数内声明一个变量来创建一个局部变量。
```python
def foo():
    y = "local"
    print(y)

foo()
```

当我们运行代码时，将会输出：
```
local
```

让我们来看看前面的问题，其中x是一个全局变量，我们想修改`foo()`内部的x。

### 全局变量和局部变量

在这里，我们将展示如何在同一份代码中使用全局变量和局部变量。

#### 示例4：在同一份代码中使用全局变量和局部变量
```python
x = "global"

def foo():
    global x
    y = "local"
    x = x * 2
    print(x)
    print(y)

foo()
```

当我们运行代码时，将会输出（译者注：原文中输出结果的两个global有空格，正确的是没有空格）：
```
globalglobal
local
```

在上面的代码中，我们将x声明为全局变量，将y声明为`foo()`中的局部变量。 然后，我们使用乘法运算符`*`来修改全局变量x，并打印x和y。

在调用`foo()`之后，x的值变成`globalglobal`了（译者注：原文同样有空格，正确的是没有空格），因为我们使用`x * 2`打印两次`global`。 之后，我们打印局部变量y的值，即`local`。

#### 示例5：具有相同名称的全局变量和局部变量
```python
x = 5

def foo():
    x = 10
    print("local x:", x)

foo()
print("global x:", x)
```

当我们运行代码时，将会输出：
```
local x: 10
global x: 5
```

在上面的代码中，我们对全局变量和局部变量使用了相同的名称x。 当我们打印相同的变量时却得到了不同的结果，因为这两个作用域内都声明了变量，即`foo()`内部的局部作用域和`foo()`外面的全局作用域。

当我们在`foo()`内部打印变量时，它输出`local x: 10`，这被称为变量的局部作用域。

同样，当我们在`foo()`外部打印变量时，它输出`global x: 5`，这被称为变量的全局作用域。

### 非局部变量

非局部变量用于局部作用域未定义的嵌套函数。 这意味着，变量既不能在局部也不能在全局范围内。

我们来看一个关于如何在Python中创建一个非局部变量的例子。（译者注：原文为创建全局变量，疑为笔误）

我们使用`nonlocal`关键字来创建非局部变量。

#### 例6：创建一个非局部变量
```python
def outer():
    x = "local"
    
    def inner():
        nonlocal x
        x = "nonlocal"
        print("inner:", x)
    
    inner()
    print("outer:", x)

outer()
```

当我们运行代码时，将会输出：
```
inner: nonlocal
outer: nonlocal
```

在上面的代码中有一个嵌套函数`inner()`。 我们使用`nonlocal`关键字来创建非局部变量。`inner()`函数是在另一个函数`outer()`的作用域中定义的。

注意：如果我们改变非局部变量的值，那么变化就会出现在局部变量中。

--------------------------------------------------------------------------------

via: https://www.programiz.com/python-programming/global-local-nonlocal-variables

作者：[programiz][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.programiz.com/
[1]:https://www.programiz.com/python-programming/global-keyword
