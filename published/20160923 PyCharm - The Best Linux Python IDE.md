PyCharm - Linux 下最好的 Python IDE
=========
![](https://fthmb.tqn.com/AVEbzYN3BPH_8cGYkPflIx58-XE=/768x0/filters:no_upscale()/about/pycharm2-57e2d5ee5f9b586c352c7493.png)

### 介绍

在这篇指南中，我将向你介绍一个集成开发环境 - PyCharm， 你可以在它上面使用 Python 编程语言开发专业应用。

Python 是一门优秀的编程语言，因为它真正实现了跨平台，用它开发的应用程序在 Windows、Linux 以及 Mac 系统上均可运行，无需重新编译任何代码。

PyCharm 是由 [Jetbrains][3] 开发的一个编辑器和调试器，[Jetbrains][3] 就是那个开发了 Resharper 的人。不得不说，Resharper 是一个很优秀的工具，它被 Windows 开发者们用来重构代码，同时，它也使得 Windows 开发者们写 .NET 代码更加轻松。[Resharper][2] 的许多原则也被加入到了 [PyCharm][3] 专业版中。

### 如何安装 PyCharm

我已经[写了一篇][4]关于如何获取 PyCharm 的指南，下载、解压文件，然后运行。

### 欢迎界面

当你第一次运行 PyCharm 或者关闭一个项目的时候，会出现一个屏幕，上面显示一系列近期项目。

你也会看到下面这些菜单选项：

*   创建新项目
*   打开项目
*   从版本控制仓库检出

还有一个配置设置选项，你可以通过它设置默认 Python 版本或者一些其他设置。

### 创建一个新项目

当你选择‘创建一个新项目’以后，它会提供下面这一系列可能的项目类型供你选择：

*   Pure Python
*   Django
*   Flask
*   Google App Engine
*   Pyramid
*   Web2Py
*   Angular CLI
*   AngularJS
*   Foundation
*   HTML5 Bolierplate
*   React Starter Kit
*   Twitter Bootstrap
*   Web Starter Kit

这不是一个编程教程，所以我没必要说明这些项目类型是什么。如果你想创建一个可以运行在 Windows、Linux 和 Mac 上的简单桌面运行程序，那么你可以选择 Pure Python 项目，然后使用 Qt 库来开发图形应用程序，这样的图形应用程序无论在何种操作系统上运行，看起来都像是原生的，就像是在该系统上开发的一样。

选择了项目类型以后，你需要输入一个项目名字并且选择一个 Python 版本来进行开发。

### 打开一个项目

你可以通过单击‘最近打开的项目’列表中的项目名称来打开一个项目，或者，你也可以单击‘打开’，然后浏览到你想打开的项目所在的文件夹，找到该项目，然后选择‘确定’。

### 从源码控制进行查看

PyCharm 提供了从各种在线资源查看项目源码的选项，在线资源包括 [GitHub][5]、[CVS][6]、Git、[Mercurial][7] 以及 [Subversion][8]。

### PyCharm IDE（集成开发环境）

PyCharm IDE 中可以打开顶部的菜单，在这个菜单下方你可以看到每个打开的项目的标签。

屏幕右方是调试选项区，可以单步运行代码。

左侧面板有项目文件和外部库的列表。

如果想在项目中新建一个文件，你可以鼠标右击项目的名字，然后选择‘新建’。然后你可以在下面这些文件类型中选择一种添加到项目中：

*   文件
*   目录
*   Python 包
*   Python 包
*   Jupyter 笔记
*   HTML 文件
*   Stylesheet
*   JavaScript
*   TypeScript
*   CoffeeScript
*   Gherkin
*   数据源

当添加了一个文件，比如 Python 文件以后，你可以在右边面板的编辑器中进行编辑。

文本是全彩色编码的，并且有黑体文本。垂直线显示缩进，从而能够确保缩进正确。

编辑器具有智能补全功能，这意味着当你输入库名字或可识别命令的时候，你可以按 'Tab' 键补全命令。

### 调试程序

你可以利用屏幕右上角的’调试选项’调试程序的任何一个地方。

如果你是在开发一个图形应用程序，你可以点击‘绿色按钮’来运行程序，你也可以通过 'shift+F10'　快捷键来运行程序。

为了调试应用程序，你可以点击紧挨着‘绿色按钮’的‘绿色箭头’或者按 ‘shift+F9’ 快捷键。你可以点击一行代码的灰色边缘，从而设置断点，这样当程序运行到这行代码的时候就会停下来。

你可以按 'F8' 单步向前运行代码，这意味着你只是运行代码但无法进入函数内部，如果要进入函数内部，你可以按 'F7'。如果你想从一个函数中返回到调用函数，你可以按 'shift+F8'。

调试过程中，你会在屏幕底部看到许多窗口，比如进程和线程列表，以及你正在监视的变量。

当你运行到一行代码的时候，你可以对这行代码中出现的变量进行监视，这样当变量值改变的时候你能够看到。

另一个不错的选择是使用覆盖检查器运行代码。在过去这些年里，编程界发生了很大的变化，现在，对于开发人员来说，进行测试驱动开发是很常见的，这样他们可以检查对程序所做的每一个改变，确保不会破坏系统的另一部分。

覆盖检查器能够很好的帮助你运行程序，执行一些测试，运行结束以后，它会以百分比的形式告诉你测试运行所覆盖的代码有多少。

还有一个工具可以显示‘类函数’或‘类’的名字，以及一个项目被调用的次数和在一个特定代码片段运行所花费的时间。

### 代码重构

PyCharm 一个很强大的特性是代码重构选项。

当你开始写代码的时候，会在右边缘出现一个小标记。如果你写的代码可能出错或者写的不太好， PyCharm 会标记上一个彩色标记。

点击彩色标记将会告诉你出现的问题并提供一个解决方法。

比如，你通过一个导入语句导入了一个库，但没有使用该库中的任何东西，那么不仅这行代码会变成灰色，彩色标记还会告诉你‘该库未使用’。

对于正确的代码，也可能会出现错误提示，比如在导入语句和函数起始之间只有一个空行。当你创建了一个名称非小写的函数时它也会提示你。

你不必遵循 PyCharm 的所有规则。这些规则大部分只是好的编码准则，与你的代码是否能够正确运行无关。

代码菜单还有其它的重构选项。比如，你可以进行代码清理以及检查文件或项目问题。

### 总结

PyCharm 是 Linux 系统上开发 Python 代码的一个优秀编辑器，并且有两个可用版本。社区版可供临时开发者使用，专业版则提供了开发者开发专业软件可能需要的所有工具。

--------------------------------------------------------------------------------

via: https://www.lifewire.com/pycharm-the-best-linux-python-ide-4091045

作者：[Gary Newell][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.lifewire.com/gary-newell-2180098
[1]:https://www.jetbrains.com/
[2]:https://www.jetbrains.com/resharper/
[3]:https://www.jetbrains.com/pycharm/specials/pycharm/pycharm.html?&gclid=CjwKEAjw34i_BRDH9fbylbDJw1gSJAAvIFqU238G56Bd2sKU9EljVHs1bKKJ8f3nV--Q9knXaifD8xoCRyjw_wcB&gclsrc=aw.ds.ds&dclid=CNOy3qGQoc8CFUJ62wodEywCDg
[4]:https://www.lifewire.com/how-to-install-the-pycharm-python-ide-in-linux-4091033
[5]:https://github.com/
[6]:http://www.linuxhowtos.org/System/cvs_tutorial.htm
[7]:https://www.mercurial-scm.org/
[8]:https://subversion.apache.org/
