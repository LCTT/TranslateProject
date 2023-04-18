[#]: subject: (How to program in C on FreeDOS)
[#]: via: (https://opensource.com/article/21/6/program-c-freedos)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

在 FreeDOS 上，如何使用 C 语言编程
======
在 FreeDOS 上使用 C 语言编程与在 Linux 上使用 C 语言编程非常类似。
![Woman sitting in front of her computer][1]

当我第一次开始使用 DOS 时，我喜欢 DOS 自带的 BASIC 来编写游戏和其它一些有趣的程序。很长时间后，我才学习 C 编程语言。

我马上爱上了使用 C 语言工作!它是一种简单易懂的编程语言，在编写有用的程序时，这给予我很大的灵活性。实际上，很多 FreeDOS 的核心实用程序都是使用 C 语言和汇编语言编程的。

因此，FreeDOS 的 1.3 RC4 包含一个 C 语言以及其它编程语言的编译器可能并不出人意料。FreeDOS 的 1.3 RC4 LiveCD 包含两个 C 编译器—Bruce's C compiler (一个简单的 C 编译器) 和 OpenWatcom C compiler 。在 Bonus CD 上，你也可以找到 DJGPP (一款基于 GNU 的 GCC 的 32 位的 C 编译器) 和 GCC 的 IA-16 移植 (需要 '386 或更好的 CPU 来编译，但是，生成的程序可以在低端系统上运行)。

在 FreeDOS 上使用 C 语言编程与在 Linux 上使用 C 语言编程非常类似，但是有两个例外:

  1. **你需要知道你使用了多少存储器。** Linux 允许程序使用很多存储器，但是 FreeDOS 有很多限制。DOS 程序只使用四种 [存储器模式][2] (大、中、紧凑和小) 中的其中一种，具体取决于它们需要多少存储器。
  2. **你可以直接访问控制台终端。** 在 Linux 上，你可以创建 _text-mode_ 模式程序，使用一个诸如 _ncurses_ 之类的库来绘制终端屏幕。但是，DOS 允许程序访问控制台终端和视频硬件。这为编写更有趣的程序提供了极大的灵活性。



我喜欢在 GCC 的 IA-16 移植或 OpenWatcom 中编写我的 C 程序，具体取决于我正在工作的哪种程序。OpenWatcom C 编译器更容易安装，因为它只是一个单个软件包。这就是为什么我们在 FreeDOS 的 LiveCD 中提供 OpenWatcom 的原因, 在你安装 FreeDOS 的 1.3 RC4 时，如果你选择执行 <ruby>完全的安装(包括安装应用程序和游戏)<rt>"Full installation including applications and games"</rt></ruby>，那么你也自动地安装 OpenWatcom 。如果你选择安装 <ruby>纯 DOS 系统<rt> "Plain DOS system"</rt></ruby>，那么，你将需要使用 FDIMPLES 软件包管理器来安装 OpenWatcom C 编译器。

![安装 OpenWatcom][3]

在 FreeDOS 1.3 RC4 上安装 OpenWatcom
(Jim Hall, [CC-BY SA 4.0][4])

### 在 DOS 上使用 C 语言编程

你可以在 [OpenWatcom 工程网站][5] 找到文档和库指南，用以学习 OpenWatcom C 编译器所提供的独特的关于 DOS 的 C 语言编程库。简单描述几个最有用的函数:

来自 `conio.h` 头文件:

  * `int getch(void)—` 从键盘上获取一次按下的按键
  * `int getche(void)—`从键盘上获取一次按下的按键，并显示该按键



来自 `graph.h` 头文件:

  * `_settextcolor(short color)—`设置打印文本时的颜色
  * `_setbkcolor(short color)—`设置打印文本时的背景颜色
  * `_settextposition(short y, short x)—`移动光标到行 `y` 和 列 `x`
  * `_outtext(char _FAR *string)—`从当前光标位置开始，直接将一串字符打印到屏幕



DOS 只支持 [16 种文本颜色][6] 和 8 中背景颜色。你可以使用值 0 (黑色) 到 15 (亮白色) 来具体指定文本颜色，以及使用值 0 (黑色) 到 7 (白色) 来具体指定背景颜色:

  * **0**—黑色
  * **1**—蓝色
  * **2**—绿色
  * **3**—品蓝色
  * **4**—红色
  * **5**—品红色
  * **6**—棕色
  * **7**—白色
  * **8**—亮黑色
  * **9**—亮蓝色
  * **10**—亮绿色
  * **11**—亮品蓝色
  * **12**—亮红色
  * **13**—亮品红色
  * **14**—黄色
  * **15**—亮白色



### 一个迷幻的 "Hello world" 程序

很多新开发者学习编写的第一个程序是为用户打印 "Hello world" 。我们可以使用 DOS 的 "conio" 和 "graphics" 库来制作一个更有趣的程序，并使用彩虹般的颜色打印 "Hello world" 。

在这个实例中，我们将遍历每种文本颜色，从 0 (黑色) 到 15 (亮白色)。随着我们打印每一行，我们都将为下一行缩进一个空格。在我们完成后，我们将等待一行按下任意按键，然后，我们将重新设置屏幕并退出。

你可以使用任意一个文本编辑器来编写你的 C 源文件代码。我喜欢使用一些与众不同的编辑器，包括 [FreeDOS Edit][7] 和 [Freemacs][8], 但是，我最近一直在使用 [FED editor][9] ，因为它提供 _语法高亮_ 功能，使其很容易在我的程序源文件代码中看到关键字、字符串（LCCT注：C 语言中没有字符串）、变量。

![编写一个简单的 C 程序][10]

使用 C 语言编写一个简单的测试程序
(Jim Hall, [CC-BY SA 4.0][4])

在你使用 OpenWatcom 编译前，你将需要设置 DOS 的 [环境变量][11]，以便 OpenWatcom 可以找到它的支持文件。OpenWatcom C 编译器软件包中包含的一个名称为 setup 的 [批处理文件][12] 为你完成找到它的支持文件。同样的，运行名称为 `\DEVEL\OW\OWSETENV.BAT` 的批处理文件来自动为你的 OpenWatcom 设置环境变量。

在你的开发环境准备好后，你可以使用 OpenWatcom 编译器来编译这个 "Hello world" 程序。我已经将我的 C 源文件文件保存为 `TEST.C` ，因此，我可以输入 `WCL TEST.C` 来编译和链接该程序为一个名称为 `TEST.EXE` 的 DOS 可执行文件。在 OpenWatcom 的输出信息中，你将看到 `WCL` 实际上调用 OpenWatcom C 编译器 (`WCC`) 来编译，调用 OpenWatcom 链接器 (`WLINK`) 来执行 <ruby>对象/目标<rt>object</rt></ruby> 链接阶段:

![使用 OpenWatcom 编译][13]

使用 OpenWatcom 编译 test 文件
(Jim Hall, [CC-BY SA 4.0][4])

OpenWatcom 会打印一些无关的输出信息，这可能会使发现错误和警告变得困难。为告诉编译器来封禁这些大量的额外信息，使用 `/Q` ("Quiet") 选项option when compiling:

![使用 OpenWatcom 编译][14]

在编译 C 源文件文件时，如果你没有看到一些错误信息，那么你现在就可以运行你的 DOS 程序。这个 "Hello world" 示例的程序名称是 `TEST.EXE` 。在 DOS 命令行中输入 `TEST` 来运行新的程序，你应该会看到这个非常令人心动的输出:

![运行 test 程序][15]

C 语言是一种非常高效的编程语言，在像 DOS 之类的资源有限的系统上进行编程也可以很好的工作。在 DOS 上，你可以使用 C 语言来做更多的事。如果你是 C 语言的初学者，那么，你可以跟随我们在 FreeDOS 网站上的 [使用 C 语言编写 FreeDOS 程序][16] 的自定进度的电子书来自主学习 C 语言, 以及随附在 [FreeDOS YouTube 频道][17] 上的 <ruby>入门指南<rt>"how-to"</rt></ruby> 系列视频。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/program-c-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_2.png?itok=JPlR5aCA (Woman sitting in front of her computer)
[2]: https://devblogs.microsoft.com/oldnewthing/20200728-00/?p=104012
[3]: https://opensource.com/sites/default/files/uploads/install-ow.png (Installing OpenWatcom on FreeDOS 1.3 RC4)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: http://openwatcom.org/
[6]: https://opensource.com/article/21/6/freedos-sixteen-colors
[7]: https://opensource.com/article/21/6/freedos-text-editor
[8]: https://opensource.com/article/21/6/freemacs
[9]: https://opensource.com/article/21/1/fed-editor
[10]: https://opensource.com/sites/default/files/uploads/fed-test.png (Writing a simple test program in C)
[11]: https://opensource.com/article/21/6/freedos-environment-variables
[12]: https://opensource.com/article/21/6/automate-tasks-bat-files-freedos
[13]: https://opensource.com/sites/default/files/uploads/wcl-test.png (Compiling the test program with OpenWatcom)
[14]: https://opensource.com/sites/default/files/uploads/wcl-q-test.png (Use the /Q ("Quiet") option to make OpenWatcom print less output)
[15]: https://opensource.com/sites/default/files/uploads/test.png (You can create beautiful programs in C)
[16]: https://www.freedos.org/books/cprogramming/
[17]: https://www.youtube.com/freedosproject
