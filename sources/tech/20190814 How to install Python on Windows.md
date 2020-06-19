[#]: collector: (lujun9972)
[#]: translator: (LiuWenlong)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to install Python on Windows)
[#]: via: (https://opensource.com/article/19/8/how-install-python-windows)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/greg-p)

如何在Windows上安装Python
======
> 安装Python,启动IDE，然后你就可以在Windows系统下进行编程了。
![Hands programming][1]

你是否想学习编程呢？可以从 [Python][2] 开始，它因为简洁的语法和面向对象的特性而非常受欢迎，是最常见的编程语言之一。而且 Python 是一门解释型语言，这意味着你无需知道如何把 Python 代码编译为机器语言 ———— Python 会帮你做到这一点，从而使你能够在编写代码的同时立即进行测试。

但是你也不能仅仅因为 Python 学习起来简单而低估了它强大的潜能，无论是在 [电影][4]、 [工作室][5]、视频游戏工作室，还是在金融机构、IT机构、制造业，都有 Python 的身影，甚至很多业余爱好者、[艺术家][6]、教师和许多其他人都使用Python。

另一方面，Python 也是一门严肃的编程语言，学习它需要付出和实践。还有，你什么都不需要马上做，就几乎可以在任何计算机平台上安装并尝试使用 Python ，因此，如果你使用的是 Windows 操作系统，那本文正适合你。

如果你使用的是开源的 Linux 操作系统，那你可以 [在 Linux 上安装][7] 并 [尝试使用Python][8]

### 如何获取 Python

你可以从 [Python 官方网站][9] 上去下载 Python。你Python官方网站下载页，可以将鼠标悬停在 **Downloads** 按钮上，待菜单展开后，再将鼠标悬停在 **Windows** 选项，最后点击按钮就可以下载最新版的Python了。
![Downloading Python on Windows][10]

或者你也可以直接点击 **Downloads** 按钮，然后在下载页中选择特定的版本去下载。

### 安装 Python

下载好安装包后，直接打开就可以启动安装程序了。

安装时，选择默认的安装路径比较好，最重要的是要将 Python 添加到 Path 中，否则 Python 应用程序不知道它该从哪里找到 Python 必须的运行时环境；默认认安装时并没有选中这一项，需要手动选中安装窗口的 **Add Python 3.7 to Path** ，然后点击继续。

![Select "Add Python 3 to PATH"][11]

由于 Windows 需要经过你的批准才会允许非 Microsoft 官方发行的应用程序，因此你必须要在弹出 **User Account Control** 系统提示窗口的时候 点击 **Yes** 来继续完成安装。

![Windows UAC][12]

这时候你就需要耐心等待，系统会自动将 Python 软件包分发到合适的位置，等待过后，也就意味着你已经成功的安装了 Python ，你就可以愉快的与 Python 玩耍了！ 

### Install an IDE

虽然说你仅需要一个文本编辑器，就可以开始编写 Python 代码了，但是我依然建议你使用 IDE （集成开发环境）来进行开发，这样开发起来就会变得方便很多。IDE 会将文本编辑器和一些好用的 Python 功能集成到一起，使用起来非常友好。你可以考虑选择 IDLE 3 或者 NINJA-IDE 来作为你的 IDE。

#### IDLE 3

Python comes with an IDE called IDLE. You can write code in any text editor, but using an IDE provides you with keyword highlighting to help detect typos, a **Run** button to test code quickly and easily, and other code-specific features that a plain text editor like [Notepad++][13] normally doesn't have.

To start IDLE, click the **Start** (or **Window**) menu and type **python** for matches. You may find a few matches, since Python provides more than one interface, so make sure you launch IDLE.

![IDLE 3 IDE][14]

If you don't see Python in the Start menu, launch the Windows command prompt by typing **cmd** in the Start menu, then type:


```
`C:\Windows\py.exe`
```

If that doesn't work, try reinstalling Python. Be sure to select **Add Python to PATH** in the install wizard. Refer to the [Python docs][15] for detailed instructions.

#### Ninja-IDE

If you already have some coding experience and IDLE seems too simple for you, try [Ninja-IDE][16]. Ninja-IDE is an excellent Python IDE. It has keyword highlighting to help detect typos, quotation and parenthesis completion to avoid syntax errors, line numbers (helpful when debugging), indentation markers, and a **Run** button to test code quickly and easily.

![Ninja-IDE][17]

To install it, visit the Ninja-IDE website and [download the Windows installer][18]. The process is the same as with Python: start the installer, allow Windows to install a non-Microsoft application, and wait for the installer to finish.

Once Ninja-IDE is installed, double-click the Ninja-IDE icon on your desktop or select it from the Start menu.

### Tell Python what to do

Keywords tell Python what you want it to do. In either IDLE or Ninja-IDE, go to the File menu and create a new file.

Ninja users: Do not create a new project, just a new file.

In your new, empty file, type this into IDLE or Ninja-IDE:


```
`print("Hello world.")`
```

  * If you are using IDLE, go to the Run menu and select the Run Module option.
  * If you are using Ninja, click the Run File button in the left button bar.



![Running code in Ninja-IDE][19]

Any time you run code, your IDE prompts you to save the file you're working on. Do that before continuing.

The keyword **print** tells Python to print out whatever text you give it in parentheses and quotes.

That's not very exciting, though. At its core, Python has access to only basic keywords like **print** and **help**, basic math functions, and so on.

Use the **import** keyword to load more keywords. Start a new file in IDLE or Ninja and name it **pen.py**.

**Warning**: Do not call your file **turtle.py**, because **turtle.py** is the name of the file that contains the turtle program you are controlling. Naming your file **turtle.py** confuses Python because it thinks you want to import your own file.

Type this code into your file and run it:


```
`import turtle`
```

[Turtle][20] is a fun module to use. Add this code to your file:


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

See what shapes you can draw with the turtle module.

To clear your turtle drawing area, use the **turtle.clear()** keyword. What do you think the keyword **turtle.color("blue")** does?

Try more complex code:


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

As a challenge, try changing your script to get this result:

![Example Python turtle output][21]

Once you complete that script, you're ready to move on to more exciting modules. A good place to start is this [introductory dice game][22].

### Stay Pythonic

Python is a fun language with modules for practically anything you can think to do with it. As you can see, it's easy to get started with Python, and as long as you're patient with yourself, you may find yourself understanding and writing Python code with the same fluidity as you write your native language. Work through some [Python articles][23] here on Opensource.com, try scripting some small tasks for yourself, and see where Python takes you. To really integrate Python with your daily workflow, you might even try Linux, which is natively scriptable in ways no other operating system is. You might find yourself, given enough time, using the applications you create!

Good luck, and stay Pythonic.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/how-install-python-windows

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[LiuWenlong](https://github.com/011011100010110101101111)
校对：[校对者ID](https://github.com/校对者ID)

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
