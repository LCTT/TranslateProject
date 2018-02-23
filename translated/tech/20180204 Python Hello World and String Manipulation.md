Python 中的 Hello World 和字符串操作
======

![](https://process.filestackapi.com/cache=expiry:max/resize=width:700/compress/eadkmsrBTcWSyCeA4qti)

开始之前，说一下本文中的[代码][1]和[视频][2]可以在我的 github 上找到。

那么，让我们开始吧！如果你糊涂了，我建议你在单独的选项卡中打开下面的[视频][3]。

[Python 的 Hello World 和字符串操作视频][2]

#### ** 开始 (先决条件)

在你的操作系统上安装 Anaconda（Python）。你可以从[官方网站][4]下载 anaconda 并自行安装，或者你可以按照以下这些 anaconda 安装教程进行安装。

在 Windows 上安装 Anaconda： [链接[5]

在 Mac 上安装 Anaconda： [链接][6]

在 Ubuntu (Linux) 上安装 Anaconda：[链接][7]

#### 打开一个 Jupyter Notebook

打开你的终端（Mac）或命令行，并输入以下内容（[请参考视频中的 1:16 处][8]）来打开 Jupyter Notebook：
```
jupyter notebook

```

#### 打印语句/Hello World

在 Jupyter 的单元格中输入以下内容并按下 **shift + 回车**来执行代码。
```
# This is a one line comment
print('Hello World!')

```

![][9]
打印输出 “Hello World!”

#### 字符串和字符串操作

字符串是 python 类的一种特殊类型。作为对象，在类中，你可以使用 .methodName() 来调用字符串对象的方法。字符串类在 python 中默认是可用的，所以你不需要 import 语句来使用字符串对象接口。
```
# Create a variable
# Variables are used to store information to be referenced
# and manipulated in a computer program.
firstVariable = 'Hello World'
print(firstVariable)

```

![][9]
输出打印变量 firstVariable
```
# Explore what various string methods
print(firstVariable.lower())
print(firstVariable.upper())
print(firstVariable.title())

```

![][9]
使用 .lower()、.upper() 和 title() 方法输出
```
# Use the split method to convert your string into a list
print(firstVariable.split(' '))

```

![][9]
使用 split 方法输出（此例中以空格分隔）
```
# You can add strings together.
a = "Fizz" + "Buzz"
print(a)

```

![][9]
字符串连接

#### 查询方法的功能

对于新程序员，他们经常问你如何知道每种方法的功能。Python 提供了两种方法来实现。

  1.（在不在 Jupyter Notebook 中都可用）使用 **help** 查询每个方法的功能。



![][9]
 查询每个方法的功能

  2. (Jupyter Notebook exclusive) You can also look up what a method does by having a question mark after a method.
  2.（Jupyter Notebook 专用）你也可以通过在方法之后添加问号来查找方法的功能。


```
# To look up what each method does in jupyter (doesnt work outside of jupyter)
firstVariable.lower?

```

![][9]
在 Jupyter 中查找每个方法的功能

#### 结束语

如果你对本文或在[ YouTube 视频][2]的评论部分有任何疑问，请告诉我们。文章中的代码也可以在我的 [github][1] 上找到。本系列教程的第 2 部分是[简单的数学操作][10]。

--------------------------------------------------------------------------------

via: https://www.codementor.io/mgalarny/python-hello-world-and-string-manipulation-gdgwd8ymp

作者：[Michael][a]
译者：[geekpi](https://github.com/geekpi)
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
