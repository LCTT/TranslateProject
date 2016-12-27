translating by dongdongmian  
translating by WangYihang  
  
如何在Ubuntu环境下搭建邮件服务器  
============================================================  
  
 ![mail server](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/mail-stack.jpg?itok=SVMfa8WZ "mail server")   
在这个系列的文章中，我们将通过使用Postfix,Dovecot,和openssl这三款工具来为你展示如何在ubuntu系统上搭建一个既可靠又很容易配置的邮件服务器。[Creative Commons Zero][2]Pixabay  
  
在这个容器和宏服务技术日新月异的时代，值得庆幸的是有些事情并没有改变，例如搭建一个Linux下的邮件服务器， It's still a dance of many steps and knitting together several different servers, 一旦你将这些步骤组合在一起，一切都是那么和谐稳定, instead of winking in and out of existence like microservices. 在这一系列的教程中，我们将在ubuntu系统上构建一个既可靠又容易配置的邮件服务器通过使用Postfix, Dovecot, 和OpenSSL这三款工具。  
  
Postfix是一个古老又可靠的软件，它比sendmail更加容易配置和使用，原始的Unix系统的MTA软件(还有人仍然在用sendmail吗?). Exim是一个在Debain系统上的默认的MTA软件，它比postfix更加轻量而且超级容易配置，因此我们在将来的教程中会推出Exim的教程。  
(翻译者注 : MTA : 将来自MUA的信件转发给指定的用户的程序一般被称之为因特网邮件传送代理MTA（Mail Transfer Agent , 详情请阅读[维基百科](https://en.wikipedia.org/wiki/Message_transfer_agent)）。在linux/Unix系统上，最著名的MTA有sendamil、qmail等程序。)。  
  
  
Dovecot(译者注 : 详情请阅读[维基百科](https://en.wikipedia.org/wiki/Dovecot_(software)))和Courier是两个非常受欢迎的优秀的IMAP/POP3协议的服务器软件，Dovecot更加的轻量并且更加容易配置。  
  
你必须要保证你的邮件是安全的，因此我们就需要使用到OpenSSL这个软件，OPENSSL也支持一些很好用的工具来测试你的邮件服务器。  
  
为了简单起见，在这一系列的教程中，我们将指导大家安装一个在公网上的邮件服务器，你应该拥有一个公网的网络而且需要确保它是开启的而且正在正常工作，[查看如何获取一个公网服务器的教程请点击这里]，然后，你就可以注册你的域名，将你的域名解析到你的公网服务器的IP，并为你的服务器配置相应的防火墙，这个过程网上已经有很多很详细的教程了，这里不再赘述，请大家认真完成这个作业。  
  
### 一些术语  
  
让我们先来快速了解一些术语，因为当我们了解了这些术语的时候就能知道这些见鬼的东西到底是什么。 :D  
  
> *   **MTA**: Mail transfer agent(邮件转发代理) 基于SMTP协议(简单邮件传输协议)的服务端, 就像Postfix，Exim，Sendmail ,SMTP服务端在这些工具之间进行相互通信。  
*   **MUA**: Mail user agent(邮件用户代理)你本地的邮件客户端，例如 : Evolution, KMail, Claws Mail, 或者 Thunderbird(译者注 : 例如国内的foxmail)。  
*   **POP3**: Post-office protocol, the simplest(邮局协议版本3) POP3协议，这个简单的协议是为了从SMTP服务器中获取邮件并提供给你本地的邮件客户端，一个POP服务端是非常简单而且很小巧的，你可以为数以千计的用户提供服务(From a single box?)。  
*   **IMAP**: Interactive message access protocol  IMAP协议(邮件访问协议)，许多企业使用这个协议因为邮件可以被保存在服务器上，所以用户不必担心会丢失消息，IMAP服务器需要大量的内存和存储空间。  
*   **TLS**: Transport socket layer(安全传输层协议),一个SSL(Secure Sockets Layer 安全套接层)的改良版，为身份认证提供了加密的传输服务。  
*   **SASL**: Simple authentication(简单验证安全层) and security layer 简单身份认证与安全层 ，为需要加密身份认证的用户服务，SASL进行身份认证，而上面说的TLS保证数据进行加密传输。  
*   **StartTLS**: 一个像TLS一样众所周知的协议  它提供一种方式将纯文本连接升级为加密连接（TLS或SSL）。  
  只有通信的双方都支持SSL/TLS的时候才会进行加密，如果一方不支持加密，则使用明文传输).StartTLS会使用标准的端口 25 (SMTP), 110 (POP3), and 143 (IMAP) 来进行明文通信以代替对应端口的加密通信465 (SMTP), 995 (POP3), and 993 (IMAP)  
  
### 是的 ， 我们仍然在使用snedmail这个工具  
  
  绝大多数的Linux版本仍然还保留着 `/usr/sbin/sendmail` . 在大多数的Linux发行版中，`/usr/sbin/sendmail` 会创建一个符号链接到你已经安装的MTA软件，然而很多版本的Linux依然还保留着`/usr/sbin/sendmail`，这也是故意这样做的。  
  
### 如何安装postfix  
  
`apt-get install postfix`   
你可以直接使用apt-get来安装，在你安装postfix你要特别小心，安装程序会打开一个向导，这个向导会询问你想到搭建的服务器类型，你要选择"Internet Server"，为你的公网服务器，假设你的域名服务已经正确配置，(我这么多次提到这个是因为经常有人在这里出现错误)，你可以使用你的hostname 。 
  
  
  
 ![Postfix](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/postfix-1.png?itok=NJLdtICb "Postfix")   
  
图 1: `Postfix` 的配置。[Creative Commons Zero][1]Carla Schroder  
  
ubuntu系统会为postfix创建一个配置文件启动三个守护进程 : `master, qmgr`, and `pickup`，There is no Postfix command or daemon.  
  
```  
$ ps ax  
 6494 ? Ss 0:00 /usr/lib/postfix/master  
 6497 ? S  0:00 pickup -l -t unix -u -c  
 6498 ? S  0:00 qmgr -l -t unix -u   
```  
  
你可以使用postfix对你的配置文件的语法进行检查，如果你的配置文件是没有语法错误的，那么就不会有相应的输出。  
  
```  
$ sudo postfix check  
[sudo] password for carla:   
```  
  
可以使用 `netstat` 来验证 `postfix` 是否正在监听25端口。  
  
```  
$ netstat -ant  
tcp  0  0 0.0.0.0:25 0.0.0.0:* LISTEN  
tcp6 0  0 :::25      :::*      LISTEN  
```  
  
现在让我们再来让古老的 `telnet` 躁起来进行测试 :   
  
```  
$ telnet myserver 25  
Trying 127.0.1.1...  
Connected to myserver.  
Escape character is '^]'.  
220 myserver ESMTP Postfix (Ubuntu)  
**EHLO myserver**  
250-myserver  
250-PIPELINING  
250-SIZE 10240000  
250-VRFY  
250-ETRN  
250-STARTTLS  
250-ENHANCEDSTATUSCODES  
250-8BITMIME  
250 DSN  
**^]**  
  
telnet>   
```  
  
嘿，我们已经验证了我们的服务器名，而且postfix正在监听25端口而且正常响应了我们键入的命令。  
  
  
输入quit来退出telnet，例如 : 你刚才键入你服务器的交互环境的那些命令是粗体显示的，输出的信息是ESMTP协议的状态码。  
(译者注 : ESMTP (Extended SMTP)，是扩展 SMTP 就是对标准 SMTP 协议进行的扩展. 详情请阅读[维基百科](https://en.wikipedia.org/wiki/Extended_SMTP))  
  
> *   PIPELINING 允许多个命令同时执行，而不必对每个命令作出响应。  
*   SIZE tells 表示服务器可接收的最大消息大小。  
*   VRFY 可以告诉客户端某一个特定的邮箱地址是否存在，这通常被忽略 ,因为有可能会是一个安全漏洞。  
*   ETRN 适用于具有不规则（不规则的）互联网连接（连接，连通性）的站点。这样的站点可以使用ETRN从上游服务器请求邮件传递（交付），并且Postfix可以配置为将推送（推送）邮件传递到ETRN客户端。  
*   STARTTLS (详情见上述说明)。  
*   ENHANCEDSTATUSCODES, 增强型的状态码和错误码。  
*   8BITMIME, 支持8位MIME，这意味着完整的ASCII字符集。一次一次，原始的ASCII是7位。  
*   DSN, 传输状态通知，通知你传输时的错误。  
  
postfix的主配置文件是 : `/etc/postfix/main.cf`，这个文件是安装程序创建的，可以查看这个资料 : 来查看这个配置文件的列表， `/etc/postfix/postfix-files`这个文件描述了postfix完整的安装过程  
  
下周的教程我们会讲解Dovecot的安装和测试，然后会给我们自己发送一些邮件。  
  
--------------------------------------------------------------------------------  
  
via: https://www.linux.com/learn/how-build-email-server-ubuntu-linux  
  
作者：[CARLA SCHRODER][a]  
译者：[WangYihang](https://github.com/WangYihang)  
校对：[校对者ID](https://github.com/校对者ID)  
  
本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出  
  
[a]:https://www.linux.com/users/cschroder  
[1]:https://www.linux.com/licenses/category/creative-commons-zero  
[2]:https://www.linux.com/licenses/category/creative-commons-zero  
[3]:https://www.linux.com/files/images/postfix-1png  
[4]:https://www.linux.com/files/images/mail-stackjpg  
[5]:https://www.linux.com/learn/dnsmasq-easy-lan-name-services  
[6]:http://www.postfix.org/postconf.5.html  
