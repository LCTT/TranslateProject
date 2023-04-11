[#]: subject: (How to program in C on FreeDOS)
[#]: via: (https://opensource.com/article/21/6/program-c-freedos)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to program in C on FreeDOS
======
Programming in C on FreeDOS is very similar to C programming on Linux.
![Woman sitting in front of her computer][1]

When I first started using DOS, I enjoyed writing games and other interesting programs using BASIC, which DOS included. Much later, I learned the C programming language.

I immediately loved working in C! It was a straightforward programming language that gave me a ton of flexibility for writing useful programs. In fact, much of the FreeDOS core utilities are written in C and Assembly.

So it's probably not surprising that FreeDOS 1.3 RC4 includes a C compiler—along with other programming languages. The FreeDOS 1.3 RC4 LiveCD includes two C compilers—Bruce's C compiler (a simple C compiler) and the OpenWatcom C compiler. On the Bonus CD, you can also find DJGPP (a 32-bit C compiler based on GNU GCC) and the IA-16 port of GCC (requires a '386 or better CPU to compile, but the generated programs can run on low-end systems).

Programming in C on FreeDOS is basically the same as C programming on Linux, with two exceptions:

  1. **You need to remain aware of how much memory you use.** Linux allows programs to use lots of memory, but FreeDOS is more limited. Thus, DOS programs used one of four [memory models][2] (large, medium, compact, and small) depending on how much memory they needed.
  2. **You can directly access the console.** On Linux, you can create _text-mode_ mode programs that draw to the terminal screen using a library like _ncurses_. But DOS allows programs to access the console and video hardware. This provides a great deal of flexibility in writing more interesting programs.



I like to write my C programs in the IA-16 port of GCC, or OpenWatcom, depending on what program I am working on. The OpenWatcom C compiler is easier to install since it's only a single package. That's why we provide OpenWatcom on the FreeDOS LiveCD, so you can install it automatically if you choose to do a "Full installation including applications and games" when you install FreeDOS 1.3 RC4. If you opted to install a "Plain DOS system," then you'll need to install the OpenWatcom C compiler afterward, using the FDIMPLES package manager.

![installing OpenWatcom][3]

Installing OpenWatcom on FreeDOS 1.3 RC4
(Jim Hall, [CC-BY SA 4.0][4])

### DOS C programming

You can find documentation and library guides on the [OpenWatcom project website][5] to learn all about the unique DOS C programming libraries provided by the OpenWatcom C compiler. To briefly describe a few of the most useful functions:

From `conio.h`:

  * `int getch(void)—`Get a single keystroke from the keyboard
  * `int getche(void)—`Get a single keystroke from the keyboard, and echo it



From `graph.h`:

  * `_settextcolor(short color)—`Sets the color when printing text
  * `_setbkcolor(short color)—`Sets the background color when printing text
  * `_settextposition(short y, short x)—`Move the cursor to row `y` and column `x`
  * `_outtext(char _FAR *string)—`Print a string directly to the screen, starting at the current cursor location



DOS only supports [sixteen text colors][6] and eight background colors. You can use the values 0 (Black) to 15 (Bright White) to specify the text colors, and 0 (Black) to 7 (White) for the background colors:

  * **0**—Black
  * **1**—Blue
  * **2**—Green
  * **3**—Cyan
  * **4**—Red
  * **5**—Magenta
  * **6**—Brown
  * **7**—White
  * **8**—Bright Black
  * **9**—Bright Blue
  * **10**—Bright Green
  * **11**—Bright Cyan
  * **12**—Bright Red
  * **13**—Bright Magenta
  * **14**—Yellow
  * **15**—Bright White



### A fancy "Hello world" program

The first program many new developers learn to write is a program that just prints "Hello world" to the user. We can use the DOS "conio" and "graphics" libraries to make this a more interesting program and print "Hello world" in a rainbow of colors.

In this case, we'll iterate through each of the text colors, from 0 (Black) to 15 (Bright White). As we print each line, we'll indent the next line by one space. When we're done, we'll wait for the user to press any key, then we'll reset the screen and exit.

You can use any text editor to write your C source code. I like using a few different editors, including [FreeDOS Edit][7]** **and [Freemacs][8], but more recently I've been using the [FED editor][9] because it provides _syntax highlighting_, making it easier to see keywords, strings, and variables in my program source code.

![writing a simple C program][10]

Writing a simple test program in C
(Jim Hall, [CC-BY SA 4.0][4])

Before you can compile using OpenWatcom, you'll need to set up the DOS [environment variables][11]** **so OpenWatcom can find its support files. The OpenWatcom C compiler package includes a setup [batch file][12] that does this for you, as `\DEVEL\OW\OWSETENV.BAT`. Run this batch file to automatically set up your environment for OpenWatcom.

Once your environment is ready, you can use the OpenWatcom compiler to compile this "Hello world" program. I've saved my C source file as `TEST.C`, so I can type `WCL TEST.C` to compile and link the program into a DOS executable, called `TEST.EXE`. In the output messages from OpenWatcom, you can see that `WCL` actually calls the OpenWatcom C Compiler (`WCC`) to compile, and the OpenWatcom Linker (`WLINK`) to perform the object linking stage:

![compiling with OpenWatcom][13]

Compiling the test program with OpenWatcom
(Jim Hall, [CC-BY SA 4.0][4])

OpenWatcom prints some extraneous output that may make it difficult to spot errors or warnings. To tell the compiler to suppress most of these extra messages, use the `/Q` ("Quiet") option when compiling:

![compiling with OpenWatcom][14]

If you don't see any error messages when compiling the C source file, you can now run your DOS program. This "Hello world" example is `TEST.EXE`. Enter `TEST` on the DOS command line to run the new program, and you should see this very pretty output:

![running the test program][15]

C is a very efficient programming language that works well for writing programs on limited-resource systems like DOS. There's lots more that you can do by programming in C on DOS. If you're new to the C language, you can learn C yourself by following along in our [Writing FreeDOS Programs in C][16] self-paced ebook on the FreeDOS website, and the accompanying "how-to" video series on the [FreeDOS YouTube channel][17].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/program-c-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
