[#]: subject: (Learn Python dictionary values with Jupyter)
[#]: via: (https://opensource.com/article/21/3/dictionary-values-python)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13236-1.html)

用 Jupyter 学习 Python 字典
======

> 字典数据结构可以帮助你快速访问信息。

![](https://img.linux.net.cn/data/attachment/album/202103/26/094720i58u5qxx3l4qsssx.jpg)

字典是 Python 编程语言使用的数据结构。一个 Python 字典由多个键值对组成；每个键值对将键映射到其关联的值上。

例如你是一名老师，想把学生姓名与成绩对应起来。你可以使用 Python 字典，将学生姓名映射到他们关联的成绩上。此时，键值对中键是姓名，值是对应的成绩。

如果你想知道某个学生的考试成绩，你可以从字典中访问。这种快捷查询方式可以为你节省解析整个列表找到学生成绩的时间。

本文介绍了如何通过键访问对应的字典值。学习前，请确保你已经安装了 [Anaconda 包管理器][2]和 [Jupyter 笔记本][3]。

### 1、在 Jupyter 中打开一个新的笔记本

首先在 Web 浏览器中打开并运行 Jupyter。然后，

  1. 转到左上角的 “File”。
  2. 选择 “New Notebook”，点击 “Python 3”。

![新建 Jupyter 笔记本][4]

开始时，新建的笔记本是无标题的，你可以将其重命名为任何名称。我为我的笔记本取名为 “OpenSource.com Data Dictionary Tutorial”。

笔记本中标有行号的位置就是你写代码的区域，也是你输入的位置。

在 macOS 上，可以同时按 `Shift + Return` 键得到输出。在创建新的代码区域前，请确保完成上述动作；否则，你写的任何附加代码可能无法运行。

### 2、新建一个键值对

在字典中输入你希望访问的键与值。输入前，你需要在字典上下文中定义它们的含义：

```
empty_dictionary = {}
grades = {
    "Kelsey": 87,
    "Finley": 92
}

one_line = {a: 1, b: 2}
```

![定义字典键值对的代码][6]

这段代码让字典将特定键与其各自的值关联起来。字典按名称存储数据，从而可以更快地查询。

### 3、通过键访问字典值

现在你想查询指定的字典值；在上述例子中，字典值指特定学生的成绩。首先，点击 “Insert” 后选择 “Insert Cell Below”。

![在 Jupyter 插入新建单元格][7]

在新单元格中，定义字典中的键与值。

然后，告诉字典打印该值的键，找到需要的值。例如，查询名为 Kelsey 的学生的成绩：

```
# 访问字典中的数据
grades = {
    "Kelsey": 87,
    "Finley": 92
}

print(grades["Kelsey"])
87
```

![查询特定值的代码][8]

当你查询 Kelsey 的成绩（也就是你想要查询的值）时，如果你用的是 macOS，只需要同时按 `Shift+Return` 键。

你会在单元格下方看到 Kelsey 的成绩。

### 4、更新已有的键

当把一位学生的错误成绩添加到字典时，你会怎么办？可以通过更新字典、存储新值来修正这类错误。

首先，选择你想更新的那个键。在上述例子中，假设你错误地输入了 Finley 的成绩，那么 Finley 就是你需要更新的键。

为了更新 Finley 的成绩，你需要在下方插入新的单元格，然后创建一个新的键值对。同时按 `Shift+Return` 键打印字典全部信息：

```
grades["Finley"] = 90
print(grades)

{'Kelsey': 87; "Finley": 90}
```

![更新键的代码][9]

单元格下方输出带有 Finley 更新成绩的字典。

### 5、添加新键

假设你得到一位新学生的考试成绩。你可以用新键值对将那名学生的姓名与成绩补充到字典中。

插入新的单元格，以键值对形式添加新学生的姓名与成绩。当你完成这些后，同时按 `Shift+Return` 键打印字典全部信息：

```
grades["Alex"] = 88
print(grades)

{'Kelsey': 87, 'Finley': 90, 'Alex': 88}
```

![添加新键][10]

所有的键值对输出在单元格下方。

### 使用字典

请记住，键与值可以是任意数据类型，但它们很少是<ruby>[扩展数据类型][11]<rt>non-primitive types</rt></ruby>。此外，字典不能以指定的顺序存储、组织里面的数据。如果你想要数据有序，最好使用 Python 列表，而非字典。

如果你考虑使用字典，首先要确认你的数据结构是否是合适的，例如像电话簿的结构。如果不是，列表、元组、树或者其他数据结构可能是更好的选择。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/dictionary-values-python

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[DCOLIVERSUN](https://github.com/DCOLIVERSUN)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://docs.anaconda.com/anaconda/
[3]: https://opensource.com/article/18/3/getting-started-jupyter-notebooks
[4]: https://opensource.com/sites/default/files/uploads/new-jupyter-notebook.png (Create Jupyter notebook)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/define-keys-values.png (Code for defining key-value pairs in the dictionary)
[7]: https://opensource.com/sites/default/files/uploads/jupyter_insertcell.png (Inserting a new cell in Jupyter)
[8]: https://opensource.com/sites/default/files/uploads/lookforvalue.png (Code to look for a specific value)
[9]: https://opensource.com/sites/default/files/uploads/jupyter_updatekey.png (Code for updating a key)
[10]: https://opensource.com/sites/default/files/uploads/jupyter_addnewkey.png (Add a new key)
[11]: https://www.datacamp.com/community/tutorials/data-structures-python
