[#]: subject: "5 ways to learn C programming on Linux"
[#]: via: "https://opensource.com/article/22/7/learn-c-linux"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lkxed"
[#]: translator: "Donkey"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Linux 上学习 C 语言的五种方式
======
请下载我们的电子书获得在 Linux 和 FreeDOS 上 C 语言编程的提示和技巧

![Person using a laptop][1]

有许多关于为什么 C 语言能够经久不衰的说法。或许是因为它语法简单明了。又或许是因为它常被认为是实用的语言，因为它不基于其他高级语言，得已在任何平台上编译运行。C 已然成为强大的语言，并且我认为它经久不衰与它作为其他技术的基础的方式相关。这里有 5 项我喜爱的基于 C 语言的技术，希望它们能够帮助你更多的了解 C 语言。

### 1. GObject 和 GTK

C 语言不是面向对象编程的语言。它没有 `class` 关键字。 一些人用 C++ 进行面向对象编程，但是还有一些人坚持用 C 和 GObject 库。GObject 库为 C 语言提供了一个 `class` 结构体，GTK 项目以提供可通过 C 访问的工具包而闻名。没有 GTK ，就没有 GIMP （为此开发了 GTK），GNOME ，以及其他成千上百流行的开源应用。

#### 了解更多

GObject 和 GTK 是使用 C 开始进行 GUI 编程的绝佳方式。它们“装备精良”，可以让你用 C 语言进行图形应用编程，因为开发者为你做了许多“繁重工作”。他们定义了类和数据类型，创建了工具包，你所要做的就是将所有东西放在一起。

### 2. Ncurses

如果 GTK 超过了你的需求，你或许认为一个终端用户界面（TUI，terminal user interface）更适合你。Ncurses 在终端库创建“小部件”，创建一种在终端窗口上绘制图形的应用程序。你可以使用方向键控制界面，就像不用鼠标来使用 GUI 应用一样来选择按钮和元素。

#### 了解更多

利用 Ncurses 库使用 C 语言写一个 [猜数字][3] 游戏。

### 3. Lua 和 Moonscript

Lua 是使用内置 C 语言 API 访问 C 语言库的一款脚本语言。它十分精巧、快捷以及简单，拥有约 30 个函数和少量内置库。你可以使用 Lua 进行系统自动化、游戏修改和脚本编写、使用 LÖVE 之类的前端进行游戏开发，或者使用 GTK 进行一般应用程序开发（例如 [Howl 文本编辑器][4]）。

#### 了解更多

Lua 十分好的一点是你可以从它开始掌握基本编程理念，然后当你有足够勇气直面基础编程语言时，开始探索它的 C 语言 API 。另一方面，如果你只会 Lua ，那也没事儿。Lua 有很多的 [外部库][5] ，使其成为各种开发方式的绝佳选择。

### 4. Cython

Lua 不是唯一以 C 为接口的编程语言。[Cython][6] 是一种编译器和编程语言，旨在使为 Python 编写 C 扩展就像编写 Python 代码一样容易。本质上，你可以编写 Python 并最终使用 C。最简单的示例：

```
print("hello world")
```

创建一个 `setup.py` 脚本:

```
from setuptools import setup
from Cython.Build import cythonize

setup(
    ext_modules = cythonize("hello.pyx")
)
```

运行该 setup 脚本:

```
$ python3 ./setup.py
```

最后你会在同一个目录中得到一个 `hello.c` 和 `hello.cpython-39-x86_64-linux-gnu.so` 文件。

#### 了解更多

[Cython][7] 是支持 C 语言函数和数据类型的 Python 的超集。它不可能帮你学习 C，但它为希望学习 C 代码并将其集成到 Python 中的 Python 开发人员开辟了新的可能性。

### 5. FreeDOS

了解更多 C 语言的最好方式是编写 C 代码，并且没有什么比写你可以真正使用的代码更激动的了。FreeDOS 项目是 DOS 的开源实现，Windows 的祖先。或许你已经会用 FreeDOS 了，或者作为运行 BIOS 更新程序的便捷开源方法，或者在模拟器中玩经典电脑游戏。你可以用 FreeDOS 做更多事情。它是学习 C 语言的理想平台，其中包含一系列工具，鼓励你编写自己的命令和简单（或不那么简单，如果你愿意）应用程序。当然你可以在任何系统上写 C 代码，但是 FreeDOS 的便利在于你可以发现令你耳目一新的东西。天空有极限，但即使在地面上，你也可以用 C 做一些非常有趣的事情。

### 下载电子书

你可以从我们编写的 **[电子书][8]** 中学到更多 C 语言，并在我们的电子书中了解有关 FreeDOS 上 C 语言的更多信息。这些是编程文章的集合，可帮助你学习 C 并演示如何以有用的方式实现 C。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/learn-c-linux

作者：[Alan Smithee][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/laptop_screen_desk_work_chat_text.png
[2]: https://opensource.com/downloads/guide-c-programming
[3]: https://opensource.com/article/21/8/guess-number-game-ncurses-linux
[4]: https://opensource.com/article/20/12/howl
[5]: https://opensource.com/article/19/11/getting-started-luarocks
[6]: http://cython.org
[7]: https://opensource.com/article/21/4/cython
[8]: https://opensource.com/downloads/guide-c-programming
