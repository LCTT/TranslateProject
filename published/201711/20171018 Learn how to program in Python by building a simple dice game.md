通过构建一个简单的掷骰子游戏去学习怎么用 Python 编程
============================================================

> 不论是经验丰富的老程序员，还是没有经验的新手，Python 都是一个非常好的编程语言。

![Learn how to program in Python by building a simple dice game](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A "Learn how to program in Python by building a simple dice game")

Image by : opensource.com

[Python][9] 是一个非常流行的编程语言，它可以用于创建桌面应用程序、3D 图形、视频游戏、甚至是网站。它是非常好的首选编程语言，因为它易于学习，不像一些复杂的语言，比如，C、 C++、 或 Java。 即使如此， Python 依然也是强大且健壮的，足以创建高级的应用程序，并且几乎适用于所有使用电脑的行业。不论是经验丰富的老程序员，还是没有经验的新手，Python 都是一个非常好的编程语言。

### 安装 Python

在学习 Python 之前，你需要先去安装它：

**Linux： **如果你使用的是 Linux 系统， Python 是已经包含在里面了。但是，你如果确定要使用 Python 3 。应该去检查一下你安装的 Python 版本，打开一个终端窗口并输入：

```
python3 -V
```

如果提示该命令没有找到，你需要从你的包管理器中去安装 Python 3。

**MacOS：** 如果你使用的是一台 Mac，可以看上面 Linux 的介绍来确认是否安装了 Python 3。MacOS 没有内置的包管理器，因此，如果发现没有安装 Python 3，可以从 [python.org/downloads/mac-osx][10] 安装它。即使 macOS 已经安装了 Python 2，你还是应该学习 Python 3。

**Windows：** 微软 Windows 当前是没有安装 Python 的。从 [python.org/downloads/windows][11] 安装它。在安装向导中一定要选择 **Add Python to PATH** 来将 Python 执行程序放到搜索路径。

### 在 IDE 中运行

在 Python 中写程序，你需要准备一个文本编辑器，使用一个集成开发环境（IDE）是非常实用的。IDE 在一个文本编辑器中集成了一些方便而有用的 Python 功能。IDLE 3 和 NINJA-IDE 是你可以考虑的两种选择：

#### IDLE 3

Python 自带的一个基本的 IDE 叫做 IDLE。

![IDLE](https://opensource.com/sites/default/files/u128651/idle3.png "IDLE")

它有关键字高亮功能，可以帮助你检测拼写错误，并且有一个“运行”按钮可以很容易地快速测试代码。

要使用它：

*   在 Linux 或 macOS 上，启动一个终端窗口并输入 `idle3`。
*   在 Windows，从开始菜单中启动 Python 3。
    *   如果你在开始菜单中没有看到 Python，在开始菜单中通过输入 `cmd` 启动 Windows 命令提示符，然后输入 `C:\Windows\py.exe`。
    *  如果它没有运行，试着重新安装 Python。并且确认在安装向导中选择了 “Add Python to PATH”。参考 [docs.python.org/3/using/windows.html][1] 中的详细介绍。
    *  如果仍然不能运行，那就使用 Linux 吧！它是免费的，只要将你的 Python 文件保存到一个 U 盘中，你甚至不需要安装它就可以使用。

#### Ninja-IDE

[Ninja-IDE][12] 是一个优秀的 Python IDE。它有关键字高亮功能可以帮助你检测拼写错误、引号和括号补全以避免语法错误，行号（在调试时很有帮助）、缩进标记，以及运行按钮可以很容易地进行快速代码测试。

![Ninja-IDE](https://opensource.com/sites/default/files/u128651/ninja.png "Ninja-IDE")

要使用它：

1.  安装 Ninja-IDE。如果你使用的是 Linux，使用包管理器安装是非常简单的；否则， 从 NINJA-IDE 的网站上 [下载][7] 合适的安装版本。
2.  启动 Ninja-IDE。
3.  转到 Edit 菜单，并选择 Preferences 设置。
4.  在 Preferences 窗口中，点击 Execution 选项卡。
5.  在 Execution 选项卡上，更改 `python` 为 `python3`。

![Python3 in Ninja-IDE](https://opensource.com/sites/default/files/u128651/pref.png "Python3 in Ninja-IDE")

*Ninja-IDE 中的 Python3*

### 告诉 Python 想做什么

关键字可以告诉 Python 你想要做什么。不论是在 IDLE 还是在 Ninja 中，转到 File 菜单并创建一个新文件。对于 Ninja 用户：不要创建一个新项目，仅创建一个新文件。

在你的新的空文件中，在 IDLE 或 Ninja 中输入以下内容：

```
    print("Hello world.")
```

*   如果你使用的是 IDLE，转到 Run 菜单并选择 Run module 选项。
*   如果你使用的是 Ninja，在左侧按钮条中点击 Run File 按钮。

![Run file in Ninja](https://opensource.com/sites/default/files/u128651/ninja_run.png "Run file in Ninja")

*在 Ninja 中运行文件*

关键字 `print` 告诉 Python 去打印输出在圆括号中引用的文本内容。

虽然，这并不是特别刺激。在其内部， Python 只能访问基本的关键字，像 `print`、 `help`，最基本的数学函数，等等。

可以使用 `import` 关键字加载更多的关键字。在 IDLE 或 Ninja 中开始一个新文件，命名为 `pen.py`。

**警告：**不要命名你的文件名为 `turtle.py`，因为名为 `turtle.py` 的文件是包含在你正在控制的 turtle （海龟）程序中的。命名你的文件名为 `turtle.py` ，将会把 Python 搞糊涂，因为它会认为你将导入你自己的文件。

在你的文件中输入下列的代码，然后运行它：

```
    import turtle
```

Turtle 是一个非常有趣的模块，试着这样做：

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

看一看你现在用 turtle 模块画出了一个什么形状。

要擦除你的海龟画图区，使用 `turtle.clear()` 关键字。想想看，使用 `turtle.color("blue")` 关键字会出现什么情况？

尝试更复杂的代码：

```
    import turtle as t
    import time

    t.color("blue")
    t.begin_fill()

    counter=0

    while counter < 4:
        t.forward(100)
        t.left(90)
        counter = counter+1

    t.end_fill()
    time.sleep(5)
```

运行完你的脚本后，是时候探索更有趣的模块了。

### 通过创建一个游戏来学习 Python

想学习更多的 Python 关键字，和用图形编程的高级特性，让我们来关注于一个游戏逻辑。在这个教程中，我们还将学习一些关于计算机程序是如何构建基于文本的游戏的相关知识，在游戏里面计算机和玩家掷一个虚拟骰子，其中掷的最高的是赢家。

#### 规划你的游戏

在写代码之前，最重要的事情是考虑怎么去写。在他们写代码 _之前_，许多程序员是先 [写简单的文档][13]，这样，他们就有一个编程的目标。如果你想给这个程序写个文档的话，这个游戏看起来应该是这样的：

1.  启动掷骰子游戏并按下 Return 或 Enter 去掷骰子
2.  结果打印在你的屏幕上
3.  提示你再次掷骰子或者退出

这是一个简单的游戏，但是，文档会告诉你需要做的事很多。例如，它告诉你写这个游戏需要下列的组件：

*   玩家：你需要一个人去玩这个游戏。
*   AI：计算机也必须去掷，否则，就没有什么输或赢了
*   随机数：一个常见的六面骰子表示从 1-6 之间的一个随机数
*   运算：一个简单的数学运算去比较一个数字与另一个数字的大小
*   一个赢或者输的信息
*   一个再次玩或退出的提示

#### 制作掷骰子游戏的 alpha 版

很少有程序，一开始就包含其所有的功能，因此，它们的初始版本仅实现最基本的功能。首先是几个定义：

**变量**是一个经常要改变的值，它在 Python 中使用的非常多。每当你需要你的程序去“记住”一些事情的时候，你就要使用一个变量。事实上，运行于代码中的信息都保存在变量中。例如，在数学方程式 `x + 5 = 20` 中，变量是 `x` ，因为字母  `x` 是一个变量占位符。

**整数**是一个数字， 它可以是正数也可以是负数。例如，`1` 和 `-1` 都是整数，因此，`14`、`21`，甚至 `10947` 都是。

在 Python 中变量创建和使用是非常容易的。这个掷骰子游戏的初始版使用了两个变量： `player` 和 `ai`。

在命名为 `dice_alpha.py` 的新文件中输入下列代码：

```
    import random

    player = random.randint(1,6)
    ai = random.randint(1,6)

    if player > ai :
        print("You win")  # notice indentation
    else:
        print("You lose")
```

启动你的游戏，确保它能工作。

这个游戏的基本版本已经工作的非常好了。它实现了游戏的基本目标，但是，它看起来不像是一个游戏。玩家不知道他们摇了什么，电脑也不知道摇了什么，并且，即使玩家还想玩但是游戏已经结束了。

这是软件的初始版本（通常称为 alpha 版）。现在你已经确信实现了游戏的主要部分（掷一个骰子），是时候该加入到程序中了。

#### 改善这个游戏

在你的游戏的第二个版本中（称为 beta 版），将做一些改进，让它看起来像一个游戏。

##### 1、 描述结果

不要只告诉玩家他们是赢是输，他们更感兴趣的是他们掷的结果。在你的代码中尝试做如下的改变：

```
    player = random.randint(1,6)
    print("You rolled " + player)

    ai = random.randint(1,6)
    print("The computer rolled " + ai)
```

现在，如果你运行这个游戏，它将崩溃，因为 Python 认为你在尝试做数学运算。它认为你试图在 `player` 变量上加字母 `You rolled` ，而保存在其中的是数字。

你必须告诉 Python 处理在 `player` 和 `ai` 变量中的数字，就像它们是一个句子中的单词（一个字符串）而不是一个数学方程式中的一个数字（一个整数）。

在你的代码中做如下的改变：

```
    player = random.randint(1,6)
    print("You rolled " + str(player) )

    ai = random.randint(1,6)
    print("The computer rolled " + str(ai) )
```

现在运行你的游戏将看到该结果。

##### 2、 让它慢下来

计算机运行的非常快。人有时可以很快，但是在游戏中，产生悬念往往更好。你可以使用 Python 的 `time` 函数，在这个紧张时刻让你的游戏慢下来。

```
    import random
    import time

    player = random.randint(1,6)
    print("You rolled " + str(player) )

    ai = random.randint(1,6)
    print("The computer rolls...." )
    time.sleep(2)
    print("The computer has rolled a " + str(player) )

    if player > ai :
        print("You win")  # notice indentation
    else:
        print("You lose")
```

启动你的游戏去测试变化。

##### 3、 检测关系

如果你多玩几次你的游戏，你就会发现，即使你的游戏看起来运行很正确，它实际上是有一个 bug 在里面：当玩家和电脑摇出相同的数字的时候，它就不知道该怎么办了。

去检查一个值是否与另一个值相等，Python 使用 `==`。那是个“双”等号标记，不是一个。如果你仅使用一个，Python 认为你尝试去创建一个新变量，但是，实际上你是去尝试做数学运算。

当你想有比两个选项（即，赢或输）更多的选择时，你可以使用 Python 的 `elif` 关键字，它的意思是“否则，如果”。这允许你的代码去检查，是否在“许多”结果中有一个是 `true`， 而不是只检查“一个”是 `true`。

像这样修改你的代码：

```
    if player > ai :
        print("You win")  # notice indentation
    elif player == ai:
        print("Tie game.")
    else:
        print("You lose")
```

多运行你的游戏几次，去看一下你能否和电脑摇出一个平局。

#### 编写最终版

你的掷骰子游戏的 beta 版的功能和感觉比起 alpha 版更像游戏了，对于最终版，让我们来创建你的第一个 Python **函数**。

函数是可以作为一个独立的单元来调用的一组代码的集合。函数是非常重要的，因为，大多数应用程序里面都有许多代码，但不是所有的代码都只运行一次。函数可以启用应用程序并控制什么时候可以发生什么事情。

将你的代码变成这样：

```
    import random
    import time

    def dice():
        player = random.randint(1,6)
        print("You rolled " + str(player) )

        ai = random.randint(1,6)
        print("The computer rolls...." )
        time.sleep(2)
        print("The computer has rolled a " + str(player) )

        if player > ai :
            print("You win")  # notice indentation
        else:
            print("You lose")

        print("Quit? Y/N")
        cont = input()

        if cont == "Y" or cont == "y":
            exit()
        elif cont == "N" or cont == "n":
            pass
        else:
            print("I did not understand that. Playing again.")
```

游戏的这个版本，在他们玩游戏之后会询问玩家是否退出。如果他们用一个 `Y` 或 `y` 去响应， Python 就会调用它的 `exit` 函数去退出游戏。

更重要的是，你将创建一个称为 `dice` 的你自己的函数。这个 `dice` 函数并不会立即运行，事实上，如果在这个阶段你尝试去运行你的游戏，它不会崩溃，但它也不会正式运行。要让 `dice` 函数真正运行起来做一些事情，你必须在你的代码中去**调用它**。

在你的现有代码下面增加这个循环，前两行就是上文中的前两行，不需要再次输入，并且要注意哪些需要缩进哪些不需要。**要注意缩进格式**。

```
        else:
            print("I did not understand that. Playing again.")

    # main loop
    while True:
        print("Press return to roll your die.")
        roll = input()
        dice()
```

`while True` 代码块首先运行。因为 `True` 被定义为总是真，这个代码块将一直运行，直到 Python 告诉它退出为止。

`while True` 代码块是一个循环。它首先提示用户去启动这个游戏，然后它调用你的 `dice` 函数。这就是游戏的开始。当 `dice` 函数运行结束，根据玩家的回答，你的循环再次运行或退出它。

使用循环来运行程序是编写应用程序最常用的方法。循环确保应用程序保持长时间的可用，以便计算机用户使用应用程序中的函数。

### 下一步

现在，你已经知道了 Python 编程的基础知识。这个系列的下一篇文章将描述怎么使用 [PyGame][14] 去编写一个视频游戏，一个比 turtle 模块有更多功能的模块，但它也更复杂一些。

--------------------------------------------------------------------------------

作者简介：

Seth Kenlon - 一个独立的多媒体大师，自由文化的倡导者，和 UNIX 极客。他同时从事电影和计算机行业。他是基于 slackwarers 的多媒体制作项目的维护者之一， http://slackermedia.info

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/python-101

作者：[Seth Kenlon][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/seth
[1]:https://docs.python.org/3/using/windows.html
[2]:https://opensource.com/file/374606
[3]:https://opensource.com/file/374611
[4]:https://opensource.com/file/374621
[5]:https://opensource.com/file/374616
[6]:https://opensource.com/article/17/10/python-101?rate=XlcW6PAHGbAEBboJ3z6P_4Sx-hyMDMlga9NfoauUA0w
[7]:http://ninja-ide.org/downloads/
[8]:https://opensource.com/user/15261/feed
[9]:https://www.python.org/
[10]:https://www.python.org/downloads/mac-osx/
[11]:https://www.python.org/downloads/windows
[12]:http://ninja-ide.org/
[13]:https://opensource.com/article/17/8/doc-driven-development
[14]:https://www.pygame.org/news
[15]:https://opensource.com/users/seth
[16]:https://opensource.com/users/seth
[17]:https://opensource.com/article/17/10/python-101#comments
