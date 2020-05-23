[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12241-1.html)
[#]: subject: (How to use pyenv to run multiple versions of Python on a Mac)
[#]: via: (https://opensource.com/article/20/4/pyenv)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

如何在 Mac 上使用 pyenv 运行多个版本的 Python
======

> 如果你在 macOS 上运行的项目需要没有安装的 Python 版本，请试试 pyenv。

![](https://img.linux.net.cn/data/attachment/album/202005/23/112041pawp65alw6tmea6l.jpg)

即使对于有经验的开发人员，管理本地 Python 开发环境仍然是一个挑战。尽管有详细的[软件包管理策略][2]，但仍需要采取另外的步骤来确保你在需要时运行所需的 Python 版本。

### 为什么 Python 版本重要？

起初这是一个奇怪的概念，但是编程语言会像其他任何软件一样发生变化。它们有错误、修复和更新，就像你喜欢的 [API][3] 和任何其他软件一样。同样，不同的发行版由称为[语义化版本][4]的三位数标识。

> 😭😭😭 [pic.twitter.com/yt1Z2439W8][5]
>
> — Denny Perez (@dennyperez18) [May 28, 2019][6]

多年来，Python 2 是该语言的常用主要版本。在 2020 年 1 月，Python 2 [到达最后寿命][7]，此后，Python 的核心维护者将仅支持 Python 3。Python 3 稳步发展，并定期发布新更新。对我来说定期获取这些更新很重要。

最近，我试图在 macOS 上运行一个依赖于 Python 3.5.9 的项目，而我的系统上并没有安装这个版本。我认为 Python 包管理器 `pip` 可以安装它，但事实并非如此：

```
$ pip install python3.5.9
Collecting python3.5.9
  ERROR: Could not find a version that satisfies the requirement python3.5.9 (from versions: none)
ERROR: No matching distribution found for python3.5.9
```

或者，我也可以从官方 Python 网站下载该版本，但我如何在我的 Mac 上与现有的 Python 版本一起运行？每次运行时指定 Python 解释器版本（例如 python3.7 或 python3.5）似乎很容易出错。一定会有更好的方法。

（说明：我知道这对经验丰富的 Python 开发人员没有意义，但对当时的我来说是有意义的。我很乐意谈一谈为什么我仍然认为它应该这样做。）

### 安装和设置 pyenv

值得庆幸的是，`pyenv` 可以绕开这一系列复杂的问题。首先，我需要安装 `pyenv`。我可以[从源码][8]克隆并编译它，但是我更喜欢通过 Homebrew 包管理器来管理软件包：

```
$ brew install pyenv
```

为了通过 `pyenv` 使用 Python 版本，必须了解 shell 的 `PATH` 变量。`PATH` 决定了 shell 通过命令的名称来搜索文件的位置。你必须确保 shell 程序能够找到通过 `pyenv` 运行的 Python 版本，而不是默认安装的版本（通常称为*系统版本*）。如果不更改路径，那么结果如下：

```
$ which python
/usr/bin/python
```

这是 Python 的系统版本。

要正确设置 `pyenv`，可以在 Bash 或 zsh 中运行以下命令：

```
$ PATH=$(pyenv root)/shims:$PATH
```

现在，如果你检查 Python 的版本，你会看到它是 `pyenv` 管理的版本：

```
$ which python
/Users/my_username/.pyenv/shims/python
```

该导出语句（`PATH=`）仅会对该 shell 实例进行更改，为了使更改永久生效，你需要将它添加到点文件当中。由于 zsh 是 macOS 的默认 shell，因此我将重点介绍它。将相同的语法添加到 `~/.zshrc` 文件中：

```
$ echo 'PATH=$(pyenv root)/shims:$PATH' >> ~/.zshrc
```

现在，每次我们在 zsh 中运行命令时，它将使用 `pyenv` 版本的 Python。请注意，我在 `echo` 中使用了单引号，因此它不会评估和扩展命令。

`.zshrc` 文件仅管理 zsh 实例，因此请确保检查你的 shell 程序并编辑关联的点文件。如果需要再次检查默认 shell 程序，可以运行 `echo $SHELL`。如果是 zsh，请使用上面的命令。如果你使用 Bash，请将 `~/.zshrc` 更改为 `~/.bashrc`。如果你想了解更多信息，可以在 `pyenv` 的 `README` 中深入研究[路径设置][9]。

### 使用 pyenv 管理 Python 版本

现在 `pyenv` 已经可用，我们可以看到它只有系统 Python 可用：

```
$ pyenv versions
system
```

如上所述，你绝对不想使用此版本（[阅读更多有关信息][10]）。现在 `pyenv` 已正确设置，我希望它能有我经常使用的几个不同版本的 Python。

有一种方法可以通过运行 `pyenv install --list` 来查看 pyenv 可以访问的所有仓库中的所有 Python 版本。这是一个很长的列表，将来回顾的时候可能会有所帮助。目前，我决定在 [Python 下载页面][11]找到的每个最新的“点版本”（3.5.x 或 3.6.x，其中 x 是最新的）。因此，我将安装 3.5.9 和 3.8.0：

```
$ pyenv install 3.5.9
$ pyenv install 3.8.0
```

这将需要一段时间，因此休息一会（或阅读上面的链接之一）。有趣的是，输出中显示了该版本的 Python 的下载和构建。例如，输出显示文件直接来自 [Python.org][12]。

安装完成后，你可以设置默认值。我喜欢最新的，因此将全局默认 Python 版本设置为最新版本：

```
$ pyenv global 3.8.0
```

该版本立即在我的 shell 中设置完成。确认一下：

```
$ python -V
Python 3.8.0
```

我要运行的项目仅适于 Python 3.5，因此我将在本地设置该版本并确认：

```
$ pyenv local 3.5.9
$ python -V
Python 3.5.9
```

因为我在 `pyenv` 中使用了 `local` 选项，所以它向当前目录添加了一个文件来跟踪该信息。

```
$ cat .python-version
3.5.9
```

现在，我终于可以为想要的项目设置虚拟环境，并确保运行正确版本的 Python。

```
$ python -m venv venv
$ source ./venv/bin/activate
(venv) $ which python
/Users/mbbroberg/Develop/my_project/venv/bin/python
```

要了解更多信息，请查看有关[在 Mac 上管理虚拟环境][13]的教程。

### 总结

默认情况下，运行多个 Python 版本可能是一个挑战。我发现 `pyenv` 可以确保在我需要时可以有我需要的 Python 版本。

你还有其他初学者或中级 Python 问题吗？ 请发表评论，我们将在以后的文章中考虑介绍它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/pyenv

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://opensource.com/article/19/4/managing-python-packages
[3]: https://opensource.com/article/19/5/api-evolution-right-way
[4]: https://semver.org/
[5]: https://t.co/yt1Z2439W8
[6]: https://twitter.com/dennyperez18/status/1133505310516232203?ref_src=twsrc%5Etfw
[7]: https://opensource.com/article/19/11/end-of-life-python-2
[8]: https://github.com/pyenv/pyenv
[9]: https://github.com/pyenv/pyenv#understanding-path
[10]: https://opensource.com/article/19/5/python-3-default-mac
[11]: https://www.python.org/downloads/
[12]: http://python.org
[13]: https://linux.cn/article-11086-1.html
