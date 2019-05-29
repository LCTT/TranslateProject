[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to manage your Linux environment)
[#]: via: (https://www.networkworld.com/article/3385516/how-to-manage-your-linux-environment.html#tk.rss_all)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何管理你的 Linux 环境
======

### Linux 用户环境变量帮助你找到你需要的命令，获取很多完成的细节，而不需要知道系统如何配置的。 设置来自哪里和如何被修改它们是另一个课题。

![IIP Photo Archive \(CC BY 2.0\)][1]

在 Linux 系统上的用户配置可以用多种方法简化你的使用。你可以运行命令，而不需要知道它们的位置。你可以重新使用先前运行的命令，而不用发愁系统是如何保持它们的踪迹。你可以查看你的电子邮件，查看手册页，并容易地回到你的 home 目录，而不管你在文件系统可能已经迷失方向。并且，当需要的时候，你可以调整你的账户设置，以便它向着你喜欢的方式来工作。

Linux 环境设置来自一系列的文件 — 一些是系统范围（意味着它们影响所有用户账户），一些是配置处于你的 home 目录中文件中。系统范围设置在你登陆时生效，本地设置在以后生效，所以，你在你账户中作出的更改将覆盖系统范围设置。对于 bash 用户，这些文件包含这些系统文件：

```
/etc/environment
/etc/bash.bashrc
/etc/profile
```

和其中一些本地文件：

```
~/.bashrc
~/.profile -- not read if ~/.bash_profile or ~/.bash_login
~/.bash_profile
~/.bash_login
```

你可以修改本地存在的四个文件的任何一个，因为它们处于你的 home 目录，并且它们是属于你的。

**[ 两分钟 Linux 提示：[学习如何在2分钟视频教程中掌握很多 Linux 命令][2] ]**

### 查看你的 Linux 环境设置

为查看你的环境设置，使用 **env** 命令。你的输出将可能与这相似：

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

虽然你可能会得到大量的输出，第一个大部分用颜色显示上面的细节，颜色被用于命令行上来识别各种各样文件类型。当你看到一些东西，像 ***.tar=01;31:** ，这告诉你 tar 文件将以红色显示在文件列表中，然而 ***.jpg=01;35:** 告诉你 jpg 文件将以紫色显现出来。这些颜色本意是使它易于从一个文件列表中分辨出某些文件。你可以在[在 Linux 命令行中自定义你的颜色][3]处学习更多关于这些颜色的定义，和如何自定义它们，

当你更喜欢一种不加装饰的显示时，一种简单关闭颜色方法是使用一个命令，例如这一个：

```
$ ls -l --color=never
```

这个命令可以简单地转换到一个别名：

```
$ alias ll2='ls -l --color=never'
```

你也可以使用 **echo** 命令来单独地显现设置。在这个命令中，我们显示在历史缓存区中将被记忆命令的数量：

```
$ echo $HISTSIZE
1000
```

如果你已经移动，你在文件系统中的最后位置将被记忆。

```
PWD=/home/shs
OLDPWD=/tmp
```

### 作出更改

你可以使用一个像这样的命令更改环境设置的，但是，如果你希望保持这个设置，在你的 ~/.bashrc 文件中添加一行代码，例如 "HISTSIZE=1234" 。

```
$ export HISTSIZE=1234
```

### "export" 一个变量的本意是什么

导出一个变量使设置可用于你的 shell 和可能的子shell。默认情况下，用户定义的变量是本地的，并不被导出到新的进程，例如，子 shell 和脚本。export 命令使变量可用于子进程的函数。

### 添加和移除变量

你可以创建新的变量，并使它们在命令行和子 shell 上非常容易地可用。然而，这些变量将不存活于你的登出和再次回来，除非你也添加它们到 ~/.bashrc 或一个类似的文件。

```
$ export MSG="Hello, World!"
```

如果你需要，你可以使用 **unset** 命令来消除一个变量：

```
$ unset MSG
```

如果变量被局部定义，你可以通过获得你的启动文件来简单地设置它回来。例如：

```
$ echo $MSG
Hello, World!
$ unset $MSG
$ echo $MSG

$ . ~/.bashrc
$ echo $MSG
Hello, World!
```

### 小结

用户账户是为创建一个有用的用户环境，而使用一组恰当的启动文件建立，但是，独立的用户和系统管理员都可以通过编辑他们的个人设置文件（对于用户）或很多来自设置起源的文件（对于系统管理员）来更改默认设置。

Join the Network World communities on 在 [Facebook][4] 和 [LinkedIn][5] 上加入网络世界社区来评论重要话题。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3385516/how-to-manage-your-linux-environment.html#tk.rss_all

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/03/environment-rocks-leaves-100792229-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.networkworld.com/article/3269587/customizing-your-text-colors-on-the-linux-command-line.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
