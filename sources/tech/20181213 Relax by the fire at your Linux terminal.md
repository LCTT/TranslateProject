[#]: collector: (lujun9972)
[#]: translator: (zhs852)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Relax by the fire at your Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-aafire)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

zhs852 is translating.

Relax by the fire at your Linux terminal
======
Chestnuts roasting on an open command prompt? Why not, with this fun Linux toy.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-aafire.png?itok=pAttiVvG)

Welcome back. Here we are, just past the halfway mark at day 13 of our 24 days of Linux command-line toys. If this is your first visit to the series, see the link to the previous article at the bottom of this one, and take a look back to learn what it's all about. In short, our command-line toys are anything that's a fun diversion at the terminal.

Maybe some are familiar, and some aren't. Either way, we hope you have fun.

If you're in the northern hemisphere outside of the tropics, perhaps winter is starting to rear its frigid face outside. At least it is where I live. And some I'd love nothing more than to curl up by the fire with a cup of tea and my favorite book (or a digital equivalent).

The bad news is my house lacks a fireplace. The good news is that I can still pretend, thanks to the Linux terminal and today's command-line toy, **aafire**.

On my system, I found **aafire** packed with **aalib** , a delightful library for converting visual images into the style of ASCII art and making it available at your terminal (or elsewhere). **aalib** enables all sorts of fun graphics at the Linux terminal, so we may revisit a toy or two that make use of it before the end of our series. On Fedora, this meant installation was as simple as:

```
$ sudo dnf install aalib
```

Then, it was simple to launch with the **aafire** command. By default, **aalib** attempted to draw to my GUI, so I had to manually override it to keep my fire in the terminal (this is a command-line series, after all). Fortunately, it comes with a [curses][1] driver, so this meant I just had to run the following to get my fire going:

```
$ aafire -driver curses
```
![](https://opensource.com/sites/default/files/uploads/linux-toy-aafire-animated.gif)
You can find out more about the **aa-lib** library and download the source on [Sourceforge][2], under an LGPLv2 license.

Do you have a favorite command-line toy that you think I ought to include? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Check out yesterday's toy, [Patch into The Matrix at the Linux command line][3] , and check back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-aafire

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Curses_(programming_library)
[2]: http://aa-project.sourceforge.net/aalib/
[3]: https://opensource.com/article/18/12/linux-toy-cmatrix
