[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11654-1.html)
[#]: subject: (How to port an awk script to Python)
[#]: via: (https://opensource.com/article/19/11/awk-to-python)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

如何把 awk 脚本移植到 Python
======

> 将一个 awk 脚本移植到 Python 主要在于代码风格而不是转译。

![](https://img.linux.net.cn/data/attachment/album/201912/08/095256ko6xdfwooe8zctfz.jpg)

脚本是解决问题的有效方法，而 awk 是编写脚本的出色语言。它特别擅长于简单的文本处理，它可以带你完成配置文件的某些复杂重写或目录中文件名的重新格式化。

### 何时从 awk 转向 Python

但是在某些方面，awk 的限制开始显现出来。它没有将文件分解为模块的真正概念，它缺乏质量错误报告，并且缺少了现在被认为是编程语言工作原理的其他内容。当编程语言的这些丰富功能有助于维护关键脚本时，移植将是一个不错的选择。

我最喜欢的完美移植 awk 的现代编程语言是 Python。

在将 awk 脚本移植到 Python 之前，通常值得考虑一下其原始使用场景。例如，由于 awk 的局限性，通常从 Bash 脚本调用 awk 代码，其中包括一些对 `sed`、`sort` 之类的其它命令行常见工具的调用。 最好将所有内容转换为一个一致的 Python 程序。有时，脚本会做出过于宽泛的假设，例如，即使实际上只运行一个文件，该代码也可能允许任意数量的文件。

在仔细考虑了上下文并确定了要用 Python 替代的东西之后，该编写代码了。

### 标准 awk 到 Python 功能

以下 Python 功能是有用的，需要记住：

```
with open(some_file_name) as fpin:
    for line in fpin:
        pass # do something with line
```

此代码将逐行循环遍历文件并处理这些行。

如果要访问行号（相当于 awk 的 `NR`），则可以使用以下代码：

```
with open(some_file_name) as fpin:
    for nr, line in enumerate(fpin):
        pass # do something with line
```

### 在 Python 中实现多文件的 awk 式行为

如果你需要能够遍历任意数量的文件同时保持行数的持续计数（类似 awk 的 `FNR`），则此循环可以做到这一点：

```
def awk_like_lines(list_of_file_names):
    def _all_lines():
        for filename in list_of_file_names:
            with open(filename) as fpin:
                yield from fpin
    yield from enumerate(_all_lines())
```

此语法使用 Python 的*生成器*和 `yield from` 来构建*迭代器*，该迭代器将遍历所有行并保持一个持久计数。

如果你需要同时使用 `FNR` 和 `NR`，这是一个更复杂的循环：

```
def awk_like_lines(list_of_file_names):
    def _all_lines():
        for filename in list_of_file_names:
            with open(filename) as fpin:
                yield from enumerate(fpin)
    for nr, (fnr, line) in _all_lines:
        yield nr, fnr, line
```

### 更复杂的 FNR、NR 和行数的 awk 行为

如果 `FNR`、`NR` 和行数这三个你全都需要，仍然会有一些问题。如果确实如此，则使用三元组（其中两个项目是数字）会导致混淆。命名参数可使该代码更易于阅读，因此最好使用 `dataclass`：

```
import dataclass

@dataclass.dataclass(frozen=True)
class AwkLikeLine:
    content: str
    fnr: int
    nr: int

def awk_like_lines(list_of_file_names):
    def _all_lines():
        for filename in list_of_file_names:
            with open(filename) as fpin:
                yield from enumerate(fpin)
    for nr, (fnr, line) in _all_lines:
        yield AwkLikeLine(nr=nr, fnr=fnr, line=line)
```

你可能想知道，为什么不一直用这种方法呢？使用其它方式的的原因是总用这种方法太复杂了。如果你的目标是把一个通用库更容易地从 awk 移植到 Python，请考虑这样做。但是编写一个可以使你确切地了解特定情况所需的循环的方法通常更容易实现，也更容易理解（因而易于维护）。

### 理解 awk 字段

一旦有了与一行相对应的字符串，如果要转换 awk 程序，则通常需要将其分解为*字段*。Python 有几种方法可以做到这一点。这将把行按任意数量的连续空格拆分，返回一个字符串列表：

```
line.split()
```

如果需要另一个字段分隔符，比如以 `:` 分隔行，则需要 `rstrip` 方法来删除最后一个换行符：

```
line.rstrip("\n").split(":")
```

完成以下操作后，列表 `parts` 将存有分解的字符串：

```
parts = line.rstrip("\n").split(":")
```

这种拆分非常适合用来处理参数，但是我们处于[偏差一个的错误][2]场景中。现在 `parts[0]` 将对应于 awk 的 `$1`，`parts[1]` 将对应于 awk 的 `$2`，依此类推。之所以偏差一个，是因为 awk 计数“字段”从 1 开始，而 Python 从 0 开始计数。在 awk 中，`$0` 是整个行 —— 等同于 `line.rstrip("\n")`，而 awk 的 `NF`（字段数）更容易以 `len(parts)` 的形式得到。

### 移植 awk 字段到 Python

例如，让我们将这个单行代码“[如何使用 awk 从文件中删除重复行][3]”转换为 Python。

`awk` 中的原始代码是：

```
awk '!visited[$0]++' your_file > deduplicated_file
```

“真实的” Python 转换将是：

```
import collections
import sys

visited = collections.defaultdict(int)
for line in open("your_file"):
    did_visit = visited[line]
    visited[line] += 1
    if not did_visit:
        sys.stdout.write(line)
```

但是，Python 比 awk 具有更多的数据结构。与其计数访问次数（除了知道是否看到一行，我们不使用它），为什么不记录访问的行呢？

```
import sys

visited = set()
for line in open("your_file"):
    if line in visited:
        continue
    visited.add(line)
    sys.stdout.write(line)
```

### 编写 Python 化的 awk 代码

Python 社区提倡编写 Python 化的代码，这意味着它要遵循公认的代码风格。更加 Python 化的方法将区分*唯一性*和输入/输出的关注点。此更改将使对代码进行单元测试更加容易：

```
def unique_generator(things):
    visited = set()
    for thing in things:
        if thing in visited:
            continue
        visited.add(things)
        yield thing

import sys
   
for line in unique_generator(open("your_file")):
    sys.stdout.write(line)
```

将所有逻辑置于输入/输出代码之外，可以更好地分离问题，并提高代码的可用性和可测试性。

### 结论：Python 可能是一个不错的选择

将 awk 脚本移植到 Python 时，通常是在考虑适当的 Python 代码风格时重新实现核心需求，而不是按条件/操作进行笨拙的音译。考虑原始上下文并产生高质量的 Python 解决方案。虽然有时候使用 awk 的 Bash 单行代码可以完成这项工作，但 Python 编码是通往更易于维护的代码的途径。

另外，如果你正在编写 awk 脚本，我相信您也可以学习 Python！如果你有任何疑问，请告诉我。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/awk-to-python

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_4.png?itok=VGZO8CxT (Woman sitting in front of her laptop)
[2]: https://en.wikipedia.org/wiki/Off-by-one_error
[3]: https://opensource.com/article/19/10/remove-duplicate-lines-files-awk
