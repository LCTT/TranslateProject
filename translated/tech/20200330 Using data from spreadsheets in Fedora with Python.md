[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using data from spreadsheets in Fedora with Python)
[#]: via: (https://fedoramagazine.org/using-data-from-spreadsheets-in-fedora-with-python/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

在 Fedora 中使用 Python 读取电子表格中的数据
======

![][1]

[Python][2] 是最流行、功能最强大的编程语言之一。由于它是免费和开源的，因此每个人都可以使用。大多数 Fedora 系统都已安装了该语言。Python 可用于多种任务，其中包括处理逗号分隔值（**CSV**）数据。CSV 文件通常作为表格启动。本文介绍了如何在 Python 3 中处理 CSV 数据。

CSV 数据正是它听起来的样子。CSV 文件一次包含一行数据，数值之间用逗号分隔。每行由相同的_字段_定义。简短的 CSV 文件通常易于阅读和理解。但是较长的数据或具有更多字段的数据文件可能很难用肉眼解析，因此在这种情况下计算机做得更好。

这是一个简单的示例，其中的字段是 _Name _、_ Email_ 和 _Country_。在此例中，CSV 数据将字段定义作为第一行，尽管并非总是如此。

```
Name,Email,Country
John Q. Smith,jqsmith@example.com,USA
Petr Novak,pnovak@example.com,CZ
Bernard Jones,bjones@example.com,UK
```

### 从电子表格读取 CSV

Python 包含了一个 _csv_ 模块，它可读取和写入 CSV 数据。大多数电子表格应用，无论是原生（例如 Excel 或 Numbers）还是基于 Web 的（例如 Google Sheet），都可以导出 CSV 数据。实际上，许多其他可发布表格报告的服务也将导出为 CSV（例如，PayPal）。

Python _csv_ 模块有一个名为 _DictReader_ 的内置读取器方法，它可以将每个数据行作为有序字典 （OrderedDict） 处理。它需要一个文件对象访问 CSV 数据。因此，如果上面的文件在当前目录中为 _example.csv_，那么以下代码段是获取此数据的一种方法：

```
f = open('example.csv', 'r')
from csv import DictReader
d = DictReader(f)
data = []
for row in d:
    data.append(row)
```

现在，内存中的 _data_ 对象是 OrderedDict 对象的列表：

```
[OrderedDict([('Name', 'John Q. Smith'),
               ('Email', 'jqsmith@example.com'),
               ('Country', 'USA')]),
  OrderedDict([('Name', 'Petr Novak'),
               ('Email', 'pnovak@example.com'),
               ('Country', 'CZ')]),
  OrderedDict([('Name', 'Bernard Jones'),
               ('Email', 'bjones@example.com'),
               ('Country', 'UK')])]
```

引用这些对象很容易：

```
>>> print(data[0]['Country'])
USA
>>> print(data[2]['Email'])
bjones@example.com
```

顺便说一句，如果你需要处理没有字段名标题行的 CSV 文件，那么 _DictReader_ 类可以让你定义它们。在上面的示例中，添加 _fieldnames_ 参数并传递一系列名称：

```
d = DictReader(f, fieldnames=['Name', 'Email', 'Country'])
```

### 真实例子

我最近想从一长串人中随机选择一名赢家。我从电子表格中提取的 CSV 数据是一个简单的名称和邮件地址列表。

幸运的是，Python 有一个有用的 _random_ 模块，可以很好地生成随机值。该模块 _Random_ 类中的 _randrange_ 函数正是我需要的。你可以给它一个常规的数字范围（例如整数），以及它们之间的步长值。然后，该函数会生成一个随机结果，这意味着我可以在数据的总行数范围内获得一个随机整数（或行号！）。

这个小程序运行良好：

```
from csv import DictReader
from random import Random

d = DictReader(open('mydata.csv'))
data = []
for row in d:
    data.append(row)

r = Random()
winner = data[r.randrange(0, len(data), 1)]
print('The winner is:', winner['Name'])
print('Email address:', winner['Email'])
```

显然，这个例子非常简单。电子表格本身包含了复杂的分析数据的方法。但是，如果你想在电子表格应用之外做某事，Python 或许是一种技巧！

* * *

_由 [Isaac Smith][3] 拍摄，发表于 [U​​nsplash][4]。_

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-data-from-spreadsheets-in-fedora-with-python/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/03/spreadsheets-python-816x345.jpg
[2]: https://python.org
[3]: https://unsplash.com/@isaacmsmith?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://unsplash.com/s/photos/spreadsheets?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
