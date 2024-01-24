[#]: subject: "Shut Down WSL Running Linux Distributions"
[#]: via: "https://itsfoss.com/shut-down-wsl-distros/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972/lctt-scripts-1705972010"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Shut Down WSL Running Linux Distributions
======

So you are running Linux inside Windows using WSL. And you are wondering how you can shut down the Linux distribution running in WSL.

You can surely [try the shutdown command][1] from within the Linux system running in WSL:

```

    sudo shutdown now

```

You can also shut down Linux systems using WSL commands. It's an excellent method if you have more than one distro running is WSL.

### Shutdown Linux in WSL using Windows Terminal

In this method, I assume that the usual `shutdown` command doesn't work in WSL Linux Systems.

First, open a terminal in windows. Here, I am using Windows 11 with an Ubuntu setup under WSL 2.

![Open a Windows Terminal][2]

💡

You can use the wsl command on a standard Windows terminal. The command is also accessible inside a running Linux distribution. Here, the name of the command is wsl.exe.

Now, you need to list what distros are installed and what are their status. To do this, enter:

```

    wsl --list --verbose

    OR

    wsl -l -v

```

![List Installed Distributions][3]

Here, you can see that, I have one installed WSL Ubuntu, which is currently running.

#### Shutdown all running Linux distributions

There may be times, when you want to stop app the running WSL instances in one go.

In Powershell or Windows Terminal, use this command:

```

    wsl --shutdown

```

This will shut down all sessions.

Also, you can **perform the same function inside any running WSL Linux Distribution terminal**. You just need to use `wsl.exe` instead of `wsl`, while working inside a distribution.

```

    wsl.exe --shutdown

```

![Shut Down All Running WSL Distributions][4]

Once you run this command, all the running WSL distributions will be terminated. The WSL 2 lightweight utility virtual machine is also terminated. **So it will be useful, if you want to restart the WSL 2 virtual machine environment.**

#### Terminate a particular Linux distribution

To terminate a particular running WSL distribution, open a separate Windows terminal and run:

```

    wsl --terminate <Distribution Name>

```

Here, the distribution name is the one you get, when you list all the installed WSL distributions using the `wsl -l -v` ⁣ command.

![List WSL Distributions][5]

```

    wsl --terminate Ubuntu

```

Once executed, the specified Linux distribution will be terminated.

If you are inside another distribution, list all the WSL distros installed on your system using:

```

    wsl.exe -l -v

```

Now, terminate the required distro using:

```

    wsl.exe --terminate <Distribution name>

```

![Shutting down a WSL Distribution from inside another][6]

### Conclusion

Some people just close the running Linux application but I don't think that's very graceful.

Also, like a Linux terminal, you can either use:

  * The `logout` command, to close that distro.
  * The `exit` command to quit that terminal running the Linux distro.
  * Or, press CTRL+D to do the same as exit command.



But the WSL way of shutting down Linux system has the added advantage of doing it for multiple Linux systems.

I hope it helps you.

--------------------------------------------------------------------------------

via: https://itsfoss.com/shut-down-wsl-distros/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/linux-shutdown-command/
[2]: https://itsfoss.com/content/images/2024/01/open-a-terminal-from-start-menu.png
[3]: https://itsfoss.com/content/images/2024/01/list-installed-distributions-and-their-status.png
[4]: https://itsfoss.com/content/images/2024/01/shutdown-all-wsl-distros-within-another-distro.gif
[5]: https://itsfoss.com/content/images/2024/01/list-the-distro-to-terminate-only-that-one.png
[6]: https://itsfoss.com/content/images/2024/01/shutdown-successfully-completed.png
