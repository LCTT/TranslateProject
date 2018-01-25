绕过 Linux/Unix 命令别名
======
我在我的 Linux 系统上定义了如下 mount 别名：
```
alias mount='mount | column -t'
```
但是我需要在挂载文件系统和其他用途时绕过 bash 别名。我如何在  Linux、\*BSD、macOS 或者类 Unix 系统上临时禁用或者绕过 bash shell 呢？


你可以使用 alias 命令定义或显示 bash shell 别名。一旦创建了 bash shell 别名，它们将优先于外部或内部命令。本文将展示如何暂时绕过 bash 别名，以便你可以运行实际的内部或外部命令。
[![Bash Bypass Alias Linux BSD macOS Unix Command][1]][1]

## 4 种绕过 bash 别名的方法


尝试以下任意一种方法来运行被 bash shell 别名绕过的命令。让我们[如下定义一个别名][2]：
`alias mount='mount | column -t'`
运行如下：
`mount `
示例输出：
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

### 方法1 - 使用 \command

输入以下命令暂时绕过名为 mount 的 bash 别名：
`\mount`

### 方法2 - 使用 "command" 或 'command'

如下引用 mount 命令调用实际的 /bin/mount：
`"mount"`
或者
`'mount'`

### Method 3 - Use full command path

Use full binary path such as /bin/mount:
`/bin/mount
/bin/mount /dev/sda1 /mnt/sda`

### 方法3 - 使用完整的命令路径

语法是：
`command cmd
command cmd arg1 arg2`
要覆盖 .bash_aliases 中设置的别名，例如 mount：
`command mount
command mount /dev/sdc /mnt/pendrive/`
[”command“ 运行命令或显示][3]关于命令的信息。它带参数运行命令会抑制 shell 函数查询或者别名，或者显示有关给定命令的信息。

## 关于 unalias 命令的说明

要从当前会话的已定义别名列表中移除别名，请使用 unalias 命令：
`unalias mount`
要从当前 bash 会话中删除所有别名定义：
`unalias -a`
确保你更新你的 ~/.bashrc 或 $HOME/.bash_aliases。如果要永久删除定义的别名，则必须删除定义的别名：
`vi ~/.bashrc`
或者
`joe $HOME/.bash_aliases`
想了解更多信息，参考[这里][4]的在线手册，或者输入下面的命令查看：
```
man bash
help command
help unalias
help alias
```


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/bash-bypass-alias-command-on-linux-macos-unix/

作者：[Vivek Gite][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2017/10/Bash-Bypass-Alias-Linux-BSD-macOS-Unix-Command.jpg
[2]:https://bash.cyberciti.biz/guide/Create_and_use_aliases
[3]:https://bash.cyberciti.biz/guide/Command
[4]:https://www.gnu.org/software/bash/manual/bash.html
