[#]: subject: (3 Linux terminals you need to try)
[#]: via: (https://opensource.com/article/21/2/linux-terminals)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

3 Linux terminals you need to try
======
Linux gives you the ability to choose the terminal interface you
like—not one it imposes.
![4 different color terminal windows with code][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. The ability to choose your own terminal is a big reason to use Linux.

Many people think once you've used one terminal interface, you've used them all. But users who love the terminal know there are minor but important differences between them. This article looks at three of my favorites.

Before diving into them, though, it's important to understand the difference between a shell and a terminal. A terminal (technically a _terminal emulator_, because terminals used to be physical hardware devices) is an application that runs in a window on your desktop. A shell is the engine that's visible to you in a terminal window. Popular shells are [Bash][2], [tcsh][3], and [zsh][4], and they all run in a terminal.

It almost goes without saying on modern Linux, but all the terminals in this article have tabbed interfaces.

### Xfce terminal

![Xfce ][5]

(Seth Kenlon, [CC BY-SA 4.0][6])

The [lightweight Xfce desktop][7] provides a lightweight terminal that nicely balances features with simplicity. It provides access to the shell (as expected), and it has easy access to several important configuration options. You can set which characters break a string when you double-click on text, choose your default character encoding, and disable Alt shortcuts to the terminal's window so that your favorite Bash shortcuts are passed through to the shell. You can also set a font and a new color theme or load a color theme from a list of common presets. It's even got an optional toolbar across the top for easy access to your favorite functions.

For me, Xfce's star feature is how easy it is to vary the background color for each tab you open. This is a priceless option when running a remote shell on a server—it has prevented me from making stupid mistakes by constantly keeping me aware of which tab I'm in.

### rxvt-unicode

![rxvt][8]

(Seth Kenlon, [CC BY-SA 4.0][6])

The [rxvt terminal][9] is my favorite lightweight console. It's got many of the features you'd find in the old-school [xterm][10] terminal emulator but is more extensible. Its configuration is defined in `~/.Xdefaults`, so there's no preferences panel or settings menu—but this makes it very easy to manage and back up your setup. Using some Perl libraries, rxvt has tabs, and through xrdb, it has access to fonts and any color theme you can think of. You can set attributes like `URxvt.urlLancher: firefox` to set what web browser launches when you open URLs, change the look of the scrollbar, modify keyboard shortcuts, and do much more.

The original rxvt didn't support Unicode (because at the time, Unicode didn't exist) but the `rxvt-unicode` (sometimes also called `urxvt`) package provides a patched version with full Unicode support.

I keep rxvt on every computer because it's the best all-purpose terminal for me. It's not necessarily the best terminal for all users (it has no drag-and-drop interface, for instance). Still, for intermediate to advanced users looking for a fast and flexible terminal, rxvt is an easy choice.

### Konsole

![Konsole][11]

(Seth Kenlon, [CC BY-SA 4.0][6])

Konsole, the KDE Plasma desktop's terminal, was the first terminal I used after switching to Linux, so it's the standard to which I hold all others. It does set a high bar. Konsole has all the usual nice features (and then some), such as easy color themes plus profile support, font selection, encoding, detachable tabs, renamable tabs, and so on. But that's to be expected on a modern desktop (at least, it is if your desktop is running Plasma).

Konsole is light-years (or maybe a few months) ahead of other terminals. It can split its window vertically or horizontally. You can copy input to all tabs (as with [tmux][12]). You can set it to monitor itself for either silence or activity and configure notifications. If you use KDE Connect on your Android phone, that means you can get notifications on your mobile when a job finishes! You can save Konsole's output to a text or HTML file, bookmark open tabs, clone tabs, adjust your search settings, and more.

Konsole is a true power user's terminal, yet it's also great for new users. You can drag and drop files into Konsole to change the directory to a specific location on your hard drive or paste in the path or even copy a file to Konsole's current working directory. It makes using the terminal easy, and that's something that translates across all users.

### Try a terminal

Is your aesthetic a dark office and the warm glow of green text against a black background? Or do you prefer a bright sunlit lounge and a soothing ink-black font on a paper-crisp screen? No matter your vision of a perfect computer setup, if you love the efficiency and clarity of communicating with your operating system by typing commands, then Linux has an interface for you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-terminals

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos.png?itok=aOBLy7Ky (4 different color terminal windows with code)
[2]: https://opensource.com/resources/what-bash
[3]: https://opensource.com/article/20/8/tcsh
[4]: https://opensource.com/article/19/9/getting-started-zsh
[5]: https://opensource.com/sites/default/files/uploads/terminal-xfce.jpg (Xfce )
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/article/19/12/xfce-linux-desktop
[8]: https://opensource.com/sites/default/files/uploads/terminal-rxvt.jpg (rxvt)
[9]: https://opensource.com/article/19/10/why-use-rxvt-terminal
[10]: https://opensource.com/article/20/7/xterm
[11]: https://opensource.com/sites/default/files/uploads/terminal-konsole.jpg (Konsole)
[12]: https://opensource.com/article/20/1/tmux-console
