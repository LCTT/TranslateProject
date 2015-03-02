Auditd - Linux 服务器安全审计工具
================================================================================
首先，Linux中国祝贺读者 **2015羊年春节快乐，万事如意！** 。下面开始这个新年版审计工具的介绍。

安全防护是首先要考虑的问题。为了避免别人盗取我们的数据，我们需要时刻关注它。安全防护包括很多东西，审计是其中之一。

我们知道Linux系统上有一个叫 **auditd** 的审计工具。这个工具在大多数Linux操作系统中是默认安装的。那么auditd 是什么？如何使用呢？下面我们开始介绍。

### 什么是审计？ ###

auditd（或 auditd 守护进程）是Linux审计系统中用户空间的一个组件，其负责将审计记录写入磁盘。

![](http://blog.linoxide.com/wp-content/uploads/2014/12/what_is_auditd.png)

### 安装 auditd ###

Ubuntu系统中，我们可以使用 [wajig][1] 工具或者  **apt-get 工具** 安装auditd。

![](http://blog.linoxide.com/wp-content/uploads/2014/12/install_auditd.png)

按照下面的说明安装auditd，安装完毕后将自动安装以下auditd和相关的工具：

- **auditctl :** 即时控制审计守护进程的行为的工具，比如如添加规则等等。
- **/etc/audit/audit.rules :** 记录审计规则的文件。
- **aureport :** 查看和生成审计报告的工具。
- **ausearch :** 查找审计事件的工具
- **auditspd :** 转发事件通知给其他应用程序，而不是写入到审计日志文件中。
- **autrace :** 一个用于跟踪进程的命令。
- **/etc/audit/auditd.conf :** auditd工具的配置文件。

首次安装 **auditd** 后, 审计规则是空的。

可以使用以下命令查看：

    $ sudo auditctl -l

![](http://blog.linoxide.com/wp-content/uploads/2014/12/auditctl_no_rules.png)

以下我们介绍如何给auditd添加审计规则。

### 如何使用auditd ###

#### Audit 文件和目录访问审计 ####

我们使用审计工具的一个基本的需求是监控文件和目录的更改。使用auditd工具，我们可通过如下命令来配置(注意，以下命令需要root权限)。

**文件审计**

    $ sudo auditctl -w /etc/passwd -p rwxa

![](http://blog.linoxide.com/wp-content/uploads/2014/12/auditctl_w_etc_passwd.png)

**选项 :**

- **-w path :** 指定要监控的路径，上面的命令指定了监控的文件路径 /etc/passwd 
- **-p :** 指定触发审计的文件/目录的访问权限
- **rwxa ：** 指定的触发条件，r 读取权限，w 写入权限，x 执行权限，a 属性（attr）

#### 目录审计 ####

使用类似的命令来对目录进行审计，如下：

    $ sudo auditctl -w /production/

![](http://blog.linoxide.com/wp-content/uploads/2014/12/auditctl_w_production.png)

以上命令将监控对 **/production 目录** 的所有访问。

现在，运行 **auditctl -l** 命令即可查看所有已配置的规则。

![](http://blog.linoxide.com/wp-content/uploads/2014/12/auditctl_rules.png)

下面开始介绍审计日志。

### 查看审计日志 ###

添加规则后，我们可以查看 auditd 的日志。使用 **ausearch** 工具可以查看auditd日志。

我们已经添加规则监控 /etc/passwd 文件。现在可以使用  **ausearch** 工具的以下命令来查看审计日志了。

    $ sudo ausearch -f /etc/passwd

- **-f** 设定ausearch 调出 /etc/passwd文件的审计内容

下面是输出 ：

> **time**->Mon Dec 22 09:39:16 2014

> type=PATH msg=audit(1419215956.471:194): item=0 **name="/etc/passwd"** inode=142512 dev=08:01 mode=0100644 ouid=0 ogid=0 rdev=00:00 nametype=NORMAL

> type=CWD msg=audit(1419215956.471:194): **cwd="/home/pungki"**

> type=SYSCALL msg=audit(1419215956.471:194): arch=40000003 **syscall=5** success=yes exit=3 a0=b779694b a1=80000 a2=1b6 a3=b8776aa8 items=1 ppid=2090 pid=2231 **auid=4294967295 uid=1000 gid=1000** euid=0 suid=0 fsuid=0 egid=1000 sgid=1000 fsgid=1000 tty=pts0 ses=4294967295 **comm="sudo" exe="/usr/bin/sudo"** key=(null)

  下面开始解读输出结果。

- **time :** 审计时间。
- **name :** 审计对象
- **cwd :** 当前路径
- **syscall :** 相关的系统调用
- **auid :** 审计用户ID
- **uid 和 gid :** 访问文件的用户ID和用户组ID
- **comm :** 用户访问文件的命令
- **exe :** 上面命令的可执行文件路径

以上审计日志显示文件未被改动。

以下我们将要添加一个用户，看看auditd如何记录文件 /etc/passwd的改动的。

> **time->**Mon Dec 22 11:25:23 2014

> type=PATH msg=audit(1419222323.628:510): item=1 **name="/etc/passwd.lock"** inode=143992 dev=08:01 mode=0100600 ouid=0 ogid=0 rdev=00:00 nametype=DELETE

> type=PATH msg=audit(1419222323.628:510): item=0 **name="/etc/"** inode=131073 dev=08:01 mode=040755 ouid=0 ogid=0 rdev=00:00 nametype=PARENT

> type=CWD msg=audit(1419222323.628:510): **cwd="/root"**

> type=SYSCALL msg=audit(1419222323.628:510): arch=40000003 **syscall=10** success=yes exit=0 a0=bfc0ceec a1=0 a2=bfc0ceec a3=897764c items=2 ppid=2978 pid=2994 **auid=4294967295 uid=0 gid=0** euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=4294967295 **comm="chfn" exe="/usr/bin/chfn"** key=(null)

我们可以看到，在指定的时间，**/etc/passwd ** 被root用户(uid =0, gid=0)在/root目录下修改。/etc/passwd 文件是使用**/usr/bin/chfn** 访问的。

键入 **man chfn** 可以查看有关chfn更多的信息。

![](http://blog.linoxide.com/wp-content/uploads/2014/12/chfn.png)

下面我们看另外一个例子。

我们已经配置auditd去监控目录 /production/ 了。这是个新目录。所以我们用ausearch去查看日志的时候会发现什么都没有。

![](http://blog.linoxide.com/wp-content/uploads/2014/12/ausearch_production_empty.png)

下一步，使用root账户的ls命令列出 /production/ 下的文件信息。再次使用ausearch后，将会显示一些信息。

![](http://blog.linoxide.com/wp-content/uploads/2014/12/ausearch_production_ls.png)

> **time->**Mon Dec 22 14:18:28 2014
> type=PATH msg=audit(1419232708.344:527): item=0 **name="/production/"** inode=797104 dev=08:01 mode=040755 ouid=0 ogid=0 rdev=00:00 nametype=NORMAL
> type=CWD msg=audit(1419232708.344:527): cwd="/root"
> type=SYSCALL msg=audit(1419232708.344:527): arch=40000003 syscall=295 success=yes exit=3 a0=ffffff9c a1=95761e8 a2=98800 a3=0 items=1 ppid=3033 pid=3444 **auid=4294967295 uid=0 gid=0** euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=4294967295 **comm="ls" exe="/bin/ls"** key=(null)

和上一个一样，可以得出root账户使用ls命令访问了/production/目录，ls命令的文件目录是 /bin/ls

### 查看审计报告 ###

一旦定义审计规则后，它会自动运行。过一段时间后，我们可以看看auditd是如何帮我们跟踪审计的。

Auditd提供了另一个工具叫  **aureport** 。从名字上可以猜到， **aureport** 是使用系统审计日志生成简要报告的工具。

我们已经配置auditd去跟踪/etc/passwd文件。auditd参数设置后一段时间后，audit.log 文件就创建出来了。

生成审计报告，我们可以使用aureport工具。不带参数运行的话，可以生成审计活动的概述。

    $ sudo aureport

![](http://blog.linoxide.com/wp-content/uploads/2014/12/aureport_2.png)

如上，报告包含了大多数重要区域的信息。

上图可以看出有 **3 次授权失败**。 使用aureport，我们可以深入查看这些信息。

使用以下命令查看授权失败的详细信息：

    $ sudo aureport -au

![](http://blog.linoxide.com/wp-content/uploads/2014/12/aureport_authentication.png)

从上图可以看出，由两个用户在特定的时间授权失败。

如果我们想看所有账户修改相关的事件，可以使用-m参数。

    $ sudo aureport -m

![](http://blog.linoxide.com/wp-content/uploads/2014/12/aureport_m.png)

### Auditd 配置文件 ###

我们已经添加如下规则：

- $ sudo auditctl -w /etc/passwd -p rwxa
- $ sudo auditctl -w /production/

现在，如果确信这些规则可以正常工作，我们可以将其添加到**/etc/audit/audit.rules**中使得规则永久有效。以下介绍如何将他们添加到/etc/audit/audit.rules中去。

![](http://blog.linoxide.com/wp-content/uploads/2014/12/audit_rules_file.png)

**最后，别忘了重启auditd守护程序**

    # /etc/init.d/auditd restart

或

    # service auditd restart

![](http://blog.linoxide.com/wp-content/uploads/2014/12/audit_restart.png)

### 总结 ###

Auditd是Linux上的一个审计工具。你可以阅读auidtd文档获取更多使用auditd和工具的细节。例如，输入 **man auditd** 去看auditd的详细说明，或者键入 **man ausearch** 去看有关 ausearch 工具的详细说明。

**请谨慎创建规则**。太多规则会使得日志文件急剧增大！

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/auditd-tool-security-auditing/

作者：[Pungki Arianto][a]
译者：[shipsw](https://github.com/shipsw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/pungki/
[1]:http://linoxide.com/tools/wajig-package-management-debian/
