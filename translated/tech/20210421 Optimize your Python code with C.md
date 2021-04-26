[#]: subject: (Optimize your Python code with C)
[#]: via: (https://opensource.com/article/21/4/cython)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)
[#]: collector: (lujun9972)
[#]: translator: (ShuyRoy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

使用C优化你的Python代码
======
Cython创建了C模块来加速Python代码的执行，这对使用效率不高的解释型语言编写的复杂的应用是很重要的。
![Hands on a keyboard with a Python book ][1]

Cython是Python编程语言的编译器，旨在优化性能并形成一个扩展的Cython编程语言。作为Python的扩展，[Cython][2]也是Python语言的超集，它支持调用C函数和在变量和类属性上声明C类型。这使得包装外部C库、将C嵌入现有应用程序或者为Python编写C扩展语法像Python本身一样简单变得容易。

Cython一般用于创建C模块来加速Python代码的执行。这在使用解释型语言编写的效率不高的复杂应用中非常重要。

### 安装Cython

你可以在Linux，BSD，Windows或macOS上安装Cython来使用Python


```
`$ python -m pip install Cython`
```

安装好后，就可以使用它了。

### 将Python转换成C

使用Cython的一个好的方式是从一个简单的“hello world”开始。这虽然不是Cython优点的最好的展现方式，但是它展示了使用Cython时发生的情况。

首先，创建一个简单的Python脚本，文件命名为`hello.pyx` （`.pyx`扩展名并不神奇，从技术上它可以是任何东西，但它是Cython的默认扩展名）：


```
`print("hello world")`
```

接下来，创建一个Python设置脚本。一个像Python的生成文件一样的`setup.py`，Cython可以使用它来处理你的Python代码：


```
from setuptools import setup
from Cython.Build import cythonize

setup(
    ext_modules = cythonize("hello.pyx")
)
```

最后，使用Cython将你的Python脚本转换为C代码：


```
`$ python setup.py build_ext --inplace`
```

你可以在你的工程目录中看到结果。Cython的`cythonize`模块将`hello.pyx`转换成一个`hello.c`文件和一个`.so`库。该C代码有2648行，所以它比一个一行的`hello.pyx`源码的文本要多很多。`.so`库也比它的源码大2000倍（即54000字节和20字节相比）。然后，Python需要运行单个Python脚本，所以有很多代码支持这个只有一行的`hello.pyx`文件。

要使用Python的“hello world”脚本的C代码版本，请打开一个Python提示符并导入您创建的新`hello`模块：


```
&gt;&gt;&gt; import hello
hello world
```

### 将C代码集成到Python中

测试计算能力的一个很好的通用测试是计算质数。一个质数是一个比1大的正数，且它只有被1或它自己除后才会产生正整数。虽然理论很简单，但是随着数的变大，计算需求也会增加。在纯Python中，可以用10行以内的代码完成质数的计算。


```
import sys

number = int(sys.argv[1])
if not number &lt;= 1:
    for i in range(2, number):
        if (number % i) == 0:
            print("Not prime")
            break
else:
    print("Integer must be greater than 1")
```

这个脚本在成功的时候是不会提醒的，如果这个数不是质数，则返回一条信息：


```
$ ./prime.py 3
$ ./prime.py 4
Not prime.
```

将这些转换为Cython需要一些工作，一部分是为了使代码适合用作库，另一部分是为了提高性能。

#### 脚本和库

许多用户将Python当作一种脚本语言来学习：你告诉Python你想让它执行的步骤，然后它来做。随着你对Python（以及一般的开源编程）的了解越多，你可以了解到许多强大的代码都存在于其他应用程序可以利用的库中。你的代码越_不具有针对性_，程序员（包括你）就越可能将其重用于其他的应用程序。将计算和工作流解耦可能需要更多的工作，但最终这通常是值得的。


在这个简单的质数计算的例子中，将Python转换成Cython从一个设置脚本开始：

```
from setuptools import setup
from Cython.Build import cythonize

setup(
    ext_modules = cythonize("prime.py")
)
```

将你的脚本转换成C：


```
`$ python setup.py build_ext --inplace`
```

到目前为止，一切似乎都工作的很好，但是当你试图导入并使用新模块时，你会看到一个错误：


```
&gt;&gt;&gt; import prime
Traceback (most recent call last):
  File "&lt;stdin&gt;", line 1, in &lt;module&gt;
  File "prime.py", line 2, in init prime
    number = sys.argv[1]
IndexError: list index out of range
```

这个问题是Python脚本希望从一个终端运行，其中参数（在这个例子中是要测试是否为质数的整数）是一样的。你需要修改你的脚本这样它就可以作为一个库来使用了。

#### 写一个库

库不使用系统参数，而是接受其他代码的参数。对于用户输入，不是使用`sys.argv`，而是将你的代码封装成一个函数来接收一个叫`number`（或者`num`，或者任何你喜欢的变量名）的参数：


```
def calculate(number):
    if not number &lt;= 1:
        for i in range(2, number):
            if (number % i) == 0:
                print("Not prime")
                break
    else:
        print("Integer must be greater than 1")
```

这确实使你的脚本有些难测试，因为当你在Python中运行代码时，`calculate`函数永远不会被执行。但是，Python编程人员已经为这个问题设计了一个通用但不是很直观的解决方案。当Python解释器执行一个Python脚本时，有一个叫`__name__`的特殊变量，这个变量被设置为`__main__`，但是当它被作为模块导入的时候，`__name__` 被设置为模块的名字。利用这点，你可以写一个既是Python模块又是有效Python脚本的库：


```
import sys

def calculate(number):
    if not number &lt;= 1:
        for i in range(2, number):
            if (number % i) == 0:
                print("Not prime")
                break
    else:
        print("Integer must be greater than 1")

if __name__ == "__main__":
    number = sys.argv[1]    
    calculate( int(number) )
```

现在你可以用一个命令来运行代码了：


```
$ python ./prime.py 4
Not a prime
```

你可以将它转换为Cython来用作一个模块：


```
&gt;&gt;&gt; import prime
&gt;&gt;&gt; prime.calculate(4)
Not prime
```

### C Python

用Cython将纯Python的代码转换为C是有用的。这篇文章描述了如何做，但是Cython的特性可以帮助你在转换之前优化你的代码，分析你的代码来找到Cython什么时候与C进行交互，以及更多。如果你正在用Python，但是你希望用C代码改进你的代码，或者进一步理解库是如何提供比脚本更好的扩展性的，或者你只是好奇Python和C是如何协作的，那么就开始使用Cython吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/cython

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[ShuyRoy](https://github.com/ShuyRoy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://cython.org/
