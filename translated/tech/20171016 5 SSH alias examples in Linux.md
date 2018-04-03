Linux 中的 5 个 SSH 别名例子
======
[![][1]][1]

作为一个 Linux 用户，我们常用[ ssh 命令][2] 来登入远程机器。ssh 命令你用得越多，你在键入一些重要的命令上花的时间也越多。我们可以用 [定义在你的 .bashrc 文件里的别名][3] 或函数来大幅度缩减花在命令行界面（CLI）的时间。但这不是最佳解决之道。最佳办法是在 ssh 配置文件中使用 **SSH-别名** 。

这里是我们能把 ssh 命令用得更好的几个例子。

ssh 到 AWS（译注：Amazon Web Services，亚马逊公司旗下云计算服务平台）实例的连接是一种痛。仅仅输入以下命令，每次也完全是浪费你时间。

```
ssh -p 3000 -i /home/surendra/mysshkey.pem ec2-user@ec2-54-20-184-202.us-west-2.compute.amazonaws.com
```

缩短到
```
ssh aws1
```

调试时连接到系统。

```
ssh -vvv the_good_user@red1.taggle.abc.com.au
```

缩短到
```
ssh xyz
```

在本篇中，我们将看到如何不使用 bash 别名或函数实现 ssh 命令的缩短。ssh 别名的主要优点是所有的 ssh 命令快捷方式都存储在一个单一文件,如此就易于维护。其他优点是 **对于类似于 SSH 和 SCP 的命令** 我们能用相同的别名。

在我们进入实际配置之前，我们应该知道 /etc/ssh/ssh_config、/etc/ssh/sshd_config 和 ~/.ssh/config 文件三者的区别。以下是对这些文件的解释。

## /etc/ssh/ssh_config 和 ~/.ssh/config 间的区别

系统级别的 SSH 配置项存放在 /etc/ssh/ssh_config，而用户级别的 ssh 配置项存放在 ~/.ssh/config 文件中。

## /etc/ssh/ssh_config 和 /etc/ssh/sshd_config 间的区别

系统级别的 SSH 配置项是在 /etc/ssh/ssh_config 文件中，而系统级别的 SSH 服务端配置项存放在 /etc/ssh/sshd_config 文件。

## **在 ~/.ssh/config 文件里配置项的语法**

~/.ssh/config 文件内容的语法。
```
配置项 值
配置项 值1 值2
```

**例 1：** 创建主机（www.linuxnix.com）的 SSH 别名

编辑 ~/.ssh/config 文件写入以下内容
```
Host tlj
 User root
 HostName 18.197.176.13
 port 22
```

保存此文件

以上 ssh 别名用了

  1. **tlj 作为一个别名的名称**
  2. **root 作为将要登入的用户**
  3. **18.197.176.13 作为主机的 IP 地址**
  4. **22 作为访问 SSH 服务的端口。**



输出：
```
sanne@Surendras-MacBook-Pro:~ > ssh tlj
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-93-generic x86_64)
 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud
Last login: Sat Oct 14 01:00:43 2017 from 20.244.25.231
root@linuxnix:~# exit
logout
Connection to 18.197.176.13 closed.
```

**例 2：** 不用密码用 ssh 密钥登到系统要用 **IdentityFile** 。

例：
```
Host aws
 User ec2-users
 HostName ec2-54-200-184-202.us-west-2.compute.amazonaws.com
 IdentityFile ~/Downloads/surendra.pem
 port 22
```

**例 3：** 对同一主机使用不同的别名。在下例中，我们对同一 IP/主机 18.197.176.13 用了 **tlj, linuxnix, linuxnix.com** 三个别名。

~/.ssh/config 文件内容
```
Host tlj linuxnix linuxnix.com
 User root
 HostName 18.197.176.13
 port 22
```

**输出：**
```
sanne@Surendras-MacBook-Pro:~ > ssh tlj
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-93-generic x86_64)
* Documentation: https://help.ubuntu.com
* Management: https://landscape.canonical.com
* Support: https://ubuntu.com/advantage
Get cloud support with Ubuntu Advantage Cloud Guest:
http://www.ubuntu.com/business/services/cloud
Last login: Sat Oct 14 01:00:43 2017 from 220.244.205.231
root@linuxnix:~# exit
logout
Connection to 18.197.176.13 closed.
sanne@Surendras-MacBook-Pro:~ > ssh linuxnix.com
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-93-generic x86_64)
* Documentation: https://help.ubuntu.com
* Management: https://landscape.canonical.com
* Support: https://ubuntu.com/advantage
```
```
Get cloud support with Ubuntu Advantage Cloud Guest:
http://www.ubuntu.com/business/services/cloud
Last login: Sun Oct 15 20:31:08 2017 from 1.129.110.13
root@linuxnix:~# exit
logout
Connection to 138.197.176.103 closed.
[6571] sanne@Surendras-MacBook-Pro:~ > ssh linuxnix
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-93-generic x86_64)
* Documentation: https://help.ubuntu.com
* Management: https://landscape.canonical.com
* Support: https://ubuntu.com/advantage
Get cloud support with Ubuntu Advantage Cloud Guest:
http://www.ubuntu.com/business/services/cloud
Last login: Sun Oct 15 20:31:20 2017 from 1.129.110.13
root@linuxnix:~# exit
logout
Connection to 18.197.176.13 closed.
```

**例 4：** 用相同的 SSH 别名复制文件到远程系统

语法：
```
**scp <文件名> <ssh_别名>:<位置>**
```

例子：
```
sanne@Surendras-MacBook-Pro:~ > scp abc.txt tlj:/tmp
abc.txt                           100%   12KB  11.7KB/s   00:01    
sanne@Surendras-MacBook-Pro:~ >
```

若我们已经将 ssh 主机设置好一个别名，由于 ssh 和 SCP 两者用几乎相同的语法和选项，SCP 用起来就轻而易举

请在下面尝试从本机 scp 一个文件到远程机器。

**例 5：** 解决 Linux中的 SSH 超时问题。默认情况，如果你不积极地使用终端，你的 ssh 登入就会超时。

[SSH 超时问题][5] 是一个更痛的点意味着你在一段时间后不得不重新登入到远程机器。我们能在 ~/.ssh/config 文件里边恰当地设置 SSH 超时时间来使你的会话不管在什么时间总是激活的。我们将用 2 个能保持会话存活的 SSH 选项来实现这一目的。之一是 ServerAliveInterval 保持你会话存活的秒数和 ServerAliveCountMax 在（经历了一个）给定数值的会话之后初始化会话。
```
**ServerAliveInterval A**
**ServerAliveCountMax B**
```

**例：**
```
Host tlj linuxnix linuxnix.com
 User root
 HostName 18.197.176.13
 port 22
 ServerAliveInterval 60**
 ServerAliveCountMax 30
```

在下篇中我们将会看到一些其他的退出方式。请保持访问 linuxnix.com。

--------------------------------------------------------------------------------

via: https://www.linuxnix.com/5-ssh-alias-examples-using-ssh-config-file/

作者：[Surendra Anne;Max Ntshinga;Otto Adelfang;Uchechukwu Okeke][a]
译者：[ch-cn](https://github.com/ch-cn)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxnix.com
[1]:https://www.linuxnix.com/wp-content/uploads/2017/10/SSH-alias-1.png
[2]:https://www.linuxnix.com/ssh-access-remote-linux-server/
[3]:https://www.linuxnix.com/linux-alias-command-explained-with-examples/
[4]:/cdn-cgi/l/email-protection
[5]:https://www.linuxnix.com/how-to-auto-logout/
