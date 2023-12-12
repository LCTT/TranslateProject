[#]: subject: "Bored With Bash? Change the Default Shell in Linux"
[#]: via: "https://itsfoss.com/linux-change-default-shell/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Bored With Bash? Change the Default Shell in Linux
======

Bash is not the only shell out there. There are many other shells available with slightly different feature sets. A few examples are Zsh, Fish, Ksh are [Xonsh][1].

You can have more than one shell installed on your system at any given time.

If you want to choose some other shell as your default, you can use the chsh command in this fashion:

```

    chsh -s path_to_binary_of_shell

```

You can get the path of the binary of the shell by displaying the contents of the `/etc/shells` file. You may also use the command below that automatically gets the binary of the desired shell with the which command:

```

    chsh -s $(which new_shell)

```

Let's see things about knowing and changing shells a bit more in detail here.

### How to know which shell are you using currently?

There are a few ways to figure out which shell is being used currently, although the accuracy of these methods can be debatable by the experts.

The simplest and most common way is to use:

```

    echo $0

```

[$0 is a special shell variable][2] that gets you the name of the shell or shell script (if you are using it in a script).

![][3]

Another method is to use check the process using:

```

    ps -p $$

```

Here, `$$` gives you the process ID of the current process/shell.

![][4]

### How to install another shell?

Well, like any other software package. Most of the popular shells, like [Fish][5] and Zsh, are available from your distribution's repository and can be installed easily. The newer, lesser-known shells, like Xonsh, may have a different installation instruction. You can get that from the project's web page.

Let's say you want to [install Zsh on Ubuntu][6]. Use:

```

    sudo apt install zsh

```

### How to change the current shell?

Now that you have installed another shell, let's see about changing it.

Most likely, you just have to enter the name of the shell. Say, you have to switch to Zsh:

```

    zsh

```

To exit from the current shell, enter exit and you'll be back to the default shell.

### How to know the default shell?

There is this `SHELL` environment variable that tells you the default shell for the current user:

```

    echo $SHELL

```

Let's take this example where I switched to Zsh. The current shell shows to zsh and the default shell remains bash:

![][7]

This tells you that changing the shell won't change the default shell. Which means the next time you log into the terminal/system, you'll be back to the old default shell instead of the newly one.

### How to know the available shells on your system?

You can see the available shells in your system by looking at the content of the `/etc/shells`:

```

    cat /etc/shells

```

Here are the presently available shells in my system:

![][8]

### How to change the default shell?

The contents of the `/etc/shells` file shows the location of binaries of the available shell. You have to use it with the chsh command.

Let's say, I want to make the Zsh shell the default. Here's what I use:

```

    chsh -s /usr/bin/zsh

```

**Log out and log in again** to see the changes.

Note that this will change the default shell of the current user. If you are an admin and want to change the default shell for another user, use:

```

    sudo chsh -s /usr/bin/zsh other_username

```

### Conclusion

Linux is all about choices. You have the liberty to make changes as you wish. This is another example where you are not bound by the choice of the default shell your distribution provides. You can change the shell to the one you prefer. Enjoy 😄

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-change-default-shell/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/xonsh-shell/
[2]: https://linuxhandbook.com/bash-dollar-0/
[3]: https://itsfoss.com/content/images/2023/12/check-default-shell.png
[4]: https://itsfoss.com/content/images/2023/12/check-current-shell.png
[5]: https://fishshell.com/
[6]: https://itsfoss.com/zsh-ubuntu/
[7]: https://itsfoss.com/content/images/2023/12/current-shell-default-shell-1.png
[8]: https://itsfoss.com/content/images/2023/12/available-shells-1.png
