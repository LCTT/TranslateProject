[#]: subject: (Run Python applications in virtual environments)
[#]: via: (https://opensource.com/article/21/7/python-pipx)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13631-1.html)

pipx：在虚拟环境中运行 Python 应用
======

> 通过使用 pipx 隔离运行 Python 应用来避免版本冲突并提高安全性。

![](https://img.linux.net.cn/data/attachment/album/202107/29/205146cpwgxnnpgu44gxz0.jpg)

如果你使用 Python，你可能会安装很多 Python 应用。有些是你只想尝试的工具。还有一些是你每天都在使用的久经考验的应用，所以你把它们安装在你使用的每一台计算机上。这两种情况下，在虚拟环境中运行你的 Python 应用是非常有用的，这可以使它们以及它们的依赖关系相互分离，以避免版本冲突，并使它们与你系统的其它部分隔离，以提高安全性。

这就是 [pipx][2] 出场的地方。

大多数 Python 应用可以使用 [pip][3] 进行安装，它只安装 Python 包。然而，`pipx` 为你的 Python 应用创建并管理一个虚拟环境，并帮助你运行它们。

### 安装 pipx

`pipx` 主要是一个 RPM 包，你可以在任何 Fedora、RHEL 或 CentOS 机器上安装它：

```
$ sudo dnf install pipx
```

### 使用 pipx

我将通过 Cowsay 以及 [Concentration][4] 工具演示如何使用 `pipx`。

#### 安装软件包

安装完 `pipx` 后，你可以用以下方法安装 Python 包：

```
$ pipx install <python_package>
```

要安装 Cowsay 包：

```
$ pipx install cowsay                         ✔ │ 20:13:41 
 installed package cowsay 4.0, Python 3.9.5
 These apps are now globally available
    - cowsay
done! ✨ 🌟 ✨
```

现在你可以在系统的任何地方运行 Cowsay，通过终端与你对话！


```
$ cowsay "I <3 OSDC"                         
  _________
| I <3 OSDC |
  =========
        \
        \
                ^__^
                (oo)\_______
                (__)\           )\/\
                ||----w |
                ||      ||
```

![Cowsay][5]

#### 以特殊权限进行安装

不是所有的应用都像 Cowsay 一样简单。例如，Concentration 会与你系统中的许多其他组件交互，所以它需要特殊的权限。用以下方式安装它：

```
$ pipx install concentration                                      ✔ │ 10s │ │ 20:26:12 
 installed package concentration 1.1.5, Python 3.9.5
 These apps are now globally available
    - concentration
done! ✨ 🌟 ✨
```

Concentration 通过阻止 `distractors` 文件中列出的特定网站来帮助你集中注意力。要做到这点，它需要以 `sudo` 或 root 权限运行。你可以用 [OpenDoas][7] 来做到这点，这是 `doas` 命令的一个版本，可以用特定的用户权限运行任何命令。要使用 `doas` 以 `sudo` 权限来运行 Concentration：

```
$ doas concentration improve                                 ✔ │ │ 20:26:54 
doas (sumantrom) password: 
Concentration is now improved :D!
```

如你所见，这个独立的应用能够改变系统中的一些东西。

#### 列出已安装的应用

`pipx list` 命令显示所有用 `pipx` 安装的应用和它们的可执行路径：

```
$ pipx list                                                                       
venvs are in /home/sumantrom/.local/pipx/venvs
apps are exposed on your $PATH at /home/sumantrom/.local/bin
 package concentration 1.1.5, Python 3.9.5
    - concentration
 package cowsay 4.0, Python 3.9.5
    - cowsay
```

#### 卸载应用

当你使用完毕后，知道如何卸载它们是很重要的。`pipx` 有一个非常简单的卸载命令：

```
$ pipx uninstall <package name>
```

或者你可以删除每个软件包：

```
$ pipx uninstall-all

pipx uninstall-all                           2 ✘ │ 20:13:35 
uninstalled cowsay! ✨ 🌟 ✨
uninstalled concentration! ✨ 🌟 ✨
```

### 尝试 pipx

`pipx` 是一个流行的 Python 应用的包管理器。它可以访问 [PyPi][8] 上的所有东西，但它也可以从包含有效 Python 包的本地目录、Python wheel 或网络位置安装应用。

如果你安装了大量的 Python 应用，可以试试 `pipx`。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/python-pipx

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://pypi.org/project/pipx/
[3]: https://pypi.org/project/pip/
[4]: https://opensource.com/article/20/8/python-concentration
[5]: https://opensource.com/sites/default/files/uploads/cowsay.png (Cowsay)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://github.com/Duncaen/OpenDoas
[8]: https://pypi.org/
