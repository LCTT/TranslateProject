3个开源的Python Shell
=========================================================================
Python是一个高级,通用,结构化且强大的开源编程语言，用于广泛的编程工作。它拥有一个完全的动态类型系统和自动内存管理，与Scheme，Ruby，Perl和Tcl的十分相似，避免编译型语言的许多复杂地方和难以理解。Python于1991年由Guido van Rossum创造，然后逐渐成长，流行。

Python是一个非常实用，而且流行的计算机编程语言。使用一个如Python这样的解释型语言的好处之一就是，可以借助其交互的shell考察式地编程。你可以试用代码，而不必写一个脚本。但是Python shell也有一些局限性。基本来说，有许多很nice的Python shell可选择，都是在基础shell上扩展的。他们每一个都提供了一个极好的交互性的Python 体验。

--------------

### bpython ###

![](http://www.linuxlinks.com/portal/content/reviews/Programming/Screenshot-bpython.png)

对于Linux，BSD，OS X和Windows来说，bpython是Python解释器一个受欢迎的接口。

想法是提供给用户所有的内置功能，很像现在的IDEs（集成开发环境），但是是在一个简单，轻量级的包里，可以在终端窗口里面运行。

bpython并不追求创造任何新的或者开创性的东西。相反，她聚集了一些简洁的理念，关注于实用性和操作性。

功能包括：
	
- 内置的语法高亮 - 使用Pygments排版你敲出的代码，并合理地上色
- 根据你的行为，显示自动补全的建议。
- 为任何Python函数列出期望的参数 - 力求显示一列参数，为你调用的任何函数
- “Rewind”功能，弹出内存里的最后一行代码并重新评定
- 发送你已经解除占用的代码到粘贴缓存
- 保存你已经输入到一个文件里的代码
- 自动缩进
- 支持Python 3

- 网址: [www.bpython-interpreter.org][1]
- 开发者: Bob Farrell and contributors
- 证书: MIT License
- 版本号: 0.14.1

----------

### IPython ###

![](http://www.linuxlinks.com/portal/content/reviews/Programming/Screenshot-ipython.png)

IPython是Python shell的一个交互加强版。她提供了一个丰富的工具集合，帮助你交互式地充分利用Python。

IPython可以用来取代标准的Python shell，或者当与标准Python 科学和数值处理工具配合，用做一个科学计算（如Matlab或者Mathematical）的完整工作环境。她支持动态对象内省，有限的输入/输出提示，一个宏观系统，会话登录，会话恢复，完整的系统接入，详尽且彩色的追踪报告，自动圆括号，自动应用和可嵌入其他Python程序。

功能包括：

- 强大的交互Shell（终端或者基于Qt）
- 一个基于浏览器的记事本，支持代码，多样文本，数学表达式，内置飞行图表和其他丰富媒介。
- 支持交互式的数据虚拟化和GUI工具箱使用
- 灵活，嵌入式的解释器可以加载进你自己的项目里
- 易于使用，高效的并行运算工具

- 网址: [ipython.org][2]
- 开发者: The IPython Development Team
- 证书: BSD
- 版本号: 3.1

----------

### DreamPie ###

![](http://www.linuxlinks.com/portal/content/reviews/Programming/Screenshot-DreamPie.png)

DreamPie是一个为可靠性和兴趣设计的Python shell。

DreamPie可以用于任何Python解释器（Jython，IronPython，PyPy）。

功能包括：

- 一个交互shell的新概念：窗口被分成历史区域和代码区域，历史区域可以让你看到之前的命令及其输出，代码区域是里敲代码的地方。这样，你可以编辑任意数量的代码，就好像在你最喜欢的编辑器里一样，并且适当时候可以执行它。你也可以从其他地方复制你想保存的代码，所以你可以把它存入一个文件。代码可以很好地格式化为四级缩进。
- 自动补全属性和文件名字
- 自动显示函数参数和文档
- 在结果历史中保存你最近的结果，备以后用
- 可以自动展开很长的输出，所以你可以专注于重要的地方
- 保存会话的历史记录为一个HTML文件，备以后查询。你可以加载历史文件到DreamPie里，并且快速回退到之前的命令。
- 自动添加圆括号与可选的引用，当你在函数与方法后按下空格键。例如，键入execfile fn并且获得execfile（"fn"）
- 支持交互的matplotlib绘图
- 支持Python 2.5，Python 2.6，Python 3.1，Jython 2.5，IronPython 2.6和PyPy
- 难以置信的快速反应

- 网址: [www.dreampie.org][3]
- 开发者: Noam Yorav-Raphael
- 证书: GNU GPL v3
- 版本号: 1.2.1

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20150523032756576/PythonShells.html

作者：Frazer Kline
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.bpython-interpreter.org/
[2]:http://ipython.org/
[3]:http://www.dreampie.org/

--------------------------------------------------------------------------------
