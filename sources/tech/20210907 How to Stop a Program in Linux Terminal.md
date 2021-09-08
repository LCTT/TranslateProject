[#]: subject: "How to Stop a Program in Linux Terminal"
[#]: via: "https://itsfoss.com/stop-program-linux-terminal/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Stop a Program in Linux Terminal
======

It’s amusing how the simplest of the things could be complicated when you are new to something.

The other day, I found my friend could not figure out how to exit the top command. Instead of stopping the command, he closed the entire terminal application.

That’s not only unnecessary, it is a not good thing to do.

### Stopping programs in Linux

In Linux, you can use the Ctrl+C keys to stop a running program in the terminal. This works for Ubuntu as well as any other Linux distribution.

Take the ping command for example. If you do not stop it, it will keep on displaying the result.

Hold the Ctrl button and press the C key at the same time. It sends the [SIGKILL signal][1] to the running program to force quit the command.

![Stopping a program in the Linux terminal][2]

Do you see the ^C? The caret (^) means Ctrl. So basically, the terminal shows the Ctrl+C keystrokes as ^C.

The Ctrl+C works very well for the commands that are designed to keep on running until interrupted. You feel like you have to cancel the command, use Ctrl+C.

In a more complicated method, you can [find the process ID and kill a running process][3]. That’s more advanced stuff and used only when the process is running in the background or by another user or in another terminal window.

Apart from that, there are some other commands and command line tools that have their own exit commands. Let me briefly mention some of them here.

#### How to exit Vim editor

[Existing Vim editor][4] has made so many jokes in the Linux world. It is difficult to figure out when you are new to this powerful command line based text editor. Among several ways of quitting vim, the most common is to press the Esc key and then type a colon (:) and then type `q!` for force quit without save or `wq` for save and quit.

![][5]

#### How to exit Nano editor

Quitting the [Nano editor][6] is a bit simpler than exiting Vim. Why? Because Nano mentions the shortcut at the bottom. You may not understand it if you are new to it but at least you’ll be able to figure it out the next time.

To exit Nano, press Ctrl+X. It will ask if you want to save the changes made to the file or not. You can enter your choice.

![][7]

#### How to exit less command

The less is a wonderful command that lets you view without cluttering your terminal screen like the cat command. If you are inside the less command view, use the key `q` to exit less.

#### How to exit the terminal

To exit the terminal itself, instead of closing the terminal, either use Ctrl+D keyboard shortcut or type the exit command:

```
exit
```

This actually exists you from the current shell. When you [open a terminal in Ubuntu][8] or any other Linux distribution, it runs the default shell. When you exit from this shell, terminal ends as well. Ctrl+D is the shortcut to do the same and quit the terminal.

I hope you find this quick tutorial helpful. I highly recommend learning these [Linux command tips][9].

**Recommended Read:**

![][10]

#### [21 Super Handy Linux Command Tips and Tricks That Will Save you a lot of Time and Increase Your Productivity][9]

Questions or suggestions? Please leave a comment below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/stop-program-linux-terminal/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/sigterm-vs-sigkill/#what-is-sigkill
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/stop-a-program-linux-terminal.png?resize=800%2C373&ssl=1
[3]: https://itsfoss.com/how-to-find-the-process-id-of-a-program-and-kill-it-quick-tip/
[4]: https://itsfoss.com/how-to-exit-vim/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2017/05/how-to-exit-vim.png?resize=737%2C422&ssl=1
[6]: https://itsfoss.com/nano-editor-guide/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/nano-editor-save-and-exit.png?resize=799%2C503&ssl=1
[8]: https://itsfoss.com/open-terminal-ubuntu/
[9]: https://itsfoss.com/linux-command-tricks/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/linux-command-tips.png?fit=800%2C450&ssl=1
