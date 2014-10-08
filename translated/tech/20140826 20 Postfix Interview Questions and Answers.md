Postfix的20个问答题
================================================================================
### 问题1：什么是 Postfix，它的默认端口是多少？ ###

答：Postfix 是一个开源的 MTA（邮件传送代理，英文名：Mail Transfer Agent）,用于转发 email。相信很多人知道 Sendmail，而 Postfix 是它的替代品。默认端口是25。

### 问题2：Postfix 和 Sendmail 有什么区别？ ###

答：Postfix 使用模块化设计，由多个独立的可执行程序组成；而 Sendmail 被设计成有一个强大的后台进程提供所有服务。

### 问题3：什么是 MTA，它在邮件系统中扮演什么角色？ ###

答：MTA 是 Mail Transfer Agent 的缩写。MTA 负责接收和发送邮件、确定发送路径和地址重写（LCTT：address rewriting，就是完善发送地址，比如将“username”这个地址重写为“username@example.com”）。本地转发就是将邮件发送给 MDA。Qmail、Postix、Sendmail 都是 MTA。

### 问题4：什么是 MDA？ ###

答：MDA 是 Mail Delivery Agent 的缩写。MDA 这个程序用于从 MTA 获取邮件并传送至本地接受者的邮箱。MDA 通常可以过滤邮件或为邮件分类。一个 MDA 也能决定一封邮件是否需要转发到另一个邮箱地址。Procmail 就是一个 MDA。

### 问题5：什么是 MUA？ ###

答：MUA 是 Mail User Agent 的缩写。MUA 是一个邮件客户端软件，可以用来写邮件、发送邮件、接收邮件。发送邮件时使用的时 MTA；接收邮件时可以从邮件存储区直接收取，也可以通过 POP/IMAP 服务器间接收取。Outlook、Thunkerbird、Evolution 都是 MUA。

### 问题6：Mailserver 里 postmaster 的作用是什么？ ###

答：邮件管理者一般就是 postmaster。一个 postmaster 的责任就是保证邮件系统正常工作、更新系统配置、添加/删除邮箱帐号，以及其他。每个域中必须存在一个 postmaster 的别名（LCTT：有环境的同学可以查看 /etc/aliases 这个文件，里面有关于 postmaster 的别名），用于将邮件发往正确的用户。

### Q:7 What are the important daemons in postfix ? ###
### 问题7： ###

Ans : Below are the lists of impportant daemons in postfix mail server :
答：

- **master** :The master daemon is the brain of the Postfix mail system. It spawns all other daemons.
- **smtpd**: The smtpd daemon (server) handles incoming connections.
- **smtp** :The smtp client handles outgoing connections.
- **qmgr** :The qmgr-Daemon is the heart of the Postfix mail system. It processes and controls all messages in the mail queues.
- **local** : The local program is Postfix’ own local delivery agent. It stores messages in mailboxes.

### Q:8 What are the configuration files of postfix server ? ###
### 问题8： ###

Ans: There are two main Configuration files of postfix :
答：

- **/etc/postfix/main.cf** : This file holds global configuration options. They will be applied to all instances of a daemon, unless they are overridden in master.cf
- **/etc/postfix/master.cf**  : This file defines runtime environment for daemons attached to services. Runtime behavior defined in main.cf may be overridden by setting service specific options.

### Q:9 How to restart the postfix service & make it enable across reboot ? ###
### 问题9： ###

Ans: Use this command to restart service “ Service postfix restart” and to make the service persist across the reboot, use the command “ chkconfig postfix on”
答：

### Q:10 How to check the mail's queue in postfix ? ###
### 问题10： ###

Ans: Postfix maintains two queues, the pending mails queue, and the deferred mail queue,the deferred mail queue has the mail that has soft-fail and should be retried (Temporary failure), Postfix retries the deferred queue on set intervals (configurable, and by default 5 minutes)
答：

To display the list of queued mails :

    # postqueue -p

To Save the output of above command :

    # postqueue -p > /mnt/queue-backup.txt

Tell Postfix to process the Queue now

    # postqueue -f

### Q:11 How  to delete mails from the queue in postfix ? ###
### 问题11： ###

Ans:  Use below command to delete all queued mails
答：

    # postsuper -d ALL

To delete only deferred mails from queue , use below command

    # postsuper -d ALL deferred

### Q:12 How to check postfix configuration from the command line ? ###
### 问题12： ###

Ans: Using the command 'postconf -n'  we can see current configuration of postfix excluding the lines which are commented.
答：

### Q:13 Which command is used to see live mail logs in postfix ? ###
### 问题13： ###

Ans: Use the command  'tail -f /var/log/maillog' or 'tailf /var/log/maillog'
答：

### Q:14 How to send a test mail from command line ? ###
### 问题14： ###

Ans: Use the below command to send a test mail from postfix itself :
答：

# echo "Test mail from postfix" | mail -s "Plz ignore" info@something.com

### Q:15  What is an Open mail relay ? ###
### 问题15： ###

Ans: An open mail relay is an SMTP server configured in such a way that it allows anyone on the Internet to send e-mail through it, not just mail destined to or originating from known users.This used to be the default configuration in many mail servers; indeed, it was the way the Internet was initially set up, but open mail relays have become unpopular because of their exploitation by spammers and worms.
答：

### Q:16 What is relay host in postfix ? ###
### 问题16： ###

Ans: Relay host is the smtp address , if mentioned in postfix config file , then all the incoming mails be relayed through smtp server.
答：

### Q:17 What is Greylisting ? ###
### 问题17： ###

Ans: Greylisting is a method of defending e-mail users against spam. A mail transfer agent (MTA) using greylisting will "temporarily reject" any email from a sender it does not recognize. If the mail is legitimate the originating server will, after a delay, try again and, if sufficient time has elapsed, the email will be accepted.
答：

### Q:18  What is the importance of SPF records in  mail servers ? ###
### 问题18： ###

Ans: SPF (Sender Policy Framework) is a system to help domain owners specify the servers which are supposed to send mail from their domain. The aim is that other mail systems can then check to make sure the server sending email from that domain is authorized to do so – reducing the chance of email 'spoofing', phishing schemes and spam!
答：

### Q:19 What is the use of Domain Keys(DKIM) in mail servers ? ###
### 问题19： ###

Ans: DomainKeys is an e-mail authentication system designed to verify the DNS domain of an e-mail sender and the message integrity. The DomainKeys specification has adopted aspects of Identified Internet Mail to create an enhanced protocol called DomainKeys Identified Mail (DKIM).
答：

### Q:20 What is the role of  Anti-Spam SMTP Proxy (ASSP) in mail server ? ###
### 问题20： ###

Ans: ASSP is a gateway server which is install in front of your MTA and implements auto-whitelists, self learning Bayesian, Greylisting, DNSBL, DNSWL, URIBL, SPF, SRS, Backscatter, Virus scanning, attachment blocking, Senderbase and multiple other filter methods 
答：

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/postfix-interview-questions-answers/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
