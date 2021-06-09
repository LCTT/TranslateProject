[#]: subject: (How FreeDOS boots)
[#]: via: (https://opensource.com/article/21/6/freedos-boots)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How FreeDOS boots
======
An overview of how your computer boots up and starts a simple operating
system like FreeDOS.
![Code going into a computer.][1]

One thing I appreciate from growing up with DOS computers is that the boot process is relatively easy to understand. There aren't a lot of moving parts in DOS. And today, I'd like to share an overview of how your computer boots up and starts a simple operating system like FreeDOS.

### Initial bootstrapping

When you turn on the power to your computer, the system performs several self-checks, such as verifying the memory and other components. This is called the **Power On Self Test** or "POST." After the POST, the computer uses a hard-coded instruction that tells it where to find its instructions to load the operating system. This is the "boot loader," and usually it will try to locate a Master Boot Record or (MBR) on the hard drive. The MBR then loads the primary operating system; in this case, that's FreeDOS.

This process of locating one piece of information so the computer can load the next part of the operating system is called "bootstrapping," from the old expression of "picking yourself up by your bootstraps." It is from this usage that we adopted the term "boot" to mean starting up your computer.

### The kernel

When the computer loads the FreeDOS kernel, one of the first things the kernel does is identify any parameters the user has indicated to use. This is stored in a file called `FDCONFIG.SYS`, stored in the same root directory as the kernel. If `FDCONFIG.SYS` does not exist, then the FreeDOS kernel looks for an alternate file called `CONFIG.SYS`.

If you used DOS in the 1980s or 1990s, you may be familiar with the `CONFIG.SYS` file. Since 1999, FreeDOS looks for `FDCONFIG.SYS` first in case you have a DOS system that is _dual booting_ FreeDOS with some other DOS, such as MS-DOS. Note that MS-DOS only uses the `CONFIG.SYS` file. So if you use the same hard drive to boot both FreeDOS and MS-DOS, MS-DOS uses `CONFIG.SYS` to configure itself, and FreeDOS uses `FDCONFIG.SYS` instead. That way, each can use its own configuration.

`FDCONFIG.SYS` can contain a number of configuration settings, one of which is `SHELL=` or `SHELLHIGH=`. Either one will instruct the kernel to load this program as the interactive shell for the user.

If neither `FDCONFIG.SYS` nor `CONFIG.SYS` exist, then the kernel assumes several default values, including where to find the shell. If you see the message "Bad or missing Command Interpreter" when you boot your FreeDOS system, that means `SHELL=` or `SHELLHIGH=` is pointing to a shell program that doesn't exist on your system.

![Bad or missing Command Interpreter][2]

Jim Hall, CC-BY SA 4.0

You might debug this by looking at the `SHELL=` or `SHELLHIGH=` lines. Failing that, make sure you have a program called `COMMAND.COM` in the root directory of your FreeDOS system. This is the _shell_, which I'll talk about next.

### The shell

The term "shell" on a DOS system usually means a command-line interpreter; an interactive program that reads instructions from the user, then executes them. In this way, the FreeDOS shell is similar to the Bash shell on Linux.

Unless you've asked the kernel to load a different shell using `SHELL=` or `SHELLHIGH=`, the standard command-line shell on DOS is called `COMMAND.COM`. And as `COMMAND.COM` starts up, it also looks for a file to configure itself. By default, `COMMAND.COM` will look for a file called `AUTOEXEC.BAT` in the root directory. `AUTOEXEC.BAT` is a "batch file" that contains a set of instructions that run at startup, and is roughly analogous to the `~/.bashrc` "resource file" that Bash reads when it starts up on Linux.

You can change the shell, and the startup file for the shell, in the `FDCONFIG.SYS` file, with `SHELL=` or `SHELLHIGH=`. The FreeDOS 1.3 RC4 installer sets up the system to read `FDAUTO.BAT` instead of `AUTOEXEC.BAT`. This is for the same reason that the kernel reads an alternate configuration file; you can dual-boot FreeDOS on a hard drive with another DOS. FreeDOS will use `FDAUTO.BAT` while MS-DOS will use `AUTOEXEC.BAT`..

Without a startup file like `AUTOEXEC.BAT`, the shell will simply prompt the user to enter the date and time.

![Without AUTOEXEC.BAT, the shell will prompt for date and time][3]

Jim Hall, CC-BY SA 4.0

And that's it. Once FreeDOS has loaded the kernel, and the kernel has loaded the shell, FreeDOS is ready for the user to type commands.

![FreeDOS is ready for you to enter your first command][4]

Jim Hall, CC-BY SA 4.0

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-boots

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82 (Code going into a computer.)
[2]: https://opensource.com/sites/default/files/uploads/bad-missing-command.png (Bad or missing Command Interpreter)
[3]: https://opensource.com/sites/default/files/uploads/no-autoexec.png (Without AUTOEXEC.BAT, the shell will prompt for date and time)
[4]: https://opensource.com/sites/default/files/uploads/freedos-boot.png (FreeDOS is ready for you to enter your first command)
