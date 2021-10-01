[#]: sub·ject: "Position text on your screen in Linux with ncurses"
[#]: via: "https://opensource.com/article/21/8/ncurses-linux"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13756-1.html"

使用 ncurses 在你的 Linux 屏幕上定位文本
======

> 使用 ncurses 在 Linux 屏幕上的特定位置放置文本，可以带来更友好的用户界面体验。

![](https://img.linux.net.cn/data/attachment/album/202109/06/085908qrdrrv5dru6pcucr.jpg)

大多数的 Linux 实用程序仅仅只在屏幕的底部滚动文本。如果你想在屏幕中放置你的文本，例如一个游戏或者一个数据展示，你可以试试 ncurses。

curses 是一个旧的 Unix 库，它可以在文本终端界面控制光标。curses 的名称就来自于术语 “<ruby>光标控制<rt>cursor control</rt></ruby>”。多年以后，其他人编写了新的 curses 版本用来添加新的功能，新版本被叫做 “new curses” 或者 “ncurses”。你可以在每个流行的 Linux 发行版中找到 ncurses。尽管默认情况下可能未安装开发库、头文件和文档。例如，在 Fedora 上，你需要使用以下命令安装 `ncurses-devel` 包：

```
$ sudo dnf install ncurses-devel
```

### 在程序中使用 ncurses

要在屏幕上直接寻址，你首先需要初始化 `ncurses` 库。大部分程序会通过以下三行来做到这一点：

  * `initscr()`：初始化窗口对象和 ncurses 代码，返回代表整个屏幕的窗口对象
  * `cbreak()`：禁用缓冲并使键入的输入立即可用
  * `noecho()`：关闭回显，因此用户输入不会显示在屏幕上

这些函数定义在 `curses.h` 头文件中，你需要在你的程序中通过以下方式将其包含进来：

```
#include <curses.h>
```

初始化终端后，你可以自由使用任何 ncurses 函数，我们将在示例程序中探讨其中的一些函数。

当你使用完 ncurses 并想返回到常规终端模式下时，使用 `endwin()` 重置一切。此命令可以重置任何屏幕颜色，将光标移动到屏幕的左下角，并使光标可见。通常在退出程序之前执行此操作。

### 在屏幕上寻址

关于 ncurses 首先需要知道的是屏幕的坐标分为行和列，左上角的是 `0,0` 点。ncurses 定义了两个全局变量来帮助你识别屏幕：`LINES` 是屏幕的行数，`COLS` 是屏幕的列数。屏幕右下角的位置是 `LINES-1,COLS-1`。 

例如，如果你想要移动光标到第 10 行和第 30 列，你可以使用 `move()` 函数，移动到此坐标：

```
move(10, 30);
```

之后显示的任何文本都将从屏幕的该位置开始。要显示单个字符，请对单个字符使用 `addch(c)` 函数。要显示字符串，将对字符串使用 `addstr(s)` 函数。对于类似于 `printf` 的格式化输出，请使用带有常用选项的 `printw(fmt, ...)`。

移动到屏幕指定位置和显示文本是一件很常见的事情，ncurses 提供了同时执行这两项操作的快捷方式。`mvaddch(row, col, c)` 函数将在屏幕第 `row` 行，第 `col` 列的位置显示一个字符。而 `mvaddstr(row, col, s)` 函数将在屏幕第 `row` 行，第 `col` 列的位置显示一个字符串。举个更直接的例子，在程序中使用 `mvaddstr(10, 30, "Welcome to ncurses");` 函数将从屏幕的第 `10` 行和第 `30` 列开始显示文本 `Welcome to ncurses`。使用 `mvaddch(0, 0, '+')` 函数将在屏幕的左上角第 `0` 行和第 `0` 列处显示一个加号（`+`）。

在终端屏幕上绘制文本会对某些系统产生性能影响，尤其是在较旧的硬件终端上。因此 ncurses 允许你“堆叠”一堆文本以显示在屏幕上，然后使用 `refresh()` 函数使所有这些更改对用户可见。

让我们来看一个将以上所有内容整合在一起的简单示例：

```
#include <curses.h>

int
main()
{
  initscr();
  cbreak();
  noecho();

  mvaddch(0, 0, '+');
  mvaddch(LINES - 1, 0, '-');
  mvaddstr(10, 30, "press any key to quit");
  refresh();

  getch();

  endwin();
}
```

程序的开始初始化了一个终端窗口，然后在屏幕的左上角打印了一个加号，在左下角打印了一个减号，在第 `10` 行和第 `30` 列打印了 `press any key to quit` 文本。程序通过使用 `getch()` 函数接收了键盘输入的单个字符，接着，使用 `endwin()` 函数在程序完全退出前重置了终端。

`getch()` 是一个很有用的函数，你可以使用它来做很多事情。我经常使用它在我退出程序前用来暂停。与大多数 ncurses 函数一样，还有一个名为 `mvgetch(row, col)` 的 `getch()` 版本，用于在等待字符输入之前移动到屏幕位置的第 `row` 行，第 `col` 列。

### 使用 ncurses 编译

如果你尝试以通常的方式编译该示例程序，例如 `gcc pause.c`，你可能会从链接器中获得大量错误列表。那是因为 GNU C 编译器不会自动链接 `ncurses` 库。相反，你需要使用 `-l ncurses` 命令行选项加载它以进行链接。

```
$ gcc -o pause pause.c -lncurses
```

运行新程序将打印一条简单的 `press any key to quit`消息，该消息差不多位于屏幕中央：

![centered message in a program window][2]

*图 1：程序中居中的 “press any key to quit” 消息。*

### 使用 ncurses 构建更好的程序

探索 `ncurses` 库函数以了解在屏幕上显示文本的其它方法。你可以在 `ncurses` 的手册页中找到所有 `ncurses` 函数的列表。这给出了 ncurses 的一般概述，并提供了不同 `ncurses` 函数的类似表格的列表，并参考了包含完整详细信息的手册页。例如，在 `curs_printw(3X)` 手册页中描述了 `printw`，可以通过以下方式查看：

```
$ man 3x curs_printw
```

更简单点：

```
$ man curs_printw
```

使用 ncurses，你可以创建更多有趣的程序。通过在屏幕上的特定位置打印文本，你可以创建在终端中运行的游戏和高级实用程序。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/ncurses-linux

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/sites/default/files/press-key_0.png
