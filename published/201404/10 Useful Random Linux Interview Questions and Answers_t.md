10个在随机出现在面试中的Linux问题及答案
=========================================
为了给你们带来一些小惊喜，这次我们准备了一些在面试中随机出现的问题而不是专门关于某个领域的问题。这些问题肯定会在不深入学习新知识的前提下使你在面试中脱颖而出。

![](http://www.tecmint.com/wp-content/uploads/2014/02/Random-Interview-Questions.png)

1.假设你在为你工作的公司维护一份日常的备份。这份备份是以压缩后的格式而被维护着。现在你需要检查一份两个月之前的日志，你应该提出什么样的建议从而可以在不解压这份备份的前提下完成检查日志的任务？

> **答案**： 在不解压文件的前提下检查文件内容，我们需要用到'zcat'。zcat这个工具可以轻松完成这个任务。

    # zcat ­f phpshell­2.4.tar.gz

2.你需要追踪你系统中发生的事件，你应该怎么做？

> **答案**： 为了追踪系统中发生的事件，我们需要用到叫做syslogd的这个后台程序。syslogd这个后台程序可以追踪系统信息并将其保存到指定的日志文件中。

启用'syslogd'这个后台进程会在路径'/var/log/syslog'中生成一个日志文件。syslogd应用对解决Linux系统中的问题十分有用。标准生成的日志文件和下面这个例子很像。

![syslogd](http://www.tecmint.com/wp-content/uploads/2014/02/syslongd.jpg)

3.如何禁止特定IP访问FTP服务器？

> **答案**： 我们可以通过运用tcp_wrapper来禁止可疑的IP访问。首先在路径'/etc/vsftpd.conf'的配置文件中，将tcp_wrapper这个参数设置为"tcp_wrapper=YES"，然后在'/etc/host.deny'文件中加入可疑的IP地址。

**禁止访问的IP地址**

打开'/etc/hosts.deny'文件。

    # vi /etc/hosts.deny

在文件底端加入拒绝访问的IP地址

    #
    # hosts.deny    This file contains access rules which are used to
    #               deny connections to network services that either use
    #               the tcp_wrappers library or that have been
    #               started through a tcp_wrappers-enabled xinetd.
    #
    #               The rules in this file can also be set up in
    #               /etc/hosts.allow with a 'deny' option instead.
    #
    #               See 'man 5 hosts_options' and 'man 5 hosts_access'
    #               for information on rule syntax.
    #               See 'man tcpd' for information on tcp_wrappers
    #
    vsftpd:172.16.16.1

4.告诉我们Telnet和SSH之间的区别？

> **答案**： Telnet和SSH都是用来远程管理系统的协议。与Telnet直接传输数据正好相反，安全的SSH通信协议需要通信中有密钥的交换，这说明telnet相比较于SSH不安全。

5.你需要终止你的X server，但当你尝试杀进程的时候，你遇到了表示不能退出X server的错误信息。你准备怎么做？

> **答案**： 当你尝试杀X server的进程时，系统不会让你像使用'/etc/init.d/gdm stop'一样正常的退出X server。我们需要执行一个使X server重启的特别的键位组合'Ctrl+ Alt+ BackSpace'。

6.告诉我命令'ping'和'ping6'的区别？ 

> **答案**： 这两个命令有同样的功能，但'ping6'命令可被用于ipv6的IP地址。

7.你想要在Home目录下寻找*.tar文件并一次性删除，你会怎么做？

> **答案**： 我们要同时用到find和rm命令来删除所有*.tar文件

    # find /home/ ­name '*.tar' | xargs rm ­rf

8.locate和slocate命令的区别？

> **答案**： slocate(secure locate)会寻找所有用户有权限访问的文件，然而locate会搜索（它的数据库里面的）所有更新过的结果。

9.你要在当前目录中所有“.txt”文件中搜索“Tecmint”这个字符串，你怎么做？

> **答案**： 用find命令在当前目录递归寻找文件中的“Tecmint”字符串。

    # find ­name “*.txt” | xargs grep “Tecmint”

10.你要向所有已连接的用户发送“Server is going down for maintenance”这样一条信息，你怎么做？

> **答案**： 运用wall命令就可以很容易地实现，wall命令可以向所有已连接服务器的用户发送信息。

    # echo please save your work, immediately. The server is going down for Maintenance at 12:30 Pm, sharply. | wall

![wall command](http://www.tecmint.com/wp-content/uploads/2014/02/wall.jpg)

--------------------------------------------------------------------------------

via: http://www.tecmint.com/useful-random-linux-interview-questions-and-answers/

译者：ThomazL(https://github.com/ThomazL) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
