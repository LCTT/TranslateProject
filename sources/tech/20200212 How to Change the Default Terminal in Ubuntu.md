[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Change the Default Terminal in Ubuntu)
[#]: via: (https://itsfoss.com/change-default-terminal-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Change the Default Terminal in Ubuntu
======

Terminal is a crucial part of any Linux system. It allows you to access your Linux systems through a shell. There are several terminal applications (technically called terminal emulators) on Linux.

Most of the [desktop environments][1] have their own implementation of the terminal. It may look different and may have different keyboard shortcuts.

For example, [Guake Terminal][2] is extremely useful for power users and provides several features you might not get in your distribution’s terminal by default.

You can install other terminals on your system and use it as default that opens up with the usual [keyboard shortcut of Ctrl+Alt+T][3].

Now the question comes, how do you change the default terminal in Ubuntu. It doesn’t follow the standard way of [changing default applications in Ubuntu][4] then how to do it?

### Change the default terminal in Ubuntu

![][5]

On Debian-based distributions, there is a handy command line utility called [update-alternatives][6] that allows you to handle the default applications.

You can use it to change the default command line text editor, terminal and more. To do that, run the following command:

```
sudo update-alternatives --config x-terminal-emulator
```

It will show all the terminal emulators present on your system that can be used as default. The current default terminal is marked with the asterisk.

```
[email protected]:~$ sudo update-alternatives --config x-terminal-emulator
There are 2 choices for the alternative x-terminal-emulator (providing /usr/bin/x-terminal-emulator).

  Selection    Path                             Priority   Status
------------------------------------------------------------
  0            /usr/bin/gnome-terminal.wrapper   40        auto mode
  1            /usr/bin/gnome-terminal.wrapper   40        manual mode
* 2            /usr/bin/st                       15        manual mode

Press <enter> to keep the current choice[*], or type selection number:
```

All you have to do is to enter the selection number. In my case, I want to use the GNOME terminal instead of the one from [Regolith desktop][7].

```
Press <enter> to keep the current choice[*], or type selection number: 1
update-alternatives: using /usr/bin/gnome-terminal.wrapper to provide /usr/bin/x-terminal-emulator (x-terminal-emulator) in manual mode
```

##### Auto mode vs manual mode

You might have noticed the auto mode and manual mode in the output of update-alternatives command.

If you choose auto mode, your system may automatically decide on the default application as the packages are installed or removed. The decision is influenced by the priority number (as seen in the output of the command in the previous section).

Suppose you have 5 terminal emulators installed on your system and you delete the default one. Now, your system will check which of the emulators are in auto mode. If there are more than one, it will choose the one with the highest priority as the default emulator.

I hope you find this quick little tip useful. Your questions and suggestions are always welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/change-default-terminal-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-desktop-environments/
[2]: http://guake-project.org/
[3]: https://itsfoss.com/ubuntu-shortcuts/
[4]: https://itsfoss.com/change-default-applications-ubuntu/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/switch_default_terminal_ubuntu.png?ssl=1
[6]: https://manpages.ubuntu.com/manpages/trusty/man8/update-alternatives.8.html
[7]: https://itsfoss.com/regolith-linux-desktop/
