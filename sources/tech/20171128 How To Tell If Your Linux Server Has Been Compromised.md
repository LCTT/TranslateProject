如何判断Linux服务器是否被入侵
--------------

本指南中所谓的服务器被入侵或者说被黑了的意思是指未经认证的人或程序为了自己的目的登录到服务器上去并使用其计算资源, 通常会产生不好的影响.

免责声明: 若你的服务器被类似NSA这样的国家机关或者某个犯罪集团如请，那么你并不会发现有任何问题，这些技术也无法发觉他们的存在.

然而, 大多数被攻破的服务器都是被类似自动攻击程序这样的程序或者类似“脚本小子”这样的廉价攻击者，以及蠢蛋犯罪所入侵的.

这类攻击者会在访问服务器的同时滥用服务器资源，并且不怎么会采取措施来隐藏他们正在做的事情.

### 入侵服务器的症状

当服务器被没有经验攻击者或者自动攻击程序入侵了的话，他们往往会消耗100%的资源. 他们可能消耗CPU资源来进行数字货币的采矿或者发送垃圾邮件,也可能消耗带宽来发动 `DoS` 攻击.

因此出现问题的第一个表现就是服务器 “变慢了”. 这可能表现在网站的页面打开的很慢, 或者电子邮件要花很长时间才能发送出去.

那么你应该查看那些东西呢?

#### 检查 1 - 当前都有谁在登录?

你首先要查看当前都有谁登录在服务器上. 发现攻击者登录到服务器上进行操作并不罕见.

其对应的命令是 `w`. 运行 `w` 会输出如下结果:

```
 08:32:55 up 98 days,  5:43,  2 users,  load average: 0.05, 0.03, 0.00
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
root     pts/0    113.174.161.1    08:26    0.00s  0.03s  0.02s ssh root@coopeaa12
root     pts/1    78.31.109.1      08:26    0.00s  0.01s  0.00s w

```

第一个IP是英国IP，而第二个IP是越南IP. 这个不是个好兆头.

停下来做个深呼吸, 不要紧，只需要杀掉他们的SSH连接就好了. Unless you can stop then re-entering the server they will do so quickly and quite likely kick you off and stop you getting back in.

请参阅本文最后的 `入侵之后怎么办` 这一章节来看发现被入侵的证据后应该怎么办.

`whois` 命令可以接一个IP地址然后告诉你IP注册的组织的所有信息, 当然就包括所在国家的信息.

#### 检查 2 - 谁曾经登录过?

Linux 服务器会记录下哪些用户，从哪个IP，在什么时候登录的以及登陆了多长时间这些信息. 使用 `last` 命令可以查看这些信息.

输出类似这样:

```
root     pts/1        78.31.109.1      Thu Nov 30 08:26   still logged in
root     pts/0        113.174.161.1    Thu Nov 30 08:26   still logged in
root     pts/1        78.31.109.1      Thu Nov 30 08:24 - 08:26  (00:01)
root     pts/0        113.174.161.1    Wed Nov 29 12:34 - 12:52  (00:18)
root     pts/0        14.176.196.1     Mon Nov 27 13:32 - 13:53  (00:21)

```

这里可以看到英国IP和越南IP交替出现, 而且最上面两个IP现在还处于登录状态. 如果你看到任何未经授权的IP，那么请参阅最后章节.

登录历史记录会以文本格式记录到 `~/.bash_history`(注：这里作者应该写错了)中，因此很容易被删除.
通常攻击者会直接把这个文件删掉，以掩盖他们的攻击行为. 因此, 若你运行了 `last` 命令却只看得见你的当前登录，那么这就是个不妙的信号.

如果没有登录历史的话，请一定小心，继续留意入侵的其他线索.

#### 检查 3 - 回顾命令历史

这个层次的攻击者通常不会注意掩盖命令的历史记录,因此运行 `history` 命令会显示出他们曾经做过的所有事情.
一定留意有没有用 `wget` 或 `curl` 命令来下载类似垃圾邮件机器人或者挖矿程序之类的软件.

命令历史存储在 `~/.bash_history` 文件中，因此有些攻击者会删除该文件以掩盖他们的所作所为.
跟登录历史一样, 若你运行 `history` 命令却没有输出任何东西那就表示历史文件被删掉了. 这也是个不妙的信号，你需要很小心地检查一下服务器了.

#### 检查 4 - 哪些进程在消耗CPU?

你常遇到的这类攻击者通常不怎么会去掩盖他们做的事情. 他们会运行一些特别消耗CPU的进程. 这就很容易发着这些进程了. 只需要运行 `top` 然后看最前的那几个进程就行了.

这也能显示出那些未登录的攻击者来. 比如，可能有人在用未受保护的邮件脚本来发送垃圾邮件.

如果你最上面的进程对不了解，那么你可以google一下进程名称,或者通过 `losf` 和 `strace` 来看看它做的事情是什么.

使用这些工具，第一步从 `top` 中拷贝出进程的 PID，然后运行:

```shell
strace -p PID

```

这会显示出进程调用的所有系统调用. 它产生的内容会很多,但这些信息能告诉你这个进程在做什么.

```
lsof  -p PID

```

这个程序会列出进程打开的文件. 通过查看它访问的文件可以很好的理解它在做的事情.

#### Check 5 - Review the all the system processes

If an unauthorized process is not consuming enough CPU to get listed noticeably on top it will still get displayed in a full process listing with ps. My proffered command is ps auxf for providing the most information clearly.

You should be looking for any processes that you don’t recognize. The more times you run ps on your servers (which is a good habikkt to get into) the more obvious an alien process will stand out.

#### Check 6 - Review network usage by process

The command iftop functions like top to show a ranked list of processes that are sending and receiving network data along with their source and destination. A process like a DOS attack or spam bot will immediately show itself at the top of the list.

#### Check 7 - What processes are listening for network connections?

Often an attacker will install a program that doesn’t do anything except listen on the network port for instructions. This does not consume CPU or bandwidth whilst it is waiting so can get overlooked in the top type commands.

The commands lsof and netstat will both list all networked processes. I use them with the following options:

```
lsof -i

```

```
netstat -plunt

```

You should look for any process that is listed as in the LISTEN or ESTABLISHED status as these processes are either waiting for a connection (LISTEN) or have a connection open (ESTABLISHED). If you don’t recognize these processes use strace or lsof to try to see what they are doing.

### What should I do if I’ve been compromised?

The first thing to do is not to panic, especially if the attacker is currently logged in. You need to be able to take back control of the machine before the attacker is aware that you know about them. If they realize you know about them they may well lock you out of your server and start destroying any assets out of spite.

If you are not very technical then simply shut down the server. Either from the server itself with shutdown -h now or systemctl poweroff. Or log into your hosting provider’s control panel and shut down the server. Once it’s powered off you can work on the needed firewall rules and consult with your provider in your own time.

If you’re feeling a bit more confident and your hosting provider has an upstream firewall then create and enable the following two rules in this order:

1.  Allow SSH traffic from only your IP address.

2.  Block everything else, not just SSH but every protocol on every port.

This will immediately kill their SSH session and give only you access to the server.

If you don’t have access to an upstream firewall then you will have to create and enable these firewall rules on the server itself and then, when they are in place kill the attacker’s ssh session with the kill command.

A final method, where available, is to log into the server via an out-of-band connection such as the serial console and stop networking with systemctl stop network.service. This will completely stop any network access so you can now enable the firewall rules in your own time.

Once you have regained control of the server do not trust it.

Do not attempt to fix things up and continue using the server. You can never be sure what the attacker did and so you can never sure the server is secure.

The only sensible course of action is to copy off all the data that you need and start again from a fresh install.

--------------------------------------------------------------------------------

via: https://bash-prompt.net/guides/server-hacked/

作者：[Elliot Cooper][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bash-prompt.net
