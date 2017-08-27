Translating by firmianay

Half a dozen clever Linux command line tricks
============================================================

### Some very useful commands for making life on the command line more rewarding

![command key keyboard](https://images.idgesg.net/images/article/2017/08/commands-micah_elizabeth_scott-cropped-100733439-large.jpg)
[Micah Elizabeth Scott][32] [(CC BY 2.0)][33]RELATED


Working on the Linux command can be a lot of fun, but it can be even more fun when you use commands that take less work on your part or display information in interesting and useful ways. In today’s post, we’re going to look at half a dozen commands that might make your time on the command line more profitable.

### watch

The watch command will repeatedly run whatever command you give it and show you the output. By default, it runs the command every two seconds. Each successive running of the command overwrites what it displayed on the previous run, so you're always looking at the latest data.

You might use it when you’re waiting for someone to log in. In this case, you would use the command “watch who” or maybe “watch -n 15 who” to have the command run every 15 seconds instead of every two seconds. The date and time will appear in the upper right-hand corner of your terminal window.

```
$ watch -n 5 who
Every 5.0s: who                               stinkbug: Wed Aug 23 14:52:15 2017

shs      pts/0        2017-08-23 14:45 (192.168.0.11)
zoe      pts/1        2017-08-23 08:15 (192.168.0.19)
```

You might also use it to watch a log file. If nothing changes in the data you’re displaying, only the date/time display in the corner of the window will change.



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

This output is similar to what you’d see using tail -f /var/log/syslog.

### look

The name might suggest that look does something similar to watch, but it’s entirely different. The look command searches for words that begin with some particular string.

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

The look command is generally helpful with spelling and used the /usr/share/dict/words file unless you specify a file name with a command like this one:

```
$ look esac .bashrc
esac
esac
esac
```

In this case, it acts like grep following by an awk command that prints only the first word on the matching lines.


### man -k

The man -k command lists man pages that include the specified word. It basically works like the apropos command.

```
$ man -k logrotate
dh_installlogrotate (1) - install logrotate config files
logrotate (8)        - rotates, compresses, and mails system logs
logrotate.conf (5)   - rotates, compresses, and mails system logs
```

### help

While you may be tempted to use this command when you’re utterly frustrated, what the help command actually does is show you a list of shell built-ins. What’s most surprising is how many of these variables exist. You’re likely to see something like this and then start to wonder what all of these built-ins might do for you:

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

The stat command displays the vital statistics for a file — its size, owner, group, inode number, permissions, modification and access times. It’s a very useful command that displays more detail than a simple ls -l.

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

With the -c option, you can specify the fields you want to see. If, for example, you want to see just the file name and access rights for a file or series of files, you might do this:

```
$ stat -c '%n %a' .bashrc
.bashrc 644
```

In this command, the %n represents the name of each file, while %a represents the access rights. A %u would be the numeric UID and %U the username.

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

If you’re not using the tab command for filename completion, you’re really missing out on a very useful command line trick. The tab command provides filename completion (including directories when you’re using cd). It fills in as much of a name as possible before it hits an ambiguity (more than one file starting with the same letters. If you have a file named bigplans and another named bigplans2017, you’ll hear a sound and have to decide whether to press enter or “2” and tab again to select the second file.

Join the Network World communities on [Facebook][30] and [LinkedIn][31] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3219684/linux/half-a-dozen-clever-linux-command-line-tricks.html

作者：[ Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
