20个关于Postfix的面试题
================================================================================
### 问题1：什么是 Postfix，它的默认端口是多少？ ###

答：Postfix 是一个开源的 MTA（邮件传送代理，英文名：Mail Transfer Agent）,用于转发 email。相信很多人知道 Sendmail，而 Postfix 是它的替代品。默认端口是25。

### 问题2：Postfix 和 Sendmail 有什么区别？ ###

答：Postfix 使用模块化设计，由多个独立的可执行程序组成；而 Sendmail 被设计成有一个强大的后台进程提供所有服务。

### 问题3：什么是 MTA，它在邮件系统中扮演什么角色？ ###

答：MTA 是 Mail Transfer Agent （邮件传输代理）的缩写。MTA 负责接收和发送邮件、确定发送路径和地址重写（LCTT译注：address rewriting，就是完善发送地址，比如将“username”这个地址重写为“username@example.com”）。本地转发就是将邮件发送给 MDA。Qmail、Postix、Sendmail 都是 MTA。

### 问题4：什么是 MDA？ ###

答：MDA 是 Mail Delivery Agent （邮件投递代理）的缩写。MDA 这个程序用于从 MTA 获取邮件并投递至本地收件人的邮箱。MDA 通常可以过滤邮件或为邮件分类。一个 MDA 也能决定一封邮件是否需要转发到另一个邮箱地址。Procmail 就是一个 MDA。

### 问题5：什么是 MUA？ ###

答：MUA 是 Mail User Agent （邮件用户代理）的缩写。MUA 是一个邮件客户端软件，可以用来写邮件、发送邮件、接收邮件。发送邮件时使用的是 MTA；接收邮件时可以从邮件存储区直接收取，也可以通过 POP/IMAP 服务器间接收取。Outlook、Thunkerbird、Evolution 都是 MUA。

### 问题6：邮件服务器里 postmaster 的作用是什么？ ###

答：邮件管理者一般就是 postmaster。一个 postmaster 的责任就是保证邮件系统正常工作、更新系统配置、添加/删除邮箱帐号，以及其他工作。每个域中必须存在一个 postmaster 的别名（LCTT译注：postmaster 别名用于接受一些其它服务器/用户对该邮件系统的沟通邮件，如关于垃圾邮件拒收的投诉等，通常都会直接被邮件服务器的管理员所接受。一些系统错误和提示的邮件，也往往以postmaster 作为发件人），用于将邮件发往正确的用户。

### 问题7：Postfix 都有些什么重要的进程？ ###

答：以下是 Postfix 邮件系统里最重要的后台进程列表：

- **master**：这条进程是 Postfix 邮件系统的大脑，它产生所有其他进程。
- **smtpd**：作为服务器端程序处理所有外部连进来的请求。
- **smtp**：作为客户端程序处理所有对外发起连接的请求。
- **qmgr**：它是 Postfix 邮件系统的心脏，处理和控制邮件队列里面的所有消息。
- **local**：这是 Postfix 自有的本地投递代理MDA，就是它负责把邮件保存到邮箱里。

### 问题8：Postfix 服务器的配置文件是什么？ ###

答：有两个主要配置文件：

- **/etc/postfix/main.cf**：这个文件保存全局配置信息，所有进程都会用到，除非这些配置在 master.cf 文件中被重新设置了。
- **/etc/postfix/master.cf**：这个文件保存了额外的进程运行时环境参数，在 main.cf 文件中定义的配置可能会被本文件的配置覆盖掉。

### 问题9：如何将 Postfix 重启以及设为开机启动？ ###

答：使用这个命令重启：`service postfix restart`；使用这个命令设为开机启动：`chkconfig postfix on`

### 问题10：怎么查看 Postfix 的邮件队列？ ###

答：Postfix 维护两个队列：未决邮件队列（pending mails queue）和等待邮件队列（deferred mail queue）。等待队列包含了暂时发送失败、需要重新发送的邮件，Postfix 会定期重发（默认5分钟，可自定义设置）。（LCTT译注：其实 Postfix 维护5个队列：输入队列，邮件进入 Postfix 系统的第一站；活动队列，qmgr 将输入队列的邮件移到活动队列；等待队列，保存暂时不能发送出去的邮件；故障队列，保存受损或无法解读的邮件；保留队列，将邮件无限期留在 Postfix 队列系统中。）

列出邮件队列里面所有邮件：

    # postqueue -p

保存邮件队列名单：

    # postqueue -p > /mnt/queue-backup.txt

让 Postfix 马上处理队列：

    # postqueue -f

### 问题11：如何删除邮件队列里面的邮件？ ###

答：以下命令删除所有邮件：

    # postsuper -d ALL

以下命令只删除等待队列中的邮件：

    # postsuper -d ALL deferred

### 问题12：如何通过命令来检查 Postfix 配置信息？ ###

答：使用`postconf -n`命令可以查看，它会过滤掉配置文件里面被注释掉的配置信息。

### 问题13：实时查看邮件日志要用什么命令？ ###

答：`tail -f /var/log/maillog` 或 `tailf /var/log/maillog`

### 问题14：如何通过命令行发送测试邮件？ ###

答：参考下面的命令：

    # echo "Test mail from postfix" | mail -s "Plz ignore" info@something.com

### 问题15：什么是“开放邮件转发（Open Relay）”？ ###

答：开放邮件转发是 SMTP 服务器的一项设定，允许因特网上任意的其他用户能通过该服务器转发邮件，而不是直接发送到某个帐号的服务器或只允许授权用户通过它来发送邮件。过去，这项功能在许多邮件服务器中都是默认开启的，但是现在已经不再流行了，因为邮件转发会导致大量垃圾邮件和病毒邮件在网络上肆虐。

### 问题16：什么是 Postfix 上的邮件转发主机？ ###

答：转发主机是 SMTP 的地址，如果在配置文件中有配置，那么所有输入邮件都将被 SMTP 服务器转发。

### 问题17：什么是灰名单？ ###

答：灰名单（LCTT译注：介于白名单和黑名单之间）是一种用于拦截垃圾邮件的技术。一个 MTA 使用灰名单时就会“暂时拒绝”未被识别的发送者发来的所有邮件。如果邮件是正当合理的，发起者会在一段时间后重新发送，然后这份邮件就能被接收。（LCTT译注：灰名单基于这样一个事实，就是大多数的垃圾邮件服务器和僵尸网络的邮件只发送一次，而会忽略要求它们在一定的时间间隔后再次发送的请求。）

### 问题18：邮件系统中 SPF 记录有什么重要作用？ ###

答：SPF 是 Sender Policy Framework 的缩写，用于帮助邮件域的拥有者确认发送方是否来自他们的域，目的是其他邮件系统能够保证发送方在发送邮件时来自经过授权的来源 —— 这种方法可以减小遇到邮件地址欺骗、网络钓鱼和垃圾邮件的风险。

### 问题19：邮件系统中 DKIM 有什么用处？ ###

答：域名密匙是一套电子邮件身份认证系统，用于验证邮件发送方的 DNS 域和邮件的完整性。域名密匙规范采用互联网电子邮件认证技术，建立了一套加强版协议：域名密匙识别邮件（就是 DKIM）。

### 问题20：邮件系统中 ASSP 的规则是什么？ ###

答：ASSP(Anti-Spam SMTP Proxy，反垃圾代理) 是一个网关服务器，安装在你的 MTA 前面，通过自建白名单、自动学习贝叶斯算法、灰名单、DNS 黑名单（DNSBL）、DNS 白名单（DNSWL）、URI黑名单（URIBL）、SPF、SRS、Backscatter、病毒扫描功能、附件阻拦功能、基于发送方等多种方法来反垃圾邮件。

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/postfix-interview-questions-answers/

作者：[Pradeep Kumar][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
