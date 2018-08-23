How To Switch Between TTYs Without Using Function Keys In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Switch-Between-TTYs-720x340.png)

This brief guide describes how to switch between TTYs without function keys in Unix-like operating systems. Before going further, we will see what TTY is. As mentioned in an [**answer**][1] in AskUbuntu forum, the word **TTY** came from **T** ele **TY** pewriter. Back in the early days of Unix, the user terminals connected to computers were electromechanical teleprinters or teletypewriters( tty in short). Since then, the name TTY has continued to be used for text-only consoles. Nowadays, all text consoles represents virtual consoles, not physical consoles. The TTY command prints the file name of the terminal connected to standard input.

### Switch Between TTYs In Linux

By default, there are 7 ttys in Linux. They are known as tty1, tty2….. tty7. The 1 to 6 ttys are command line only. The 7th tty is GUI (your X desktop session). You can switch between different TTYs by using **CTRL+ALT+Fn** keys. For example to switch to tty1, we type CTRL+ALT+F1. This is how tty1 looks in Ubuntu 18.04 LTS server.

![](https://www.ostechnix.com/wp-content/uploads/2018/08/tty1.png)

If your system has no X session,

In some Linux editions (Eg. from Ubuntu 17.10 onwards), the login screen now uses virtual console 1 . So, you need to press CTRL+ALT+F3 up to CTRL+ALT+F6 for accessing the virtual consoles. To go back to desktop environment, press CTRL+ALT+F2 or CTRL+ALT+F7 on Ubuntu 17.10 and later.

What we have seen so far is we can easily switch between TTYs using CTRL+ALT+Function_Key(F1-F7). However, if you don’t want to use the functions keys for any reason, there is a simple command named **“chvt”** in Linux.

The “chvt N” command allows you to switch to foreground terminal N, the same as pressing CTRL+ALT+Fn. The corresponding screen is created if it did not exist yet.

Let us see print the current tty:
```
$ tty

```

Sample output from my Ubuntu 18.04 LTS server.

Now let us switch to tty2. To do so, type:
```
$ sudo chvt 2

```

Remember you need to use “sudo” with chvt command.

Now, check the current tty using command:
```
$ tty

```

You will see that the tty has changed now.

Similarly, you can switch to tty3 using “sudo chvt 3”, tty4 using “sudo chvt 4” and so on.

Chvt command can be useful when any one of your function keys doesn’t work.

To view the total number of active virtual consoles, run:
```
$ fgconsole
2

```

As you can see, there are two active VTs in my system.

You can see the next unallocated virtual terminal using command:
```
$ fgconsole --next-available
3

```

A virtual console is unused if it is not the foreground console, and no process has it open for reading or writing, and no text has been selected on its screen.

To get rid of unused VTs, just type:
```
$ deallocvt

```

The above command deallocates kernel memory and data structures for all unused virtual consoles. To put this simply, this command will free all resources connected to the unused virtual consoles.

For more details, refer the respective command’s man pages.
```
$ man tty

$ man chvt

$ man fgconsole

$ man deallocvt

```

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-switch-between-ttys-without-using-function-keys-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://askubuntu.com/questions/481906/what-does-tty-stand-for
