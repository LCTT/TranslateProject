通过 ssh 会话执行 bash 别名
======

我在远程主机上[上设置过一个叫做 file_repl 的 bash 别名 ][1]。当我使用 ssh 命令登录远程主机后，可以很正常的使用这个别名。然而这个 bash 别名却无法通过 ssh 来运行，像这样：

```
$ ssh vivek@server1.cyberciti.biz file_repl
bash：file_repl：command not found
```

我要怎样做才能通过 ssh 命令运行 bash 别名呢？

SSH 客户端 (ssh) 是一个登录远程服务器并在远程系统上执行 shell 命令的 Linux/Unix 命令。它被设计用来在两个非信任的机器上通过不安全的网络（比如互联网）提供安全的加密通讯。

### 如何用 ssh 客户端执行命令

通过 ssh 运行 `free` 命令或 [date 命令][2] 可以这样做：

```
$ ssh vivek@server1.cyberciti.biz date
```

结果为：

```
Tue Dec 26 09：02：50 UTC 2017
```

或者：

```
$ ssh vivek@server1.cyberciti.biz free -h
```

结果为：

```
 total used free shared buff/cache available
Mem：2.0G 428M 138M 145M 1.4G 1.1G
Swap：0B 0B 0B
```

### 理解 bash shell 以及命令的类型

[bash shell][4] 共有下面几类命令：

1. 别名，比如 `ll`
2. 关键字，比如 `if`
3. 函数 （用户自定义函数，比如 `genpasswd`）
4. 内置命令，比如 `pwd`
5. 外部文件，比如 `/bin/date`

[type 命令][5] 和 [command 命令][6] 可以用来查看命令类型：

```
$ type -a date
date is /bin/date
$ type -a free
free is /usr/bin/free
$ command -V pwd
pwd is a shell builtin
$ type -a file_repl
is aliased to `sudo -i /shared/takes/master.replication'
```
`date` 和 `free` 都是外部命令，而 `file_repl` 是 `sudo -i /shared/takes/master.replication` 的别名。你不能直接执行像 `file_repl` 这样的别名：

```
$ ssh user@remote file_repl
```

### 在 Unix 系统上无法直接通过 ssh 客户端执行 bash 别名

要解决这个问题可以用下面方法运行 ssh 命令：

```
$ ssh -t user@remote /bin/bash -ic 'your-alias-here'
$ ssh -t user@remote /bin/bash -ic 'file_repl'
```

`ssh` 命令选项：

- `-t`：[强制分配伪终端。可以用来在远程机器上执行任意的][7] 基于屏幕的程序，有时这非常有用。当使用 `-t` 时你可能会收到一个类似“bash: cannot set terminal process group (-1): Inappropriate ioctl for device. bash: no job control in this shell .”的错误。

bash shell 的选项：

- `-i`：运行交互 shell，这样 shell 才能运行 bash 别名。
- `-c`：要执行的命令取之于第一个非选项参数的命令字符串。若在命令字符串后面还有其他参数，这些参数会作为位置参数传递给命令，参数从 `$0` 开始。

总之，要运行一个名叫 `ll` 的 bash 别名，可以运行下面命令：

```
$ ssh -t vivek@server1.cyberciti.biz -ic 'll'
```

结果为：

[![Running bash aliases over ssh based session when using Unix or Linux ssh cli][8]][8]

下面是我的一个 shell 脚本的例子：

```
#！/bin/bash
I="tags.deleted.410"
O="/tmp/https.www.cyberciti.biz.410.url.conf"
box="vivek@server1.cyberciti.biz"
[！-f "$I" ] && { echo "$I file not found。"; exit 10; }
>$O
cat "$I" | sort | uniq | while read -r u
do
	uu="${u##https：//www.cyberciti.biz}"
	echo "~^$uu 1;" >>"${O}"
done
echo "Config file created at ${O} and now updating remote nginx config file"
scp "${O}" ${box}：/tmp/
ssh ${box} /usr/bin/lxc file push /tmp/https.www.cyberciti.biz.410.url.conf nginx-container/etc/nginx/
ssh -t ${box} /bin/bash -ic 'push_config_job'
```

### 相关资料

更多信息请输入下面命令查看 [OpenSSH 客户端][9] 和 [bash 的 man 帮助 ][10]：

```
$ man ssh
$ man bash
$ help type
$ help command
```

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/use-bash-aliases-ssh-based-session/

作者：[Vivek Gite][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://bash.cyberciti.biz/guide/Alias_command#How_to_define_alias
[2]:https://www.cyberciti.biz/faq/unix-date-command-howto-see-set-date-time/ (See Linux/Unix date command examples for more info)
[3]:https://www.cyberciti.biz/cdn-cgi/l/email-protection
[4]:https://bash.cyberciti.biz/guide/Shell_commands
[5]:https://bash.cyberciti.biz/guide/Type_command
[6]:https://bash.cyberciti.biz/guide/Command
[7]:https://www.cyberciti.biz/faq/linux-unix-bsd-sudo-sorry-you-must-haveattytorun/
[8]:https://www.cyberciti.biz/media/new/faq/2017/12/Bash-shell-aliase-not-found-when-run-over-ssh-on-linux-unix.jpg
[9]:https://man.openbsd.org/ssh
[10]:https://www.gnu.org/software/bash/manual/bash.html
