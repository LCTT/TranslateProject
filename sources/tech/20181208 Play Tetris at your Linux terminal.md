[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Play Tetris at your Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-tetris)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Play Tetris at your Linux terminal
======

Recreate the magic of the 1980s with everyone's favorite tile-matching game, Tetris.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-tetris.png?itok=_UXtpgzN)

Thanks for joining us for today's installment of the Linux command-line toys advent calendar. If this is your first visit to the series, you might be asking yourself, what’s a command-line toy. Even I'm not quite sure, but generally, it could be a game or any simple diversion that helps you have fun at the terminal.

It's quite possible that some of you will have seen various selections from our calendar before, but we hope there’s at least one new thing for everyone.

I promised when I started this series I'd be including games, but so far I've neglected to, so let's fix that with today's selection: Tetris.

Tetris and I are almost exactly the same age, having first come into the world in the summer of 1984. Instead of rural North Carolina, though, Tetris originated in Moscow in what was at the time the Soviet Union.

After taking the world by storm, Tetris was cloned many, many times. I would suspect you could find a Tetris clone for just about any operating system in any language you looked for. Seriously, go look. There are some fun ones out there.

The [version][1] I'm bringing you for today's command-line toy is [written in Haskell,][1] and it's one of the better-done versions I've seen, with on-screen preview, score, help, and a clean look.

If you're willing to run a compiled binary from an untrusted source (I wouldn't recommend it), you can grab that directly, but for a safer approach, it's also easy to use a containerized version with [dex][2], or to install from source with [stack][3].

This particular Tetris clone is by Sam Tay and available under a BSD license. [Check it out][1]!

![](https://opensource.com/sites/default/files/uploads/linux-toy-tetris-animated.gif)

If you've got your own favorite Tetris clone (or maybe you've written your own?), let us know!

Do you have a favorite command-line toy that you think I ought to profile? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Check out yesterday's toy, [Plan your own holiday calendar at the Linux command line][4], and check back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-tetris

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://github.com/samtay/tetris
[2]: https://github.com/dockerland/dex
[3]: https://docs.haskellstack.org/en/stable/README/#how-to-install
[4]: https://opensource.com/article/18/12/linux-toy-cal
