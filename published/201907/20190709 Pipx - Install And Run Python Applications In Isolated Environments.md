[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11104-1.html)
[#]: subject: (Pipx – Install And Run Python Applications In Isolated Environments)
[#]: via: (https://www.ostechnix.com/pipx-install-and-run-python-applications-in-isolated-environments/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Pipx：在隔离环境中安装和运行 Python 应用
======

![][1]

我们始终建议在虚拟环境中安装 Python 应用以避免彼此冲突。Pip 包管理器可以帮助我们在隔离的环境中安装 Python 应用，我们使用两个工具，即 `venv` 和 `virtualenv`。还有一个 Python.org 推荐的名为 [Pipenv][2] 的 Python 包管理器也可以用来安装 Python 应用。与 Pip 不同，Pipenv 默认会自动创建虚拟环境。这意味着你不再需要为项目手动创建虚拟环境。今天，我偶然发现了一个名为 “Pipx” 的类似工具，它是一个自由开源程序，允许你在隔离的虚拟环境中安装和运行 Python 应用。

使用 Pipx，我们可以轻松安装 PyPI 中托管的数千个 Python 应用，而不会有太多麻烦。好的是，你可以使用常规用户权限执行所有操作。你不需要成为 “root” 用户或不需要具有 “sudo” 权限。值得一提的是，Pipx 可以从临时环境运行程序，而无需安装它。当你经常测试同一程序的多个版本时，这将非常方便。随 Pipx 一起安装的软件包可以随时列出、升级或卸载。Pipx 是一个跨平台的程序，因此它可以在 Linux、Mac OS 和 Windows 上运行。

### 安装 Pipx

Python 3.6+ 、Pip 和 `venv` 模块是安装 `pipx` 所必需的。确保按照以下指南中的说明安装它们。

* [如何使用 Pip 管理 Python 包][3]

此处，需要 `venv` 来创建虚拟环境。

接下来，运行以下命令安装 Pipx。

```
$ python3 -m pip install --user pipx
$ python3 -m userpath append ~/.local/bin
```

`pipx` 二进制文件的默认位置是 `~/.local/bin`。你可以使用 `PIPX_BIN_DIR` 环境变量覆盖它。如果要覆盖 `PIPX_BIN_DIR`，只需运行 `userpath append $PIPX_BIN_DIR`，确保它在你的路径中。

Pipx 的默认虚拟环境位置是 `~/.local/pipx`。这可以用环境变量 `PIPX_HOME` 覆盖。

让我们继续看看如何使用 Pipx 安装 Python 应用。

### 使用 Pipx 在隔离环境中安装和运行 Python 应用

以下是 Pipx 入门的几个例子

#### 安装 Python 包

要全局安装 Python 应用，例如 cowsay，请运行：

```
$ pipx install cowsay
```

此命令将自动创建虚拟环境，在其中安装包并包的可执行文件放在 `$PATH` 中。

示例输出：

```
installed package cowsay 2.0.3, Python 3.6.8
These binaries are now globally available
- cowsay
done! ✨ 🌟 ✨
```

![1][4]

*使用 Pipx 安装 Python 应用*

让我们测试新安装的 cowsay 程序：

![1][5]

在这里，我从官方网站上摘取了这些例子。你可以安装/测试任何其他的 Python 包。

#### 列出 Python 包

要使用 Pipx 列出所有已安装的应用，请运行：

```
$ pipx list
```

示例输出：

```
venvs are in /home/sk/.local/pipx/venvs
binaries are exposed on your $PATH at /home/sk/.local/bin
package cowsay 2.0.3, Python 3.6.8
- cowsay
```

如果你尚未安装任何软件包，你将看到以下输出：

```
nothing has been installed with pipx 😴
```

#### 升级包

要升级包，只需执行以下操作：

```
$ pipx upgrade cowsay
```

要一次性升级所有已安装的软件包，请使用：

```
$ pipx upgrade-all
```

#### 从临时虚拟环境运行应用

有时，你可能希望运行特定的 Python 程序，但并不实际安装它。

```
$ pipx run pycowsay moooo
```

![1][6]

*在临时隔离虚拟环境中运行 Python 应用*

此命令实际上并不安装指定程序，而是从临时虚拟环境运行它。你可以使用此命令快速测试 Python 应用。

你甚至可以直接运行 .py 文件。

```
$ pipx run https://gist.githubusercontent.com/cs01/fa721a17a326e551ede048c5088f9e0f/raw/6bdfbb6e9c1132b1c38fdd2f195d4a24c540c324/pipx-demo.py
pipx is working!
```

#### 卸载软件包

可以使用以下命令卸载软件包：

```
$ pipx uninstall cowsay
```

要删除所有已安装的包：

```
$ pipx uninstall-all
```

#### 获得帮助

要查看帮助部分，请运行：

```
$ pipx --help
```

就是这些了。如果你一直在寻找安全，方便和可靠的程序来安装和运行 Python 应用，Pipx 可能是一个不错的选择。

资源：

* [Pipx 的 GitHub 仓库][7]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/pipx-install-and-run-python-applications-in-isolated-environments/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/pipx-720x340.png
[2]: https://www.ostechnix.com/pipenv-officially-recommended-python-packaging-tool/
[3]: https://www.ostechnix.com/manage-python-packages-using-pip/
[4]: https://www.ostechnix.com/wp-content/uploads/2019/07/Install-Python-Applications-Using-Pipx.png
[5]: https://www.ostechnix.com/wp-content/uploads/2019/07/Test-Python-application.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/07/Run-Python-Applications-In-Isolated-Environments.png
[7]: https://github.com/pipxproject/pipx
