[#]: subject: (Linux tips for using GNU Screen)
[#]: via: (https://opensource.com/article/21/4/gnu-screen-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Linux tips for using GNU Screen
======
Learn the basics of terminal multiplexing with GNU Screen, then download
our cheat sheet so you always have the essential shortcuts at hand.
![Terminal command prompt on orange background][1]

To the average user, a terminal window can be baffling and cryptic. But as you learn more about the Linux terminal, it doesn't take long before you realize how efficient and powerful it is. It also doesn't take long for you to want it to be even _more_ efficient, though, and what better way to make your terminal better than to put more terminals into your terminal?

### Terminal multiplexing

One of the many advantages to the terminal is that it's a centralized interface with centralized controls. It's one window that affords you access to hundreds of applications, and all you need to interact with each one of them is a keyboard. But modern computers almost always have processing power to spare, and modern computerists love to multitask, so one window for hundreds of applications can be pretty limiting.

A common answer for this flaw is terminal multiplexing: the ability to layer virtual terminal windows on top of one another and then move between them all. With a multiplexer, you retain your centralized control, but you gain the ability to swap out the interface as you multitask. Better yet, you can split your virtual screens within your terminal so you can have multiple screens up at the same time.

### Choose the right multiplexer

Some terminals offer similar features, with tabbed interfaces and split views, but there are subtle differences. First of all, these terminals' features depend on a graphical desktop environment. Second, many graphical terminal features require mouse interaction or use inconvenient keyboard shortcuts. A terminal multiplexer's features work just as well in a text console as on a graphical desktop, and the keybindings are conveniently designed around common terminal sequences.

There are two popular multiplexers: [tmux][2] and [GNU Screen][3]. They do the same thing and mostly have the same features, although the way you interact with each is slightly different. This article is a getting-started guide for GNU Screen. For information about tmux, read Kevin Sonney's [introduction to tmux][4].

### Using GNU Screen

GNU Screen's basic usage is simple. Launch it with the `screen` command, and you're placed into the zeroeth window in a Screen session. You may hardly notice anything's changed until you decide you need a new prompt.

When one terminal window is occupied with an activity (for instance, you've launched a text editor like [Vim][5] or [Jove][6], or you're processing video or audio, or running a batch job), you can just open a new one. To open a new window, press **Ctrl+A**, release, and then press **c**. This creates a new window on top of your existing window.

You'll know you're in a new window because your terminal appears to be clear of anything aside from its default prompt. Your other terminal still exists, of course; it's just hiding behind the new one. To traverse through your open windows, press **Ctrl+A**, release, and then **n** for _next_ or **p** for _previous_. With just two windows open, **n** and **p** functionally do the same thing, but you can always open more windows (**Ctrl+A** then **c**) and walk through them.

### Split screen

GNU Screen's default behavior is more like a mobile device screen than a desktop: you can only see one window at a time. If you're using GNU Screen because you love to multitask, being able to focus on only one window may seem like a step backward. Luckily, GNU Screen lets you split your terminal into windows within windows.

To create a horizontal split, press **Ctrl+A** and then **s**. This places one window above another, just like window panes. The split space is, however, left unpurposed until you tell it what to display. So after creating a split, you can move into the split pane with **Ctrl+A** and then **Tab**. Once there, use **Ctrl+A** then **n** to navigate through all your available windows until the content you want to be displayed is in the split pane.

You can also create vertical splits with **Ctrl+A** then **|** (that's a pipe character, or the **Shift** option of the **\** key on most keyboards).

### Make GNU Screen your own

GNU Screen uses shortcuts based around **Ctrl+A**. Depending on your habits, this can either feel very natural or be supremely inconvenient because you use **Ctrl+A** to move to the beginning of a line anyway. Either way, GNU Screen permits all manner of customization through the `.screenrc` configuration file. You can change the trigger keybinding (called the "escape" keybinding) with this:


```
`escape ^jJ`
```

You can also add a status line to help you keep yourself oriented during a Screen session:


```
# status bar, with current window highlighted
hardstatus alwayslastline
hardstatus string '%{= kG}[%{G}%H%? %1`%?%{g}][%= %{= kw}%-w%{+b yk} %n*%t%?(%u)%? %{-}%+w %=%{g}][%{B}%m/%d %{W}%C%A%{g}]'
 
# enable 256 colors
attrcolor b ".I"
termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'
defbce on
```

Having an always-on reminder of what window has focus activity and which windows have background activity is especially useful during a session with multiple windows open. It's a sort of task manager for your terminal.

### Download the cheat sheet

When you're learning GNU Screen, you'll have a lot of new keyboard commands to remember. Some you'll remember right away, but the ones you use less often might be difficult to keep track of. You can always access a Help screen within GNU Screen with **Ctrl+A** then **?**, but if you prefer something you can print out and keep by your keyboard, **[download our GNU Screen cheat sheet][7]**.

Learning GNU Screen is a great way to increase your efficiency and alacrity with your favorite [terminal emulator][8]. Give it a try!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/gnu-screen-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://github.com/tmux/tmux/wiki
[3]: https://www.gnu.org/software/screen/
[4]: https://opensource.com/article/20/1/tmux-console
[5]: https://opensource.com/tags/vim
[6]: https://opensource.com/article/17/1/jove-lightweight-alternative-vim
[7]: https://opensource.com/downloads/gnu-screen-cheat-sheet
[8]: https://opensource.com/article/21/2/linux-terminals
