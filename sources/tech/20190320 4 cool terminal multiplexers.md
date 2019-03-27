[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 cool terminal multiplexers)
[#]: via: (https://fedoramagazine.org/4-cool-terminal-multiplexers/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

4 cool terminal multiplexers
======

![][1]

The Fedora OS is comfortable and easy for lots of users. It has a stunning desktop that makes it easy to get everyday tasks done. Under the hood is all the power of a Linux system, and the terminal is the easiest way for power users to harness it. By default terminals are simple and somewhat limited. However, a _terminal multiplexer_ allows you to turn your terminal into an even more incredible powerhouse. This article shows off some popular terminal multiplexers and how to install them.

Why would you want to use one? Well, for one thing, it lets you logout of your system while _leaving your terminal session undisturbed_. It’s incredibly useful to logout of your console, secure it, travel somewhere else, then remotely login with SSH and continue where you left off. Here are some utilities to check out.

One of the oldest and most well-known terminal multiplexers is _screen._ However, because the code is no longer maintained, this article focuses on more recent apps. (“Recent” is relative — some of these have been around for years!)

### Tmux

The _tmux_ utility is one of the most widely used replacements for _screen._ It has a highly configurable interface. You can program tmux to start up specific kinds of sessions based on your needs. You’ll find a lot more about tmux in this article published earlier:

> [Use tmux for a more powerful terminal][2]

Already a tmux user? You might like [this additional article on making your tmux sessions more effective][3].

To install tmux, use the _sudo_ command along with _dnf_ , since you’re probably in a terminal already:

```
$ sudo dnf install tmux
```

To start learning, run the _tmux_ command. A single pane window starts with your default shell. Tmux uses a _modifier key_ to signal that a command is coming next. This key is **Ctrl+B** by default. If you enter **Ctrl+B, C** you’ll create a new window with a shell in it.

Here’s a hint: Use **Ctrl+B, ?** to enter a help mode that lists all the keys you can use. To keep things simple, look for the lines starting with _bind-key -T prefix_ at first. These are keys you can use right after the modifier key to configure your tmux session. You can hit **Ctrl+C** to exit the help mode back to tmux.

To completely exit tmux, use the standard _exit_ command or _Ctrl+D_ keystroke to exit all the shells.

### Dvtm

You might have recently seen the Magazine article on [dwm, a dynamic window manager][4]. Like dwm, _dvtm_ is for tiling window management — but in a terminal. It’s designed to adhere to the legacy UNIX philosophy of “do one thing well” — in this case managing windows in a terminal.

Installing dvtm is easy as well. However, if you want the logout functionality mentioned earlier, you’ll also need the _abduco_ package which handles session management for dvtm.

```
$ sudo dnf install dvtm abduco
```

The dvtm utility has many keystrokes already mapped to allow you to manage windows in the terminal. By default, it uses **Ctrl+G** as its modifier key. This keystroke tells dvtm that the following character is going to be a command it should process. For instance, **Ctrl+G, C** creates a new window and **Ctrl+G, X** removes it.

For more information on using dvtm, check out the dvtm [home page][5] which includes numerous tips and get-started information.

### Byobu

While _byobu_ isn’t truly a multiplexer on its own — it wraps _tmux_ or even the older _screen_ to add functions — it’s worth covering here too. Byobu makes terminal multiplexers better for novices, by adding a help menu and window tabs that are slightly easier to navigate.

Of course it’s available in the Fedora repos as well. To install, use this command:

```
$ sudo dnf install byobu
```

By default the _byobu_ command runs _screen_ underneath, so you might want to run _byobu-tmux_ to wrap _tmux_ instead. You can then use the **F9** key to open up a help menu for more information to help you get started.

### Mtm

The _mtm_ utility is one of the smallest multiplexers you’ll find. In fact, it’s only about 1000 lines of code! You might find it helpful if you’re in a limited environment such as old hardware, a minimal container, and so forth. To get started, you’ll need a couple packages.

```
$ sudo dnf install git ncurses-devel make gcc
```

Then clone the repository where mtm lives:

```
$ git clone https://github.com/deadpixi/mtm.git
```

Change directory into the _mtm_ folder and build the program:

```
$ make
```

You might receive a few warnings, but when you’re done, you’ll have the very small _mtm_ utility. Run it with this command:

```
$ ./mtm
```

You can find all the documentation for the utility [on its GitHub page][6].

These are just some of the terminal multiplexers out there. Got one you’d like to recommend? Leave a comment below with your tips and enjoy building windows in your terminal!

* * *

_Photo by _[ _Michael_][7]_ on [Unsplash][8]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-terminal-multiplexers/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/08/tmuxers-4-816x345.jpg
[2]: https://fedoramagazine.org/use-tmux-more-powerful-terminal/
[3]: https://fedoramagazine.org/4-tips-better-tmux-sessions/
[4]: https://fedoramagazine.org/lets-try-dwm-dynamic-window-manger/
[5]: http://www.brain-dump.org/projects/dvtm/#why
[6]: https://github.com/deadpixi/mtm
[7]: https://unsplash.com/photos/48yI_ZyzuLo?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/search/photos/windows?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
