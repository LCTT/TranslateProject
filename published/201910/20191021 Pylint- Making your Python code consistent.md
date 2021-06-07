[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11502-1.html)
[#]: subject: (Pylint: Making your Python code consistent)
[#]: via: (https://opensource.com/article/19/10/python-pylint-introduction)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Pylint：让你的 Python 代码保持一致
======

> 当你想要争论代码复杂性时，Pylint 是你的朋友。

![OpenStack source code \(Python\) in VIM][1]

Pylint 是更高层级的 Python 样式强制程序。而 [flake8][2] 和 [black][3] 检查的是“本地”样式：换行位置、注释的格式、发现注释掉的代码或日志格式中的错误做法之类的问题。

默认情况下，Pylint 非常激进。它将对每样东西都提供严厉的意见，从检查是否实际实现声明的接口到重构重复代码的可能性，这对新用户来说可能会很多。一种温和地将其引入项目或团队的方法是先关闭*所有*检查器，然后逐个启用检查器。如果你已经在使用 flake8、black 和 [mypy][4]，这尤其有用：Pylint 有相当多的检查器和它们在功能上重叠。

但是，Pylint 独有之处之一是能够强制执行更高级别的问题：例如，函数的行数或者类中方法的数量。

这些数字可能因项目而异，并且可能取决于开发团队的偏好。但是，一旦团队就参数达成一致，使用自动工具*强制化*这些参数非常有用。这是 Pylint 闪耀的地方。

### 配置 Pylint

要以空配置开始，请将 `.pylintrc` 设置为

```
[MESSAGES CONTROL]

disable=all
```

这将禁用所有 Pylint 消息。由于其中许多是冗余的，这是有道理的。在 Pylint 中，`message` 是一种特定的警告。

你可以通过运行 `pylint` 来确认所有消息都已关闭：

```
$ pylint <my package>
```

通常，向 `pylint` 命令行添加参数并不是一个好主意：配置 `pylint` 的最佳位置是 `.pylintrc`。为了使它做*一些*有用的事，我们需要启用一些消息。

要启用消息，在 `.pylintrc` 中的 `[MESSAGES CONTROL]` 下添加

```
enable=<message>,
       ...
```

对于看起来有用的“消息”（Pylint 称之为不同类型的警告）。我最喜欢的包括 `too-many-lines`、`too-many-arguments` 和 `too-many-branches`。所有这些会限制模块或函数的复杂性，并且无需进行人工操作即可客观地进行代码复杂度测量。

*检查器*是*消息*的来源：每条消息只属于一个检查器。许多最有用的消息都在[设计检查器][5]下。默认数字通常都不错，但要调整最大值也很简单：我们可以在 `.pylintrc` 中添加一个名为 `DESIGN` 的段。

```
[DESIGN]
max-args=7
max-locals=15
```

另一个有用的消息来源是“重构”检查器。我已启用一些最喜欢的消息有 `consider-using-dict-comprehension`、`stop-iteration-return`（它会查找正确的停止迭代的方式是 `return` 而使用了 `raise StopIteration` 的迭代器）和 `chained-comparison`，它将建议使用如 `1 <= x < 5`，而不是不太明显的  `1 <= x && 5 > 5` 的语法。

最后是一个在性能方面消耗很大的检查器，但它非常有用，就是 `similarities`。它会查找不同部分代码之间的复制粘贴来强制执行“不要重复自己”（DRY 原则）。它只启用一条消息：`duplicate-code`。默认的 “最小相似行数” 设置为 4。可以使用 `.pylintrc` 将其设置为不同的值。

```
[SIMILARITIES]
min-similarity-lines=3
```

### Pylint 使代码评审变得简单

如果你厌倦了需要指出一个类太复杂，或者两个不同的函数基本相同的代码评审，请将 Pylint 添加到你的[持续集成][6]配置中，并且只需要对项目复杂性准则的争论一次就行。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/python-pylint-introduction

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openstack_python_vim_2.jpg?itok=4fza48WU (OpenStack source code (Python) in VIM)
[2]: https://opensource.com/article/19/5/python-flake8
[3]: https://opensource.com/article/19/5/python-black
[4]: https://opensource.com/article/19/5/python-mypy
[5]: https://pylint.readthedocs.io/en/latest/technical_reference/features.html#design-checker
[6]: https://opensource.com/business/15/7/six-continuous-integration-tools
