[#]: subject: (Why I love programming on FreeDOS with GW-BASIC)
[#]: via: (https://opensource.com/article/21/6/freedos-gw-basic)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Why I love programming on FreeDOS with GW-BASIC
======
BASIC was my entry into computer programming. I haven't written BASIC
code in years, but I'll always have a fondness for BASIC and GW-BASIC.
![Old UNIX computer][1]

When I was growing up, it seemed every "personal computer" from the TRS-80 to the Commodore to the Apple let you write your own programs in the Beginners' All-purpose Symbolic Instruction Code ([BASIC][2]) programming language. Our family had a clone of the Apple II called the Franklin ACE 1000, which—as a clone—also ran AppleSoft BASIC. I took to AppleSoft BASIC right away and read books and magazines to teach myself about BASIC programming.

Later, our family upgraded to an IBM PC running DOS. Just like every personal computer before it, the IBM PC also ran its own version of DOS, called BASICA. Later versions of DOS replaced BASIC with an updated interpreter called GW-BASIC.

BASIC was my entry into computer programming. As I grew up, I learned other programming languages. I haven't written BASIC code in years, but I'll always have a fondness for BASIC and GW-BASIC.

### Microsoft open-sources GW-BASIC

In May 2020, Microsoft surprised everyone (including me) by releasing the source code to GW-BASIC. Rich Turner (Microsoft) wrote in the [announcement][3] on the Microsoft Developer Blog:

“Since re-open-sourcing MS-DOS 1.25 &amp; 2.0 on GitHub last year, we’ve received numerous requests to also open-source Microsoft BASIC. Well, here we are! As clearly stated in the repo's readme, these sources are the 8088 assembly language sources from 10th Feb 1983 and are being open-sourced for historical reference and educational purposes. This means we will not be accepting PRs (Pull Requests) that modify the source in any way.”

You can find the GW-BASIC source code release at the [GW-BASIC GitHub][4]. And yes, Microsoft used the [MIT License][5], which makes this open source software.

Unfortunately, the GW-BASIC code was entirely in Assembly, which wouldn't build with modern tools. But open source developers got to work on that and adjusted the code to assemble with updated DOS assemblers. One project is [TK Chia's GitHub][6] project to update GW-BASIC to assemble with JWASM or other assemblers. You can find several [source and binary releases][7] on TK Chia's project. The notes from the latest version (October 2020) mention that this is “a 'pre-release' binary of GW-BASIC as rebuilt in 2020” and that “support for serial port I/O is missing. Light pen input, joystick input, and printer (parallel port) output need more testing.”  But if you don't need those extra features in GW-BASIC, you should be able to use this latest release to get back into BASIC programming with an open-sourced GW-BASIC.

FreeDOS 1.3 RC4 doesn't include GW-BASIC, but installing it is pretty easy. Just download the `gwbas-20201025.zip` archive file from TK Chia's October 2020 GW-BASIC release, and extract it (unzip it) on your FreeDOS system. The binary archive uses a default path of `\DEVEL\GWBASIC`.

### Getting started with GW-BASIC

To start GW-BASIC, run the `GWBASIC.EXE` program from the DOS command line. Note that DOS is _case insensitive_ so you don't actually need to type that in all uppercase letters. Also, DOS will run any `EXE` or `COM` or `BAT` programs automatically, so you don't need to provide the extension, either. Go into the `\DEVEL\GWBASIC` and type `GWBASIC` to run BASIC.

![GW-BASIC][8]

The GW-BASIC interpreter
(Jim Hall, [CC-BY SA 4.0][9])

GW-BASIC is an _interpreted_ programming language. The GW-BASIC environment is a "shell" that parses each line in your BASIC program _as it runs the code_. This is a little slower than _compiled_ languages like C but makes for an easier coding-debugging cycle. You can test your code as you go, just by entering it into the interpreter.

Each line in a GW-BASIC program needs to start with a line number. GW-BASIC uses the line numbers to make sure it executes your program statements in the correct order. With these line numbers, you can later "insert" new program statements between two other statements by giving it a line number that's somewhere in between the other line numbers. For this reason, most BASIC programmers wrote line numbers that went up by tens so that line numbers would go like 10, 20, 30, and so on.

New to GW-BASIC? You can learn about the programming language by reading an online GW-BASIC reference. Microsoft didn't release a programming guide with the GW-BASIC source code, but you can search for one. [Here's one reference][10] that seems to be a copy of the original Microsoft GW-BASIC User's Guide.

Let's start with a simple program to print out a list of random numbers. The `FOR` statement creates a loop over a range of numbers, and `RND(1)` prints a random value between 0 and 1.

![GW-BASIC][11]

Entering our first program
(Jim Hall, [CC-BY SA 4.0][9])

Do you see those highlighted words at the bottom of the screen? Those are keyboard shortcuts that you can access using the "F" keys (or _function_ keys) on your keyboard. For example, F1 will insert the word `LIST` into the GW-BASIC interpreter. The "left arrow" indicates that the shortcut will hit Enter for you, so F2 will enter the `RUN` command and immediately execute it. Let's run the program a few times to see what happens.

![GW-BASIC][12]

The two lists of random numbers are the same
(Jim Hall, [CC-BY SA 4.0][9])

Interestingly, the list of random numbers is the same every time we run the BASIC program. That's because the GW-BASIC random number generator resets every time you execute a BASIC program.

To generate new random numbers every time, we need to "seed" the random number generator with a value. One way to do this is by prompting the user to enter their own seed, then use that value with the `RANDOMIZE` instruction. We can insert those two statements at the top of the program using line numbers 1 and 2. GW-BASIC will automatically add those statements before line 10.

![GW-BASIC][13]

Updating the program
(Jim Hall, [CC-BY SA 4.0][9])

With the random number generator using a new seed, we get a different list of random numbers every time we run our program.

![GW-BASIC][14]

Now the lists of random numbers are different
(Jim Hall, [CC-BY SA 4.0][9])

### "Guess the number" game in GW-BASIC

Whenever I start learning a new programming language, I focus on defining variables, writing a statement, and evaluating expressions. Once I have a general understanding of those concepts, I can usually figure out the rest on my own. Most programming languages have some similarities, so once you know one programming language, learning the next one is a matter of figuring out the unique details and recognizing the differences.

To help me practice a new programming language, I like to write a few test programs. One sample program I often write is a simple "guess the number" game, where the computer picks a number between one and 100 and asks me to guess it. The program loops until I guess correctly.

Let's write a version of this "guess the number" game in GW-BASIC. To start, enter the `NEW` instruction to tell GW-BASIC to forget the previous program and start a new one.

My "guess the number" program first prompts the user to enter a random number seed, then generates a random number between 1 and 100. The `RND(1)` function actually generates a random value between 0 and 1 (actually 0.9999…) so I first multiply `RND(1)` by 100 to get a value between 0 and 99.9999…, then I turn that into an integer (remove everything after the decimal point). Adding 1 gives a number that's between 1 and 100.

The program then enters a simple loop where it prompts the user for a guess. If the guess is too low or too high, the program lets the user know to adjust their guess. The loop continues as long as the user's guess is _not_ the same as the random number picked earlier.

![GW-BASIC][15]

Entering a "guess the number" program
(Jim Hall, [CC-BY SA 4.0][9])

We can run the program by tapping the F2 key. Using a random seed of 1234 generates a completely new random number. It took me six guesses to figure out the secret number was 49.

![GW-BASIC][16]

Guessing the secret number
(Jim Hall, [CC-BY SA 4.0][9])

And that's your first introduction to GW-BASIC programming! Thanks to Microsoft for releasing this great piece of history as open source software, and thanks also to the many open source developers who assembled GW-BASIC so we can run it.

One more thing before I go—It's not obvious how to exit GW-BASIC. The interpreter had a special instruction for that—to quit, enter `SYSTEM` and GW-BASIC will exit back to DOS.

![GW-BASIC][17]

Enter SYSTEM to quit GW-BASIC
(Jim Hall, [CC-BY SA 4.0][9])

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-gw-basic

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/retro_old_unix_computer.png?itok=SYAb2xoW (Old UNIX computer)
[2]: https://en.wikipedia.org/wiki/BASIC#:~:text=BASIC%20(Beginners'%20All%2Dpurpose,at%20Dartmouth%20College%20in%201964.
[3]: https://devblogs.microsoft.com/commandline/microsoft-open-sources-gw-basic/
[4]: https://github.com/microsoft/GW-BASIC
[5]: https://github.com/microsoft/GW-BASIC/blob/master/LICENSE
[6]: https://github.com/tkchia/GW-BASIC
[7]: https://github.com/tkchia/GW-BASIC/releases
[8]: https://opensource.com/sites/default/files/uploads/gwbasic1.png (The GW-BASIC interpreter)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: http://www.antonis.de/qbebooks/gwbasman/index.html
[11]: https://opensource.com/sites/default/files/uploads/gwbasic2.png (Entering our first program)
[12]: https://opensource.com/sites/default/files/uploads/gwbasic3.png (The two lists of random numbers are the same)
[13]: https://opensource.com/sites/default/files/uploads/gwbasic4.png (Updating the program)
[14]: https://opensource.com/sites/default/files/uploads/gwbasic5.png (Now the lists of random numbers are different)
[15]: https://opensource.com/sites/default/files/uploads/guessnum1.png (Entering a "guess the number" program)
[16]: https://opensource.com/sites/default/files/uploads/guessnum2.png (Guessing the secret number)
[17]: https://opensource.com/sites/default/files/uploads/guessnum3.png (Enter SYSTEM to quit GW-BASIC)
