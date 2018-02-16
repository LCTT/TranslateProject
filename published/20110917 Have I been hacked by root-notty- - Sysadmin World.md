我是被 “root@notty” 黑了吗？
======

当你在 `ps aux` 的输出中看到 `sshd：root@notty` 时会觉得很奇怪吧，`notty` 算是哪门子的主机，是不是黑客计算机的名字啊。不过不用担心；`notty` 仅仅是表示 没有 tty 而已。

当你在本地登录 Linux 机器时，登录终端会在进程列表中显示为 `tty`（ 比如，tty7）。若你通过 ssh 登录一台远程服务器，则会看到类似 `root@pts/0` 这样的东西。

而若某个连接是由 sftp 或者是由 scp 拷贝文件而创建的，则该连接会会显示成没有 tty （notty）。

如果你仍然想知道服务器上发生了什么事情，可以检查 `ps auxf` 的输出来查看进程树，或者运行 `netstat -vatn` 来检查所有的 TCP 连接。

--------------------------------------------------------------------------------

via: http://www.sysadminworld.com/2011/ps-aux-shows-sshd-rootnotty/

作者：[sysadminworld][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.sysadminworld.com
