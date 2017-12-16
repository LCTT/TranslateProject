Translating by lujun9972
How to protects Linux and Unix machines from accidental shutdowns/reboots with molly-guard
======
Oops! I did it again. I thought I was logged into my home server. Turns out [I rebooted the db server][1]. Another my not so favorite is typing "[shutdown -h 0][2]" into the wrong terminal. I know a few people who have [admitted to doing that here][3].
![My anger that can't be contained][4]
Is there any end to the madness? Do I need to suffer from accidentally random reboots and shutdowns? After all, it is human nature to make mistakes, but one should not keep on making the same mistakes again and again.

Recently I tweeted my frustration:

> I seems to run into this stuff again and again :( Instead of typing:
> sudo virsh reboot d1
>
> I just typed & rebooted my own box
> sudo reboot d1
>
> -- nixCraft (@nixcraft) [February 19, 2017][5]


I come across quite a few suggestion on Twitter. Let us try out those.

### Say hello to molly guard

Molly-Guard **try to block you from accidentally running or shutting down or rebooting Linux servers**. From the Debian/Ubuntu package description:

> The package installs a shell script that overrides the existing shutdown/reboot/halt/poweroff/coldreboot/pm-hibernate/pm-suspend* commands and first runs a set of scripts, which all have to exit successfully, before molly-guard invokes the real command. One of the scripts checks for existing SSH sessions. If any of the four commands are called interactively over an SSH session, the shell script prompts you to enter the name of the host you wish to shut down. This should adequately prevent you from accidental shutdowns and reboots.

It seems [molly-guard][6] has the entry in the Jargon File:

> A shield to prevent tripping of some Big Red Switch by clumsy or ignorant hands. Originally used of the plexiglass covers improvised for the BRS on an IBM 4341 after a programmer's toddler daughter (named Molly) frobbed it twice in one day. Later generalized to covers over stop/reset switches on disk drives and networking equipment. In hardware catalogues, you'll see the much less interesting description "guarded button".

### How to install molly guard

Type the following command to search and install molly-guard using [apt-get command][7] or [apt command][8]:
```
$ apt search molly-guard
$ sudo apt-get install molly-guard
```
Sample outputs:
[![Fig.01: Installing molly guard on Linux][9]][10]

### Test it

Type the [reboot command][11] or shutdown command:
```
$ sudo reboot
# reboot
$ shutdown -h 0
# sudo shutdown -h 0
### running wrong command such as follows instead of
### sudo virsh reboot vm_name_here
$ sudo reboot vm_name_here
```
Sample outputs:
![Fig.02: Molly guard saved my butt ;\)][12]
I liked molly-guard so much. I updated my apt-debian-ubuntu-common.yml file with the following lines:
```
 - apt:
 name: molly-guard

```

That's right. It is now part of all of my Debian and Ubuntu servers automation tasks done using Ansible tool.

 **Related** : [My 10 UNIX Command Line Mistakes][13]

### What if molly-guard not available on my Linux distro or Unix system like FreeBSD?

Fear not, [set shell aliases][14]:
```
## bash shell example ###
alias reboot = "echo 'Are you sure?' If so, run /sbin/reboot"
alias shutdown = "echo 'Are you sure?' If so, run /sbin/shutdown"
```

You can [temporarily get rid of an aliases and run actual command][15] such as reboot:
```
# \reboot
```
OR
```
# /sbin/reboot
```
Another option is to write a [shell/perl/python script calling these and asking][16] confirmation for reboot/halt/shutdown options.


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/hardware/how-to-protects-linux-and-unix-machines-from-accidental-shutdownsreboots-with-molly-guard/

作者：[Vivek Gite][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/howto-reboot-linux/
[2]:https://www.cyberciti.biz/faq/shutdown-linux-server/
[3]:https://www.cyberciti.biz/tips/my-10-unix-command-line-mistakes.html (My 10 UNIX Command Line Mistakes)
[4]:https://www.cyberciti.biz/media/new/cms/2017/02/anger.gif
[5]:https://twitter.com/nixcraft/status/833320792880320513
[6]:http://catb.org/~esr/jargon/html/M/molly-guard.html
[7]://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[8]://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[9]:https://www.cyberciti.biz/media/new/cms/2017/02/install-molly-guard-on-linux.jpg
[10]:https://www.cyberciti.biz/hardware/how-to-protects-linux-and-unix-machines-from-accidental-shutdownsreboots-with-molly-guard/attachment/install-molly-guard-on-linux/
[11]:https://www.cyberciti.biz/faq/linux-reboot-command/ (See Linux/Unix reboot command examples for more info)
[12]:https://www.cyberciti.biz/media/new/cms/2017/02/saved-my-butt.jpg
[13]:https://www.cyberciti.biz/tips/my-10-unix-command-line-mistakes.html
[14]:https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
[15]:https://www.cyberciti.biz/faq/bash-shell-temporarily-disable-an-alias/
[16]:https://github.com/kjetilho/clumsy_protect
[17]:https://twitter.com/nixcraft
[18]:https://facebook.com/nixcraft
[19]:https://plus.google.com/+CybercitiBiz
