translating by lujun9972
Have I been hacked by root@notty? – Sysadmin World
======

If you see sshd:root@notty in the output of `ps aux` and wonder what kind of host notty is and if that’s the name of a hacker’s computer, don’t worry; notty actually just stands for no tty.

When you login locally to a linux machine the terminal will appear in the process list as tty (e.g. tty7). If you login to a remote server via ssh you will see something like root@pts/0.

However if a connection is made via sftp or you are copying files with scp then it will show as no tty (notty).

If you are still wondering on what is going on you might want to check the output of ps auxf to see a tree of processes or run `netstat -vatn` to examine all TCP connections.

--------------------------------------------------------------------------------

via: http://www.sysadminworld.com/2011/ps-aux-shows-sshd-rootnotty/

作者：[sysadminworld][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.sysadminworld.com
