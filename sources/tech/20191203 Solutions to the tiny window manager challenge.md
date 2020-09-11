[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Solutions to the tiny window manager challenge)
[#]: via: (https://jvns.ca/blog/2019/12/03/solutions-to-the-tiny-window-manager-challenge/)
[#]: author: (Julia Evans https://jvns.ca/)

Solutions to the tiny window manager challenge
======

Hello! Last week I posted a small [programming challenge to write a tiny window manager that bounces windows around the screen][1].

![][2]

I’ll write a bit about my experience of solving the challenge, or you can just skip to the end to see the solutions.

### what’s a window manager?

An X window manager is a program that sends messages to the X server (which is in charge of drawing your windows) to tell it which windows to display and where.

I found out that you can trace those events with `xtrace`. Here’s some example output from xtrace (for the toy window manager which is just moving windows about)

```
000:<:02d8: 20: Request(12): ConfigureWindow window=0x004158e5 values={x=560 y=8}
000:<:02da: 20: Request(12): ConfigureWindow window=0x004158e5 values={x=554 y=12}
000:<:02dc: 20: Request(12): ConfigureWindow window=0x004158e5 values={x=548 y=16}
000:<:02de: 20: Request(12): ConfigureWindow window=0x004158e5 values={x=542 y=20}
000:<:02e0: 20: Request(12): ConfigureWindow window=0x004158e5 values={x=536 y=24}
000:<:02e2: 20: Request(12): ConfigureWindow window=0x004158e5 values={x=530 y=28}
000:<:02e4: 20: Request(12): ConfigureWindow window=0x004158e5 values={x=524 y=32}
```

### you can run programs without a window manager

You technically don’t _need_ a window manager to run graphical programs – if you want to start an xterm in a window-manager-less X session you can just run

```
xterm -display :1
```

and it’ll start the xterm. Here’s a screenshot of an X session with no window manager open. I even have 2 windows open! (chrome and an xterm). It has some major usability problems, for example I don’t think you can resize or move or switch between windows. Which is where the window manager comes in!

<https://jvns.ca/images/no-wm.png>

### move a window with XMoveWindow

The challenge was to make the window bounce around the screen.

In the [tinywm source][3] they use `XMoveResizeWindow` to move and resize windows, but I found in the [docs][4] that there’s also a function called `XMoveWindow`. Perfect!

Here’s what it looks like. What could be simpler, right? And it works just the way I’d expect!

```
XMoveWindow(display, windowID, x, y)
```

Except…

### problem: multiple `XMoveWindow`s don’t work

I ran into a problem (which I got stuck on for a couple of hours) where when I ran XMoveWindow twice, it would only apply the last move.

```
XMoveWindow(display, windowID, 100, 200)
usleep(2000 * 1000); # sleep for 2 seconds
XMoveWindow(display, windowID, 300, 400)
```

I’d expect this to move the window once, wait 2 seconds, and them move it again. But that was not what happened! Instead, it would pause for 2 seconds and then move the window once (to the second location).

### use xtrace to trace window manager events

I used xtrace to trace the events and found out that my `ConfigureWindow` events that `XMoveWindow` was sending were all being sent at the same time. So it seemed like X was batching the events. But why?

### XSync forces X to process events

I didn’t know why this was happening, but I emailed Julian about it and he pointed me in the direction of [XSync][5], which forces X to process all the events you’ve sent it. Sure enough, I used XSync and everything worked beautifully.

### solutions

I asked people to email me if they completed the challenge, and 4 people did! Here are their solutions. All the solutions I got implemented more features than I did, so I’d encourage you to look at all the solutions if you’re interested in how to solve this problem!

  * [Kacper Słomiński’s solution][6] (which uses `XQueryTree` to find the windows to bounce, which is nice)
  * [@whichxyj’s solution][7]
  * [Alexsey Lagoshin’s stressfulwm][8], which allows bouncing multiple windows:
  * [Aldrin Martoq Ahumada’s bouncywm-ruby][9], which is the only solution in a language other than C I got! It uses an Xlib Ruby library that looks pretty straightforward to use.
  * one really nice one with fancier bouncing effects which I’ll post here later if the person sends me the source
  * [my solution][10]



Here’s a gif of Alexsey’s solution. Apparently `XQuartz` on a Mac performs better than Xephyr!

![][11]

And Aldrin’s solution, with a great use of `xeyes`:

![][12]

### thanks!

Thanks to everyone who emailed me a solution, and if you write your own implementation I’d love to post it here too, especially if you write one that isn’t in C or Ruby! I’m [[email protected]][13]

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/12/03/solutions-to-the-tiny-window-manager-challenge/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2019/11/25/challenge--make-a-bouncy-window-manager/
[2]: https://jvns.ca/images/bouncewm.gif
[3]: http://incise.org/tinywm.html
[4]: https://tronche.com/gui/x/xlib/window/XMoveWindow.html
[5]: https://tronche.com/gui/x/xlib/event-handling/XSync.html
[6]: https://gist.github.com/jvns/d5a0a4daf300f3dd7fa76d13b5aa2d53
[7]: https://github.com/whichxjy/bounce-wm/blob/master/bounce-wm.c
[8]: https://github.com/ayzenquwe/stressfulwm
[9]: https://github.com/aldrinmartoq/bouncywm-ruby
[10]: https://gist.github.com/jvns/c7a297fc4e17e797fd7b76b68860e55c
[11]: https://raw.githubusercontent.com/ayzenquwe/stressfulwm/d06531d286a5f00424bf12f7c77b18e11437ff20/gif/example.gif
[12]: https://raw.githubusercontent.com/aldrinmartoq/bouncywm-ruby/f6d424b6107c1349c8ee338b6a46c7116c6d1ea7/demo/demo.gif
[13]: https://jvns.ca/cdn-cgi/l/email-protection
