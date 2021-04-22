[#]: subject: (Optimize your Python code with C)
[#]: via: (https://opensource.com/article/21/4/cython)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Optimize your Python code with C
======
Cython creates C modules that speed up Python code execution, important
for complex applications where an interpreted language isn't efficient.
![Hands on a keyboard with a Python book ][1]

Cython is a compiler for the Python programming language meant to optimize performance and form an extended Cython programming language. As an extension of Python, [Cython][2] is also a superset of the Python language, and it supports calling C functions and declaring C types on variables and class attributes. This makes it easy to wrap external C libraries, embed C into existing applications, or write C extensions for Python in syntax as easy as Python itself.

Cython is commonly used to create C modules that speed up Python code execution. This is important in complex applications where an interpreted language isn't efficient.

### Install Cython

You can install Cython on Linux, BSD, Windows, or macOS using Python:


```
`$ python -m pip install Cython`
```

Once installed, it's ready to use.

### Transform Python into C

A good way to start with Cython is with a simple "hello world" application. It's not the best demonstration of Cython's advantages, but it shows what happens when you're using Cython.

First, create this simple Python script in a file called `hello.pyx` (the `.pyx` extension isn't magical and it could technically be anything, but it's Cython's default extension):


```
`print("hello world")`
```

Next, create a Python setup script. A `setup.py` file is like Python's version of a makefile, and Cython can use it to process your Python code:


```
from setuptools import setup
from Cython.Build import cythonize

setup(
    ext_modules = cythonize("hello.pyx")
)
```

Finally, use Cython to transform your Python script into C code:


```
`$ python setup.py build_ext --inplace`
```

You can see the results in your project directory. Cython's `cythonize` module transforms `hello.pyx` into a `hello.c` file and a `.so` library. The C code is 2,648 lines, so it's quite a lot more text than the single line of `hello.pyx` source. The `.so` library is also over 2,000 times larger than its source (54,000 compared to 20 bytes). Then again, Python is required to run a single Python script, so there's a lot of code propping up that single-line `hello.pyx` file.

To use the C code version of your Python "hello world" script, open a Python prompt and import the new `hello` module you created:


```
&gt;&gt;&gt; import hello
hello world
```

### Integrate C code into Python

A good generic test of computational power is calculating prime numbers. A prime number is a positive number greater than 1 that produces a positive integer only when divided by 1 or itself. It's simple in theory, but as numbers get larger, the calculation requirements also increase. In pure Python, it can be done in under 10 lines of code:


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

This script is silent upon success and returns a message if the number is not prime:


```
$ ./prime.py 3
$ ./prime.py 4
Not prime.
```

Converting this to Cython requires a little work, partly to make the code appropriate for use as a library and partly for performance.

#### Scripts and libraries

Many users learn Python as a scripting language: you tell Python the steps you want it to perform, and it does the work. As you learn more about Python (and open source programming in general), you learn that much of the most powerful code out there is in the libraries that other applications can harness. The _less_ specific your code is, the more likely it can be repurposed by a programmer (you included) for other applications. It can be a little more work to decouple computation from workflow, but in the end, it's usually worth the effort.

In the case of this simple prime number calculator, converting it to Cython begins with a setup script:


```
from setuptools import setup
from Cython.Build import cythonize

setup(
    ext_modules = cythonize("prime.py")
)
```

Transform your script into C:


```
`$ python setup.py build_ext --inplace`
```

Everything appears to be working well so far, but when you attempt to import and use your new module, you get an error:


```
&gt;&gt;&gt; import prime
Traceback (most recent call last):
  File "&lt;stdin&gt;", line 1, in &lt;module&gt;
  File "prime.py", line 2, in init prime
    number = sys.argv[1]
IndexError: list index out of range
```

The problem is that a Python script expects to be run from a terminal, where arguments (in this case, an integer to test as a prime number) are common. You need to modify your script so that it can be used as a library instead.

#### Write a library

Libraries don't use system arguments and instead accept arguments from other code. Instead of using `sys.argv` to bring in user input, make your code a function that accepts an argument called `number` (or `num` or whatever variable name you prefer):


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

This admittedly makes your script somewhat difficult to test because when you run the code in Python, the `calculate` function is never executed. However, Python programmers have devised a common, if not intuitive, workaround for this problem. When the Python interpreter executes a Python script, there's a special variable called `__name__` that gets set to `__main__`, but when it's imported as a module, `__name__` is set to the module's name. By leveraging this, you can write a library that is both a Python module and a valid Python script:


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

Now you can run the code as a command:


```
$ python ./prime.py 4
Not a prime
```

And you can convert it to Cython for use as a module:


```
&gt;&gt;&gt; import prime
&gt;&gt;&gt; prime.calculate(4)
Not prime
```

### C Python

Converting code from pure Python to C with Cython can be useful. This article demonstrates how to do that part, yet there are Cython features to help you optimize your code before conversion, options to analyze your code to find when Cython interacts with C, and much more. If you're using Python, but you're looking to enhance your code with C code or further your understanding of how libraries provide better extensibility than scripts, or if you're just curious about how Python and C can work together, then start experimenting with Cython.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/cython

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://cython.org/
