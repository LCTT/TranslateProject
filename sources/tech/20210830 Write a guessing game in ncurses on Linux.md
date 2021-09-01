[#]: subject: "Write a guessing game in ncurses on Linux"
[#]: via: "https://opensource.com/article/21/8/guess-number-game-ncurses-linux"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Write a guessing game in ncurses on Linux
======
Use the flexibility and power of ncurses to create a guess-the-number
game on Linux.
![question mark in chalk][1]

In my [last article][2], I gave a brief introduction to using the **ncurses** library to write text-mode interactive applications in C. With **ncurses**, we can control where and how text gets displayed on the terminal. If you explore the **ncurses** library functions by reading the manual pages, you’ll find there are a ton of different ways to display text, including bold text, colors, blinking text, windows, borders, graphic characters, and other features to make your application stand out.

If you’d like to explore a more advanced program that demonstrates a few of these interesting features, here’s a simple “guess the number” game, updated to use **ncurses**. The program picks a random number in a range, then asks the user to make repeated guesses until they find the secret number. As the user makes their guess, the program lets them know if the guess was too low or too high.

Note that this program limits the possible numbers from 0 to 7. Keeping the values to a limited range of single-digit numbers makes it easier to use **getch()** to read a single number from the user. I also used the **getrandom** kernel system call to generate random bits, masked with the number 7 to pick a random number from 0 (binary 0000) to 7 (binary 0111).


```
#include &lt;curses.h&gt;
#include &lt;string.h&gt;          /* for strlen */
#include &lt;sys/random.h&gt;      /* for getrandom */

int
random0_7()
{
   int num;
   getrandom(&amp;num, sizeof(int), GRND_NONBLOCK);
   return (num &amp; 7); /* from 0000 to 0111 */
}

int
read_guess()
{
  int ch;

  do {
    ch = getch();
  } while ((ch &lt; '0') || (ch &gt; '7'));

  return (ch - '0'); /* turn into a number */
}
```

By using **ncurses**, we can add some visual interest. Let’s add functions to display important text at the top of the screen and a message line to display status information at the bottom of the screen.


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

With these functions, we can construct the main part of our number-guessing game. First, the program sets up the terminal for **ncurses**, then picks a random number from 0 to 7. After displaying a number scale, the program then enters a loop to ask the user for their guess.

As the user makes their guess, the program provides visual feedback. If the guess is too low, the program prints a left square bracket under the number on the screen. If the guess is too high, the game prints a right square bracket. This helps the user to narrow their choice until they guess the correct number.


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

    if (guess &lt; number) {
      addch('[');
      print_status("Too low");
    }

    else if (guess &gt; number) {
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

Copy this program and compile it for yourself to try it out. Don’t forget that you need to tell GCC to link with the **ncurses** library:


```
`$ gcc -o guess guess.c -lncurses`
```

I’ve left the debugging line in there, so you can see the secret number near the upper-right corner of the screen:

![guess number game interface][3]

Figure 1: Guess the number game. Notice the secret number in the upper right.

### Get yourself going with ncurses

This program uses a bunch of other features of **ncurses** that you can use as a starting point. For example, the print_header function prints a message in bold text centered at the top of the screen, and the print_status function prints a message in reverse text at the bottom-left of the screen. Use this to help you get started with **ncurses** programming.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/guess-number-game-ncurses-linux

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/question-mark_chalkboard.jpg?itok=DaG4tje9 (question mark in chalk)
[2]: https://opensource.com/article/21/8/ncurses-linux
[3]: https://opensource.com/sites/default/files/guessnumber07.png
