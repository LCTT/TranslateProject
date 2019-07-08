[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage your shell environment)
[#]: via: (https://fedoramagazine.org/manage-your-shell-environment/)
[#]: author: (Eduard Lucena https://fedoramagazine.org/author/x3mboy/)

Manage your shell environment
======

![][1]

Some time ago, the Fedora Magazine has published an [article introducing ZSH][2] — an alternative shell to Fedora’s default, bash. This time, we’re going to look into customizing it to use it in a more effective way. All of the concepts shown in this article also work in other shells such as bash.

### Alias

Aliases are shortcuts for commands. This is useful for creating short commands for actions that are performed often, but require a long command that would take too much time to type. The syntax is:

```
$ alias yourAlias='complex command with arguments'
```

They don’t always need to be used for shortening long commands. Important is that you use them for tasks that you do often. An example could be:

```
$ alias dnfUpgrade='dnf -y upgrade'
```

That way, to do a system upgrade, I just type dnfUpgrade instead of the whole dnf command.

The problem of setting aliases right in the console is that once the terminal session is closed, the alias would be lost. To set them permanently, resource files are used.

### Resource Files

Resource files (or rc files) are configuration files that are loaded per user in the beginning of a session or a process (when a new terminal window is opened, or a new program like vim is started). In the case of ZSH, the resource file is _.zshrc_, and for bash it’s _.bashrc_.

To make the aliases permanent, you can either put them in your resource. You can edit your resource file with a text editor of your choice. This example uses vim:

```
$ vim $HOME/.zshrc
```

Or for bash:

```
$ vim $HOME/.bashrc
```

Note that the location of the resource file is specified relatively to a home directory — and that’s where ZSH (or bash) are going to look for the file by default for each user.

Other option is to put your configuration in any other file, and then source it:

```
$ source /path/to/your/rc/file
```

Again, sourcing it right in your session will only apply it to the session, so to make it permanent, add the source command to your resource file. The advantage of having your source file in a different location is that you can source it any time. Or anywhere which is especially useful in shared environments.

### Environment Variables

Environment variables are values assigned to a specific name which can be then called in scripts and commands. They start with the $ dollar sign. One of the most common is $HOME that references the home directory.

As the name suggests, environment variables are a part of your environment. Set a variable using the following syntax:

```
$ http_proxy="http://your.proxy"
```

And to make it an environment variable, export it with the following command:

```
$ export $http_proxy
```

To see all the environment variables that are currently set, use the _env_ command:

```
$ env
```

The command outputs all the variables available in your session. To demonstrate how to use them in a command, try running the following echo commands:

```
$ echo $PWD
/home/fedora
$ echo $USER
fedora
```

What happens here is variable expansion — the value stored in the variable is used in your command.

Another useful variable is _$PATH_, that defines directories that your shell uses to look for binaries.

### The $PATH variable

There are many directories, or folders (the way they are called in graphical environments) that are important to the OS. Some directories are set to hold binaries you can use directly in your shell. And these directories are defined in the $PATH variable.

```
$ echo $PATH
/usr/lib64/qt-3.3/bin:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/usr/libexec/sdcc:/usr/libexec/sdcc:/usr/bin:/bin:/sbin:/usr/sbin:/opt/FortiClient
```

This will help you when you want to have your own binaries (or scripts) accessible in the shell.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/manage-your-shell-environment/

作者：[Eduard Lucena][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/x3mboy/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/05/manage-shell-env-816x345.jpg
[2]: https://fedoramagazine.org/set-zsh-fedora-system/
