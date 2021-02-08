[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Challenge: Write a bouncy window manager)
[#]: via: (https://jvns.ca/blog/2019/11/25/challenge--make-a-bouncy-window-manager/)
[#]: author: (Julia Evans https://jvns.ca/)

Challenge: Write a bouncy window manager
======

Hello! I’m writing a short series of programming challenges with [Julian][1], and this is the first one!

### the challenge

![][2]

**requirements**

The goal here is to make a very silly Linux window manager that bounces its windows around the screen, like in the gif above.

**anti-requirements**

The window manager doesn’t need to do anything else! It doesn’t need to support:

  * moving or resizing windows
  * switching between windows
  * minimizing windows
  * literally any of the other things you might normally expect a window manager to do



It turns out implementing this kind of toy window manager is surprisingly approachable!

### the setup: start with tinywm

All the instructions here only work on Linux (since this is about writing a Linux window manager).

**starter kit: tinywm**

Writing a window manager from scratch seems intimidating (at first I didn’t even know how to start!). But then I found **[tinywm][3]**, which is a tiny window manager written in only **50 lines of C**. This is a GREAT starting point and there’s an annotated version of the source code which explains a lot of the details. There’s a Python version of tinywm too, but I wasn’t able to get it to work.

I did this challenge by modifying [tinywm][3] and it worked really well.

**tools**

  * **Xephyr** lets you embed an X session in a window in your regular desktop, so that you can develop your toy window manager without breaking your usual desktop. I ran it like this: `Xephyr -ac -screen 1280x1024 -br -reset -terminate 2> /dev/null :1 &`
  * You can start an xterm in the Xephyr desktop with `xterm -display :1`
  * I compiled my window manager with `gcc bouncewm.c -g -o bouncewm -lX11` and ran it with `env DISPLAY=:1 ./bouncewm`
  * **xtrace** lets you trace all requests to the X windows system that your window manager is making. I found it really helpful when debugging. (run it like `xtrace ./bouncewm`)



**documentation**

Some useful references:

  * the [dwm source code][4] (dwm is a 2000-line-of-C window manager)
  * the [Xlib programming manual][5]



If you’re not comfortable writing C, there are also libraries that let you work with X in other languages. I personally found C easier to use because a lot of the window manager documentation and examples I found were for the Xlib C library.

### my experience: 5 hours, 50 lines of code

To give you a very rough idea of the difficulty of this exercise: I did this in 4 or 5 hours this morning and last night, producing the window manager you see in the gif at the top of the blog post (which is 50 lines of code). I’d never looked at the source code for a window manager before yesterday.

As usual when working with a new library I spent most of that time being confused about various basic things about how X works. (and as a result I learned several new things about X!)

For me this challenge was a fun way to:

  * learn some basics about the X window system protocol (I’ve been using window managers for 15 years, today I got to write one!)
  * research an unfamiliar library (“ooh, what does this function do?”)
  * use a C library, since I don’t usually write C



### send me your solution if you do this!

I’ll post the solution I came up in a week. If you think this window manager challenge sounds fun and end up doing it, I’d love it if you sent me your solution (to [[email protected]][6])!

I’d be delighted to post any solutions you send me in the solutions blog post.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/11/25/challenge--make-a-bouncy-window-manager/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: http://www.cipht.net/2017/10/03/are-jump-tables-always-fastest.html
[2]: https://jvns.ca/images/bouncewm.gif
[3]: http://incise.org/tinywm.html
[4]: https://git.suckless.org/dwm/file/dwm.c.html
[5]: https://tronche.com/gui/x/xlib/
[6]: https://jvns.ca/cdn-cgi/l/email-protection
