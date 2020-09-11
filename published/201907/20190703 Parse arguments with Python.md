[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11144-1.html)
[#]: subject: (Parse arguments with Python)
[#]: via: (https://opensource.com/article/19/7/parse-arguments-python)
[#]: author: (Seth Kenlon https://opensource.com/users/seth/users/notsag)

使用 Python 解析参数
======

> 使用 argparse 模块像专业人士一样解析参数。

![](https://img.linux.net.cn/data/attachment/album/201907/24/210351h99gzcttqmk7c7mx.jpg)

如果你在使用 [Python][2] 进行开发，你可能会在终端中使用命令，即使只是为了启动 Python 脚本或使用 [pip][3] 安装 Python 模块。命令可能简单而单一：

```
$ ls
```

命令也可能需要参数：

```
$ ls example
```

命令也可以有选项或标志：

```
$ ls --color example
```

有时选项也有参数：

```
$ sudo firewall-cmd  --list-all --zone home
```

### 参数

POSIX shell 会自动将你输入的内容作为命令分成数组。例如，这是一个简单的命令：

```
$ ls example
```

命令 `ls` 的位置是 `$0`，参数 `example`  位置是 `$1`。

你**可以**写一个循环迭代每项。确定它是否是命令、选项还是参数。并据此采取行动。幸运的是，已经有一个名为 [argparse][4] 的模块。

### argparse

argparse 模块很容易集成到 Python 程序中，并有多种便利功能。例如，如果你的用户更改选项的顺序或使用一个不带参数的选项（称为**布尔**，意味着选项可以打开或关闭设置），然后另一个需要参数（例如 `--color red`），argparse 可以处理多种情况。如果你的用户忘记了所需的选项，那么 argparse 模块可以提供友好的错误消息。

要在应用中使用 argparse，首先要定义为用户提供的选项。你可以接受几种不同的参数，而语法一致又简单。

这是一个简单的例子：

```
#!/usr/bin/env python
import argparse
import sys

def getOptions(args=sys.argv[1:]):
    parser = argparse.ArgumentParser(description="Parses command.")
    parser.add_argument("-i", "--input", help="Your input file.")
    parser.add_argument("-o", "--output", help="Your destination output file.")
    parser.add_argument("-n", "--number", type=int, help="A number.")
    parser.add_argument("-v", "--verbose",dest='verbose',action='store_true', help="Verbose mode.")
    options = parser.parse_args(args)
    return options
```

此示例代码创建一个名为 `getOptions` 的函数，并告诉 Python 查看每个可能的参数，前面有一些可识别的字符串（例如 `--input` 或者 `-i`）。 Python 找到的任何选项都将作为 `options` 对象从函数中返回（`options` 是一个任意名称，且没有特殊含义。它只是一个包含函数已解析的所有参数的摘要的数据对象）。

默认情况下，Python 将用户给出的任何参数视为字符串。如果需要提取整数（数字），则必须指定选项 `type=int`，如示例代码中的 `--number` 选项。

如果你有一个只是关闭和打开功能的参数，那么你必须使用 `boolean` 类型，就像示例代码中的 `--verbose` 标志一样。这种选项只保存 `True` 或 `False`，用户用来指定是否使用标志。如果使用该选项，那么会激活 `stored_true`。

当 `getOptions` 函数运行时，你就可以使用 `options` 对象的内容，并让程序根据用户调用命令的方式做出决定。你可以使用测试打印语句查看 `options` 的内容。将其添加到示例文件的底部：

```
print(getOptions())
```

然后带上参数运行代码：

```
$ python3 ./example.py -i foo -n 4
Namespace(input='foo', number=4, output=None, verbose=False)
```

### 检索值

示例代码中的 `options` 对象包含了用户提供的选项后面的值（或派生的布尔值）。例如，在示例代码中，可以通过 `options.number` 来检索 `--number`。

```
options = getOptions(sys.argv[1:])

if options.verbose:
    print("Verbose mode on")
else:
    print("Verbose mode off")

print(options.input)
print(options.output)
print(options.number)

# 这里插入你的 Python 代码
```

示例中的布尔选项 `--verbose` 是通过测试 `options.verbose` 是否为 `True`（意味着用户使用了 `--verbose` 标志）或 `False`（用户没有使用 `--verbose` 标志），并采取相应的措施。

### 帮助和反馈

argparse 还包含一个内置的 `--help`（简写 `-h`）选项，它提供了有关如何使用命令的提示。这是从你的代码派生的，因此生成此帮助系统不需要额外的工作：

```
$ ./example.py --help
usage: example.py [-h] [-i INPUT] [-o OUTPUT] [-n NUMBER] [-v]

Parses command.

optional arguments:
  -h, --help            show this help message and exit
  -i INPUT, --input INPUT
                        Your input file.
  -o OUTPUT, --output OUTPUT
                        Your destination output file.
  -n NUMBER, --number NUMBER
                        A number.
  -v, --verbose         Verbose mode.
```

### 像专业人士一样用 Python 解析

这是一个简单的示例，来演示如何在 Python 应用中的解析参数以及如何快速有效地记录它的语法。下次编写 Python 脚本时，请使用 argparse 为其提供一些选项。你以后会感到自得，你的命令不会像一个快速的临时脚本，更像是一个“真正的” Unix 命令！

以下是可用于测试的示例代码：

```
#!/usr/bin/env python3
# GNU All-Permissive License
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

import argparse
import sys

def getOptions(args=sys.argv[1:]):
    parser = argparse.ArgumentParser(description="Parses command.")
    parser.add_argument("-i", "--input", help="Your input file.")
    parser.add_argument("-o", "--output", help="Your destination output file.")
    parser.add_argument("-n", "--number", type=int, help="A number.")
    parser.add_argument("-v", "--verbose",dest='verbose',action='store_true', help="Verbose mode.")
    options = parser.parse_args(args)
    return options

options = getOptions(sys.argv[1:])

if options.verbose:
    print("Verbose mode on")
else:
    print("Verbose mode off")

print(options.input)
print(options.output)
print(options.number)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/parse-arguments-python

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/notsag
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cobol-card-punch-programming-code.png?itok=6W6PUqUi (COBOL punch card)
[2]: https://www.python.org/
[3]: https://pip.pypa.io/en/stable/installing/
[4]: https://pypi.org/project/argparse/
