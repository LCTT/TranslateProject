[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12654-1.html)
[#]: subject: (Teach Python with the Mu editor)
[#]: via: (https://opensource.com/article/20/9/teach-python-mu)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

使用 Mu 编辑器教授 Python
======

> Mu 让你轻松学会如何编写 Python 代码。

![](https://img.linux.net.cn/data/attachment/album/202009/26/115018dkf3lvfyekifliec.jpg)

在学校里，教孩子们编程是非常流行的。很多年前，在 Apple II 和 [Logo][2] 编程的年代，我学会了创建<ruby>乌龟<rt>turtle</rt></ruby>绘图。我很喜欢学习如何对虚拟乌龟进行编程，后来也帮助学生进行编程。

大约五年前，我了解了 [Python 的 turtle 模块][3]，这是我 Python 之旅的转折点。很快，我开始使用 `turtle` 模块来教学生 Python 编程基础，包括使用它来创建有趣的图形。

### 开始使用 Python 的 turtle 模块

在 Linux 或 macOS 电脑上，你只需打开一个终端，输入  `python`，你就会看到 Python shell。

如果你使用的是 Windows 电脑，则需要先安装 Python，到 Python 网站上[下载][4]最新的稳定版。

接下来，用 `import turtle ` 或 `import turtle as t` 将 `turtle` 模块导入 Python 中。然后你就可以开始享受创建乌龟绘图的乐趣了。

### 认识一下 Mu

在我的 Python 冒险的早期，我使用了 [IDLE][5]，它是 Python 的集成开发环境。它比在 Python shell 中输入命令要容易得多，而且我可以编写和保存程序供以后使用。我参加了一些在线课程，阅读了许多关于 Python 编程的优秀书籍。我教老师和学生如何使用 IDLE 创建乌龟绘图。

IDLE 是一个很大的改进，但在克利夫兰的 PyConUS 2019 上，我看到了 [Nicholas Tollervey][6]的演讲，这改变了我学习和教授 Python 的方式。Nick 是一位教育家，他创建了 [Mu][7]，一个专门为年轻程序员（甚至像我这样的老程序员）设计的 Python 编辑器。Mu 可以安装在 Linux、macOS 和 Windows 上。它很容易使用，并且附带了优秀的[文档][8]和[教程][9]。

在 Linux 上，你可以通过命令行安装 Mu。

在 Ubuntu 或 Debian 上：

```
$ sudo apt install mu-editor
```

在 Fedora 或类似的地方：

```
$ sudo dnf install mu
```

或者，你可以使用 Python 来进行安装。首先，确保你已经安装了 Python 3：

```
$ python --version
```

如果失败了，就试试：

```
$ python3 --version
```

假设你有 Python 3 或更高版本，使用 Python 包管理器 `pip` 安装 Mu。

```
$ python -m pip install mu-editor --user
```

然后你可以从命令行运行 Mu，或者创建一个快捷方式：

```
$ python -m pip install shortcut mu-editor --user
```

[树莓派][10]上默认安装了 Mu，这是一个很大的优点。在过去的几年里，我已经向学生介绍了使用树莓派和 Mu 编辑器的 Python 编程。

### 如何用 Mu 教授 Python

Mu 是向学生展示 Python 入门的好方法。下面是我如何教学生开始使用它。

1. 打开 Mu 编辑器。

    ![Mu editor][11]
2. 输入 `import turtle` 导入 `turtle` 模块，就可以让乌龟动起来了。我的第一课是用 Python 代码画一个简单的正方形。

    ![Mu editor][13]
3. 保存这个程序，确保文件名以 .py 结尾。

    ![Saving program in Mu][14]
4. 运行程序。哪怕是运行这样一个简单的程序都会让人兴奋，看到你写的程序的图形输出是很有趣的。

    ![Running Python program in Mu][15]

### 超越基础知识

在上完这节简单的课后，我讲解了有一些方法可以简化和扩展学生所学的基础知识。一是创建一个更简单的 `turtle` 对象，`import turtle as t`。然后我介绍了一个 `for` 循环，用另外一种 `turtle` 方法画一个正方形。

![for loops in Python with Mu][16]

接下来，我将展示如何创建一个 `my_square` 函数，作为另一种绘制正方形的方法。

![my_square function][17]

后来，我通过介绍其他 `turtle` 模块方法，包括 `penup`、`pendown` 和 `pencolor` 来扩展这个概念。很快，我的学生们就开始开发更复杂的程序，并对其进行迭代。

![Mu editor][18]

我一直渴望学习，我很想知道你在学校或家里是如何教授 Python 的。请在评论中分享你的经验。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/teach-python-mu

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://en.wikipedia.org/wiki/Logo_(programming_language)
[3]: https://docs.python.org/3/library/turtle.html
[4]: https://www.python.org/downloads/windows/
[5]: https://docs.python.org/3/library/idle.html
[6]: https://ntoll.org/
[7]: https://codewith.mu/en/download
[8]: https://codewith.mu/en/howto/
[9]: https://codewith.mu/en/tutorials/
[10]: https://www.raspberrypi.org/blog/mu-python-ide/
[11]: https://opensource.com/sites/default/files/uploads/mu-1_open.png (Mu editor)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: https://opensource.com/sites/default/files/uploads/mu-2_square.png (Mu editor)
[14]: https://opensource.com/sites/default/files/uploads/mu-3_save.png (Saving program in Mu)
[15]: https://opensource.com/sites/default/files/uploads/mu-4_run.png (Running Python program in Mu)
[16]: https://opensource.com/sites/default/files/uploads/mu-5_for-loop.png (for loops in Python with Mu)
[17]: https://opensource.com/sites/default/files/uploads/mu-6_my_square.png (my_square function)
[18]: https://opensource.com/sites/default/files/uploads/mu-7_beyond-basics.png (Mu editor)
