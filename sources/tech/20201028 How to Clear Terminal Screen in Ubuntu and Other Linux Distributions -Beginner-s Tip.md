[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Clear Terminal Screen in Ubuntu and Other Linux Distributions [Beginner’s Tip])
[#]: via: (https://itsfoss.com/clear-terminal-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Clear Terminal Screen in Ubuntu and Other Linux Distributions [Beginner’s Tip]
======

When you are working in the terminal, often you’ll find that your terminal screen is filled up with too many commands and their outputs.

You may want to clear the terminal to declutter the screen and focus on the next task you are going to perform. Clearing the Linux terminal screen helps a lot, trust me.

### Clear Linux terminal with clear command

So, how do you clear terminal in Linux? The simplest and the most common way is to use the clear command:

```
clear
```

You need no option with the clear command. It’s that simple but there are some additional things you need to know about it.

![][1]

_**The clear command and other methods of clearing screen may depend on the terminal emulator you are using.**_ Terminal emulator is the terminal application that you use for accessing the Linux shell (command line).

If you use clear command on Ubuntu with GNOME Terminal, it will clear the screen and you won’t be able to see what else you had on the screen previously.

In many other terminal emulators or Putty, it may just clear the screen for one page. If you scroll with mouse or PageUp and PageDown keys, you can still access the old screen outputs.

Frankly, it depends on your need. If you suddenly realize that you need to refer to the output of a previously run command, perhaps having that option available will be helpful.

### Other ways to clear terminal screen in Linux

![][2]

Clear command is not the only way to clear the terminal screen.

You can use Ctrl+L [keyboard shortcut in Linux][3] to clear the screen. It works in most terminal emulators.

```
Ctrl+L
```

If you use Ctrl+L and clear command in GNOME terminal (default in Ubuntu), you’ll notice the difference between their impact. Ctrl+L moves the screen one page down giving the illusion of a clean screen but you can still access the command output history by scrolling up.

**Some other terminal emulators have this keyboard shortcut set at Ctrl+Shift+K.**

You can also use reset command for clearing the terminal screen. Actually, this command performs a complete terminal re-initialization. It could take a bit longer than clear command, though.

```
reset
```

There are a couple of other complicated ways to clear the screen when you want to clear the screen completely. But since the command is a bit complicated, it’s better to use it as [alias in Linux][4]:

```
alias cls='printf "\033c"'
```

You can add this alias to your bash profile so that it is available as command.

I know this was a pretty basic topic and most Linux users probably already knew it but it doesn’t harm in covering the elementary topics for the new Linux users. Isn’t it?

Got some secretive tip on clearing terminal screen? Why not share it with us?

--------------------------------------------------------------------------------

via: https://itsfoss.com/clear-terminal-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/clear-command-linux.gif?resize=800%2C432&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/clear-terminal-screen-linux.png?resize=800%2C450&ssl=1
[3]: https://linuxhandbook.com/linux-shortcuts/
[4]: https://linuxhandbook.com/linux-alias-command/
