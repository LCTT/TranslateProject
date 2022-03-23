[#]: subject: "Xonsh Shell Combines the Best of Bash Shell and Python in Linux Terminal"
[#]: via: "https://itsfoss.com/xonsh-shell/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Xonsh Shell Combines the Best of Bash Shell and Python in Linux Terminal
======

Which is the most popular shell? I guess you’ll say bash or perhaps zsh and you are right about that.

There are several shells available for UNIX and Linux systems. bash, ksh, zsh, fish and more.

Recently, I came across another shell which offers a unique twist of combining Python and bash.

### Xonsh shell for the Python loving Linux users

[Xonsh][1] is a Python-powered, cross-platform, shell language and command prompt.

It combines Python and bash shell in a way that you can run Python commands directly in the shell. You can even combine Python and shell commands.

![][2]

Sounds good? It may sound even better if you are a Python programmer.

### Installing Xonsh shell on Linux

There are several ways you can install Xonsh shell on your system.

You can install it from your distribution’s package manager (it is available in the repositories of major distributions).

On Ubuntu and Debian, you may try:

```

    sudo apt install xonsh

```

Since it is essentially a Python application, you always have the option to use Pip (if you have pip installed on your system). Conda can also be used for installing Xonsh. There is also an AppImage available along with a Docker image.

You may choose whichever installation method you prefer.

### Experiencing the Xonsh shell

If you are new to the multiple shell concept or the terminal, I suggest reading [my article on terminal introduction][3]. It will help clear numerous things for the Linux beginners.

Quick recap. Your terminal runs a default shell (usually bash shell). If you have other shells installed on your system, you can [easily switch the shells][4].

To enter the Xonsh shell, simply run this command:

```

    xonsh

```

![][5]

It advises you to run a wizard and create a customized rc file for Xonsh shell. It’s optional and you may do it later as well.

You can start feeling a bit of difference as soon as you start using it.

As you start typing a command, Xonsh shell automatically suggests the last matching command from the history. You can press the right arrow key to confirm it and use the auto suggested command. You can press the up and down arrow key to go back to other matching commands from the history.

![Xonsh shell automatically suggests last matching command from the history as you type][6]

That’s not it. The tab completion is interactive here. Start typing the command and press tab and it shows a dropdown kind of interactive menu. From here, you can choose between the available commands.

![Tab completion in Xonsh shell][7]

You can combine the Python and bash commands and run them directly in the shell.

If you are into [terminal customization][8], you can spend some time and effort to customize tab completion, key bindings and color styles as per your preference.

It also has a user generated plugin systems called [Xontrib][9] and you can use them to extend the functionality of the Xonsh shell.

If you are a terminal lover and interested in learning more on it, you can go through its [extensive documentation system][10].

### In the end…

Most users stick with the default bash shell and there is nothing wrong with it. Some developers and sysadmins opt for Zsh for its additional features. Xonsh focuses entirely on Python and it may attract Python users. For the rest of us, bash is good enough.

Have you ever used Xonsh or some other shell? Why do you use it instead of bash? The comment section is all yours.

--------------------------------------------------------------------------------

via: https://itsfoss.com/xonsh-shell/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://xon.sh/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xonsh-shell-combines-python-bash.png?resize=800%2C470&ssl=1
[3]: https://itsfoss.com/basic-terminal-tips-ubuntu/
[4]: https://linuxhandbook.com/change-shell-linux/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xonsh-shell.png?resize=800%2C451&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/auto-suggestions-from-history-in-xonsh-shell.png?resize=800%2C258&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/tab-completion-xonsh-shell.png?resize=800%2C354&ssl=1
[8]: https://itsfoss.com/customize-linux-terminal/
[9]: https://github.com/topics/xontrib
[10]: https://xon.sh/tutorial.html
