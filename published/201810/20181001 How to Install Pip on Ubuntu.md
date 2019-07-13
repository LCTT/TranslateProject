如何在 Ubuntu 上安装 pip
======

**`pip` 是一个命令行工具，允许你安装 Python 编写的软件包。 学习如何在 Ubuntu 上安装 `pip` 以及如何使用它来安装 Python 应用程序。**

有许多方法可以[在 Ubuntu 上安装软件][1]。 你可以从软件中心安装应用程序，也可以从下载的 DEB 文件、PPA（LCTT 译注：PPA 即 Personal Package Archives，个人软件包集）、[Snap 软件包][2]，也可以使用 [Flatpak][3]、使用 [AppImage][4]，甚至用旧的源代码安装方式。

还有一种方法可以在 [Ubuntu][5] 中安装软件包。 它被称为 `pip`，你可以使用它来安装基于 Python 的应用程序。

### 什么是 pip

[pip][6] 代表 “pip Installs Packages”。 [pip][7] 是一个基于命令行的包管理系统。 用于安装和管理 [Python 语言][8]编写的软件。

你可以使用 `pip` 来安装 Python 包索引（[PyPI][9]）中列出的包。

作为软件开发人员，你可以使用 `pip` 为你自己的 Python 项目安装各种 Python 模块和包。

作为最终用户，你可能需要使用 `pip` 来安装一些 Python 开发的并且可以使用 `pip` 轻松安装的应用程序。 一个这样的例子是 [Stress Terminal][10] 应用程序，你可以使用 `pip` 轻松安装。

让我们看看如何在 Ubuntu 和其他基于 Ubuntu 的发行版上安装 `pip`。

### 如何在 Ubuntu 上安装 pip

![Install pip on Ubuntu Linux][11]

默认情况下，`pip` 未安装在 Ubuntu 上。 你必须首先安装它才能使用。 在  Ubuntu 上安装 `pip` 非常简单。 我马上展示给你。

Ubuntu 18.04 默认安装了 Python 2 和 Python 3。 因此，你应该为两个 Python 版本安装 `pip`。

`pip`，默认情况下是指 Python 2。`pip3` 代表 Python 3 中的 pip。

注意：我在本教程中使用的是 Ubuntu 18.04。 但是这里的教程应该适用于其他版本，如Ubuntu 16.04、18.10 等。你也可以在基于 Ubuntu 的其他 Linux 发行版上使用相同的命令，如 Linux Mint、Linux Lite、Xubuntu、Kubuntu 等。

#### 为 Python 2 安装 pip

首先，确保已经安装了 Python 2。 在 Ubuntu 上，可以使用以下命令进行验证。

```
python2 --version
```

如果没有错误并且显示了 Python 版本的有效输出，则说明安装了 Python 2。 所以现在你可以使用这个命令为 Python 2 安装 `pip`：

```
sudo apt install python-pip
```

这将安装 `pip` 和它的许多其他依赖项。 安装完成后，请确认你已正确安装了 `pip`。

```
pip --version
```

它应该显示一个版本号，如下所示：

```
pip 9.0.1 from /usr/lib/python2.7/dist-packages (python 2.7)
```

这意味着你已经成功在 Ubuntu 上安装了 `pip`。

#### 为 Python 3 安装 pip

你必须确保在 Ubuntu 上安装了 Python 3。 可以使用以下命令检查一下：

```
python3 --version
```

如果显示了像 Python 3.6.6 这样的数字，则说明 Python 3 在你的 Linux 系统上安装好了。

现在，你可以使用以下命令安装 `pip3`：

```
sudo apt install python3-pip
```

你应该使用以下命令验证 `pip3` 是否已正确安装：

```
pip3 --version
```

它应该显示一个这样的数字：

```
pip 9.0.1 from /usr/lib/python3/dist-packages (python 3.6)
```

这意味着 `pip3` 已成功安装在你的系统上。

### 如何使用 pip 命令

现在你已经安装了 `pip`，让我们快速看一些基本的 `pip` 命令。 这些命令将帮助你使用 `pip` 命令来搜索、安装和删除 Python 包。

要从 Python 包索引 PyPI 中搜索包，可以使用以下 `pip` 命令：

```
pip search <search_string>
```

例如，如果你搜索“stress”这个词，将会显示名称或描述中包含字符串“stress”的所有包。

```
pip search stress
stress (1.0.0) - A trivial utility for consuming system resources.
s-tui (0.8.2) - Stress Terminal UI stress test and monitoring tool
stressypy (0.0.12) - A simple program for calling stress and/or stress-ng from python
fuzzing (0.3.2) - Tools for stress testing applications.
stressant (0.4.1) - Simple stress-test tool
stressberry (0.1.7) - Stress tests for the Raspberry Pi
mobbage (0.2) - A HTTP stress test and benchmark tool
stresser (0.2.1) - A large-scale stress testing framework.
cyanide (1.3.0) - Celery stress testing and integration test support.
pysle (1.5.7) - An interface to ISLEX, a pronunciation dictionary with stress markings.
ggf (0.3.2) - global geometric factors and corresponding stresses of the optical stretcher
pathod (0.17) - A pathological HTTP/S daemon for testing and stressing clients.
MatPy (1.0) - A toolbox for intelligent material design, and automatic yield stress determination
netblow (0.1.2) - Vendor agnostic network testing framework to stress network failures
russtress (0.1.3) - Package that helps you to put lexical stress in russian text
switchy (0.1.0a1) - A fast FreeSWITCH control library purpose-built on traffic theory and stress testing.
nx4_selenium_test (0.1) - Provides a Python class and apps which monitor and/or stress-test the NoMachine NX4 web interface
physical_dualism (1.0.0) - Python library that approximates the natural frequency from stress via physical dualism, and vice versa.
fsm_effective_stress (1.0.0) - Python library that uses the rheological-dynamical analogy (RDA) to compute damage and effective buckling stress in prismatic shell structures.
processpathway (0.3.11) - A nifty little toolkit to create stress-free, frustrationless image processing pathways from your webcam for computer vision experiments. Or observing your cat.
```

如果要使用 `pip` 安装应用程序，可以按以下方式使用它：

```
pip install <package_name>
```

`pip` 不支持使用 tab 键补全包名，因此包名称需要准确指定。 它将下载所有必需的文件并安装该软件包。

如果要删除通过 `pip` 安装的 Python 包，可以使用 `pip` 中的 `uninstall` 选项。

```
pip uninstall <installed_package_name>
```

你可以在上面的命令中使用 `pip3` 代替 `pip`。

我希望这个快速提示可以帮助你在 Ubuntu 上安装 `pip`。 如果你有任何问题或建议，请在下面的评论部分告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-pip-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://itsfoss.com/how-to-add-remove-programs-in-ubuntu/
[2]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[3]: https://itsfoss.com/flatpak-guide/
[4]: https://itsfoss.com/use-appimage-linux/
[5]: https://www.ubuntu.com/
[6]: https://en.wikipedia.org/wiki/pip_(package_manager)
[7]: https://pypi.org/project/pip/
[8]: https://www.python.org/
[9]: https://pypi.org/
[10]: https://itsfoss.com/stress-terminal-ui/
[11]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/install-pip-ubuntu.png
