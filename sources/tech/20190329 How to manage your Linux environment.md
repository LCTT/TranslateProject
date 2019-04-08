[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to manage your Linux environment)
[#]: via: (https://www.networkworld.com/article/3385516/how-to-manage-your-linux-environment.html#tk.rss_all)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to manage your Linux environment
======

### Linux user environments help you find the command you need and get a lot done without needing details about how the system is configured. Where the settings come from and how they can be modified is another matter.

![IIP Photo Archive \(CC BY 2.0\)][1]

The configuration of your user account on a Linux system simplifies your use of the system in a multitude of ways. You can run commands without knowing where they're located. You can reuse previously run commands without worrying how the system is keeping track of them. You can look at your email, view man pages, and get back to your home directory easily no matter where you might have wandered off to in the file system. And, when needed, you can tweak your account settings so that it works even more to your liking.

Linux environment settings come from a series of files — some are system-wide (meaning they affect all user accounts) and some are configured in files that are sitting in your home directory. The system-wide settings take effect when you log in and local ones take effect right afterwards, so the changes that you make in your account will override system-wide settings. For bash users, these files include these system files:

```
/etc/environment
/etc/bash.bashrc
/etc/profile
```

And some of these local files:

```
~/.bashrc
~/.profile -- not read if ~/.bash_profile or ~/.bash_login
~/.bash_profile
~/.bash_login
```

You can modify any of the local four that exist, since they sit in your home directory and belong to you.

**[ Two-Minute Linux Tips:[Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

### Viewing your Linux environment settings

To view your environment settings, use the **env** command. Your output will likely look similar to this:

```
$ env
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;
01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:
*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:
*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:
*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;
31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:
*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:
*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:
*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:
*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:
*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:
*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:
*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:
*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:
*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:
*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:
*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:
*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.spf=00;36:
SSH_CONNECTION=192.168.0.21 34975 192.168.0.11 22
LESSCLOSE=/usr/bin/lesspipe %s %s
LANG=en_US.UTF-8
OLDPWD=/home/shs
XDG_SESSION_ID=2253
USER=shs
PWD=/home/shs
HOME=/home/shs
SSH_CLIENT=192.168.0.21 34975 22
XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/snapd/desktop
SSH_TTY=/dev/pts/0
MAIL=/var/mail/shs
TERM=xterm
SHELL=/bin/bash
SHLVL=1
LOGNAME=shs
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
XDG_RUNTIME_DIR=/run/user/1000
PATH=/home/shs/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
LESSOPEN=| /usr/bin/lesspipe %s
_=/usr/bin/env
```

While you're likely to get a _lot_ of output, the first big section shown above deals with the colors that are used on the command line to identify various file types. When you see something like ***.tar=01;31:** , this tells you that tar files will be displayed in a file listing in red, while ***.jpg=01;35:** tells you that jpg files will show up in purple. These colors are meant to make it easy to pick out certain files from a file listing. You can learn more about these colors are defined and how to customize them at [Customizing your colors on the Linux command line][3].

One easy way to turn colors off when you prefer a simpler display is to use a command such as this one:

```
$ ls -l --color=never
```

That command could easily be turned into an alias:

```
$ alias ll2='ls -l --color=never'
```

You can also display individual settings using the **echo** command. In this command, we display the number of commands that will be remembered in our history buffer:

```
$ echo $HISTSIZE
1000
```

Your last location in the file system will be remembered if you've moved.

```
PWD=/home/shs
OLDPWD=/tmp
```

### Making changes

You can make changes to environment settings with a command like this, but add a line lsuch as "HISTSIZE=1234" in your ~/.bashrc file if you want to retain this setting.

```
$ export HISTSIZE=1234
```

### What it means to "export" a variable

Exporting a variable makes the setting available to your shell and possible subshells. By default, user-defined variables are local and are not exported to new processes such as subshells and scripts. The export command makes variables available to functions to child processes.

### Adding and removing variables

You can create new variables and make them available to you on the command line and subshells quite easily. However, these variables will not survive your logging out and then back in again unless you also add them to ~/.bashrc or a similar file.

```
$ export MSG="Hello, World!"
```

You can unset a variable if you need by using the **unset** command:

```
$ unset MSG
```

If the variable is defined locally, you can easily set it back up by sourcing your startup file(s). For example:

```
$ echo $MSG
Hello, World!
$ unset $MSG
$ echo $MSG

$ . ~/.bashrc
$ echo $MSG
Hello, World!
```

### Wrap-up

User accounts are set up with an appropriate set of startup files for creating a userful user environment, but both individual users and sysadmins can change the default settings by editing their personal setup files (users) or the files from which many of the settings originate (sysadmins).

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3385516/how-to-manage-your-linux-environment.html#tk.rss_all

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/03/environment-rocks-leaves-100792229-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.networkworld.com/article/3269587/customizing-your-text-colors-on-the-linux-command-line.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
