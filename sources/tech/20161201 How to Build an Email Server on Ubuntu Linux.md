How to Build an Email Server on Ubuntu Linux
============================================================

 ![mail server](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/mail-stack.jpg?itok=SVMfa8WZ "mail server") 
In this series, we will show how to build a reliable configurable mail server with Postfix, Dovecot, and OpenSSL on Ubuntu Linux.[Creative Commons Zero][2]Pixabay

In this fast-changing world of containers and microservices it's comforting that some things don't change, such as setting up a Linux email server. It's still a dance of many steps and knitting together several different servers, and once you put it all together it just sits there, all nice and stable, instead of winking in and out of existence like microservices. In this series, we'll put together a nice reliable configurable mail server with Postfix, Dovecot, and OpenSSL on Ubuntu Linux.

Postfix is a reliable old standby that is easier to configure and use than Sendmail, the original Unix MTA (does anyone still use Sendmail?). Exim is Debian's default MTA; it is more lightweight than Postfix and super-configurable, so we'll look at Exim in a future tutorial.

Dovecot and Courier are two popular and excellent IMAP/POP3 servers. Dovecot is more lightweight and easier to configure.

You must secure your email sessions, so we'll use OpenSSL. OpenSSL also supplies some nice tools for testing your mail server.

For simplicity, we'll set up a LAN mail server in this series. You should have LAN name services already enabled and working; see [Dnsmasq For Easy LAN Name Services][5] for some pointers. Then later, you can adapt a LAN server to an Internet-accessible server by registering your domain name and configuring your firewall accordingly. These are documented everywhere, so please do your homework and be careful.

### Terminology

Let's take a quick look at some terminology, because it is nice when we know what the heck we're talking about.

*   **MTA**: Mail transfer agent, a simple mail transfer protocol (SMTP) server such as Postfix, Exim, and Sendmail. SMTP servers talk to each other
*   **MUA**: Mail user agent, your local mail client such as Evolution, KMail, Claws Mail, or Thunderbird.
*   **POP3**: Post-office protocol, the simplest protocol for moving messages from an SMTP server to your mail client. A POP server is simple and lightweight; you can serve thousands of users from a single box.
*   **IMAP**: Interactive message access protocol. Most businesses use IMAP because messages remain on the server, so users don't have to worry about losing them. IMAP servers require a lot of memory and storage.
*   **TLS**: Transport socket layer, an evolution of SSL (secure sockets layer), which provides encrypted transport for SASL-authenticated logins.
*   **SASL**: Simple authentication and security layer, for authenticating users. SASL does the authenticating, then TLS provides the encrypted transport of the authentication data.
*   **StartTLS**: Also known as opportunistic TLS. StartTLS upgrades your plain text authentication to encrypted authentication if both servers support SSL/TLS. If one of them doesn't then it remains in cleartext. StartTLS uses the standard unencrypted ports: 25 (SMTP), 110 (POP3), and 143 (IMAP) instead of the standard encrypted ports: 465 (SMTP), 995 (POP3), and 993 (IMAP).

### Yes, We Still Have Sendmail

Most Linuxes still have `/usr/sbin/sendmail`. This is a holdover from the very olden days when Sendmail was the only MTA. On most distros `/usr/sbin/sendmail` is symlinked to your installed MTA. However your distro handles it, if it's there, it's on purpose.

### Install Postfix

`apt-get install postfix` takes care of the basic Postfix installation (Figure 1). This opens a wizard that asks what kind of server you want. Select "Internet Site", even for a LAN server. It will ask for your fully qualified server domain name (e.g., myserver.mydomain.net). On a LAN server, assuming your name services are correctly configured (I keep mentioning this because people keep getting it wrong), you can use just the hostname (e.g., myserver).

 ![Postfix](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/postfix-1.png?itok=NJLdtICb "Postfix") 

Figure 1: Postfix configuration.[Creative Commons Zero][1]Carla Schroder

Ubuntu will create a configuration file and launch three Postfix daemons: `master, qmgr`, and `pickup`. There is no Postfix command or daemon.

```
$ ps ax
 6494 ? Ss 0:00 /usr/lib/postfix/master
 6497 ? S  0:00 pickup -l -t unix -u -c
 6498 ? S  0:00 qmgr -l -t unix -u 
```

Use Postfix's built-in syntax checker to test your configuration files. If it finds no syntax errors, it reports nothing:

```
$ sudo postfix check
[sudo] password for carla: 
```

Use `netstat` to verify that Postfix is listening on port 25:

```
$ netstat -ant
tcp  0  0 0.0.0.0:25 0.0.0.0:* LISTEN
tcp6 0  0 :::25      :::*      LISTEN
```

Now let's fire up trusty old `telnet` to test:

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

Hurrah! We have verified the server name, and that Postfix is listening and responding to requests on port 25, the SMTP port.

Type `quit` to exit `telnet`. In the example, the commands that you type to interact with your server are in bold. The output are ESMTP (extended SMTP) 250 status codes.

*   PIPELINING allows multiple commands to flow without having to respond to each one.
*   SIZE tells the maximum message size that the server accepts.
*   VRFY can tell a client if a particular mailbox exists. This is often ignored as it could be a security hole.
*   ETRN is for sites with irregular Internet connectivity. Such a site can use ETRN to request mail delivery from an upstream server, and Postfix can be configured to defer mail delivery to ETRN clients.
*   STARTTLS (see above).
*   ENHANCEDSTATUSCODES, the server supports enhanced status and error codes.
*   8BITMIME, supports 8-bit MIME, which means the full ASCII character set. Once upon a time the original ASCII was 7 bits.
*   DSN, delivery status notifiction, informs you of delivery errors.

The main Postfix configuration file is `/etc/postfix/main.cf`. This is created by the installer. See [Postfix Configuration Parameters][6] for a complete listing of `main.cf` parameters. `/etc/postfix/postfix-files` describes the complete Postfix installation.

Come back next week for installing and testing Dovecot, and sending ourselves some messages.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/how-build-email-server-ubuntu-linux

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/postfix-1png
[4]:https://www.linux.com/files/images/mail-stackjpg
[5]:https://www.linux.com/learn/dnsmasq-easy-lan-name-services
[6]:http://www.postfix.org/postconf.5.html
