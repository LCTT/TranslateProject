StdioA translating

Getting Started with Python Programming and Scripting in Linux – Part 1
===============================================================================


It has been said (and often required by recruitment agencies) that system administrators need to be proficient in a scripting language. While most of us may be comfortable using [Bash][1] (or other shell of our choice) to run command-line scripts, a powerful language such as Python can add several benefits.

![](http://www.tecmint.com/wp-content/uploads/2016/05/Learn-Python-Programming-Scripting-in-Linux.png)
>Learn Python Programming Scripting in Linux

To begin with, Python allows us to access the tools of the command-line environment and to make use of Object Oriented Programming features (more on this later in this article).

On top of it, learning Python can boost your career in the fields of [desktop applications][2] and [data science][3].

Being so easy to learn, so vastly used, and having a plethora of ready-to-use modules (external files that contain Python statements), no wonder Python is the preferred language to teach programming to first-year computer science students in the United States.

In this 2-article series we will review the fundamentals of Python in hopes that you will find it useful as a springboard to get you started with programming and as a quick-reference guide afterwards. That said, let’s get started.

### Python in Linux

Python versions 2.x and 3.x are usually available in most modern Linux distributions out of the box. You can enter a Python shell by typing `python` or `python3` in your terminal emulator and exit with `quit()`:

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
>Running Python Commands on Linux

If you want to discard Python 2.x and use 3.x instead when you type python, you can modify the corresponding symbolic links as follows:

```
$ sudo rm /usr/bin/python 
$ cd /usr/bin
$ ln -s python3.2 python # Choose the Python 3.x binary here
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Remove-Python-2-and-Use-Python-3.png)
>Remove Python 2 and Use Python 3

By the way, it is important to note that although versions 2.x are still used, they are not actively maintained. For that reason, you may want to consider switching to 3.x as indicated above. Since there are some syntax differences between 2.x and 3.x, we will focus on the latter in this series.

Another way you can use Python in Linux is through the IDLE (the Python Integrated Development Environment), a graphical user interface for writing Python code. Before installing it, it is a good idea to perform a search to find out what are the versions available for your distribution:

```
# aptitude search idle     [Debian and derivatives]
# yum search idle          [CentOS and Fedora]
# dnf search idle          [Fedora 23+ version]
```

Then, you can install it as follows:

```
$ sudo aptitude install idle-python3.2    # I'm using Linux Mint 13
```

Once installed, you will see the following screen after launching the IDLE. While it resembles the Python shell, you can do more with the IDLE than with the shell.

For example, you can:

1. open external files easily (File → Open).

![](http://www.tecmint.com/wp-content/uploads/2016/05/Python-Shell.png)
>Python Shell

2) copy (`Ctrl + C`) and paste (`Ctrl + V`) text, 3) find and replace text, 4) show possible completions (a feature known as Intellisense or Autocompletion in other IDEs), 5) change the font type and size, and much more.

On top of this, you can use the IDLE to create desktop applications.

Since we will not be developing a desktop application in this 2-article series, feel free to choose between the IDLE and the Python shell to follow the examples.

### Basic Operations with Python

As it is to be expected, you can perform arithmetic operations (feel free to use as many parentheses as needed to perform all the operations you want!) and manipulate text strings very easily with Python.

You can also assign the results of operations to variables and display them in the screen. A handy feature in Python is concatenation – just supply the values of variables and / or strings in a comma-delimited list (inside parentheses) to the print function and it will return the sentence composed by the items in the sequence:

```
>>> a = 5
>>> b = 8
>>> x = b / a
>>> x
1.6
>>> print(b, "divided by", a, "equals", x)
```

Note that you can mix variables of different types (numbers, strings, booleans, etc) and once you have assigned a value to a variable you can change the data type without problems later (for this reason Python is said to be a dynamically typed language).

If you attempt to do this in a statically typed language (such as Java or C#), an error will be thrown.

![](http://www.tecmint.com/wp-content/uploads/2016/05/Learn-Python-Basic-Operations.png)
>Learn Python Basic Operations

### A brief comment about Object Oriented Programming

In Object Oriented Programming (OOP), all entities in a program are represented as objects and thus they can interact with others. As such, they have properties and most of them can perform actions (known as methods).

For example, let’s suppose we want to create a dog object. Some of the possible properties are color, breed, age, etc, whereas some of the actions a dog can perform are bark(), eat(), sleep(), and many others.

Methods names, as you can see, are followed by a set of parentheses which may (or may not) contain one (or more) arguments (values that are passed to the method).

Let’s illustrate these concepts with one of the basic object types in Python: lists.

### Illustrating methods and properties of objects: Lists in Python

A list is an ordered group of items, which do not necessarily have to be all of the same data type. To create an empty list named rockBands, use a pair of square brackets as follows:

To append an item to the end of the list, pass the item to the `append()` method as follows:

```
>>> rockBands = []
>>> rockBands.append("The Beatles")
>>> rockBands.append("Pink Floyd")
>>> rockBands.append("The Rolling Stones")
```

To remove an item from the list, we can pass the specific element to the remove() method, or the position of the element (count starts at zero) in the list to pop().

In other words, we can use either of the following options to remove “The Beatles” from the list:

```
>>> rockBands.remove("The Beatles")
```

or

```
>>> rockBands.pop(0)
```

You can display the list of available methods for an object by pressing Ctrl + Space once you’ve typed the name followed by a dot:

![](http://www.tecmint.com/wp-content/uploads/2016/05/List-Available-Python-Methods.png)
>List Available Python Methods

A property of a list object is the number of items it contains. It is actually called length and is invoked by passing the list as argument to the len built-in function (by the way, the print statement, which we exemplified earlier-, is another Python built-in function).

If you type len followed by an opening parentheses in the IDLE, you will see the default syntax of the function:

![](http://www.tecmint.com/wp-content/uploads/2016/05/Python-len-Function.png)
>Python len Function

Now what about the individual items of the list. Do they have methods and properties as well? The answer is yes. For example, you can convert a string item to uppercase and get the number of characters it contains as follows:

```
>>> rockBands[0].upper()
'THE BEATLES'
>>> len(rockBands[0])
11
```

### Summary

In this article we have provided a brief introduction to Python, its command-line shell, and the IDLE, and demonstrated how to perform arithmetic calculations, how to store values in variables, how to print back those values to the screen (either on its own or as part of a concatenation), and explained through a practical example what are the methods and properties of an object.

In the next article we will discuss control flow with conditionals and loops. We will also demonstrate how to use what we have learned to write a script to help us in our sysadmin tasks.

Does Python sound like something you would like to learn more about? Stay tuned for the second part in this series (where among other things we will combine the bounties of Python and command-line tools in a script), and also consider buying our Ultimate Python Coding bundle (more details [here][4]).

As always, you can count on us if you have any questions about this article. Just send us a message using the contact form below and we will get back to you as soon as possible.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/learn-python-programming-and-scripting-in-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/gacanepa/
[1]: http://www.tecmint.com/category/bash-shell/
[2]: http://www.tecmint.com/create-gui-applications-in-linux/
[3]: http://www.datasciencecentral.com/profiles/blogs/the-guide-to-learning-python-for-data-science-2
[4]: http://www.tecmint.com/learn-python-programming-online-with-ultimate-python-coding/
