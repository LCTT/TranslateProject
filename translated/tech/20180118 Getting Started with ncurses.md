ncurses入门指南
======
怎样使用curses来绘制终端屏幕。

虽然图形界面非常酷，但是不是所有的程序都需要点击式的界面。例如，令人尊敬的vi编辑器在第一个GUI(出现)之前在纯文本终端运行了很久。

vi编辑器是一个在"文本"模式下绘制的面向屏幕程序的例子。它使用了一个叫curses的库。这个库提供了一系列的编程接口来操纵终端屏幕。curses库产生于BSD UNIX，但是Linux系统通过ncurses库提供这个功能。

[了解ncurses"过去曾引起的风暴"，参见 ["ncurses: Portable Screen-Handling for Linux"][1], September 1, 1995, by Eric S. Raymond.]

使用curses创建程序实际上非常简单。在这个文章中，我展示了一个利用curses来在终端屏幕上绘图的示例程序。

### 谢尔宾斯基三角形

简单展示一些curses函数的一个方法是生成谢尔宾斯基三角形。如果你对生成谢尔宾斯基三角形的这种方法不熟悉的话，这里是一些(产生谢尔宾斯基三角形的)规则：

1.  设置定义三角形的三个点。

2.  随机选择任意的一个点(x,y)。

然后：

1.  在三角形的顶点中随机选择一个点

2.  将新的x,y设置为先前的x,y和三角顶点的中间点。

3.  重复(上述步骤)。

所以我按照这些指令写了这个程序，程序使用curses函数来向终端屏幕绘制谢尔宾斯基三角形：

```

     1  /* triangle.c */
     2
     3  #include <curses.h>
     4  #include <stdlib.h>
     5
     6  #include "getrandom_int.h"
     7
     8  #define ITERMAX 10000
     9
    10  int main(void)
    11  {
    12      long iter;
    13      int yi, xi;
    14      int y[3], x[3];
    15      int index;
    16      int maxlines, maxcols;
    17
    18      /* 初始化 curses */
    19
    20      initscr();
    21      cbreak();
    22      noecho();
    23
    24      clear();
    25
    26      /* 初始化三角形 */
    27
    28      maxlines = LINES - 1;
    29      maxcols = COLS - 1;
    30
    31      y[0] = 0;
    32      x[0] = 0;
    33
    34      y[1] = maxlines;
    35      x[1] = maxcols / 2;
    36
    37      y[2] = 0;
    38      x[2] = maxcols;
    39
    40      mvaddch(y[0], x[0], '0');
    41      mvaddch(y[1], x[1], '1');
    42      mvaddch(y[2], x[2], '2');
    43
    44      /* 将 yi,xi 初始化为随机值 */
    45
    46      yi = getrandom_int() % maxlines;
    47      xi = getrandom_int() % maxcols;
    48
    49      mvaddch(yi, xi, '.');
    50
    51      /* 迭代(形成)三角形 */
    52
    53      for (iter = 0; iter < ITERMAX; iter++) {
    54          index = getrandom_int() % 3;
    55
    56          yi = (yi + y[index]) / 2;
    57          xi = (xi + x[index]) / 2;
    58
    59          mvaddch(yi, xi, '*');
    60          refresh();
    61      }
    62
    63      /* 完成 */
    64
    65      mvaddstr(maxlines, 0, "Press any key to quit");
    66
    67      refresh();
    68
    69      getch();
    70      endwin();
    71
    72      exit(0);
    73  }

```

让我一边解释一边浏览这个程序。首先，getrandom_int()函数是我对Linux系统调用getrandom()的包装器。它保证返回一个正整数(int)值。(译者注：getrandom()系统按照字节返回随机值到一个变量中，值是随机的，不保证正负，使用stdlib.h的random()函数可以达到同样的效果) 另外，按照上面的规则，你应该能够辨认出初始化和迭代谢尔宾斯基三角形的代码。除此之外，我们来看看我用来在终端上绘制三角形的curses函数。

大多数curses程序以这四条指令开头。1)initscr()函数获取包括大小和特征在内的终端类型，并设置终端支持的curses环境。cbreak()函数禁用行缓冲并设置curses每次只接受一个字符。noecho()函数告诉curses不要把输入回显到屏幕上。而clear()函数清空了屏幕():

```

    20      initscr();
    21      cbreak();
    22      noecho();
    23
    24      clear();

```

之后程序设置了三个定义三角的顶点。注意这里使用的LINES和COLS，它们是由initscr()来设置的。这些值告诉程序在终端的行数和列数。屏幕坐标从0开始，所以屏幕左上角是0行0列。屏幕右下角是LINES - 1行，COLS - 1列。为了便于记忆，我的程序里把这些值分别设为了变量maxlines和maxcols。

在屏幕上绘制文字的两个简单方法是addch()和addstr()函数。也可以使用相关的mvaddch()和mvaddstr()函数可以将字符放到一个特定的屏幕位置。我的程序在很多地方都用到了这些函数。首先程序绘制三个定义三角的点并标记为"0"，"1"和"2"：

```

    40      mvaddch(y[0], x[0], '0');
    41      mvaddch(y[1], x[1], '1');
    42      mvaddch(y[2], x[2], '2');

```

为了绘制任意的一个初始点，程序做了类似的一个调用：

```

    49      mvaddch(yi, xi, '.');

```

还有为了在谢尔宾斯基三角形递归中绘制连续的点：

```

    59          mvaddch(yi, xi, '*');

```

当程序完成之后，将会在屏幕左下角(在maxlines行,0列)显示一个帮助信息：

```

    65      mvaddstr(maxlines, 0, "Press any key to quit");

```

注意curses在内存中维护了一个版本的屏幕并且只有在你要求的时候才会更新这个屏幕，这很重要。特别是当你想要向屏幕显示大量的文字的时候，这样(程序会有)更好的表现。这是因为curses只能更新在上次更新之后可以被改变的这部分屏幕。想要引得curses更新终端屏幕，请使用refresh()函数。

在我的示例程序中，我选择在"绘制"每个谢尔宾斯基三角形中的连续点时更新屏幕。通过这样做，用户可以观察三角形中的每次迭代。(译者注：迭代过程执行太快了，所以其实很难直接看到迭代过程)

在退出之前，我使用getch()函数等待用户按下一个键。然后我调用endwin()函数退出curses环境并返回终端程序到一般控制。

```

    69      getch();
    70      endwin();

```

### 编译和示例输出

现在你已经有了你的第一个curses示例程序，是时候编译运行它了。记住Linux操作系统通过ncurses库来实现curses功能，所以你需要在编译的时候通过-lncurses来链接--例如：

```

$ ls
getrandom_int.c  getrandom_int.h  triangle.c

$ gcc -Wall -lncurses -o triangle triangle.c getrandom_int.c

```

译注：此处命令行有问题，`-lncurses`选项在我的Ubuntu16.04系统+gcc 4.9.3 环境下，必须放在命令行最后，否则找不到库文件，链接时会出现未定义的引用。

在标准的80x24终端运行这个triangle程序并没什么意思。在那样的分辨率下你不能看见谢尔宾斯基三角形的很多细节。如果你运行终端窗口并设置非常小的字体大小，你可以更加容易地看到谢尔宾斯基三角形的不规则性质。在我的系统上，输出如图1。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/triangle.png)

图 1. triangle程序的输出

虽然迭代具有随机性，但是每次谢尔宾斯基三角形的运行看起来都会很一致。唯一的不同是最初绘制到屏幕的一些点。在这个例子中，你可以看到开创三角形的一个小圆点，在点1附近。看起来程序接下来选择了点2，然后你可以看到在圆点和"2"之间的星号。并且看起来程序随机选择了点2作为下一个随机数，因为你可以看到在第一个星号和"2"之间的星号。从这里开始，就不能继续分辨三角形是怎样被画出来的了，因为所有的连续点都属于三角形区域。

### 开始学习ncurses

这个程序是一个怎样使用curses函数绘制字符到屏幕的简单例子。按照你的程序的需要，你可以通过curses做得更多。在下一篇文章中，我将会展示怎样使用curses让用户和屏幕交互。如果你对于在curses有一个良好开端有兴趣，我支持你去读位于Linux文档中Pradeep Padala的 ["NCURSES Programming HOWTO"][2]

### 关于作者

Jim Hall是一个免费和开源软件的倡议者，他最有名的工作是FreeDOS计划，也同样致力于开源软件的可用性。Jim是在明尼苏达州的拉姆齐县的首席资讯长。
--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/getting-started-ncurses

作者：[Jim Hall][a]
译者：[leemeans](https://github.com/leemeans)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/jim-hall
[1]:http://www.linuxjournal.com/article/1124
[2]:http://tldp.org/HOWTO/NCURSES-Programming-HOWTO
