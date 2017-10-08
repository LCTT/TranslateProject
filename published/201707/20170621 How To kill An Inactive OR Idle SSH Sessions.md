如何关闭一个不活动的或者空闲的 SSH 会话
============================================================

让我们来假设一下，当你通过 ssh 在服务器上工作时，由于网络、电源或者是本地 PC 重启等原因会导致你的会话连接断开。

你可能会再次登录服务器继续工作也可能不会，但是你始终会留下之前没有关闭的 ssh 会话。

如何关闭一个不活动的 ssh 会话？首先使用 `w` 命令来识别出不活动或者是空闲的 ssh 会话，接着使用 `pstree` 命令来获取空闲会话的 PID，最后就是使用 `kill` 命令来关闭会话了。

建议阅读：[Mosh（Mobile Shell）- 最好的SSH 远程连接替代选项][3]

### 如何识别不活动的或者是空闲的 SSH 会话

登录系统通过 `w` 命令来查看当前有多少用户登录着。如果你识别出了自己的会话连接就可以记下其它不活动或者是空闲的 ssh 会话去关闭。

在我当前的例子中，能看见两个用户登录着，其中一个是我当前在执行 `w` 命令的 ssh 会话另一个就是之前的空闲会话了。

```
# w
 10:36:39 up 26 days, 20:29,  2 users,  load average: 0.00, 0.02, 0.00
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT
root     pts/0    219.91.219.14    10:34   28.00s  0.00s  0.00s -bash
root     pts/2    219.91.219.14    10:36    0.00s  0.00s  0.00s w
```

### 如何获取 SSH 会话的 PID

为了关闭空闲的 ssh 会话，我们需要空闲会话进程的父进程的 PID。我们可以执行 `pstree` 命令来查看包括了所有进程的树状图，以便获取父进程的 pid。

你会获得与下方示例中相似的输出。`pstree` 命令的输出会比这个多得多，为了更好的理解我删去了许多不相关的内容。

```
# pstree -p
init(1)-+-abrtd(2131)
        |-acpid(1958)
        |-httpd(32413)-+-httpd(32442)
        |
	|-mingetty(2198)
        |-mysqld_safe(24298)---mysqld(24376)-+-{mysqld}(24378)
        |
        |-php(32456)-+-php(32457)
        |
        |-sshd(2023)-+-sshd(10132)---bash(10136)
        |            `-sshd(10199)---bash(10208)---pstree(10226)
        |-udevd(774)-+-udevd(2191)
                     `-udevd(27282)
```

从上方的输出中，你可以看到 `sshd` 进程与分支的树形图。`sshd` 的主进程是 `sshd（2023）`，另两个分支分别为 `sshd（10132）` 和 `sshd（10199）`。

跟我在文章开始讲的相同，其中一个是我新的会话连接 `sshd（10199）` 它展示了我正在执行的 `pstree` 命令，因此空闲会话是另一个进程为 `sshd（10132）`。

- 建议阅读：[如何通过标准的网页浏览器来接入 Secure Shell (SSH) 服务器][4]
- 建议阅读：[PSSH - 在多台 Linux 服务器上并行的执行命令][5]

### 如何关闭空闲 SSH 会话

我们已经获得了有关空闲会话的所有信息。那么，就让我们来使用 `kill` 命令来关闭空闲会话。请确认你将下方的 PID 替换成了你服务器上的空闲会话 PID。

```

# kill -9 10132
```

（LCTT 译注：这里介绍另一个工具 `pkill`，使用 `pkill -t pts/0 -kill` 就可以关闭会话, debian 8 下可用，有些版本似乎需要更改 `-kill` 的位置）

### 再次查看空闲会话是否已经被关闭

再次使用 `w` 命令来查看空闲会话是否已经被关闭。没错，只有那个我自己的当前会话还在，因此那个空闲会话已经被关闭了。

```
# w
 10:40:18 up 26 days, 20:33,  1 user,  load average: 0.11, 0.04, 0.01
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT
root     pts/2    219.91.219.14    10:36    0.00s  0.00s  0.00s w
```

- 建议阅读：[rtop - 一个好用的通过 SSH 来监控远程服务器的工具][6]
- 建议阅读：[DSH - 同时在多台 Linux 服务器上执行命令][7]

### 再次使用 pstree 命令检查

再次使用 `pstree` 命令确认。是的，只有那个我自己的 ssh 会话还在。

```
# pstree -p
init(1)-+-abrtd(2131)
        |-acpid(1958)
        |
        |-httpd(32413)-+-httpd(32442)
        |
        |-mingetty(2198)
        |-mysqld_safe(24298)---mysqld(24376)-+-{mysqld}(24378)
        |
        |-php(32456)-+-php(32457)
        |
        |-sshd(2023)---sshd(10199)---bash(10208)---pstree(10431)
        |-udevd(774)-+-udevd(2191)
                     `-udevd(27282)
```

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/kill-inactive-idle-ssh-sessions/

作者：[Magesh Maruthamuthu][a]
译者：[wcnnbdk1](https://github.com/wcnnbdk1)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/author/magesh/
[2]:http://www.2daygeek.com/category/ssh-tutorials/
[3]:https://linux.cn/article-6262-1.html
[4]:http://www.2daygeek.com/shellinabox-web-based-ssh-terminal-to-access-remote-linux-servers/
[5]:http://www.2daygeek.com/pssh-parallel-ssh-run-execute-commands-on-multiple-linux-servers/
[6]:https://linux.cn/article-8199-1.html
[7]:http://www.2daygeek.com/dsh-run-execute-shell-commands-on-multiple-linux-servers-at-once/
