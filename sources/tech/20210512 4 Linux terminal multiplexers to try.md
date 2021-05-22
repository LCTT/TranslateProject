[#]: subject: (4 Linux terminal multiplexers to try)
[#]: via: (https://opensource.com/article/21/5/linux-terminal-multiplexer)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

4 Linux terminal multiplexers to try
======
Compare tmux, GNU Screen, Konsole, and Terminator to see which is the
best fit for you.
![4 different color terminal windows with code][1]

Linux users generally need a lot of virtual visual space. One terminal window is never enough, so terminals have tabs. One desktop is too constraining, so there are virtual desktops. And sure, application windows can stack, but how much better is it when they tile? Heck, even the back-end text console has F1 to F7 available for flipping back and forth between tasks.

With this much multitasking going on, it's no surprise that somebody invented the concept of a terminal _multiplexer_. This is admittedly a confusing term. In traditional electronics, a "multiplexer" is a component that receives several input signals and forwards the selected one to a single output. A terminal multiplexer does the opposite. It receives instructions from one input (the human at the keyboard typing into one terminal window) and forwards that input to any number of outputs (for example, a group of servers).

Then again, the term "multiplex" is also a term popular in the US for a cinema with many screens (sharing mindshare with the term "cineplex"). In a way, that's pretty descriptive of what a terminal multiplexer can do: It can provide lots of screens within one frame.

Whatever the term means, anybody who's tried a multiplexer has a favorite. So, I decided to take a look at a few of the popular ones to see how each one measures up. In terms of my evaluation criteria, at the bare minimum, I needed each multiplexer to split _and_ stack terminal windows.

### Tmux

![tmux][2]

(Seth Kenlon, [CC BY-SA 4.0][3])

As far as I know, it was tmux that started using the "multiplexer" term. It's great at what it does.

It runs as a daemon so that your terminal session remains active even after you close the terminal emulator you're viewing it in. It splits your terminal screen into panes so that you can open unique terminal prompts in each.

By extension, this means you can also connect remotely to any number of systems and have them open in your terminal, too. Using tmux's ability to mirror (or reverse multiplex, in electronics terms) input to other open panes, it's possible to control several computers at once from one central command pane.

Tmux had vertical splits back when GNU Screen only had horizontal splits, which attracted fans looking for maximum flexibility. And flexibility is what users get with tmux. It can split, stack, select, and serve; there's practically nothing it can't do.

#### 📦 Size

Installing tmux from a package occupies roughly 700K, not counting the dozen shared libraries it depends upon.

#### 🎛️ Control

The default trigger key for tmux is **Ctrl+B**, although it's easy to redefine this in its configuration file.

#### ⌨️ Hacker factor

Even if you're just learning how to use the terminal, you're sure to feel every bit like the hacker you are by using tmux. It looks complex, but once you get to know the right key bindings it's easy to use. It provides you with lots of useful tricks to keep yourself busy, and it's a pretty easy way to construct a quick HUD with all the information you need in front of you.

### GNU Screen

![GNU Screen][4]

(Seth Kenlon, [CC BY-SA 4.0][3])

Like tmux, GNU Screen runs a daemon, so your shell is available even after you close the terminal you use to launch it. You can connect from separate computers and share Screen. It splits your terminal screen into horizontal or vertical panes.

And unlike tmux, GNU Screen can connect over a serial connection (`screen 9600 /dev/ttyUSB0` is all it takes), with key bindings for easy XON and XOFF signals.

It's probably less common to need a multiplexer over a serial connection than over an SSH session, so Screen's really special feature is lost on most users. Still, GNU Screen is a great multiplexer with many useful options, and if you really really need to send signals to multiple servers at once, there are always dedicated tools like ClusterSSH and [Ansible][5].

#### 📦 Size

Installing GNU Screen from a package occupies roughly 970K, not counting the dozen shared libraries it depends upon.

#### 🎛️ Control

The default trigger key for GNU Screen is **Ctrl+A**, which can be particularly annoying for anyone familiar with Bash shortcuts. Luckily, you can easily redefine this trigger in the configuration file.

#### ⌨️ Hacker factor

You'll be the envy of all your hardware hacker friends when using Screen to connect over a serial connection to your router or your prototype circuit board.

### Konsole

![Konsole][6]

(Seth Kenlon, [CC BY-SA 4.0][3])

For not billing itself as a multiplexer, Konsole is a surprisingly effective one. It can do the requisite splitting and stacking of windows using Qt panes and tabs, but it can also echo input from one pane to another (or all) through an option in the **Edit (Copy input to)** menu.

The most notable feature that it lacks, however, is the ability to run as a daemon for remote reconnection. Unlike Tmux and GNU Screen, you can't connect remotely to a machine running Konsole and join the session. For some admins, this may not be an issue. Many admins [VNC][7] to machines more often than they [SSH][8], so "rejoining" a session is as trivial as clicking on the Konsole window in a VNC client.

Using Konsole as a multiplexer is a power move for KDE geeks. Konsole was the first Linux terminal I used (to this day, I sometimes press **Ctrl+N** for a new tab), so having the ability to use this familiar terminal as a multiplexer is a great convenience. It's by no means necessary because tmux and Screen both run inside Konsole anyway, but by letting Konsole handle panes, I don't have to adjust my muscle memory. This kind of subtle feature inclusion is exactly [what makes KDE so great][9].

#### 📦 Size

Konsole itself is roughly 11KB, but it relies on 105 KDE and Qt libraries, so effectively, it's more like 50MB at minimum.

#### 🎛️ Control

Most important Konsole shortcuts start with **Shift+Ctrl**, and that's the case with splitting screens, opening new tabs, copying input to other panes, and so on. It's just Konsole, so if you're comfortable with the Plasma desktop, this feels familiar.

#### ⌨️ Hacker factor

Using Konsole as your multiplexer gives you the right to call yourself a KDE power user.

### Terminator

![Terminator][10]

(Seth Kenlon, [CC BY-SA 4.0][3])

For GNOME users, the Terminator multiplexer is an easy way to add power to their otherwise minimal GNOME terminal. In addition to the requisite multiplex features, Terminator can broadcast input to all open panes, but like Konsole, it can't run in the background so that you can reattach to it over SSH. Then again, with GNOME and Wayland making VNC so easy, it's possible that you won't feel the need to SSH in to continue a terminal session.

If you want it to be, Terminator can be entirely mouse-driven. Konsole has the same ability through its main menu. With Terminator, you can right-click anywhere in your shell and bring up relevant options to split the window horizontally or vertically, group panes together to target them for broadcasts, broadcast input, close panes, and so on. You can also configure keyboard shortcuts for all of these actions, so in many ways, you can build your own experience.

I consider myself mostly a KDE user, so when I say Terminator feels like a K-app, I mean that as a great compliment. Terminator is a surprisingly configurable and flexible application. In many ways, it exemplifies the power of open source by taking the humble GNOME Terminal and transforming it into a powerful multiplexer.

#### 📦 Size

Terminator is 2.2MB to install, most of which are Python modules. It relies on GTK3 and GNOME, though, so if you're not running the full GNOME desktop, you can expect a much larger install for pulling in these dependencies.

#### 🎛️ Control

There's not much consistency in Terminator's default controls. You use the **Alt** key for some commands, **Ctrl** for others, **Shift+Ctrl**, **Ctrl+Alt**, **Shift+Super**, and the mouse. Then again, it's one of the most configurable multiplexers I tried, so with an opinion and a little effort, you can design a schema that works for you.

#### ⌨️ Hacker factor

You'll feel like the most modern and pragmatic of hackers when you use Terminator. With all of its geeky options, it's a great choice for multiplexing, and because it's so flexible you can use it just as easily whether your hands are on your keyboard or split between your keyboard and mouse.

### Choose them all

There are more multiplexers out there and several applications with multiplex-like abilities. You don't have to find the _one_ multiplexer that does everything you need it to do exactly the way you want it done. You're allowed to use more than one. In fact, you can even use more than one at the same time because tmux and Screen are effectively shells, while Konsole and Terminator are terminals that display a shell. The important things are that you feel comfortable with the tools at your fingertips, and they help you manage your workspace so that you can work efficiently.

Go try a multiplexer, or discover multiplex-like features in your favorite application. It might just change the way you view computing.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/linux-terminal-multiplexer

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos.png?itok=aOBLy7Ky (4 different color terminal windows with code)
[2]: https://opensource.com/sites/default/files/uploads/multiplex-tmux.png (tmux)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/multiplex-screen.png (GNU Screen)
[5]: https://opensource.com/article/19/2/quickstart-guide-ansible
[6]: https://opensource.com/sites/default/files/uploads/multiplex-konsole.png (Konsole)
[7]: https://en.wikipedia.org/wiki/Virtual_Network_Computing
[8]: https://en.wikipedia.org/wiki/Secure_Shell_Protocol
[9]: https://opensource.com/article/19/12/linux-kde-plasma
[10]: https://opensource.com/sites/default/files/uploads/multiplex-terminator.png (Terminator)
