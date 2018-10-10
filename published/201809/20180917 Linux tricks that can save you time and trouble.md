让你提高效率的 Linux 技巧
======

> 想要在 Linux 命令行工作中提高效率，你需要使用一些技巧。

![](https://images.idgesg.net/images/article/2018/09/boy-jumping-off-swing-100772498-large.jpg)

巧妙的 Linux 命令行技巧能让你节省时间、避免出错，还能让你记住和复用各种复杂的命令，专注在需要做的事情本身，而不是你要怎么做。以下介绍一些好用的命令行技巧。

### 命令编辑

如果要对一个已输入的命令进行修改，可以使用 `^a`（`ctrl + a`）或 `^e`（`ctrl + e`）将光标快速移动到命令的开头或命令的末尾。

还可以使用 `^` 字符实现对上一个命令的文本替换并重新执行命令，例如 `^before^after^` 相当于把上一个命令中的 `before` 替换为 `after` 然后重新执行一次。

```
$ eho hello world  <== 错误的命令

Command 'eho' not found, did you mean:

 command 'echo' from deb coreutils
 command 'who' from deb coreutils

Try: sudo apt install <deb name>

$ ^e^ec^        <== 替换
echo hello world
hello world

```

### 使用远程机器的名称登录到机器上

如果使用命令行登录其它机器上，可以考虑添加别名。在别名中，可以填入需要登录的用户名（与本地系统上的用户名可能相同，也可能不同）以及远程机器的登录信息。例如使用 `server_name ='ssh -v -l username IP-address'` 这样的别名命令：

```
$ alias butterfly=”ssh -v -l jdoe 192.168.0.11”
```

也可以通过在 `/etc/hosts` 文件中添加记录或者在 DNS 服务器中加入解析记录来把 IP 地址替换成易记的机器名称。

执行 `alias` 命令可以列出机器上已有的别名。

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

只要将新的别名添加到 `~/.bashrc` 或类似的文件中，就可以让别名在每次登录后都能立即生效。

### 冻结、解冻终端界面

`^s`（`ctrl + s`）将通过执行流量控制命令 XOFF 来停止终端输出内容，这会对 PuTTY 会话和桌面终端窗口产生影响。如果误输入了这个命令，可以使用 `^q`（`ctrl + q`）让终端重新响应。所以只需要记住 `^q` 这个组合键就可以了，毕竟这种情况并不多见。

### 复用命令

Linux 提供了很多让用户复用命令的方法，其核心是通过历史缓冲区收集执行过的命令。复用命令的最简单方法是输入 `!` 然后接最近使用过的命令的开头字母；当然也可以按键盘上的向上箭头，直到看到要复用的命令，然后按回车键。还可以先使用 `history` 显示命令历史，然后输入 `!` 后面再接命令历史记录中需要复用的命令旁边的数字。

```
!! <== 复用上一条命令
!ec <== 复用上一条以 “ec” 开头的命令
!76 <== 复用命令历史中的 76 号命令
```

### 查看日志文件并动态显示更新内容

使用形如 `tail -f /var/log/syslog` 的命令可以查看指定的日志文件，并动态显示文件中增加的内容，需要监控向日志文件中追加内容的的事件时相当有用。这个命令会输出文件内容的末尾部分，并逐渐显示新增的内容。

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
        <== 等待显示追加的内容
```

### 寻求帮助

对于大多数 Linux 命令，都可以通过在输入命令后加上选项 `--help` 来获得这个命令的作用、用法以及它的一些相关信息。除了 `man` 命令之外， `--help` 选项可以让你在不使用所有扩展选项的情况下获取到所需要的内容。

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

### 谨慎删除文件

如果要谨慎使用 `rm` 命令，可以为它设置一个别名，在删除文件之前需要进行确认才能删除。有些系统管理员会默认使用这个别名，对于这种情况，你可能需要看看下一个技巧。

```
$ rm -i    <== 请求确认
```

### 关闭别名

你可以使用 `unalias` 命令以交互方式禁用别名。它不会更改别名的配置，而仅仅是暂时禁用，直到下次登录或重新设置了这一个别名才会重新生效。

```
$ unalias rm
```

如果已经将 `rm -i` 默认设置为 `rm` 的别名，但你希望在删除文件之前不必进行确认，则可以将 `unalias` 命令放在一个启动文件（例如 `~/.bashrc`）中。

### 使用 sudo

如果你经常在只有 root 用户才能执行的命令前忘记使用 `sudo`，这里有两个方法可以解决。一是利用命令历史记录，可以使用 `sudo !!`（使用 `!!` 来运行最近的命令，并在前面添加 `sudo`）来重复执行，二是设置一些附加了所需 `sudo` 的命令别名。

```
$ alias update=’sudo apt update’
```

### 更复杂的技巧

有时命令行技巧并不仅仅是一个别名。毕竟，别名能帮你做的只有替换命令以及增加一些命令参数，节省了输入的时间。但如果需要比别名更复杂功能，可以通过编写脚本、向 `.bashrc` 或其他启动文件添加函数来实现。例如，下面这个函数会在创建一个目录后进入到这个目录下。在设置完毕后，执行 `source .bashrc`，就可以使用 `md temp` 这样的命令来创建目录立即进入这个目录下。

```
md () { mkdir -p "$@" && cd "$1"; }
```

### 总结

使用 Linux 命令行是在 Linux 系统上工作最有效也最有趣的方法，但配合命令行技巧和巧妙的别名可以让你获得更好的体验。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3305811/linux/linux-tricks-that-even-you-can-love.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world

