[#]: subject: "Fixing “Command ‘python’ not found” Error in Ubuntu Linux"
[#]: via: "https://itsfoss.com/python-not-found-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14878-1.html"

修复 Ubuntu Linux 中 “Command ‘python’ not found” 的错误
======

![](https://img.linux.net.cn/data/attachment/album/202207/30/071627r176w1k1y5dkkw6w.jpg)

如何在 Linux 终端中运行一个 Python 程序？像这样，对吗？

```
python program.py
```

然而，如果你试图在 Ubuntu（和其他一些发行版）中使用 `python` 命令，它会抛出一个错误。

```
command ‘python’ not found, did you mean:
command ‘python3’ from deb python3
command ‘python’ from deb python-is-python3
```

如果你注意这个错误信息，它说明了很多东西。**这里的 `python` 命令实际上是 `python3`**。

如果你不理解，不用担心。我将在这里详细解释。

### 为什么在 Ubuntu 上没有发现 python 命令？

这是因为 Python 语言不是以 `python` 的形式安装的，而是以 `python3` 或 `python2` 的形式安装的（在一些老的 Ubuntu 版本中）。

在遥远的过去的某个时间点，Python 实际上是作为 `python` 包/可执行文件提供的。当 Python 发布第二版时，Ubuntu 和其他发行版不得不同时支持 Python 1.x 和 2.x 版本。

因此，他们将较新的 Python 版本命名为 `python2`，以区分这两个版本。其他应用或库也在其代码中指定 `python` 或 `python2`。

最终，Python 1 版本被完全停用，但软件包继续被命名为 `python2`。

类似地，当 Python 3 版本发布时，发行版开始同时提供 `python2` 和 `python3` 包。

Python 2 不再被支持，Python 3.x 是你在 Ubuntu 上安装的版本。该软件包仍被命名为 `python3`。

**总结一下，你已经在 Ubuntu 上安装了 Python。它是以 `python3` 软件包方式使用的。**

那么，当你 [在 Ubuntu 上看到 “Python command not found” 的错误][1] 时，你有什么选择？让我来介绍一下。

### 确保你的系统中已经安装了 Python

它应该已经安装了，但仔细检查一下也无妨。

Ubuntu 18.04 也有 Python 2，但 20.04 及更高版本只有 Python 3。不过，你有哪个版本：

```
type python python2 python3
```

正如你在下面的截图中看到的，我的系统上安装了 Python 3 版本。

![Checking Python version in Ubuntu][2]

如果你没有安装任何 Python 版本，你可以用以下命令安装 Python 3 版本。

```
sudo apt install python3
```

### 使用 python3 而不是 python

如果对你来说不是太麻烦，在需要的地方使用 `python3` 命令而不是 `python`。

想检查已安装的 Python 版本吗？请这样输入：

```
python3 --version
```

然后你会在输出中得到版本的详细信息：

```
~$ python3 --version
Python 3.10.4
```

如果你必须运行一个 Python 程序，请像这样执行它：

```
python3 program.py
```

这在大多数情况下应该对你有用。但是，如果你使用的是一些（旧的）Python 应用，期望在其代码中运行 Python 可执行文件，你就会有问题。别担心，你也可以绕过它。

### 将 python3 链接为 python

你可以在你的 `.bashrc` 文件中创建一个永久别名，像这样：

```
alias python='python3'
```

这样，你可以运行 `python` 命令，而你的系统运行 `python3`。

这在大多数情况下都会起作用，除非某些程序期望运行 `/usr/bin/python`。现在，你可以在 `/usr/bin/python` 和 `/usr/bin/python3` 之间建立符号链接，但对于 Ubuntu 用户来说，存在一个更简单的选择。

对于 Ubuntu 20.04 和更高版本，如果你安装了 `python-is-python3` 软件包，你有一个软件包可以自动完成所有链接创建。这也是原始错误信息所提示的。

```
sudo apt install python-is-python3
```

![install python is python3 ubuntu][3]

你可以看到符号链接已经被创建，你可以使用 `python` 命令（实际上是运行 `python3`），没有任何问题。

![checking python ubuntu][4]

我希望这能澄清 Ubuntu 中 Python 软件包的问题。如果你有任何问题或建议，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/python-not-found-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/bash-command-not-found/
[2]: https://itsfoss.com/wp-content/uploads/2022/07/check-python-version-ubuntu.png
[3]: https://itsfoss.com/wp-content/uploads/2022/07/install-python-is-python3-ubuntu.png
[4]: https://itsfoss.com/wp-content/uploads/2022/07/checking-python-ubuntu.png
