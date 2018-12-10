[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Bring some color to your Linux terminal with lolcat)
[#]: via: (https://opensource.com/article/18/12/linux-toy-lolcat)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)
[#]: url: ( )

Bring some color to your Linux terminal with lolcat
======
With this simple utility, you can add a rainbow of color to the output of any program you want.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-lolcat.png?itok=Es6dYcph)

Today marks the fifth day of the Linux command-line toys advent calendar. If this is your first visit to the series, you might be asking yourself, what’s a command-line toy. Even I'm not quite sure, but generally, it could be a game, or any simple diversion that helps you have fun at the terminal.

It's quite possible that some of you will have seen various selections from our calendar before, but we hope there’s at least one new thing for everyone.

Today's selection, **lolcat** , is the first utility I'm including that wasn't packaged for my Linux distribution, but it was still an easy install. It's a Ruby program that you ought to be able to easily add to your system with the following.

```
$ gem install lolcat
```

After that, simply pipe some text to it to see the output in the colors of the rainbow. For example, using a couple of utilities from earlier days in our advent calendar, try the following:

```
$ fortune | boxes -a c -d parchment | lolcat
```

Depending on what good fortune you have, you'll likely get something like this:
![](https://opensource.com/sites/default/files/uploads/linux-toy-lolcat-parchment.png)

There are a few parameters you can pass to **lolcat** , and rather than repeat them all here, I'd suggest you either visit the **lolcat** [GitHub page][1] or just see them at the terminal by typing **lolcat --help**. But generally, they're helpful to set the spread and frequency of your rainbow, and my personal favorite, enabling animation. Who doesn't like animated rainbow printing at the terminal? Let's try the above again, with a different box (cat-themed, of course) and a cat-appropriate fortune that was in my fortunes list, with the following.

```
fortune -m "nine tails" | boxes -a c -d cat | lolcat -a
```
![](https://opensource.com/sites/default/files/uploads/linux-toy-lolcat-animated.gif)
**lolcat** is open source under a BSD license.

Do you have a favorite command-line toy that you think I ought to profile? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Check out yesterday's toy, [Have a cow at the Linux command line][2], and check back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-lolcat

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://github.com/busyloop/lolcat
[2]: https://opensource.com/article/18/12/linux-toy-cowsay
