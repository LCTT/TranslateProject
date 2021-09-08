[#]: subject: "Write a guessing game in ncurses on Linux"
[#]: via: "https://opensource.com/article/21/8/guess-number-game-ncurses-linux"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13762-1.html"

通过 ncurses 在 Linux 上写一个猜谜游戏
======

> 使用 ncurses 的灵活性和强大功能在 Linux 上创建一个猜数字游戏。

![](https://img.linux.net.cn/data/attachment/album/202109/07/224224ecchm0t5jbjc1dzy.jpg)

在我的 [上一篇文章][2]，我简要介绍了使用 ncurses 库通过 C 语言编写文本模式交互式应用程序。使用 ncurses，我们可以控制文本在终端上的显示位置和方式。如果你通过阅读手册页探索 ncurses 库函数，你会发现显示文本有很多不同的方式，包括粗体文本、颜色、闪烁文本、窗口、边框、图形字符和其它功能，这些都可以使你的应用脱颖而出。

如果你想探索一个更高级的程序来演示其中一些有趣的功能，有一个简单的“猜数字”游戏，我已更新为使用 ncurses 编写的了。该程序在一个范围内选择一个随机数，然后要求用户进行重复猜测，直到他们猜到这个秘密数字。当用户进行猜测时，程序会告知他们猜测的数字是太低还是太高。

请注意，程序限定可能的数字范围是 0 到 7。将值保持在有限的个位数数字范围内，可以更轻松的使用 `getch()` 函数从用户读取单个数字。我还使用了 `getrandom` 内核系统调用来生成随机数，设定数字最大值为 7，以从 0 （二进制 `0000`）到 7 （二进制 `0111`）中选择一个随机数。

```
#include <curses.h>;
#include <string.h>;          /* for strlen */
#include <sys/random.h>;      /* for getrandom */

int
random0_7()
{
   int num;
   getrandom(&num, sizeof(int), GRND_NONBLOCK);
   return (num & 7); /* from 0000 to 0111 */
}

int
read_guess()
{
  int ch;

  do {
    ch = getch();
  } while ((ch < '0') || (ch > '7'));

  return (ch - '0'); /* turn into a number */
}
```

通过使用 ncurses，我们可以增加一些有趣的视觉体验。通过添加函数，我们可以在屏幕顶部显示重要的文本信息，在屏幕底部显示状态消息行：

```
void
print_header(const char *text)
{
  move(0, 0);
  clrtoeol();

  attron(A_BOLD);
  mvaddstr(0, (COLS / 2) - (strlen(text) / 2), text);
  attroff(A_BOLD);
  refresh();
}

void
print_status(const char *text)
{
  move(LINES - 1, 0);
  clrtoeol();
 
  attron(A_REVERSE);
  mvaddstr(LINES - 1, 0, text);
  attroff(A_REVERSE);
  refresh();
}
```

通过这些函数，我们就可以构建猜数字游戏的主要部分。首先，程序为 ncurses 设置终端，然后从 0 到 7 中选择一个随机数。显示数字刻度后，程序启动一个循环，询问用户的猜测。

当用户进行猜测时，程序会在屏幕上提供反馈。如果猜测太低，程序会在屏幕上的数字下方打印一个左方括号。如果猜测太高，程序会在屏幕上的数字下方打印一个右方括号。这有助于用户缩小他们的选择范围，直到他们猜出正确的数字。

```
int
main()
{
  int number, guess;

  initscr();
  cbreak();
  noecho();

  number = random0_7();
  mvprintw(1, COLS - 1, "%d", number); /* debugging */

  print_header("Guess the number 0-7");

  mvaddstr(9, (COLS / 2) - 7, "0 1 2 3 4 5 6 7");

  print_status("Make a guess...");

  do {
    guess = read_guess();

    move(10, (COLS / 2) - 7 + (guess * 2));

    if (guess < number) {
      addch('[');
      print_status("Too low");
    }

    else if (guess > number) {
      addch(']');
      print_status("Too high");
    }

    else {
      addch('^');
    }
  } while (guess != number);

  print_header("That's right!");
  print_status("Press any key to quit");
  getch();

  endwin();

  return 0;
}
```

复制这个程序，自己尝试编译它。不要忘记你需要告诉 GCC 编译器链接到 ncurses 库：

```
$ gcc -o guess guess.c -lncurses
```

我留下了一个调试行，所以你可以看到屏幕右上角附近的秘密数字：

![guess number game interface][3]

*图1：猜数字游戏。注意右上角的秘密数字。*

### 开始使用 ncurses

该程序使用了 ncurses 的许多其它函数，你可以从这些函数开始。例如，`print_header` 函数在屏幕顶部居中以粗体文本打印消息，`print_status` 函数在屏幕左下角以反向文本打印消息。使用它来帮助你开始使用 ncurses 编程。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/guess-number-game-ncurses-linux

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/question-mark_chalkboard.jpg?itok=DaG4tje9 (question mark in chalk)
[2]: https://linux.cn/article-13756-1.html
[3]: https://opensource.com/sites/default/files/guessnumber07.png
