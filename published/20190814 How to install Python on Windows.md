[#]: collector: (lujun9972)
[#]: translator: (011011100010110101101111)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12335-1.html)
[#]: subject: (How to install Python on Windows)
[#]: via: (https://opensource.com/article/19/8/how-install-python-windows)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/greg-p)

如何在 Windows 上安装 Python
======

> 安装 Python，启动 IDE，然后你就可以在 Windows 系统下进行编程了。

![](https://img.linux.net.cn/data/attachment/album/202006/20/232632iggga8agp5gablg5.jpg)

你是否想学习编程呢？可以从 [Python][2] 开始，它因为简洁的语法和面向对象的特性而非常受欢迎，是最常见的编程语言之一。而且 Python 是一门解释型语言，这意味着你无需知道如何把 Python 代码编译为机器语言 —— Python 会帮你做到这一点，从而使你能够在编写代码的同时立即进行测试。

但是你也不能仅仅因为 Python 学习起来简单而低估了它强大的潜能，无论是在[电影][4][工作室][5]、视频游戏工作室，还是在金融机构、IT 机构、制造业，都有 Python 的身影，甚至很多业余爱好者、[艺术家][6]、教师和许多其他人都使用 Python。

另一方面，Python 也是一门严肃的编程语言，学习它需要付出和实践。还有，你什么都不需要马上做，就几乎可以在任何计算机平台上安装并尝试使用 Python ，因此，如果你使用的是 Windows 操作系统，那本文正适合你。

如果你使用的是开源的 Linux 操作系统，那你可以 [在 Linux 上安装][7] 并 [尝试使用 Python][8]。

### 如何获取 Python

你可以从 [Python 官方网站][9] 上去下载 Python。在 Python 官方网站下载页，可以将鼠标悬停在 “Downloads” 按钮上，待菜单展开后，再将鼠标悬停在 “Windows” 选项，最后点击按钮就可以下载最新版的 Python 了。

![Downloading Python on Windows][10]

或者你也可以直接点击 “Downloads” 按钮，然后在下载页中选择特定的版本去下载。

### 安装 Python

下载好安装包后，直接打开就可以启动安装程序了。

安装时，选择默认的安装路径比较好，最重要的是要将 Python 添加到搜索路径中，否则 Python 应用程序不知道它该从哪里找到 Python 必须的运行时环境；默认认安装时并没有选中这一项，需要手动勾选安装窗口的 “Add Python 3.7 to Path” ，然后点击继续。

![Select "Add Python 3 to PATH"][11]

由于 Windows 需要经过你的批准才会允许安装非微软官方发行的应用程序，因此你必须要在弹出 “User Account Control”（UAC） 系统提示窗口的时候 点击 “Yes” 来继续完成安装。

![Windows UAC][12]

这时候你就需要耐心等待，系统会自动将 Python 软件包分发到合适的位置，等待过后，也就意味着你已经成功的安装了 Python ，你就可以愉快的与 Python 玩耍了！ 

### 安装一个 IDE

虽然说你仅需要一个文本编辑器，就可以开始编写 Python 代码了，但是我依然建议你使用 IDE（集成开发环境）来进行开发，这样开发起来就会变得方便很多。IDE 会将文本编辑器和一些好用的 Python 功能集成到一起，使用起来非常友好。你可以考虑选择 IDLE 3 或者 NINJA-IDE 来作为你的 IDE。

#### IDLE 3

Python 自带一款 IDE，名字叫 IDLE。虽然你可以使用任何文本编辑器编写 Python 代码，但 IDE 通常会提供 [Notepad++][13] 之类的纯文本编辑器所没有的代码高亮、语法检测等功能，甚至在 IDE 里可以直接通过鼠标点击 “Run” 按钮就能快速运行 Python 代码。

想要启动 IDLE ，可以点击 Windows 的 “开始” （或者 “Windows”）按钮，然后输入 `python` 来进行搜索。这时候可能会搜索到多个选项，选择 IDLE 启动就好了。

![IDLE 3 IDE][14]

如果在 “开始” 菜单中没有搜到，你也可以在 “开始” 菜单输入 `cmd` (或同时按下键盘 `win + R` 键) 来启动 Windows 命令提示符，然后输入下面命令来启动 IDLE ：

```
C:\Windows\py.exe
```

如果还是无法启动的话，可是试着重新安装 Python ,安装时记得务必要在安装向导中选中 “Add Python to PATH”。详细说明，可以参考 [Python 官方文档][15] 。

#### Ninja-IDE

如果你已经有一些编程经验，而且你觉得 IDLE 对你来说有些简陋的话，你也可以试试 [Ninja-IDE][16]。 Ninja-IDE 是一款非常出色的 Python IDE，它具有代码高亮功能，并且它会自动帮你检测诸如拼写错误、引号或括号缺失以及其他语法错误。而且它还可以显示行号（调试的时候会非常有用）、缩进标记甚至可以直接通过点击 “Run” 按钮来运行你的代码。

![Ninja-IDE][17]

如果要安装 Ninja-IDE ，你可以访问 Ninja-IDE 的官网 [下载 Windows 安装程序][18] 。步骤跟安装 Python 大同小异：下载安装包、允许 Windows 安装非微软官方的应用程序，然后等待完成安装即可。

Ninja-IDE 安装完成后，双击 Windows 桌面或开始菜单下的 Ninja-IDE 就可以启动了。

### 告诉 Python 怎么做

关键字能让 Python 知道你想要做什么。在 IDLE 或者 Ninja-IDE ，打开 “文件” 菜单，创建一个新文件。

在 Ninja-IDE 中，不要创建一个新项目，而是单独创建一个新文件就可以了。

在你用 IDLE 或者 Ninja-IDE  新建的文件中，输入以下代码：

```
print("Hello world.")
```

* 如果你使用的是 IDLE ，请点击 “运行” 菜单，选择 “运行模块” 选项来运行你的程序。
* 如果你使用的是 Ninja ，请单击左侧按钮栏中的 “运行文件” 按钮。

![Running code in Ninja-IDE][19]

任何时间当你想要执行代码，IDE 都会提示你先保存当前正在处理的文件，然后再继续。

`print` 关键字会告诉 Python 打印出你在括号和引号中输入的所有文本。

但是别高兴地太早，Python 的核心库也就只能访问 `print` 和 `help` 之类的基本关键字、函数等。

如果想要使用更多的关键字和函数，你就需要使用 `import` 关键字去加载它们。好了，先在你的 IDLE 或者 Ninja 中新建一个文件，命名为 `pen.py` 。

**警告**：不要把你新建的文件命名为 `turtle.py` ，因为 `turtle.py` 是包含了你要控制的 turtle 程序的文件名称，使用 `turtle.py` 作为文件名会让 Python 感到困惑，因为它以为你想要引入你自己的文件。

在你新建的文件中输入一下代码，并运行：

```
import turtle
```

[Turtle][20] 是一个用起来非常有意思的模块. 把这段代码添加到你的文件内：

```
turtle.begin_fill()
turtle.forward(100)
turtle.left(90)
turtle.forward(100)
turtle.left(90)
turtle.forward(100)
turtle.left(90)
turtle.forward(100)
turtle.end_fill()
```

来看看你可以使用 turtle 模块来绘制出哪些图案。

想要清空 turtle 绘制的区域的话，你可以使用 `turtle.clear()` 函数。那你知道 `turtle.color("blue")` 是用来做什么的吗？

我们来试一下更复杂点的程序：

```
import turtle as t
import time

t.color("blue")
t.begin_fill()

counter = 0

while counter &lt; 4:
    t.forward(100)
    t.left(90)
    counter = counter+1

t.end_fill()
time.sleep(2)
```

给你个挑战，试试修改代码，让它得到下图所示的结果：

![Example Python turtle output][21]

当你完成这段代码后，你就可以继续学习更多有意思的模块了。这个 [入门级骰子游戏][22] 就是个不错的开始。

### 保持 Pythonic

Python 是一门非常有趣的语言，它的模块几乎能实现所有你想要实现的功能。正如你所看到的，Python 入门很容易，只要你对自己有耐心，很快就会发现自己在理解和编写 Python 时能像写汉字一样流畅。你可以多阅读关于 [Python 的文章][23]，试着自己编写一些小片段，然后看看 Python 会执行出什么结果。如果想要把 Python 真正融合到你实际工作中，你可以试试 Linux ，Linux 具有在本地可编写脚本的功能，而其他系统却没有。

祝你好运，记得保持 Pythonic。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/how-install-python-windows

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[LiuWenlong](https://github.com/011011100010110101101111)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S (Hands programming)
[2]: https://www.python.org/
[3]: https://opensource.com/article/19/7/get-modular-python-classes
[4]: https://github.com/edniemeyer/weta_python_db
[5]: https://www.python.org/about/success/ilm/
[6]: https://opensource.com/article/19/7/rgb-cube-python-scribus
[7]: https://opensource.com/article/19/7/ways-get-started-linux
[8]: https://opensource.com/article/17/10/python-101
[9]: https://www.python.org/downloads/
[10]: https://opensource.com/sites/default/files/uploads/win-python-install.jpg (Downloading Python on Windows)
[11]: https://opensource.com/sites/default/files/uploads/win-python-path.jpg (Select "Add Python 3 to PATH")
[12]: https://opensource.com/sites/default/files/uploads/win-python-publisher.jpg (Windows UAC)
[13]: https://notepad-plus-plus.org/
[14]: https://opensource.com/sites/default/files/uploads/idle3.png (IDLE 3 IDE)
[15]: http://docs.python.org/3/using/windows.html
[16]: http://ninja-ide.org/
[17]: https://opensource.com/sites/default/files/uploads/win-python-ninja.jpg (Ninja-IDE)
[18]: http://ninja-ide.org/downloads/
[19]: https://opensource.com/sites/default/files/uploads/ninja_run.png (Running code in Ninja-IDE)
[20]: https://opensource.com/life/15/8/python-turtle-graphics
[21]: https://opensource.com/sites/default/files/uploads/win-python-idle-turtle.jpg (Example Python turtle output)
[22]: https://opensource.com/article/17/10/python-101#python-101-dice-game
[23]: https://opensource.com/sitewide-search?search_api_views_fulltext=Python
