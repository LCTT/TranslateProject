[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 ways to split your Linux terminal)
[#]: via: (https://opensource.com/article/20/5/split-terminal)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 ways to split your Linux terminal
======
What's your favorite terminal multiplexer? Take our poll. Then read
about how Linux offers plenty of ways for you to split your terminal so
you can multitask.
![4 different color terminal windows with code][1]

Is there anything better than a warmly flickering Linux terminal?

Sure there is: two warmly flickering Linux terminals. In fact, the more, the better.

Long ago, [terminals were physical devices][2], but of course, today, they're just emulated as an application on your computer. If you prefer the terminal as your interface, you probably know that one terminal is rarely enough. Inevitably, you're going to open a new terminal or a new tab so you can work in it while your first is busy compiling or converting or otherwise processing data.

If you're a sysadmin, then you know you're going to need at least four open windows while you work on several systems at the same time.

Terminal applications with tabs have existed on Linux for a long time, and luckily, that trend seems to have caught on such that it's an expected feature of a modern terminal. And yet, sometimes it's distracting or inconvenient to flip back and forth between tabs.

The only answer is a split screen so that two or more terminals can exist at the same time within just one application window. There are many tools in your Linux kit to help you slice and dice your consoles.

### Shells, terminals, and consoles

Before you slice and dice screens, you should know the difference between a terminal, a shell, and a "console." To get the full picture, read my article on the subject over on the [Enable Sysadmin][2] blog.

The short version:

  * A shell is an input and output screen with a prompt. There's technically a shell running somewhere underneath your [POSIX][3] desktop, even when it's not visible (because it's a shell that launched your user session).
  * A terminal is an application running within a graphics server (such as X11 or Wayland) with a shell loaded into it. A terminal is only running when you have a terminal window launched. It's more or less a "portal" into your shell.
  * "Console" or "virtual console" is a term usually used to imply a shell running outside of your desktop. You can get to a virtual console by pressing **Alt-Ctrl-F2** (more are usually available from **F3** up to **F7**, with **F1** or **F7** representing your desktop, depending on your distribution).



Some applications let you split your shell or console, while others let you split your terminal.

### tmux

![tmux terminal][4]

Arguably the most flexible and capable of screen splitters, [tmux][5] is a keyboard-centric terminal multiplexer, meaning that you can "layer" one console on top of another and then switch between the two. You can also split a console view in half (or thirds or fourths, and so on) so you can see other consoles next to it.

All controls center around the keyboard, which means you never have to take your hand off the keys in search of a mouse, but also that you must learn some new keyboard combos.

If you're using tmux primarily for screen splitting, then the only commands you really need are these:

  * **Ctrl-B %** for a vertical split (one shell on the left, one shell on the right)
  * **Ctrl-B"** for a horizontal split (one shell at the top, one shell at the bottom)
  * **Ctrl-B O** to make the other shell active
  * **Ctrl-B ?** for help
  * **Ctrl-B d** detach from Tmux, leaving it running in the background (use **tmux attach** to reenter)



There are many benefits to tmux, including the ability to start a tmux session on one computer, and then join that same session from another computer remotely. It essentially daemonizes your shell.

It's with tmux running on a Pi, for example, that I can stay logged into IRC on a permanent basis—I start tmux on the Pi, and then log in from whatever computer I happen to be on. When I log out, tmux continues to run, patiently waiting for me to reattach to the session from a different computer.

### GNU Screen

![GNU Screen terminal][6]

Similar to tmux, [GNU Screen][7] is a shell multiplexer. You can detach and reattach from a running session, and you can split the screen both horizontally and vertically.

Screen is a little clunkier than tmux. Its default key binding is **Ctrl-A**, which also happens to be Bash's keyboard shortcut to go to the beginning of a line. This means that if you have Screen running, you must press **Ctrl-A** twice instead of just once to go to the beginning of the line. Personally, I redefine the trigger key to **Ctrl-J** with this line in **$HOME/.screenrc**:


```
`escape ^jJ`
```

Screen's split function works well, but it leaves out a few pleasantries that tmux lacks. For instance, when you split your shell, a new shell does not start in the other panel. You have to navigate to the other space with **Ctrl-A Tab** (or **Ctrl-J** if you redefine your keyboard shortcut as I do) and create a new shell manually with **Ctrl-A C**.

Unlike tmux, a split doesn't go away when you exit a shell, which is a design feature that's quite nice in some instances but can also sometimes be cumbersome because it forces you to manage your splits manually.

Still, Screen is a reliable and flexible application that you can run should you find that **tmux** is unavailable to you.

Here are the basic split commands, using the default keyboard shortcuts:

  * **Ctrl-A |** for a vertical split (one shell on the left, one shell on the right)
  * **Ctrl-A S** for a horizontal split (one shell at the top, one shell at the bottom)
  * **Ctrl-A Tab** to make the other shell active
  * **Ctrl-A ?** for help
  * **Ctrl-A d** detach from Screen, leaving it running in the background (use **screen -r** to reenter)



### Konsole

![Konsole screen][8]

[Konsole][9] is the terminal bundled along with the KDE Plasma desktop. Like KDE itself, Konsole is famous for being highly customizable and powerful.

Among its many features is the ability to split its window, similar to both tmux and GNU Screen. Because Konsole is a graphical terminal, you can control its split-screen feature with your mouse instead of your keyboard.

Splitting is found in the **View** menu of Konsole. You can split your window horizontally or vertically. To change which panel is active, just click on it. Each panel is a unique terminal, so it can have its own theme and tabs.

Unlike tmux and GNU Screen, you can't detach and reattach from Konsole. Like most graphical applications, you use Konsole while you're physically in front of it, and you lose access to it when you're away (unless you use remote desktop software).

### Emacs

![Emacs rpg][10]

Emacs isn't exactly a terminal multiplexer, but its interface supports splitting and resizing, and it has a built-in terminal.

If you're in Emacs on a daily basis anyway, the ability to split your window between essentially different applications means you never have to leave the familiarity and comfort of your favorite text editor. Furthermore, because the Emacs **eshell** module is implemented in eLISP, you can interact with it using the same commands you use in Emacs itself, making it trivial to copy and yank long file paths or command output.

If you're using Emacs in a graphical window, you can perform some actions with your mouse. It's faster to use keyboard shortcuts, and some are more or less required. For instance, you can change which panel is the active one by clicking into it, and you can resize the proportions of your split screen with your mouse.

These are the important keyboard shortcuts:

  * **Ctrl-X 3** for a vertical split (one shell on the left, one shell on the right)
  * **Ctrl-X 2** for a horizontal split (one shell at the top, one shell at the bottom)
  * **Ctrl-X O** to make the other shell active (you can also do this with the mouse)
  * **Ctrl-X 0** (that’s a zero) close the current panel



Similar to tmux and GNU Screen, you can detach and reattach from Emacs as long as you run **emacs-client**.

### Window manager

![Ratpoison split screen][11]

Should you think a text editor that can split its screen and load a terminal is amazing, imagine your desktop serving the same purpose. There are Linux desktops, like [Ratpoison][12], [Herbsluftwm][13], i3, Awesome, and even the KDE Plasma desktop with specific settings enabled, that present each application window to you as a fixed tile in a desktop grid.

Instead of windows floating "above" your desktop, they remain in a predictable place so you can change from one to the other. You can open any number of terminals within your grid, emulating a terminal multiplexer. In fact, you could even load a terminal multiplexer in your desktop multiplexer.

And there's nothing stopping you from loading Emacs with split buffers inside of that. No one knows what happens if you take it further than that, and most Linux users agree it's best not to find out.

Unlike tmux and GNU Screen, you can't detach and reattach from your desktop unless you count using remote desktop software.

### Other options

Believe it or not, these aren't the only options you have to split your screen on Linux. There are other terminal emulators, like [Tilix][14] and Terminator before it, that can split into sections, and applications with embedded terminal components, and much more. Tell us your favorite way of splitting up your workspace in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/split-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos.png?itok=aOBLy7Ky (4 different color terminal windows with code)
[2]: https://www.redhat.com/sysadmin/terminals-shells-consoles
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://opensource.com/sites/default/files/uploads/terminal-split-tmux2.png (tmux terminal)
[5]: https://github.com/tmux/tmux
[6]: https://opensource.com/sites/default/files/uploads/terminal-split-screen.png (GNU Screen terminal)
[7]: https://www.gnu.org/software/screen/
[8]: https://opensource.com/sites/default/files/uploads/konsole.jpg (Konsole screen)
[9]: https://konsole.kde.org
[10]: https://opensource.com/sites/default/files/uploads/emacs-rpg_0.jpg (Emacs rpg)
[11]: https://opensource.com/sites/default/files/uploads/advent-ratpoison-split_0.jpg (Ratpoison split screen)
[12]: https://opensource.com/article/19/12/ratpoison-linux-desktop
[13]: https://opensource.com/article/19/12/herbstluftwm-linux-desktop
[14]: https://gnunn1.github.io/tilix-web/
