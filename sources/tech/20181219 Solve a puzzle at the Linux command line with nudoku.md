[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Solve a puzzle at the Linux command line with nudoku)
[#]: via: (https://opensource.com/article/18/12/linux-toy-nudoku)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Solve a puzzle at the Linux command line with nudoku
======
Sudokus are simple logic games that can be enjoyed just about anywhere, including in your Linux terminal.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-nudoku.png?itok=OS2o4Rot)

Welcome back to another installment in our 24-day-long Linux command-line toys advent calendar. If this is your first visit to the series, you might be asking yourself what a command-line toy even is. We’re figuring that out as we go, but generally, it could be a game, or any simple diversion that helps you have fun at the terminal.

Some of you will have seen various selections from our calendar before, but we hope there’s at least one new thing for everyone.

Every year for Christmas, my mother-in-law gives my wife a Sudoku calendar. It sits on our coffee table for the year to follow. Each day is a separate sheet (except for Saturday and Sunday, that are combined onto one page), with the idea being that you have a new puzzle every day while also having a functioning calendar.

The problem, in practice, is that it's a great pad of puzzles but not a great calendar because it turns out some days are harder than others and we just don't get through them at the necessary rate of one a day. Then, we may have a week's worth that gets batched on a lazy Sunday.

Since I've already given you a [calendar][1] as a part of this series, I figure it's only fair to give you a Sudoku puzzle as well, except our command-line versions are decoupled so there's no pressure to complete exactly one a day.

I found **nudoku** in my default repositories on Fedora, so installing it was as simple as:

```
$ sudo dnf install nudoku
```

Once installed, just invoke **nudoku** by name to launch it, and it should be fairly self-explanatory from there. If you've never played Sudoku before, it's fairly simple: You need to make sure that each row, each column, and each of the nine 3x3 squares that make up the large square each have one of every digit, 1-9.

You can find **nudoku** 's c source code [on GitHub][2] under a GPLv3 license.
![](https://opensource.com/sites/default/files/uploads/linux-toy-nudoku-animated.gif)
Do you have a favorite command-line toy that you we should have included? Our calendar is basically set for the remainder of the series, but we'd still love to feature some cool command-line toys in the new year. Let me know in the comments below, and I'll check it out. And let me know what you thought of today's amusement.

Be sure to check out yesterday's toy, [Use your Linux terminal to celebrate a banner][3] [year][3], and come back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-nudoku

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/12/linux-toy-cal
[2]: https://github.com/jubalh/nudoku
[3]: https://opensource.com/article/18/12/linux-toy-figlet
