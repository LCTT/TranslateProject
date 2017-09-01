六个优雅的 Linux 命令行技巧
============================================================

> 一些非常有用的命令能让命令行的生活更满足

![command key keyboard](https://images.idgesg.net/images/article/2017/08/commands-micah_elizabeth_scott-cropped-100733439-large.jpg)

使用 Linux 命令工作可以获得许多乐趣，但是如果您使用一些命令，它们可以减少您的工作或以有趣的方式显示信息时，您将获得更多的乐趣。在今天的文章中，我们将介绍六个命令，它们可能会使你用在命令行上的时间更加值当。

### watch

`watch` 命令会重复运行您给出的任何命令，并显示输出。默认情况下，它每两秒运行一次命令。命令的每次运行都将覆盖上一次运行时显示的内容，因此您始终可以看到最新的数据。

您可能会在等待某人登录时使用它。在这种情况下，您可以使用 `watch who` 命令或者 `watch -n 15 who` 命令使每 15 秒运行一次，而不是两秒一次。另外终端窗口的右上角会显示日期和时间。

```
$ watch -n 5 who
Every 5.0s: who                               stinkbug: Wed Aug 23 14:52:15 2017

shs      pts/0        2017-08-23 14:45 (192.168.0.11)
zoe      pts/1        2017-08-23 08:15 (192.168.0.19)
```

您也可以使用它来查看日志文件。如果您显示的数据没有任何变化，则只有窗口角落里的日期和时间会发生变化。

```
$ watch tail /var/log/syslog
Every 2.0s: tail /var/log/syslog              stinkbug: Wed Aug 23 15:16:37 2017

Aug 23 14:45:01 stinkbug CRON[7214]: (root) CMD (command -v debian-sa1 > /dev/nu
ll && debian-sa1 1 1)
Aug 23 14:45:17 stinkbug systemd[1]: Started Session 179 of user shs.
Aug 23 14:55:01 stinkbug CRON[7577]: (root) CMD (command -v debian-sa1 > /dev/nu
ll && debian-sa1 1 1)
Aug 23 15:05:01 stinkbug CRON[7582]: (root) CMD (command -v debian-sa1 > /dev/nu
ll && debian-sa1 1 1)
Aug 23 15:08:48 stinkbug systemd[1]: Starting Cleanup of Temporary Directories...
Aug 23 15:08:48 stinkbug systemd-tmpfiles[7584]: [/usr/lib/tmpfiles.d/var.conf:1
4] Duplicate line for path "/var/log", ignoring.
Aug 23 15:08:48 stinkbug systemd[1]: Started Cleanup of Temporary Directories.
Aug 23 15:13:41 stinkbug systemd[1]: Started Session 182 of user shs.
Aug 23 15:14:29 stinkbug systemd[1]: Started Session 183 of user shs.
Aug 23 15:15:01 stinkbug CRON[7828]: (root) CMD (command -v debian-sa1 > /dev/nu
ll && debian-sa1 1 1)
```

这里的输出和使用命令 `tail -f /var/log/syslog` 的输出相似。

### look

这个命令的名字 `look` 可能会让我们以为它和 `watch` 做类似的事情，但其实是不同的。`look` 命令用于搜索以某个特定字符串开头的单词。

```
$ look ecl
eclectic
eclectic's
eclectically
eclecticism
eclecticism's
eclectics
eclipse
eclipse's
eclipsed
eclipses
eclipsing
ecliptic
ecliptic's
```

`look` 命令通常有助于单词的拼写，它使用 `/usr/share/dict/words` 文件，除非你使用如下的命令指定了文件名：

```
$ look esac .bashrc
esac
esac
esac
```

在这种情况下，它的作用就像跟在一个 `awk` 命令后面的 `grep` ，只打印匹配行上的第一个单词。

### man -k

`man -k` 命令列出包含指定单词的手册页。它的工作基本上和 `apropos` 命令一样。

```
$ man -k logrotate
dh_installlogrotate (1) - install logrotate config files
logrotate (8)        - rotates, compresses, and mails system logs
logrotate.conf (5)   - rotates, compresses, and mails system logs
```

### help

当你完全绝望的时候，您可能会试图使用此命令，`help` 命令实际上是显示一个 shell 内置命令的列表。最令人惊讶的是它有相当多的参数变量。你可能会看到这样的东西，然后开始想知道这些内置功能可以为你做些什么：
```
$ help
GNU bash, version 4.4.7(1)-release (i686-pc-linux-gnu)
These shell commands are defined internally.  Type `help' to see this list.
Type `help name' to find out more about the function `name'.
Use `info bash' to find out more about the shell in general.
Use `man -k' or `info' to find out more about commands not in this list.

A star (*) next to a name means that the command is disabled.

 job_spec [&]                            history [-c] [-d offset] [n] or hist>
 (( expression ))                        if COMMANDS; then COMMANDS; [ elif C>
 . filename [arguments]                  jobs [-lnprs] [jobspec ...] or jobs >
 :                                       kill [-s sigspec | -n signum | -sigs>
 [ arg... ]                              let arg [arg ...]
 [[ expression ]]                        local [option] name[=value] ...
 alias [-p] [name[=value] ... ]          logout [n]
 bg [job_spec ...]                       mapfile [-d delim] [-n count] [-O or>
 bind [-lpsvPSVX] [-m keymap] [-f file>  popd [-n] [+N | -N]
 break [n]                               printf [-v var] format [arguments]
 builtin [shell-builtin [arg ...]]       pushd [-n] [+N | -N | dir]
 caller [expr]                           pwd [-LP]
 case WORD in [PATTERN [| PATTERN]...)>  read [-ers] [-a array] [-d delim] [->
 cd [-L|[-P [-e]] [-@]] [dir]            readarray [-n count] [-O origin] [-s>
 command [-pVv] command [arg ...]        readonly [-aAf] [name[=value] ...] o>
 compgen [-abcdefgjksuv] [-o option] [>  return [n]
 complete [-abcdefgjksuv] [-pr] [-DE] >  select NAME [in WORDS ... ;] do COMM>
 compopt [-o|+o option] [-DE] [name ..>  set [-abefhkmnptuvxBCHP] [-o option->
 continue [n]                            shift [n]
 coproc [NAME] command [redirections]    shopt [-pqsu] [-o] [optname ...]
 declare [-aAfFgilnrtux] [-p] [name[=v>  source filename [arguments]
 dirs [-clpv] [+N] [-N]                  suspend [-f]
 disown [-h] [-ar] [jobspec ... | pid >  test [expr]
 echo [-neE] [arg ...]                   time [-p] pipeline
 enable [-a] [-dnps] [-f filename] [na>  times
 eval [arg ...]                          trap [-lp] [[arg] signal_spec ...]
 exec [-cl] [-a name] [command [argume>  true
 exit [n]                                type [-afptP] name [name ...]
 export [-fn] [name[=value] ...] or ex>  typeset [-aAfFgilnrtux] [-p] name[=v>
 false                                   ulimit [-SHabcdefiklmnpqrstuvxPT] [l>
 fc [-e ename] [-lnr] [first] [last] o>  umask [-p] [-S] [mode]
 fg [job_spec]                           unalias [-a] name [name ...]
 for NAME [in WORDS ... ] ; do COMMAND>  unset [-f] [-v] [-n] [name ...]
 for (( exp1; exp2; exp3 )); do COMMAN>  until COMMANDS; do COMMANDS; done
 function name { COMMANDS ; } or name >  variables - Names and meanings of so>
 getopts optstring name [arg]            wait [-n] [id ...]
 hash [-lr] [-p pathname] [-dt] [name >  while COMMANDS; do COMMANDS; done
 help [-dms] [pattern ...]               { COMMANDS ; }
```

### stat -c

`stat` 命令用于显示文件的大小、所有者、用户组、索引节点号、权限、修改和访问时间等重要的统计信息。这是一个非常有用的命令，可以显示比 `ls -l` 更多的细节。

```
$ stat .bashrc
  File: .bashrc
  Size: 4048            Blocks: 8          IO Block: 4096   regular file
Device: 806h/2054d      Inode: 421481      Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/     shs)   Gid: ( 1000/     shs)
Access: 2017-08-23 15:13:41.781809933 -0400
Modify: 2017-06-21 17:37:11.875157790 -0400
Change: 2017-06-21 17:37:11.899157791 -0400
 Birth: -
```

使用 `-c` 选项，您可以指定要查看的字段。例如，如果您只想查看一个文件或一系列文件的文件名和访问权限，则可以这样做：

```
$ stat -c '%n %a' .bashrc
.bashrc 644
```

在此命令中， `%n` 表示每个文件的名称，而 `%a` 表示访问权限。`%u` 表示数字类型的 UID，而 `%U` 表示用户名。

```
$ stat -c '%n %a' bin/*
bin/loop 700
bin/move2nohup 700
bin/nohup.out 600
bin/show_release 700

$ stat -c '%n %a %U' bin/*
bin/loop 700 shs
bin/move2nohup 700 shs
bin/nohup.out 600 root
bin/show_release 700 shs
```

### TAB

如果你没有使用过 tab 键来补全文件名，你真的错过了一个非常有用的命令行技巧。tab 键提供文件名补全功能（包括使用 `cd` 时的目录）。它在出现歧义之前尽可能多的填充文件名（多个文件以相同的字母开头。如果您有一个名为 `bigplans` 的文件，另一个名为 `bigplans2017` 的文件会发生歧义，你将听到一个声音，然后需要决定是按下回车键还是输入 `2` 之后再按下 tab 键选择第二个文件。


（题图：[Micah Elizabeth Scott][32] [(CC BY 2.0)][33]）

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3219684/linux/half-a-dozen-clever-linux-command-line-tricks.html

作者：[Sandra Henry-Stocker][a]
译者：[firmianay](https://github.com/firmianay)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.networkworld.com/article/3203369/lan-wan/10-most-important-open-source-networking-projects.html
[2]:https://www.networkworld.com/article/3203369/lan-wan/10-most-important-open-source-networking-projects.html#tk.nww_nsdr_ndxprmomod
[3]:https://www.networkworld.com/article/3188295/linux/linux-mint-18-1-mostly-smooth-but-some-sharp-edges.html
[4]:https://www.networkworld.com/article/3188295/linux/linux-mint-18-1-mostly-smooth-but-some-sharp-edges.html#tk.nww_nsdr_ndxprmomod
[5]:https://www.networkworld.com/article/3167272/linux/open-source-users-its-time-for-extreme-vetting.html
[6]:https://www.networkworld.com/article/3167272/linux/open-source-users-its-time-for-extreme-vetting.html#tk.nww_nsdr_ndxprmomod
[7]:https://www.networkworld.com/article/3218728/linux/how-log-rotation-works-with-logrotate.html
[8]:https://www.networkworld.com/article/3194830/linux/10-unix-commands-every-mac-and-linux-user-should-know.html
[9]:https://www.networkworld.com/article/3208389/linux/unix-how-random-is-random.html
[10]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[11]:https://www.networkworld.com/article/3219826/mobile/prime-members-get-60-off-nucleus-anywhere-intercom-with-amazon-alexa-right-now-deal-alert.html
[12]:https://www.networkworld.com/article/3106867/consumer-electronics/32-off-pulse-solo-dimmable-led-light-with-dual-channel-bluetooth-speakers-deal-alert.html
[13]:https://www.networkworld.com/article/3219685/mobile/57-off-rockbirds-6-pack-led-mini-super-bright-3-mode-tactical-flashlights-deal-alert.html
[14]:https://www.networkworld.com/insider
[15]:https://twitter.com/intent/tweet?url=https%3A%2F%2Fwww.networkworld.com%2Farticle%2F3219684%2Flinux%2Fhalf-a-dozen-clever-linux-command-line-tricks.html&via=networkworld&text=Half+a+dozen+clever+Linux+command+line+tricks
[16]:https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.networkworld.com%2Farticle%2F3219684%2Flinux%2Fhalf-a-dozen-clever-linux-command-line-tricks.html
[17]:http://www.linkedin.com/shareArticle?url=https%3A%2F%2Fwww.networkworld.com%2Farticle%2F3219684%2Flinux%2Fhalf-a-dozen-clever-linux-command-line-tricks.html&title=Half+a+dozen+clever+Linux+command+line+tricks
[18]:https://plus.google.com/share?url=https%3A%2F%2Fwww.networkworld.com%2Farticle%2F3219684%2Flinux%2Fhalf-a-dozen-clever-linux-command-line-tricks.html
[19]:http://reddit.com/submit?url=https%3A%2F%2Fwww.networkworld.com%2Farticle%2F3219684%2Flinux%2Fhalf-a-dozen-clever-linux-command-line-tricks.html&title=Half+a+dozen+clever+Linux+command+line+tricks
[20]:http://www.stumbleupon.com/submit?url=https%3A%2F%2Fwww.networkworld.com%2Farticle%2F3219684%2Flinux%2Fhalf-a-dozen-clever-linux-command-line-tricks.html
[21]:https://www.networkworld.com/article/3219684/linux/half-a-dozen-clever-linux-command-line-tricks.html#email
[22]:https://www.networkworld.com/article/3218728/linux/how-log-rotation-works-with-logrotate.html
[23]:https://www.networkworld.com/article/3194830/linux/10-unix-commands-every-mac-and-linux-user-should-know.html
[24]:https://www.networkworld.com/article/3208389/linux/unix-how-random-is-random.html
[25]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[26]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[27]:https://www.networkworld.com/article/3219826/mobile/prime-members-get-60-off-nucleus-anywhere-intercom-with-amazon-alexa-right-now-deal-alert.html
[28]:https://www.networkworld.com/article/3106867/consumer-electronics/32-off-pulse-solo-dimmable-led-light-with-dual-channel-bluetooth-speakers-deal-alert.html
[29]:https://www.networkworld.com/article/3219685/mobile/57-off-rockbirds-6-pack-led-mini-super-bright-3-mode-tactical-flashlights-deal-alert.html
[30]:https://www.facebook.com/NetworkWorld/
[31]:https://www.linkedin.com/company/network-world
[32]:https://www.flickr.com/photos/micahdowty/4630801442/in/photolist-84d4Wb-p29iHU-dscgLx-pXKT7a-pXKT7v-azMz3V-azMz7M-4Amp2h-6iyQ51-4nf4VF-5C1gt6-6P4PwG-po6JEA-p6C5Wg-6RcRbH-7GAmbK-dCkRnT-7ETcBp-4Xbhrw-dXrN8w-dXm83Z-dXrNvQ-dXrMZC-dXrMPN-pY4GdS-azMz8X-bfNoF4-azQe61-p1iUtm-87i3vj-7enNsv-6sqvJy-dXm8aD-6smkyX-5CFfGm-dXm8dD-6sqviw-6sqvVU-dXrMVd-6smkXc-dXm7Ug-deuxUg-6smker-Hd15p-6squyf-aGtnxn-6smjRX-5YtTUN-nynqYm-ea5o3c
[33]:https://creativecommons.org/licenses/by/2.0/legalcode
