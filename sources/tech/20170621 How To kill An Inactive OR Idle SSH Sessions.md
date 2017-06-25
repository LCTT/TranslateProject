How To kill An Inactive OR Idle SSH Sessions
============================================================

BY [MAGESH MARUTHAMUTHU][1] · PUBLISHED : JUNE 21, 2017 || LAST UPDATED: JUNE 21, 2017

Let’s imagine that you are working in server through ssh, for some reason your session get disconnected like, internet issue or power failure or your Local PC get rebooted, etc,.

You may or mayn’t login to the server again to work but you have left the previous ssh session with out closing.

How to Kill an inactive ssh sessions ? Identify the Inactive or Idle ssh sessions with help of `w` command, then get the idle session PID by issuing `pstree` command, finally kill the sessions using `kill` command.

Suggested Read : [SSH Related Articles][2]

Suggested Read : [Mosh (Mobile Shell) – Best Alternative for SSH to Connect Remote System][3]

#### How to Identify Inactive or Idle SSH Sessions

Login to the system and check how many user’s are currently logged in by issuing `w` command. If you identified your own session then note the Inactive or Idle ssh sessions to kill.

In my scenario, I can see two users are currently logged in, one is my new ssh session which am currently running `w` command and another one for my idle session.

```
# w
 10:36:39 up 26 days, 20:29,  2 users,  load average: 0.00, 0.02, 0.00
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT
root     pts/0    219.91.219.14    10:34   28.00s  0.00s  0.00s -bash
root     pts/2    219.91.219.14    10:36    0.00s  0.00s  0.00s w
```

#### How to Get a SSH Session PID

To kill idle ssh session, we need a parent `PID` of the idle session. To get a parent pid, run the `pstree` command to see a tree diagram of all the processes.

You also get the similar kind of output like below. The pstree command output is much bigger so, i removed many things from the file for better understanding.

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

From the above output, you can see the tree of sshd processes and branch’s. The main sshd process is `sshd(2023)` and two branch’s, `sshd(10132)` and `sshd(10199)`.

As i told in the beginning of the article, one is my new session `sshd(10199)` because it shows the `pstree` command which is currently running by me, so the idle session is another one `sshd(10132)`.

Suggested Read : [How to Access Secure Shell (SSH) Servers Through Standard Web Browsers][4]

Suggested Read : [PSSH – Execute Commands on Multiple Linux Servers in Parallel][5]

#### How to kill Idle SSH Sessions

We got all the information about idle session. Now, i’m going to kill the idle session, using the `kill` command. Make sure you have replace your PID instead of us.

```

# kill -9 10132
```

#### Recheck whether the idle session get killed or not

Again use `w` command to recheck whether the idle session get killed or not. Yes, it’s not there because i can see only one session which is owned by me.

```
# w
 10:40:18 up 26 days, 20:33,  1 user,  load average: 0.11, 0.04, 0.01
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT
root     pts/2    219.91.219.14    10:36    0.00s  0.00s  0.00s w
```

Suggested Read : [rtop – A Nifty Tool to Monitor Remote Server Over SSH][6]

Suggested Read : [DSH – Run/Execute Shell Commands On Multiple Linux Servers At Once][7]

#### Recheck with pstree Command

Recheck once again with `pstree` command to double confirm it. Yes, only one ssh session is live which is owned by me.

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

作者：[ Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/author/magesh/
[2]:http://www.2daygeek.com/category/ssh-tutorials/
[3]:http://www.2daygeek.com/install-mosh-shell-ssh-client-in-linux-to-connect-remote-system/
[4]:http://www.2daygeek.com/shellinabox-web-based-ssh-terminal-to-access-remote-linux-servers/
[5]:http://www.2daygeek.com/pssh-parallel-ssh-run-execute-commands-on-multiple-linux-servers/
[6]:http://www.2daygeek.com/rtop-monitor-remote-linux-server-over-ssh/
[7]:http://www.2daygeek.com/dsh-run-execute-shell-commands-on-multiple-linux-servers-at-once/
