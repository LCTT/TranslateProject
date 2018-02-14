ncurses 入门指南
======

> 怎样使用curses来绘制终端屏幕？

虽然图形界面非常酷，但是不是所有的程序都需要点击式的界面。例如，令人尊敬的 Vi 编辑器在第一个 GUI 出现之前在纯文本终端运行了很久。

Vi 编辑器是一个在“文本”模式下绘制的<ruby>面向屏幕<rt>screen-oriented</rt></ruby>程序的例子。它使用了一个叫 curses 的库。这个库提供了一系列的编程接口来操纵终端屏幕。curses 库产生于 BSD UNIX，但是 Linux 系统通过 ncurses 库提供这个功能。

[要了解 ncurses “过去曾引起的风暴”，参见 [ncurses: Portable Screen-Handling for Linux][1], September 1, 1995, by Eric S. Raymond.]

使用 curses 创建程序实际上非常简单。在这个文章中，我展示了一个利用 curses 来在终端屏幕上绘图的示例程序。

### 谢尔宾斯基三角形

简单展示一些 curses 函数的一个方法是生成<ruby>谢尔宾斯基三角形<rt>Sierpinski's Triangle</rt></ruby>。如果你对生成谢尔宾斯基三角形的这种方法不熟悉的话，这里是一些产生谢尔宾斯基三角形的规则：

1.  设置定义三角形的三个点。
2.  随机选择任意的一个点 `(x,y)`。

然后：

1.  在三角形的顶点中随机选择一个点。
2.  将新的 `x,y` 设置为先前的 `x,y` 和三角顶点的中间点。
3.  重复（上述步骤）。

所以我按照这些指令写了这个程序，程序使用 curses 函数来向终端屏幕绘制谢尔宾斯基三角形：

```
/* triangle.c */

#include <curses.h>
#include <stdlib.h>

#include "getrandom_int.h"

#define ITERMAX 10000

int main(void)
{
  long iter;
  int yi, xi;
  int y[3], x[3];
  int index;
  int maxlines, maxcols;

  /* initialize curses */

  initscr();
  cbreak();
  noecho();

  clear();

  /* initialize triangle */

  maxlines = LINES - 1;
  maxcols = COLS - 1;

  y[0] = 0;
  x[0] = 0;

  y[1] = maxlines;
  x[1] = maxcols / 2;

  y[2] = 0;
  x[2] = maxcols;

  mvaddch(y[0], x[0], '0');
  mvaddch(y[1], x[1], '1');
  mvaddch(y[2], x[2], '2');

  /* initialize yi,xi with random values */

  yi = getrandom_int() % maxlines;
  xi = getrandom_int() % maxcols;

  mvaddch(yi, xi, '.');

  /* iterate the triangle */

  for (iter = 0; iter < ITERMAX; iter++) {
      index = getrandom_int() % 3;

      yi = (yi + y[index]) / 2;
      xi = (xi + x[index]) / 2;

      mvaddch(yi, xi, '*');
      refresh();
  }

  /* done */

  mvaddstr(maxlines, 0, "Press any key to quit");

  refresh();

  getch();
  endwin();

  exit(0);
}
```

让我一边解释一边浏览这个程序。首先，`getrandom_int()` 函数是我对 Linux 系统调用 `getrandom()` 的包装器。它保证返回一个正整数（`int`）值。（LCTT 译注：`getrandom()` 系统调用按照字节返回随机值到一个变量中，值是随机的，不保证正负，使用 `stdlib.h` 的 `random()` 函数可以达到同样的效果）另外，按照上面的规则，你应该能够辨认出初始化和迭代谢尔宾斯基三角形的代码。除此之外，我们来看看我用来在终端上绘制三角形的 curses 函数。

大多数 curses 程序以这四条指令开头。 `initscr()` 函数获取包括大小和特征在内的终端类型，并设置终端支持的 curses 环境。`cbreak()` 函数禁用行缓冲并设置 curses 每次只接受一个字符。`noecho()` 函数告诉 curses 不要把输入回显到屏幕上。而 `clear()` 函数清空了屏幕：

```
  initscr();
  cbreak();
  noecho();

  clear();
```

之后程序设置了三个定义三角的顶点。注意这里使用的 `LINES` 和 `COLS`，它们是由 `initscr()` 来设置的。这些值告诉程序在终端的行数和列数。屏幕坐标从 `0` 开始，所以屏幕左上角是 `0` 行 `0` 列。屏幕右下角是 `LINES - 1` 行，`COLS - 1` 列。为了便于记忆，我的程序里把这些值分别设为了变量 `maxlines` 和 `maxcols`。

在屏幕上绘制文字的两个简单方法是 `addch()` 和 `addstr()` 函数。也可以使用相关的 `mvaddch()` 和 `mvaddstr()` 函数可以将字符放到一个特定的屏幕位置。我的程序在很多地方都用到了这些函数。首先程序绘制三个定义三角的点并标记为 `'0'`，`'1'` 和 `'2'`：

```
  mvaddch(y[0], x[0], '0');
  mvaddch(y[1], x[1], '1');
  mvaddch(y[2], x[2], '2');
```

为了绘制任意的一个初始点，程序做了类似的一个调用：

```
  mvaddch(yi, xi, '.');
```

还有为了在谢尔宾斯基三角形递归中绘制连续的点：

```
      mvaddch(yi, xi, '*');
```

当程序完成之后，将会在屏幕左下角（在 `maxlines` 行，`0` 列）显示一个帮助信息：

```
  mvaddstr(maxlines, 0, "Press any key to quit");
```

注意 curses 在内存中维护了一个版本的屏幕显示，并且只有在你要求的时候才会更新这个屏幕，这很重要。特别是当你想要向屏幕显示大量的文字的时候，这样程序会有更好的性能表现。这是因为 curses 只能更新在上次更新之后改变的这部分屏幕。想要让 curses 更新终端屏幕，请使用 `refresh()` 函数。

在我的示例程序中，我选择在“绘制”每个谢尔宾斯基三角形中的连续点时更新屏幕。通过这样做，用户可以观察三角形中的每次迭代。（LCTT 译注：由于 CPU 太快，迭代过程执行就太快了，所以其实很难直接看到迭代过程）

在退出之前，我使用 `getch()` 函数等待用户按下一个键。然后我调用 `endwin()` 函数退出 curses 环境并返回终端程序到一般控制。

```
  getch();
  endwin();
```

### 编译和示例输出

现在你已经有了你的第一个 curses 示例程序，是时候编译运行它了。记住 Linux 操作系统通过 ncurses 库来实现 curses 功能，所以你需要在编译的时候通过 `-lncurses`来链接——例如：

```
$ ls
getrandom_int.c  getrandom_int.h  triangle.c

$ gcc -Wall -lncurses -o triangle triangle.c getrandom_int.c
```

（LCTT 译注：此处命令行有问题，`-lncurses` 选项在我的 Ubuntu 16.04 系统 + gcc 4.9.3 环境下，必须放在命令行最后，否则找不到库文件，链接时会出现未定义的引用。）

在标准的 80x24 终端运行这个 `triangle` 程序并没什么意思。在那样的分辨率下你不能看见谢尔宾斯基三角形的很多细节。如果你运行终端窗口并设置非常小的字体大小，你可以更加容易地看到谢尔宾斯基三角形的不规则性质。在我的系统上，输出如图 1。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/triangle.png)

*图 1. triangle 程序的输出*

虽然迭代具有随机性，但是每次谢尔宾斯基三角形的运行看起来都会很一致。唯一的不同是最初绘制到屏幕的一些点的位置不同。在这个例子中，你可以看到三角形开始的一个小圆点，在点 1 附近。看起来程序接下来选择了点 2，然后你可以看到在圆点和“2”之间的星号。并且看起来程序随机选择了点 2 作为下一个随机数，因为你可以看到在第一个星号和“2”之间的星号。从这里开始，就不能继续分辨三角形是怎样被画出来的了，因为所有的连续点都属于三角形区域。

### 开始学习 ncurses

这个程序是一个怎样使用 curses 函数绘制字符到屏幕的简单例子。按照你的程序的需要，你可以通过 curses 做得更多。在下一篇文章中，我将会展示怎样使用 curses 让用户和屏幕交互。如果你对于学习 curses 有兴趣，我建议你去读位于 <ruby>[Linux 文档计划](http://www.tldp.org)<rt>Linux Documentation Project</rt></ruby>的 Pradeep Padala 写的 [NCURSES Programming HOWTO][2]。

### 关于作者

Jim Hall 是一个自由及开源软件的倡议者，他最有名的工作是 FreeDOS 计划，也同样致力于开源软件的可用性。Jim 是在明尼苏达州的拉姆齐县的首席信息官。

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/getting-started-ncurses

作者：[Jim Hall][a]
译者：[leemeans](https://github.com/leemeans)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/jim-hall
[1]:http://www.linuxjournal.com/article/1124
[2]:http://tldp.org/HOWTO/NCURSES-Programming-HOWTO
