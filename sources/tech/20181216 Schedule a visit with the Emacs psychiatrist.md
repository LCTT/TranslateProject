[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Schedule a visit with the Emacs psychiatrist)
[#]: via: (https://opensource.com/article/18/12/linux-toy-eliza)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Schedule a visit with the Emacs psychiatrist
======
Eliza is a natural language processing chatbot hidden inside of one of Linux's most popular text editors.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-eliza.png?itok=3ioiBik_)

Welcome to another day of the 24-day-long Linux command-line toys advent calendar. If this is your first visit to the series, you might be asking yourself what a command-line toy even is. We’re figuring that out as we go, but generally, it could be a game, or any simple diversion that helps you have fun at the terminal.

Some of you will have seen various selections from our calendar before, but we hope there’s at least one new thing for everyone.

Today's selection is a hidden gem inside of Emacs: Eliza, the Rogerian psychotherapist, a terminal toy ready to listen to everything you have to say.

A brief aside: While this toy is amusing, your health is no laughing matter. Please take care of yourself this holiday season, physically and mentally, and if stress and anxiety from the holidays are having a negative impact on your wellbeing, please consider seeing a professional for guidance. It really can help.

To launch [Eliza][1], first, you'll need to launch Emacs. There's a good chance Emacs is already installed on your system, but if it's not, it's almost certainly in your default repositories.

Since I've been pretty fastidious about keeping this series in the terminal, launch Emacs with the **-nw** flag to keep in within your terminal emulator.

```
$ emacs -nw
```

Inside of Emacs, type M-x doctor to launch Eliza. For those of you like me from a Vim background who have no idea what this means, just hit escape, type x and then type doctor. Then, share all of your holiday frustrations.

Eliza goes way back, all the way to the mid-1960s a the MIT Artificial Intelligence Lab. [Wikipedia][2] has a rather fascinating look at her history.

Eliza isn't the only amusement inside of Emacs. Check out the [manual][3] for a whole list of fun toys.


![Linux toy: eliza animated][5]

Do you have a favorite command-line toy that you think I ought to profile? We're running out of time, but I'd still love to hear your suggestions. Let me know in the comments below, and I'll check it out. And let me know what you thought of today's amusement.

Be sure to check out yesterday's toy, [Head to the arcade in your Linux terminal with this Pac-man clone][6], and come back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-eliza

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://www.emacswiki.org/emacs/EmacsDoctor
[2]: https://en.wikipedia.org/wiki/ELIZA
[3]: https://www.gnu.org/software/emacs/manual/html_node/emacs/Amusements.html
[4]: /file/417326
[5]: https://opensource.com/sites/default/files/uploads/linux-toy-eliza-animated.gif (Linux toy: eliza animated)
[6]: https://opensource.com/article/18/12/linux-toy-myman
