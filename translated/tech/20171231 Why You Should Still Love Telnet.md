Telnet，爱一直在
======
Telnet, 是系统管理员登录远程服务器的协议和工具。然而，由于所有的通信都没有加密，包括密码，都是明文发送的。Telnet 在 SSH 被开发出来之后就基本弃用了。

登录远程服务器，你可能不会也从未考虑过它。但这并不意味着 `telnet` 命令在调试远程连接问题时不是一个实用的工具。

本教程中，我们将探索使用 `telnet` 解决所有常见问题，“我怎么又连不上啦？”	

这种讨厌的问题通常会在安装了像web服务器、邮件服务器、ssh服务器、Samba服务器等诸如此类的事之后遇到，用户无法连接服务器。

`telnet` 不会解决问题但可以很快缩小问题的范围。

`telnet` 用来调试网络问题的简单命令和语法：
```
telnet <hostname or IP> <port>

```

因为 `telnet` 最初通过端口建立连接不会发送任何数据，适用于任何协议包括加密协议。

连接问题服务器有四个可能会遇到的主要问题。我们会研究这四个问题，研究他们意味着什么以及如何解决。

本教程默认已经在 `samba.example.com` 安装了 [Samba][1] 服务器而且本地客户无法连上服务器。

### Error 1 - 连接挂起

首先，我们需要试着用 `telnet` 连接 Samba 服务器。使用下列命令 (Samba 监听端口445)：
```
telnet samba.example.com 445

```

有时连接会莫名停止：
```
telnet samba.example.com 445
Trying 172.31.25.31...

```

这意味着 `telnet` 没有收到任何回应来建立连接。有两个可能的原因：

  1. 你和服务器之间有个路由器宕掉了。
  2. 防火墙拦截了你的请求。



为了排除 **1.** 在服务器上运行一个快速 [`mtr samba.example.com`][2] 。如果服务器是可达的那么便是防火墙（注意：防火墙总是存在的）。

首先用 `iptables -L -v -n` 命令检查服务器本身有没有防火墙, 没有的话你能看到以下内容：
```
iptables -L -v -n
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target prot opt in out source destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target prot opt in out source destination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target prot opt in out source destination

```

如果你看到其他东西那可能就是问题所在了。为了检验，停止 `iptables` 一下并再次运行 `telnet samba.example.com 445` 看看你是否能连接。如果你还是不能连接看看你的提供商或企业有没有防火墙拦截你。

### Error 2 - DNS 问题

DNS问题通常发生在你正使用的主机名没有解析到 IP 地址。错误如下：
```
telnet samba.example.com 445
Server lookup failure: samba.example.com:445, Name or service not known

```

第一步是把主机名替换成服务器的IP地址。如果你可以连上那么就是主机名的问题。

有很多发生的原因（以下是我见过的）：

  1. 域注册了吗？用 `whois` 来检验。
  2. 域过期了吗？用 `whois` 来检验。
  3. 是否使用正确的主机名？用 `dig` 或 `host` 来确保你使用的主机名解析到正确的 IP。
  4. 你的 **A** 记录正确吗？确保你没有偶然创建类似 `smaba.example.com` 的 **A** 记录。



一定要多检查几次拼写和主机名是否正确（是 `samba.example.com` 还是 `samba1.example.com`）这些经常会困扰你特别是长、难或外来主机名。

### Error 3 - 服务器没有侦听端口

这种错误发生在 `telnet` 可达服务器但是指定端口没有监听。就像这样：
```
telnet samba.example.com 445
Trying 172.31.25.31...
telnet: Unable to connect to remote host: Connection refused

```

有这些原因：

  1. 你 **确定** 连接的是正确的服务器？
  2. 你的应用服务器没有侦听预期的端口。在服务器上运行 `netstat -plunt` 来查看它究竟在干什么并看哪个端口才是对的，实际正在监听中的。
  3. 应用服务器没有运行。这可能突然而又悄悄地发生在你启动应用服务器之后。启动服务器运行 `ps auxf` 或 `systemctl status application.service` 查看运行。



### Error 4 - 连接被服务器关闭

这种错误发生在连接成功建立但是应用服务器建立的安全措施一连上就将其结束。错误如下：
```
telnet samba.example.com 445
Trying 172.31.25.31...
Connected to samba.example.com.
Escape character is '^]'.
��Connection closed by foreign host.

```

最后一行 `Connection closed by foreign host.` 意味着连接被服务器主动终止。为了修复这个问题，需要看看应用服务器的安全设置确保你的 IP 或用户允许连接。

### 成功连接

成功的 `telnet` 连接如下：
```
telnet samba.example.com 445
Trying 172.31.25.31...
Connected to samba.example.com.
Escape character is '^]'.

```

连接会保持一段时间只要你连接的应用服务器时限没到。

输入 `CTRL+]` 中止连接然后当你看到 `telnet>` 提示，输入 "quit" 并点击 ENTER 例：
```
telnet samba.example.com 445
Trying 172.31.25.31...
Connected to samba.example.com.
Escape character is '^]'.
^]
telnet> quit
Connection closed.

```

### 总结

客户程序连不上服务器的原因有很多。确切原理很难确定特别是当客户是图形用户界面提供很少或没有错误信息。用 `telnet` 并观察输出可以让你很快确定问题所在节约很多时间。

--------------------------------------------------------------------------------

via: https://bash-prompt.net/guides/telnet/

作者：[Elliot Cooper][a]
译者：[XYenChi](https://github.com/XYenChi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bash-prompt.net
[1]:https://www.samba.org/
[2]:https://www.systutorials.com/docs/linux/man/8-mtr/
