Bash Bypass Alias Linux/Unix Command
======
I defined mount bash shell alias as follows on my Linux system:
```
alias mount='mount | column -t'
```
However, I need to bash bypass alias for mounting the file system and another usage. How can I disable or bypass my bash shell aliases temporarily on a Linux, *BSD, macOS or Unix-like system?



You can define or display bash shell aliases with alias command. Once bash shell aliases created, they take precedence over external or internal commands. This page shows how to bypass bash aliases temporarily so that you can run actual internal or external command.
[![Bash Bypass Alias Linux BSD macOS Unix Command][1]][1]

## Four ways to bash bypass alias


Try any one of the following ways to run a command that is shadowed by a bash shell alias. Let us [define an alias as follows][2]:
`alias mount='mount | column -t'`
Run it as follows:
`mount `
Sample outputs:
```
sysfs                        on  /sys                             type  sysfs            (rw,nosuid,nodev,noexec,relatime)
proc                         on  /proc                            type  proc             (rw,nosuid,nodev,noexec,relatime)
udev                         on  /dev                             type  devtmpfs         (rw,nosuid,relatime,size=8023572k,nr_inodes=2005893,mode=755)
devpts                       on  /dev/pts                         type  devpts           (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)
tmpfs                        on  /run                             type  tmpfs            (rw,nosuid,noexec,relatime,size=1610240k,mode=755)
/dev/mapper/ubuntu--vg-root  on  /                                type  ext4             (rw,relatime,errors=remount-ro,data=ordered)
/dev/sda1                    on  /boot                            type  ext4             (rw,relatime,data=ordered)
binfmt_misc                  on  /proc/sys/fs/binfmt_misc         type  binfmt_misc      (rw,relatime)
lxcfs                        on  /var/lib/lxcfs                   type  fuse.lxcfs       (rw,nosuid,nodev,relatime,user_id=0,group_id=0,allow_other)
```

### Method 1 - Use \command

Type the following command to temporarily bypass a bash alias called mount:
`\mount`

### Method 2 - Use "command" or 'command'

Quote the mount command as follows to call actual /bin/mount:
`"mount"`
OR
`'mount'`

### Method 3 - Use full command path

Use full binary path such as /bin/mount:
`/bin/mount
/bin/mount /dev/sda1 /mnt/sda`

### Method 4 - Use internal command

The syntax is:
`command cmd
command cmd arg1 arg2`
To override alias set in .bash_aliases such as mount:
`command mount
command mount /dev/sdc /mnt/pendrive/`
[The 'command' run a simple command or display][3] information about commands. It runs COMMAND with ARGS suppressing shell function lookup or aliases, or display information about the given COMMANDs.

## A note about unalias command

To remove each alias from the list of defined aliases from the current session use unalias command:
`unalias mount`
To remove all alias definitions from the current bash session:
`unalias -a`
Make sure you update your ~/.bashrc or $HOME/.bash_aliases file. You must remove defined aliases if you want to remove them permanently:
`vi ~/.bashrc`
OR
`joe $HOME/.bash_aliases`
For more information see bash command man page online [here][4] or read it by typing the following command:
```
man bash
help command
help unalias
help alias
```


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/bash-bypass-alias-command-on-linux-macos-unix/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2017/10/Bash-Bypass-Alias-Linux-BSD-macOS-Unix-Command.jpg
[2]:https://bash.cyberciti.biz/guide/Create_and_use_aliases
[3]:https://bash.cyberciti.biz/guide/Command
[4]:https://www.gnu.org/software/bash/manual/bash.html
