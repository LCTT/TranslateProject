[#]: subject: (Program on FreeDOS with Bywater BASIC)
[#]: via: (https://opensource.com/article/21/6/freedos-bywater-basic)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Program on FreeDOS with Bywater BASIC
======
Install Bywater BASIC on your FreeDOS system and start experimenting
with BASIC programming.
![woman on laptop sitting at the window][1]

In the early days of personal computing—from the late 1970s and through the 1980s—many people got their start with BASIC programming. BASIC was a universal programming language that came built into most personal computers, from Apple to IBM PCs.

When we started the FreeDOS Project in June 1994, it seemed natural that we should include an open source BASIC environment. I was excited to discover one already existed in Bywater BASIC.

The [Bywater BASIC website][2] reminds us that “Bywater BASIC implements a large superset of the ANSI Standard for Minimal BASIC (X3.60-1978) and a significant subset of the ANSI Standard for Full BASIC (X3.113-1987).” It's also distributed under the GNU General Public License version 2, which means it's open source software. We only want to include open source programs in FreeDOS, so Bywater BASIC was a great addition to FreeDOS in our early days.

We've included Bywater BASIC since at least FreeDOS Alpha 5, in 1997. You can find Bywater BASIC in FreeDOS 1.3 RC4 in the "Development" package group on the Bonus CD. Load this:

![Bywater BASIC][3]

Installing Bywater BASIC on FreeDOS 1.3 RC4
(Jim Hall, [CC-BY SA 4.0][4])

FreeDOS installs the Bywater BASIC package in the `\DEVEL\BWBASIC` directory. Change to this directory with `CD \DEVEL\BWBASIC` and type `BWBASIC` to run the Bywater BASIC interpreter.

![Bywater BASIC][5]

The Bywater BASIC intepreter
(Jim Hall, [CC-BY SA 4.0][4])

### Writing a sample program

Let me demonstrate Bywater BASIC by writing a test program. We'll keep this simple—print five random numbers. This requires only a few constructs—a loop to iterate over five values and a random number generator. BASIC uses the `RND(1)` statement to generate a random value between 0 and 1. We can use `PRINT` to display the random number.

One feature I like in Bywater BASIC is the integrated "help" system. There's nothing more frustrating than forgetting the syntax for a BASIC statement. For example, I always forget how to create BASIC loops. Do I use `FOR I IN 1 TO 10` or `FOR I = 1 TO 10`? Just type `help FOR` at the Bywater BASIC prompt and the interpreter displays the usage and a brief description.

![Bywater BASIC][6]

Use the "help" system as a quick-reference guide
(Jim Hall, [CC-BY SA 4.0][4])

Another neat feature in Bywater BASIC is how it reformats your BASIC instructions, so they are easier to read. After typing my brief program, I can type `list` to see the full source listing. Bywater BASIC automatically adds the `CALL` keyword to my `RANDOMIZE` statement on line 10 and indents the `PRINT` statement inside my loop. These small changes help me to see loops and other features in my program, which can aid in debugging.

![Bywater BASIC][7]

Bywater BASIC automatically reformats your code
(Jim Hall, [CC-BY SA 4.0][4])

If everything looks okay, then type `RUN` to execute the program. Because I used the `RANDOMIZE` statement at the start of my BASIC program, Bywater _seeds_ the random number generator with a random starting point. This ensures that my numbers are actually random values and don't repeat when I re-run my program.

![Bywater BASIC][8]

Generating lists of random numbers
(Jim Hall, [CC-BY SA 4.0][4])

Install Bywater BASIC on your FreeDOS system and start experimenting with BASIC programming. BASIC can be a great first programming language, especially if you are interested in getting back to the "roots" of personal computing. You can find more information about Bywater BASIC in the manual, installed in the `\DEVEL\BWBASIC` directory as `BWBASIC.DOC`. You can also explore the online "help" system by typing `HELP` at the Bywater BASIC prompt.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-bywater-basic

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://sourceforge.net/projects/bwbasic/
[3]: https://opensource.com/sites/default/files/uploads/bwbasic1.png (Installing Bywater BASIC on FreeDOS 1.3 RC4)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/bwbasic3.png (The Bywater BASIC intepreter)
[6]: https://opensource.com/sites/default/files/uploads/randnum1.png (Use the "help" system as a quick-reference guide)
[7]: https://opensource.com/sites/default/files/uploads/randnum2.png (Bywater BASIC automatically reformats your code)
[8]: https://opensource.com/sites/default/files/uploads/randnum3.png (Generating lists of random numbers)
