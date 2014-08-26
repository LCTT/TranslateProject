20 Postfix Interview Questions & Answers
================================================================================
### Q:1 What is postfix and default port used for postfix ? ###

Ans: Postfix is a open source MTA (Mail Transfer agent) which is used to route & deliver emails. Postfix is the alternate of widely used Sendmail MTA. Default port for postfix is 25.

### Q:2 What is the difference between Postfix & Sendmail ? ###

Ans:  Postfix uses a modular approach and is composed of multiple independent executables. Sendmail has a more monolithic design utilizing a single always running daemon.

### Q:3 What is MTA and it’s role in mailing system ? ###

Ans: MTA Stands for Mail Transfer Agent.MTA receives and delivers email. Determines message routing and possible address rewriting. Locally delivered  messages are handed off to an MDA for final delivery. Examples Qmail, Postfix, Sendmail

### Q:4 What is MDA ? ###

Ans: MDA stands for Mail Delivery Agent. MDA is a Program that handles final delivery of messages for a system's local recipients. MDAs can often filter or categorize messages upon delivery. An MDA might also determine that a message must be forwarded to another email address. Example Procmail

### Q:5 What is MUA ? ###

Ans: MUA stands for Mail User Agent. MUA is aEmail client software used to compose, send, and retrieve email messages. Sends messages through an MTA. Retrieves messages from a mail store either directly or through a POP/ IMAP server. Examples Outlook, Thunderbird, Evolution.

### Q:6 What is the use of  postmaster account in Mailserver ? ###

Ans: An email administrator is commonly referred to as a postmaster. An individual with postmaster responsibilities makes sure that the mail system is working correctly, makes configuration changes, and adds/removes email accounts, among other things. You must have a postmaster alias at all domains for which you handle email that directs messages to the correct person or persons .

### Q:7 What are the important daemons in postfix ? ###

Ans : Below are the lists of impportant daemons in postfix mail server :

- **master** :The master daemon is the brain of the Postfix mail system. It spawns all other daemons.
- **smtpd**: The smtpd daemon (server) handles incoming connections.
- **smtp** :The smtp client handles outgoing connections.
- **qmgr** :The qmgr-Daemon is the heart of the Postfix mail system. It processes and controls all messages in the mail queues.
- **local** : The local program is Postfix’ own local delivery agent. It stores messages in mailboxes.

### Q:8 What are the configuration files of postfix server ? ###

Ans: There are two main Configuration files of postfix :

- **/etc/postfix/main.cf** : This file holds global configuration options. They will be applied to all instances of a daemon, unless they are overridden in master.cf
- **/etc/postfix/master.cf**  : This file defines runtime environment for daemons attached to services. Runtime behavior defined in main.cf may be overridden by setting service specific options.

### Q:9 How to restart the postfix service & make it enable across reboot ? ###

Ans: Use this command to restart service “ Service postfix restart” and to make the service persist across the reboot, use the command “ chkconfig postfix on”

### Q:10 How to check the mail's queue in postfix ? ###

Ans: Postfix maintains two queues, the pending mails queue, and the deferred mail queue,the deferred mail queue has the mail that has soft-fail and should be retried (Temporary failure), Postfix retries the deferred queue on set intervals (configurable, and by default 5 minutes)

To display the list of queued mails :

    # postqueue -p

To Save the output of above command :

    # postqueue -p > /mnt/queue-backup.txt

Tell Postfix to process the Queue now

    # postqueue -f

### Q:11 How  to delete mails from the queue in postfix ? ###

Ans:  Use below command to delete all queued mails

    # postsuper -d ALL

To delete only deferred mails from queue , use below command

    # postsuper -d ALL deferred

### Q:12 How to check postfix configuration from the command line ? ###

Ans: Using the command 'postconf -n'  we can see current configuration of postfix excluding the lines which are commented.

### Q:13 Which command is used to see live mail logs in postfix ? ###

Ans: Use the command  'tail -f /var/log/maillog' or 'tailf /var/log/maillog'

### Q:14 How to send a test mail from command line ? ###

Ans: Use the below command to send a test mail from postfix itself :

# echo "Test mail from postfix" | mail -s "Plz ignore" info@something.com

### Q:15  What is an Open mail relay ? ###

Ans: An open mail relay is an SMTP server configured in such a way that it allows anyone on the Internet to send e-mail through it, not just mail destined to or originating from known users.This used to be the default configuration in many mail servers; indeed, it was the way the Internet was initially set up, but open mail relays have become unpopular because of their exploitation by spammers and worms.

### Q:16 What is relay host in postfix ? ###

Ans: Relay host is the smtp address , if mentioned in postfix config file , then all the incoming mails be relayed through smtp server.

### Q:17 What is Greylisting ? ###

Ans: Greylisting is a method of defending e-mail users against spam. A mail transfer agent (MTA) using greylisting will "temporarily reject" any email from a sender it does not recognize. If the mail is legitimate the originating server will, after a delay, try again and, if sufficient time has elapsed, the email will be accepted.

### Q:18  What is the importance of SPF records in  mail servers ? ###

Ans: SPF (Sender Policy Framework) is a system to help domain owners specify the servers which are supposed to send mail from their domain. The aim is that other mail systems can then check to make sure the server sending email from that domain is authorized to do so – reducing the chance of email 'spoofing', phishing schemes and spam!

### Q:19 What is the use of Domain Keys(DKIM) in mail servers ? ###

Ans: DomainKeys is an e-mail authentication system designed to verify the DNS domain of an e-mail sender and the message integrity. The DomainKeys specification has adopted aspects of Identified Internet Mail to create an enhanced protocol called DomainKeys Identified Mail (DKIM).

### Q:20 What is the role of  Anti-Spam SMTP Proxy (ASSP) in mail server ? ###

Ans: ASSP is a gateway server which is install in front of your MTA and implements auto-whitelists, self learning Bayesian, Greylisting, DNSBL, DNSWL, URIBL, SPF, SRS, Backscatter, Virus scanning, attachment blocking, Senderbase and multiple other filter methods 

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/postfix-interview-questions-answers/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/