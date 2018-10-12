如何在Ubuntu上安装Pip
======
**Pip是一个命令行工具，允许你安装Python编写的软件包。 学习如何在Ubuntu上安装Pip以及如何使用它来安装Python应用程序。**

有许多方法可以[在Ubuntu上安装软件][1]。 你可以从软件中心安装应用程序，也可以从下载的DEB文件，PPA（LCTT译者注：PPA即Personal Package Archives，个人软件包集），[Snap软件包][2]，也可以使用[使用Flatpak][3]，使用[AppImage][4]，甚至从旧的源代码安装。

还有一种方法可以在[Ubuntu][5]中安装软件包。 它被称为Pip，你可以使用它来安装基于Python的应用程序。

### 什么是Pip

[Pip][6]代表“Pip Installs Packages”。 [Pip][7]是一个基于命令行的包管理系统。 用于安装和管理[Python语言][8]编写的软件。

你可以使用Pip来安装Python包索引（[PyPI][9]）中列出的包。

作为软件开发人员，你可以使用pip为你自己的Python项目安装各种Python模块和包。

作为最终用户，你可能需要使用pip来安装一些Python开发的并且可以使用pip轻松安装的应用程序。 一个这样的例子是[Stress Terminal][10]应用程序，你可以使用pip轻松安装。

让我们看看如何在Ubuntu和其他基于Ubuntu的发行版上安装pip。

### 如何在Ubuntu上安装Pip

![Install pip on Ubuntu Linux][11]

默认情况下，Pip未安装在Ubuntu上。 你必须安装它。 在Ubuntu上安装pip非常简单。 我马上展示给你。

Ubuntu 18.04默认安装了Python 2和Python 3。 因此，你应该为两个Python版本安装pip。

Pip，默认情况下是指Python 2。pip3代表Python 3中的Pip。

注意：我在本教程中使用的是Ubuntu 18.04。 但是这里的教程应该适用于其他版本，如Ubuntu 16.04,18.10等。你也可以在基于Ubuntu的其他Linux发行版上使用相同的命令，如Linux Mint，Linux Lite，Xubuntu，Kubuntu等。

#### 为Python 2安装pip

首先，确保已经安装了Python 2。 在Ubuntu上，可以使用以下命令进行验证。

```
python2 --version
```

如果没有错误并且显示了Python版本的有效输出，则说明安装了Python 2。 所以现在你可以使用这个命令为Python 2安装pip：

```
sudo apt install python-pip
```

它将使用它安装pip和许多其他的依赖项。 安装完成后，请确认你已正确安装了pip。

```
pip --version
```

它应该显示一个版本号，如下所示：

```
pip 9.0.1 from /usr/lib/python2.7/dist-packages (python 2.7)
```

这意味着你已经成功在Ubuntu上安装了pip。

#### 为Python 3安装pip

你必须确保在Ubuntu上安装了Python 3。 可以使用以下命令检查一下：

```
python3 --version
```

如果显示了像Python 3.6.6这样的数字，则说明Python 3在你的Linux系统上安装好了。

现在，你可以使用以下命令安装pip3：

```
sudo apt install python3-pip
```

你应该使用以下命令验证pip3是否已正确安装：

```
pip3 --version
```

它应该显示一个这样的数字：

```
pip 9.0.1 from /usr/lib/python3/dist-packages (python 3.6)
```

这意味着pip3已成功安装在你的系统上。

### 如何使用Pip命令

现在你已经安装了pip，让我们快速看一些基本的pip命令。 这些命令将帮助你使用pip命令来搜索，安装和删除Python包。

要从Python包索引PypI中搜索包，可以使用以下pip命令：

```
pip search <search_string>
```

例如，如果你搜索stress这个词，将会显示名称或描述中包含字符串'stress'的所有包。

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

如果要使用pip安装应用程序，可以按以下方式使用它：

```
pip install <package_name>
```

Pip不支持使用tab键补全包名，因此包名称应该是准确的。 它将下载所有必需的文件并安装该软件包。

如果要删除通过pip安装的Python包，可以使用pip中的remove选项。

```
pip uninstall <installed_package_name>
```

你可以在上面的命令中使用pip3代替pip。

我希望这个快速提示可以帮助你在Ubuntu上安装pip。 如果你有任何问题或建议，请在下面的评论部分告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-pip-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://itsfoss.com/how-to-add-remove-programs-in-ubuntu/
[2]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[3]: https://itsfoss.com/flatpak-guide/
[4]: https://itsfoss.com/use-appimage-linux/
[5]: https://www.ubuntu.com/
[6]: https://en.wikipedia.org/wiki/Pip_(package_manager)
[7]: https://pypi.org/project/pip/
[8]: https://www.python.org/
[9]: https://pypi.org/
[10]: https://itsfoss.com/stress-terminal-ui/
[11]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/install-pip-ubuntu.png
