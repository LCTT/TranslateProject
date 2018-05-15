Translating by qhwdw
An introduction to Python bytecode
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82)
If you've ever written, or even just used, Python, you're probably used to seeing Python source code files; they have names ending in `.py`. And you may also have seen another type of file, with a name ending in `.pyc`, and you may have heard that they're Python "bytecode" files. (These are a bit harder to see on Python 3—instead of ending up in the same directory as your `.py` files, they go into a subdirectory called `__pycache__`.) And maybe you've heard that this is some kind of time-saver that prevents Python from having to re-parse your source code every time it runs.

But beyond "oh, that's Python bytecode," do you really know what's in those files and how Python uses them?

If not, today's your lucky day! I'll take you through what Python bytecode is, how Python uses it to execute your code, and how knowing about it can help you.

### How Python works

Python is often described as an interpreted language—one in which your source code is translated into native CPU instructions as the program runs—but this is only partially correct. Python, like many interpreted languages, actually compiles source code to a set of instructions for a virtual machine, and the Python interpreter is an implementation of that virtual machine. This intermediate format is called "bytecode."

So those `.pyc` files Python leaves lying around aren't just some "faster" or "optimized" version of your source code; they're the bytecode instructions that will be executed by Python's virtual machine as your program runs.

Let's look at an example. Here's a classic "Hello, World!" written in Python:
```
def hello()

    print("Hello, World!")

```

And here's the bytecode it turns into (translated into a human-readable form):
```
2           0 LOAD_GLOBAL              0 (print)

            2 LOAD_CONST               1 ('Hello, World!')

            4 CALL_FUNCTION            1

```

If you type up that `hello()` function and use the [CPython][1] interpreter to run it, the above listing is what Python will execute. It might look a little weird, though, so let's take a deeper look at what's going on.

### Inside the Python virtual machine

CPython uses a stack-based virtual machine. That is, it's oriented entirely around stack data structures (where you can "push" an item onto the "top" of the structure, or "pop" an item off the "top").

CPython uses three types of stacks:

  1. The **call stack**. This is the main structure of a running Python program. It has one item—a  "frame"—for each currently active function call, with the bottom of the stack being the entry point of the program. Every function call pushes a new frame onto the call stack, and every time a function call returns, its frame is popped off.
  2. In each frame, there's an **evaluation stack** (also called the **data stack** ). This stack is where execution of a Python function occurs, and executing Python code consists mostly of pushing things onto this stack, manipulating them, and popping them back off.
  3. Also in each frame, there's a **block stack**. This is used by Python to keep track of certain types of control structures: loops, `try`/`except` blocks, and `with` blocks all cause entries to be pushed onto the block stack, and the block stack gets popped whenever you exit one of those structures. This helps Python know which blocks are active at any given moment so that, for example, a `continue` or `break` statement can affect the correct block.



Most of Python's bytecode instructions manipulate the evaluation stack of the current call-stack frame, although there are some instructions that do other things (like jump to specific instructions or manipulate the block stack).

To get a feel for this, suppose we have some code that calls a function, like this: `my_function(my_variable, 2)`. Python will translate this into a sequence of four bytecode instructions:

  1. A `LOAD_NAME` instruction that looks up the function object `my_function` and pushes it onto the top of the evaluation stack
  2. Another `LOAD_NAME` instruction to look up the variable `my_variable` and push it on top of the evaluation stack
  3. A `LOAD_CONST` instruction to push the literal integer value `2` on top of the evaluation stack
  4. A `CALL_FUNCTION` instruction



The `CALL_FUNCTION` instruction will have an argument of 2, which indicates that Python needs to pop two positional arguments off the top of the stack; then the function to call will be on top, and it can be popped as well (for functions involving keyword arguments, a different instruction—`CALL_FUNCTION_KW`—is used, but with a similar principle of operation, and a third instruction, `CALL_FUNCTION_EX`, is used for function calls that involve argument unpacking with the `*` or `**` operators). Once Python has all that, it will allocate a new frame on the call stack, populate the local variables for the function call, and execute the bytecode of `my_function` inside that frame. Once that's done, the frame will be popped off the call stack, and in the original frame the return value of `my_function` will be pushed on top of the evaluation stack.

### Accessing and understanding Python bytecode

If you want to play around with this, the `dis` module in the Python standard library is a huge help; the `dis` module provides a "disassembler" for Python bytecode, making it easy to get a human-readable version and look up the various bytecode instructions. [The documentation for the `dis` module][2] goes over its contents and provides a full list of bytecode instructions along with what they do and what arguments they take.

For example, to get the bytecode listing for the `hello()` function above, I typed it into a Python interpreter, then ran:
```
import dis

dis.dis(hello)

```

The function `dis.dis()` will disassemble a function, method, class, module, compiled Python code object, or string literal containing source code and print a human-readable version. Another handy function in the `dis` module is `distb()`. You can pass it a Python traceback object or call it after an exception has been raised, and it will disassemble the topmost function on the call stack at the time of the exception, print its bytecode, and insert a pointer to the instruction that raised the exception.

It's also useful to look at the compiled code objects Python builds for every function since executing a function makes use of attributes of those code objects. Here's an example looking at the `hello()` function:
```
>>> hello.__code__

<code object hello at 0x104e46930, file "<stdin>", line 1>

>>> hello.__code__.co_consts

(None, 'Hello, World!')

>>> hello.__code__.co_varnames

()

>>> hello.__code__.co_names

('print',)

```

The code object is accessible as the attribute `__code__` on the function and carries a few important attributes:

  * `co_consts` is a tuple of any literals that occur in the function body
  * `co_varnames` is a tuple containing the names of any local variables used in the function body
  * `co_names` is a tuple of any non-local names referenced in the function body



Many bytecode instructions—particularly those that load values to be pushed onto the stack or store values in variables and attributes—use indices in these tuples as their arguments.

So now we can understand the bytecode listing of the `hello()` function:

  1. `LOAD_GLOBAL 0`: tells Python to look up the global object referenced by the name at index 0 of `co_names` (which is the `print` function) and push it onto the evaluation stack
  2. `LOAD_CONST 1`: takes the literal value at index 1 of `co_consts` and pushes it (the value at index 0 is the literal `None`, which is present in `co_consts` because Python function calls have an implicit return value of `None` if no explicit `return` statement is reached)
  3. `CALL_FUNCTION 1`: tells Python to call a function; it will need to pop one positional argument off the stack, then the new top-of-stack will be the function to call.



The "raw" bytecode—as non-human-readable bytes—is also available on the code object as the attribute `co_code`. You can use the list `dis.opname` to look up the names of bytecode instructions from their decimal byte values if you'd like to try to manually disassemble a function.

### Putting bytecode to use

Now that you've read this far, you might be thinking "OK, I guess that's cool, but what's the practical value of knowing this?" Setting aside curiosity for curiosity's sake, understanding Python bytecode is useful in a few ways.

First, understanding Python's execution model helps you reason about your code. People like to joke about C being a kind of "portable assembler," where you can make good guesses about what machine instructions a particular chunk of C source code will turn into. Understanding bytecode will give you the same ability with Python—if you can anticipate what bytecode your Python source code turns into, you can make better decisions about how to write and optimize it.

Second, understanding bytecode is a useful way to answer questions about Python. For example, I often see newer Python programmers wondering why certain constructs are faster than others (like why `{}` is faster than `dict()`). Knowing how to access and read Python bytecode lets you work out the answers (try it: `dis.dis("{}")` versus `dis.dis("dict()")`).

Finally, understanding bytecode and how Python executes it gives a useful perspective on a particular kind of programming that Python programmers don't often engage in: stack-oriented programming. If you've ever used a stack-oriented language like FORTH or Factor, this may be old news, but if you're not familiar with this approach, learning about Python bytecode and understanding how its stack-oriented programming model works is a neat way to broaden your programming knowledge.

### Further reading

If you'd like to learn more about Python bytecode, the Python virtual machine, and how they work, I recommend these resources:

  * [Inside the Python Virtual Machine][3] by Obi Ike-Nwosu is a free online book that does a deep dive into the Python interpreter, explaining in detail how Python actually works.
  * [A Python Interpreter Written in Python][4] by Allison Kaptur is a tutorial for building a Python bytecode interpreter in—what else—Python itself, and it implements all the machinery to run Python bytecode.
  * Finally, the CPython interpreter is open source and you can [read through it on GitHub][1]. The implementation of the bytecode interpreter is in the file `Python/ceval.c`. [Here's that file for the Python 3.6.4 release][5]; the bytecode instructions are handled by the `switch` statement beginning on line 1266.



To learn more, attend James Bennett's talk, [A Bit about Bytes: Understanding Python Bytecode][6], at [PyCon Cleveland 2018][7].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/introduction-python-bytecode

作者：[James Bennett][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ubernostrum
[1]:https://github.com/python/cpython
[2]:https://docs.python.org/3/library/dis.html
[3]:https://leanpub.com/insidethepythonvirtualmachine
[4]:http://www.aosabook.org/en/500L/a-python-interpreter-written-in-python.html
[5]:https://github.com/python/cpython/blob/d48ecebad5ac78a1783e09b0d32c211d9754edf4/Python/ceval.c
[6]:https://us.pycon.org/2018/schedule/presentation/127/
[7]:https://us.pycon.org/2018/
