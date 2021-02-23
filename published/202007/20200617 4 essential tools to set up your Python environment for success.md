[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12369-1.html)
[#]: subject: (4 essential tools to set up your Python environment for success)
[#]: via: (https://opensource.com/article/20/6/python-tools)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

建立成功的 Python 环境的 4 个基本工具
======

> 选择的这些工具将简化你的 Python 环境，以实现顺畅和一致的开发实践。

![](https://img.linux.net.cn/data/attachment/album/202007/01/123009yolmlzp1yu1y88ew.jpg)

Python 是一门出色的通用编程语言，经常作为第一门编程语言来教授。二十年来，我为它撰写了很多本书，而它仍然是[我的首选语言][2]。虽然通常来说这门语言是简洁明了的，但是（正如 [xkcd][3] 讽刺的），从来没有人说过配置 Python 环境也是一样的简单。

![xkcd python illustration][4]

*一个复杂的Python环境。 [xkcd][3]*

在日常生活中有很多使用 Python 的方法。我将解释我是如何使用这些 Python 生态系统工具的。但坦诚的说，我仍在寻找更好的替代品。

### 使用 pyenv 来管理 Python 版本

我发现在机器上运行一个特定版本的 Python 的最好方法是使用 `pyenv`。这个软件可以在 Linux、Mac OS X 和 WSL2 上工作：这是我通常关心的三个 “类 UNIX” 环境。

安装 `pyenv` 本身有时会有点棘手。一种方法是使用专用的 [pyenv 安装程序][5]，它使用 `curl | bash` 方法来进行（详见其说明）。

如果你是在 Mac 上（或者你运行 Homebrew 的其他系统），你可以按照[这里][6]的说明来安装和使用 `pyenv`。

按照说明安装和设置了 `pyenv` 之后，你可以使用 `pyenv global` 来设置一个 “默认的” Python 版本。一般来说，你会选择你的 “首选” 版本。这通常是最新的稳定版本，但如果有其他考虑因素也可能做出不同的选择。

### 使用 virtualenvwrapper 让虚拟环境更简单

使用 `pyenv` 安装 Python 的一个好处是，你所有后继安装的 Python 解释器环境都是你自己的，而不是操作系统层面的。

虽然在 Python 本身内部安装东西通常不是最好的选择，但有一个例外：在上面选择的 “首选” Python 中，安装并配置 `virtualenvwrapper`。这样你就可以瞬间创建和切换到虚拟环境。

我在[这篇文章中][7]具体介绍了如何安装和使用 `virtualenvwrapper`。

这里我推荐一个独特的工作流程：你可以制作一个可以大量重复运行的虚拟环境，用来做<ruby>运行器<rt>runner</rt></ruby>。在这个环境中，可以安装你最喜欢的运行器 —— 也就是你会经常用来运行其他软件的软件。就目前而言，我的首选是 `tox`。

### 使用 tox 作为 Python 运行器

[tox][8] 是一个很好的工具，可以让你的 Python 测试自动化。在每个 Python 环境中，我都会创建一个 `tox.ini` 文件。无论我使用什么系统做持续集成，都可以运行它，我可以用上面文章中描述的 `virtualenvwrapper` 的 `workon` 语法在本地运行同样的东西：

```
$ workon runner
$ tox
```

这个工作流程之所以重要，是因为我要在多个版本的 Python 和多个版本的依赖库中测试我的代码。这意味着在 `tox` 运行器中会有多个环境。一些会尝试在最新的依赖关系中运行，一些会尝试在冻结的依赖关系中运行（接下来会有更多的介绍），我也可能会用 `pip-compile` 在本地生成这些环境。

附注：我目前正在[研究使用 nox][9] 作为 `tox` 的替代品。原因超出了本文的范畴，但值得一试。

### 使用 pip-compile 进行 Python 依赖性管理

Python 是一种动态编程语言，这意味着它在每次执行代码时都会加载其依赖关系。能否确切了解每个依赖项的具体运行版本可能意味着是平稳运行代码还是意外崩溃。这意味着我们必须考虑依赖管理工具。

对于每个新项目，我都会包含一个 `requirements.in` 文件，（通常）只有以下内容：

```
.
```

是的，没错。只有一个点的单行。我在 `setup.py` 文件中记录了 “宽松” 的依赖关系，比如 `Twisted>=17.5`。这与 `Twisted==18.1` 这样的确切依赖关系形成了鲜明对比，后者在需要一个特性或错误修复时，难以升级到新版本的库。

`.` 的意思是 “当前目录”，它使用当前目录下的 `setup.py` 作为依赖关系的来源。

这意味着使用 `pip-compile requirements.in > requirements.txt` 会创建一个冻结的依赖文件。你可以在 `virtualenvwrapper` 创建的虚拟环境中或者 `tox.ini` 中使用这个依赖文件。

有时，也可以从 `requirements-dev.in`（内容：`.[dev]`）生成 `requirements-dev.txt`，或从 `requirements-test.in`（内容：`.[test]`）生成 `requirements-test.txt`。

我正在研究在这个流程中是否应该用 [dephell][10] 代替 `pip-compile`。`dephell` 工具有许多有趣的功能，比如使用异步 HTTP 请求来下载依赖项。

### 结论

Python 的功能既强大又赏心悦目。为了编写这些代码，我依靠了一个对我来说很有效的特定工具链。工具 `pyenv`、`virtualenvwrapper`、`tox` 和 `pip-compile` 都是独立的。但是，它们各有各的作用，没有重叠，它们一起打造了一个强大的 Python 工作流。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/python-tools

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r (Python programming language logo with question marks)
[2]: https://opensource.com/article/19/10/why-love-python
[3]: https://xkcd.com/1987/
[4]: https://opensource.com/sites/default/files/uploads/python_environment_xkcd_1.png (xkcd python illustration)
[5]: https://github.com/pyenv/pyenv-installer
[6]: https://linux.cn/article-12241-1.html
[7]: https://linux.cn/article-11086-1.html
[8]: https://opensource.com/article/19/5/python-tox
[9]: https://nox.thea.codes/en/stable/
[10]: https://github.com/dephell/dephell
