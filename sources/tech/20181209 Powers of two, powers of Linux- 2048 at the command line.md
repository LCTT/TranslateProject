[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Powers of two, powers of Linux: 2048 at the command line)
[#]: via: (https://opensource.com/article/18/12/linux-toy-2048)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Powers of two, powers of Linux: 2048 at the command line
======
Looking for a terminal-based game to pass the time? Look no further than 2048-cli.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-2048.png?itok=3M6S-n1a)

Hello and welcome to today's installment of the Linux command-line toys advent calendar. Every day, we look at a different toy for your terminal: it could be a game or any simple diversion that helps you have fun.

Maybe you have seen various selections from our calendar before, but we hope there’s at least one new thing for everyone.

Today's toy is a [command-line version][1] of one of my all-time favorite casual games, [2048][2] (which itself is a clone of another clone).

To play, you just slide blocks up, down, left, and right to combine matching pairs and increment numbers, until you've made a block that is 2048 in size. The catch (and the challenge), is that you can't just move one block; instead, you move every block on the screen.

It's simple, fun, and easy to get lost in it for hours. This 2048 clone, [2048-][1][cli][1], is by Marc Tiehuis and written in C, and made available as open source under an MIT license. You can find the source code [on GitHub][1], where you can also get installation instructions for your platform. Since it was packaged for Fedora, for me, installing it was as simple as:

```
$ sudo dnf install 2048-cli
```

That's it, have fun!

![](https://opensource.com/sites/default/files/uploads/linux-toy-2048-animated_0.gif)

Do you have a favorite command-line toy that you think I ought to profile? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Check out yesterday's toy, [Play Tetris at your Linux terminal][3], and check back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-2048

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://github.com/tiehuis/2048-cli
[2]: https://github.com/gabrielecirulli/2048
[3]: https://opensource.com/article/18/12/linux-toy-tetris
