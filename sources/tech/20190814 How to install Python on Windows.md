[#]: collector: (lujun9972)
[#]: translator: (011011100010110101101111)
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

On the other hand, Python is also a serious programming language, and learning it takes dedication and practice. Then again, you don't have to commit to anything just yet. You can install and try Python on nearly any computing platform, so if you're on Windows, this article is for you.

If you want to try Python on a completely open source operating system, you can [install Linux][7] and then [try Python][8].

你是否想学习编程呢？可以从 [Python][2] 开始，它因为简洁的语法和面向对象的特性而非常受欢迎，是最常见的编程语言之一。而且 Python 是一门解释型语言，这意味着你无需知道如何把 Python 代码编译为机器语言 ———— Python 会帮你做到这一点，从而使你能够在编写代码的同时立即进行测试。

但是你也不能仅仅因为 Python 学习起来简单而低谷了它强大的潜能，无论是在 [电影][4]、 [工作室][5]、视频游戏工作室，还是在金融机构、IT机构、制造业，都有 Python 的身影，甚至很多业余爱好者、[艺术家][6]、教师和许多其他人都使用Python。



### Get Python

Python is available from its website, [Python.org][9]. Once there, hover your mouse over the **Downloads** menu, then over the **Windows** option, and then click the button to download the latest release.

![Downloading Python on Windows][10]

Alternatively, you can click the **Downloads** menu button and select a specific version from the downloads page.

### Install Python

Once the package is downloaded, open it to start the installer.

It is safe to accept the default install location, and it's vital to add Python to PATH. If you don't add Python to your PATH, then Python applications won't know where to find Python (which they require in order to run). This is _not_ selected by default, so activate it at the bottom of the install window before continuing!

![Select "Add Python 3 to PATH"][11]

Before Windows allows you to install an application from a publisher other than Microsoft, you must give your approval. Click the **Yes** button when prompted by the **User Account Control** system.

![Windows UAC][12]

Wait patiently for Windows to distribute the files from the Python package into the appropriate locations, and when it's finished, you're done installing Python.

Time to play.

### Install an IDE

To write programs in Python, all you really need is a text editor, but it's convenient to have an integrated development environment (IDE). An IDE integrates a text editor with some friendly and helpful Python features. IDLE 3 and NINJA-IDE are two options to consider.

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
译者：[译者ID](https://github.com/译者ID)
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
