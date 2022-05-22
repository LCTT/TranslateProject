[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13174-1.html)
[#]: subject: (A guide to Python virtual environments with virtualenvwrapper)
[#]: via: (https://opensource.com/article/21/2/python-virtualenvwrapper)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

使用 virtualenvwrapper 构建 Python 虚拟环境
======

> 虚拟环境是安全地使用不同版本的 Python 和软件包组合的关键。

![](https://img.linux.net.cn/data/attachment/album/202103/04/072251y8wkis7c40i8crkw.jpg)

Python 对管理虚拟环境的支持，已经提供了一段时间了。Python 3.3 甚至增加了内置的 `venv` 模块，用于创建没有第三方库的环境。Python 程序员可以使用几种不同的工具来管理他们的环境，我使用的工具叫做 [virtualenvwrapper][2]。

虚拟环境是将你的 Python 项目及其依赖关系与你的系统安装的 Python 分离的一种方式。如果你使用的是基于 macOS 或 Linux 的操作系统，它很可能在安装中附带了一个 Python 版本，事实上，它很可能依赖于那个特定版本的 Python 才能正常运行。但这是你的计算机，你可能想用它来达到自己的目的。你可能需要安装另一个版本的 Python，而不是操作系统提供的版本。你可能还需要安装一些额外的库。尽管你可以升级你的系统 Python，但不推荐这样做。你也可以安装其他库，但你必须注意不要干扰系统所依赖的任何东西。

虚拟环境是创建隔离的关键，你需要安全地修改不同版本的 Python 和不同组合的包。它们还允许你为不同的项目安装同一库的不同版本，这解决了在相同环境满足所有项目需求这个不可能的问题。

为什么选择 `virtualenvwrapper` 而不是其他工具？简而言之：

  * 与 `venv` 需要在项目目录内或旁边有一个 `venv` 目录不同，`virtualenvwrapper` 将所有环境保存在一个地方：默认在 `~/.virtualenvs` 中。
  * 它提供了用于创建和激活环境的命令，而且激活环境不依赖于找到正确的 `activate` 脚本。它只需要（从任何地方）`workon projectname`而不需要 `source ~/Projects/flashylights-env/bin/activate`。 

### 开始使用

首先，花点时间了解一下你的系统 Python 是如何配置的，以及 `pip` 工具是如何工作的。

以树莓派系统为例，该系统同时安装了 Python 2.7 和 3.7。它还提供了单独的 `pip` 实例，每个版本一个：

  * 命令 `python` 运行 Python 2.7，位于 `/usr/bin/python`。
  * 命令 `python3` 运行 Python 3.7，位于 `/usr/bin/python3`。
  * 命令 `pip` 安装 Python 2.7 的软件包，位于 `/usr/bin/pip`。
  * 命令 `pip3` 安装 Python 3.7 的包，位于 `/usr/bin/pip3`。

![Python commands on Raspberry Pi][3]

在开始使用虚拟环境之前，验证一下使用 `python` 和 `pip` 命令的状态是很有用的。关于你的 `pip` 实例的更多信息可以通过运行 `pip debug` 或 `pip3 debug` 命令找到。

在我运行 Ubuntu Linux 的电脑上几乎是相同的信息（除了它是 Python 3.8）。在我的 Macbook 上也很相似，除了唯一的系统 Python 是 2.6，而我用 `brew` 安装 Python 3.8，所以它位于 `/usr/local/bin/python3`（和 `pip3` 一起）。

### 安装 virtualenvwrapper

你需要使用系统 Python 3 的 `pip` 安装 `virtualenvwrapper`：


```
sudo pip3 install virtualenvwrapper
```

下一步是配置你的 shell 来加载 `virtualenvwrapper` 命令。你可以通过编辑 shell 的 RC 文件（例如 `.bashrc`、`.bash_profile` 或 `.zshrc`）并添加以下几行：

```
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
```

![bashrc][5]

如果你的 Python 3 位于其他地方，请根据你的设置修改第一行。

关闭你的终端，然后重新打开它，这样才能生效。第一次打开终端时，你应该看到 `virtualenvwrapper` 的一些输出。这只会发生一次，因为一些目录是作为设置的一部分被创建的。

现在你应该可以输入 `mkvirtualenv --version` 命令来验证 `virtualenvwrapper` 是否已经安装。

### 创建一个新的虚拟环境

假设你正在进行一个名为 `flashylights` 的项目。要用这个名字创建一个虚拟环境，请运行该命令：

```
mkvirtualenv flashylights
```

环境已经创建并激活，所以你会看到 `(flashlylights)` 出现在你的提示前：

![Flashylights prompt][6]

现在环境被激活了，事情发生了变化。`python` 现在指向一个与你之前在系统中识别的 Python 实例完全不同的 Python 实例。它为你的环境创建了一个目录，并在其中放置了 Python 3 二进制文件、pip 命令等的副本。输入 `which python` 和 `which pip` 来查看它们的位置。

![Flashylights command][7]

如果你现在运行一个 Python 程序，你可以用 `python` 代替 `python3` 来运行，你可以用 `pip` 代替 `pip3`。你使用 `pip`安装的任何包都将只安装在这个环境中，它们不会干扰你的其他项目、其他环境或系统安装。

要停用这个环境，运行 `deactivate` 命令。要重新启用它，运行 `workon flashylights`。

你可以用 `workon` 或使用 `lsvirtualenv` 列出所有可用的环境。你可以用 `rmvirtualenv flashylights` 删除一个环境。

在你的开发流程中添加虚拟环境是一件明智的事情。根据我的经验，它可以防止我在系统范围内安装我正在试验的库，这可能会导致问题。我发现 `virtualenvwrapper` 是最简单的可以让我进入流程的方法，并无忧无虑地管理我的项目环境，而不需要考虑太多，也不需要记住太多命令。

### 高级特性

  * 你可以在你的系统上安装多个 Python 版本（例如，在 Ubuntu 上使用 [deadsnakes PPA][8]），并使用该版本创建一个虚拟环境，例如，`mkvirtualenv -p /usr/bin/python3.9 myproject`。
  * 可以在进入和离开目录时自动激活、停用。
  * 你可以使用 `postmkvirtualenv` 钩子在每次创建新环境时安装常用工具。

更多提示请参见[文档][9]。

_本文基于 Ben Nuttall 在 [Tooling Tuesday 上关于 virtualenvwrapper 的帖子][10]，经许可后重用。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/python-virtualenvwrapper

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_python.jpg?itok=G04cSvp_ (Python in a coffee cup.)
[2]: https://virtualenvwrapper.readthedocs.io/en/latest/index.html
[3]: https://opensource.com/sites/default/files/uploads/pi-python-cmds.png (Python commands on Raspberry Pi)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/bashrc.png (bashrc)
[6]: https://opensource.com/sites/default/files/uploads/flashylights-activated-prompt.png (Flashylights prompt)
[7]: https://opensource.com/sites/default/files/uploads/flashylights-activated-cmds.png (Flashylights command)
[8]: https://tooling.bennuttall.com/deadsnakes/
[9]: https://virtualenvwrapper.readthedocs.io/en/latest/tips.html
[10]: https://tooling.bennuttall.com/virtualenvwrapper/
