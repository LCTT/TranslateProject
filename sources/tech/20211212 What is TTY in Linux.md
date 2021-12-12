[#]: subject: "What is TTY in Linux?"
[#]: via: "https://itsfoss.com/what-is-tty-in-linux/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is TTY in Linux?
======

You must have heard about the term “TTY” when it comes to Linux and UNIX. But, what is it?

Is it useful to you as a desktop user? Do you need it? And, what can you do with it?

In this article, let me mention everything essential to get you familiar with the term TTY in Linux.

Do note that there’s no definitive answer to this, but it relates to how input/output devices interacted in the past. So, you will have to know a bit of history to get a clear picture.

### History behind the term ‘TTY’

It all starts with a Teleprinter in the 1830s.

Teleprinters let you send/receive text messages over the wire. It was a replacement to Morse code communication, where two operators were needed to effectively communicate with one another.

And, a Teleprinter just needed a single operator to easily convey a message. While it did not have a modern-layout keyboard, its system was later evolved by Donald Murray in 1901 to include a typewriter-like keyboard.

The Murray code reduced the effort for operators to send a message. And, this made it possible for a Teleprinter to evolve as a commercial Teletypewriter in 1908. TTY is shorthand for Teletypewriter.

![Actual Teletypewriter in use during WW2 in London | Image credit Wikimedia][1]

The difference between the a Teletypewriter and a regular typewriter was that Teletypewriter was attached to a communication device to send the typed messaged.

[Teletypewriter made it possible for humans to communicate faster][2] over a wire without any computers until now.

And, this is where “**TTY**” came into existence.

### The (relatively) modern concept

Now, you must be wondering, how did it land into modern computing and in Linux?

Well, for starters, when Teletypewriter hit the market, some years later semiconductor transistors were developed which then evolved into microprocessors making a computer possible.

Initial computers didn’t have the concept of keyboard. Punch cards were the input method.

![A punch card computer program which was inserted into computers instead of typing it via keyboard \(TTY\) | Image credit][3]

While computers were evolving, batch input cards were eventually replaced by Teletypewriters as a convenient input/output device.

![LGP-30 computer in 1956 with a TTY attached to it][4]

With technological advancements, the Teletypewriters were ‘virtualized’ using electronics. So, you wouldn’t need a physical, mechanical TTY, but a virtual, electronic TTY.

Earlier computers didn’t even have video screens. Things were printed on paper instead of displaying on a screen (which didn’t exist). And hence you see the use of term ‘print’, not ‘display’. Videos were added to terminals later as technology advanced.

In other words, you might have heard of them as video terminals. Or, you could call them as “physical” terminals.

And, then these evolved into software emulated terminals which came with enhanced abilities and features.

This is what you call a “terminal emulator”. For instance, GNOME Terminal, or Konsole, these are some of the [best terminal emulators that you will find for Linux][5].

### So, what is TTY in Linux?

When it comes to Linux, TTY is an abstract device in UNIX and Linux. Sometimes it refers to physical input device such as a serial port, and sometimes it refers to a virtual TTY where it allows users to interact with the system ([reference][6]).

TTY is a subsystem in Linux and Unix that makes process management, line editing, and session management possible at the kernel level through TTY drivers.

In terms of programming, you need to dive in deep. But, considering the scope of this article, this could be an easy definition to digest.

If you are curious, you can explore an old resource ([TTY Demystified][7]) that tries to clear up TTY in Linux and Unix systems with all the technical details you need.

In fact, whenever you launch a terminal emulator or use any kind of shell in your system, it interacts with virtual TTYs that are known as psuedo-TTYs or PTY.

You can just type in TTY in your terminal emulator to find the associated PTY.

### How to access TTY in Linux?

![][8]

It is easy to access TTY in Linux. In fact, when I did not have a clue what it was, I accidentally accessed it and panicked about what to do (how to get out from it).

You can get the TTY screen by using the following keyboard shortcuts on most distributions:

**CTRL + ALT + F1** – Lockscreen
**CTRL + ALT + F2** – Desktop Environment
**CTRL + ALT + F3** – TTY3
**CTRL + ALT + F4** – TTY4
**CTRL + ALT + F5** – TT5
**CTRL + ALT + F6** – TTY6

You can access up to six TTYs in total. However, the first two shortcuts point to the distribution’s lock screen and the desktop environment.

![][9]

So, you get a command line interface with the rest of the shortcuts.

### When whould uou use TTY in Linux?

TTY is not just a technical treasure. It is useful even for users like me who aren’t developers.

It should come in handy in case the graphical desktop environment freezes. In some cases, reinstalling the desktop environment from the TTY helps resolve the program.

Or, you can also choose to carry out tasks in TTY like updating the Linux system and similar, where you do not want visual issues to interrupt your process.

Worst-case scenario, you can go to the TTY and reboot the computer if your graphical user interface is unresponsive.

Some users also prefer to perform large file transfers with the help of TTY (I am not one of them).

### TTY as a command in Linux

![][10]

When you type in TTY in your terminal emulator, it will print the file name of the terminal connected to the standard input, as described by the man page.

In other words, to know the TTY number you are connected, just type in TTY. And, if there are multiple users connected to the Linux machine remotely, you can use who command to check what other users are connected to.

--------------------------------------------------------------------------------

via: https://itsfoss.com/what-is-tty-in-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/WACsOperateTeletype.jpg?resize=429%2C371&ssl=1
[2]: https://en.wikipedia.org/wiki/Teletype_Corporation#/media/File:What-is-teletype.jpg
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/punch-card-program.jpg?resize=600%2C274&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/LGP-30-early-computer-1956.jpg?resize=800%2C600&ssl=1
[5]: https://itsfoss.com/linux-terminal-emulators/
[6]: https://unix.stackexchange.com/questions/4126/what-is-the-exact-difference-between-a-terminal-a-shell-a-tty-and-a-con
[7]: https://www.linusakesson.net/programming/tty/index.php
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/ubuntu-tty.png?resize=800%2C449&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/ubuntu-tty4.png?resize=420%2C124&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/ubuntu-terminal-tty-command.png?resize=800%2C544&ssl=1
