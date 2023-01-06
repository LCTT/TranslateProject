[#]: subject: "Parse command-line arguments with argparse in Python"
[#]: via: "https://opensource.com/article/21/8/python-argparse"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13986-1.html"

Python 中使用 argparse 解析命令行参数
======

> 使用 argparse 模块为应用程序设置命令行选项。

![](https://img.linux.net.cn/data/attachment/album/202111/15/110139bakkfdt4zoadqiv0.jpg)

有一些第三方库用于命令行解析，但标准库 `argparse` 与之相比也毫不逊色。

无需添加很多依赖，你就可以编写带有实用参数解析功能的漂亮命令行工具。

### Python 中的参数解析

使用 `argparse` 解析命令行参数时，第一步是配置一个 `ArgumentParser` 对象。这通常在全局模块内完成，因为单单_配置_一个解析器没有副作用。


```
import argparse

PARSER = argparse.ArgumentParser()
```

`ArgumentParser` 中最重要的方法是 `.add_argument()`，它有几个变体。默认情况下，它会添加一个参数，并期望一个值。


```
PARSER.add_argument("--value")
```

查看实际效果，调用 `.parse_args()`：

```
PARSER.parse_args(["--value", "some-value"])
```

```
Namespace(value='some-value')
```

也可以使用 `=` 语法：

```
PARSER.parse_args(["--value=some-value"])
```

```
Namespace(value='some-value')
```

为了缩短在命令行输入的命令，你还可以为选项指定一个短“别名”：

```
PARSER.add_argument("--thing", "-t")
```

可以传入短选项：

```
PARSER.parse_args("-t some-thing".split())
```

```
Namespace(value=None, thing='some-thing')
```

或者长选项：

```
PARSER.parse_args("--thing some-thing".split())
```

```
Namespace(value=None, thing='some-thing')
```

### 类型

有很多类型的参数可供你使用。除了默认类型，最流行的两个是布尔类型和计数器。布尔类型有一个默认为 `True` 的变体和一个默认为 `False` 的变体。

```
PARSER.add_argument("--active", action="store_true")
PARSER.add_argument("--no-dry-run", action="store_false", dest="dry_run")
PARSER.add_argument("--verbose", "-v", action="count")
```

除非显式传入 `--active`，否则 `active` 就是 `False`。`dry-run` 默认是 `True`，除非传入 `--no-dry-run`。无值的短选项可以并列。

传递所有参数会导致非默认状态：

```
PARSER.parse_args("--active --no-dry-run -vvvv".split())
```

```
Namespace(value=None, thing=None, active=True, dry_run=False, verbose=4)
```

默认值则比较单一：

```
PARSER.parse_args("".split())
```

```
Namespace(value=None, thing=None, active=False, dry_run=True, verbose=None)
```

### 子命令

经典的 Unix 命令秉承了“一次只做一件事，并做到极致”，但现代的趋势把“几个密切相关的操作”放在一起。

`git`、`podman` 和 `kubectl` 充分说明了这种范式的流行。`argparse` 库也可以做到：

```
MULTI_PARSER = argparse.ArgumentParser()
subparsers = MULTI_PARSER.add_subparsers()
get = subparsers.add_parser("get")
get.add_argument("--name")
get.set_defaults(command="get")
search = subparsers.add_parser("search")
search.add_argument("--query")
search.set_defaults(command="search")
```

```
MULTI_PARSER.parse_args("get --name awesome-name".split())
```

```
Namespace(name='awesome-name', command='get')
```

```
MULTI_PARSER.parse_args("search --query name~awesome".split())
```

```
Namespace(query='name~awesome', command='search')`
```

### 程序架构

使用 `argparse` 的一种方法是使用下面的结构：

```
## my_package/__main__.py
import argparse
import sys

from my_package import toplevel

parsed_arguments = toplevel.PARSER.parse_args(sys.argv[1:])
toplevel.main(parsed_arguments)
```

```
## my_package/toplevel.py

PARSER = argparse.ArgumentParser()
## .add_argument, etc.

def main(parsed_args):

    ...

    # do stuff with parsed_args
```

在这种情况下，使用 `python -m my_package` 运行。或者，你可以在包安装时使用 [console_scprits][2] 入口点。

### 总结

`argparse` 模块是一个强大的命令行参数解析器，还有很多功能没能在这里介绍。它能实现你想象的一切。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/python-argparse

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/bitmap_0.png?itok=PBXU-cn0 "Python options"
[2]: https://python-packaging.readthedocs.io/en/latest/command-line-scripts.html#the-console-scripts-entry-point