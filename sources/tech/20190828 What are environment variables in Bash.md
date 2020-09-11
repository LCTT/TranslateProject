[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What are environment variables in Bash?)
[#]: via: (https://opensource.com/article/19/8/what-are-environment-variables)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

What are environment variables in Bash?
======
Learn about environment variables in Bash in our miniseries: Variables
in shells.
![x sign ][1]

Environment variables contain information about your login session, stored for the system shell to use when executing commands. They exist whether you’re using Linux, Mac, or Windows. Many of these variables are set by default during installation or user creation.

While environment variables apply to all modern systems, this article specifically addresses environment variables in the Bash shell on Linux, BSD, Mac, and Cygwin.

### Understanding environment variables

Environment variables are no different, technically, than variables. They can be set, recalled, and cleared with exactly the same syntax used for variables. If you’re not used to using variables in Bash, read my [variables in Bash][2] article before continuing.

You don’t often use environment variables directly. They’re referenced by individual applications and daemons as needed. For instance, your home directory is set as an environment variable when you log in. For example, on Linux you can see your **HOME** environment variable's contents like this:


```
$ echo $HOME
HOME=/home/seth
```

On a Mac:


```
$ echo $HOME
HOME=/Users/bogus
```

On Windows:


```
`C:\Users\bogus`
```

You can view all environment variables set on your system with the **env** command. ****The list is long, so pipe the output through **more** to make it easier to read:


```
$ env | more
TERM=xterm-256color
LESSOPEN=||/usr/bin/lesspipe.sh %s
USER=seth
SUDO_EDITOR=emacs
WWW_HOME=<http://mirror.lagoon.nc/pub/slackware/slackware64-current/ChangeLog.txt>
VISUAL=emacs
DISPLAY=:0
PS1=$
XDG_DATA_DIRS=/home/seth/.local/share/flatpak/exports/share/:/var/lib/flatpak/exports/share/:/usr/local/share/:/usr/share/
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/snap/bin:/home/seth/bin:/home/seth/.local/bin:/snap/bin
GDMSESSION=gnome
MAIL=/var/spool/mail/seth
[...]
```

Environment variables can be useful when you want to override default settings, or when you need to manage new settings that your system has no reason to create on its own. For instance, when you type a command, the only reason your computer knows how to _find_ the application corresponding to that command is that the **PATH** environment variable tells it where to look. This variable lists valid directories for your operating system to search for commands, whether that command is [**ls**][3] or [cp][4], or a graphical application like Firefox or [Lutris][5], or anything else.

Different environment variables get used by different systems. Your **PATH** variable is vital to your terminal emulator, for instance, but a lot less significant to, say, Java (which has its own paths, which point to important Java libraries). However, the **USER** variable is used by several systems as a way to identify who is requesting a service. For example, if you’re on a multiuser system and need to check your local mailbox, your mail command knows which mail spool to retrieve based on the **MAIL** and **USER** variables.

### Setting an environment variable

Usually, the installer program, whether it’s **dnf** on Fedora, **apt** on Ubuntu, **brew** on Mac, or a custom installer, updates your environment variables for a new application. Sometimes, though, when you’re installing something outside of your distribution’s intended toolset, you may have to manage an environment variable yourself. Or you might choose to add an environment variable to suit your preferences. If you decide you want to keep some applications in a **bin** folder located in your home directory, then you must add that directory to your **PATH** so your operating system knows to look there for applications to run when you issue a command.

#### Temporary environment variables

You can add a location to your path the way you create throw-away variables. It works, but only as long as the shell you used to modify your system path remains open. For instance, open a Bash shell and modify your system path:


```
$ export PATH=$PATH:/home/seth/bin
```

Confirm the result:


```
$ echo $PATH
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/snap/bin:/home/seth/bin:/home/seth/.local/bin:/snap/bin:/home/seth/bin
```

Close the session:


```
$ exit
```

Open a new one and take a look at the **PATH** variable:


```
$ echo $PATH
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/snap/bin:/home/seth/bin:/home/seth/.local/bin:/snap/bin
```

This variable has reverted to its default state because **PATH** isn’t getting set with each new shell. For that, you must configure your variables to load any time a shell is launched.

#### Permanent environment variables

You can set your own persistent environment variables in your shell configuration file, the most common of which is **~/.bashrc**. If you’re a system administrator managing several users, you can also set environment variables in a script placed in the **/etc/profile.d** directory.

The syntax for setting a variable by configuration file is the same as setting a variable in your shell:


```
export PATH=$PATH:/snap/bin:/home/seth/bin
```

Close the current shell, or else force it to load the updated config:


```
$ . ~/.bashrc
```

Finally, take another look at your system path:


```
$ echo $PATH
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/snap/bin:/home/seth/bin:/home/seth/.local/bin:/snap/bin:/home/seth/bin
```

It is now set correctly to include your additional custom directory.

### Discovering other environment variables

You can create and manipulate environment variables at will, and some applications do just that. This fact means that many of your environment variables aren’t used by most of your applications, and if you add your own arbitrary variables then some could be used by nothing at all. So the question is: How do you find out which environment variables are meaningful?

The answer lies in an application’s documentation. For instance, to find out what options are available to you for your general Bash environment, you can read the Bash documentation. While the Bash man page mentions many important variables, the GNU info page for Bash features two exhaustive lists of useful Bourne Shell and Bash environment variables, and how each is used.

For example, in the info page list:


```
'HISTCONTROL'
     A colon-separated list of values controlling how commands are saved
     on the history list.  If the list of values includes 'ignorespace',
     lines which begin with a space character are not saved in the
     history list.  A value of 'ignoredups' causes lines which match the
     previous history entry to not be saved.  A value of 'ignoreboth' is
     shorthand for 'ignorespace' and 'ignoredups'.
     [...]
```

This output tells you that the **HISTCONTROL** environment variable controls how your Bash history is presented, and what values you can use to customize that experience. In this example, the **ignoredups** value tells the output of the **history** command to ignore duplicate lines.

You can test this one easily. First, issue the same command twice in a row:


```
$ echo "hello world"
hello world
$ echo "hello world"
hello world
```

View your history, or at least the most recent entries:


```
$ history | tail -5
 996  man bash
 997  info bash
 998  echo "hello world"
 999  echo "hello world"
 1000 history
```

You can see that duplicate entries are indeed listed now.

Set a new environment variable in your **.bashrc** file based on what you read in the info page:


```
export HISTCONTROL=$HISTCONTROL:ignorespace:ignoredups
```

Save and then load your new configuration:


```
$ source ~/.bashrc
```

Issue two commands twice in a row:


```
$ echo "hello once"
hello once
$ echo "hello once"
hello once
```

View the most recent entries in your history:


```
$ history | tail -5
 1000 history
 1001 emacs ~/.bashrc
 1002 source ~/.bashrc
 1003 echo "hello once"
 1004 history
```

Duplicate entries are now collapsed into one entry because of your new environment variable, just as the info page specified.

Finding relevant environment variables is usually a matter of reading the documentation for the application you want to affect. Most environment variables are specific to what one application needs to run smoothly. For general entries, your shell’s documentation is the logical place to look. If you write scripts or applications that require new environment variables, be sure to define those variables in your own documentation.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/what-are-environment-variables

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/x_stop_terminate_program_kill.jpg?itok=9rM8i9x8 (x sign )
[2]: https://opensource.com/article/19/8/using-variables-bash
[3]: https://opensource.com/article/19/7/master-ls-command
[4]: https://opensource.com/article/19/8/copying-files-linux
[5]: https://opensource.com/article/18/10/lutris-open-gaming-platform
