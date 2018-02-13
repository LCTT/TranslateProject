translating---geekpi

Python Hello World and String Manipulation
======

![](https://process.filestackapi.com/cache=expiry:max/resize=width:700/compress/eadkmsrBTcWSyCeA4qti)

Before starting, I should mention that the [code][1] used in this blog post and in the [video][2] below is available on my github.

With that, let’s get started! If you get lost, I recommend opening the [video][3] below in a separate tab.

[Hello World and String Manipulation Video using Python][2]

#### ** Get Started (Prerequisites)

Install Anaconda (Python) on your operating system. You can either download anaconda from the [official site][4] and install on your own or you can follow these anaconda installation tutorials below.

Install Anaconda on Windows: [Link][5]

Install Anaconda on Mac: [Link][6]

Install Anaconda on Ubuntu (Linux): [Link][7]

#### Open a Jupyter Notebook

Open your terminal (Mac) or command line and type the following ([see 1:16 in the video to follow along][8]) to open a Jupyter Notebook:
```
jupyter notebook

```

#### Print Statements/Hello World

Type the following into a cell in Jupyter and type **shift + enter** to execute code.
```
# This is a one line comment
print('Hello World!')

```

![][9]
Output of printing ‘Hello World!’

#### Strings and String Manipulation

Strings are a special type of a python class. As objects, in a class, you can call methods on string objects using the .methodName() notation. The string class is available by default in python, so you do not need an import statement to use the object interface to strings.
```
# Create a variable
# Variables are used to store information to be referenced
# and manipulated in a computer program.
firstVariable = 'Hello World'
print(firstVariable)

```

![][9]
Output of printing the variable firstVariable
```
# Explore what various string methods
print(firstVariable.lower())
print(firstVariable.upper())
print(firstVariable.title())

```

![][9]
Output of using .lower(), .upper() , and title() methods
```
# Use the split method to convert your string into a list
print(firstVariable.split(' '))

```

![][9]
Output of using the split method (in this case, split on space)
```
# You can add strings together.
a = "Fizz" + "Buzz"
print(a)

```

![][9]
string concatenation

#### Look up what Methods Do

For new programmers, they often ask how you know what each method does. Python provides two ways to do this.

  1. (works in and out of Jupyter Notebook) Use **help** to lookup what each method does.



![][9]
Look up what each method does

  2. (Jupyter Notebook exclusive) You can also look up what a method does by having a question mark after a method.


```
# To look up what each method does in jupyter (doesnt work outside of jupyter)
firstVariable.lower?

```

![][9]
Look up what each method does in Jupyter

#### Closing Remarks

Please let me know if you have any questions either here or in the comments section of the [youtube video][2]. The code in the post is also available on my [github][1]. Part 2 of the tutorial series is [Simple Math][10].

--------------------------------------------------------------------------------

via: https://www.codementor.io/mgalarny/python-hello-world-and-string-manipulation-gdgwd8ymp

作者：[Michael][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.codementor.io/mgalarny
[1]:https://github.com/mGalarnyk/Python_Tutorials/blob/master/Python_Basics/Intro/Python3Basics_Part1.ipynb
[2]:https://www.youtube.com/watch?v=JqGjkNzzU4s
[3]:https://www.youtube.com/watch?v=kApPBm1YsqU
[4]:https://www.continuum.io/downloads
[5]:https://medium.com/@GalarnykMichael/install-python-on-windows-anaconda-c63c7c3d1444
[6]:https://medium.com/@GalarnykMichael/install-python-on-mac-anaconda-ccd9f2014072
[7]:https://medium.com/@GalarnykMichael/install-python-on-ubuntu-anaconda-65623042cb5a
[8]:https://youtu.be/JqGjkNzzU4s?t=1m16s
[9]:data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
[10]:https://medium.com/@GalarnykMichael/python-basics-2-simple-math-4ac7cc928738
