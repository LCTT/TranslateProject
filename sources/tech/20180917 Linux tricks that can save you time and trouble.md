Linux tricks that can save you time and trouble
======
Some command line tricks can make you even more productive on the Linux command line.

![](https://images.idgesg.net/images/article/2018/09/boy-jumping-off-swing-100772498-large.jpg)

Good Linux command line tricks don’t only save you time and trouble. They also help you remember and reuse complex commands, making it easier for you to focus on what you need to do, not how you should go about doing it. In this post, we’ll look at some handy command line tricks that you might come to appreciate.

### Editing your commands

When making changes to a command that you're about to run on the command line, you can move your cursor to the beginning or the end of the command line to facilitate your changes using the ^a (control key plus “a”) and ^e (control key plus “e”) sequences.

You can also fix and rerun a previously entered command with an easy text substitution by putting your before and after strings between **^** characters -- as in ^before^after^.

```
$ eho hello world  <== oops!

Command 'eho' not found, did you mean:

 command 'echo' from deb coreutils
 command 'who' from deb coreutils

Try: sudo apt install <deb name>

$ ^e^ec^        <== replace text
echo hello world
hello world

```

### Logging into a remote system with just its name

If you log into other systems from the command line (I do this all the time), you might consider adding some aliases to your system to supply the details. Your alias can provide the username you want to use (which may or may not be the same as your username on your local system) and the identity of the remote server. Use an alias server_name=’ssh -v -l username IP-address' type of command like this:

```
$ alias butterfly=”ssh -v -l jdoe 192.168.0.11”
```

You can use the system name in place of the IP address if it’s listed in your /etc/hosts file or available through your DNS server.

And remember you can list your aliases with the **alias** command.

```
$ alias
alias butterfly='ssh -v -l jdoe 192.168.0.11'
alias c='clear'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias list_repos='grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias show_dimensions='xdpyinfo | grep '\''dimensions:'\'''
```

It's good practice to test new aliases and then add them to your ~/.bashrc or similar file to be sure they will be available any time you log in.

### Freezing and thawing out your terminal window

The ^s (control key plus “s”) sequence will stop a terminal from providing output by running an XOFF (transmit off) flow control. This affects PuTTY sessions, as well as terminal windows on your desktop. Sometimes typed by mistake, however, the way to make the terminal window responsive again is to enter ^q (control key plus “q”). The only real trick here is remembering ^q since you aren't very likely run into this situation very often.

### Repeating commands

Linux provides many ways to reuse commands. The key to command reuse is your history buffer and the commands it collects for you. The easiest way to repeat a command is to type an ! followed by the beginning letters of a recently used command. Another is to press the up-arrow on your keyboard until you see the command you want to reuse and then press enter. You can also display previously entered commands and then type ! followed by the number shown next to the command you want to reuse in the displayed command history entries.

```
!! <== repeat previous command
!ec <== repeat last command that started with "ec"
!76 <== repeat command #76 from command history
```

### Watching a log file for updates

Commands such as tail -f /var/log/syslog will show you lines as they are being added to the specified log file — very useful if you are waiting for some particular activity or want to track what’s happening right now. The command will show the end of the file and then additional lines as they are added.

```
$ tail -f /var/log/auth.log
Sep 17 09:41:01 fly CRON[8071]: pam_unix(cron:session): session closed for user smmsp
Sep 17 09:45:01 fly CRON[8115]: pam_unix(cron:session): session opened for user root
Sep 17 09:45:01 fly CRON[8115]: pam_unix(cron:session): session closed for user root
Sep 17 09:47:00 fly sshd[8124]: Accepted password for shs from 192.168.0.22 port 47792
Sep 17 09:47:00 fly sshd[8124]: pam_unix(sshd:session): session opened for user shs by
Sep 17 09:47:00 fly systemd-logind[776]: New session 215 of user shs.
Sep 17 09:55:01 fly CRON[8208]: pam_unix(cron:session): session opened for user root
Sep 17 09:55:01 fly CRON[8208]: pam_unix(cron:session): session closed for user root
        <== waits for additional lines to be added
```

### Asking for help

For most Linux commands, you can enter the name of the command followed by the option **\--help** to get some fairly succinct information on what the command does and how to use it. Less extensive than the man command, the --help option often tells you just what you need to know without expanding on all of the options available.

```
$ mkdir --help
Usage: mkdir [OPTION]... DIRECTORY...
Create the DIRECTORY(ies), if they do not already exist.

Mandatory arguments to long options are mandatory for short options too.
 -m, --mode=MODE set file mode (as in chmod), not a=rwx - umask
 -p, --parents no error if existing, make parent directories as needed
 -v, --verbose print a message for each created directory
 -Z set SELinux security context of each created directory
 to the default type
 --context[=CTX] like -Z, or if CTX is specified then set the SELinux
 or SMACK security context to CTX
 --help display this help and exit
 --version output version information and exit

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
Full documentation at: <http://www.gnu.org/software/coreutils/mkdir>
or available locally via: info '(coreutils) mkdir invocation'
```

### Removing files with care

To add a little caution to your use of the rm command, you can set it up with an alias that asks you to confirm your request to delete files before it goes ahead and deletes them. Some sysadmins make this the default. In that case, you might like the next option even more.

```
$ rm -i    <== prompt for confirmation
```

### Turning off aliases

You can always disable an alias interactively by using the unalias command. It doesn’t change the configuration of the alias in question; it just disables it until the next time you log in or source the file in which the alias is set up.

```
$ unalias rm
```

If the **rm -i** alias is set up as the default and you prefer to never have to provide confirmation before deleting files, you can put your **unalias** command in one of your startup files (e.g., ~/.bashrc).

### Remembering to use sudo

If you often forget to precede commands that only root can run with “sudo”, there are two things you can do. You can take advantage of your command history by using the “sudo !!” (use sudo to run your most recent command with sudo prepended to it), or you can turn some of these commands into aliases with the required "sudo" attached.

```
$ alias update=’sudo apt update’
```

### More complex tricks

Some useful command line tricks require a little more than a clever alias. An alias, after all, replaces a command, often inserting options so you don't have to enter them and allowing you to tack on additional information. If you want something more complex than an alias can manage, you can write a simple script or add a function to your .bashrc or other start-up file. The function below, for example, creates a directory and moves you into it. Once it's been set up, source your .bashrc or other file and you can use commands such as "md temp" to set up a directory and cd into it.

```
md () { mkdir -p "$@" && cd "$1"; }
```

### Wrap-up

Working on the Linux command line remains one of the most productive and enjoyable ways to get work done on my Linux systems, but a group of command line tricks and clever aliases can make that experience even better.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3305811/linux/linux-tricks-that-even-you-can-love.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
