如何在 Ubuntu 环境下搭建邮件服务器（一）
============================================================ 

![mail server](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/mail-stack.jpg?itok=SVMfa8WZ "mail server") 

在这个系列的文章中，我们将通过使用 Postfix、Dovecot 和 openssl 这三款工具来为你展示如何在 ubuntu 系统上搭建一个既可靠又易于配置的邮件服务器。 
 
在这个容器和微服务技术日新月异的时代，值得庆幸的是有些事情并没有改变，例如搭建一个 Linux 下的邮件服务器，仍然需要许多步骤才能间隔各种服务器耦合在一起，而当你将这些配置好，放在一起，却又非常可靠稳定，不会像微服务那样一睁眼有了，一闭眼又没了。 在这个系列教程中我们将通过使用 Postfix、Dovecot 和 openssl 这三款工具在 ubuntu 系统上搭建一个既可靠又易于配置的邮件服务器。 
 
Postfix 是一个古老又可靠的软件，它比原始的 Unix 系统的 MTA 软件 sendmail 更加容易配置和使用（还有人仍然在用sendmail 吗？）。 Exim 是 Debain 系统上的默认 MTA 软件，它比 Postfix 更加轻量而且超级容易配置，因此我们在将来的教程中会推出 Exim 的教程。

Dovecot（LCTT 译注：详情请阅读[维基百科](https://en.wikipedia.org/wiki/Dovecot_(software)）和 Courier 是两个非常受欢迎的优秀的 IMAP/POP3 协议的服务器软件，Dovecot 更加的轻量并且易于配置。 
 
你必须要保证你的邮件通讯是安全的，因此我们就需要使用到 OpenSSL 这个软件，OpenSSL 也提供了一些很好用的工具来测试你的邮件服务器。

为了简单起见，在这一系列的教程中，我们将指导大家安装一个在局域网上的邮件服务器，你应该拥有一个局域网内的域名服务，并确保它是启用且正常工作的，查看这篇“[使用 dnsmasq 为局域网轻松提供 DNS 服务][5]”会有些帮助，然后，你就可以通过注册域名并相应地配置防火墙，来将这台局域网服务器变成互联网可访问邮件服务器。这个过程网上已经有很多很详细的教程了，这里不再赘述，请大家继续跟着教程进行即可。
 
### 一些术语

让我们先来快速了解一些术语，因为当我们了解了这些术语的时候就能知道这些见鬼的东西到底是什么。 :D 

* **MTA**：邮件传输代理（Mail Transfer Agent），基于 SMTP 协议（简单邮件传输协议）的服务端，比如 Postfix、Exim、Sendmail 等。SMTP 服务端彼此之间进行相互通信（LCTT 译注 : 详情请阅读[维基百科](https://en.wikipedia.org/wiki/Message_transfer_agent)）。
* **MUA**： 邮件用户代理（Mail User Agent），你本地的邮件客户端，例如 : Evolution、KMail、Claws Mail 或者 Thunderbird（LCTT 译注 : 例如国内的 Foxmail）。 
* **POP3**：邮局协议（Post-Office Protocol）版本 3，将邮件从 SMTP 服务器传输到你的邮件客户端的的最简单的协议。POP 服务端是非常简单小巧的，单一的一台机器可以为数以千计的用户提供服务。 
* **IMAP**： 交互式消息访问协议（Interactive Message Access Protocol），许多企业使用这个协议因为邮件可以被保存在服务器上，而用户不必担心会丢失消息。IMAP 服务器需要大量的内存和存储空间。 
* **TLS**：传输套接层（Transport socket layer）是 SSL（Secure Sockets Layer，安全套接层）的改良版，为 SASL 身份认证提供了加密的传输服务层。 
* **SASL**：简单身份认证与安全层（Simple Authentication and Security Layer），用于认证用户。SASL进行身份认证，而上面说的 TLS 提供认证数据的加密传输。 
* **StartTLS**: 也被称为伺机 TLS 。如果服务器双方都支持 SSL/TLS，StartTLS 就会将纯文本连接升级为加密连接（TLS 或 SSL）。如果有一方不支持加密，则使用明文传输。StartTLS 会使用标准的未加密端口 25 （SMTP）、 110（POP3）和 143 （IMAP）而不是对应的加密端口 465（SMTP）、995（POP3） 和 993 （IMAP）。

### 啊，我们仍然有 sendmail

绝大多数的 Linux 版本仍然还保留着 `/usr/sbin/sendmail` 。 这是在那个 MTA 只有一个 sendmail 的古代遗留下来的痕迹。在大多数 Linux 发行版中，`/usr/sbin/sendmail` 会符号链接到你安装的 MTA 软件上。如果你的 Linux 中有它，不用管它，你的发行版会自己处理好的。

### 安装 Postfix 

使用 `apt-get install postfix` 来做基本安装时要注意（图 1），安装程序会打开一个向导，询问你想要搭建的服务器类型，你要选择“Internet Server”，虽然这里是局域网服务器。它会让你输入完全限定的服务器域名（例如： myserver.mydomain.net）。对于局域网服务器，假设你的域名服务已经正确配置，(我多次提到这个是因为经常有人在这里出现错误)，你也可以只使用主机名。 

![Postfix](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/postfix-1.png?itok=NJLdtICb "Postfix") 
 
*图 1：Postfix 的配置。*

Ubuntu 系统会为 Postfix 创建一个配置文件，并启动三个守护进程 : `master`、`qmgr` 和 `pickup`，这里没用一个叫  Postfix 的命令或守护进程。（LCTT 译注：名为 `postfix` 的命令是管理命令。）
 
``` 
$ ps ax 
 6494 ? Ss 0:00 /usr/lib/postfix/master 
 6497 ? S 0:00 pickup -l -t unix -u -c 
 6498 ? S 0:00 qmgr -l -t unix -u 
``` 

你可以使用 Postfix 内置的配置语法检查来测试你的配置文件，如果没用发现语法错误，不会输出任何内容。 
 
```
$ sudo postfix check 
[sudo] password for carla: 
```
 
使用 `netstat` 来验证 `postfix` 是否正在监听 25 端口。 

```
$ netstat -ant 
tcp 0 0 0.0.0.0:25 0.0.0.0:* LISTEN 
tcp6 0 0 :::25  :::*  LISTEN 
```

现在让我们再操起古老的 `telnet` 来进行测试 : 

``` 
$ telnet myserver 25 
Trying 127.0.1.1... 
Connected to myserver. 
Escape character is '^]'. 
220 myserver ESMTP Postfix (Ubuntu) 
EHLO myserver
250-myserver 
250-PIPELINING 
250-SIZE 10240000 
250-VRFY 
250-ETRN 
250-STARTTLS 
250-ENHANCEDSTATUSCODES 
250-8BITMIME 
250 DSN 
^]
 
telnet> 
``` 

嘿，我们已经验证了我们的服务器名，而且 Postfix 正在监听 SMTP 的 25 端口而且响应了我们键入的命令。 

按下 `^]` 终止连接，返回 telnet。输入 `quit` 来退出 telnet。输出的 ESMTP（扩展的 SMTP ） 250 状态码如下。 
（LCTT 译注： ESMTP (Extended SMTP)，即扩展 SMTP，就是对标准 SMTP 协议进行的扩展。详情请阅读[维基百科](https://en.wikipedia.org/wiki/Extended_SMTP)） 
 
* **PIPELINING** 允许多个命令流式发出，而不必对每个命令作出响应。 
* **SIZE** 表示服务器可接收的最大消息大小。 
* **VRFY** 可以告诉客户端某一个特定的邮箱地址是否存在，这通常应该被取消，因为这是一个安全漏洞。 
* **ETRN** 适用于非持久互联网连接的服务器。这样的站点可以使用 ETRN 从上游服务器请求邮件投递，Postfix 可以配置成延迟投递邮件到 ETRN 客户端。 
* **STARTTLS** （详情见上述说明）。 
* **ENHANCEDSTATUSCODES**，服务器支撑增强型的状态码和错误码。 
* **8BITMIME**，支持 8 位 MIME，这意味着完整的 ASCII 字符集。最初，原始的 ASCII 是 7 位。 
* **DSN**，投递状态通知，用于通知你投递时的错误。 
 
Postfix 的主配置文件是： `/etc/postfix/main.cf`，这个文件是安装程序创建的，可以参考[这个资料][6]来查看完整的 `main.cf` 参数列表， `/etc/postfix/postfix-files` 这个文件描述了 Postfix 完整的安装文件。 
 
下一篇教程我们会讲解 Dovecot 的安装和测试，然后会给我们自己发送一些邮件。 
 
-------------------------------------------------------------------------------- 
 
via: https://www.linux.com/learn/how-build-email-server-ubuntu-linux 
 
作者：[CARLA SCHRODER][a] 
译者：[WangYihang](https://github.com/WangYihang) 
校对：[wxy](https://github.com/wxy) 
 
本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出 
 
[a]:https://www.linux.com/users/cschroder 
[1]:https://www.linux.com/licenses/category/creative-commons-zero 
[2]:https://www.linux.com/licenses/category/creative-commons-zero 
[3]:https://www.linux.com/files/images/postfix-1png 
[4]:https://www.linux.com/files/images/mail-stackjpg 
[5]:https://www.linux.com/learn/dnsmasq-easy-lan-name-services 
[6]:http://www.postfix.org/postconf.5.html 

