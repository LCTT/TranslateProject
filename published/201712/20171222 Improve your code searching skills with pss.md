使用 pss 提升你的代码搜索能力
======

![](https://fedoramagazine.org/wp-content/uploads/2017/12/pss-945x400.jpg)

搜索代码库是开发者每天都要做的事情。从修改 bug 到学习新代码，或者查看如何调用某个 API，能快速在代码库中导航的能力都是一大助力。幸运的是，我们有专门的工具来搜索代码。[pss][1] 就是其中一个工具，让我们来看看如何安装和使用它吧。

### 什么是 pss？

`pss` 是一个帮你在源代码文件中进行搜索的命令行工具。`pss` 递归地在目录树中进行搜索，它能自动根据文件名和后缀判断哪些文件需要搜索，哪些文件不需搜索，并且会自动跳过那些你不会想搜索的目录（比如 `.svn` 和 `.git`），还能用色彩渲染输出以方便人们阅读，以及其他很多功能。

### 安装 pss

使用下面命令在 Fedora 上安装 `pss`：

```
 $ dnf install pss
```

安装好后就能在终端调用 `pss` 了：

```
 $ pss
```

不带参数调用 `pss` 或者带上 `-h` 标志会输出详细的使用说明。

### 使用案例

现在你安装好 `pss` 了，下面来看一些例子吧。

```
 $ pss foo
```

该命令只是简单的搜索 `foo`。你也可以限制 `pss` 让它只在 python 文件中搜索 `foo`：

```
 $ pss foo --py
```

还能在非 python 文件中搜索 `bar`：

```
 $ pss bar --nopy
```

而且，`pss` 支持大多数常见的源代码文件类型，要获取完整的支持列表，执行：

```
$ pss --help-types
```

你还能指定忽略某些目录不进行搜索。默认情况下，`pss` 会忽略类似 `.git`，`__pycache__`，`.metadata` 等目录。

```
$ pss foo --py --ignore-dir=dist
```

此外，`pss` 还能显示搜索结果的上下文。

```
$ pss -A 5 foo
```

会显示匹配结果的后面 5 行内容。

```
$ pss -B 5 foo
```

会显示匹配结果的前面 5 行内容。

```
$ pss -C 5 foo
```

会显示匹配结果的前后各 5 行内容。

如果你想知道如何使用 `pss ` 进行正则表达式搜索以及它的其他选项的话，可以在[这里][2]看到更多的例子。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/improve-code-searching-skills-pss/

作者：[Clément Verna][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://github.com/eliben/pss
[2]:https://github.com/eliben/pss/wiki/Usage-samples
